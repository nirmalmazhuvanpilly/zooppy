import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zooppy/services/home_api.dart';

// ignore: must_be_immutable
class HoorayPopUp extends StatefulWidget {
  final BuildContext context;
  //
  HoorayPopUp({this.context});

  @override
  _HoorayPopUpState createState() => _HoorayPopUpState();
}

class _HoorayPopUpState extends State<HoorayPopUp> {
  var walletBalance;

  @override
  void initState() {
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (walletBalance == null) {
      Container();
    } else {
      //To Display Pop Up
      Future.delayed(Duration.zero, () => showHooray(context));
    }

    return Container();
  }

  void showHooray(BuildContext context) async {
    AlertDialog alert = AlertDialog(
      title: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.network(
                  "https://moviepremiereleague.s3.ap-south-1.amazonaws.com/assets/Hooray_.png",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  "You have ₹$walletBalance in your wallet. Join Leagues and Win more",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5),
                  ),
                ),
                child: Text("Start Playing Games"),
                onPressed: () {
                  print("Clicked");
                },
              )
            ],
          ),
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void fetchData() async {
    var walletDetailsPopUpApi = await HomeAPI().walletDetailsRequest();
    // print(walletDetailsPopUpApi);

    if (walletDetailsPopUpApi['success']) {
      setState(() {
        walletBalance = walletDetailsPopUpApi['wallet_balance'];
        // print(walletBalance);
      });
    }
  }
}
