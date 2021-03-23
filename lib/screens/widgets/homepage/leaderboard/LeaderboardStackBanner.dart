import 'package:flutter/material.dart';

class LeaderboardStackBanner extends StatelessWidget {
  final String rank;
  final String user;
  final String userAmount;

  LeaderboardStackBanner({
    this.rank,
    this.user,
    this.userAmount,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 12,
                child: Text(
                  rank,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
              ),
              SizedBox(width: 10),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                user,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              '₹$userAmount',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
