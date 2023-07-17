import 'package:flutter/material.dart';
import '../Widgets/Toolbar_BackBtn.dart';
import '../Widgets/JoinPageWidget/ProgressBar.dart';
import 'BirthFillIn.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
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
                          builder: (context) => const BirthFillIn()),
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
              "성별",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                GenderBtn(gender: "남", fontsize: 18),
                Spacer(),
                GenderBtn(
                  gender: "여",
                  fontsize: 18,
                ),
              ],
            ),
          ),
          Spacer(),
          ProgressBar(
            pageNum: 1,
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
