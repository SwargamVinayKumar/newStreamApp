import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newstream/extentions/customcolors.dart';
import 'package:newstream/extentions/statefullwrapper.dart';
import 'package:newstream/pages/mobile_verification_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return  StatefulWrapper(
      onInit: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token') ?? '';
        final userStreamId = prefs.getString('userStreamId') ?? '';
        if(token.isEmpty){
          Get.offAll(() => const MobileVerificationPage());
        }
        else{
          Get.offAll(() => MainPage(currentUserId: userStreamId));
        }
      },
      child: const Scaffold(
        body:SafeArea(child: SizedBox(width: double.infinity,height: double.infinity,child: Center(child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator(color: CustomColors.primary,),)),)),
      ),
    );
  }
}
