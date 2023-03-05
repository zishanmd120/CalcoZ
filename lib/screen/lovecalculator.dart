import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoveCalculator extends StatefulWidget {
  const LoveCalculator({Key? key}) : super(key: key);

  @override
  State<LoveCalculator> createState() => _LoveCalculatorState();
}

class _LoveCalculatorState extends State<LoveCalculator> {
  String randomNumber = "0";
  var maleNameController = TextEditingController();
  var femaleNameController = TextEditingController();

  void lovemeter() {
    if (maleNameController.text != "" && femaleNameController.text != "") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            var message = "";
            var rdnm = int.parse(randomNumber);
            if (rdnm > 80) {
              message = "Very Good Chance of Relation";
            } else if (rdnm > 50 && rdnm < 80) {
              message = "Good Chance of Relation";
            } else if (rdnm < 50 && rdnm > 20) {
              message = "Bad Chance of Relation";
            } else {
              message = "Very Bad Chance of Relation";
            }
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                ],
              ),
              content: SizedBox(
                height: 200,
                child: Stack(children: [
                  Center(
                    child: Lottie.asset("assets/love.json", width: 200, height: 200),
                  ),
                  Center(
                    child: Text(
                      "$randomNumber%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "Love Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                buildSizedBox(),
                buildSizedBox(),
                const Text(
                  "Find your true love",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                textfield(maleNameController, Icons.male, "Male"),
                buildSizedBox(),
                buildSizedBox(),
                textfield(femaleNameController, Icons.female, "Female"),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(22),
                    side: const BorderSide(color: Colors.red, width: 3),
                  ),
                  onPressed: () {
                    lovemeter();
                    setState(() {
                      randomNumber = Random().nextInt(101).toString();
                    });
                  },
                  child: const Text(
                    "Ask CalcoZ",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                buildSizedBox(),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "Reset",
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.autorenew_rounded,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      maleNameController.text = "";
                      femaleNameController.text = "";
                      randomNumber = "0";
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSizedBox() {
    return const SizedBox(
      height: 12,
    );
  }

  Widget textfield(controller, prefixIcon, label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.red,
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.red),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
