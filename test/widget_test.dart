import 'package:flutter_test/flutter_test.dart';
import 'package:wisata_candi/main.dart';

void main() {
  testWidgets('DetailScreen menampilkan info candi', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Candi Borobudur'), findsOneWidget);
    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Galeri'), findsOneWidget);
  });
}
