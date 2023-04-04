//import 'package:climateaction/UserInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';

import 'CommunityScreen.dart';
import 'ProfileScreen.dart';
import 'LeaderBoard.dart';

class CarbonTrackerApp extends StatefulWidget {
  @override
  _CarbonTrackerAppState createState() => _CarbonTrackerAppState();
}

class _CarbonTrackerAppState extends State<CarbonTrackerApp> {
  double _emissions = 0.0;
  int _selectedTipIndex = 0;
  double _progress = 0.0;
  int _selectedIndex = 0;

  static const List<String> _tips = [
    'Reduce your meat consumption',
    'Turn off lights and unplug electronics when not in use',
    'Use public transportation or carpool',
    'Switch to energy-efficient light bulbs',
    'Buy locally produced food',
    'Plant a tree',
    'Recycle and compost',
    'Use reusable shopping bags and water bottles',
  ];

  static const double _targetEmissions = 10.0;

  void _updateEmissions(double value) {
    setState(() {
      _emissions = value;
      _progress = _emissions / _targetEmissions;
    });
  }

  void _selectTip(int index) {
    setState(() {
      _selectedTipIndex = index;
    });
  }

  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carbon Tracker'),
        ),
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Carbon Emissions (tons CO2e) = ' + _emissions.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Slider(
                    min: 0,
                    max: 50,
                    value: _emissions,
                    onChanged: _updateEmissions,
                    label: '${_emissions.round()}',
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Recommended Tip',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _tips[_selectedTipIndex],
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: _progress,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _tips.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_tips[index]),
                          onTap: () => _selectTip(index),
                          selected: _selectedTipIndex == index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Container(
            //child: CommunityScreen(),
            //),
            //Container(
            //child: LeaderBoardScreen(
            // leaderBoard: LeaderBoard([]),
            // ),
            //  ),
            Container(
              child: ProfileScreen(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            //BottomNavigationBarItem(
            //icon: Icon(Icons.group),
            //label: 'Community',
            //),
            //BottomNavigationBarItem(
            //icon: Icon(Icons.leaderboard),
            //label: 'LeaderBoard',
            //),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
