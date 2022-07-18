import 'package:bukateria/models/ingredients.dart';
import 'package:bukateria/models/user_model.dart';

class MenusModel {
  String title;
  String description;
  UserModel? user;
  String? location;
  List<Ingredients>? ingredients;
  String? createdAt;
  String image;
  bool? likes;
  bool? deliveyStatus;
  int amount;
  double? stars;

  MenusModel(
      {required this.title,
      required this.description,
      this.user,
      this.location,
      this.deliveyStatus,
      this.ingredients,
      this.createdAt,
      required this.image,
      this.likes,
      required this.amount,
      this.stars});

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        title: json['title'],
        description: json['description'],
        user: json['user'],
        location: json['location'],
        ingredients: json['ingredients'],
        createdAt: json['createdAt'],
        image: json['image'],
        deliveyStatus: json['deliveyStatus'],
        likes: json['likes'],
        amount: json['amount'],
        stars: json['stars'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'user': user,
        'location': location,
        'deliveyStatus': deliveyStatus,
        'ingredients': ingredients,
        'createdAt': createdAt,
        'image': image,
        'likes': likes,
        'stars': title,
        'amount': amount
      };
}
