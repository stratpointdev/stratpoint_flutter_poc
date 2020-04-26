import 'package:flutter/material.dart';
import 'package:globe_one_poc_project/presentation/dashboard/widgets/page_indicator_widget.dart';

class CMSBannerWidget extends StatefulWidget {
  final Color pageIndicatorBackgroundColor;
  final List<Widget> pages;
  final Function(int) onPageChange;
  final Function(int) onPageSelected;

  const CMSBannerWidget({
    @required this.pages,
    this.onPageChange,
    this.onPageSelected,
    this.pageIndicatorBackgroundColor,
  });

  @override
  _CMSBannerWidgetState createState() => _CMSBannerWidgetState();
}

class _CMSBannerWidgetState extends State<CMSBannerWidget> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: this.widget.onPageChange,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (this.widget.onPageSelected != null) {
                  this.widget.onPageSelected(index);
                }
              },
              child: widget.pages[index % widget.pages.length],
            );
          },
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            color: this.widget.pageIndicatorBackgroundColor,
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: PageIndicatorWidget(
                controller: _controller,
                itemCount: this.widget.pages.length,
                onPageSelected: (int page) => _controller.animateToPage(
                  page % this.widget.pages.length,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
