import 'package:flutter/material.dart';

class Coupons extends StatelessWidget {
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
          "Coupons",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: CouponsContainer(),
    );
  }
}

class CouponsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        ApplyCouponClass(),
        CouponClass(),
        CouponClass(),
        CouponClass(),
      ],
    );
  }
}

class ApplyCouponClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Enter Promo Code"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      // suffixIcon: Icon(Icons.call),
                      // fillColor: Colors.blue,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      // hintText: "Enter Amount",
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print("Apply Clicked");
                  },
                  child: Text(
                    "Apply",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CouponClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      // height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Text(
                  "Add 75 and get 150 in your Wallet",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent),
                ),
                child: Text(
                  "ZPYGET150",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Text("Bonus Cash"),
          SizedBox(height: 10),
          Text("Add 75 and get 150 in your Wallet"),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Use this coupon Clicked");
              },
              child: Text(
                "Use this coupon",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
