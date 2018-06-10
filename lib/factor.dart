import 'package:flutter/material.dart';

// simple stateless widget that receives state from parent widget instead
class Factor extends StatelessWidget {

  final TextEditingController textEditingController = new TextEditingController();

  final ValueChanged<String> _onChanged;

  final double factor;

  final double value;

  Factor(this.value, this.factor, this._onChanged);

  @override
  Widget build(BuildContext context) {

    final cardColor = Theme.of(context).primaryColor;
    final fontColor = Theme.of(context).textTheme.body1.color;

    textEditingController.text = value.toString();

    return Card(
      color: cardColor,
      child: new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                textAlign: TextAlign.center,
                onSubmitted: _onChanged,
                keyboardType: TextInputType.number,
                controller: textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: 'update value',
                    labelStyle: Theme.of(context).textTheme.caption.apply(
                        color: fontColor
                    )
                ),
              ),
            ),
            new Expanded(child: new Center(child: Text("factor $factor", style: TextStyle(fontSize: 18.0),)))
          ],
        ),
      ),
    );
  }

}