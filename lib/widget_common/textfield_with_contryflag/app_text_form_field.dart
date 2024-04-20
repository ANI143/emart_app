import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool? readOnly,
  final bool autofocus = false,
  final bool? obscureText,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? focusBorder,
  final BorderSide? enabledBorder,
  final BorderSide? border,
  final double? cursorHeight,
  final BoxConstraints? prefixIconConstraints,
  final BoxConstraints? suffixIconConstraints,
  final EdgeInsetsGeometry? contentPadding,
  final Function()? onEditingComplete,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines ?? 1,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText ?? false,
    enabled: enabled,
    enableInteractiveSelection: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: cursorColor ?? Colors.black,
    cursorHeight: cursorHeight,
    style: style ??
        const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ).copyWith(color: Colors.black),
    readOnly: readOnly ?? false,
    onEditingComplete: onEditingComplete,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      isDense: true,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      errorMaxLines: 5,
      fillColor: filledColor ?? Color(0xffFFFFFF),
      filled: true,
      hintText: hintText,
      hintStyle: hintStyle ??
          const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ).copyWith(
            color: Colors.black,
          ),
      counterText: '',
      suffixIcon: suffixIcon,
      labelText: labelText,
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ).copyWith(
        color: Colors.black.withOpacity(.8),
      ),
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ).copyWith(
        color: Colors.black,
      ),
      helperText: helperText,
    ),
  );
}
