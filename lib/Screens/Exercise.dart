import 'package:cresults_widgets/Models/Program.dart';
import 'package:cresults_widgets/Screens/Results.dart';
import 'package:cresults_widgets/Widgets/PunchMetric.dart';
import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class Exercise extends StatefulWidget {
  Exercise({Key? key, required this.selectProgram}) : super(key: key);

  final Program selectProgram;

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Icon(Icons.favorite)
                  ),
                ),
                Flexible(
                  flex: 2,  
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "${widget.selectProgram.name}",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,      
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: PunchMetricWidget(
                        isTapped: true,
                        centerText: "10",
                        bottomText: "cScore", 
                        onPressed: () {  

                        },
                      )
                    ),
                  ),
                ),
              ],
            ),       
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "0/${widget.selectProgram.rounds}"
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Rounds"
                      ),
                    ), 
                  ],
                ),
                IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Results()),
                    );
                  }, 
                  icon: Icon(Icons.insights)
                )
              ],
            ),              
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: DataTable(   
                      showCheckboxColumn: false,
                      columns: [
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 1
                            ),
                          )
                        ),
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 1
                            ),
                          )
                        ),
                      ],
                      rows:getDataRow()
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit : FlexFit.tight,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5,right: 5,),
                            height: 35 ,
                            child: SlideCountdown(
                              showZeroValue : false,
                              duration: const Duration(minutes:1),
                              countUp: false,
                            ),
                          )
                        ),
                        Flexible(
                          flex: 15,
                          fit : FlexFit.tight,
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:Colors.red ,
                              border: Border.all(
                                width: 2.0,
                                color: Colors.red
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0)
                              ),
                            ),
                            child: Text(
                              widget.selectProgram.exercises[0].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )     
                ],
              ),
            )                
          ],
        ),
      )
    );
  }

  List<DataRow> getDataRow(){
    
    List<DataRow> dataRows = [];

    for(int i = 0; i <= widget.selectProgram.exercises.length -1; i++){

      DataRow dataRow = DataRow(
        cells: [
          DataCell(
            Text(
              widget.selectProgram.exercises[i].duration,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            )
          ),
          DataCell(
            Text(
              widget.selectProgram.exercises[i].name,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color:Colors.black,
              ),
            )
          ),
        ]
      );

      dataRows.add(dataRow);
    }

    return dataRows;
  }
}