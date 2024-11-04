import 'package:flutter/material.dart';

class Decorations {
  static BoxDecoration get dashboardBoxDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffddd7d7), width: 0.93),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3fc3bcbc),
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
        color: Colors.white,
      );
}

ShapeDecoration mainContainerDecor() {
  return ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    shadows: const [
      BoxShadow(
        color: Color(0xBCD3D8F5),
        blurRadius: 3,
        offset: Offset(0, 1),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x1ED3D8F5),
        blurRadius: 2,
        offset: Offset(0, 1),
        spreadRadius: 0,
      )
    ],
  );
}

TextStyle mainHeadingTextStyle() {
  return const TextStyle(
    color: Color(0xFF334155),
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}

TextStyle cardTextStyle() {
  return const TextStyle(
    color: Color(0xFF334155),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

TextStyle dialogSubtitleTextStyle() {
  return const TextStyle(
    color: Color(0xFF64748B),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle dialogTitleTextStyle() {
  return const TextStyle(
    color: Color(0xFF334155),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}