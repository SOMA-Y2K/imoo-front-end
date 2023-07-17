import 'dart:async';
import 'package:flutter/material.dart';
import '../Widgets/Toolbar_BackBtn.dart';
import '../Widgets/JoinPageWidget/ProgressBar.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import '../FeedPaged/FeedDetail.dart';

class StyleSelect extends StatefulWidget {
  const StyleSelect({super.key});

  @override
  State<StyleSelect> createState() => _StyleSelectState();
}

int selectNum = 0;
bool showVisible = false;

class _StyleSelectState extends State<StyleSelect> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    selectNum = 0;
    showVisible = false;
    super.deactivate();
  }

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
              "내 취향 스타일",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: showVisible,
              child: Text(
                "$selectNum" + " selected",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            height: 20,
          ),
          Container(
            height: 480,
            child: GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              primary: false,
              children: [
                StyleContainer(
                  filepath: "images/style/american_casual.jpg",
                  num: 1,
                  styleName: "아메리칸 캐주얼",
                ),
                StyleContainer(
                  filepath: "images/style/casual.jpg",
                  num: 2,
                  styleName: "캐주얼",
                ),
                StyleContainer(
                  filepath: "images/style/dandy.jpg",
                  num: 3,
                  styleName: "댄디",
                ),
                StyleContainer(
                  filepath: "images/style/formal.jpg",
                  num: 4,
                  styleName: "포멀",
                ),
                StyleContainer(
                  filepath: "images/style/letro.jpg",
                  num: 5,
                  styleName: "레트로",
                ),
                StyleContainer(
                  filepath: "images/style/sick.jpg",
                  num: 6,
                  styleName: "시크",
                ),
                StyleContainer(
                  filepath: "images/style/sporty.jpg",
                  num: 7,
                  styleName: "스포티",
                ),
                StyleContainer(
                  filepath: "images/style/street.jpg",
                  num: 8,
                  styleName: "스트릿",
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    if (selectNum >= 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedDetail(),
                          ));
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: selectNum >= 3
                        ? Colors.blue
                        : Color.fromARGB(192, 181, 181, 181),
                    minimumSize: Size(100, 30),
                    padding: EdgeInsets.symmetric(horizontal: 162, vertical: 7),
                  ),
                  child: Text(
                    "완료",
                    style: selectNum >= 3
                        ? TextStyle(color: Colors.white, fontSize: 20)
                        : TextStyle(
                            color: Color.fromARGB(255, 156, 156, 156),
                            fontSize: 20),
                  )),
            ],
          ),
          ProgressBar(
            pageNum: 5,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class StyleContainer extends StatefulWidget {
  final String filepath;
  final int num;
  final String styleName;

  StyleContainer(
      {super.key,
      required this.filepath,
      required this.num,
      required this.styleName});

  @override
  State<StyleContainer> createState() => _StyleContainerState();
}

class _StyleContainerState extends State<StyleContainer> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    _StyleSelectState? _styleSelectState =
        context.findAncestorStateOfType<_StyleSelectState>();
    return Container(
      padding: widget.num % 2 == 0
          ? EdgeInsets.fromLTRB(20, 0, 0, 0)
          : EdgeInsets.fromLTRB(0, 0, 20, 0),
      alignment:
          widget.num % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: GestureDetector(
        onTapDown: (e) {
          _styleSelectState!.setState(() {
            if (isClicked == false && selectNum < 3) {
              selectNum++;
              isClicked = true;
            } else if (isClicked == true) {
              selectNum--;
              isClicked = false;
            }
            if (selectNum == 0) {
              showVisible = false;
            } else {
              showVisible = true;
            }
          });
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DropShadowImage(
              offset: Offset(1, 1),
              blurRadius: 0.1,
              borderRadius: 10,
              image: Image.asset(
                widget.filepath,
                scale: 5,
              ),
            ),
            Positioned(
              child: Text(
                widget.styleName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                        color: Colors.white, offset: Offset.zero, blurRadius: 1)
                  ],
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Visibility(
              visible: isClicked,
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 113, 113, 113), width: 2),
                  color: Color.fromARGB(108, 73, 73, 73),
                ),
              ),
            ),
            Visibility(
              visible: isClicked,
              child: Positioned(
                right: 2,
                top: 2,
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
