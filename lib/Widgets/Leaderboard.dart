import 'package:cresults_widgets/Models/Leadership.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {

  List<Position> leadership = [
    Position(
      count: 420, 
      name: 'Phumu', 
    ),
    Position(
      count: 400, 
      name: 'Eric', 
    ),
    Position(
      count: 310, 
      name: 'Charl', 
    ),
  ];

  @override
  void initState() {
    super.initState();
    leadership.sort((a, b) => a.count.compareTo(b.count));
    leadership = List.from(leadership.reversed);
    print(leadership);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0)
        ),
      ),
      child: ListView.builder(
        itemCount: leadership.length,
        itemBuilder:(context, index) {

          late Widget iconWidget;

          if(index == 0){
            iconWidget = Icon(
              Icons.looks_one,
              color: Color(0xFFFFD700),
            );
          }
          else if(index == 1){
            iconWidget = Icon(
              Icons.looks_two,
              color: Color(0xFFC0C0C0),
            );
          }
          else if(index == 2){
            iconWidget = Icon(
              Icons.looks_3,
              color: Color(0xFFCD7F32),
            );
          }
          
          return Container(
            alignment: Alignment.centerLeft,
            width: 150,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  fit : FlexFit.tight,
                  child: iconWidget
                ),
                Flexible(
                  flex: 3,
                  fit : FlexFit.tight,
                  child: Text(
                    leadership[index].name
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit : FlexFit.tight,
                  child: Text(
                    leadership[index].count.toString()
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}