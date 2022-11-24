import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luminouskeytask/core/shared_preferance.dart';
import 'package:luminouskeytask/features/home/home.export.dart';
import 'package:luminouskeytask/features/home/presentation/pages/pages.export.dart';
import 'loginbloc.export.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);
  LoginBloc() : super(LoginInitial()) {
    on<GetLoginEvent>(_saveUser);
  }
  Future<void> _saveUser(GetLoginEvent event, Emitter<LoginState> emit) async {
    var context = event.context;
    String email = event.email;
    String password = event.passWord;
    List<Users> users = event.users;
    for(var user in users){
      if(user.email == email && user.password == password){
        Map userMap= user.toMap();
        String userJson = json.encode(userMap);
        await CacheHelper.saveData(key: 'Login_User', value: userJson);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        emit(SuccessLoginState(loginUser: user));
        break;
      }
    }

  }

}
