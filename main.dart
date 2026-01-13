import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MaterialApp(home: XiaoYaoHomePage()));

class XiaoYaoHomePage extends StatefulWidget {
  @override
  _XiaoYaoHomePageState createState() => _XiaoYaoHomePageState();
}

class _XiaoYaoHomePageState extends State<XiaoYaoHomePage> {
  // 这里的 _mainText 是用户自选的主语言，_subText 是我们固定的中文灵魂
  String _mainText = "";
  String _subText = "";

  @override
  void initState() {
    super.initState();
    _updateDisplay();
    // 每一分钟自动检查一次时间
    Timer.periodic(Duration(minutes: 1), (timer) => _updateDisplay());
  }

  void _updateDisplay() {
    final hour = DateTime.now().hour;
    setState(() {
      if (hour >= 5 && hour < 11) {
        _mainText = "Wind at Dawn";  // 主语言（示例为英文）
        _subText = "长 风 拂 晓";      // 副语言（中文）
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
      body: Stack(
        children: [
          // 1. 背景层：调用你刚刚上传的 app001.jpg
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/app001.jpg"), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // 2. 文字层：主副双语对照
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 主语言：大字，显眼
                Text(
                  _mainText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 12), // 两行字之间的间距
                // 副语言：中文，稍小，优雅
                Text(
                  _subText,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.6), // 透明度低一点，更显高级
                    letterSpacing: 6,
                  ),
                ),
              ],
            ),
          ),

          // 3. 底部金色图标（占位逻辑）
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
                _goldIcon(Icons.Map),
                _goldIcon(Icons.WB_sunny),
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
