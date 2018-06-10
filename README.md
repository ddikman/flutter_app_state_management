# flutter_app_inherited_state

This app aims to examplify and suggest different solutions for management of shared state.

Branches contain different solutions:

* master; state through propagation and callbacks
* inherited_state; state management in shared inherited widget

![  Screenshot](/main_screen.png?raw=true)

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Resources

Great examples of different architectures in code: https://github.com/brianegan/flutter_architecture_samples/tree/master/example

### InheritedWidget
Talks about the internal workings of InheritedWidget and its update mechanism
* https://medium.com/@chemamolins/is-flutters-inheritedwidget-a-good-fit-to-hold-app-state-2ec5b33d023e
* *Recommended* [example of InheritedWidget architecture in Github](https://github.com/brianegan/flutter_architecture_samples/blob/master/example/inherited_widget/lib/models.dart)
* [Google IO 2018 talk on different state management options](https://www.youtube.com/watch?time_continue=7&v=RS36gBEp8OI)