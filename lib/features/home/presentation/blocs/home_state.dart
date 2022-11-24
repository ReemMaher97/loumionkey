
import '../../home.export.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class SuccessGetDoctorState extends HomeState {
  List<Doctor> ?doctors;
  SuccessGetDoctorState({this.doctors});
}