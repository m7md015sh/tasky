import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:tasky/core/resources/color_manager.dart';
import 'package:tasky/core/resources/font_manager.dart';
import 'package:tasky/core/resources/strings_manager.dart';
import 'package:tasky/core/resources/styles_manager.dart';
import 'package:tasky/core/resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isDropdown;
  final TextEditingController? controller;
  final List<String>? dropdownItems;
  final ValueChanged<String?>? onDropdownChanged;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final void Function(String?)? onSaved;
  final void Function(PhoneNumber?)? onSavedPhone;
  const CustomTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.isDropdown = false,
    this.controller,
    this.dropdownItems,
    this.onDropdownChanged, this.maxLines=1, this.validator,  this.textEditingController, this.onSaved, this.onSavedPhone,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isSecure = true;
 late String _selectedItem;

  @override
  Widget build(BuildContext context) {
    // Dropdown logic
    if (widget.isDropdown && widget.dropdownItems != null) {
      return DropdownButtonFormField<String>(
        value: _selectedItem,
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
          if (widget.onDropdownChanged != null) {
            widget.onDropdownChanged!(_selectedItem);
            setState(() {
            });
          }

          if (widget.onDropdownChanged != null) {
            widget.onDropdownChanged!(value);
          }
        },
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
        onSaved: widget.onSavedPhone,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: getRegularStyle(
              color: ColorManager.lightGrey, fontSize: FontSize.s14.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r12),
            borderSide: const BorderSide(),
          ),
        ),
        initialCountryCode: AppStrings.initialCountryCode,
        onChanged: (phone) {
          debugPrint(phone.completeNumber);
        },
      );
    }

    // Password or normal text logic
    return TextFormField(
      onSaved:widget.onSaved ,
      validator: widget.validator ,
      controller: widget.controller,
      maxLines: widget.maxLines,

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

  @override
  void initState() {
    super.initState();
    if (widget.isDropdown && widget.dropdownItems != null && widget.dropdownItems!.isNotEmpty) {
      _selectedItem = widget.dropdownItems!.first; // القيمة الابتدائية تكون أول عنصر
    }
  }

}