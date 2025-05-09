import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AgoraService {
  Future<RtcEngine> initializeEngine() async {
    final appId = dotenv.env['AGORA_APP_ID'];
    if (appId == null || appId.isEmpty) {
      throw Exception("❌ Agora App ID is missing!");
    }

    final agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize(RtcEngineContext(appId: appId));

    await agoraEngine.enableVideo();
    await agoraEngine.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);

    return agoraEngine;
  }

  Future<void> joinChannel(RtcEngine agoraEngine, String token, String channelName, int uid) async {
    await agoraEngine.joinChannel(
      token: token,
      channelId: channelName,
      uid: uid,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> leaveChannel(RtcEngine agoraEngine) async {
    await agoraEngine.leaveChannel();
  }
}
