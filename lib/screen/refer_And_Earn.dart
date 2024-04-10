
import 'dart:convert';

import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {

  var capticha='aNh2v7B3';
  TextEditingController upiCon= new TextEditingController();
  var msg = "";
  String amount="0",total="0";
  var urllink='https://play.google.com/store/apps/details?id=com.sundha.digital_marketing_marketing';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRefer();
    getWithdraw();
  }
  getRefer()async{
    SharedPreferences pref =await SharedPreferences.getInstance();

        var response = await http.post(Uri.parse("https://taskglare.in/Digital/Admin/api/Authentication/get_reffer"),body: {
          "user_id":pref.getString("userId"),
        });
        Map data = jsonDecode(response.body);

        if(data['status']){
          setState(() {
            capticha = data['refferal_code'];
            msg = data['message'];
          });
        }

  }
  getWithdraw()async{
    SharedPreferences pref =await SharedPreferences.getInstance();


    var response = await http.post(Uri.parse("https://taskglare.in/Digital/Admin/api/Authentication/get_withdrawal_list"),body: {
      "user_id":pref.getString("userId"),
    });
    Map data = jsonDecode(response.body);
    print(data);
    if(data['status']){
      setState(() {
          amount = data['wallet']!=null?data['wallet']:"0";
          total = data['total']!=null?data['total']:"0";
      });
    }

  }
  addWithdraw()async{
    SharedPreferences pref =await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse("https://taskglare.in/Digital/Admin/api/Authentication/withdrawal_request"),body: {
      "user_id":pref.getString("userId"),
      "amount":"10",
      "upi_id":upiCon.text,
    });
    Map data = jsonDecode(response.body);
    setState(() {
      loading = false;
    });
    print(data);
    if(data['status']){
        Fluttertoast.showToast(msg: data['message']);
    }

  }
  // Future<void> share(String s) async {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color:   AppColor().colorPrimary(),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Refer And Earn',
            style: TextStyle(color:   AppColor().colorPrimary(),),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //   height: height*0.3,
                //   width: width*1,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(
                //           refer),
                //       fit: BoxFit.fill,
                //     ),
                //
                //   ),
                // ),
                SizedBox(height: height/18,),
                Container(
                  height: height/4,
                  width: width,
                  decoration: BoxDecoration(image: DecorationImage(image:AssetImage(refer,),fit: BoxFit.cover)),
                ),
                SizedBox(height:height/25),
                Text('Refer And Earn',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                SizedBox(height:height/45),
                Text(msg,textAlign: TextAlign.center,),
                SizedBox(height:height/25),
                Text('Your Referral Code',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height:height/40),
                Container(
                  width: width/3,
                  decoration: BoxDecoration(
                      border: Border.all(color:   AppColor().colorPrimary(),)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child:Text(capticha)),
                  ),

                ),
                SizedBox(height: height*0.002),
                InkWell(
                    onTap: (){
                      Clipboard.setData(ClipboardData(text: capticha));
                      Fluttertoast.showToast(
                          msg: capticha,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: Text('Tap to Copy')),
                SizedBox(height:height/20),

                ElevatedButton(
                  style:  ElevatedButton.styleFrom(
                    primary:   AppColor().colorPrimary(),
                    // background
                    // foreground
                  ),
                  onPressed: () async{
                    await Share.share('Digital Marketing\n$msg\nRefer Code:$capticha\nYou can find our app from below url\n\nAndroid:\n$urllink \n\nios:\nyour ios link here:\ncom.Digital Marketing.user' );
                    },
                  child: Container(

                    width: width,
                    decoration: BoxDecoration(color:  AppColor().colorPrimary(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(child: Text('Share',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ),
                ),
                SizedBox(height: height*0.05,),
                Row(
                  children: [
                    Container(
                      height: height*0.09,
                      width: width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:   AppColor().colorPrimary(),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(

                            children: [
                              SizedBox(height: height*0.006,),
                              Text("Current Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height*0.006,),
                              Text("\u{20B9}${amount}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.03,),
                    Container(
                      height: height*0.09,
                      width: width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:   AppColor().colorPrimary(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              SizedBox(height: height*0.006,),
                              Text("Total Earnings",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: height*0.006,),
                              Text("\u{20B9}${total}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
                SizedBox(height: height*0.05,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:   AppColor().colorPrimary(),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),

                    onPressed: (){}, child: Text("Withdraw Request")),
                SizedBox(height: height*0.05,),
                Container(
                  child: TextField(
                    controller: upiCon,
                    decoration: InputDecoration(
                        hintText: "Enter Your UPI Id Here "
                    ),
                  ),
                ),
                SizedBox(height: height*0.05,),
                Text('you can withdraw only current balance amount'),
                SizedBox(height: height*0.05,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary:   AppColor().colorPrimary(),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                    onPressed: (){
                          if(upiCon.text==""){
                            Fluttertoast.showToast(msg: "Please Enter Upi ID");
                            return;
                          }
                          if(amount==null||double.parse(amount)<1){
                            Fluttertoast.showToast(msg: "Insufficient Balance");
                            return;
                          }
                          setState(() {
                            loading = true;
                          });
                          addWithdraw();
                    }, child: loading?CircularProgressIndicator(color: Colors.white,):Text("Withdraw Amount",

                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool loading = false;
}
