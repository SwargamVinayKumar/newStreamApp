import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newstream/extentions/customcolors.dart';
import 'package:newstream/extentions/statefullwrapper.dart';
import 'package:newstream/response_models/users_response_model.dart';
import 'package:newstream/view_models/auth_view_model.dart';
import 'package:newstream/view_models/users_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_video/stream_video.dart';

import '../response_models/auth_response_model.dart';
import 'mobile_verification_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: (){
        authViewModel.performFetchUserDetails();
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Obx(() => authViewModel.userDetailsObserver.value.maybeWhen(
                loading: (loading) => const Center(child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator())),
                  success: (data){
                  final userDetailsModel = (data as RegisterUserResponseModel).data;
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Profile Page",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24),),
                          ],
                        ),
                        SizedBox(height: 100),
                        Image.asset('assets/images/person.png',width: 80,height: 90,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(userDetailsModel?.name ?? "",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
                        ),
                        Text(userDetailsModel?.mobile.toString() ?? "",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20),
                        GestureDetector(
                            onTap: () async {
                              StreamVideo.reset();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.clear();
                              Get.offAll(() => const MobileVerificationPage());
                            }, child: Container(width: 100,height: 40,decoration: const BoxDecoration(color: CustomColors.red,borderRadius: BorderRadius.all(Radius.circular(10))),child: Center(child: const Text('LogOut',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),))))
                      ],
                    ),
                  );
                  },
                  orElse: () => const SizedBox())
              ),
            )),
      ),
    );
  }
}
