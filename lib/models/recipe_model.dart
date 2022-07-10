import 'package:bukateria/models/comments_model.dart';
import 'package:bukateria/models/ingredients.dart';
import 'package:bukateria/models/recipe_method_model.dart';
import 'package:bukateria/models/user_model.dart';

class RecipeModel {
  String title;
  String description;
  UserModel? user;
  String? location;
  List<Ingredients>? ingredients;
  List<RecipeMethod>? method;
  String? createdAt;
  String image;
  bool? likes;
  int amount;
  double? stars;
  List<Comment>? comments;
  String? category;
  String? duration;

  RecipeModel(
      {required this.title,
      required this.description,
      this.user,
      this.location,
      this.ingredients,
      this.createdAt,
      required this.image,
      this.likes,
      required this.amount,
      this.method,
      this.category,
      this.duration,
      this.stars,
      this.comments});

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
      title: json['title'],
      description: json['description'],
      user: json['user'],
      location: json['location'],
      ingredients: json['ingredients'],
      createdAt: json['createdAt'],
      image: json['image'],
      category: json['category'],
      duration: json['duration'],
      likes: json['likes'],
      amount: json['amount'],
      stars: json['stars'],
      comments: json['comments']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'user': user,
        'location': location,
        'ingredients': ingredients,
        'createdAt': createdAt,
        'image': image,
        'likes': likes,
        'stars': title,
        'amount': amount,
        'comments': comments,
        'category': category,
        'duration': duration,
      };
}
