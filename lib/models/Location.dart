

class Location {
  String id;
  String longitude;
  String latitude;
  String created_at;
  String updated_at;


  Location(
      {
        this.id,
        this.longitude,
        this.latitude,
        this.created_at,
        this.updated_at
      });

  // data received from json
  Location.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];

  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
