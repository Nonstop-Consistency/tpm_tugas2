import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String enteredText = '';
  String operator = '';
  double result = 0;
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 18, left: 18),
                alignment: Alignment.centerRight,
                child: Text(
                  enteredText,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonWidget(
                        '7',
                        () {
                          setState(() {
                            enteredText += '7';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '8',
                        () {
                          setState(() {
                            enteredText += '8';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '9',
                        () {
                          setState(() {
                            enteredText += '9';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '/',
                        () {
                          setState(() {
                            operator = '/';
                            setState(() {
                              enteredText += ' / ';
                            });
                          });
                        },
                        Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonWidget(
                        '4',
                        () {
                          setState(() {
                            enteredText += '4';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '5',
                        () {
                          setState(() {
                            enteredText += '5';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '6',
                        () {
                          setState(() {
                            enteredText += '6';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '*',
                        () {
                          operator = '*';
                          setState(() {
                            enteredText += ' * ';
                          });
                        },
                        Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonWidget(
                        '1',
                        () {
                          setState(() {
                            enteredText += '1';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '2',
                        () {
                          setState(() {
                            enteredText += '2';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '3',
                        () {
                          setState(() {
                            enteredText += '3';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '+',
                        () {
                          operator = '+';
                          setState(() {
                            enteredText += ' + ';
                          });
                        },
                        Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonWidget(
                        'C',
                        () {
                          setState(() {
                            enteredText = '';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '0',
                        () {
                          setState(() {
                            enteredText += '0';
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '=',
                        () {
                          List myList = enteredText.split(' ');
                          for (var i = 0; i < myList.length; i++) {
                            if (myList[i] == '+') {
                              if (result == 0) {
                                result = double.parse(myList[i - 1]);
                              }
                              result = result + double.parse(myList[i + 1]);
                            } else if (myList[i] == '-') {
                              if (result == 0) {
                                result = double.parse(myList[i - 1]);
                              }
                              result = result - double.parse(myList[i + 1]);
                            } else if (myList[i] == '/') {
                              if (result == 0) {
                                result = double.parse(myList[i - 1]);
                              }
                              result = result / double.parse(myList[i + 1]);
                            } else if (myList[i] == '*') {
                              if (result == 0) {
                                result = double.parse(myList[i - 1]);
                              }
                              result = result * double.parse(myList[i + 1]);
                            }
                          }
                          setState(() {
                            RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
                            enteredText =
                                result.toString().replaceAll(regex, '');
                            result = 0;
                          });
                        },
                        Colors.black,
                      ),
                      buttonWidget(
                        '-',
                        () {
                          operator = '-';
                          setState(() {
                            enteredText += ' - ';
                          });
                        },
                        Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(MediaQuery.of(context).size.width / 4,
            MediaQuery.of(context).size.height / 8),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 40,
        ),
      ),
    );
  }
}
