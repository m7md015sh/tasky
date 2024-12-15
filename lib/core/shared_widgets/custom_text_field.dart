import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final bool isPhoneNumber;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    // إذا كان الإدخال رقم تليفون
    if (widget.isPhoneNumber) {
      return IntlPhoneField(
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),
        ),
        initialCountryCode: 'EG', // تعيين الكود الافتراضي إلى مصر
        onChanged: (phone) {
          debugPrint(phone.completeNumber);
        },
      );
    }

    // إذا كان الإدخال نص عادي أو باسورد
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isSecure : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(_isSecure
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            setState(() {
              _isSecure = !_isSecure; // تغيير حالة الإخفاء/الإظهار
            });
          },
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
