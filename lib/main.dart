import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var userinput = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '+/-',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'X',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 120.0,
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Text(
                            userinput,
                            style:
                                TextStyle(fontSize: 28.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            answer,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: Colors.black,
              ))),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return buttonFunction(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  buttonFunction(int index) {
    // c
    if (index == 0) {
      return MyButton(
          color: Colors.blue[50],
          textColor: Colors.black,
          buttonText: buttons[index],
          buttontapped: () {
            setState(() {
              userinput = '';
              answer = '';
            });
          });
      // +/-
    } else if (index == 1) {
      return MyButton(
          color: Colors.blue[50],
          textColor: Colors.black,
          buttonText: buttons[index],
          buttontapped: () {
            setState(() {
              userinput = userinput.substring(0, userinput.length - 1);
            });
          });
      // %
    } else if (index == 2) {
      return MyButton(
          color: Colors.blue[50],
          textColor: Colors.black,
          buttonText: buttons[index],
          buttontapped: () {
            setState(() {
              userinput += buttons[index];
            });
          });
      // -
    } else if (index == 3) {
      return MyButton(
        color: Colors.blue[50],
        textColor: Colors.black,
        buttonText: buttons[index],
        buttontapped: () {},
      );
    } else if (index == 18) {
      return MyButton(
          color: Colors.orange[700],
          textColor: Colors.black,
          buttonText: buttons[index],
          buttontapped: () {
            setState(() {
              equalPressed();
            });
          });
    } else {
      return MyButton(
          color: isoperator(buttons[index]) ? Colors.blueAccent : Colors.white,
          textColor: isoperator(buttons[index]) ? Colors.white : Colors.black,
          buttonText: buttons[index],
          buttontapped: () {
            setState(() {
              userinput += buttons[index];
            });
          });
    }
  }

  isoperator(String x) {
    if (x == '/' || x == 'X' || x == '-' || x == '+') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll('X', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
