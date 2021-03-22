import 'package:flutter/material.dart';

class WithdrawMoney extends StatelessWidget {
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
          "Withdraw Money",
          // style: TextStyle(
          //   fontSize: 25,
          // ),
        ),
      ),
      body: WithdrawMoneyContainer(),
    );
  }
}

enum WalletType { Paytm, Phonepe, GooglePay } //declared enum

class WithdrawMoneyContainer extends StatefulWidget {
  @override
  _WithdrawMoneyContainerState createState() => _WithdrawMoneyContainerState();
}

class _WithdrawMoneyContainerState extends State<WithdrawMoneyContainer> {
  WalletType _walletType = WalletType.Paytm;
  // WalletType is a enum...
  // _walletType is a enum variable...
  // Value of enum variable is set to paytm

  @override
  Widget build(BuildContext context) {
    print(_walletType);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                color: Colors.orange,
              ),
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Withdrwable balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₹ 00.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(50),
                // color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    "Enter Amount",
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    controller: TextEditingController()..text = '10',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Withdrawal amount will be transferred to the Paytm wallet of the registered mobile number",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[350], width: 2),
                borderRadius: BorderRadius.circular(5),
                // color: Colors.blue,
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: Colors.redAccent,
                        value: WalletType.Paytm, // Value of RadioButton
                        groupValue: _walletType,
                        onChanged: (WalletType value) {
                          setState(() {
                            _walletType = value;
                          });
                        },
                        // _walletType value changed to Paytm
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Paytm"),
                          Text("Wallet"),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        activeColor: Colors.redAccent,
                        value: WalletType.Phonepe,
                        groupValue: _walletType,
                        onChanged: (WalletType value) {
                          setState(() {
                            _walletType = value;
                          });
                        },
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Phonepe"),
                          Text("Wallet"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: Text("Withdraw Cash"),
                onPressed: () {
                  print("Withdraw Cash Clicked");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
