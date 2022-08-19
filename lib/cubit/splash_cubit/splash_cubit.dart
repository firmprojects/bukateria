import 'package:bloc/bloc.dart';
import 'package:bukateria/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../my_preference.dart';


part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository _authRepository;
  SplashCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SplashState.initial());


  void checkCredentials(String userType, String uid) async {
    emit(state.copyWith(userType: userType,uid: uid));

    //if (!state.isValid) return;

    MyPref myPref = MyPref.getInstance();
    if(uid == "") {
      myPref.getData().then((value) {
        print("----------------------${value}");
        if (value == "ONBOARD" || value == "BOTH"){
          emit(state.copyWith(status: SplashStatus.signup));
        }else{
          emit(state.copyWith(status: SplashStatus.onboard));
        }
      });
    }else{
      print("----------------------${userType}");
      if(userType == "vendor"){
          emit(state.copyWith(status: SplashStatus.vendorHome));
      }else{
          emit(state.copyWith(status: SplashStatus.home));
      }
    }

   /* try {
      await _authRepository.updateUser(userType: state.userType, uid: state.uid);
      emit(state.copyWith(status: SplashStatus.success));
    } catch (_) {
      emit(state.copyWith(status: SplashStatus.error));
    }*/
  }

/*  void setUserType(String userType) async {
    MyPref.getInstance().setData(userType: userType);
    emit(state.copyWith(status: SplashStatus.saved));
  }*/

  getUser(){
    return _authRepository.user;
  }
}
