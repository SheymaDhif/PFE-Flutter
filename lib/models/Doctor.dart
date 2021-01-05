
import 'Location.dart';

class Doctor {
  String id;
  String name;
  String email;
  String availability;
  String avatar;
  String rating;
  Location location;
  String created_at;
  String updated_at;

  Doctor(
      {
        this.id,
        this.name,
        this.email,
        this.availability,
        this.avatar,
        this.rating,
        this.location,
        this.created_at,
        this.updated_at
        });

  // data received from json
  Doctor.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    name = json['name'];
    email = json['email'];
    availability = json['availability'];
    avatar = json['avatar'];
    rating = json['rating'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['availability'] = this.availability;
    data['avatar'] = this.avatar;
    data['rating'] = this.rating;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    return data;
  }
}
