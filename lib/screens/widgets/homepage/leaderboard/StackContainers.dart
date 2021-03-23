import 'package:flutter/material.dart';
import 'package:zooppy/screens/widgets/homepage/leaderboard/LeaderboardStack.dart';

class StackContainers extends StatelessWidget {
  final String srank;
  final String suser;
  final String suserAmount;
  final Color srankColor;
  final String savatar;
  StackContainers({
    this.srank,
    this.suser,
    this.suserAmount,
    this.srankColor,
    this.savatar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 150,
      width: 100,
      child: LeaderboardStack(
        rank: srank,
        user: suser,
        userAmount: suserAmount,
        rankColor: srankColor,
        avatar: savatar,
      ),
    );
  }
}
