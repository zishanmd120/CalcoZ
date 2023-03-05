import 'package:calcoz/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class NormalCalculator extends StatefulWidget {
  const NormalCalculator({Key? key}) : super(key: key);

  @override
  State<NormalCalculator> createState() => _NormalCalculatorState();
}

class _NormalCalculatorState extends State<NormalCalculator> {
  var input = "";
  var output = "";
  var operation = "";

  // var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "AC" || value == "C") {
      input = "";
      output = "";
    } else if (value == "DEL") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser parser = Parser();
        Expression expression = parser.parse(userInput);
        ContextModel contextModel = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, contextModel);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        // input = output;
        // hideInput = true;
        outputSize = 68;
      }
    } else {
      input = input + value;
      // hideInput = false;
      outputSize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  // color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        input,
                        // hideInput ? "" : input,
                        style: const TextStyle(
                            color: Colors.deepOrangeAccent, fontSize: 58),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        output,
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: outputSize,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  button(
                    text: "AC",
                    textColor: Colors.deepOrange,
                  ),
                  button(
                    text: "C",
                    textColor: Colors.deepOrange,
                  ),
                  button(
                    text: "DEL",
                    textColor: Colors.deepOrange,
                  ),
                  button(
                    text: "/",
                  ),
                ],
              ),
              Row(
                children: [
                  button(
                    text: "7",
                  ),
                  button(
                    text: "8",
                  ),
                  button(
                    text: "9",
                  ),
                  button(
                    text: "x",
                  ),
                ],
              ),
              Row(
                children: [
                  button(
                    text: "4",
                  ),
                  button(
                    text: "5",
                  ),
                  button(
                    text: "6",
                  ),
                  button(
                    text: "-",
                  ),
                ],
              ),
              Row(
                children: [
                  button(
                    text: "1",
                  ),
                  button(
                    text: "2",
                  ),
                  button(
                    text: "3",
                  ),
                  button(
                    text: "+",
                  ),
                ],
              ),
              Row(
                children: [
                  button(
                    text: "%",
                  ),
                  button(
                    text: "0",
                  ),
                  button(
                    text: ".",
                  ),
                  button(text: "=", buttonBgColor: Colors.deepOrange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button({text, textColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(22),
            backgroundColor: buttonBgColor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
