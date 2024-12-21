import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/services/api_services.dart';
import 'package:tasky/core/shared_widgets/image_section.dart';
import 'package:tasky/features/auth/data/repos/auth_repo_imp.dart';
import 'package:tasky/features/auth/login/login_cubit/login_cubit.dart';
import 'package:tasky/features/auth/login/widgets/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(AuthRepoImp( ApiService(Dio()))),
      child: const Scaffold(
       body: SafeArea(child: SingleChildScrollView(
         child: Column(
           children: [
             ImageSection(),
             LoginSection(),
           ],
         ),
       )),
      ),
    );
  }
}
