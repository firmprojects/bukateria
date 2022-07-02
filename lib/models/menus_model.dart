import 'package:bukateria/models/ingredients.dart';

class MenusModel {
  String title;
  String description;
  String userId;
  String location;
  List<Ingredients> ingredients;
  String createdAt;
  String image;
  bool likes;
  int amount;
  int stars;

  MenusModel(
      {required this.title,
      required this.description,
      required this.userId,
      required this.location,
      required this.ingredients,
      required this.createdAt,
      required this.image,
      required this.likes,
      required this.amount,
      required this.stars});

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        title: json['title'],
        description: json['description'],
        userId: json['userId'],
        location: json['location'],
        ingredients: json['ingredients'],
        createdAt: json['createdAt'],
        image: json['image'],
        likes: json['likes'],
        amount: json['amount'],
        stars: json['stars'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'userId': userId,
        'location': location,
        'ingredients': ingredients,
        'createdAt': createdAt,
        'image': image,
        'likes': likes,
        'stars': title,
        'amount': amount
      };
}
