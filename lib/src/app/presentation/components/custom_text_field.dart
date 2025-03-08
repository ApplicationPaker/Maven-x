import 'package:flutter/material.dart';

import '../theme/color_theme.dart';
import '../utils/consts.dart';

typedef OnChange = void Function(String)? ;

class CustomTextField extends StatelessWidget {
  final TextEditingController controller ;
  final OnChange onChange ;
  final Color? fillColor ;
  final Widget? suffixIcon ;
  final String? hint ;
  final Widget? prefixIcon ;
  final bool? isPrefixNull ;
  final int maxLines ;
  final bool? isReadyOnly ;
  final VoidCallback? onTap ;

  const CustomTextField({Key? key, required this.controller, this.onChange, this.fillColor, this.suffixIcon, this.hint, this.prefixIcon, this.isPrefixNull, this.maxLines = 1, this.isReadyOnly, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      readOnly: isReadyOnly == true,
      style: const TextStyle(color: kQuarterColor, fontSize: 17),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? kTertiaryColor,
        prefixIcon: isPrefixNull == true ? null : prefixIcon ??
        const Icon(Icons.search, color: kQuarterColor),
        suffixIcon: suffixIcon,
        hintText: hint ?? "Search",
        hintStyle:
        const TextStyle(color: kQuarterColor, fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadius),
            borderSide: const BorderSide(color: kTertiaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadius),
            borderSide: const BorderSide(color: kTertiaryColor)),
        contentPadding: const EdgeInsets.all(kPadding / 2),
      ),
      onChanged: onChange
    ) ;
  }
}
