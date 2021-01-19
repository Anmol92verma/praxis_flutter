/// type : "someType"
/// value : [{"id":1,"joke":""}]

class JokesResponse {
  String _type;
  List<Joke> _value;

  String get type => _type;
  List<Joke> get value => _value;

  JokesResponse({
      String type, 
      List<Joke> value}){
    _type = type;
    _value = value;
}

  JokesResponse.fromJson(dynamic json) {
    _type = json["type"];
    if (json["value"] != null) {
      _value = [];
      json["value"].forEach((v) {
        _value.add(Joke.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    if (_value != null) {
      map["value"] = _value.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// joke : ""

class Joke {
  int _id;
  String _joke;

  int get id => _id;
  String get joke => _joke;

  Joke({
      int id, 
      String joke}){
    _id = id;
    _joke = joke;
}

  Joke.fromJson(dynamic json) {
    _id = json["id"];
    _joke = json["joke"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["joke"] = _joke;
    return map;
  }

}