import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/providers/home_page_provider.dart';
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

class HomeScreenFieldsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Create Provider object
    final homePageProviderValue =
        Provider.of<HomePageProvider>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      width: double.infinity,
      height: double.infinity,
      // color: Colors.white,
      child: FutureBuilder(
        future: homePageProviderValue.fetchHomeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //fetching states from provider
            var states = homePageProviderValue.homePageModel.states;

            //fetching editStatePopUpValidation from provider
            var editStatevalid =
                homePageProviderValue.homePageModel.editStatePopup;

            //fetching newUserValidation from provider
            var newUser = homePageProviderValue.newUser;
            // print(newUser);

            //Created List for CarouselImage Widget
            List cardList1 = [
              //CarouselImage return Card with Image with onTap Function
              Consumer<HomePageProvider>(
                builder: (_, value, __) => CarouselImage(
                  cardImage: value.homePageModel.couponCards.elementAt(0),
                  cardAction: () {
                    print("Referral Card Clicked");
                  },
                ),
              ),
              Consumer<HomePageProvider>(
                builder: (_, value, __) => CarouselImage(
                  cardImage: value.homePageModel.couponCards.elementAt(1),
                  cardAction: () {
                    print("Referral Card Clicked");
                  },
                ),
              ),
            ];

            List cardList2 = [
              //CarouselImage return Card with Image with onTap Function
              Consumer<HomePageProvider>(
                builder: (_, value, __) => CarouselImage(
                  cardImage: value.homePageModel.gamingLeagueCards.elementAt(0),
                  cardAction: () {
                    print("Game League Clicked");
                  },
                ),
              ),
              Consumer<HomePageProvider>(
                builder: (_, value, __) => CarouselImage(
                  cardImage: value.homePageModel.gamingLeagueCards.elementAt(1),
                  cardAction: () {
                    print("Game League Clicked");
                  },
                ),
              ),
              Consumer<HomePageProvider>(
                builder: (_, value, __) => CarouselImage(
                  cardImage: value.homePageModel.gamingLeagueCards.elementAt(2),
                  cardAction: () {
                    print("Game League Clicked");
                  },
                ),
              ),
            ];

            return ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                //New User Pop UP
                newUser ? HoorayPopUp(context: context) : Container(),

                // Edit State Pop Up
                editStatevalid
                    ? EditStatePopUp(
                        context: context,
                        states: states,
                      )
                    : Container(),

                //CarouselImageSlider return cardList1 List
                CarouselImageSlider(
                  carouselList: cardList1,
                  carouselHeight: 75,
                ),
                //CardImage return Card with Image with onTap Function
                Consumer<HomePageProvider>(
                  builder: (_, value, __) => CardImage(
                    image: value.homePageModel.videoLeagueCard,
                    cardAction: () {
                      print("Video League Clicked");
                    },
                  ),
                ),

                //CarouselImageSlider return cardList2 List
                CarouselImageSlider(
                  carouselList: cardList2,
                  carouselHeight: 125,
                ),

                //CardImage return Card with Image with onTap Function

                Consumer<HomePageProvider>(
                  builder: (_, value, __) => CardImage(
                    image: value.homePageModel.prizeDistributionCards
                        .elementAt(0)
                        .image,
                    cardAction: () {
                      print("Prize Distribution Card Clicked");
                    },
                  ),
                ),

                //CardImage return Card with Image with onTap Function

                MyDreamPriceButton(),
                Consumer<HomePageProvider>(
                  builder: (context, value, child) => CardImage(
                    image: value.homePageModel.referralBanner,
                    cardAction: () {
                      print("Refer & Earn Card Clicked");
                    },
                  ),
                ),
                Consumer<HomePageProvider>(
                  builder: (_, value, __) => CardImage(
                    image: value.homePageModel.fanBaseData.bannerImage,
                    cardAction: () {
                      print("Fanbase Card Clicked");
                    },
                  ),
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
