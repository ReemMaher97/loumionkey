import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luminouskeytask/core/network/api_request.dart';
import 'package:luminouskeytask/features/home/data/data.export.dart';
import 'home_bloc.export.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(HomeInitial()) {
    on<GetDoctorsEvent>(_getDoctor);
  }

  Future<void> _getDoctor(GetDoctorsEvent event ,Emitter<HomeState> emit) async {

    String url ="https://flutter.linked4med.com/api/Doctors/GetDoctorsInfo";
    String username = 'FlutterDev@LuminousKey.com';
    String password = 'Flutter2023';
    String basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:$password'));

    var response = await Api.instance.apiRequest(RequestType.Get,url, <String, String>{'authorization': basicAuth},{});
    if (response !=null) {
      List<Doctor> doctors=[];
         // doctors=response;
          for(var item in response)
            {
              doctors.add( Doctor.fromJson(item));
            }
      emit(SuccessGetDoctorState(doctors: doctors));

    }

  }
}
