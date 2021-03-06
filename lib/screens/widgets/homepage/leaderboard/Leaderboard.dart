import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zooppy/providers/home_page_provider.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/leaderboard_stack.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/leaderboard_stack_banner.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (_, value, __) => Container(
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: LeaderboardStack(
                      //Conditions using ternary operator => (condition)?true:flase;
                      rank: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(0)
                              .rank
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(5)
                              .rank
                              .toString(),
                      ////////////////////////////////
                      user: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(0)
                              .user
                              .name
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(5)
                              .user
                              .name
                              .toString(),
                      ////////////////////////////////
                      userAmount: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(0)
                              .totalWinnings
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(5)
                              .totalWinnings
                              .toString(),
                      ////////////////////////////////
                      rankColor: Colors.red,
                      ////////////////////////////////
                      avatar: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(0)
                              .user
                              .image
                          : value.topWinnersModel.topWinners
                              .elementAt(5)
                              .user
                              .image,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: LeaderboardStack(
                      rank: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(2)
                              .rank
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(7)
                              .rank
                              .toString(),
                      ////////////////////////////////
                      user: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(2)
                              .user
                              .name
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(7)
                              .user
                              .name
                              .toString(),
                      ////////////////////////////////
                      userAmount: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(2)
                              .totalWinnings
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(7)
                              .totalWinnings
                              .toString(),
                      ////////////////////////////////
                      rankColor: Colors.purple,
                      ////////////////////////////////
                      avatar: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(2)
                              .user
                              .image
                          : value.topWinnersModel.topWinners
                              .elementAt(7)
                              .user
                              .image,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: LeaderboardStack(
                      rank: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(1)
                              .rank
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(6)
                              .rank
                              .toString(),
                      ////////////////////////////////
                      user: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(1)
                              .user
                              .name
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(6)
                              .user
                              .name
                              .toString(),
                      ////////////////////////////////
                      userAmount: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(1)
                              .totalWinnings
                              .toString()
                          : value.topWinnersModel.topWinners
                              .elementAt(6)
                              .totalWinnings
                              .toString(),
                      ////////////////////////////////
                      rankColor: Colors.green,
                      ////////////////////////////////
                      avatar: value.thisWeek
                          ? value.topWinnersModel.topWinners
                              .elementAt(1)
                              .user
                              .image
                          : value.topWinnersModel.topWinners
                              .elementAt(6)
                              .user
                              .image,
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
                          value.thisWeek ? Colors.orange[200] : Colors.white,
                      onPrimary: value.thisWeek ? Colors.black : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: value.thisWeekClicked,
                    child: Text("This Week"),
                  ),
                  ElevatedButton(
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
                    rank: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(3)
                            .rank
                            .toString()
                        : value.topWinnersModel.topWinners
                            .elementAt(8)
                            .rank
                            .toString(),
                    ////////////////////////////////
                    user: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(3)
                            .user
                            .name
                        : value.topWinnersModel.topWinners
                            .elementAt(8)
                            .user
                            .name,
                    ////////////////////////////////
                    userAmount: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(3)
                            .totalWinnings
                            .toString()
                        : value.topWinnersModel.topWinners
                            .elementAt(8)
                            .totalWinnings
                            .toString(),
                    ////////////////////////////////
                    avatar: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(3)
                            .user
                            .image
                        : value.topWinnersModel.topWinners
                            .elementAt(8)
                            .user
                            .image,
                  ),
                  SizedBox(height: 10),
                  LeaderboardStackBanner(
                    rank: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(4)
                            .rank
                            .toString()
                        : value.topWinnersModel.topWinners
                            .elementAt(9)
                            .rank
                            .toString(),
                    ////////////////////////////////
                    user: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(4)
                            .user
                            .name
                        : value.topWinnersModel.topWinners
                            .elementAt(9)
                            .user
                            .name,
                    ////////////////////////////////
                    userAmount: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(4)
                            .totalWinnings
                            .toString()
                        : value.topWinnersModel.topWinners
                            .elementAt(9)
                            .totalWinnings
                            .toString(),
                    ////////////////////////////////
                    avatar: value.thisWeek
                        ? value.topWinnersModel.topWinners
                            .elementAt(4)
                            .user
                            .image
                        : value.topWinnersModel.topWinners
                            .elementAt(9)
                            .user
                            .image,
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
      ),
    );
  }
}
