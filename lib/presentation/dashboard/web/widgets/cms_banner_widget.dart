import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



// reusable widget that display CMS Banner(List of Images, redirect links);
class CMSBannerWidget extends StatefulWidget {
  const CMSBannerWidget({
    this.onPageChange,
    this.onPageSelected,
    this.pageIndicatorBackgroundColor,
    @required this.imageList,
    @required this.imageLinks,
  });

  final Function onPageChange;
  final Function onPageSelected;
  final Color pageIndicatorBackgroundColor;
  final List<Image> imageList;
  final Map<String, String> imageLinks;

  @override
  _CMSBannerWidgetState createState() => _CMSBannerWidgetState();
}

class _CMSBannerWidgetState extends State<CMSBannerWidget> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          height: 95,
          child: PageView.builder(
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            controller: _pageController,
            itemCount:widget.imageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                  child: InkWell(
                onTap: () {
                  _launchURL(widget.imageLinks.values.toList()[index]);
                },
                child: Container(
                    color: Colors.blue,
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: widget.imageList[index]),
                     ),
              ));
            },
          ),
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
                  for (int i = 0; i < widget.imageList.length; i++)
                    if (i == currentPage) ...<Widget>[circleBar(true)] else
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
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 9,
      width: 9,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).accentColor
              : const Color(0xff4A8DE0),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }

  Future<void> _launchURL(String url) async {
    print('url $url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('null url');
    }
  }
}
