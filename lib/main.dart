import 'package:flutter/material.dart';

Color customColor = Colors.pink.shade100;
Color customColor2 = Color(0xFF7c7ded);

// Grade calculation function (modified)
String getResult(double score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Changed to HomeScreen (now stateful)
    );
  }
}

// Converted HomeScreen to StatefulWidget
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller =
      TextEditingController(); // Added TextEditingController
  String result = ""; // Result variable to store the grade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        title: Text("Grade Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField with controller assigned
            TextField(
              controller: _controller, // Added controller to TextField
              textAlign: TextAlign.center,
              keyboardType: TextInputType
                  .number, // Set keyboard type to number for GPA input
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your GPA',
              ),
            ),
            SizedBox(height: 40),

            // ElevatedButton with onPressed logic
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double? score = double.tryParse(
                      _controller.text); // Parse input as double
                  if (score != null) {
                    result = getResult(score); // Call the result function
                  } else {
                    result = "Invalid input!"; // Handle invalid input
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text("YOUR GPA IS"),
            ),

            SizedBox(height: 20),

            // Text widget to display the result
            Text(
              result, // Display the result
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
