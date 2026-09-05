import 'package:flutter_test/flutter_test.dart';
import 'package:bloom_custom_flowers/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const BloomApp());
    expect(find.text('Bloom'), findsWidgets);
  });
}
