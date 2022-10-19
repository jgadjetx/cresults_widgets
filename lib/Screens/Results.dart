import 'package:cresults_widgets/Widgets/Leaderboard.dart';
import 'package:cresults_widgets/Widgets/PunchMetric.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class Results extends StatefulWidget {
  Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  bool punchCountTapped = false;
  bool avarageSpeedTapped = false;
  bool cScoreTapped = false;
  
  List<Map<String, Object>>? currentData;

  @override
  void initState() {
    super.initState();
    determinedPunchMetricTapped(0);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20, top: 5),
                alignment: Alignment.centerRight,
                child: Leaderboard()
              ),
              Flexible(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PunchMetricWidget(
                          isTapped: punchCountTapped,
                          onPressed:() {
                            determinedPunchMetricTapped(0);
                          },
                          centerText: "0",
                          bottomText: "Punch Count",
                        ),
                        PunchMetricWidget(
                          isTapped: avarageSpeedTapped,
                          onPressed:() {
                            determinedPunchMetricTapped(1);
                          },
                          heading: "KM/H" ,
                          centerText: "0",
                          bottomText: "Avarage Speed",
                        ),
                        PunchMetricWidget(
                          isTapped: cScoreTapped,
                          onPressed:() {
                            determinedPunchMetricTapped(2);
                          },
                          centerText: "0",
                          bottomText: "cScore",
                        )
                      ],
                    ),
                    Flexible(
                      child: Chart(
                        data: currentData!,
                        variables: {
                          'round': Variable(
                            accessor: (Map map) => map['round'] as String,
                          ),
                          'amount': Variable(
                            accessor: (Map map) => map['amount'] as num,
                          ),
                        },
                        elements: [
                          IntervalElement()
                        ],
                        axes: [
                          Defaults.horizontalAxis,
                          Defaults.verticalAxis,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  void determinedPunchMetricTapped(int i){

    if(i == 0){

      punchCountTapped = true;
      avarageSpeedTapped = false;
      cScoreTapped = false;

      List<Map<String, Object>> data = [
        { 'round': 'R1', 'amount': 205 },
        { 'round': 'R2', 'amount': 122 },
        { 'round': 'R3', 'amount': 100 },
        { 'round': 'R4', 'amount': 100 },
        { 'round': 'R5', 'amount': 150 }
      ];

      setState(() {
        currentData = data;
      });

    }
    else if(i == 1){
      punchCountTapped = false;
      avarageSpeedTapped = true;
      cScoreTapped = false;

      List<Map<String, Object>> data = [
        { 'round': 'R1', 'amount': 20.5 },
        { 'round': 'R2', 'amount': 19 },
        { 'round': 'R3', 'amount': 25 },
        { 'round': 'R4', 'amount': 19 },
        { 'round': 'R5', 'amount': 30 }
      ];

      setState(() {
        currentData = data;
      });
    }
    else if(i == 2){
      punchCountTapped = false;
      avarageSpeedTapped = false;
      cScoreTapped = true;

      List<Map<String, Object>> data = [
        { 'round': 'R1', 'amount': 1000 },
        { 'round': 'R2', 'amount': 1300 },
        { 'round': 'R3', 'amount': 1340 },
        { 'round': 'R4', 'amount': 1332 },
        { 'round': 'R5', 'amount': 800 }
      ];

      setState(() {
        currentData = data;
      });
    }

  }
}