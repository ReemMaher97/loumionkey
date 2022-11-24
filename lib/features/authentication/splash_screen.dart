import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luminouskeytask/core/shared_preferance.dart';
import 'package:luminouskeytask/core/utils/helper/helper.export.dart';
import 'package:luminouskeytask/core/utils/utlis.dart';
import 'package:luminouskeytask/features/home/presentation/presentation.export.dart';

import 'authentication.export.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
    ).then(
          (value) => {
           checkLoginUser()
          // Navigator.push(
          // context,
          // MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          // )
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

        return Scaffold(
          body: LayoutBuilder(
              builder: (_, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children:[
                              Container(

                                child: Image.asset(
                                  ImageHelper.splash,
                                  fit: BoxFit.cover,
                                  height: getScreenHeight(context),
                                  width: double.infinity,
                                  //opacity: const AlwaysStoppedAnimation<double>(0.6),
                                  colorBlendMode:BlendMode.srcATop ,
                                  color: Colors.lightBlueAccent.shade100.withOpacity(.5),
                                ),
                              ),
                      const Positioned(
                        // The Positioned widget is used to position the text inside the Stack widget
                          bottom: 150,
                           child: Center(
                               child: Text("Care And Cure \n Is Our Goals",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                           ),),
                               Positioned(
                                // The Positioned widget is used to position the text inside the Stack widget
                                bottom: 70,
                                child: Center(
                                    child:  TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.only(
                                                left: 60,
                                                right: 60,
                                                top: 10,
                                                bottom: 10
                                            ),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Get Started',
                                        style: TextStyle(color: Colors.blueAccent, fontSize: 25.0,fontWeight: FontWeight.bold),
                                      ),),

                                ),),

                            ]

                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        );

  }

  void checkLoginUser() async {
    String jsonUser=CacheHelper.getData(key: 'Login_User')??"";

    if (jsonUser.isEmpty ) {
      openNewPage(context,const WelcomeScreen(), popPreviousPages: true);
    }
    else {
      openNewPage(context, const Home(), popPreviousPages: true);
    }
  }
}