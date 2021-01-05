import 'Doctor.dart';
import 'History.dart';


class User {
  int id;
  String name;
  String email;
  String password;
  String country;
  String city;
  Doctor doctor;
  History history;
  String age;
  String access_token;
  String sexe;
  String created_at;
  String updated_at;

  User(
      {
        this.id,
        this.name,
        this.email,
        this.password,
        this.country,
        this.city,
        this.doctor,
        this.history,
        this.age,
        this.access_token,
        this.sexe,
        this.created_at,
        this.updated_at
      });

  // data received from json
  User.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    access_token = json['access_token'];
    email = json['email'];
    password = json['password'];
    country = json['country'];
    city = json['city'];
    age = json['age'];
    sexe = json['sexe'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
   doctor = json['doctor'] != null
        ? new Doctor.fromJson(json['doctor'])
        : null;
    history = json['history'] != null
        ? new History.fromJson(json['history'])
        : null;
  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['access_token'] = this.access_token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['country'] = this.country;
    data['sexe'] = this.sexe;
    data['age'] = this.age;
    data['city'] = this.city;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    if (this.doctor != null) {
      data['doctor'] = this.doctor.toJson();
    }
    if (this.history != null) {
      data['history'] = this.history.toJson();
    }
    return data;
  }
}
