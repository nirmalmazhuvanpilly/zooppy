// Use https://quicktype.io/ to convert json to dart
// Use http://jsonviewer.stack.hu/ to format json

//Created Model Class to Parse Json

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.success,
    this.showFanBase,
    this.showBidding,
    this.showVideoLeague,
    this.showGamingLeague,
    this.showReferrals,
    this.showMyGames,
    this.showBlog,
    this.showInviteShareButton,
    this.referralBanner,
    this.referralBreakups,
    this.inviteEarnCard,
    this.leaderboardTitle,
    this.gamingLeagueCards,
    this.couponCards,
    this.videoLeagueCard,
    this.videoLeagueHowToPlayUrl,
    this.videoLeagueData,
    this.gamingLeagueData,
    this.biddingData,
    this.fanBaseData,
    this.prizeDistributionCards,
    this.contactMobile,
    this.contactEmail,
    this.editStatePopup,
    this.states,
    this.alertData,
  });

  bool success;
  bool showFanBase;
  bool showBidding;
  bool showVideoLeague;
  bool showGamingLeague;
  bool showReferrals;
  bool showMyGames;
  bool showBlog;
  bool showInviteShareButton;
  String referralBanner;
  List<dynamic> referralBreakups;
  String inviteEarnCard;
  String leaderboardTitle;
  List<String> gamingLeagueCards;
  List<String> couponCards;
  String videoLeagueCard;
  String videoLeagueHowToPlayUrl;
  Data videoLeagueData;
  Data gamingLeagueData;
  Data biddingData;
  Data fanBaseData;
  List<PrizeDistributionCard> prizeDistributionCards;
  String contactMobile;
  String contactEmail;
  bool editStatePopup;
  List<String> states;
  AlertData alertData;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        success: json["success"],
        showFanBase: json["show_fan_base"],
        showBidding: json["show_bidding"],
        showVideoLeague: json["show_video_league"],
        showGamingLeague: json["show_gaming_league"],
        showReferrals: json["show_referrals"],
        showMyGames: json["show_my_games"],
        showBlog: json["show_blog"],
        showInviteShareButton: json["show_invite_share_button"],
        referralBanner: json["referral_banner"],
        referralBreakups:
            List<dynamic>.from(json["referral_breakups"].map((x) => x)),
        inviteEarnCard: json["invite_earn_card"],
        leaderboardTitle: json["leaderboard_title"],
        gamingLeagueCards:
            List<String>.from(json["gaming_league_cards"].map((x) => x)),
        couponCards: List<String>.from(json["coupon_cards"].map((x) => x)),
        videoLeagueCard: json["video_league_card"],
        videoLeagueHowToPlayUrl: json["video_league_how_to_play_url"],
        videoLeagueData: Data.fromJson(json["video_league_data"]),
        gamingLeagueData: Data.fromJson(json["gaming_league_data"]),
        biddingData: Data.fromJson(json["bidding_data"]),
        fanBaseData: Data.fromJson(json["fan_base_data"]),
        prizeDistributionCards: List<PrizeDistributionCard>.from(
            json["prize_distribution_cards"]
                .map((x) => PrizeDistributionCard.fromJson(x))),
        contactMobile: json["contact_mobile"],
        contactEmail: json["contact_email"],
        editStatePopup: json["edit_state_popup"],
        states: List<String>.from(json["states"].map((x) => x)),
        alertData: AlertData.fromJson(json["alert_data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "show_fan_base": showFanBase,
        "show_bidding": showBidding,
        "show_video_league": showVideoLeague,
        "show_gaming_league": showGamingLeague,
        "show_referrals": showReferrals,
        "show_my_games": showMyGames,
        "show_blog": showBlog,
        "show_invite_share_button": showInviteShareButton,
        "referral_banner": referralBanner,
        "referral_breakups": List<dynamic>.from(referralBreakups.map((x) => x)),
        "invite_earn_card": inviteEarnCard,
        "leaderboard_title": leaderboardTitle,
        "gaming_league_cards":
            List<dynamic>.from(gamingLeagueCards.map((x) => x)),
        "coupon_cards": List<dynamic>.from(couponCards.map((x) => x)),
        "video_league_card": videoLeagueCard,
        "video_league_how_to_play_url": videoLeagueHowToPlayUrl,
        "video_league_data": videoLeagueData.toJson(),
        "gaming_league_data": gamingLeagueData.toJson(),
        "bidding_data": biddingData.toJson(),
        "fan_base_data": fanBaseData.toJson(),
        "prize_distribution_cards":
            List<dynamic>.from(prizeDistributionCards.map((x) => x.toJson())),
        "contact_mobile": contactMobile,
        "contact_email": contactEmail,
        "edit_state_popup": editStatePopup,
        "states": List<dynamic>.from(states.map((x) => x)),
        "alert_data": alertData.toJson(),
      };
}

class AlertData {
  AlertData({
    this.status,
    this.body,
  });

  bool status;
  String body;

  factory AlertData.fromJson(Map<String, dynamic> json) => AlertData(
        status: json["status"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "body": body,
      };
}

class Data {
  Data({
    this.bannerImage,
    this.title,
    this.subTitle,
    this.buttonText,
  });

  String bannerImage;
  String title;
  String subTitle;
  String buttonText;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerImage: json["banner_image"],
        title: json["title"],
        subTitle: json["sub_title"],
        buttonText: json["button_text"],
      );

  Map<String, dynamic> toJson() => {
        "banner_image": bannerImage,
        "title": title,
        "sub_title": subTitle,
        "button_text": buttonText,
      };
}

class PrizeDistributionCard {
  PrizeDistributionCard({
    this.image,
    this.videoUrl,
  });

  String image;
  String videoUrl;

  factory PrizeDistributionCard.fromJson(Map<String, dynamic> json) =>
      PrizeDistributionCard(
        image: json["image"],
        videoUrl: json["video_url"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "video_url": videoUrl,
      };
}
