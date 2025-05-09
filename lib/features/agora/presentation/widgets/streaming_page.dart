import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awoke_learning_app/features/agora/presentation/providers/agora_provider.dart';

class StreamingPage extends StatefulWidget {
  final String channelName;
  final String role;

  const StreamingPage(
      {super.key, required this.channelName, required this.role});

  @override
  State<StreamingPage> createState() => _StreamingPageState();
}

class _StreamingPageState extends State<StreamingPage> {
  int? _remoteUid;
  bool _isJoined = false;

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    final provider = Provider.of<AgoraProvider>(context, listen: false);
    await provider.joinChannel(widget.channelName, widget.role);

    provider.agoraEngine?.registerEventHandler(
      RtcEngineEventHandler(
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          setState(() => _remoteUid = remoteUid);
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          setState(() => _remoteUid = null);
        },
        onJoinChannelSuccess: (RtcConnection connection, int uid) {
          setState(() => _isJoined = true);
        },
      ),
    );
  }

  Widget _renderLocalPreview() {
    final provider = Provider.of<AgoraProvider>(context, listen: false);
    if (_isJoined) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: provider.agoraEngine!,
          canvas: const VideoCanvas(uid: 0),
        ),
      );
    } else {
      return const Center(child: Text("Joining Channel..."));
    }
  }

  Widget _renderRemoteVideo() {
    final provider = Provider.of<AgoraProvider>(context, listen: false);
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: provider.agoraEngine!,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      );
    } else {
      return const Center(child: Text("Waiting for remote user..."));
    }
  }

  Future<void> _leaveChannel() async {
    final provider = Provider.of<AgoraProvider>(context, listen: false);
    await provider.leaveChannel();
    if (mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    final provider = Provider.of<AgoraProvider>(context, listen: false);
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Live Class: ${widget.channelName}")),
      body: Stack(
        children: [
          Positioned.fill(child: _renderRemoteVideo()),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 120,
              height: 160,
              child: _renderLocalPreview(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: _leaveChannel,
              child: const Text("🚪 Leave Class"),
            ),
          ),
        ],
      ),
    );
  }
}
