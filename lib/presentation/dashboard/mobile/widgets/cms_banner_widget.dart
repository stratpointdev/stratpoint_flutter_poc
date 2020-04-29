import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CMSBannerWidget extends StatefulWidget {
  final Color pageIndicatorBackgroundColor;
  final List<String> imagePaths;
  final List<String> imageLinks;
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
  int totalPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.imagePaths.length; i++) {
      widget.imagePaths[i] == null ? totalPage : totalPage++;
    }
    Timer.periodic(Duration(milliseconds: 3000), (Timer timer) {
      if (currentPage < totalPage) {
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
            return widget.imagePaths[index] != null
                ? Material(
                    child: InkWell(
                    onTap: () {
                      _launchURL(widget.imageLinks[index]);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: new DecorationImage(
                        image: new NetworkImage(
                            _baseUrl + widget.imagePaths[index],
                            headers: <String, String>{
                              'authorization': basicAuth
                            }),
                        fit: BoxFit.cover,
                      ),
                    )),
                  ))
                : null;
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
                  for (int i = 0; i < totalPage; i++)
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
