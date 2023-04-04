import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Center(
        child: Text('User Information Form'),
      ),
    );
  }
}
