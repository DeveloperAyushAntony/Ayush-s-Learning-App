import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:awoke_learning_app/core/services/agora_service.dart';
import 'package:awoke_learning_app/features/agora/domain/usecases/agora_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraProvider extends ChangeNotifier {
  final AgoraService agoraService;
  final GenerateAgoraTokenUseCase generateTokenUseCase;

  RtcEngine? _agoraEngine;
  String? _token;
  final int _uid = DateTime.now().millisecondsSinceEpoch % 10000;
  bool isJoined = false;
  int? _remoteUid;

  AgoraProvider( this.agoraService, this.generateTokenUseCase);

  RtcEngine? get agoraEngine => _agoraEngine;
  int get uid => _uid;
  int? get remoteUid => _remoteUid;

  /// 🚀 **Initialize Agora Engine**
  Future<void> initializeAgora() async {
    if (_agoraEngine != null) return;

    debugPrint("🔄 Initializing Agora Engine...");

    final appId = dotenv.env['AGORA_APP_ID'];
    if (appId == null || appId.isEmpty) {
      debugPrint("❌ Agora App ID is missing!");
      return;
    }

    _agoraEngine = createAgoraRtcEngine();
    await _agoraEngine!.initialize(RtcEngineContext(appId: appId));

    await _agoraEngine!.enableVideo();
    await _agoraEngine!.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);

    await _agoraEngine!.setVideoEncoderConfiguration(
      const VideoEncoderConfiguration(
        dimensions: VideoDimensions(width: 1280, height: 720),
        frameRate: 30,
        orientationMode: OrientationMode.orientationModeAdaptive,
      ),
    );

    // ✅ Start Preview BEFORE joining channel
    await _agoraEngine!.startPreview();

    _agoraEngine!.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (RtcConnection connection, int uid) {
        debugPrint("✅ Joined channel: ${connection.channelId}, UID: $uid");
        isJoined = true;
        notifyListeners();
      },
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        debugPrint("👤 Remote user joined: $remoteUid");
        _remoteUid = remoteUid;
        notifyListeners();
      },
      onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
        debugPrint("🚪 Remote user left: $remoteUid");
        _remoteUid = null;
        notifyListeners();
      },
      onError: (ErrorCodeType error, String message) {
        debugPrint("❌ Agora Error: $error - $message");
      },
    ));
  }

  /// 🚀 **Join Agora Channel**
  Future<void> joinChannel(String channelName, String role) async {
    await _requestPermissions();
    await initializeAgora();

    debugPrint("🔄 Fetching Agora token for channel: $channelName");

    // Fetch Agora Token from the Use Case
    _token = await generateTokenUseCase.call(channelName, _uid, role);

    await _agoraEngine!.setClientRole(role: 
      role == "publisher"
          ? ClientRoleType.clientRoleBroadcaster
          : ClientRoleType.clientRoleAudience,
    );

    await _agoraEngine!.joinChannel(
      token: _token ?? "",
      channelId: channelName,
      uid: _uid,
      options: const ChannelMediaOptions(),
    );

    debugPrint("✅ Successfully joined channel as $role");
    isJoined = true;
    notifyListeners();
  }

  /// 🚪 **Leave Agora Channel**
  Future<void> leaveChannel() async {
    await _agoraEngine?.leaveChannel();
    debugPrint("🚪 Left Agora Channel");
    isJoined = false;
    _remoteUid = null;
    notifyListeners();
  }

  /// 📸 **Request Camera & Mic Permissions**
  Future<void> _requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    if (statuses[Permission.camera]!.isDenied || statuses[Permission.microphone]!.isDenied) {
      debugPrint("❌ Camera & Microphone permissions are required.");
      return;
    }
  }

  @override
  void dispose() {
    _agoraEngine?.release();
    super.dispose();
  }
}
