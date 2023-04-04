import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> _posts = [];

  final _postController = TextEditingController();

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  void _addPost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        _posts.add(_postController.text);
        _postController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: InputDecoration(
                      hintText: 'What do you want to share?',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _addPost,
                  child: Text('Post'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(_posts[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
