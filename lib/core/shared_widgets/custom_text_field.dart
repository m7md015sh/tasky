import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isDropdown;
  final TextEditingController? controller;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isDropdown = false,
    this.controller,
    this.dropdownItems,
    this.onDropdownChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSecure = true;
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    // Dropdown logic
    if (widget.isDropdown && widget.dropdownItems != null) {
      return DropdownButtonFormField<String>(
        items: widget.dropdownItems!
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: getRegularStyle(
                color: ColorManager.black, fontSize: FontSize.s14.sp),
          ),
        ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedItem = value;
          });
          if (widget.onDropdownChanged != null) {
            widget.onDropdownChanged!(value);
          }
        },
        value: _selectedItem,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: getRegularStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    // Phone number logic
    if (widget.isPhoneNumber) {
      return IntlPhoneField(
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: getRegularStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),
        ),
        initialCountryCode: 'EG',
        onChanged: (phone) {
          debugPrint(phone.completeNumber);
        },
      );
    }

    // Password or normal text logic
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isSecure : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: getRegularStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14.sp),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(_isSecure
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed: () {
            setState(() {
              _isSecure = !_isSecure;
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
