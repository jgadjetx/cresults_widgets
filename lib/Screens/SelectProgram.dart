import 'package:cresults_widgets/Models/Program.dart' as program;
import 'package:cresults_widgets/Screens/Exercise.dart' as screen;
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';

class SelectProgram extends StatefulWidget {
  SelectProgram({Key? key}) : super(key: key);

  @override
  State<SelectProgram> createState() => _SelectProgramState();
}

class _SelectProgramState extends State<SelectProgram> {

  int selectedIndex = -1;

  List<program.Program> programs = [
    program.Program(
      name: "MMA", 
      rounds: "5", 
      time: "30:00", 
      rest: "2:00",
      exercises: [
        program.Exercise(
          name: "Warm Up",
          duration: "00:59"
        ),
        program.Exercise(
          name: "High Knees",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Push to downwward facing dog",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Knee Pull",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Leg Swing",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Gloves On",
          duration: "00:59"
        )
      ]
    ),
    program.Program(
      name: "Platform45 Championship", 
      rounds: "10", 
      time: "20:00", 
      rest: "1:00",
      exercises: [
        program.Exercise(
          name: "Warm Up",
          duration: "00:59"
        ),
        program.Exercise(
          name: "High Knees",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Push to downwward facing dog",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Knee Pull",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Leg Swing",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Gloves On",
          duration: "00:59"
        )
      ]
    ),
    program.Program(
      name: "500 Punch Challenge", 
      rounds: "4", 
      time: "10:00", 
      rest: "1:00",
      exercises: [
        program.Exercise(
          name: "Warm Up",
          duration: "00:59"
        ),
        program.Exercise(
          name: "High Knees",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Push to downwward facing dog",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Knee Pull",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Leg Swing",
          duration: "00:59"
        ),
        program.Exercise(
          name: "Gloves On",
          duration: "00:59"
        )
      ]
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: DataTable(   
                showCheckboxColumn: false,
                columns: [
                  DataColumn(
                    label: Text(
                      'PROGRAM',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'ROUNDS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'TIME',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  DataColumn(
                    label: Text(
                      'REST',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ],
                rows:getDataRow()
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: ElevatedButton(               
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( selectedIndex != -1 ? Colors.red : Colors.grey),
                  elevation: MaterialStateProperty.all(5),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),                  
                    )
                  )
                ),
                onPressed: (){ 

                  if(selectedIndex != -1){
                    FlutterBeep.beep();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => screen.Exercise( selectProgram: programs[selectedIndex])),
                    );
                  }
                  else{
                    FlutterBeep.beep();
                  }

                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 50,
                  child: Text(
                    "START",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "LibreFranklin",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DataRow> getDataRow(){
    
    List<DataRow> dataRows = [];

    for(int i = 0; i <= programs.length -1; i++){

      DataRow dataRow = DataRow(
        onSelectChanged: (value) {
          setState(() {
            selectedIndex = i;
          });
        },
        cells: [
          DataCell(
            Text(
              programs[i].name,
              style: TextStyle(
                fontWeight: selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == i ? Colors.red : Colors.black,
              ),
            )
          ),
          DataCell(
            Text(
              programs[i].rounds,
              style: TextStyle(
                fontWeight: selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == i ? Colors.red : Colors.black,
              ),
            )
          ),
          DataCell(
            Text(
              programs[i].time,
              style: TextStyle(
                fontWeight: selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == i ? Colors.red : Colors.black,
              ),
            )
          ),
          DataCell(
            Text(
              programs[i].rest,
              style: TextStyle(
                fontWeight: selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                color: selectedIndex == i ? Colors.red : Colors.black,
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