import 'package:flutter/material.dart';
import 'package:flutter_from_basic/models/post_model.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descController = TextEditingController();
List<PostModel> postList = [];
int? editIndex;

class _PostListPageState extends State<PostListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Post List Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none, // Remove the bottom line
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15), // Adjust the padding

                    hintText: 'Type your Title here',
                    prefixIcon: Icon(Icons.add),
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: descController,
                decoration: InputDecoration(
                    border: InputBorder.none, // Remove the bottom line
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15), // Adjust the padding

                    hintText: 'Type your Description  here',
                    prefixIcon: Icon(Icons.add),
                    hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (editIndex != Null) {
                    postList.add(PostModel(
                        title: titleController.text,
                        description: descController.text));
                  } else {
                    var exitingPostList = postList[editIndex!];
                    exitingPostList.title = titleController.text;
                    exitingPostList.description = descController.text;
                    setState(() {
                      postList[editIndex!] = exitingPostList;
                      editIndex = null;
                    });
                  }
                  // ignore: avoid_function_literals_in_foreach_calls
                  [titleController, descController].forEach((e) => e.clear());
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 19),
                child: Text(
                  editIndex == null ? 'Post' : 'update',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${postList[index].title} $index'),
                      subtitle: Text('${postList[index].description} $index'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  titleController.text = postList[index].title!;
                                  descController.text =
                                      postList[index].description!;
                                  editIndex = index;
                                });
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  postList.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
