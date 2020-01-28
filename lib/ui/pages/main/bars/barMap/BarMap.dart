import 'package:barty/model/Bar.dart';
import 'package:barty/ui/pages/bar/BarPage.dart';
import 'package:barty/ui/style/style.dart';
import 'package:barty/viewModel/BarsVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:scoped_model/scoped_model.dart';

class BarMap extends StatelessWidget {
  final String accesToken =
      "pk.eyJ1IjoiZ2FsbGlvdGwiLCJhIjoiY2s1Z3YyYWdnMGF4ZjNtcGJlb3g0eXl1NyJ9.QHFMRv268qg7D797q82IKw";
  final String mapId = "mapbox.streets";

  final MapOptions mapOptions = MapOptions(
    minZoom: 10.0,
    center: LatLng(48.86, 2.34), // by default init in Paris
  );

  LayerOptions emptyMap() {
    return TileLayerOptions(
      urlTemplate: "https://api.tiles.mapbox.com/v4/"
          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
      additionalOptions: {
        'accessToken': accesToken,
        'id': mapId,
      },
    );
  }

  Widget buildEmptyMap() {
    return FlutterMap(
      options: mapOptions,
      layers: [
        emptyMap(),
      ],
    );
  }

  Widget buildMapWithBars(List<Bar> bars) {
    List<Marker> markers = [];

    for (Bar bar in bars) {
      markers.add(
        Marker(
          width: 40.0,
          height: 40.0,
          point: bar.coordinates,
          builder: (ctx) => IconButton(
            onPressed: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                  builder: (context) => BarPage(bar: bar),
                ),
              );
            },
            icon: Icon(Icons.location_on, color: deepBlue),
          ),
        ),
      );
    }

    return FlutterMap(
      options: mapOptions,
      layers: [
        emptyMap(),
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
        return FutureBuilder<Position>(
          future: model.userLocation,
          builder: (_, AsyncSnapshot<Position> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var position = snapshot.data;
                  mapOptions.center =
                      LatLng(position.latitude, position.longitude);
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
                }
            }
            return Center(child: Text("error"));
          },
        );
      },
    );

    /*return ScopedModelDescendant<BarsViewModel>(
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
    );*/
  }
}
