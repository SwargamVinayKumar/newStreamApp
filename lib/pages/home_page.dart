import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newstream/components/call_alert_dialog.dart';
import 'package:newstream/extentions/statefullwrapper.dart';
import 'package:newstream/response_models/auth_response_model.dart';
import 'package:newstream/response_models/users_response_model.dart';
import 'package:newstream/view_models/auth_view_model.dart';
import 'package:newstream/view_models/users_view_model.dart';
import 'package:stream_video/stream_video.dart';
import 'package:uuid/uuid.dart';

import '../callScreen.dart';



class HomePage extends StatefulWidget {
  final String currentUserId;
  const HomePage({super.key, required this.currentUserId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authViewModel = Get.put(AuthViewModel());
  final userViewModel = Get.put(UsersViewModel());

  var streamInstance = StreamVideo.instance;
  var callId = "";
  var otherUserId = "";
  var progressBar = false;


  @override
  Widget build(BuildContext context) {
    return  StatefulWrapper(
      onInit: (){
        authViewModel.performFetchUserDetails();
        userViewModel.fetchUsers();
      },
      child: Scaffold(
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: progressBar,
                    child: const SizedBox(width: 50,height: 50,
                      child:
                      CircularProgressIndicator(),),
                  )
                ],
              ),
              const Text("Stream Call Users",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24),),
              const SizedBox(height: 20),
              Expanded(
                child: Obx( () => userViewModel.fetchUsersObserver.value.maybeWhen(
                     loading: (loading) => const Center(child: SizedBox(width:30,height:30,child: CircularProgressIndicator())),
                    success: (data){
                      final List<UserDataModel> userDataList = (data as FetchUsersResponseModel?)?.data ?? List.empty();
                      return ListView.builder(
                        itemCount:userDataList.length ?? 0,
                           itemBuilder: (context, index){
                         final userDetails =userDataList[index];
                         return Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                           child: GestureDetector(
                             onTap:(){
                               if(widget.currentUserId.isNotEmpty){
                                 showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return CallAlertDialog(currentUserId: widget.currentUserId,userDataModel:userDetails);
                                     });
                               }
                               else{
                                  Get.snackbar("Error", "User Details error");
                               }
                             },
                             child: Container(
                               width: double.infinity,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.black,width: 0.3)),child:
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Image.asset('assets/images/person.png',width: 30,height: 30,),
                                     Column(
                                       children: [
                                         Text(userDetails.name ?? ''),
                                         const SizedBox(height: 5),
                                         Text(userDetails.mobile.toString() ?? ''),
                                       ],
                                     ),
                                     const Icon(
                                       Icons.video_call,
                                       color: Colors.black,
                                     )
                                   ],
                                 ),
                               ),),
                           ),
                         );
                       });
                    },
                    orElse: (){
                       return SizedBox();
                    }
                )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

