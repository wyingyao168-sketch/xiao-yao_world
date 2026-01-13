import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      home: XiaoYaoHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class XiaoYaoHomePage extends StatefulWidget {
  @override
  _XiaoYaoHomePageState createState() => _XiaoYaoHomePageState();
}

class _XiaoYaoHomePageState extends State<XiaoYaoHomePage> {
  String _mainText = "";
  String _subText = "";

  @override
  void initState() {
    super.initState();
    _updateDisplay();
    Timer.periodic(Duration(minutes: 1), (timer) => _updateDisplay());
  }

  void _updateDisplay() {
    final hour = DateTime.now().hour;
    setState(() {
      if (hour >= 5 && hour < 11) {
        _mainText = "Wind at Dawn";
        _subText = "长 风 拂 晓";
      } else if (hour >= 11 && hour < 14) {
        _mainText = "Watching Clouds Rise";
        _subText = "坐 看 云 起";
      } else if (hour >= 14 && hour < 21) {
        _mainText = "A Myriad of Lights";
        _subText = "万 家 灯 火";
      } else {
        _mainText = "Starlight into Dreams";
        _subText = "星 光 入 梦";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 这里的图片路径直接指向你刚刚上传的文件夹
          Positioned.fill(
            child: Image.asset(
              "assets/app001.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_mainText, textAlign: TextAlign.center, style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.w300, letterSpacing: 2)),
                SizedBox(height: 15),
                Text(_subText, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.9), letterSpacing: 8)),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _goldIcon(Icons.auto_awesome),
                _goldIcon(Icons.directions_run),
                _goldIcon(Icons.self_improvement),
                _goldIcon(Icons.map),
                _goldIcon(Icons.wb_sunny),
                _goldIcon(Icons.emoji_events),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _goldIcon(IconData icon) {
    return Icon(icon, color: Color(0xFFD4AF37), size: 28);
  }
}
