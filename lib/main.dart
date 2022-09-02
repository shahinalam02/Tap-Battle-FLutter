import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int redscore = 50;
  int bluescore = 50;

  void redscroeUpdate() {
    setState(() {
      redscore = redscore + 1;
      bluescore = bluescore - 1;
    });
  }

  void bluescoreUpdate() {
    setState(() {
      bluescore = bluescore + 1;
      redscore = redscore - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: redscore,
                  child: InkWell(
                    onTap: redscroeUpdate,
                    child: Container(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  flex: bluescore,
                  child: InkWell(
                    onTap: bluescoreUpdate,
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
            redscore >= 100 || bluescore >= 100
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: redscore >= 100 ? Colors.redAccent : Colors.blue,
                    child: Center(
                      child: Text(
                        "${redscore >= 100 ? "Red" : "Blue"} won!!",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
