import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/place/model/place.dart';
import 'package:platzi_trips_app_avanzado/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app_avanzado/user/model/user.dart';
import 'card_image.dart';


class CardImageList extends StatefulWidget {

  late UserBloc userBloc;
  late UserM user;

  CardImageList(@required this.user);

    
  @override
  State<StatefulWidget> createState() {
      return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    widget.userBloc = BlocProvider.of(context);

    return Container(
      height: 350.0,
      child: StreamBuilder(
        stream: widget.userBloc.placesStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              return listViewPlaces( widget.userBloc.buildPlaces(snapshot.data.docs, widget.user));

            case ConnectionState.done:
              return listViewPlaces(widget.userBloc.buildPlaces(snapshot.data.docs, widget.user));
            default:
              return listViewPlaces( widget.userBloc.buildPlaces(snapshot.data.docs, widget.user));
          }
        },
      ),
    );
  }

  Widget listViewPlaces(List<Place> places) {

    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        widget.userBloc.likePlace(place, widget.user.uid.toString());
        place.likes = place.liked? place.likes + 1 : place.likes - 1;
        widget.userBloc.placeSelectedSink.add(place);
      });

    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;

    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return GestureDetector(
          onTap: () {
            print("CLICK PLACE: ${place.name}");
            widget.userBloc.placeSelectedSink.add(place);
          },
          child: CardImage(
            pathImage: place.urlImage,
            width: 300.0,
            height: 250.0,
            left: 20.0,
            iconData: place.liked ? iconDataLiked : iconDataLike,
            onPressedFabIcon: () {
              setLiked(place);
            },
            internet: true,
          ),
        );
      }).toList(),
    );
  }

}
