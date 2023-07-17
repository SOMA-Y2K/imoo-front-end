import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final int pageNum;

  const ProgressBar({
    super.key,
    required this.pageNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              "$pageNum / 5",
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 148, 148, 148)),
            ),
          ),
          LinearPercentIndicator(
            barRadius: Radius.circular(3),
            width: 380,
            animation: false,
            lineHeight: 10,
            backgroundColor: Color.fromARGB(255, 202, 202, 202),
            progressColor: Color.fromARGB(255, 105, 212, 109),
            percent: pageNum / 5,
          ),
        ],
      ),
    );
  }
}
