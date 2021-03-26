import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zooppy/models/home_page_model.dart';
import 'package:zooppy/services/home_api.dart';

class HomePageProvider with ChangeNotifier {
  //
  HomePageModel _homePageModel = HomePageModel();

  HomeAPI _homeAPI = HomeAPI();

  HomePageModel get homePageModel => _homePageModel;

  set homePageModel(HomePageModel homePageModel) {
    _homePageModel = homePageModel;
    notifyListeners();
  }

  //fetching HomePageData
  Future<void> fetchHomeData() async {
    homePageModel = await _homeAPI.homeDetailsRequest();
    await newUserValidation();
  }

  //fetching newUserValidation
  var accessToken;
  bool newUser;
  newUserValidation() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    accessToken = jsonDecode(localStorage.getString('access_token'));
    if (accessToken != null) {
      newUser = false;
    }
    notifyListeners();
  }
}
