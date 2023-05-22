import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.amber,
        Colors.pink,
        Colors.teal,
        Colors.blue,
      ]);
      setState(() {});
    }
  }

  List<Color> colors = [
    Colors.amber,
    Colors.pink,
    Colors.teal,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            'Screen $index',
            style: const TextStyle(fontSize: 68),
          ),
        ),
      ),
      scrollDirection: Axis.vertical,
      itemCount: _itemCount,
      onPageChanged: _onPageChanged,
    );
  }
}
