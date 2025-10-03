import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final String name;
  final String chosenClass;
  final String chosenWeapon;
  final int strength;
  final int agility;
  final int intelligence;

  const SummaryScreen({
    super.key,
    required this.name,
    required this.chosenClass,
    required this.chosenWeapon,
    required this.strength,
    required this.agility,
    required this.intelligence,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Итог персонажа")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Поздравляем, $name!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text("Класс: $chosenClass", style: TextStyle(fontSize: 20)),
            Text("Оружие: $chosenWeapon", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("Характеристики:", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text("Сила: $strength", style: TextStyle(fontSize: 18)),
            Text("Ловкость: $agility", style: TextStyle(fontSize: 18)),
            Text("Интеллект: $intelligence", style: TextStyle(fontSize: 18)),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text("Завершить и вернуться в начало"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
