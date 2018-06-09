import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_inherited_state/main.dart';

void main() {
  testWidgets('placeholder test', (WidgetTester tester) async {
    // does nothing but start app root
    await tester.pumpWidget(new AppRoot());
  });
}
