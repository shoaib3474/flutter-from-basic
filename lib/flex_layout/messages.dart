import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '23 feb 2024',
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(right: 50, left: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border.all(
                  color: Colors.white,
                )),
            child: Text(
                'A quick brown fox jumps over the lazy dog .A quick brown fox jumps over the lazy dog .A quick brown fox jumps over the lazy dog .A quick brown fox jumps over the lazy dog .A quick brown fox jumps over the lazy dog .'),
          ),
        ],
      ),
    );
  }
}
