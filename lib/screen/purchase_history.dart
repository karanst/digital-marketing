import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/PurchaseHistoryModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor().colorPrimary(),
        title: Text("History"),
      ),
      body: FutureBuilder(
          future: purchaseHistory(user.userId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              PurchaseHistoryModel his = snapshot.data;
              return his.status == true
                  ? ListView.builder(
                      itemCount: his.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        user.planStatus = his.data![index].expSta;
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("${his.data![index].planName}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.0,),
                                    Text("Expiry Date: ${his.data![index].planExpireDate}"),
                                    SizedBox(height: 5.0,),
                                    Text("₹ ${his.data![index].price}"),
                                  ],
                                ),
                                trailing: Text("Success", style: TextStyle(color: Colors.green),),
                              ),
                              Wrap(children: [
                                Chip(
                                    backgroundColor: AppColor().colorPrimary(),
                                    label: Text("Purchase Date: ${his.data![index].onDate}" , style: TextStyle(color: Colors.white),)),
                              ],)
                            ],
                          ),
                        );
                      },
                    )
                  : Center(child: Text("No Any Purchase Plan"),);
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
