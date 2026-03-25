import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/main.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Username'), findsOneWidget);
  });
}