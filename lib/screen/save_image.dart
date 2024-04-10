import 'dart:io';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/SavePostModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
 import 'package:share_plus/share_plus.dart';

class SaveImage extends StatefulWidget {
  final image;

  const SaveImage({Key? key, this.image}) : super(key: key);

  @override
  _SaveImageState createState() => _SaveImageState();
}

class _SaveImageState extends State<SaveImage> {
  Common common = Common();

  Future<File> getImageFileFromAssets() async {
    MemoryImage img = widget.image;
    var byteData = img.bytes;
    var pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    String dir = (await getApplicationSupportDirectory()).path;
    File? file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    await file.writeAsBytes(pngBytes);
    return file;
  }

  _savePost() async {
    File f = await getImageFileFromAssets();
    print(f.path);
    var user = Provider.of<UserProvider>(context, listen: false);
    SavePostModel? model =
        await savePost("${user.userId}", f.path);
    if (model!.status == true) {
      common.toast("Saved Successfully");
    } else {
      common.toast("failed");
    }
  }


  shareImage()async{
    File f = await getImageFileFromAssets();
     Share.shareFiles(['${f.path}'], text: 'Posterdaily&BusinessPost Maker');
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFileFromAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: [
          TextButton(
              onPressed: () {
                _savePost();
              },
              child: Text("Save", style: TextStyle(color: Colors.white),)),
          TextButton(
              onPressed: () {
                shareImage();
              },
              child: Text("Share", style: TextStyle(color: Colors.white),)),

        ],
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image(image: widget.image)
          ],
        ),
      ),
    );
  }
}
