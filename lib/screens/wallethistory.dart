import 'package:flutter/material.dart';

class WalletHistory extends StatelessWidget {
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
          "Wallet History",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: WalletHistoryContainer(),
    );
  }
}

class WalletHistoryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: List.generate(
            100,
            (_) => WalletHistorySingleContainer(),
            //This Will generate WalletHistorySingleContainer Widget 100 times in the Listview
          ),
        ),
      ),
    );
  }
}

class WalletHistorySingleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Deposited using Paytm"),
                  Text(
                    "24 Feb 2021 02:17 PM",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      "50",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "FAILED",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey[400],
            height: 0,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ],
      ),
    );
  }
}
