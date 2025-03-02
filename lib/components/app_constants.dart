import 'package:flutter/material.dart';

final kinputDecorationTextField = InputDecoration(
  hintText: 'Search note',
  suffixIcon: const Icon(Icons.search),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: const Color(0xFF2B2930),
);
