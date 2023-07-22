import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/features/users/widgets/persistent_tabbar.dart';
import 'package:tiktok_clone/features/settings/screens/settings.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Slivers are scrollable
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('MARCO'),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      foregroundColor: Colors.indigo,
                      foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/15423024",
                      ),
                      child: Text(
                        "M",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "@MARCO",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.blue.shade500,
                          size: Sizes.size16,
                        )
                      ],
                    ),
                    Gaps.v24,
                    const SizedBox(
                      height: Sizes.size48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserFamousInfo(
                            number: 0,
                            infoKind: "Following",
                          ),
                          CustomVerticalDivider(),
                          UserFamousInfo(
                            number: 10000000,
                            infoKind: "Followers",
                          ),
                          CustomVerticalDivider(),
                          UserFamousInfo(
                            number: 194300000,
                            infoKind: "Likes",
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    SizedBox(
                      width: MediaQuery.sizeOf(context)
                          .width, //MediaQuery.sizeOf(context).width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width / 3,
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    Sizes.size4,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Gaps.h4,
                          const ProfileAdditionalButton(
                            icon: FontAwesomeIcons.youtube,
                          ),
                          Gaps.h4,
                          const ProfileAdditionalButton(
                            icon: FontAwesomeIcons.caretDown,
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights...",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          "https://nomadcoders.co",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: TabBarView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 8.6 / 16,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.png",
                          image:
                              "https://cdn.pixabay.com/photo/2014/02/08/01/34/chihuahua-261490_1280.jpg",
                        ),
                      ),
                      Gaps.v10,
                    ],
                  ),
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                ),
                const Center(
                  child: Text('Page two'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAdditionalButton extends StatelessWidget {
  final IconData icon;
  const ProfileAdditionalButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Container(
        width: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          color: Colors.white,
        ),
        child: FaIcon(
          icon,
          size: Sizes.size20,
        ),
      ),
    );
  }
}

class UserFamousInfo extends StatelessWidget {
  final int number;
  final String infoKind;

  const UserFamousInfo({
    super.key,
    required this.number,
    required this.infoKind,
  });

  String _formatNumber(int number) {
    if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(2)}M';
    } else if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(2)}K';
    } else {
      return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _formatNumber(number),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v5,
        Text(
          infoKind,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      key: UniqueKey(),
      width: 32,
      thickness: 0.5,
      color: Colors.grey.shade400,
      indent: Sizes.size14,
      endIndent: Sizes.size14,
    );
  }
}
