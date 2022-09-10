import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorUi extends StatefulWidget {
  const CalculatorUi({Key? key}) : super(key: key);

  @override
  State<CalculatorUi> createState() => _CalculatorUiState();
}

class _CalculatorUiState extends State<CalculatorUi> {
  double num1 = 0;
  double num2 = 0;
  String opr = "";
  String output ="";
  String temp = '0';
  bool click = true;

  Widget buildBtn(String btnValue, int flexValue){
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          //style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
          style: ElevatedButton.styleFrom(
            backgroundColor: (click == false) ? Colors.deepOrangeAccent : Colors.orangeAccent,
          ),
          onPressed: () {
            setState(() {
              click = !click;
            });
            setState(() {
              if(btnValue == "AC"){
                num1 = 0;
                num2 = 0;
                opr = "";
                temp = '0';
              }
              else if(btnValue == "+" || btnValue == "-" || btnValue == "x"|| btnValue == "/" ) {
                num1 = double.parse(output);
                opr = btnValue;
                temp = '';
              }
              else if(btnValue == "."){
                temp = temp+btnValue;
              }
              else if(btnValue == "=") {
                num2 = double.parse(output);

                if (opr == '+') {
                  temp = (num1 + num2).toString();
                }
                else if (opr == '-') {
                  temp = (num1 - num2).toString();
                }
                else if (opr == 'x') {
                  temp = (num1 * num2).toString();
                }
                else if (opr == '/') {
                  temp = (num1 / num2).toString();
                }
                num1 = 0;
                num2 = 0;
                opr = "";
              }
                else
                {
                  temp = temp + btnValue;
                }
                if (kDebugMode) {
                  print(temp);
                }
                setState(() {
                  output = double.parse(temp).toString();
                });

            });
          },
          child: Text(btnValue,
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrangeAccent,),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator UI",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),),
        backgroundColor: Colors.amber,
      ),
      body: Column(
            children: [
              Expanded(child: Divider(),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
                child: Text(output,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      buildBtn("AC", 2),
                      buildBtn("M", 1),
                      buildBtn("/", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildBtn("7", 1),
                      buildBtn("8", 1),
                      buildBtn("9", 1),
                      buildBtn("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildBtn("4", 1),
                      buildBtn("5", 1),
                      buildBtn("6", 1),
                      buildBtn("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildBtn("1", 1),
                      buildBtn("2", 1),
                      buildBtn("3", 1),
                      buildBtn("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildBtn("%", 1),
                      buildBtn("0", 1),
                      buildBtn(".", 1),
                      buildBtn("=", 1),
                    ],
                  ),
                ],
              ),
            ]
        ),
    );
  }
}