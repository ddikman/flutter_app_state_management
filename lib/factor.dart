import 'package:flutter/material.dart';
import 'package:flutter_app_inherited_state/state_container.dart';

// simple stateless widget that receives state from parent widget instead
class Factor extends StatelessWidget {

  final TextEditingController textEditingController = new TextEditingController();

  final double factor;

  Factor(this.factor);

  @override
  Widget build(BuildContext context) {

    final container = StateContainer.of(context);
    final state = container.state;

    final cardColor = Theme.of(context).primaryColor;
    final fontColor = Theme.of(context).textTheme.body1.color;

    final factoredValue = factor * state.value;
    textEditingController.text = factoredValue.toString();

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
                onSubmitted: (value) => _onChanged(value, container),
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

  _onChanged(String valueString, StateContainerState container) {
    // this should handle invalid input but is overkill for the example
    double value = double.parse(valueString);

    // since the input box contains a value with a factor, we split by the factor
    // to get the shared 'root' value which is then factored again on rebuild
    double valueWithoutFactor = value / factor;
    container.updateValue(valueWithoutFactor);
  }

}