import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luminouskeytask/core/utils/helper/color_helper.dart';


Widget getCenterCircularProgress(
    {double? padding, double? size, Color? color, double radius = 12 , }) {
  return Container(
    padding: EdgeInsets.all(padding ?? 0.0),
    height: size ,
    width: size ,
    child: Center(
      child: CupertinoActivityIndicator(radius: radius,),
    ),
  );
}
Future<dynamic> openNewPage(BuildContext context, Widget widget,
    {bool popPreviousPages = false}) {
  return Future<dynamic>.delayed(Duration.zero, () {
    if (!popPreviousPages) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => widget,
          settings: RouteSettings(arguments: widget),
        ),
      );
    } else {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => widget,
              settings: RouteSettings(
                arguments: widget,
              )),
              (Route<dynamic> route) => false);
    }
  });
}

double getScreenWidth(BuildContext context, {bool realWidth = false}) {
  if (realWidth) {
    return MediaQuery.of(context).size.width;
  } //to preview widget like phone scale in preview

  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.height / 4;
  }

  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}

double getScreenHeight(BuildContext context, {bool realHeight = false}) {
  if (realHeight) {
    return MediaQuery.of(context).size.height;
  } //to preview widget like phone scale in preview
  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height / 1.4
        : MediaQuery.of(context).size.width / 1.4;
  }
  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}



class ProgressCircleDialog {
  static bool _isShow = false;
  static show(
      BuildContext context,
      ) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator(color: ColorHelper.primaryColor,strokeWidth: 1.0,)),
        barrierDismissible: false);
    _isShow = true;
  }

  static dismiss(BuildContext context) {
    if (_isShow) {
      Navigator.pop(context);
      _isShow = false;
    }
  }
}

void printFullText(String text){

  final pattern = RegExp('.{1800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


