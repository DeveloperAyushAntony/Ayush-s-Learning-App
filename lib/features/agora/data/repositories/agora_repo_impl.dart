import 'package:awoke_learning_app/features/agora/data/datasources/agoradatasource.dart';
import 'package:awoke_learning_app/features/agora/data/models/agora_model.dart';
import 'package:awoke_learning_app/features/agora/domain/repositories/agora_repo.dart';

class AgoraRepositoryImpl implements AgoraRepository {
  final AgoraRemoteDataSource remoteDataSource;

  AgoraRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> getAgoraToken(String channelName, int uid, String role) async {
    final AgoraModel agoraModel = await remoteDataSource.fetchAgoraToken(channelName, uid, role);
    return agoraModel.token;
  }
}
