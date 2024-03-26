import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget 
{
  @override
  MyAppState createState() => MyAppState();

  const MainApp({super.key});
}

class MyAppState extends State<MainApp> 
{
  double _number = 0;

  @override
  void initState() {
    _number = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Number Checker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Prime Number Checker"),
          backgroundColor: Colors.amber,
        ),
        body: Center(

          child: Column(
            children: [

              TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Enter a number..."
                ),
                onChanged: (text) {
                  var returnValue = double.tryParse(text);
                  if(returnValue != null) 
                  {
                    setState(() {
                      _number = returnValue;
                    });
                  }             
                },
              ),

              const SizedBox(height: 30,),

              Text(_number.toStringAsFixed(0)),
            ],
          ),

        ),
      ),
    );
  }
}
