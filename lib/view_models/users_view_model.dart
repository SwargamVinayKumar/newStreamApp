import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstream/api/api_result.dart';
import 'package:newstream/api/end_points.dart';
import 'package:newstream/response_models/users_response_model.dart';

import '../api/api_provider.dart';
import '../extentions/customcolors.dart';

class UsersViewModel extends GetxController{
  final apiProvider = Get.put(ApiProvider());
  final fetchUsersObserver = const ApiResult<FetchUsersResponseModel>.init().obs;

  Future<void> fetchUsers() async{
    try{
      fetchUsersObserver.value = const ApiResult.loading("loading");
      final response = await apiProvider.post(EndPoints.fetchUsers,{});
      final body = response.body;
      if(response.isOk && body != null){
        final responseData = FetchUsersResponseModel.fromJson(body);
        if(responseData.status == 1){
          fetchUsersObserver.value = ApiResult.success(responseData);
        }
        else {
          throw responseData.message.toString();
        }
      }
      else{
        throw 'something went wrong';
      }
    }
    catch(error){
      Get.snackbar('Exception',error.toString(),
        snackPosition: SnackPosition.BOTTOM, backgroundColor: CustomColors.red,colorText: Colors.white,);
      fetchUsersObserver.value = ApiResult.error(error.toString());
    }
  }
}