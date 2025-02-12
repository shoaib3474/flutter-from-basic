import 'package:flutter/material.dart';

Widget item(
  String textMsg,
  Function(String) onDelete, // Add a callback function for deleting the message
) {
  return Column(
    children: [
      Text(
        '${DateTime.now().day} / ${DateTime.now().month} /${DateTime.now().year} ',
        style: TextStyle(color: Colors.grey),
      ),
      Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  textMsg,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              IconButton(
                onPressed: () {
                  onDelete(
                      textMsg); // Call the onDelete function when the delete button is pressed
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
