import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';
import 'package:tasky/core/shared_widgets/custom_btn.dart';
import 'package:tasky/core/shared_widgets/custom_text_field.dart';
import 'package:tasky/core/shared_widgets/info_and_text_btn.dart';
import 'package:tasky/features/auth/signup/signup_screen.dart';
import 'package:tasky/features/home/home_screen.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: AppPadding.p24.h),
            child: Text(AppStrings.login,
            //textAlign: TextAlign.left,
            style: getBoldStyle(color: ColorManager.black,fontSize:FontSize.s24 ),
            ),
          ),
          const CustomTextField(hint: AppStrings.phoneExample,isPhoneNumber: true,),
          SizedBox(
            height:AppSize.s8.h ,
          ),
          const CustomTextField(hint: AppStrings.password,isPassword: true,),
          SizedBox(
            height:AppSize.s24.h ,
          ),
           CustomBtn(title: AppStrings.loginBtn,onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return const HomeScreen();
            }));
          },),
          SizedBox(
            height:AppSize.s24.h ,
          ),
          InfoAndTextBtn(message: AppStrings.doNotHaveAccount,actionText: AppStrings.signupBtn, onTap: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
               return const SignupScreen();
             }));
          },)

        ],
      ),
    );
  }
}
