

class Category {
  String id;
  String name;
  String description;
  String image;
  String created_at;
  String updated_at;

  Category(
      {
        this.id,
        this.name,
        this.description,
        this.image,
        this.created_at,
        this.updated_at
      });

  // data received from json
  Category.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
