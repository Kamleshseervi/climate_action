import 'package:flutter/material.dart';
import 'InformationScreen.dart';
import 'authservice.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to your profile!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Fill out your information to get personalized tips on reducing your carbon emissions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationScreen()),
                );
              },
              child: Text(
                'Calculate your carbon emissions',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              child: Text('Signout'),
              onPressed: () {
                AuthService().signOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
