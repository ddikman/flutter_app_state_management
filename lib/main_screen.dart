import 'package:flutter/material.dart';
import 'package:flutter_app_inherited_state/factor.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // the base value is kept in the main widget state and propagated to children on build
  double value = 1.0;

  // the state is also updated in the main widget using a callback
  void _recalculateFactors(double factor, String value) {
    setState(() {
      this.value = double.parse(value) / factor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final factors = List.generate(4, (index) {
      final double factor = (index + 1) * 1.0;

      // the callback and value is propagated to the child widgets as parameters
      // this has issues with input since fields are being rebuilt but can also get
      // complicated when widget tree grows in more complex scenarios
      return Factor(value * factor, factor,
          (newValue) => _recalculateFactors(factor, newValue));
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
