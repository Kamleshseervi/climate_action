import 'package:flutter/material.dart';

class User {
  String name;
  double carbonReduction;

  User({required this.name, required this.carbonReduction});
}

class LeaderBoard {
  List<User> _users = [];

  LeaderBoard(List<User> users) {
    this._users = users;
  }

  void addUser(User user) {
    _users.add(user);
  }

  void sortUsers() {
    _users.sort((a, b) => b.carbonReduction.compareTo(a.carbonReduction));
  }

  List<User> get users => _users;
}

class LeaderBoardScreen extends StatefulWidget {
  final LeaderBoard leaderBoard;

  LeaderBoardScreen({required this.leaderBoard});

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  @override
  void initState() {
    super.initState();
    widget.leaderBoard.sortUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: widget.leaderBoard.users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(widget.leaderBoard.users[index].name),
            trailing:
                Text('${widget.leaderBoard.users[index].carbonReduction}'),
          );
        },
      ),
    );
  }
}

// Sample usage of LeaderBoard class
void main() {
  List<User> users = [
    User(name: 'Alice', carbonReduction: 15.2),
    User(name: 'Bob', carbonReduction: 20.1),
    User(name: 'Charlie', carbonReduction: 10.5),
  ];
  LeaderBoard leaderBoard = LeaderBoard(users);
  runApp(MaterialApp(home: LeaderBoardScreen(leaderBoard: leaderBoard)));
}
