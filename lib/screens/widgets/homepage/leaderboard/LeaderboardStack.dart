import 'package:flutter/material.dart';

class LeaderboardStack extends StatelessWidget {
  final String rank;
  final String user;
  final String userAmount;
  final String avatar;
  final Color rankColor;
  LeaderboardStack({
    this.rank,
    this.user,
    this.userAmount,
    this.rankColor,
    this.avatar,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 0.5,
          right: 0.5,
          bottom: 34,
          child: ClipOval(
            child: Image.asset(
              "assets/circleburst.png",
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 28,
          left: 20,
          right: 20,
          bottom: 60,
          child: ClipOval(
            child: Image.network(
              avatar,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 55,
          right: 3,
          child: CircleAvatar(
            backgroundColor: rankColor,
            radius: 12,
            child: Text(rank),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  user,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Text(
                  '\$ $userAmount',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
