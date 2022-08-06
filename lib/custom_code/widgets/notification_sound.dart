// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:audioplayers/audioplayers.dart';

class NotificationSound extends StatefulWidget {
  const NotificationSound({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _NotificationSoundState createState() => _NotificationSoundState();
}

class _NotificationSoundState extends State<NotificationSound> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    setPlayer();
  }

  void setPlayer() async {
    //await player.setPlayerMode(PlayerMode(1));
    //await player.setReleaseMode(ReleaseMode(1));
    //player.play(AssetSource('sounds/notification_sound.wav'));
    //await player.setSource(AssetSource('audios/notification_sound.wav'));
    // await player.setPlayerMode(PlayerMode.lowLatency);
    await player.setReleaseMode(ReleaseMode.loop);
    // await player.setVolume(0.5);
    await player.play(AssetSource('audios/notification_sound.wav'),
        volume: 0.5,
        ctx: AudioContext(
            android: AudioContextAndroid(
                isSpeakerphoneOn: true,
                stayAwake: true,
                audioFocus: AndroidAudioFocus.gain,
                contentType: AndroidContentType.sonification,
                usageType: AndroidUsageType.notification),
            iOS: AudioContextIOS(
                category: AVAudioSessionCategory.soloAmbient,
                defaultToSpeaker: true,
                options: [AVAudioSessionOptions.defaultToSpeaker])));
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
