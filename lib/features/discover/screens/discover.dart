import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _textEditingController =
      TextEditingController(text: 'Initial Text');
  String value = "";

  void _onSearchChanged() {
    value = _textEditingController.value.text;
    if (value == "") {
      _isWriting = false;
    } else {
      _isWriting = true;
    }
  }

  void _onSearchSubmitted() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _clearSearchText() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
      _textEditingController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    _textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  bool _isWriting = false;

  // Code Challenge 1: Dismiss Keyboard on Tap TabBar
  void _onTabClicked(int index) => FocusScope.of(context).unfocus();

  void _startEditing() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            bottom: TabBar(
              onTap: _onTabClicked,
              controller: _tabController,
              splashFactory: NoSplash.splashFactory, // 탭 누를 때 물감 번지는 효과를 없앰
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              indicatorColor: Colors.black,
              labelColor: Colors.pink.shade600,
              unselectedLabelColor: Colors.grey.shade500,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  ),
              ],
            ),
            title: TextField(
              // Code Challenge 2: A Customized TextField as a replacement for CupertinoSearchTextField
              onTap: _startEditing,
              autocorrect: false,
              controller: _textEditingController,
              onEditingComplete: _onSearchSubmitted,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Sizes.size12,
                  ),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIconColor: Theme.of(context).primaryColor,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size12,
                    top: Sizes.size12,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                  ),
                ),
                suffixIcon: _isWriting
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: Sizes.size12,
                        ),
                        child: GestureDetector(
                          onTap: _clearSearchText,
                          child: FaIcon(
                            FontAwesomeIcons.circleXmark,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : null,
              ),
              textCapitalization: TextCapitalization.none,
            ),
          ),
          body: TabBarView(
            // controller: _tabController,
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(
                  Sizes.size6,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 20,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpeg",
                          image:
                              "https://cdn.pixabay.com/photo/2023/04/27/10/22/cat-7954262_1280.jpg",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "This is a very long caption for my tiktok that im upload just no currently.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16 + Sizes.size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v8,
                    DefaultTextStyle(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/15423024",
                            ),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              'My avatar is going to be very long',
                              maxLines: 1,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text(
                            '2.5M',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                itemCount: 20,
              ),
              for (var tab in tabs.skip(1))
                Center(
                  child: Text(
                    tab,
                    style: const TextStyle(fontSize: Sizes.size28),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
