import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luminouskeytask/features/authentication/presentation/blocs/loginbloc.export.dart';
import 'package:luminouskeytask/features/home/presentation/blocs/home_bloc.export.dart';

MultiBlocProvider listOfBlocProviders({Widget? child}) {
  return MultiBlocProvider(
    providers: [
      ///Authentication Feature Blocs
      BlocProvider<LoginBloc>(create: (context)=> LoginBloc(),),
      BlocProvider<HomeBloc>(create: (context)=> HomeBloc(),),
    ],
    child: child!,
  );
}