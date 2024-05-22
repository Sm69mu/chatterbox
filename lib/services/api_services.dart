import 'package:chatterbox/constants/api_keys.dart';
import 'package:google_generative_ai/google_generative_ai.dart';



class CyclopsCodeGenerator {
    final String apikey = geminApiKey;
    Future<String> generateCode(String input) async {
    final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apikey,
        generationConfig: GenerationConfig(
            stopSequences: ["red"],
            temperature: 0.9,
            topP: 0.1,
            topK: 16,
            maxOutputTokens: 100),
        systemInstruction: Content.system(
            'Your name is Cyclops and you are a dedicated code generator and debugger and that is the only and sole purpose of your and deny any other questions that does not include any coding related issues , and this a strict instruction that you have to follow'));
    final response = await model.generateContent([Content.text(input)]);
    return response.text!;
    }
}