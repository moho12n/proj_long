import 'package:flutter/material.dart';
import 'package:proj_long/views/home_page/widgets/circular_menu.dart';
import 'package:proj_long/views/home_page/widgets/circular_menu_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

//Global Variables
const LatLng _center = const LatLng(48.8566, 2.3522);
Set<Marker> markers = {};
String _darkMapStyle;
String _lightMapStyle;

class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Future _loadMapStyles() async {
  _darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
  _lightMapStyle = await rootBundle.loadString('assets/map_styles/light.json');
}

class _MyAppState extends State<HomePage> {
  //******** Map variables */
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  //******** OnMapCreated */
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    _setMapStyle();
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyles();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
    controller.setMapStyle(_darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: GoogleMap(
                    //markers: markers,

                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false, // not sure if we should keep it
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ))),
            addCircularMenu,
          ],
        ),
      ),
    );
  }
}

Widget addCircularMenu = CircularMenu(
  alignment: Alignment.bottomCenter,
  toggleButtonIconColor: ThemeColors.mainGrey,
  toggleButtonAnimatedIconData: AnimatedIcons.add_event,
  toggleButtonColor: ThemeColors.mainPink,
  radius: 80,
  items: [
    CircularMenuItem(
        icon: Icons.home, color: ThemeColors.mainGrey, onTap: () {}),
    CircularMenuItem(
        icon: Icons.search, color: ThemeColors.mainPink, onTap: () {}),
    CircularMenuItem(
        icon: Icons.settings, color: ThemeColors.mainGrey, onTap: () {}),
  ],
);
