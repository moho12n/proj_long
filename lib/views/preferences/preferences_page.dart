import 'package:flutter/material.dart';
import '../common/check_box.dart';

class PreferenceItem {
  int id;
  String name;
  bool checked;
  PreferenceItem(int id, String name, bool checked) {
    this.id = id;
    this.name = name;
    this.checked = checked;
  }
}

List<PreferenceItem> listItems = [
  PreferenceItem(1, "Oriental", false),
  PreferenceItem(1, "Japonais", false),
  PreferenceItem(1, "Japonais", true),
  PreferenceItem(1, "Japonais", true),
  PreferenceItem(1, "Japonais", true),
];
bool isChecked(PreferenceItem item) {
  // check if the item is in the user's preferences
}

class Preferences extends StatefulWidget {
  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preferences> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                        backgroundColor: Colors.brown.shade800,
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
                        .map((data) => GestureDetector(
                            onTap: () {
                              print("AHLLAAAAA");
                            },
                            child: Stack(
                              children: [
                                Container(
                                  foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                    // backgroundBlendMode: BlendMode.saturation,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/pizza.jpg"),
                                      fit: BoxFit.fill,
                                    )),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    // color: Colors.green,
                                  ),
                                ),
                                Center(
                                    child: Text(data.name,
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                        textAlign: TextAlign.center)),
                                data.checked
                                    ? Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            child: CustomCheckbox(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                value: data.checked ?? true)

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
}
