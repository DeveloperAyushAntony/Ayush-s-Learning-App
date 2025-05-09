import 'package:awoke_learning_app/features/agora/domain/repositories/agora_repo.dart';

class GenerateAgoraTokenUseCase {
  final AgoraRepository repository;

  GenerateAgoraTokenUseCase(this.repository);

  Future<String> call(String channelName, int uid, String role) {
    return repository.getAgoraToken(channelName, uid, role);
  }
}
