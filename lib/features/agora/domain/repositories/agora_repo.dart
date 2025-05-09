abstract class AgoraRepository {
  Future<String> getAgoraToken(String channelName, int uid, String role);
}
