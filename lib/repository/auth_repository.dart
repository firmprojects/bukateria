import 'package:bukateria/repository/base_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository extends BaseAuthRepository{
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseReference;
  String uid = "";
  String followingUID = "";
  String followedUID = "";

  AuthRepository({auth.FirebaseAuth? firebaseAuth,FirebaseFirestore? firestoreReference}) : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance, _firebaseReference = firestoreReference ?? FirebaseFirestore.instance;

  @override
  Future<auth.User?> signup({required String email, required String password}) async {
    try {
     final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      );

     final user = credential.user;
     return user;
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<auth.User?> signin({required String email, required String password}) async {
    try {
     final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
      );

     final user = credential.user;
     return user;
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<bool?> updatePassword({ required String password}) async {
    try {

      if(_firebaseAuth.currentUser != null) {
        await _firebaseAuth.currentUser!.updatePassword(password);
        return true;
      }

    } catch (_) {
      throw Exception();
      return false;
    }
  }


  @override
  // TODO: implement user
  Stream<auth.User?> get user => _firebaseAuth.userChanges();



  Stream<DocumentSnapshot?> get userDetails => _firebaseReference.collection("User").doc(_firebaseAuth.currentUser?.uid ?? "").snapshots();

  @override
  Future<Map<String,Object>?> submitUser({required String email, required String userType, required String uid}) async{
    try{
      var map = <String,Object>{};
      map["email"] = email;
      map["userType"] = userType;
      map["uid"] = uid;
      map["name"] = "";
      map["image"] = "";
      map["phone"] = "";
      map["address"] = "";
      await _firebaseReference.collection("User").doc(uid).set(map);
      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  Future<Map<String, Object>?> updateUser({String? email, String? userType,String? address, String? phone, String? name, String? image, String? password, required String uid}) async {
    try{
      var map = <String,Object>{};
      if(email != null) {
        map["email"] = email;
      }
      if(userType != null) {
        map["userType"] = userType;
      }
      if(name != null){
        map["name"] = name;
      }
      if(image != null){
        map["image"] = image;
      }
      if(phone != null){
        map["phone"] = phone;
      }
      if(address != null){
        map["address"] = address;
      }
      await _firebaseReference.collection("User").doc(uid).update(map);
      return map;
    }catch(_){
      throw Exception();
    }
  }

  @override
  // TODO: implement specificUser
  Stream<DocumentSnapshot<Object?>?> get specificUser => _firebaseReference.collection("User").doc(uid).snapshots();

  @override
  Future<Map<String, Object>?> followUser({required String followedUID, required String followingUID}) async{
    try{
      var map = <String,Object>{};
      map["followerUID"] = followingUID;
      map["followedUID"] = followedUID;

      var key = _firebaseReference.collection("Follows").doc(followedUID).collection("list").doc().id;
      await _firebaseReference.collection("Follows").doc(followedUID).collection("list").doc(key).set(map);

      return map;

    }catch(_){
      throw Exception();
    }
  }

  @override
  // TODO: implement getAllFollower
  Stream<QuerySnapshot<Object?>?> get getAllFollower => _firebaseReference.collection("Follows").doc(uid).collection("list").snapshots();

  @override
  // TODO: implement getSpecificFollower
  Stream<QuerySnapshot<Object?>?> get getSpecificFollower => _firebaseReference.collection("Follows").doc(followedUID).collection("list").where("followingUID", isEqualTo: followingUID).snapshots();
  
}