import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CMSBannerWidget extends StatefulWidget {
  final Color pageIndicatorBackgroundColor;
  final Map<String, String> imagePaths;
  final Map<String, String> imageLinks;
  final Function onPageChange;
  final Function onPageSelected;

  const CMSBannerWidget({
    @required this.imagePaths,
    @required this.imageLinks,
    this.onPageChange,
    this.onPageSelected,
    this.pageIndicatorBackgroundColor,
  });

  @override
  _CMSBannerWidgetState createState() => _CMSBannerWidgetState();
}

class _CMSBannerWidgetState extends State<CMSBannerWidget> {
  int currentPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(milliseconds: 3000), (Timer timer) {
      if (currentPage < widget.imagePaths.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String _baseUrl = 'https://contentdev.globe.com.ph';
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('flutterpoc-stratpoint:Str@tp01nt'));

    return Stack(
      children: <Widget>[
        PageView.builder(
          onPageChanged: (page) {
            setState(() {
              currentPage = page;
            });
          },
          controller: _pageController,
          itemCount: widget.imagePaths.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
                child: InkWell(
              onTap: () {
                String currentImage = widget.imagePaths.keys.toList()[index];
                _launchURL(widget.imageLinks[
                    'link' + currentImage.substring(currentImage.length - 1)]);
              },
              child: Container(
                  child: CachedNetworkImage(
                      imageUrl:
                          _baseUrl + widget.imagePaths.values.toList()[index],
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      httpHeaders: {'authorization': basicAuth})),
            ));
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < widget.imagePaths.length; i++)
                    if (i == currentPage) ...[circleBar(true)] else
                      circleBar(false),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 9,
      width: 9,
      decoration: BoxDecoration(
          color: isActive ? Theme.of(context).accentColor : Color(0xff4A8DE0),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('null url');
    }
  }
}
