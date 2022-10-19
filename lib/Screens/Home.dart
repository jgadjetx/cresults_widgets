import 'package:cresults_widgets/Screens/BoxerSetup.dart';
import 'package:cresults_widgets/Widgets/CustomToggleButton.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool boxerTapped = false;
  bool trainerTapped = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: CustomToggleButton(
                    text: "Boxer",
                    isTapped : boxerTapped,
                    onPressed :() {
                      
                      setState(() {
                        boxerTapped = true;
                        trainerTapped = false;
                      });

                      Future.delayed(Duration(milliseconds: 500)).then((value){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BoxerSetup()),
                        );
                      });

                    },
                  )
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  child: CustomToggleButton(
                    text: "Trainer",
                    isTapped : trainerTapped,
                    onPressed :() {

                      setState(() {
                        boxerTapped = false;
                        trainerTapped = true;
                      });

                      Future.delayed(Duration(milliseconds: 500)).then((value){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BoxerSetup()),
                        );
                      });

                    },
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}