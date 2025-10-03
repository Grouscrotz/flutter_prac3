import 'package:flutter/material.dart';
import 'package:prac3/screens/StatsScreen/statsScreen.dart';

class WeaponScreen extends StatelessWidget {
  final String name;
  final String chosenClass;
  const WeaponScreen({required this.name, required this.chosenClass});

  void goToStatsScreen(BuildContext context, String chosenClass, String chosenWeapon) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => StatsScreen(name: name, chosenClass: chosenClass, chosenWeapon: chosenWeapon, ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Выбор оружия")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Итак, $name! Ты - $chosenClass!",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30,),
            Text("Отлично! Теперь тебе стоит подумать о том, с чем ты будешь сражаться! Но выбирай оружие с умом.",
              style: TextStyle(fontSize:14),
              softWrap: true,),
            SizedBox(width: 100, height: 100),
            Text("Выбери себе оружие:",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => goToStatsScreen(context, chosenClass, "Меч"),
                  child: Text("Меч"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => goToStatsScreen(context,chosenClass, "Лук"),
                  child: Text("Лук"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => goToStatsScreen(context,chosenClass, "Посох"),
                  child: Text("Посох"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}