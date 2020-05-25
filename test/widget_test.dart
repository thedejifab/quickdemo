// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:schoolable/main.dart';
import 'package:schoolable/widgets.dart';

void main() {
  testWidgets('Test that comments are added and that title is replaced',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Find PTA meeting text and check if it's on top of screen
    Finder ptaMeetingFinder = find.text('PTA Meeting');
    expect(tester.getCenter(ptaMeetingFinder).dx > 0, true);

    // Get sendButton by key
    Finder sendButton = find.byKey(Key('sendButton'));
    expect(sendButton, findsOneWidget);

    // Get messageField by key
    Finder messageField = find.byKey(Key('messageField'));
    expect(sendButton, findsOneWidget);

    // Initialize message count
    int messagesCount = 0;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    // Start: type and send first message
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(messageField, 'My new message here');

    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(sendButton);

    await tester.pumpAndSettle(const Duration(seconds: 1));
    // End: type and send first message

    // Increase message count and check if new message reflects
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    // Start: type and send second message
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(messageField, 'My new message here');

    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(sendButton);

    await tester.pumpAndSettle(const Duration(seconds: 1));
    // End: type and send second message

    // Start: scroll a bit to see newly added messages
    Offset point = tester.getCenter(find.text("Add to calendar"));
    print('Initial point of first scroll ${point.toString()}');

    final TestGesture gesture = await tester.startGesture(point);

    await gesture.moveTo(Offset(0, -50));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    point = tester.getCenter(find.text("Add to calendar"));
    print(
        'Final point of first scroll ${point.toString()}'); //confirm scroll success
    // End: scroll a bit to see newly added messages

    // Increase message count and check if new message reflects
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Start: type and send third message
    await tester.enterText(messageField, 'My new message here');
    await tester.tap(sendButton);

    await tester.pumpAndSettle(const Duration(seconds: 1));
    // End: type and send third message

    // Increase message count and check if new message reflects
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    // Start: scroll a bit to see newly added messages
    print('Initial point of first scroll ${point.toString()}');
    await gesture.moveBy(Offset(0, -60));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    point = tester.getCenter(find.text("Add to calendar"));
    print(
        'Final point of second scroll ${point.toString()}'); //confirm scroll success

    await tester.pumpAndSettle(const Duration(seconds: 1));
    // End: scroll a bit to see newly added messages

    // Start: type and send fourth message
    await tester.enterText(messageField, 'My new message here');
    await tester.tap(sendButton);

    // // await tester.dragFrom(Offset(0.0, 1050.0), Offset(0.0, 1600.0));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    // End: type and send fourth message

    // Increase message count and check if new message reflects
    messagesCount += 1;
    expect(find.byType(MessageWidget), findsNWidgets(messagesCount));

    // Check if PTA meeting text is no longer in viewport
    expect(tester.getCenter(ptaMeetingFinder).dy < 0, true);

    // Confirm that Comments text has moved to be the title (<= 80px) for pinned AppBar
    Finder commentsFinder = find.text('Comments ($messagesCount)');
    Offset commentsOffset = tester.getCenter(commentsFinder);
    print('Comments offset: ${commentsOffset.toString()}');

    expect(commentsOffset.dy <= 81, true);
  });
}
