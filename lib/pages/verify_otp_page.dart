import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../extentions/customcolors.dart';
import '../request_models/auth_request_model.dart';
import '../view_models/auth_view_model.dart';

class VerifyOtpPage extends StatefulWidget {
  final String mobileNumber;
  const VerifyOtpPage({super.key, required this.mobileNumber});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final authViewModel = Get.put(AuthViewModel());

  late String currentText = "";
    var progressBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: SafeArea(
        top: true,
        child:
        SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child:
              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    const SizedBox(height: 20,),
                    Text( textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColors.primary,
                          fontSize:18,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                        ),'Enter your OTP'),
                    const SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                          style: const TextStyle(height: 1.3),
                          children: [
                            const TextSpan(text:
                            'We have sent an OTP on your mobile number ', style: TextStyle(
                              color: CustomColors.primary,
                              fontSize:18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                            TextSpan(text:widget.mobileNumber,style: const TextStyle(
                              color: CustomColors.textcolor,
                              fontSize:18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                            ))
                          ]),
                    ),
                    const SizedBox(height: 20),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: CustomColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      length:4,
                      obscureText: false,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return null;
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 40,
                          fieldWidth: 60,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          activeColor: CustomColors.textcolor,
                          // disabledColor: CustomColors.textcolor, // Set the border color to black
                          selectedColor: CustomColors.textcolor, // Set the border color to black
                          inactiveColor: CustomColors.textcolor,
                          errorBorderColor:CustomColors.textcolor
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    Obx(() {
                      return authViewModel.verifyOtpObserver.value.maybeWhen(
                        loading: (data) => const Center(child:
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        )),
                        orElse: () => Center(
                          child:
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                                  verifyOtpAction();
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SetYourCallRatePage()));
                                },
                                child: const Text(
                                  'verify',
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
                        ),
                      );
                    }),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
  Future<void> verifyOtpAction() async {
    if(currentText.isNotEmpty && currentText.length==4){
      authViewModel.performVerifyOtp(VerifyOtpRequestModel(mobile:widget.mobileNumber, otp:currentText));
    }
    else{
      Get.snackbar('Oops.','Otp Must Entered',
          snackPosition: SnackPosition.BOTTOM,backgroundColor: CustomColors.red,colorText: Colors.white);
    }
  }
}
