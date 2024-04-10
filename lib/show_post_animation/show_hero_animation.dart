import 'dart:io';
import 'dart:typed_data';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:http/http.dart' as http;
import 'package:digital_marketing/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';

class PhotoHero extends StatefulWidget {
  final photo;
  final onTap;
  final width;

  const PhotoHero({Key? key, this.photo, this.onTap, this.width})
      : super(key: key);

  @override
  State<PhotoHero> createState() => _PhotoHeroState();
}

class _PhotoHeroState extends State<PhotoHero> {
  Common common = Common();

  _save() async {
    var response = await Dio().get("${widget.photo}",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    if (result != null) {
      common.toast("Saved in Gallery");
    }
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Hero(
        tag: widget.photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    TextButton(
                        onPressed: () {
                          _save();
                        },
                        child: Text(
                          "Download",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
                commonImage(
                  widget.photo,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoHeroHero extends StatefulWidget {
  final photo;
  final onTap;
  final width;
  final selected;
  final selectedPost;

  const VideoHeroHero({Key? key, this.photo, this.onTap, this.width, this.selected, this.selectedPost})
      : super(key: key);

  @override
  State<VideoHeroHero> createState() => _VideoHeroHeroState();
}

class _VideoHeroHeroState extends State<VideoHeroHero> {
  late VideoPlayerController _controller;
  var showImage;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(widget.photo)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..play();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Hero(
              tag: widget.photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  child: _controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: AppColor().colorPrimaryDark(),
                              )),
                          Text(
                            "Loading",
                            style: TextStyle(color: Colors.black, fontSize: 8),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
