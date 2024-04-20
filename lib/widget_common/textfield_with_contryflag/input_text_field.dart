import 'package:emart_project/widget_common/textfield_with_contryflag/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    this.fieldKey,
    this.onChanged,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.prefixIconConstraints,
    this.textInputAction,
    this.prefixIcon,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.contentPadding,
    this.keyboardType,
    this.fillColor,
    this.suffixIcon,
    this.onTap,
    this.enabled,
    this.hintStyle,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? readOnly;
  final bool? enabled;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final ValueChanged<String?>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      hintStyle: hintStyle,
      keyboardType: keyboardType ?? TextInputType.phone,
      suffixIcon: suffixIcon,
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      controller: controller,
      style: style,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      labelText: labelText,
      prefixIcon: prefixIcon,
      enabled: enabled,
      prefixIconConstraints: prefixIconConstraints,
      textInputAction: textInputAction ?? TextInputAction.done,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      inputFormatters: inputFormatters ??
          <TextInputFormatter>[
            FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))
          ],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.obscureText,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.cursorHeight,
    this.enabled,
    this.readOnly,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.filledColor,
    this.hintStyle,
    this.style,
    this.focusBorder,
    this.border,
    this.enabledBorder,
    this.cursorColor,
    this.contentPadding,
    this.autofocus,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.words,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final bool? obscureText;
  final double? cursorHeight;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final Color? filledColor;
  final Color? cursorColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final BorderSide? focusBorder;
  final BorderSide? border;
  final BorderSide? enabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      hintText: hintText,
      style: style,
      obscureText: obscureText,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      labelText: labelText,
      inputFormatters: inputFormatters,
      hintStyle: hintStyle,
      controller: controller,
      cursorColor: cursorColor ?? Colors.white,
      keyboardType: keyboardType,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      cursorHeight: cursorHeight,
      onTap: onTap,
      enabled: enabled,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      contentPadding: contentPadding,
      filledColor: filledColor,
      border: border,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: suffixIconConstraints,
      focusBorder: focusBorder,
      enabledBorder: enabledBorder,
    );
  }
}
