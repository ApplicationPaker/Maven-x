import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';
import 'package:mavenx/src/app/presentation/utils/consts.dart';

class ColoredTextField extends StatelessWidget {
  const ColoredTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.suffixIcon = const SizedBox(),
    this.maxLength,
    this.maxLine,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool autofocus;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final Widget suffixIcon;
  final int? maxLength;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      obscureText: obscureText,
      autofillHints: autofillHints,
      maxLength: maxLength,
      maxLines: maxLine,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: ktextfieldColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadius),
            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.all(kPadding),

        hintText: hintText,
        suffixIcon: suffixIcon,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: kLightGreyColor, fontSize: 14),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: kLightGreyColor, fontSize: 14),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
