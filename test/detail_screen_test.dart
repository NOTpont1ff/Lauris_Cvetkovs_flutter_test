import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail_screen.dart';
import 'package:flutter_application_1/models/gif_model.dart';

void main() {
  testWidgets('displays GIF details correctly', (WidgetTester tester) async {
    final gif = GifModel(
      id: '1',
      title: 'Test GIF',
      url: 'https://test.com/gif1.gif',
      user: 'test_user',
    );

    await tester.pumpWidget(MaterialApp(
      home: DetailScreen(gif: gif),
    ));

    expect(find.text('Test GIF'), findsOneWidget);
    expect(find.text('Uploaded by: test_user'), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('displays unknown user when username is missing', (WidgetTester tester) async {
    final gif = GifModel(
      id: '1',
      title: 'Test GIF',
      url: 'https://test.com/gif1.gif',
      user: 'Unknown',
    );

    await tester.pumpWidget(MaterialApp(
      home: DetailScreen(gif: gif),
    ));

    expect(find.text('Uploaded by: Unknown'), findsOneWidget);
  });
}
