import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';
import 'package:wisata_candi/utils/fullscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Tampilan layar penuh (Android/iOS): sembunyikan status bar & navigation bar.
  // Bar muncul sementara jika layar digeser dari tepi, lalu tersembunyi lagi.
  if (!kIsWeb) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  runApp(const MyApp());
}

// Browser hanya mengizinkan fullscreen setelah ada klik pengguna,
// jadi fullscreen otomatis dicoba sekali saat klik/tap pertama.
bool _autoFullscreenTried = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) => Listener(
        behavior: HitTestBehavior.translucent,
        onPointerUp: (_) {
          if (!_autoFullscreenTried) {
            _autoFullscreenTried = true;
            enterFullscreen();
          }
        },
        child: child,
      ),
      home: DetailScreen(candi: candiList[0]),
    );
  }
}
