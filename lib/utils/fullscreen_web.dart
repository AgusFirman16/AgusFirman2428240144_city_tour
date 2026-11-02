import 'dart:js_interop';
import 'dart:js_interop_unsafe';

JSObject get _document => globalContext['document'] as JSObject;

/// True jika browser sedang dalam mode fullscreen.
bool get isFullscreen => _document['fullscreenElement'] != null;

/// Masuk fullscreen. Harus dipanggil dari aksi pengguna (klik/tap),
/// kalau tidak browser akan menolaknya.
void enterFullscreen() {
  if (isFullscreen) return;
  final element = _document['documentElement'] as JSObject;
  element.callMethod('requestFullscreen'.toJS);
}

/// Keluar dari fullscreen.
void exitFullscreen() {
  if (!isFullscreen) return;
  _document.callMethod('exitFullscreen'.toJS);
}

void toggleFullscreen() => isFullscreen ? exitFullscreen() : enterFullscreen();

/// Dipanggil setiap status fullscreen berubah (termasuk saat menekan Esc).
void listenFullscreenChange(void Function() callback) {
  _document.callMethod(
    'addEventListener'.toJS,
    'fullscreenchange'.toJS,
    (() => callback()).toJS,
  );
}
