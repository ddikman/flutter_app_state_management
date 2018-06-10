import 'package:flutter/material.dart';
import 'package:flutter_app_inherited_state/factor.dart';

import 'package:flutter_app_inherited_state/state_container.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;

    final factors = List.generate(4, (index) {
      final double factor = (index + 1) * 1.0;

      // since the state is accessible in the factor, I don't need to propagate
      // this state down to the child widget
      return Factor(factor);
    }).toList();

    final sharedStateWidgets =
        Expanded(child: GridView.count(crossAxisCount: 2, children: factors));

    final explanationCard = Card(
      color: primaryColor,
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'In this app a common state object, the `value` is shared between four widgets and the value is displayed and can be edited using a factor. It attempts to show different solutions of the inheritence of state.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            explanationCard,
            sharedStateWidgets,
          ],
        ));
  }
}
