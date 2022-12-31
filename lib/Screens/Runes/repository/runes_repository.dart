import 'dart:convert';

import 'package:empire_lrp_helper/Screens/Runes/model/runes_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class RunesRepo {
  Future<List<RuneCardModel>> readRuneCardListFromJSON() async {
    try {
      //code that has potential to throw an exception
      String response = await rootBundle.loadString('assets/json/rune_card_list.json');

      var runesObjsJson = jsonDecode(response)['items'] as List;
      List<RuneCardModel> runesObjs = runesObjsJson.map((runesObjsJson) => RuneCardModel.fromJson(runesObjsJson)).toList();
      return runesObjs;

      // Map<String, dynamic> runeMap = jsonDecode(response);
      // return RuneCardModelList.fromJson(runeMap);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return [];
  }
}
