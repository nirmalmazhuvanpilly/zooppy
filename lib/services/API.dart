import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//Network class that manages all API methods
class Network {
  //
  var accessToken;

  /*
  This function checks for token stored in the user device
  and assigns it to the initially defined String accesstoken;
  
  Using Shared Preferences to store data
  */
  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    accessToken = jsonDecode(localStorage.getString('access_token'));
  }

  /*
  The authData() function is an asynchronous function that handles all post request to our login and register API, 
  it takes two arguments, data and url.
  
  The http.post() method takes the fullUrl, body, and headers to make the POST request. 
  The authData function returns the response from this request.
  */

  authData(data, url) async {
    var fullUrl = url;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  //Function for http.post() method
  postData(data, url) async {
    var fullUrl = url;
    await _getToken();
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  /*
  In the getData() function, we build the fullUrl similar to the postData and call the _getToken()
  to ensure that token is set otherwise it will be null, and our endpoint will return unauthorized
  */
  getData(url) async {
    var fullUrl = url;
    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
}
