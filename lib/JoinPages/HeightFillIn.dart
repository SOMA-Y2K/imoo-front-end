import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imoo_v01/JoinPages/NicknameFillIn.dart';
import '../Widgets/Toolbar_BackBtn.dart';
import '../Widgets/JoinPageWidget/ProgressBar.dart';
import 'BirthFillIn.dart';

class HeightFillIn extends StatefulWidget {
  const HeightFillIn({super.key});

  @override
  State<HeightFillIn> createState() => _HeightFillInState();
}

class _HeightFillInState extends State<HeightFillIn> {
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
                        builder: (context) => const NicknameFillIn(),
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
              "키",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FillinText(
            hintText: "CM",
          ),
          SizedBox(height: 30),
          Spacer(),
          ProgressBar(
            pageNum: 3,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class GenderBtn extends StatelessWidget {
  final String gender;
  final double fontsize;
  final double padding;

  GenderBtn({
    super.key,
    required String this.gender,
    required double this.fontsize,
    double this.padding = 18,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BirthFillIn()),
        );
      },
      child: Text(
        gender,
        style: TextStyle(
          fontSize: fontsize,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 70),
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
            if (value.length >= 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NicknameFillIn(),
                ),
              );
            }
          },
          maxLength: 3,
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
