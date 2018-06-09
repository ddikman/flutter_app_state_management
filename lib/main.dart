import 'package:flutter/material.dart';
import 'package:flutter_app_inherited_state/main_screen.dart';

void main() => runApp(new AppRoot());

class AppRoot extends StatelessWidget {
  static const Color fontColor = Colors.white;

  static const Color primaryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // initialise app and state
    return new MaterialApp(
        title: 'Inherited state demo',
        theme: new ThemeData(
            primarySwatch: primaryColor,
            // the hintColor is used for the TextField input border color
            hintColor: fontColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: fontColor)),
        home: new MainScreen(title: 'Inherited state demo'));
  }
}
