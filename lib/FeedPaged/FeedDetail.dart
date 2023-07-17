import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../NavigationBar.dart';

class FeedDetail extends StatefulWidget {
  const FeedDetail({super.key});

  @override
  State<FeedDetail> createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const profile(),
                    ),
                  );
                },
                child: Image.asset(
                  "images/user.png",
                  scale: 12,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("닉네임"),
                  Text("인스타 ID"),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Image.asset(
              "images/flower.jpg",
              width: 380,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeedDetailBtn(
                  text: "좋아요 수",
                  icon: Icons.favorite_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                FeedDetailBtn(
                  text: "댓글 수",
                  icon: Icons.chat_bubble_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                FeedDetailBtn(
                  icon: Icons.share_outlined,
                ),
                Spacer(),
                FeedDetailBtn(
                  icon: Icons.bookmark_outline,
                  iconSize: 35,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                "게시 날짜",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Text(
              '게시글',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.tag_faces_outlined,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class FeedDetailBtn extends StatelessWidget {
  final String text;
  final double textSize;
  final double iconSize;
  final IconData icon;
  const FeedDetailBtn(
      {super.key,
      this.text = "",
      this.textSize = 12.0,
      this.iconSize = 30,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
