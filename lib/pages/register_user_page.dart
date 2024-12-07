import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newstream/extentions/statefullwrapper.dart';
import 'package:newstream/request_models/auth_request_model.dart';
import 'package:newstream/view_models/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_video/stream_video.dart';
import 'package:stream_video_push_notification/stream_video_push_notification.dart';

import '../extentions/customcolors.dart';
import 'home_page.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final TextEditingController editTextController = TextEditingController();
  final authViewModel = Get.put(AuthViewModel());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(top:true,
        child:Column(children:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller:editTextController,
              decoration: const InputDecoration(
                labelText: "Enter User Id To Connect With",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Obx(() => authViewModel.registerUserObserver.value.maybeWhen(
            loading: (loading) { return const SizedBox(width: 30,height: 30,child: CircularProgressIndicator());},
              success: (data){
              return Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 10,bottom: 20),
                  child: Container(
                    width: double.infinity,// Set width as needed
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: registerUser,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              );
              },
              orElse:() => Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 10,bottom: 20),
                  child: Container(
                    width: double.infinity,// Set width as needed
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: registerUser,
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ))
          )
          ])
      )
    );
  }

  void registerUser(){
    if(editTextController.text.trim().isNotEmpty){
       authViewModel.performRegisterUser(RegisterUserRequestModel(name: editTextController.text.trim().toString()));
    }
    else{
      Get.snackbar("Error", "Name Is Required To Register");
    }
  }
}


