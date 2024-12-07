import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../extentions/customcolors.dart';
import '../request_models/auth_request_model.dart';
import '../view_models/auth_view_model.dart';




class MobileVerificationPage extends StatefulWidget {

  const MobileVerificationPage({super.key});

  @override
  State<MobileVerificationPage> createState() => _MobileVerificationPageState();
}

class _MobileVerificationPageState extends State<MobileVerificationPage> {
  final authViewModel = Get.put(AuthViewModel());
  var isChecked=false;

  final TextEditingController mobileNumberText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor:Colors.white,
        body:
        SafeArea(
          top: true,
          child:
          Container(
            color: Colors.white,
            child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child:
              SingleChildScrollView(
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    // Image.asset('assets/images/mobile_verification_image.png',width: MediaQuery.sizeOf(context).width*0.5,height: MediaQuery.sizeOf(context).width*0.5,) ,
                    const SizedBox(height: 20,),
                    const Text( textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.textcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),'Enter your mobile number to get started'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        obscureText: false,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        controller: mobileNumberText,
                        cursorColor: CustomColors.textcolor,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            color:CustomColors.textcolor,
                            fontWeight: FontWeight.normal,
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                          counterText: '',
                          label:
                          const
                          Text(
                            "Mobile Verification",
                            style: TextStyle(
                                color: CustomColors.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 14),
                          ),
                          hintStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.4)),
                          hintText: "  Enter Your MobileNumber",
                          prefixText: " +91 ",
                          prefixStyle: const TextStyle(
                              color:CustomColors.textcolor,
                              fontWeight: FontWeight.normal,
                              fontSize: 18
                          ) ,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: CustomColors.primary,width: 2),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width:2,
                              color: CustomColors.primary,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.12),
                            ),
                          ),
                          // Adjust these values as needed
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(style: TextStyle(
                        backgroundColor:Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: CustomColors.primary
                    ),
                        'A verification code will be sent to your phone'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: CustomColors.primary,
                          value:isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        const Text(style: TextStyle(
                            fontFamily: 'Montserrat',
                            backgroundColor:Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: CustomColors.primary
                        ),
                            'I Agree to'),
                        GestureDetector(
                          onTap: (){

                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(style: TextStyle(
                                fontFamily: 'Montserrat',
                                backgroundColor:Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: CustomColors.textcolor
                            ),
                                'Terms & conditions'),
                          ),
                        )
                      ],
                    ),
                    Obx(() {
                      return authViewModel.sendOtpObserver.value.maybeWhen(
                          loading: (data) => const Center(child:
                          Padding(
                            padding: EdgeInsets.only(left: 12.0,right: 12,top: 10),
                            child: CircularProgressIndicator(),
                          )),
                          orElse: () =>
                              Center(
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
                                      onPressed: () {
                                        sendOtpAction();
                                      },
                                      child: const Text(
                                        'Send Otp',
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
                              )
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  void sendOtpAction(){
    final mobileNumber=mobileNumberText.text;
    if(mobileNumber.isNotEmpty && mobileNumber.length==10 && isChecked==true){
      authViewModel.performSendOtp(SendOtpRequestModel(mobile: mobileNumber,source: Platform.isAndroid ? "android" : "ios"));
    }
    else if(mobileNumber.isEmpty || mobileNumber.length != 10){
      Get.snackbar('Oops..','Invalid Mobile Number \n MobileNumber Should Contains 10 digits',
          snackPosition: SnackPosition.BOTTOM,backgroundColor: CustomColors.red,colorText: Colors.white);
    }
    else{
      Get.snackbar('Oops..','Select Terms And Condition And Continue ',
          snackPosition: SnackPosition.BOTTOM,backgroundColor: CustomColors.red,colorText: Colors.white);
    }
  }
}
