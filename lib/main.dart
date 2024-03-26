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
  int _number = 0;
  String _resultMessage = '';

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
                  var returnValue = int.tryParse(text);
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

              const SizedBox(height: 30),

              ElevatedButton(
                child: const Text('Check Number'),
                onPressed: () {
                  if(_number == 0)
                  {
                    return;
                  }
                  else 
                  {
                    isPrime(_number);
                  }
                }
              ),
              const SizedBox(height: 30),

              Text(_resultMessage),
            ],
          ),

        ),
      ),
    );
  }
  void isPrime(int value)
  {
    bool isPrime = false;
    for( var i = 2; i <= value / 2; i++)
    {
      if( value % i == 0)
      {
          isPrime = false;
          break;
      }
      isPrime = true;
    }
    

    if(isPrime == true){
      _resultMessage = "The number is Prime!";
    }
    else {
      _resultMessage = "The number is NOT Prime.";
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }
}
