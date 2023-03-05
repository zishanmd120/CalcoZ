import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "Want to know your BMI";
  var colorb = Colors.deepOrange;
  bool isIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "BMI",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textfield(weightcontroller, Icons.line_weight, "Weight"),
                buildSizedBox(),
                textfield(
                    feetcontroller, Icons.height_outlined, "Height in feet"),
                buildSizedBox(),
                textfield(
                    inchcontroller, Icons.height_outlined, "Height in inch"),
                buildSizedBox(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(22),
                      backgroundColor: Colors.black,
                      // primary: buttonBgColor,
                    ),
                    onPressed: () {
                      var wt = weightcontroller.text.toString();
                      var hft = feetcontroller.text.toString();
                      var hin = inchcontroller.text.toString();

                      if (wt != "" && hft != "" && hin != "") {
                        //BMI calculation
                        var iwt = int.parse(wt);
                        var ihft = int.parse(hft);
                        var ihin = int.parse(hin);
                        var tinch = (ihft * 12) + ihin;
                        var tcm = tinch * 2.54;
                        var tm = tcm / 100;
                        var bmi = iwt / (tm * tm);
                        var message = "";
                        if (bmi < 25 && bmi > 18) {
                          message = "Perfect weight";
                          colorb = Colors.green;
                        } else if (bmi < 18) {
                          message = "Underweight";
                          colorb = Colors.blue;
                        } else {
                          message = "Overweight";
                          colorb = Colors.red;
                        }
                        setState(() {
                          result =
                              "     BMI: ${bmi.toStringAsFixed(4)}, so \nYou have $message";
                        });
                      } else {
                        setState(() {
                          result = "Please fill up all the fields";
                        });
                      }
                    },
                    child: const Text("calculate")),
                buildSizedBox(),
                buildSizedBox(),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: colorb,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text(
                    result,
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
                buildSizedBox(),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text("Reset"),
                      Icon(Icons.autorenew_rounded),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      weightcontroller.text = "";
                      feetcontroller.text = "";
                      inchcontroller.text = "";
                      result = "Want to know your BMI";
                      colorb = Colors.deepOrange;
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
      height: 31,
    );
  }

  Widget textfield(controller, prefixIcon, label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black,
        ),
        label: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        // suffixIcon: Icon(Icons.close, color: Colors.black,),
        // suffixIcon: isIconVisible ? IconButton(
        //   onPressed: (){
        //     setState(() {
        //       weightcontroller.text = "";
        //       feetcontroller.text = "";
        //       inchcontroller.text = "";
        //     });
        //   },
        //     icon: Icon(Icons.close, color: Colors.black,),
        // ) : null,
      ),
      keyboardType: TextInputType.number,
      // onChanged: (value) {
      //   value.isNotEmpty
      //       ? setState(() => isIconVisible = true)
      //       : setState(() => isIconVisible = false);
      // },
    );
  }
}
