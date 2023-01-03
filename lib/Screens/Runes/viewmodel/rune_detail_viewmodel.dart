import '../model/runes_model.dart';
import '../repository/rune_detail_repo.dart';

class RuneDetailViewModel {
  static final RuneDetailViewModel _runesDetailViewModel =
      RuneDetailViewModel._internal();

  factory RuneDetailViewModel() {
    return _runesDetailViewModel;
  }

  RuneDetailViewModel._internal();

  String currentRuneName = "";

  RuneDetailRepo repo = RuneDetailRepo();

  Future<RuneModel> getRune() {
    return repo.readRuneDetailFromJSON(currentRuneName.toLowerCase());
  }
}
