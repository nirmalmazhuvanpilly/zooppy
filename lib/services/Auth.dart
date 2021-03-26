import 'dart:convert';
import 'package:zooppy/services/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Class that manages all Authorization API requests
class AuthAPI {
  var baseUrl = env['Test_Api_Url'];
  //Value stored in env['Test_Api_Url'] from .env file is assigned to baseUrl

  //loginRequest() is an asynchronous function, It takes two arguments, mobilenumber and password
  loginRequest(mobileNumber, password) async {
    //'mobile_number' & 'password' : Key Value in body of request

    var loginUrl = baseUrl + 'auth/login';
    // print(loginUrl);

    var data = {'mobile_number': mobileNumber, 'password': password};
    // print(data);

    //Call authData() function from Network class and assigned to variable
    var res = await Network().authData(data, loginUrl);
    // print(res);

    var body = json.decode(res.body);
    // print(body);

    // Return body of request
    return body;
  }

  sendOtpRequest(mobileNumber, type) async {
    var sendOtpUrl = baseUrl + 'auth/sendOTP/' + mobileNumber + type;
    var data;
    var res = await Network().authData(data, sendOtpUrl);
    var body = json.decode(res.body);
    return body;
  }

  submitOtpRequest(mobileNumber, otp) async {
    var verifyOtpUrl = baseUrl + 'auth/verifyOTP/' + mobileNumber + '/' + otp;
    var data;
    var res = await Network().authData(data, verifyOtpUrl);
    var body = json.decode(res.body);
    return body;
  }

  resendOtpRequest(mobileNumber) async {
    var resendOtpUrl = baseUrl + 'auth/resendOTP/' + mobileNumber;
    var data;
    var res = await Network().authData(data, resendOtpUrl);
    var body = json.decode(res.body);
    return body;
  }

  registerRequest(mobileNumber, otp, dataRecieved) async {
    var registerUrl = baseUrl + 'auth/register/' + mobileNumber + '/' + otp;
    print(registerUrl);
    var data = dataRecieved;
    var res = await Network().authData(data, registerUrl);
    var body = json.decode(res.body);
    print(body);
    return body;
  }

  resetResendOtpRequest(mobileNumber) async {
    var resetResendOtpUrl =
        baseUrl + 'auth/reset_password/resendOTP/' + mobileNumber;
    var data;
    var res = await Network().authData(data, resetResendOtpUrl);
    var body = json.decode(res.body);
    return body;
  }

  resetPasswordRequest(mobileNumber, otp, newPassword) async {
    var resetPasswordUrl =
        baseUrl + 'auth/reset_password/' + mobileNumber + '/' + otp;
    var data = {'new_password': newPassword};
    var res = await Network().authData(data, resetPasswordUrl);
    var body = json.decode(res.body);
    return body;
  }
}
