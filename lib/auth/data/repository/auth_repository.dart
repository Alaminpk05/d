// lib/auth/data/repositories/auth_repository.dart

import '../models/user_model.dart';
import '../data_sources/remote_data_source.dart';

class AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<UserModel> login(String username, String password) async {
    return await remoteDataSource.login(username, password);
  }

  Future<UserModel> register(String username, String email, String password) async {
    return await remoteDataSource.register(username, email, password);
  }
}
