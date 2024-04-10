import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/GetPlanModel.dart';
import 'package:digital_marketing/model/PurchaseModel.dart';
import 'package:digital_marketing/model/get_user_profile_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart'; //UNCOMMENT

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  Common common = Common();
  Razorpay _razorpay = Razorpay(); //UNCOMMENT

  String? email;

  String? userId;

  String? phone;

  int? price;

  var amounts;

  var planT;

  var planI;


  _purchase(planT, trans , user , amounts , planI) async {
    var planTime = "$planT";
    var transaction = "$trans";
    var userIds = "$user";
    var amount = "$amounts";
    var planId = "$planI";
    PurchaseModel? model =await purchase(planTime, transaction, userIds, amount, planId);
    if(model!.status == true){
      common.toast(model.message.toString());
      Navigator.pop(context , true);
    }else{
      common.toast(model.message.toString());
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
    //UNCOMMENT
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();//UNCOMMENT
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
        title: Text("Plans"),
      ),
      body: FutureBuilder(
          future: getPlan(user.userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              GetPlanModel data = snapshot.data;
              return ListView(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: .3,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: snapshot.data.data
                        .map<Widget>((item) => Container(
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Card(
                                              elevation: 5,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      "${item.title}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text("₹ ${item.price}" , style: TextStyle(
                                                    fontWeight: FontWeight.bold , fontSize: 24,
                                                    color: AppColor().colorPrimary()
                                                  ),),
                                                  Text(
                                                    "${item.date}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                  Divider(
                                                    color: AppColor()
                                                        .colorPrimary(),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "Features",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color: AppColor()
                                                              .colorPrimary()),
                                                    ),
                                                  ),
                                                  ListView.builder(
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        item.fechar.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int ind) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "${ind + 1}) ${item.fechar[ind]}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(AppColor()
                                                                .colorPrimary())),
                                                onPressed: () {
                                                  print("purchase Plan");
                                                  price = int.parse(item.price) * 100;
                                                  amounts = price.toString();
                                                  planI = item.id.toString();
                                                  planT = item.date;
                                                  checkOut(price);
                                                },
                                                child: Text("Purchase"))
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  checkOut(price) {
    var options = {
       // 'key': 'rzp_test_EmWmOL2AXGF3P3',
      'key': 'rzp_live_zlVXkXMqavCFdb',
      'amount': "$price",
      'name': 'Posterdaily&BusinessPost Maker',
      'description': 'Plans',
    };
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    var user = Provider.of<UserProvider>(context , listen: false);
    common.toast("Payment Successful");
    _purchase(planT, "${response.paymentId}", "${user.userId}", amounts, planI);
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    common.toast("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  getUserDetails() async {
    var user = Provider.of<UserProvider>(context, listen: false);
    GetUserProfileModel? model = await getUserProfile(user.userId);
    if (model!.status == true) {
      email = model.data![0].userEmail;
      userId = model.data![0].userId;
      phone = model.data![0].userPhone;
    }
  }
}
