
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'base_post_repository.dart';

class PostRepository extends BasePostRepository{
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseReference;
  String methodKey = "";
  String ingredientsKey = "";
  String recipeKey = "";
  String menuKey = "";
  String exploreKey = "";
  String userUID ="";

  PostRepository({auth.FirebaseAuth? firebaseAuth,FirebaseFirestore? firestoreReference}) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance, _firebaseReference = firestoreReference ?? FirebaseFirestore.instance;

  @override
  Future<String?> uploadImage({required File imageFile,
    required String name,
    required String uid}) async {

      Reference ref = FirebaseStorage.instance .ref()
          .child('post_image')
          .child(name+DateTime.now().microsecondsSinceEpoch.toString());
      try {
        await ref.putFile(imageFile);
        String url = await ref.getDownloadURL();
        print('Url' + url);
        return url;
      } on FirebaseException catch (e) {
        print(e);
      }
      return "";

  }

  @override
  Future<Map<String, Object>?> addExplorePost({required String title, required String description, required String productStatus, required String image, required String uid}) async {
    try{
      var map = <String,Object>{};
      map["title"] = title;
      map["description"] = description;
      map["image"] = image;
      map["productStatus"] = productStatus;
      map["uid"] = uid;
      map["created_at"] = DateTime.now();
      String value = _firebaseReference.collection("Explore").doc().id;
      map["key"] = value;
      await _firebaseReference.collection("Explore").doc(value).set(map);
      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  Future<Map<String, Object>?> updateExplorePost({required String key, required String uid}) async {
    try{
      var map = <String,Object>{};

      map["productStatus"] = "PUBLISH";

      await _firebaseReference.collection("Explore").doc(key).update(map);

      return map;
    }catch(_){
      throw Exception();
    }

  }

  @override
  Future<Map<String, Object>?> updateMenuPost({required String key, required String uid}) async {
    try{
      var map = <String,Object>{};

      map["productStatus"] = "PUBLISH";

      await _firebaseReference.collection("Menu").doc(key).update(map);

      return map;
    }catch(_){
      throw Exception();
    }

  }

  @override
  // TODO: implement getExplores
  Stream<QuerySnapshot<Object?>?> get getExplores => _firebaseReference.collection("Explore").snapshots();

  @override
  // TODO: implement getExplores
  Stream<QuerySnapshot<Object?>?> get getMenus => _firebaseReference.collection("Menu").snapshots();



  String kPLACES_API_KEY = "AIzaSyD1-pjN6OGA80NaUTe8IS9McCWHlMvUcHA";

  Future<String> searchPlaces(String input) async {



    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY';
    var response = await http.get(Uri.parse(request));

    if(response.body.isNotEmpty){
      return response.body;
    }else{
      return "Not found!";
    }

  }

  Future<String> getDetails(String place_id) async {


    String url = "https://maps.googleapis.com/maps/api/place/details/json?key=$kPLACES_API_KEY&placeid=${place_id}";
    var response = await http.get(Uri.parse(url));

    if(response.body.isNotEmpty){
      return response.body;
    }else{
      return "Not found!";
    }

  }

  @override
  Future<Map<String, Object>?> addMenuPost({required String title, required String description, required String price, required String location, required String deliveryType, required String productStatus, required String image, required String uid}) async {
    try{
      var map = <String,Object>{};
      map["title"] = title;
      map["description"] = description;
      map["image"] = image;
      map["productStatus"] = productStatus;
      map["price"] = price;
      map["location"] = location;
      map["deliveryType"] = deliveryType;
      map["uid"] = uid;
      map["created_at"] = DateTime.now();
      String value = _firebaseReference.collection("Menu").doc().id;
      map["key"] = value;
      await _firebaseReference.collection("Menu").doc(value).set(map);
      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  Future<Map<String, Object>?> addRecipePost({required String title, required String description, required String cuisine, required String category, required List<String> ingredients, required List<Map<String, dynamic>> methods, required String image, required String productStatus, required String uid}) async{
    try{
      var map = <String,Object>{};
      map["title"] = title;
      map["description"] = description;
      map["image"] = image;
      map["cuisine"] = cuisine;
      map["category"] = category;
      map["productStatus"] = productStatus;
      map["uid"] = uid;
      map["created_at"] = DateTime.now();
      String key = _firebaseReference.collection("Recipe").doc().id;
      map["key"] = key;
      ingredients.forEach((element) async{
        String ingreKey = _firebaseReference.collection("ingredients").doc(key).collection("list").doc().id;
        Map<String,dynamic> mapIng = {};
        mapIng["ingredient"] = element;
        mapIng["key"] = ingreKey;
        await _firebaseReference.collection("ingredients").doc(key).collection("list").doc(ingreKey).set(mapIng);
      });

      methods.forEach((element) async{
        String ingreKey = _firebaseReference.collection("Methods").doc(key).collection("list").doc().id;
        Map<String,dynamic> mapMet = {};
        mapMet["text"] = element["text"];
        mapMet["key"] = ingreKey;
        uploadImage(imageFile: File(element["image"]), name: "", uid: uid).then((value) async {
          mapMet["image"] = value;
          await _firebaseReference.collection("Methods").doc(key).collection("list").doc(ingreKey).set(mapMet);
        });
      });

      await _firebaseReference.collection("Recipe").doc(key).set(map);
      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  Future<Map<String, Object>?> updateRecipePost({required String key, required String uid}) async {
    try{
      var map = <String,Object>{};

      map["productStatus"] = "PUBLISH";

      await _firebaseReference.collection("Recipe").doc(key).update(map);

      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  // TODO: implement getIngredients
  Stream<QuerySnapshot<Object?>?> get getIngredients => _firebaseReference.collection("ingredients").doc(ingredientsKey).collection("list").snapshots();

  @override
  // TODO: implement getMethods
  Stream<QuerySnapshot<Object?>?> get getMethods => _firebaseReference.collection("Methods").doc(methodKey).collection("list").snapshots();

/*
  @override
  // TODO: implement getRecipe
  Stream<QuerySnapshot<Object?>?> get getRecipe => _firebaseReference.collection("Recipe").snapshots();
*/

 @override
  // TODO: implement getRecipe
  Stream<QuerySnapshot<Object?>?> get getRelatedRecipe => _firebaseReference.collection("Recipe").where("uid",isEqualTo: recipeKey).snapshots();

  @override
  // TODO: implement getRelatedExplore
  Stream<QuerySnapshot<Object?>?> get getRelatedExplore => _firebaseReference.collection("Explore").where("uid",isEqualTo: exploreKey).snapshots();

  @override
  // TODO: implement getRelatedMenu
  Stream<QuerySnapshot<Object?>?> get getRelatedMenu => _firebaseReference.collection("Menu").where("uid",isEqualTo: menuKey).snapshots();

  @override
  Future<Map<String, Object>?> addFavorites({required String ownerUID, required String favoritesUID, required String productID, required String postType}) {
    // TODO: implement addFavorites
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Object>?> addOrder({required String ownerUID, required String userUID, required String productID, required String postType, required String rating}) {
    // TODO: implement addOrder
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Object>?> addRatings({required String ownerUID, required String reviewerUID, required String productID, required String postType, required String rating}) {
    // TODO: implement addRatings
    throw UnimplementedError();
  }

  @override
  // TODO: implement getAllRecipe
  Stream<QuerySnapshot<Object?>?> get getAllRecipe => _firebaseReference.collection("Recipe").snapshots();
}