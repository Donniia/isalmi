import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

import '../../Api/api_manager.dart';
import '../../Models/Radios.dart';

class RadioProvider extends ChangeNotifier {
  List<RadioModel> radios = [];
  bool isLoading = true;
  bool isError = false;
  int curIndex = 0;
  Future<void> getRadio() async {
    var res = await ApiManager.getRadios();
    res.fold((l) {
      isLoading = false;
      isError = true;
      notifyListeners();
    }, (r) {
      radios = r;
      isLoading = false;
      notifyListeners();
    });
  }

  RadioModel get curRadio => radios[curIndex];
  final player = AudioPlayer();
  bool get isPlaying =>player.state==PlayerState.playing;

 void  play() {
    if (player.state == PlayerState.playing) {
      player.pause();
    } else if (player.state == PlayerState.paused) {
      player.resume();
    } else {
      player.play(UrlSource(radios[curIndex].url ?? ""));
    }
    notifyListeners();
  }

  void next(){
   if(radios.length -1 ==curIndex){   return;}
   curIndex++;
   player.stop();
   notifyListeners();

  }

void prev(){
   if(curIndex==0){return;}
   curIndex--;
   player.stop();
   notifyListeners();

}
}
