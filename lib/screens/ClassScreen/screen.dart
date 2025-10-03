import 'package:flutter/material.dart';
import 'package:prac3/screens/WeaponScreen/weaponScreen.dart';

class ClassScreen extends StatelessWidget {
  final String name;
  const ClassScreen({required this.name});

  void goToWeaponScreen(BuildContext context, String chosenClass) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => WeaponScreen(name: name, chosenClass: chosenClass ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Выбор класса")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Привет, $name!",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(width: 100, height: 100),
            Text("Выбери свой класс:",
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => goToWeaponScreen(context, "Воин"),
                  child: Text("Воин"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => goToWeaponScreen(context, "Лучник"),
                  child: Text("Лучник"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => goToWeaponScreen(context, "Маг"),
                  child: Text("Маг"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}