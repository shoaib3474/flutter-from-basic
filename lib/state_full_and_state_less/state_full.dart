import 'package:flutter/material.dart';

class StateFull extends StatefulWidget {
  const StateFull({super.key});

  @override
  State<StateFull> createState() => _StateFullState();
}

class _StateFullState extends State<StateFull> {
  String changeMe = 'Change Me ';
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isChanged ? Colors.blue : Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('State Full Widget'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              changeMe,
              style: TextStyle(fontSize: 32),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    changeMe = 'New Text';
                    isChanged = true;
                  });
                },
                child: Text('Tap Me To Change Text')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    changeMe = 'Change me';
                    isChanged = false;
                  });
                },
                child: Text('Tap Me To Reverse Text'))
          ],
        ),
      ),
    );
  }
}
