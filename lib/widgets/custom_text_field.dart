import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../themes/custom_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final String prefixIconPath;
  final bool obscureText;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  final Color fillColor;
  final FieldValidator validator;
  final String inputType;
  final double height;
  final VoidCallback tap;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIconPath = '',
    this.obscureText = false,
    this.onChange,
    this.controller,
    required this.validator,
    this.inputType = 'text',
    this.fillColor = CustomColors.BACKGROUND,
    this.height = 28.0,
    required this.tap,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.5),
          //   spreadRadius: 1,
          //   blurRadius: 7,
          //   offset: const Offset(0, 3),
          // ),
        ],
      ),
      child: TextFormField(
        onTap: widget.tap,
        keyboardType: widget.inputType == 'text'
            ? TextInputType.text
            : TextInputType.number,
        validator: widget.validator,
        obscureText: widget.obscureText,
        onChanged: widget.onChange,
        controller: widget.controller,
        maxLines: null,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIconPath.isNotEmpty
              ? Image.asset(widget.prefixIconPath)
              : const Text(''),
          counterText: "",
          labelText: widget.hintText,
          isDense: true,
          helperMaxLines: 5,
          contentPadding: EdgeInsets.fromLTRB(0, widget.height, 0, 20),
          // errorStyle: const TextStyle(fontSize: 0.028),
          labelStyle: Theme.of(context).textTheme.subtitle1,
          filled: true,
          fillColor: widget.fillColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
                color: CustomColors.SECONDARY.withOpacity(0.2), width: 1.0),
          ),

          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: CustomColors.SECONDARY, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: CustomColors.PRIMARY, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.ERROR, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.ERROR, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
