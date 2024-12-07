import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstream/api/api_result.dart';
import 'package:newstream/api/end_points.dart';
import 'package:newstream/pages/home_page.dart';
import 'package:newstream/pages/verify_otp_page.dart';
import 'package:newstream/request_models/auth_request_model.dart';
import 'package:newstream/response_models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_video/stream_video.dart';
import 'package:stream_video_push_notification/stream_video_push_notification.dart';

import '../api/api_provider.dart';
import '../extentions/customcolors.dart';
import '../extentions/utils.dart';
import '../pages/main_page.dart';
import '../pages/register_user_page.dart';

class AuthViewModel extends GetxController{
  final apiProvider = Get.put(ApiProvider());
  final sendOtpObserver  = const ApiResult<PrimeryResponseModel>.init().obs;
  final verifyOtpObserver  = const ApiResult<VerifyOtpResponseModel>.init().obs;
  final registerUserObserver  = const ApiResult<RegisterUserResponseModel>.init().obs;
  final userDetailsObserver  = const ApiResult<RegisterUserResponseModel>.init().obs;

  Future<void> performSendOtp(SendOtpRequestModel request) async {
    try{
      sendOtpObserver.value =  const ApiResult.loading("loading");
      final response = await apiProvider.post(EndPoints.sendOtp,request.toJson());
      final body  = response.body;
      if(response.isOk && body !=null){
        final responseData = PrimeryResponseModel.fromJson(body);
        if (responseData.status == 1) {
          sendOtpObserver.value = ApiResult.success(responseData);
          Get.offAll(() => VerifyOtpPage(mobileNumber: request.mobile));
        } else {
          throw responseData.message.toString();
        }
      }
      else{
        throw 'something went wrong+${response.statusText ?? 0}';
      }
    }
    catch(error){
      Get.snackbar('Exception',error.toString(),
        snackPosition: SnackPosition.BOTTOM, backgroundColor: CustomColors.red,colorText: Colors.white,);
      sendOtpObserver.value = ApiResult.error(error.toString());
    }
  }


  Future<void> performVerifyOtp(VerifyOtpRequestModel request) async {
    try{
      verifyOtpObserver.value =  const ApiResult.loading("loading");
      final response = await apiProvider.post(EndPoints.verifyOtp,request.toJson());
      final body  = response.body;
      if(response.isOk && body !=null){
        final responseData = VerifyOtpResponseModel.fromJson(body);
        if (responseData.status == 1) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userStreamId',request.mobile.toString());
          prefs.setString('userStreamName',responseData.data?.userName ?? '');
          prefs.setString('userStreamToken',responseData.data?.token ?? '');
          prefs.setString('token', responseData.data?.jwtToken ?? '');
          if(responseData.data?.registerUser == true){
            Get.offAll(() => const RegisterUserPage());
          }
          else{
            await connectClient(request.mobile.toString(),responseData.data?.userName ?? '',responseData.data?.token ?? '');
          }
          verifyOtpObserver.value = ApiResult.success(responseData);
        } else {
          throw responseData.message.toString();
        }
      }
      else{
        throw 'something went wrong+${response.statusText ?? 0}';
      }
    }
    catch(error){
      Get.snackbar('Exception',error.toString(),
        snackPosition: SnackPosition.BOTTOM, backgroundColor: CustomColors.red,colorText: Colors.white,);
      verifyOtpObserver.value = ApiResult.error(error.toString());
    }
  }

  Future<void> performRegisterUser(RegisterUserRequestModel request) async {
    try{
      registerUserObserver.value =  const ApiResult.loading("loading");
      final response = await apiProvider.post(EndPoints.registerUser,request.toJson());
      final body  = response.body;
      if(response.isOk && body !=null){
        final responseData = RegisterUserResponseModel.fromJson(body);
        if (responseData.status == 1) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userStreamId',responseData.data?.mobile.toString() ?? '');
          prefs.setString('userStreamName',responseData.data?.name ?? '');
          prefs.setString('userStreamToken',responseData.data?.token ?? '');
          await connectClient(responseData.data?.mobile.toString() ?? '',responseData.data?.name ?? '',responseData.data?.token ?? '');
          registerUserObserver.value = ApiResult.success(responseData);
        } else {
          throw responseData.message.toString();
        }
      }
      else{
        throw 'something went wrong+${response.statusText ?? 0}';
      }
    }
    catch(error){
      Get.snackbar('Exception',error.toString(),
        snackPosition: SnackPosition.BOTTOM, backgroundColor: CustomColors.red,colorText: Colors.white,);
      registerUserObserver.value = ApiResult.error(error.toString());
    }
  }

  Future<void> connectClient(String userId,String userName, String userToken) async {
    try {
      StreamVideo.reset();
      var client = StreamVideo(
          appStreamKey,
          user: User.regular(userId: userId, name:userName),
          userToken:userToken,
          options: const StreamVideoOptions(
            keepConnectionsAliveWhenInBackground: true,
          ),
          pushNotificationManagerProvider: StreamVideoPushNotificationManager.create(
            iosPushProvider: const StreamVideoPushProvider.apn(
              name: 'apn',
            ),
            androidPushProvider: const StreamVideoPushProvider.firebase(
              name: 'FireBaseCallNotification',
            ),
            pushParams: const StreamVideoPushParams(
              appName: "StreamCall",
              ios: IOSParams(iconName: 'IconMask'),
              missedCallNotification: NotificationParams(
                showNotification: true,
                subtitle: 'Missed Call',
                callbackText: 'Call Back',
              ),
            ),
          )
      );
      await client.connect();
      Get.snackbar("Connected", "You are now connected as $userName");
      Get.offAll(() => MainPage(currentUserId: userId));
    } catch (error) {
      Get.snackbar("Connection Failed", "Error: $error");
    }
  }


  Future<void> performFetchUserDetails() async {
    try{
      userDetailsObserver.value =  const ApiResult.loading("loading");
      final response = await apiProvider.post(EndPoints.fetchUserDetails,{});
      final body  = response.body;
      if(response.isOk && body !=null){
        final responseData = RegisterUserResponseModel.fromJson(body);
        if (responseData.status == 1) {
          if((responseData.data?.name??"").trim().isEmpty){
            Get.offAll(() => const RegisterUserPage());
          }
          else{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('userStreamId',responseData.data?.mobile.toString() ?? '');
            prefs.setString('userStreamName',responseData.data?.name ?? '');
            prefs.setString('userStreamToken',responseData.data?.token ?? '');
          }
          userDetailsObserver.value = ApiResult.success(responseData);
        } else {
          throw responseData.message.toString();
        }
      }
      else{
        throw 'something went wrong+${response.statusText ?? 0}';
      }
    }
    catch(error){
      Get.snackbar('Exception',error.toString(),
        snackPosition: SnackPosition.BOTTOM, backgroundColor: CustomColors.red,colorText: Colors.white,);
      userDetailsObserver.value = ApiResult.error(error.toString());
    }
  }


}