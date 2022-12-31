
import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';

import '../repository/runes_repository.dart';

class RunesViewModel {

  static final RunesViewModel _runesViewModel = RunesViewModel._internal();

  factory RunesViewModel() {
    return _runesViewModel;
  }

  RunesViewModel._internal();
  RunesRepo repo = RunesRepo();

  Future<List<RuneCardModel>> getRuneCardListFromRepo() async {
    repo.readRuneCardListFromJSON();
    return repo.readRuneCardListFromJSON();
  }
}