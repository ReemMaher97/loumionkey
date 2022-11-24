import 'package:flutter/material.dart';
import 'package:luminouskeytask/config/config.export.dart';
import 'package:luminouskeytask/core/shared_preferance.dart';

import 'core/utils/helper/fonts_helper.dart';
import 'core/utils/utils.export.dart';
import 'features/authentication/splash_screen.dart';
import 'features/home/home.export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DataBase handler;
  Future<int> addUsers() async {
    Users firstUser =
    Users(id: 1,name: "ahmad khaled", email: "ah.khaled@yahoo.com",password: "1234" , phoneNumber: "079854621");
    Users secondUser =
    Users(id: 2,name: "ali yousef", email: "ali.yousef@yahoo.com",password: "1234" , phoneNumber: "0798546587");
    Users thirdUser =
    Users(id: 3,name: "maha jammal", email: "ma.jammal@yahoo.com",password: "1234" , phoneNumber: "0798548632");
    Users fourthUser =
    Users(id: 4,name: "rana hammad", email: "rana.hammad@yahoo.com",password: "1234" , phoneNumber: "079854645");

    List<Users> users = [firstUser, secondUser,thirdUser,fourthUser];
    return await handler.insertUsers(users);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      await addUsers();
      setState(() {});
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return  listOfBlocProviders(
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'LuminousKey Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: FontsHelper.cairo,
        ),

        home: const SplashScreen(),
      ),
    );
  }
}

