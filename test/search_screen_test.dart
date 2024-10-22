
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/search_screen.dart';
import 'package:flutter_application_1/services/giphy_api.dart';
import 'package:mockito/mockito.dart';


class MockGiphyApi extends Mock implements GiphyApi {}

void main() {
  testWidgets('displays search bar and triggers search', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SearchScreen()));

    
    expect(find.byType(TextField), findsOneWidget);

    
    await tester.enterText(find.byType(TextField), 'funny');
    await tester.pump();
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();
  });
}
