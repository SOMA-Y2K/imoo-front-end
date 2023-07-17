import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/Toolbar_BackBtn.dart';
import '../Widgets/JoinPageWidget/ProgressBar.dart';

import 'StyleSelect.dart';

class NicknameFillIn extends StatefulWidget {
  const NicknameFillIn({super.key});

  @override
  State<NicknameFillIn> createState() => _NicknameFillInState();
}

class _NicknameFillInState extends State<NicknameFillIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                ToolBar_BackBtn(),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "닉네임",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FillinText(
                hintText: "5~20자, 영문자, 숫자, 특수문자",
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text("알림"),
                            content: Text("입력하신 아이디는 사용 가능합니다.\n사용하시겠습니까?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const StyleSelect(),
                                      ),
                                    );
                                  },
                                  child: Text("네")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("아니오")),
                            ],
                          );
                        });
                  },
                  child: Text(
                    "중복확인",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  style: TextButton.styleFrom(
                      minimumSize: Size(40, 30),
                      backgroundColor: Color.fromARGB(255, 55, 156, 238),
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 1, horizontal: 5)),
                ),
              ),
            ],
          ),
          Spacer(),
          ProgressBar(
            pageNum: 4,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class FillinText extends StatelessWidget {
  final String hintText;

  const FillinText({
    super.key,
    required String this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: TextFormField(
          maxLength: 20,
          cursorColor: Color.fromARGB(255, 184, 184, 184),
          cursorHeight: 30,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 59, 59, 59),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 184, 184, 184),
            ),
          ),
          inputFormatters: [FilteringTextInputFormatter.deny(' ')],
        ),
      ),
    );
  }
}
