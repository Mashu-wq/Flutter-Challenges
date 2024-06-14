import 'dart:math';

import 'package:flutter/material.dart';

class RollarDice extends StatefulWidget {
  const RollarDice({super.key});

  @override
  State<RollarDice> createState() => _RollarDiceState();
}

class _RollarDiceState extends State<RollarDice> {
  var currentDiceRoll = 2;

  void diceRollar() {
    setState(() {
      currentDiceRoll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: diceRollar,
          child: const Text(
            'Rollar Dice',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        )
      ],
    );
  }
}
