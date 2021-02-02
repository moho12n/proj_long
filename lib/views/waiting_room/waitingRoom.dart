// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_long/views/preferences/preferences_page.dart';

class WaitingRoom extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class Person {
  String name;
  String pseudo;

  Person({this.name, this.pseudo});
}

List list = [
  Person(name: "Mehdi", pseudo: "AAA"),
  Person(name: "Mehdi", pseudo: "AAA"),
  Person(name: "Mehdi", pseudo: "AAA")
];
List<Widget> test = [
  ListTile(
    title: Text(
      'Title of messages comes here',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    subtitle: Text("Text"
        // pair.asPascalCase,
        // style: _font,
        ),
    leading: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 44,
        maxHeight: 44,
      ),
      child: CircleAvatar(
          backgroundColor: Colors.brown.shade800, child: Text('AH')),
    ),
  ),
  ListTile(
    title: Text(
      'Title of messages comes here',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    subtitle: Text("Text"
        // pair.asPascalCase,
        // style: _font,
        ),
    leading: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 44,
        maxHeight: 44,
      ),
      child: CircleAvatar(
          backgroundColor: Colors.brown.shade800, child: Text('AH')),
    ),
  ),
  ListTile(
    title: Text(
      'Title of messages comes here',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    subtitle: Text("Text"
        // pair.asPascalCase,
        // style: _font,
        ),
    leading: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
        maxWidth: 44,
        maxHeight: 44,
      ),
      child: CircleAvatar(
          backgroundColor: Colors.brown.shade800, child: Text('AH')),
    ),
  ),
];

class _WaitingRoomState extends State<WaitingRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff37393B),
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.cancel_sharp,
                color: Color(0xff37393B),
              ),
              onPressed: () {
                // cancel salon
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (BuildContext context) => SettingsPage()));
              },
            ),
          ],
        ),
        body: Container(
            child: Column(
          children: [
            if (test.length == 0)
              Center(
                  child: Column(
                children: [
                  Text("Waiting for people to join",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff37393B))),
                  CircularProgressIndicator(
                    strokeWidth: 1,
                    semanticsLabel: "Hello world",
                  )
                ],
              ))
            else
              Text("Now attending : ",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff37393B))),
            Container(
                height: 570,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                        title: Text(
                          list[index].name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(list[index].pseudo
                            // pair.asPascalCase,
                            // style: _font,
                            ),
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 44,
                            maxHeight: 44,
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: Text('AH')),
                        ),
                        trailing: Icon(
                          Icons.check_rounded,
                          color: Colors.green,
                        ));
                  },
                )),
            RaisedButton(
              onPressed: () {},
              child: const Text('Start', style: TextStyle(fontSize: 20)),
            )
          ],
        )));
  }
}

void onButtonPressed() {
  test.length == 0 ? null : print("hello");
}
