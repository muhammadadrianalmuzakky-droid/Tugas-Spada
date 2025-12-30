import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  static String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  static Future<String> generateAnswer(String question) async {
    if (_apiKey.isEmpty) {
      return 'API Key tidak ditemukan.';
    }

    try {
      final model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: _apiKey,
      );

      final response = await model.generateContent(
        [Content.text(question)],
      );

      return response.text ?? 'Tidak ada jawaban.';
    } catch (e) {
      return 'Terjadi error: $e';
    }
  }
}
