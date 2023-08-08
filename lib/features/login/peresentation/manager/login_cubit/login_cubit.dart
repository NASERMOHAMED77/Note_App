import 'package:apinoteapp/core/cache.dart';
import 'package:apinoteapp/features/login/data/repo/repo.dart';
import 'package:apinoteapp/features/login/peresentation/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/persentation/view/home/home_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.signRepo) : super(LoginLoadingState());
  SignRepo signRepo;
  signUp(String url, Map data, var context) async {
    try {
      await signRepo.postuserReq(url, data);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (c) => HomeScreen()), (route) => false);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
  }

  signIn(String url, Map data, var context) async {
    try {
      var x = await signRepo.postuserReq(url, data);
      CacheLocal.insertDataIntoCache(key: 'id', value: x['id']);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (c) => HomeScreen()), (route) => false);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
