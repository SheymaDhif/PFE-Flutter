

import 'Evaluation.dart';

class History {
  String id;
  String name;
  String title;
  String password;
  Evaluation evaluation;
  String created_at;
  String updated_at;

  History(
      {
        this.id,
        this.name,
        this.title,
        this.evaluation,
        this.created_at,
        this.updated_at
   });

  // data received from json
  History.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    name = json['name'];
    title = json['title'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    evaluation = json['evaluation'] != null
        ? new Evaluation.fromJson(json['evaluation'])
        : null;
  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    if (this.evaluation != null) {
      data['location'] = this.evaluation.toJson();
    }
    return data;
  }
}
