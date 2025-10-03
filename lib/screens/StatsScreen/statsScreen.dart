import 'package:flutter/material.dart';
import 'package:prac3/screens/SummaryScreen/summaryScreen.dart';

class StatsScreen extends StatefulWidget {
  final String name;
  final String chosenClass;
  final String chosenWeapon;

  const StatsScreen({
    required this.name,
    required this.chosenClass,
    required this.chosenWeapon,
  });

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int strength = 0;
  int agility = 0;
  int intelligence = 0;
  int pointsLeft = 5;

  void addPoint(String stat) {
    if (pointsLeft <= 0) return;
    setState(() {
      pointsLeft--;
      if (stat == "Сила") strength++;
      if (stat == "Ловкость") agility++;
      if (stat == "Интеллект") intelligence++;
    });
  }

  void deletePoint(String stat) {
    if (pointsLeft == 5) return;
    setState(() {
      pointsLeft++;
      if (stat == "Сила") strength--;
      if (stat == "Ловкость") agility--;
      if (stat == "Интеллект") intelligence--;
    });
  }

  void goToSummary(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => SummaryScreen(name: widget.name, chosenClass: widget.chosenClass,
        chosenWeapon: widget.chosenWeapon, strength: strength, agility: agility,
        intelligence: intelligence,  ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Характеристики")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Очков осталось: $pointsLeft",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Сила: $strength", style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return addPoint("Сила");}, child: Text("+")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return deletePoint("Сила");}, child: Text("-"))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ловкость: $agility", style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return addPoint("Ловкость");}, child: Text("+")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return deletePoint("Ловкость");}, child: Text("-"))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Интеллект: $intelligence", style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return addPoint("Интеллект");}, child: Text("+")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () { return deletePoint("Интеллект");}, child: Text("-"))
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (pointsLeft == 0) {goToSummary(context);}
              },
              child: Text("Далее"),
            ),
          ],
        ),
      ),
    );
  }
}
