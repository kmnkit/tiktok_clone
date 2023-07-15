import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _textEditingController = TextEditingController();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      seconds: 2,
    ),
  )..repeat(reverse: true);

  String _message = "";
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _message = _textEditingController.text;
      });
    });
  }

  void _onStartingInput() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onEditingComplete() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onSubmitted(String text) {
    FocusScope.of(context).unfocus();
    _message = "";
    setState(() {
      _isWriting = false;
      _textEditingController.clear();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onEditingComplete,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: Sizes.size6,
            leading: Stack(
              // Code Challenge 1: Online Mark
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/3612017",
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: Sizes.size3,
                        ),
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: Sizes.size20,
                      height: Sizes.size20,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              'Nico',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text('Active Now'),
            trailing: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size20,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size20,
                horizontal: Sizes.size14,
              ),
              itemBuilder: (context, index) {
                final isMine = index % 2 == 0;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(
                        Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: isMine ? Colors.amber : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5,
                          ),
                          bottomRight: Radius.circular(
                            isMine ? Sizes.size5 : Sizes.size20,
                          ),
                        ),
                      ),
                      child: const Text(
                        "This is a Message!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10,
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.sizeOf(context).width,
              child: BottomAppBar(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size8,
                  horizontal: 15,
                ),
                color: BottomAppBarTheme.of(context).color,
                child: Row(
                  children: [
                    Expanded(
                      // Code Challenge 2: Decorate Bottom App Bar
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size24,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Send a message...',
                          suffixIcon: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.faceGrinWink,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        onTap: _onStartingInput,
                        onSubmitted: _onSubmitted,
                        onEditingComplete: _onEditingComplete,
                      ),
                    ),
                    Gaps.h20,
                    IconButton(
                      onPressed: () => _onSubmitted(_message),
                      icon: const FaIcon(
                        FontAwesomeIcons.paperPlane,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
