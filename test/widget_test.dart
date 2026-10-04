import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/main.dart';

void main() {
  testWidgets('ReadRoulette app builds', (tester) async {
    await tester.pumpWidget(const ReadRouletteApp());

    expect(find.text('ReadRoulette'), findsOneWidget);
  });
}
