import 'package:cresults_widgets/Screens/SelectProgram.dart';
import 'package:cresults_widgets/Widgets/CustomToggleButton.dart';
import 'package:cresults_widgets/Widgets/PunchMetric.dart';
import 'package:cresults_widgets/Widgets/RoundedTextField.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BoxerSetup extends StatefulWidget {
  BoxerSetup({Key? key}) : super(key: key);

  @override
  State<BoxerSetup> createState() => _BoxerSetupState();
}

class _BoxerSetupState extends State<BoxerSetup> {

  String tapped = 'none';
  final TextEditingController nameController = TextEditingController();

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  bool punchCountTapped = false;
  bool avarageSpeedTapped = false;
  bool cScoreTapped = false;

  String? selectedValue;

  bool groupTapped = false;
  bool individualTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "STEP 1. SELECT SESSION"
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 180,
                              child: CustomToggleButton(
                                text: "GROUP",
                                isTapped : groupTapped,
                                onPressed :() {
                                  
                                  setState(() {
                                    groupTapped = true;
                                    individualTapped = false;
                                  });

                                },
                              )
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 180,
                              child: CustomToggleButton(
                                text: "INDIVIDUAL",
                                isTapped : individualTapped,
                                onPressed :() {
                                  
                                  setState(() {
                                    groupTapped = false;
                                    individualTapped = true;
                                  });

                                },
                              )
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "STEP 2. SELECT PROGRAM"
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 20),
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          isExpanded: true,
                          hint: const Text(
                            'Select Program',
                            style: TextStyle(fontSize: 14),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                          buttonHeight: 60,
                          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          items: items.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                          },
                          onChanged: (value) {
                          
                          
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                        ),
                      ),
                      Text(
                        "STEP 3. ENTER NAME (OPTIONAL)"
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 20),
                        child: RoundedTextFormField(
                          editingController: nameController,
                        ),
                      ),
                      Text(
                        "STEP 4. SELECT PUNCH METRIC"
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
                      )
                      
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "STEP 5. HOW TO PLACE YOUR PUNCH TRACKERS"
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "assets/punch.jpeg"
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(               
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey),
                            elevation: MaterialStateProperty.all(5),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),                  
                              )
                            )
                          ),
                          onPressed: (){ 

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SelectProgram()),
                            );
                          },
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "LibreFranklin",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],  
          )
        ),
      ),
    );
  }

  void determinedPunchMetricTapped(int i){

    if(i == 0){

      punchCountTapped = true;
      avarageSpeedTapped = false;
      cScoreTapped = false;

    }else if(i == 1){
      punchCountTapped = false;
      avarageSpeedTapped = true;
      cScoreTapped = false;
    }
    else if(i == 2){
      punchCountTapped = false;
      avarageSpeedTapped = false;
      cScoreTapped = true;
    }

    setState(() {
      
    });

  }
}