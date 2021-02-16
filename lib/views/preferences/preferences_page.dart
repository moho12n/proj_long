import 'package:flutter/material.dart';
import '../common/check_box.dart';
import 'package:proj_long/views/tools/colors.dart';

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              save();
            },
            child: Text("Save"),
            backgroundColor: ThemeColors.mainPink,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Color(0x1F2022),
          body: SingleChildScrollView(
            child: Column(
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
                                      image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/" + data.value.imageUrl),
                                    fit: BoxFit.fill,
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
                                            fontSize: 22, color: Colors.white),
                                        textAlign: TextAlign.center)),
                                data.value.checked
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: CustomCheckbox(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                value:
                                                    data.value.checked ?? true)

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
