import 'package:flutter/material.dart';
import 'package:mavenx/src/app/presentation/theme/color_theme.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({
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
    this.preffixIcon ,
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
  final Widget? preffixIcon;
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
        //  enabledBorder: const OutlineInputBorder(
        //    borderSide: BorderSide(color: kGreyMidColor)
        //  ),
        //  focusedBorder: const OutlineInputBorder(
        //    borderSide: BorderSide(color: kGreyMidColor)

        //  ),
        //  focusedErrorBorder: const OutlineInputBorder(
        //    borderSide: BorderSide(color: kRedColor)
        //  ),
        //   errorBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: kRedColor)
        //   ),
        hintText: hintText,
        prefixIcon: preffixIcon,
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
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: kLightGreyColor),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
