import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/models/home_page_model.dart';
import 'package:zooppy/services/home_api.dart';
import 'package:zooppy/screens/widgets/homepage/edit_state_pop_up.dart';
import 'package:zooppy/screens/widgets/homepage/hooray_pop_up.dart';
import 'package:zooppy/screens/main_screens/login.dart';
import 'my_dream_price.dart';
import 'carousel_image.dart';
import 'carousel_image_slider.dart';
import 'card_image.dart';
import 'blog.dart';
import 'leaderboard/leaderboard.dart';

// ignore: must_be_immutable
class HomeScreenFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.redAccent,
        elevation: 20,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                print("Goto My Wallet");
              },
              icon: Icon(Icons.account_balance_wallet)),
          IconButton(
              onPressed: () {
                print("Goto Notifications");
              },
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () async {
                SharedPreferences localStorage =
                    await SharedPreferences.getInstance();

                await localStorage.clear();
                // var userId = localStorage.getString('user_id');
                // print("userid : $userId");
                // var accessToken = localStorage.getString('access_token');
                // print("access : $accessToken");
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Login(),
                  ),
                );
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: HomeScreenFieldsContainer(),
    );
  }
}

class HomeScreenFieldsContainer extends StatefulWidget {
  @override
  _HomeScreenFieldsContainerState createState() =>
      _HomeScreenFieldsContainerState();
}

class _HomeScreenFieldsContainerState extends State<HomeScreenFieldsContainer> {
  bool newUser;
  bool editState;

  @override
  void initState() {
    newUser = true;
    editState = true;
    _fetchHomeData();
    super.initState();
  }

  //Created Future Model Class Object
  Future<HomePageModel> _homePageModel;

  void _fetchHomeData() {
    //Calling homeDetailsRequest and assigned to _homePageModel
    _homePageModel = HomeAPI().homeDetailsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: double.infinity,
      height: double.infinity,
      // color: Colors.white,
      child: FutureBuilder<HomePageModel>(
        future: _homePageModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Checking Value
            // var value = snapshot.data.states;
            // print(value);

            //Created List for CarouselImage Widget
            List cardList1 = [
              //CarouselImage return Card with Image with onTap Function
              CarouselImage(
                cardImage: snapshot.data.couponCards.elementAt(0),
                cardAction: () {
                  print("Referral Card Clicked");
                },
              ),
              CarouselImage(
                cardImage: snapshot.data.couponCards.elementAt(1),
                cardAction: () {
                  print("Referral Card Clicked");
                },
              ),
            ];

            List cardList2 = [
              //CarouselImage return Card with Image with onTap Function
              CarouselImage(
                cardImage: snapshot.data.gamingLeagueCards.elementAt(0),
                cardAction: () {
                  print("Game League Clicked");
                },
              ),
              CarouselImage(
                cardImage: snapshot.data.gamingLeagueCards.elementAt(1),
                cardAction: () {
                  print("Game League Clicked");
                },
              ),
              CarouselImage(
                cardImage: snapshot.data.gamingLeagueCards.elementAt(2),
                cardAction: () {
                  print("Game League Clicked");
                },
              ),
            ];

            return ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                //New User Pop UP
                newUser ? Container() : HoorayPopUp(context: context),

                //Edit State Pop Up
                editState
                    ? Container()
                    : EditStatePopUp(
                        context: context,
                        states: snapshot.data.states,
                      ),

                //CarouselImageSlider return cardList1 List
                CarouselImageSlider(
                  carouselList: cardList1,
                  carouselHeight: 75,
                ),
                //CardImage return Card with Image with onTap Function
                CardImage(
                  image: snapshot.data.videoLeagueCard,
                  cardAction: () {
                    print("Video League Clicked");
                  },
                ),

                //CarouselImageSlider return cardList2 List
                CarouselImageSlider(
                  carouselList: cardList2,
                  carouselHeight: 125,
                ),

                //CardImage return Card with Image with onTap Function
                CardImage(
                  image:
                      snapshot.data.prizeDistributionCards.elementAt(0).image,
                  cardAction: () {
                    print("Prize Distribution Card Clicked");
                  },
                ),

                //CardImage return Card with Image with onTap Function

                MyDreamPriceButton(),
                CardImage(
                  image: snapshot.data.referralBanner,
                  cardAction: () {
                    print("Refer & Earn Card Clicked");
                  },
                ),
                CardImage(
                  image: snapshot.data.fanBaseData.bannerImage,
                  cardAction: () {
                    print("Fanbase Card Clicked");
                  },
                ),
                Leaderboard(),
                SizedBox(height: 20),
                Blog(),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
