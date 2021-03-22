import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
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
          "My Wallet",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: MyWalletContainer(),
    );
  }
}

class MyWalletContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 50,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.grey[850],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "₹Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.green,
                        // style: BorderStyle.solid,
                        width: 2,
                      ),
                    ),
                    primary: Colors.white,
                    textStyle: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    print("Add Cash Clicked");
                  },
                  child: Text(
                    "Add Cash",
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            height: 0,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 80,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Balance Amounts",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Deposit"),
                        Text(
                          "00.00",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 75),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Winnings"),
                        Text(
                          "00.00",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 75),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Bonus"),
                        Text(
                          "00.00",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  // side: BorderSide(color: Colors.redAccent),
                ),
                primary: Colors.redAccent,
                textStyle: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Cash withdraw Clicked");
              },
              child: Text(
                "Cash withdraw",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: Text(
              "* Verify your accounts for to be eligible for withdraw",
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  // side: BorderSide(color: Colors.redAccent),
                ),
                primary: Colors.orange,
                textStyle: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("Wallet History Clicked");
              },
              child: Text(
                "Wallet History",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  primary: Colors.white,
                  textStyle: TextStyle(color: Colors.blue)),
              onPressed: () {
                print("Verifications Clicked");
              },
              child: Text(
                "Verifications",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
