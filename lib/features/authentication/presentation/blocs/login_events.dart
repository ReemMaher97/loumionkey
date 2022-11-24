import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:luminouskeytask/features/home/home.export.dart';

abstract class LoginEvent extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class GetLoginEvent extends LoginEvent{
  final BuildContext context;
  final String email;
  final String passWord;
  final List<Users> users;
  GetLoginEvent({
    required this.context,
    required this.email,
    required this.passWord,
    required this.users,
  });

}