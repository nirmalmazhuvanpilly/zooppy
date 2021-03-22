import 'package:flutter/material.dart';

class NotificationSam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Home",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: ListViewSam(),
    );
  }
}

class ListViewSam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        100,
        (_) => NotificationCard(),
        //This Will generate NotificationCard Widget 100 times in the Listview
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.notifications_none),
              SizedBox(width: 10),
              Text(
                "You won ₹4 from Yes or No",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                "You won ₹4 from Yes or No",
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 10,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ],
      ),
    );
  }
}
