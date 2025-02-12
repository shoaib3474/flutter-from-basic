import 'package:flutter/material.dart';
import 'package:flutter_from_basic/flex_layout/messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController msgController = TextEditingController();
List<String> msgList = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.person,
              size: 36,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: msgList
                    .map((textMsg) => item(textMsg, (msg) {
                          setState(() {
                            msgList.remove(
                                msg); // Remove the message from the list
                          });
                        }))
                    .toList(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: msgController,
                      decoration: InputDecoration(
                          hintText: 'Type your message here',
                          prefixIcon: Icon(Icons.add),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 26, right: 16),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          msgList.add(msgController.text);
                          msgController.clear();
                        });
                      },
                      icon: Icon(
                        Icons.send,
                        size: 32,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
