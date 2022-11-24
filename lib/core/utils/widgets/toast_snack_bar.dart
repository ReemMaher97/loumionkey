import 'package:flutter/material.dart';

import '../utils.export.dart';

class ShowToastSnackBar {

  static void showSnackBars(BuildContext context,
      {required String? message,
        bool isError = false,
        bool isSuccess = false,
        Duration? duration,
        SnackBarAction? snackBarAction}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: const TextStyle(fontFamily: FontsHelper.cairo),
      ),
      duration: duration ?? const Duration(seconds: 3),
      action: snackBarAction,
      backgroundColor: isError
          ? Colors.red[800]
          : isSuccess
          ? Colors.green[800]
          : null,
    ));
  }
}