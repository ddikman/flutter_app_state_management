import 'package:flutter/material.dart';
import 'package:flutter_app_inherited_state/models.dart';

class StateContainer extends StatefulWidget {
  final AppState state;

  final Widget child;

  StateContainer({
    @required this.child,
    this.state,
  });

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }

  @override
  State<StatefulWidget> createState() {
    return StateContainerState();
  }
}

// This seems a common enough pattern but I'm not fond of this naming,
// the methods hint that this is the actual state and not just the container of the state
class StateContainerState extends State<StateContainer> {
  AppState state;

  @override
  void initState() {
    if (widget.state != null) {
      state = widget.state;
    } else {
      state = AppState();
    }

    super.initState();
  }

  void updateValue(double value) {
    setState(() {
      state.value = value;
    });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  // we could use this to reduce rebuilds only on certain changes but it's alright for our purposes
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
