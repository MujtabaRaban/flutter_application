import 'package:flutter/material.dart';

class Event {
  final String imagePath;
  final String title;
  final String time;
  final String topRightText;
  final Color topRightTextColor;
  final double borderRadius;

  Event(this.imagePath, this.title, this.time, this.topRightText,
      this.topRightTextColor, this.borderRadius);
}
