import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstream/response_models/auth_response_model.dart';
import 'package:stream_video/stream_video.dart';
import 'package:uuid/uuid.dart';

import '../callScreen.dart';
import '../extentions/customcolors.dart';

class CallAlertDialog extends StatefulWidget {
  final String currentUserId;
  final UserDataModel userDataModel;
  const CallAlertDialog({super.key, required this.currentUserId,required this.userDataModel});

  @override
  State<CallAlertDialog> createState() => _CallAlertDialogState();
}

class _CallAlertDialogState extends State<CallAlertDialog> {
  final TextEditingController durationText = TextEditingController();
  final RxBool progressBar = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Connect Call With ${widget.userDataModel.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },child: const Icon(Icons.cancel,size: 25)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      obscureText: false,
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      controller: durationText,
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
                          "Enter Call Duration",
                          style: TextStyle(
                              color: CustomColors.primary,
                              fontWeight: FontWeight.w800,
                              fontSize: 14),
                        ),
                        hintStyle:
                        TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.4)),
                        hintText: "Enter Call Duration In Min",
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
                  Obx(() => progressBar.value == true ? Text("Connecting Call To ${widget.userDataModel.name} ...",style: TextStyle(color: Colors.black)) : SizedBox(height: 30)),
                  Obx(() => progressBar.value == true ? const SizedBox(width: double.infinity,height: 50,child: Center(child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator(),),),) :
                     GestureDetector(
                       onTap: () async{
                         try {
                           if(durationText.text.toString().trim().isEmpty){
                             Get.snackbar("Error", "Enter Duration");
                             return;
                           }
                           if((widget.userDataModel.mobile.toString() ?? "").isEmpty) {
                             Get.snackbar("Error", "Enter UserId To Connect With");
                             return;
                           }
                           Get.back();
                           progressBar.value =  true;
                           final callId = DateTime.now().millisecondsSinceEpoch.toString().trim();
                           final call = StreamVideo.instance.makeCall(callType: StreamCallType.defaultType(), id: callId);

                           await call.getOrCreate(memberIds: [widget.currentUserId ?? "",widget.userDataModel.mobile.toString()],
                               ringing: true,
                               video: true,
                               limits: const StreamLimitsSettings(
                                 maxDurationSeconds: 60,
                               )
                           );

                           print("scdx");
                           print(callId);
                           // await call.join();
                           progressBar.value =  false;

                           Get.to(() => CallScreen(call: call));
                           // Created ahead
                         } catch (e) {
                           debugPrint('Error joining or creating call: $e');
                           debugPrint(e.toString());
                         }
                       },
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: IntrinsicWidth(
                           child: Container(decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: const BorderRadius.all(Radius.circular(10)),border: Border.all(width: 1,color: Colors.black)),child:const Center(
                             child: Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.video_call,color: Colors.black,),
                                  SizedBox(width: 10),
                                  Text("Call",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18)),
                                  SizedBox(width: 10),
                                ],
                               ),
                             ),
                           )),
                         ),
                       ),
                     ),
                  )
                ],),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
