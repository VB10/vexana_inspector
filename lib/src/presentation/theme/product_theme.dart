import 'package:flutter/material.dart';

/// General theme for the app
abstract class ProductTheme {
  /// Color items for inspector
  ProductTheme({
    required this.backgroud,
    required this.searchBackgroud,
    required this.searchTextColor,
    required this.cardBackgroud,
    required this.cardTextColor,
  });

  /// The background color of the app
  final Color backgroud;

  /// The background color of the search bar
  final Color searchBackgroud;

  /// The text color of the search bar
  final Color searchTextColor;

  /// The background color of the card
  final Color cardBackgroud;

  /// The text color of the card
  final Color cardTextColor;
}
