import 'package:flutter/material.dart';
import 'package:zooppy/models/TopWinnersModel.dart';
import 'package:zooppy/services/HomeAPI.dart';
import 'package:zooppy/screens/homepage/leaderboard/LeaderboardStackBanner.dart';
import 'package:zooppy/screens/homepage/leaderboard/StackContainers.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  bool thisWeek = false;
  bool allTime;

  @override
  void initState() {
    allTime = true;
    _fetchTopWinners();
    super.initState();
  }

  Future<TopWinnersModel> _topWinnersModel;

  void _fetchTopWinners() {
    _topWinnersModel = HomeAPI().topWinnersRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<TopWinnersModel>(
            future: _topWinnersModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //
                //Checking Value
                // var value = snapshot.data.topWinners.elementAt(0).totalWinnings;
                // print(value);

                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
                      width: double.infinity,
                      height: 200,
                      color: Colors.orange,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: StackContainers(
                              //
                              srank: thisWeek
                                  ? snapshot.data.topWinners
                                      .elementAt(0)
                                      .rank
                                      .toString()
                                  : snapshot.data.weeklyWinners
                                      .elementAt(0)
                                      .rank
                                      .toString(),
                              //
                              suser: thisWeek
                                  ? snapshot.data.topWinners
                                      .elementAt(0)
                                      .user
                                      .name
                                      .toString()
                                  : snapshot.data.weeklyWinners
                                      .elementAt(0)
                                      .user
                                      .name
                                      .toString(),
                              //
                              suserAmount: snapshot.data.topWinners
                                  .elementAt(0)
                                  .totalWinnings
                                  .toString(),
                              //
                              srankColor: Colors.red,

                              //
                              savatar: snapshot.data.topWinners
                                  .elementAt(0)
                                  .user
                                  .avatar
                                  .image
                                  .toString(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: StackContainers(
                              srank: snapshot.data.topWinners
                                  .elementAt(1)
                                  .rank
                                  .toString(),
                              suser: snapshot.data.topWinners
                                  .elementAt(1)
                                  .user
                                  .name
                                  .toString(),
                              suserAmount: snapshot.data.topWinners
                                  .elementAt(1)
                                  .totalWinnings
                                  .toString(),
                              srankColor: Colors.purple,
                              savatar: snapshot.data.topWinners
                                  .elementAt(1)
                                  .user
                                  .avatar
                                  .image
                                  .toString(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: StackContainers(
                              srank: snapshot.data.topWinners
                                  .elementAt(2)
                                  .rank
                                  .toString(),
                              suser: snapshot.data.topWinners
                                  .elementAt(2)
                                  .user
                                  .name
                                  .toString(),
                              suserAmount: snapshot.data.topWinners
                                  .elementAt(2)
                                  .totalWinnings
                                  .toString(),
                              srankColor: Colors.green,
                              savatar: snapshot.data.topWinners
                                  .elementAt(2)
                                  .user
                                  .avatar
                                  .image
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ////////////////////////////////////////////////////////////////////////////
                    Container(
                      // color: Colors.green,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary:
                                  thisWeek ? Colors.orange[200] : Colors.white,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("This Week Clicked");
                              setState(() {
                                allTime = false;
                                thisWeek = true;
                              });
                            },
                            child: Text("This Week"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary:
                                  allTime ? Colors.orange[200] : Colors.white,
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("All Time Clicked");
                              setState(() {
                                allTime = true;
                                thisWeek = false;
                              });
                            },
                            child: Text("All Time"),
                          ),
                        ],
                      ),
                    ),

                    ////////////////////////////////////////////////////////////////////////////
                    Container(
                      width: double.infinity,
                      // color: Colors.pink,
                      child: Column(
                        children: <Widget>[
                          LeaderboardStackBanner(
                            rank: snapshot.data.topWinners
                                .elementAt(3)
                                .rank
                                .toString(),
                            user: snapshot.data.topWinners
                                .elementAt(3)
                                .user
                                .name
                                .toString(),
                            userAmount: snapshot.data.topWinners
                                .elementAt(3)
                                .totalWinnings
                                .toString(),
                          ),
                          SizedBox(height: 10),
                          LeaderboardStackBanner(
                            rank: snapshot.data.topWinners
                                .elementAt(4)
                                .rank
                                .toString(),
                            user: snapshot.data.topWinners
                                .elementAt(4)
                                .user
                                .name
                                .toString(),
                            userAmount: snapshot.data.topWinners
                                .elementAt(4)
                                .totalWinnings
                                .toString(),
                          ),
                        ],
                      ),
                    ),

                    ////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        print("View Leaderboard Clicked");
                      },
                      child: Text(
                        "View Leaderboard",
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
