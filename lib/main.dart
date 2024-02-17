import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inController = TextEditingController();
  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[300],
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'BMI CALCULATER',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text('Enter your weight, in Kg'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 50)))),
              TextField(
                controller: ftController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Enter your height,in Feet'),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 50))),
              ),
              TextField(
                controller: inController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('Enter your height,in Inch'),
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 50))),
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);
                      var msg = "";
                      if (bmi > 25) {
                        msg = "You are overweight!--BAD";
                        bgColor = Colors.red.shade200;
                      } else if (bmi < 18) {
                        msg = "You are UnderWeight!--POOR";
                        bgColor = Colors.yellow.shade200;
                      } else {
                        msg = "You are Healthy--GOOD";
                        bgColor = Colors.lightGreen.shade200;
                      }

                      setState(() {
                        result = "$msg \nYour BMI is ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all field!";
                      });
                    }
                  },
                  child: const Text("Calculate")),
              Text(
                result,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "MADE BY SHIVAM",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    backgroundColor: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
