import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> callApi() async {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  _GetApiState createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  late Future<List<dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get API Example'),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data found');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['title']),
                    subtitle: Text(snapshot.data![index]['body']),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
