import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/place/ui/widgets/card_image_list.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'package:platzi_trips_app_avanzado/widgets/gradient_back.dart';
class HeaderAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    UserBloc userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        print(snapshot);

         switch (snapshot.connectionState){

            case ConnectionState.waiting:
            case ConnectionState.none:
              return CircularProgressIndicator();

            case ConnectionState.active:
            case ConnectionState.done:
            default:              
              return showPlacesData(snapshot);
          }

      },
    );

  }

  
  Widget showPlacesData(AsyncSnapshot snapshot){
    print(snapshot.data);
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBack(height: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      UserM user = UserM(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL
      );

      return Stack(
        children: [
          GradientBack(height: 250.0),
          CardImageList(user)
        ],
      );
    }
  }


}