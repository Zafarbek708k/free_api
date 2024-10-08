import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_api/src/core/constants/context_extension.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';
import '../../../core/widgets/text_widget.dart';
import 'dart:async';
import 'dart:math';
import 'package:speech_to_text/speech_recognition_error.dart';



class VoiceToTextScreen extends StatefulWidget {
  const VoiceToTextScreen({super.key});

  @override
  State<VoiceToTextScreen> createState() => _VoiceToTextScreenState();
}

class _VoiceToTextScreenState extends State<VoiceToTextScreen> {
  // late stt.SpeechToText _speech;
  // bool _isListening = false;
  // double level = 0.0;
  // String _text = "Press the button and start speaking...";
  // String _selectedLangCode = 'en_US'; // Default language
  // List<LocaleName> _locales = [
  //   LocaleName("en_US", "English"),
  //   LocaleName("ru_RU", "Russian"),
  //   LocaleName("uz_UZ", "Uzbek"),
  // ]; // Default languages


  // // Initialize the speech recognizer
  // Future<void> _initSpeech() async {
  //   bool available = await _speech.initialize(
  //     onStatus: (status) => debugPrint('onStatus: === === ==  $status'),
  //     onError: (error) => debugPrint('onError: = = == = =   $error'),
  //   );
  //   if (available) {
  //     var locales = await _speech.locales();
  //     setState(() {
  //       _locales = locales
  //           .map((locale) => LocaleName(locale.localeId, locale.name))
  //           .toList();
  //     });
  //   }
  // }
  //
  // // Start listening to speech
  // void _startListening() async {
  //   if (!_isListening) {
  //     await _speech.listen(
  //       localeId: _selectedLangCode,
  //       onResult: (result) {
  //         setState(() {
  //           _text = result.recognizedWords;
  //         });
  //       },
  //     );
  //     setState(() {
  //       _isListening = true;
  //     });
  //   }
  // }
  //
  // // Stop listening to speech
  // void _stopListening() async {
  //   if (_isListening) {
  //     await _speech.stop();
  //     setState(() {
  //       _isListening = false;
  //     });
  //   }
  // }
  //
  // // Restart listening (stop and then start)
  // void _restartListening() {
  //   _stopListening();
  //   _startListening();
  // }
  //
  // // Select language from the dropdown
  // void _onLanguageChanged(String? newLangCode) {
  //   setState(() {
  //     _selectedLangCode = newLangCode!;
  //   });
  // }

  final SpeechToText _speechToText = SpeechToText();

  bool _speechEnabled = false;
  String _wordsSpoken = "";
  double _confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordsSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
      debugPrint("speech word : ${result.recognizedWords}");
    });
  }


  // @override
  // void didChangeDependencies() async{
  //   _speech = stt.SpeechToText();
  //   await _initSpeech();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
          backgroundColor: context.appTheme.primary,
        title: CustomTextWidget("Speech to Text",textColor: context.appTheme.secondary,)
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: REdgeInsets.all(16),
              child: Text(
                _speechToText.isListening
                    ? "listening..."
                    : _speechEnabled
                    ? "Tap the microphone to start listening..."
                    : "Speech not available",
                style: TextStyle(fontSize: 20.0, color: context.appTheme.secondary),
              ),
            ),
            Expanded(
              child: Container(
                padding: REdgeInsets.all(16),
                child: Text(
                  _wordsSpoken,
                  style:  TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: context.appTheme.secondary
                  ),
                ),
              ),
            ),
            if (_speechToText.isNotListening && _confidenceLevel > 0)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 100,
                ),
                child: Text(
                  "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                    color: context.appTheme.secondary
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        tooltip: 'Listen',
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       CustomTextWidget(textColor: context.appTheme.secondary, 'Selected Language:'),
      //       _locales.isNotEmpty
      //           ? DropdownButton<String>(
      //         value: _selectedLangCode,
      //         onChanged: _onLanguageChanged,
      //         items: _locales.map((locale) {
      //           return DropdownMenuItem<String>(
      //             value: locale.localeId,
      //             child: CustomTextWidget(locale.name, textColor: context.appTheme.secondary,),
      //           );
      //         }).toList(),
      //       )
      //           : const CircularProgressIndicator(),
      //       const SizedBox(height: 20),
      //       CustomTextWidget(textColor: context.appTheme.secondary,  'Speech Result:'),
      //       Container(
      //         padding: const EdgeInsets.all(12.0),
      //         width: double.infinity,
      //         height: 100,
      //         decoration: BoxDecoration(
      //           color: context.appTheme.primary.withOpacity(0.5),
      //           borderRadius: BorderRadius.circular(15),
      //           border: Border.all(color: context.appTheme.secondary)
      //         ),
      //         child: CustomTextWidget(textColor: context.appTheme.secondary,  _text),
      //       ),
      //       const Spacer(),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           ElevatedButton(
      //             onPressed: _isListening ? null : _startListening,
      //             child: CustomTextWidget(textColor: context.appTheme.secondary,  'Start'),
      //           ),
      //           ElevatedButton(
      //             onPressed: _isListening ? _stopListening : null,
      //             child: CustomTextWidget(textColor: context.appTheme.secondary,  'Stop'),
      //           ),
      //           ElevatedButton(
      //             onPressed: _restartListening,
      //             child: CustomTextWidget(textColor: context.appTheme.secondary,  'Restart'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}









