import 'package:flutter/material.dart';
import 'package:tasky/core/shared_widgets/image_section.dart';
import 'package:tasky/features/auth/login/widgets/login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: SafeArea(child: SingleChildScrollView(
       child: Column(
         children: [
           ImageSection(),
           LoginSection(),
         ],
       ),
     )),
    );
  }
}
