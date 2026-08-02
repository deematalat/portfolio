import 'package:flutter_test/flutter_test.dart';

import 'package:deema_portfolio/main.dart';

void main() {
  testWidgets('Portfolio renders the hero name', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Deema Talat'), findsOneWidget);
  });
}
