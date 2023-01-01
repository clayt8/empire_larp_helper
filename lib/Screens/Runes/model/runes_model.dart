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

  factory RuneModel.fromJson(dynamic json) {
    return RuneModel(
        json['id'] as int,
        json['name'] as String,
        json['altName'] as String,
        json['realmAffiliation'] as String,
        json['description'] as String,
        json['useInMagic'] as String,
        json['useInCrafting'] as String,
        json['imagePath'] as String);
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
