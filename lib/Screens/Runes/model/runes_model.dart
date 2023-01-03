class RuneModel {
  int id = -1;
  String name = "";
  String altName = "";
  String realmAffiliation = "";
  String description = "";
  String useInMagic = "";
  String useInCrafting = "";
  String imagePath = "";

  RuneModel(this.id, this.name, this.altName, this.realmAffiliation,
      this.description, this.useInMagic, this.useInCrafting, this.imagePath);

  factory RuneModel.fromJson(Map<String, dynamic> data) {
    return RuneModel(
        data['id'] as int,
        data['name'] as String,
        data['altName'] as String,
        data['realmAffiliation'] as String,
        data['description'] as String,
        data['useInMagic'] as String,
        data['useInCrafting'] as String,
        data['imagePath'] as String);
  }
}

class RuneCardModel {
  int id = -1;
  String name = "";
  String altName = "";
  String realmAffiliation = "";
  String imagePath = "";

  RuneCardModel(
      this.id, this.name, this.altName, this.realmAffiliation, this.imagePath);

  factory RuneCardModel.fromJson(dynamic json) {
    return RuneCardModel(
        json['id'] as int,
        json['name'] as String,
        json['altName'] as String,
        json['realmAffiliation'] as String,
        json['imagePath'] as String);
  }
}
