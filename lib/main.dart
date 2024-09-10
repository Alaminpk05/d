// lib/main.dart

import 'package:auth_api_integrate/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/data/data_sources/remote_data_source.dart';

import 'auth/presentation/bloc/auth_bloc.dart';
import 'auth/presentation/pages/login_page.dart';


void main() {
  final authRepository = AuthRepository(remoteDataSource: RemoteDataSource());

  runApp(
    MyApp(authRepository: authRepository),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      home: BlocProvider(
        create: (_) => AuthBloc(authRepository: authRepository),
        child: LoginPage(),
      ),
    );
  }
}
