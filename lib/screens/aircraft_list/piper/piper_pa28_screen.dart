import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:logger/logger.dart';

AppBar buildCommonAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.blueGrey[400],
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        GoRouter.of(context).go('/');
      },
    ),
  );
}

class PiperPA28Screen extends StatefulWidget {
  const PiperPA28Screen({super.key});

  @override
  State<PiperPA28Screen> createState() => _PiperPA28ScreenState();
}

class _PiperPA28ScreenState extends State<PiperPA28Screen> {
  final List<bool> _isChecked = List.generate(10, (index) => false);
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Function to play audio
  void _playAudio() async {
    const audioPath = 'assets/audio/TestAudio.wav';
    await _audioPlayer.play(AssetSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCommonAppBar(context, 'Piper PA-28 Cherokee'),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text('Checkbox ${index + 1}'),
            value: _isChecked[index],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[index] = value ?? false;
              });
              if (value == true) {
                Logger().e(value);
                _playAudio();
              }
            },
          );
        },
      ),
    );
  }
}
