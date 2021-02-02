// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class WaitingRoomAfter extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class Person {
  String name;
  String pseudo;
  bool status;

  Person({this.name, this.pseudo, this.status});
}

List list = [
  Person(name: "Mehdi", pseudo: "AAA", status: false),
  Person(name: "Mehdi", pseudo: "AAA", status: false),
  Person(name: "Mehdi", pseudo: "AAA", status: true)
];

class _WaitingRoomState extends State<WaitingRoomAfter> {
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
            Text("Status : ",
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
                        trailing: list[index].status == false
                            ? Icon(
                                Icons.check_rounded,
                                color: Colors.green,
                              )
                            : Loading(
                                indicator: BallPulseIndicator(),
                                size: 40,
                                color: Colors.green));
                  },
                )),
            RaisedButton(
              onPressed: () {},
              child: const Text('See result', style: TextStyle(fontSize: 20)),
            )
          ],
        )));
  }
}

void onButtonPressed() {
  list.length == 0 ? null : print("hello");
}
