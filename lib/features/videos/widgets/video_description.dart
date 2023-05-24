import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class Description extends StatefulWidget {
  final String text;

  const Description({
    super.key,
    required this.text,
  });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool shortened = false;
  void _shortenDescription() {
    shortened = !shortened;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 3,
            child: Text(
              widget.text,
              maxLines: shortened ? 1 : null,
              overflow: shortened ? TextOverflow.ellipsis : null,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
              ),
            ),
          ),
          Gaps.h10,
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: _shortenDescription,
              child: Text(
                shortened ? 'See More' : 'Shorten',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
