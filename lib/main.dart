import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasky/core/services/token_storage_service.dart';
import 'package:tasky/features/home/home_screen.dart';
import 'package:tasky/features/on_boarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthInitializer(), // تحديد شاشة البداية بناءً على التوكن
      ),
    );
  }
}

class AuthInitializer extends StatelessWidget {
  const AuthInitializer({super.key});

  Future<bool> _isLoggedIn() async {
    final accessToken = await TokenStorage.getAccessToken();

    if(accessToken!=null){
      return true ;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        // أثناء التحميل
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // في حالة الخطأ أو الانتهاء
        if (snapshot.hasError || !snapshot.hasData || snapshot.data == false) {
          return const OnBoardingScreen(); // الانتقال إلى شاشة البداية
        }

        return const HomeScreen(); // الانتقال إلى شاشة الهوم
      },
    );
  }
}
