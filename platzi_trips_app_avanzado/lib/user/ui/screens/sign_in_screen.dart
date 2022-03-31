import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/widgets/button_green.dart';
import 'package:platzi_trips_app_avanzado/widgets/gradient_back.dart';


class SignInScreen extends StatefulWidget {

  SignInScreen();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  late UserBloc userBloc;
  late double screenWidht;
  @override
  Widget build(BuildContext context) {
    screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        }else{
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack( height:null),          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: screenWidht,
                  child:const Text("Bienvenido \n Esta es tu aplicación de viajes",
                    style:  TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
              ButtonGreen(
                text: "Login con Gmail",
                onPressed: (){  
                    userBloc.signOut();
                    userBloc.signIn().then((UserCredential user) {
                      userBloc.updateUserData(
                        UserM(
                          uid: user.user!.uid,
                          name:  user.user!.displayName ?? "" , 
                          email: user.user!.email ?? "", 
                          photoURL: user.user!.photoURL ?? ""));
                    });
                },
                ancho: 300.0,
                alto: 50.0
              )
            ],
          )
        ],
      ),
    );
  }

}