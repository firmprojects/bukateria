import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bukateria/repository/auth_repository.dart';
import 'package:bukateria/repository/postRepository/post_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final AuthRepository _authRepository;
  final PostRepository _postRepository;

  PostCubit(
      {required AuthRepository authRepository,
      required PostRepository postRepository})
      : _authRepository = authRepository,
        _postRepository = postRepository,
        super(PostState.initial());

  void titleChanged(String value) {
    emit(state.copyWith(title: value, status: PostStatus.initial));
  }

  void descriptionChanged(String value) {
    emit(state.copyWith(description: value, status: PostStatus.initial));
  }

  void typeOfCuisineChanged(String value) {
    emit(state.copyWith(typeOfCuisine: value, status: PostStatus.initial));
  }

  void recipeCategoryChanged(String value) {
    emit(state.copyWith(recipeCategory: value, status: PostStatus.initial));
  }

  void priceChanged(String value) {
    emit(state.copyWith(price: value, status: PostStatus.initial));
  }

  void locationChanged(String value) {
    emit(state.copyWith(location: value, status: PostStatus.initial));
  }

  void delvieryTypeChanged(String value) {
    emit(state.copyWith(deliveryType: value, status: PostStatus.initial));
  }

  void productStatusChanged(String value) {
    emit(state.copyWith(productStatus: value, status: PostStatus.initial));
  }

  void imageChanged(File value) {
    emit(state.copyWith(image: value, status: PostStatus.initial));
  }

  void ingredientsChanged(List<String> value) {
    emit(state.copyWith(ingredients: value, status: PostStatus.initial));
  }

  void methodsChanged(List<Map<String, dynamic>> value) {
    emit(state.copyWith(methods: value, status: PostStatus.initial));
  }

  void PostWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: PostStatus.submitting));
    /* try {
      await _authRepository.post(email: state.email, password: state.password);
      emit(state.copyWith(status: PostStatus.success));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }*/
  }

  void postExploreCredentials(String imageName, String uid) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository
          .uploadImage(imageFile: state.image!, name: imageName, uid: uid)
          .then((value) async {
        print("--------------- ${value} ----------");
        _postRepository
            .addExplorePost(
                title: state.title ?? "",
                description: state.description ?? "",
                productStatus: state.productStatus ?? "init",
                image: value ?? "",
                uid: uid)
            .then((value) {
          emit(state.copyWith(
              status: PostStatus.save, key: value?["key"].toString()));
        });
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  void updateExploreStatus(
    String key,
    String uid,
  ) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository.updateExplorePost(key: key, uid: uid).then((value) {
        emit(state.copyWith(status: PostStatus.publish));
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  getExplore() {
    return _postRepository.getExplores;
  }

  getMenus() {
    return _postRepository.getMenus;
  }

  getRecipes() {
    return _postRepository.getAllRecipe;
  }

  getAllRecipes() {
    return _postRepository.getAllRecipe;
  }

  getRelatedRecipes(String uid) {
    _postRepository.recipeKey = uid;
    return _postRepository.getRelatedRecipe;
  }

  getRelatedMenus(String uid) {
    _postRepository.menuKey = uid;
    return _postRepository.getRelatedMenu;
  }

  getRelatedExplore(String uid) {
    _postRepository.exploreKey = uid;
    return _postRepository.getRelatedExplore;
  }

  getUser() {
    return _authRepository.user;
  }

  getSpecificUser(String uid) {
    _authRepository.uid = uid;
    return _authRepository.specificUser;
  }

  getIngredients(String key) {
    _postRepository.ingredientsKey = key;
    return _postRepository.getIngredients;
  }

  getMethods(String key) {
    _postRepository.methodKey = key;
    return _postRepository.getMethods;
  }

  getSpecificFollow(String followedUID) {
    _authRepository.followedUID = followedUID;
    return _authRepository.getSpecificFollower;
  }

  getAllFollowers(String followedUID) {
    _authRepository.followedUID = followedUID;
    return _authRepository.getAllFollower;
  }

  void postMenuCredentials(String imageName, String uid) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository
          .uploadImage(imageFile: state.image!, name: imageName, uid: uid)
          .then((value) async {
        print("--------------- ${value} ----------");
        _postRepository
            .addMenuPost(
                title: state.title ?? "",
                description: state.description ?? "",
                productStatus: state.productStatus ?? "init",
                image: value ?? "",
                price: state.price ?? "",
                location: state.location ?? "",
                deliveryType: state.deliveryType ?? "",
                uid: uid)
            .then((value) {
          emit(state.copyWith(
              status: PostStatus.save, key: value?["key"].toString()));
        });
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  void updateMenuStatus(
    String key,
    String uid,
  ) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository.updateMenuPost(key: key, uid: uid).then((value) {
        emit(state.copyWith(status: PostStatus.publish));
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  void postRecipeCredentials(String imageName, String uid) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository
          .uploadImage(imageFile: state.image!, name: imageName, uid: uid)
          .then((value) async {
        print("--------------- ${value} ----------");
        _postRepository
            .addRecipePost(
                title: state.title ?? "",
                description: state.description ?? "",
                productStatus: state.productStatus ?? "init",
                image: value ?? "",
                category: state.recipeCategory ?? "",
                ingredients: state.ingredients ?? [],
                methods: state.methods ?? [],
                cuisine: state.typeOfCuisine ?? "",
                uid: uid)
            .then((value) {
          emit(state.copyWith(
              status: PostStatus.save, key: value?["key"].toString()));
        });
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  void updateRecipeStatus(
    String key,
    String uid,
  ) async {
    if (!state.isValidExplore) return;
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _postRepository.updateRecipePost(key: key, uid: uid).then((value) {
        emit(state.copyWith(status: PostStatus.publish));
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  void addFollow(String followedUID, String followingUID) async {
    emit(state.copyWith(status: PostStatus.submitting));
    try {
      _authRepository
          .followUser(followedUID: followedUID, followingUID: followingUID)
          .then((value) {
        emit(state.copyWith(
            status: PostStatus.success, key: value?["key"].toString()));
      });
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }

  Future<void> getCurrentPosition() async {
    var position = await _authRepository.determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    // String address =  '${place.locality}, ${place.administrativeArea}, ${place.country}';
    String address =
        '${place.subAdministrativeArea}, ${place.administrativeArea}';
    Map<String, dynamic> map = {};
    map["lat"] = position.latitude;
    map["long"] = position.longitude;
    map["address"] = address;
    emit(
        state.copyWith(status: PostStatus.locationFound, currentLocation: map));
  }

/*  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

  }*/
}
