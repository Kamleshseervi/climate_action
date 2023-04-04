import 'dart:developer';

import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _transportationController =
      TextEditingController();
  List<DropdownMenuItem<String>> listitems = const [
    DropdownMenuItem<String>(
        value: '0.03', child: Text("Public Transportation")),
    DropdownMenuItem<String>(value: '0.28', child: Text("Car")),
    DropdownMenuItem<String>(value: '0.00', child: Text("Bicycle")),
    DropdownMenuItem<String>(value: '10', child: Text("Walking")),
  ];
  String selectval = "0.03";
  double _emissions = 0.0;

  void _calculateEmissions() {
    double transportationEmissions = 0.0;

    double ageEmissions = 0.0;

    if (int.tryParse(_ageController.text) != null) {
      int age = int.parse(_ageController.text);
      if (age <= 18) {
        ageEmissions = 0.0;
      } else if (age <= 30) {
        ageEmissions = 0.1;
      } else if (age <= 50) {
        ageEmissions = 0.2;
      } else {
        ageEmissions = 0.3;
      }
    }

    double countryEmissions = 0.0;

    switch (_countryController.text.trim()) {
      case 'United States':
        countryEmissions = 0.27;
        break;
      case 'China':
        countryEmissions = 0.08;
        break;
      case 'India':
        log("India");
        countryEmissions = 0.03;
        break;
      case 'Russia':
        countryEmissions = 0.16;
        break;
      case 'Brazil':
        countryEmissions = 0.07;
        break;
      default:
        countryEmissions = 0.0;
    }

    setState(() {
      log(selectval);
      log(double.parse(selectval).toString());
      log(ageEmissions.toString());
      log(countryEmissions.toString());

      _emissions = (selectval == '10' ? 0.00 : double.parse(selectval)) +
          ageEmissions +
          countryEmissions;
      log(_emissions.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please provide some information to help us calculate your carbon emissions:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              controller: _ageController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Country',
              ),
              controller: _countryController,
            ),
            const SizedBox(height: 16),
            const Text(
              'Transportation Method',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectval,
              onChanged: (value) {
                setState(() {
                  selectval = value.toString();
                });
              },
              items: listitems,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateEmissions,
              child: const Text('Calculate Emissions'),
            ),
            const SizedBox(height: 16),
            Text(
              'Your carbon emissions are: $_emissions',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
