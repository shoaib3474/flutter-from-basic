import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

callApi() {
  final String url = '';
}

class GetApi extends StatelessWidget {
  const GetApi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('data'),
            ElevatedButton(onPressed: () {}, child: Text('Tap me '))
          ],
        ),
      ),
    );
  }
}
