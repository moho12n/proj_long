import 'package:flutter/material.dart';
import 'package:proj_long/controllers/homePage/homepage_controller.dart';
import 'package:proj_long/views/home_page/widgets/circular_menu.dart';
import 'package:proj_long/views/home_page/widgets/circular_menu_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proj_long/views/pop_ups/create_room_popup.dart';
import 'package:proj_long/views/pop_ups/join_room_popup.dart';
import 'package:proj_long/views/preferences/preferences_page.dart';
import 'package:proj_long/views/profile_page/edit_profile.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:proj_long/views/tools/dimensions.dart';
import 'package:get/get.dart';

//Global Variables
const LatLng _center = const LatLng(48.8566, 2.3522);
Set<Marker> markers = {};

class HomePage extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());
  List<Widget> screensChoice = <Widget>[
    HomePageScreen(),
    Preferences(),
    EditProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(onWillPop: () {
      // The function to quit the app
      return homePageController.quitApp();
    }, child: Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ThemeColors.backgroundColor,
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                backgroundColor: ThemeColors.backgroundColor,
                title: Text('',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //   color: Color(0xff5a69be),
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                title: Text('',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //  color: Color(0xff5a69be),
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text('',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      //  color: Color(0xff5a69be),
                    )),
              ),
            ],
            currentIndex: homePageController.selectedIndex.value,
            showUnselectedLabels: true,
            selectedItemColor: ThemeColors.mainPink,
            unselectedItemColor: Color(0xff707070).withOpacity(0.6),
            selectedLabelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              color: Color(0xff5a69be),
            ),
            unselectedLabelStyle: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 12,
                color: Color(0xff707070).withOpacity(0.6)),
            onTap: (value) {
              homePageController.selectedIndex(value);
              homePageController.queue.add(value);
            }),
        backgroundColor: ThemeColors.backgroundColor,
        body: Center(
          child:
              screensChoice.elementAt(homePageController.selectedIndex.value),
        ),
      );
    }));
  }
}

class HomePageScreen extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  //******** Map variables */
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  //******** OnMapCreated */
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    _setMapStyle();
  }

  Future _setMapStyle() async {
    final controller = await _controller.future;
    controller.setMapStyle(homePageController.darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
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
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: getHeight(200),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: Colors.black,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.5),
                  Colors.transparent
                ],
              ),
            ),
            child: Padding(
                padding: EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  "Salons",
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontSize: 32,
                    color: Color(0xffeceded),
                  ),
                )),
          ),
        ),
      ],
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
        icon: Icons.exit_to_app,
        color: ThemeColors.mainGrey,
        onTap: () {
          showPopUpJoinRoom();
          print("1");
        }),
    CircularMenuItem(
        icon: Icons.add,
        color: ThemeColors.mainGrey,
        onTap: () {
          showPopUpCreateRoomConfirmation();
        }),
    CircularMenuItem(
        icon: Icons.person_add_alt_1_outlined,
        color: ThemeColors.mainGrey,
        onTap: () {
          print("4");
        }),
  ],
);
