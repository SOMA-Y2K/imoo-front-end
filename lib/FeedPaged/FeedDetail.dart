import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../NavigationBar.dart';

class FeedDetail extends StatefulWidget {
  bool likeClicked = false;
  bool commentClicked = false;
  bool bookMarkClicked = false;
  bool shareClicked = false;

  FeedDetail({super.key});
  static FocusNode textFocus = FocusNode();

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
                  type: "좋아요",
                  icon1: Icons.favorite_outline,
                  icon2: Icons.favorite_outlined,
                  isClicked: widget.likeClicked,
                ),
                SizedBox(
                  width: 10,
                ),
                FeedDetailBtn(
                  text: "댓글 수",
                  type: "댓글",
                  icon1: Icons.chat_bubble_outline,
                  icon2: Icons.chat_bubble_outline,
                  isClicked: widget.commentClicked,
                ),
                SizedBox(
                  width: 10,
                ),
                FeedDetailBtn(
                  type: "공유",
                  icon1: Icons.share_outlined,
                  icon2: Icons.share_rounded,
                  isClicked: widget.shareClicked,
                ),
                Spacer(),
                FeedDetailBtn(
                  type: "저장",
                  icon1: Icons.bookmark_outline,
                  icon2: Icons.bookmark,
                  iconSize: 35,
                  isClicked: widget.bookMarkClicked,
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
          GestureDetector(
            onTap: () {
              CustomModal(context);
            },
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.1),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 35,
                        color: Colors.grey,
                      ),
                      Flexible(
                        child: TextField(
                          focusNode: FeedDetail.textFocus,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "댓글 추가...",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class FeedDetailBtn extends StatelessWidget {
  String type = "";
  bool isClicked;
  String text;
  double textSize;
  double iconSize;
  IconData icon1;
  IconData icon2;
  FeedDetailBtn(
      {super.key,
      this.text = "",
      this.textSize = 12.0,
      this.iconSize = 30,
      required this.icon1,
      required this.icon2,
      required this.isClicked,
      required this.type});

  @override
  Widget build(BuildContext context) {
    var parentContext = context.findAncestorStateOfType<_FeedDetailState>();
    return Column(
      children: [
        IconButton(
          icon: Icon(
            isClicked ? icon2 : icon1,
            size: iconSize,
          ),
          onPressed: () {
            isClicked = !isClicked;
            parentContext!.setState(() {
              if (type == "좋아요") {
                parentContext.widget.likeClicked = isClicked;
                print(isClicked);
              } else if (type == "댓글") {
                parentContext.widget.commentClicked = isClicked;
                CustomModal(context);
              } else if (type == "공유") {
                parentContext.widget.shareClicked = isClicked;
              } else {
                parentContext.widget.bookMarkClicked = isClicked;
              }
            });
          },
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

class CommentProfile extends StatelessWidget {
  Image image;
  String nickname;
  int date;
  String comment;

  CommentProfile({
    super.key,
    required this.image,
    required this.nickname,
    required this.date,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        image,
        Column(
          children: [
            Row(),
            Text(comment),
            TextButton(
              onPressed: () {},
              child: Text("답글 달기"),
            ),
          ],
        )
      ]),
    );
  }
}

Future? CustomModal(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 43,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "댓글",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            ListView(
              children: [
                CommentProfile(
                    image: Image.asset("images/user.png"),
                    nickname: "nickname",
                    date: 2,
                    comment: "안녕하세요~"),
              ],
            )
          ]),
        );
      });
}
