import 'package:equatable/equatable.dart';
import 'package:luminouskeytask/features/home/data/data.export.dart';

abstract class LoginState extends Equatable {
  @override
  //TODO: implements props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class SuccessLoginState extends LoginState {
  late Users? loginUser;
  SuccessLoginState({this.loginUser});
}