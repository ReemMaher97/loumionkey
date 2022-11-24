
import 'package:flutter/material.dart';
import 'package:luminouskeytask/core/utils/helper/helper.export.dart';
import 'package:luminouskeytask/core/utils/utils.export.dart';
import 'package:luminouskeytask/core/utils/utlis.dart';
import 'package:luminouskeytask/core/utils/widgets/widgit.export.dart';
import 'package:luminouskeytask/features/authentication/presentation/blocs/loginbloc.export.dart';
import 'package:luminouskeytask/features/home/home.export.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DataBase handler;
  List<Users> users=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() async {
      users =await handler.retrieveUsers();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          width: double.infinity,
          decoration:  const BoxDecoration(
            color: Colors.white,
            //image: DecorationImage(image: AssetImage(ImageHelper.welcome), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Center(child: Image.asset(ImageHelper.buy ,)),
                // const SizedBox(height: 100,),
                Text("Welcome",
                  style: TextStyle(
                    fontSize: getScreenWidth(context) * 0.1,
                    color: ColorHelper.primaryColor,
                    //fontWeight: FontWeight.bold,
                    fontFamily: FontsHelper.cairo,
                  )
                  ,),
                // Text("This app will help you explore things in market ",
                //   style: TextStyle(
                //     fontSize: getScreenWidth(context) * 0.045,
                //     color: ColorHelper.primaryColor,
                //     //fontWeight: FontWeight.bold,
                //     fontFamily: FontsHelper.cairo,
                //
                //   )
                //   ,textAlign: TextAlign.center
                //   ,),
                const SizedBox(height: 20,),
                SizedBox(
                  width:300,
                  height: 45,
                  child: TextFieldApp(
                    borderRadius: 10,
                    controller: emailController,
                    labelText: "  Email Address",
                    labelStyle: const TextStyle(color: ColorHelper.primaryColor,fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width:300,
                  height: 45,
                  child: TextFieldApp(
                    borderRadius: 10,
                    controller: passwordController,
                    labelText: "  Password",
                    labelStyle: const TextStyle(color: ColorHelper.primaryColor,fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: ButtonApp(
                      width:200,
                      height: 45,
                      onPressed: ()=> onLogin(context),
                      color: ColorHelper.primaryColor2,
                      text: "Login",
                      borderRadius: 10,
                      textStyle: const TextStyle(fontFamily: FontsHelper.cairo,fontWeight: FontWeight.bold,fontSize: 16)),
                  margin: EdgeInsets.fromLTRB(0,0,0,getScreenWidth(context) * 0.05),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    TextButton(onPressed: (){}, child: const Text("Forget Password",style:  TextStyle(fontFamily: FontsHelper.cairo,color: ColorHelper.primaryColor,fontSize: 14)),),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("|"),
                    ),
                    TextButton(
                        onPressed: () {  },
                        child: const Text("Register",style:  TextStyle(fontFamily: FontsHelper.cairo,color: ColorHelper.primaryColor,fontSize: 14))
                    )

                  ],
                )

              ],

            ),
          ),
        )
    );
  }
  void onLogin(BuildContext? context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ShowToastSnackBar.showSnackBars(context!,
          message:'email_password_must_be_not_empty');
      return;
    }
    LoginBloc.get(context).add(GetLoginEvent(
      context:context!,
      email: emailController.text.trim(),
      passWord: passwordController.text,
      users: users
    ),
    );
  }

}
