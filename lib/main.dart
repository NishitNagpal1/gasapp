import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gas App',
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Mairy'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> labels = ['N2O', 'NH3', 'CH4', 'CO2', 'RH1', 'RH2'];
  int bottomindex = 0;
  void onItemTapped(int index) {
    setState(() {
      bottomindex = index;
    });
    // Add additional actions based on the selected item if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        title: const Text('Gas Sensor Data Collection'),
      ),
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900)),
                width: double.infinity,
                height: 30,
                child: const Text('Sample Date and Time:',
                    style: TextStyle(fontSize: 30))),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade900)),
              width: double.infinity,
              height: 30,
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'N',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: '2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10, // Smaller font size for subscript
                        textBaseline: TextBaseline.alphabetic,
                        height:
                            1.5, // Adjust the height to position the subscript
                      ),
                    ),
                    TextSpan(
                      text: 'O:',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900)),
                width: double.infinity,
                height: 30,
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'N',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: 'H',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    TextSpan(
                        text: '3:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFeatures: [FontFeature.subscripts()])),
                  ]),
                )),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green.shade900)),
              width: double.infinity,
              height: 30,
              child: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: 'C',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                TextSpan(
                    text: 'H',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
                TextSpan(
                    text: '4:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFeatures: [FontFeature.subscripts()]))
              ])),
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900)),
                width: double.infinity,
                height: 30,
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'C',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFeatures: [FontFeature.subscripts()])),
                    TextSpan(
                        text: 'O',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFeatures: [FontFeature.subscripts()])),
                    TextSpan(
                        text: '2:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFeatures: [FontFeature.subscripts()])),
                  ]),
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900)),
                width: double.infinity,
                height: 30,
                child: const Text('RH 1 (inside):',
                    style: TextStyle(fontSize: 20))),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade900)),
                width: double.infinity,
                height: 30,
                child: const Text('RH 2 (outside):',
                    style: TextStyle(fontSize: 20))),
            BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.bluetooth), label: 'SAMPLE'),
                BottomNavigationBarItem(icon: Icon(Icons.save), label: 'SAVE'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.read_more), label: 'VIEW SAVED DATA')
              ],
              currentIndex: bottomindex,
              selectedItemColor: Colors.green,
              onTap: onItemTapped,
            ),
          ])
        ],
      ),
    );
  }
}
