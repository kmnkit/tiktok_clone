import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  final PageController _pageController = PageController();
  final Curve _scrollCurve = Curves.linear;
  final Duration _scrollDuration = const Duration(milliseconds: 250);

  void _onPageChanged(int page) {
    _pageController.animateToPage(page,
        duration: _scrollDuration, curve: _scrollCurve);
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  // _pageController.nextPage(
  //   curve: _scrollCurve,
  //   duration: _scrollDuration,
  // );
  void _onVideoFinished() {
    return;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 40,
      edgeOffset: 10,
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => VideoPost(
          onVideoFinished: _onVideoFinished,
          index: index,
        ),
        scrollDirection: Axis.vertical,
        itemCount: _itemCount,
        onPageChanged: _onPageChanged,
      ),
    );
  }
}
