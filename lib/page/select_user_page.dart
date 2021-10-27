import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheep_game/page/game_page.dart';

class SelectUserPage extends StatefulWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  State<SelectUserPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends State<SelectUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.black,
            child: GridView.count(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              //水平子Widget之间间距
              crossAxisSpacing: 5.0,
              //垂直子Widget之间间距
              mainAxisSpacing: 5.0,
              //GridView内边距
              padding: const EdgeInsets.all(5.0),
              //一行的Widget数量
              crossAxisCount: 2,
              //子Widget宽高比例
              childAspectRatio: 1.0,
              //子Widget列表
              children: getUserList(),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      //水平子Widget之间间距
                      crossAxisSpacing: 5.0,
                      //垂直子Widget之间间距
                      mainAxisSpacing: 5.0,
                      //GridView内边距
                      padding: const EdgeInsets.all(5.0),
                      //一行的Widget数量
                      crossAxisCount: 1,
                      //子Widget宽高比例
                      childAspectRatio: 1.0,
                      //子Widget列表
                      children: getMapList(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 200,
            color: Colors.black,
            child: Column(
              children: [
                Expanded(child: Container()),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        ButtonStyleButton.allOrNull<Size>(const Size(120, 40)),
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0))), //圆角弧度
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue), //背景颜色
                  ),
                  child: const Text(
                    "出发",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GamePage()),
                    );
                  },
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getUserList() {
    return [
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
    ];
  }

  List<Widget> getMapList() {
    return [
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
      Container(color: Colors.blue),
    ];
  }
}
