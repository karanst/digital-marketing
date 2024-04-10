import 'package:digital_marketing/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelplinePage extends StatefulWidget {
  const HelplinePage({Key? key}) : super(key: key);

  @override
  State<HelplinePage> createState() => _HelplinePageState();
}

class _HelplinePageState extends State<HelplinePage> {
  Future<void>? _launched;
  bool _hasCallSupport = false;
  String _phone = '9602200734';


  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'contact@sundhanetwark.com',
  );

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    canLaunch('tel:123').then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:   AppColor().colorPrimary(),
        title: Text("Helpline"),
      ),
      body: ListView(children: [
        ListTile(
          title: Text("Email To-"),
          subtitle: Text("contact@sundhanetwark.com"),
          trailing: IconButton(
            onPressed: (){
              launchUrl(emailLaunchUri);
            },
            icon: Icon(Icons.mail),
          ),
        ),
        ListTile(
          title: Text("Contact No."),
          subtitle: Text("9602200734"),
          trailing: IconButton(
            onPressed: (){
              _makePhoneCall(_phone);
            },
            icon: Icon(Icons.phone),
          ),
        )
      ],),
    );
  }
}
