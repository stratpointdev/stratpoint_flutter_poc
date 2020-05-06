import 'dart:async';
import 'dart:convert';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CMSBannerWidget extends StatefulWidget {
  final Function onPageChange;
  final Function onPageSelected;
  final Color pageIndicatorBackgroundColor;
  final Map<String, String> imagePaths;
  final Map<String, String> imageLinks;

  const CMSBannerWidget({
    this.onPageChange,
    this.onPageSelected,
    this.pageIndicatorBackgroundColor,
    @required this.imagePaths,
    @required this.imageLinks,
  });

  @override
  _CMSBannerWidgetState createState() => _CMSBannerWidgetState();
}

class _CMSBannerWidgetState extends State<CMSBannerWidget> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (currentPage < widget.imagePaths.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const String _baseUrl = 'https://contentdev.globe.com.ph';
    final String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('flutterpoc-stratpoint:Str@tp01nt'));

    return Stack(
      children: <Widget>[
        PageView.builder(
          onPageChanged: (int page) {
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
                final String currentImage =
                    widget.imagePaths.keys.toList()[index];
                _launchURL(widget.imageLinks[
                    'link' + currentImage.substring(currentImage.length - 1)]);
              },
              child: Container(
                  color: Colors.blue,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                        _baseUrl + widget.imagePaths.values.toList()[index],
                        headers: {'authorization': basicAuth}),
                  )),
            ));
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
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
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 9,
      width: 9,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).accentColor
              : const Color(0xff4A8DE0),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  Future<Void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('null url');
    }
    return null;
  }
}
