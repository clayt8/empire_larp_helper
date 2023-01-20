import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';

class RuneStudyModel {
  RuneCardModel currentActive;
  List<RuneCardModel> choiceList;
  bool isRuneImage;

  RuneStudyModel(this.currentActive, this.choiceList, this.isRuneImage);
}