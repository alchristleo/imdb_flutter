import 'package:flutter/material.dart';

class MyNavigator {
    static void homeRoute(BuildContext context) {
        Navigator.pushNamed(context, "/home");
    }
}
