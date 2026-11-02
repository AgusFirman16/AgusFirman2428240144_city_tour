import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi/utils/fullscreen.dart';

/// Tombol untuk masuk / keluar mode fullscreen (hanya tampil di web).
class FullscreenButton extends StatefulWidget {
  const FullscreenButton({super.key});

  @override
  State<FullscreenButton> createState() => _FullscreenButtonState();
}

class _FullscreenButtonState extends State<FullscreenButton> {
  @override
  void initState() {
    super.initState();
    // Perbarui ikon jika fullscreen berubah (mis. pengguna menekan Esc).
    listenFullscreenChange(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return const SizedBox.shrink();

    return IconButton(
      tooltip: isFullscreen ? 'Keluar full screen' : 'Full screen',
      onPressed: () {
        toggleFullscreen();
        setState(() {});
      },
      icon: Icon(
        isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
