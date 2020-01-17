import 'package:barty/model/Bar.dart';
import 'package:barty/viewModel/BarsVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:scoped_model/scoped_model.dart';

class BarMap extends StatelessWidget {
  final String accesToken =
      "pk.eyJ1IjoiZ2FsbGlvdGwiLCJhIjoiY2s1Z3YyYWdnMGF4ZjNtcGJlb3g0eXl1NyJ9.QHFMRv268qg7D797q82IKw";
  final String mapId = "mapbox.streets";

  Widget buildEmptyMap() {
    return FlutterMap(
      options: MapOptions(
        minZoom: 10.0,
        center: LatLng(51.5, -0.09), // TODO: here location of the user
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': accesToken,
            'id': mapId,
          },
        ),
      ],
    );
  }

  Widget buildMapWithBars(List<Bar> bars) {
    List<Marker> markers = [];

    for (Bar bar in bars) {
      markers.add(
        Marker(
          width: 20.0,
          height: 20.0,
          point: bar.coordinates,
          builder: (ctx) => Container(
            child: Icon(Icons.location_on),
          ),
        ),
      );
    }

    return FlutterMap(
      options: MapOptions(
        minZoom: 10.0,
        center: LatLng(51.5, -0.09), // TODO: here location of the user
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': accesToken,
            'id': mapId,
          },
        ),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BarsViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Bar>>(
          future: model.bars,
          builder: (_, AsyncSnapshot<List<Bar>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return buildEmptyMap();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var bars = snapshot.data;
                  return buildMapWithBars(bars);
                }
            }
            return Center(child: Text("error"));
          },
        );
      },
    );
  }
}
