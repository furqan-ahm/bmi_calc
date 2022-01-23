import 'dart:math';

import 'package:bmi_calculator/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  double weight=50;
  double height=150;
  
  bool selectedMale=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReusableCard(
                    onTap: (){setState(() {selectedMale=true;});},
                    child: GenderData(isMale: true,selected: selectedMale,),
                    border: selectedMale?Border.all(color: Colors.white,width: 2):null
                ),
                ReusableCard(
                    onTap: (){setState(() {selectedMale=false;});},
                    child: GenderData(isMale: false,selected: !selectedMale,),
                    border: !selectedMale?Border.all(color: Colors.white,width: 2):null
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                    onTap: null,
                    child: MeasureData(
                      name: 'Weight',
                      unit: 'kg',
                      measure: weight,
                      decrement: (weight==0)?null:(){setState(() {weight--;});},
                      increment: (){setState(() {weight++;});},
                    ),
                    border: null
                ),
                ReusableCard(
                    onTap: null,
                    child: MeasureData(
                      name: 'Height',
                      unit: 'cm',
                      measure: height,
                      decrement: (height==10)?null:(){setState(() {height--;});},
                      increment: (){setState(() {height++;});},
                    ),
                    border: null
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: (){
              double bmi=weight/pow(height/100, 2);
              String bmiStr=bmi.toStringAsFixed(2);
              int condition;

              List<String> conditionStr=['Underweight','Healthy','Overweight'];
              List<Color> colors=[Colors.deepOrangeAccent,Colors.green,Colors.deepOrangeAccent];

              if(bmi<18.5)condition=0;
              else if(bmi<24.9)condition=1;
              else condition=2;

              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('You are',style: TextStyle(fontSize: 18),),
                            Text(conditionStr[condition],style: TextStyle(fontSize: 60,color: colors[condition]),),
                            Text('Your BMI is $bmiStr',style: TextStyle(fontSize: 18),),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Close'),
                                ),
                                onPressed: (){Navigator.pop(context);},
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.pinkAccent
              ),
              width: Size.infinite.width,
              child: Center(child: Text('Calculate')),
            ),
          )
        ],
      ),
    );
  }
}
