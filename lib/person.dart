class Person {
  List<String>? _pedals;
  List<String>? _guitars;
  String? _name;

  List<String>? get pedals => _pedals;
  List<String>? get guitars => _guitars;
  String? get name => _name;

  Person({
      List<String>? pedals, 
      List<String>? guitars, 
      String? name}){
    _pedals = pedals;
    _guitars = guitars;
    _name = name;
}

  Person.fromJson(dynamic json) {
    _pedals = json["pedals"] != null ? json["pedals"].cast<String>() : [];
    _guitars = json["guitars"] != null ? json["guitars"].cast<String>() : [];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["pedals"] = _pedals;
    map["guitars"] = _guitars;
    map["name"] = _name;
    return map;
  }

}