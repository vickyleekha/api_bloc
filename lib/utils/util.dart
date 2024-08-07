import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildLoading() => const Center(
    heightFactor: 50,
    widthFactor: 50,
    child: CircularProgressIndicator(
      color: Colors.amberAccent,
    ));

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white);
}
