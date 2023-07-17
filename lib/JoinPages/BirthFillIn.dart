import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/Toolbar_BackBtn.dart';
import '../Widgets/JoinPageWidget/ProgressBar.dart';
import 'HeightFillIn.dart';

class BirthFillIn extends StatefulWidget {
  const BirthFillIn({super.key});

  @override
  State<BirthFillIn> createState() => _BirthFillInState();
}

class _BirthFillInState extends State<BirthFillIn> {
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HeightFillIn(),
                      ),
                    );
                  },
                  child: Text(
                    "넘어가기",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              "생년월일",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FillinText(
            hintText: "YY/MM/DD",
          ),
          SizedBox(height: 30),
          Spacer(),
          ProgressBar(
            pageNum: 2,
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TextFormField(
          onChanged: (value) {
            if (value.length >= 6) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HeightFillIn(),
                ),
              );
            }
          },
          maxLength: 6,
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
