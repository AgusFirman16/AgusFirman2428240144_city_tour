// Memilih implementasi fullscreen sesuai platform:
// - Web (Chrome)  -> fullscreen_web.dart (Fullscreen API browser)
// - Android/iOS   -> fullscreen_stub.dart (tidak melakukan apa-apa,
//                    karena sudah ditangani SystemChrome di main.dart)
export 'fullscreen_stub.dart' if (dart.library.js_interop) 'fullscreen_web.dart';
