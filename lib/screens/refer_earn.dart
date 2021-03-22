import 'package:flutter/material.dart';

class ReferNEarn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
          image: AssetImage('assets/bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ReferNEarnContainer(),
      ),
    );
  }
}

class ReferNEarnContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          //First Container
          ReferNEarnTimer(),
          //Second Container
          ReferNEarnDashBoardProgress(),
          //Third Container
          ReferNEarnDashBoard(),
        ],
      ),
    );
  }
}

class ReferNEarnTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Container(
            width: 350,
            height: 125,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/re.png'),
              ),
            ),
          ),
          Text(
            "Get ready to win some real cash for every referral ",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 15),
          Container(
            width: 180,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.alarm,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "34d 2h 7m 54s",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class ReferNEarnDashBoardProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.brown[900],
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    Text(
                      "1-10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.yellow[800],
                      radius: 25,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    Text(
                      "11-20",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.yellow[800],
                      radius: 25,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    Text(
                      "21-50",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.yellow[800],
                      radius: 25,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    Text(
                      "51-100",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.yellow[800],
                      radius: 25,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow[800]),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: <Widget>[
                    Text(
                      "101-1000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundColor: Colors.yellow[800],
                      radius: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "More referrals,more money you earn",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ReferNEarnDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      // height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.1,
              0.5
            ],
            colors: [
              Colors.red,
              Colors.red[900],
            ]),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow[700],
                    ),
                  ),
                  Text(
                    "Money Earned",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow[700],
                    ),
                  ),
                  Text(
                    "Money Earned",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow[700],
                    ),
                  ),
                  Text(
                    "Money Earned",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Grab your referrals to increase your streak",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                print("Invite a friend Clicked");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Invite a friend"),
                  SizedBox(width: 10),
                  Icon(Icons.share),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
