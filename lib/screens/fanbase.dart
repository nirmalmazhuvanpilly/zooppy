import 'package:flutter/material.dart';

class Fanbase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.redAccent,
        elevation: 20,
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            print("Back to Previous Page");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Fanbase",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: DropdownBar(),
    );
  }
}

class DropdownBar extends StatefulWidget {
  @override
  _DropdownBarState createState() => _DropdownBarState();
}

class _DropdownBarState extends State<DropdownBar> {
  String dropdownvalue = "All";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // DropdownButton<String>(),
          // DropdownButton<String>(),
        ],
      ),
    );
  }
}
