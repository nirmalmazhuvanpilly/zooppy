import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooppy/providers/home_page_provider.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/leaderboard_stack_banner.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/stack_containers.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topWinnersProviderValue =
        Provider.of<HomePageProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: topWinnersProviderValue.fetchTopWinners(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //
                //Checking Value
                // var value = topWinnersProviderValue.topWinnersModel.topWinners
                //     .elementAt(0)
                //     .totalWinnings;
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
                          Consumer<HomePageProvider>(
                            builder: (_, value, __) => Align(
                              alignment: Alignment.topCenter,
                              child: StackContainers(
                                srank: value.topWinnersModel.topWinners
                                    .elementAt(0)
                                    .rank
                                    .toString(),
                                suser: value.topWinnersModel.topWinners
                                    .elementAt(0)
                                    .user
                                    .name
                                    .toString(),
                                suserAmount: value.topWinnersModel.topWinners
                                    .elementAt(0)
                                    .totalWinnings
                                    .toString(),
                                srankColor: Colors.red,
                                savatar: value.topWinnersModel.topWinners
                                    .elementAt(0)
                                    .user
                                    .image,
                              ),
                            ),
                          ),
                          Consumer<HomePageProvider>(
                            builder: (_, value, __) => Align(
                              alignment: Alignment.bottomLeft,
                              child: StackContainers(
                                srank: value.topWinnersModel.topWinners
                                    .elementAt(2)
                                    .rank
                                    .toString(),
                                suser: value.topWinnersModel.topWinners
                                    .elementAt(2)
                                    .user
                                    .name
                                    .toString(),
                                suserAmount: value.topWinnersModel.topWinners
                                    .elementAt(2)
                                    .totalWinnings
                                    .toString(),
                                srankColor: Colors.purple,
                                savatar: value.topWinnersModel.topWinners
                                    .elementAt(2)
                                    .user
                                    .image,
                              ),
                            ),
                          ),
                          Consumer<HomePageProvider>(
                            builder: (_, value, __) => Align(
                              alignment: Alignment.bottomRight,
                              child: StackContainers(
                                srank: value.topWinnersModel.topWinners
                                    .elementAt(1)
                                    .rank
                                    .toString(),
                                suser: value.topWinnersModel.topWinners
                                    .elementAt(1)
                                    .user
                                    .name
                                    .toString(),
                                suserAmount: value.topWinnersModel.topWinners
                                    .elementAt(1)
                                    .totalWinnings
                                    .toString(),
                                srankColor: Colors.green,
                                savatar: value.topWinnersModel.topWinners
                                    .elementAt(1)
                                    .user
                                    .image,
                              ),
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
                              onPrimary: thisWeek ? Colors.black : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
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
                              onPrimary: allTime ? Colors.black : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5),
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
                          Consumer<HomePageProvider>(
                            builder: (_, value, __) => LeaderboardStackBanner(
                              rank: value.topWinnersModel.topWinners
                                  .elementAt(3)
                                  .rank
                                  .toString(),
                              user: value.topWinnersModel.topWinners
                                  .elementAt(3)
                                  .user
                                  .name,
                              userAmount: value.topWinnersModel.topWinners
                                  .elementAt(3)
                                  .totalWinnings
                                  .toString(),
                              avatar: value.topWinnersModel.topWinners
                                  .elementAt(3)
                                  .user
                                  .image,
                            ),
                          ),
                          SizedBox(height: 10),
                          Consumer<HomePageProvider>(
                            builder: (_, value, __) => LeaderboardStackBanner(
                              rank: value.topWinnersModel.topWinners
                                  .elementAt(4)
                                  .rank
                                  .toString(),
                              user: value.topWinnersModel.topWinners
                                  .elementAt(4)
                                  .user
                                  .name,
                              userAmount: value.topWinnersModel.topWinners
                                  .elementAt(4)
                                  .totalWinnings
                                  .toString(),
                              avatar: value.topWinnersModel.topWinners
                                  .elementAt(4)
                                  .user
                                  .image,
                            ),
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
