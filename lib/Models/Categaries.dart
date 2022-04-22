import 'package:flutter/material.dart';

class Categaries {
  final String id;
  final String title;
  final Color rang;
  final String imageUrl;

  const Categaries(
      {@required this.id,
      @required this.title,
      this.rang = Colors.orange,
      @required this.imageUrl});
}
