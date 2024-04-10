import 'dart:io';

import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/create_post_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  Common _common = Common();
  late VideoPlayerController _controller;
  var file;
  var videoFile;
  var catId;
  var langId;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', "mp4"],
    );
    if (result != null && result.files.single.extension != "mp4") {
      cropImage(result.files.single.path);
    } else {
      setState(() {
        videoFile = result!.files.single.path;
      });
      _controller = VideoPlayerController.file(File(videoFile))
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    }
  }

  cropImage(image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        file = croppedFile.path;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          MyappBarView(
            myTitle: "Create Post",
            status: true,
            action: Container(),
          ),
          file != null
              ? Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.file(File(file)),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              file = null;
                            });
                          },
                          icon: Icon(Icons.clear)),
                    )
                  ],
                )
              : videoFile != null
                  ? InkWell(
                      onTap: () {
                        _controller.play();
                      },
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                          CircleAvatar(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    videoFile = null;
                                    _controller.pause();
                                  });
                                },
                                icon: Icon(Icons.clear)),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: Card(
                        color: Colors.grey.shade200,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 25,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Tap to Add Image or Video",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
          FutureBuilder(
              future: Future.wait([categoryDropDown(), getLanguage()]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data[0].status && snapshot.data[1].status
                      ? Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Select Category",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Wrap(
                                    children: snapshot.data[0].data
                                        .map<Widget>((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    catId = e.id.toString();
                                                  });
                                                  print(catId);
                                                },
                                                child: Chip(
                                                  label: Text(
                                                    e.title,
                                                    style: TextStyle(
                                                        color: catId ==
                                                                e.id.toString()
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  backgroundColor: catId ==
                                                          e.id.toString()
                                                      ? AppColor()
                                                          .colorPrimaryDark()
                                                      : Colors.grey.shade100,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              elevation: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Select Language",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Wrap(
                                    children: snapshot.data[1].data
                                        .map<Widget>((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    langId =
                                                        e.subCatId.toString();
                                                  });
                                                  print(langId);
                                                },
                                                child: Chip(
                                                  label: Text(
                                                    e.subcatName,
                                                    style: TextStyle(
                                                        color: langId ==
                                                                e.subCatId
                                                                    .toString()
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                  backgroundColor: langId ==
                                                          e.subCatId.toString()
                                                      ? AppColor()
                                                          .colorPrimaryDark()
                                                      : Colors.grey.shade200,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Text("No Category");
                } else if (snapshot.hasError) {
                  return Icon(Icons.error_outline);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () async {
                try {
                  if (file != null ||
                      videoFile != null && catId != null && langId != null) {
                    var userId = user.userId.toString();
                    var newCatId = catId.toString();
                    var newLangId = langId.toString();
                    var type = file != null ? "image" : "video";
                    var newFile =
                        file != null ? file.toString() : videoFile.toString();
                    CreatePostModel? model = await createPost(
                        userId, newCatId, newLangId, type, newFile);
                    if (model!.status == true) {
                      Navigator.pop(context , true);
                      _common.toast("${model.message}");
                    } else {
                      _common.toast("${model.message}");
                    }
                  } else {
                    _common.toast("false");
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: ScaleAnimatedWidget.tween(
                enabled: false,
                duration: Duration(milliseconds: 200),
                scaleDisabled: 1.0,
                scaleEnabled: 0.9,
                child: Container(
                  width: 66.66.w,
                  height: 5.87.h,
                  decoration: boxDecoration(
                      radius: 30.0, bgColor: AppColor().colorPrimaryDark()),
                  child: Center(
                    child: text(
                      "Post",
                      textColor: AppColor().colorBg1(),
                      fontSize: 14.5.sp,
                      fontFamily: fontRegular,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
