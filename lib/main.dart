import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  // 1. Inisialisasi binding agar Flutter siap membaca asset
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 2. Memuat file .env
    await dotenv.load(fileName: ".env");

    // 3. Debugging: Cek apakah key terbaca di console saat aplikasi running
    // Jika di terminal muncul "Key Terdeteksi: AIza...", berarti sudah BERHASIL
    print("DEBUG: Key Terdeteksi -> ${dotenv.env['GEMINI_API_KEY']}");
  } catch (e) {
    // Memberi tahu jika file .env gagal dimuat
    print("DEBUG: Gagal memuat file .env! Error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Study Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
