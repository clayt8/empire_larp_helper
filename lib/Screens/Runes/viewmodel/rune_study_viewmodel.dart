import 'dart:math';

import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';
import 'package:empire_lrp_helper/Screens/Runes/model/runes_study_model.dart';

class RuneStudyViewModel {
  static final RuneStudyViewModel _runeStudyViewModel =
  RuneStudyViewModel._internal();

  factory RuneStudyViewModel() {
    return _runeStudyViewModel;
  }

  RuneStudyViewModel._internal();

  List<RuneCardModel> runes = [];
  List<RuneCardModel> shuffledList = [];

  bool correctChoice = false;

  void randomiseList(List<RuneCardModel> list) {
    List<RuneCardModel> shuffledListTemp = list.toList();
    shuffledListTemp.shuffle();
    shuffledList = shuffledListTemp.toList();
  }

  RuneStudyModel getNewSet() {
    randomiseList(runes);
    List<RuneCardModel> set = [];
    for (int i = 0; i < 4; i++) {
      Random _random = Random();
      if(i == 0){
        RuneCardModel choice = shuffledList[(_random.nextInt(shuffledList.length))];
        set.add(choice);
        set.add(choice);
        shuffledList.remove(set[0]);
      } else {
        set.add(shuffledList[(_random.nextInt(shuffledList.length))]);
        shuffledList.remove(set[i]);
      }
    }
    RuneCardModel choice = set[0];
    set.remove(set[0]);


    Random randomNumberGenerator = Random();
    bool randomBoolean = randomNumberGenerator.nextBool();
    set.shuffle(randomNumberGenerator);
    return RuneStudyModel(choice, set, randomBoolean);
  }
}
