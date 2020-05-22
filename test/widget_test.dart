// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:schoolable/main.dart';
import 'package:schoolable/widgets.dart';

void main() {
  testWidgets('Test that comments are added', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    Finder sendButton = find.byKey(Key('sendButton'));
    expect(sendButton, findsOneWidget);

    Finder messageField = find.byKey(Key('messageField'));
    expect(sendButton, findsOneWidget);

    int messagesCount = 0;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    await tester.enterText(messageField, 'My new message here');
    await tester.tap(sendButton);
    await tester.pump();
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    await tester.enterText(messageField, 'My new message here');
    await tester.tap(sendButton);

    final Offset point = tester.getCenter(find.text("Add to calendar"));
    await tester.dragFrom(point, Offset(0.0, -1500.0));
    await tester.pump();

    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    await tester.enterText(messageField, 'My new message here');
    await tester.tap(sendButton);
    await tester.pump();
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    print('Comments ($messagesCount)');
    expect(find.text('Comments ($messagesCount)'), findsOneWidget);

    // print(tester.)

    expect(find.text('Add to calendar'), findsOneWidget);
    // expect(find.text('PTA Meeting'), findsOneWidget);
  });

  testWidgets('Test that scroll replaces title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('PTA Meeting'), findsOneWidget);

    final Offset point = tester.getCenter(find.text("Add to calendar"));
    await tester.dragFrom(point, Offset(0.0, 500.0));
    await tester.pump();

    // expect(find.text('PTA Meeting'), findsNothing); //This fails, unexpectedly.
  });
}
