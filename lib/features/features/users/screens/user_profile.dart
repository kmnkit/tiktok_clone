import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Slivers are scrollable
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink.shade200,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/firework.jpeg",
              fit: BoxFit.cover,
            ),
            title: const Text(
              "Hello!",
            ),
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
          ),
          // floating: true,
          // snap: true,
          // pinned: true,
          stretch: true,
          // pinned: true, // 배경색과 flexible space bar의 title 보여줌
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 20,
              )
            ],
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 30,
              (context, index) => Container(
                color: Colors.amber[100 * (index % 9)],
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Item $index"),
                ),
              ),
            ),
            itemExtent: 80),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 30,
            (context, index) => Container(
              color: Colors.blue[100 * (index % 9)],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        )
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: FractionallySizedBox(
        key: UniqueKey(),
        heightFactor: 1,
        child: const Center(
          child: Text(
            'Title!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70; // max height

  @override
  double get minExtent => 30; // min height

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // flutter에게 보여져야 하는지 알려주는 메소드
    return false; // Just for now
  }
}
