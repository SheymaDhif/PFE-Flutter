

import 'Category.dart';

class Evaluation {
  int id;
  String name;
  String description;
  String image;
  String level;
  Category category;
  String status;
  String created_at;
  String updated_at;

  Evaluation(
      {
        this.id,
        this.name,
        this.description,
        this.image,
        this.level,
        this.status,
        this.category,
        this.created_at,
        this.updated_at
      });

  // data received from json
  Evaluation.fromJson(Map<String, dynamic> json) {
    id = (json['id'] == null) ? json['_id'] : json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    level = json['level'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  //convert object to json --needed to save in shared Prefs
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['level'] = this.level;
    data['status'] = this.status;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }

  List<Evaluation> evaluations = [
    Evaluation(
      id: 1,
      level: "easy",
      status: "Classic Leather Arm Chair",
      image: "assets/images/q1.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
    Evaluation(
      id: 2,
      level: "easy",
      status: "Classic Leather Arm Chair",
      image: "assets/images/mm1.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
    Evaluation(
      id: 1,
      level: "easy",
      status: "Classic Leather Arm Chair",
      image: "assets/images/chat2.png",
      description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
    ),
  ];
}
