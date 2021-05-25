import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/dimensions.dart';
import '../common/check_box.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:get/get.dart';

class PreferenceItem {
  int id;
  String name;
  String imageUrl;
  bool checked;
  PreferenceItem(int id, String name, String imageUrl, bool checked) {
    this.id = id;
    this.imageUrl = imageUrl;
    this.name = name;
    this.checked = checked;
  }
}

bool isChecked(PreferenceItem item) {
  // check if the item is in the user's preferences
}

class Preferences extends StatefulWidget {
  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preferences> {
  List<PreferenceItem> listItems = [
    PreferenceItem(1, "Burger", "burger.jpg", false),
    PreferenceItem(1, "Japonais", "japanese.jpg", true),
    PreferenceItem(1, "Pizza", "pizza.jpg", true),
    PreferenceItem(1, "Thaï", "thai.jpg", false),
    PreferenceItem(1, "Oriental", "oriental.jpg", true),
    PreferenceItem(1, "Burger", "burger.jpg", false),
  ];

  List<PreferenceItem> userPrefs = [
    PreferenceItem(1, "Pizza", "pizza.jpg", true),
    PreferenceItem(1, "Japonais", "japanese.jpg", true),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: ThemeColors.backgroundColor,
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 40.0),
                        child: Center(
                            child: Text(
                          "Mes préférences",
                          style: TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 40.0, left: 10.0),
                          child: CircleAvatar(
                            // backgroundColor: Colors.brown.shade800,
                            child: Text('AH'),
                          ))
                    ]),
                    Row(children: [
                      Expanded(
                          child: GridView.count(
                        shrinkWrap: true,
                        // crossAxisCount is the number of columns
                        crossAxisCount: 2,
                        // This creates two columns with two items in each column
                        children: listItems
                            .asMap()
                            .entries
                            .map((data) => InkWell(
                                onTap: () {
                                  onClick(data.key);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: AssetImage("assets/images/" +
                                                data.value.imageUrl),
                                            fit: BoxFit.fitHeight,
                                          )),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 3),
                                    ),
                                    Container(
                                      foregroundDecoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(20),
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                    Center(
                                        child: Text(data.value.name,
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white),
                                            textAlign: TextAlign.center)),
                                    data.value.checked
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.white),
                                                  child: Icon(
                                                    Icons.check,
                                                    color:
                                                        Colors.green.shade300,
                                                  )),

                                              // value: isChecked(data),
                                            ))
                                        : Container(),
                                  ],
                                )))
                            .toList(),
                      ))
                    ]),
                  ],
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        Get.snackbar(
                            "succès:", "Vos préférences sont sauvegardés",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Container(
                          height: SizeConfig.screenHeight * 0.053,
                          width: SizeConfig.screenWidth * .355,
                          decoration: BoxDecoration(
                            color: ThemeColors.mainPink,
                            borderRadius: BorderRadius.circular(12.00),
                          ),
                          child: Center(
                            child: Text(
                              "Sauvegarder",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void onClick(int indice) {
    setState(() {
      var tmp = listItems;
      tmp[indice].checked = !listItems[indice].checked;
      listItems = tmp;
    });
  }

  bool isChecked(int indice) {
    var item = listItems[indice];
    return userPrefs.contains(item);
  }

  void onClick2(int indice) {
    var item = listItems[indice];
    if (item.checked) {
      userPrefs.remove(item);
    } else {
      userPrefs.add(item);
    }

    setState(() {
      userPrefs = userPrefs;
    });
  }

  void save() {
    print(userPrefs.length);
  }
}
