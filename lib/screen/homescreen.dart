import 'package:calcoz/screen/bmicalculator.dart';
import 'package:calcoz/screen/lovecalculator.dart';
import 'package:calcoz/screen/normalcalculator.dart';
import 'package:calcoz/screen/scientificcalculator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final headinglist = [
      "Normal Calculator",
      "BMI Calculator",
      "Love Calculator",
      "Coming Soon",
      "Coming Soon",
      "Coming Soon",
    ];
    final headinglink = [
      const NormalCalculator(),
      const BMICalculator(),
      const LoveCalculator(),
      const ScientificCalculator(),
      const ScientificCalculator(),
      const ScientificCalculator(),
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: const Text("CalcoZ"),
          ),
          body: Center(
            child: SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: headinglist.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => headinglink[index]),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(headinglist[index], style: const TextStyle(color: Colors.white, fontSize: 17),),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }
}
