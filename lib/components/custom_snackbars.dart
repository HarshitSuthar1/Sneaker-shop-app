import 'package:flutter/material.dart';

class CustomSnackbars {
  CustomSnackbars._();
  static SnackBar successSnackBar() {
    return SnackBar(
      content: const Text('Added to bag!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  }

  static SnackBar failedSnackBar() {
    return SnackBar(
      content: const Text('Already in bag!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  }
}
