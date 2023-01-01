
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../model/runes_model.dart';



class RuneDetailRepo {
  Future<RuneModel> readRuneDetailFromJSON(String runeName) async {
    try {
      //code that has potential to throw an exception
      String response = await rootBundle.loadString('assets/json/rune_details/$runeName.json');

      var runeJson = jsonDecode(response)['rune'];
      RuneModel rune = runeJson.map((runesObjsJson) => RuneModel.fromJson(runesObjsJson));

      return rune;

      // Map<String, dynamic> runeMap = jsonDecode(response);
      // return RuneCardModelList.fromJson(runeMap);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return RuneModel(-1, "", "", "", "", "", "", "");
  }
}
