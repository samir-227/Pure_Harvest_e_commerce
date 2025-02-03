import 'package:flutter/material.dart';

class PageViewItemModel {
  final String image, backgroundImage, subtitle;
  final Widget title;

  const PageViewItemModel({
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
  });
}
