import 'package:flutter/material.dart';

class RoundedBorderButton extends StatelessWidget {
  final String? text;
  final Color? tColor, bColor;
  final Function()? onTap;
  final double? height, width, borderRadius;

  const RoundedBorderButton({
    Key? key,
    required this.text,
    this.tColor,
    this.bColor,
    this.height,
    this.width,
    this.borderRadius,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 60,
        width: width ?? MediaQuery.of(context).size.width * .5,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: bColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
        ),
        child: Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.w200).copyWith(
            color: tColor,
          ),
        ),
      ),
    );
  }
}
