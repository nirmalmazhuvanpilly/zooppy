import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooppy/providers/home_page_provider.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/leaderboard_stack_banner.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/stack_containers.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
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
                Consumer<HomePageProvider>(
                  builder: (_, value, __) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:
                          value.thisWeek ? Colors.orange[200] : Colors.white,
                      onPrimary: value.thisWeek ? Colors.black : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: value.thisWeekClicked,
                    child: Text("This Week"),
                  ),
                ),
                Consumer<HomePageProvider>(
                  builder: (_, value, __) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:
                          value.allTime ? Colors.orange[200] : Colors.white,
                      onPrimary: value.allTime ? Colors.black : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: value.allTimeClicked,
                    child: Text("All Time"),
                  ),
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
                    user:
                        value.topWinnersModel.topWinners.elementAt(3).user.name,
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
                    user:
                        value.topWinnersModel.topWinners.elementAt(4).user.name,
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
      ),
    );
  }
}
