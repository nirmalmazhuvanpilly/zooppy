import 'dart:convert';
import 'package:zooppy/models/home_page_model.dart';
import 'package:zooppy/models/top_winners_model.dart';
import 'package:zooppy/services/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Class that manages all Home API requests
class HomeAPI {
  var baseUrl = env['Test_Api_Url'];
  //Value stored in env['Test_Api_Url'] from .env file is assigned to baseUrl

  walletDetailsRequest() async {
    var walletDetailsUrl = baseUrl + 'wallet/details';
    // print(loginUrl);

    //Call getData() function from Network class and assigned to variable
    var res = await Network().getData(walletDetailsUrl);
    // print(res);

    var body = json.decode(res.body);
    // print(body);

    // Return body of request
    return body;
  }

  Future<HomePageModel> homeDetailsRequest() async {
    var homePageModel;
    var homeDetailsUrl = baseUrl + 'home';
    var res = await Network().getData(homeDetailsUrl);
    var body = json.decode(res.body);
    //parsing json to model class
    homePageModel = HomePageModel.fromJson(body);
    return homePageModel;
  }

  updateProfileState(stateValue) async {
    var updateStateUrl = baseUrl + 'user/profile/update/state';
    var data = {'value': stateValue};
    var res = await Network().postData(data, updateStateUrl);
    var body = json.decode(res.body);
    print(body);
    return body;
  }

  Future<TopWinnersModel> topWinnersRequest() async {
    var topWinnersModel;
    var topWinnersUrl = baseUrl + 'top_winners';
    var res = await Network().getData(topWinnersUrl);
    var body = json.decode(res.body);
    //parsing json to model class
    topWinnersModel = TopWinnersModel.fromJson(body);
    return topWinnersModel;
  }
}
