import 'package:flutter/material.dart';
import 'package:vexana_inspector/src/presentation/theme/product_theme.dart';

/// Basic theme for the app
/// This class is a concrete implementation of the [ProductTheme] class
/// [backgroud] is black45
/// [searchBackgroud] is black
/// [searchTextColor] is white
/// [cardBackgroud] is black
/// [cardTextColor] is white

@immutable
final class BasicProductTheme implements ProductTheme {
  const BasicProductTheme();
  @override
  Color get backgroud => Colors.white10;

  @override
  Color get cardBackgroud => Colors.red;

  @override
  Color get cardTextColor => Colors.white;

  @override
  Color get searchBackgroud => Colors.black;

  @override
  Color get searchTextColor => Colors.white;
}
