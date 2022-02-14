// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int resultado;
  final void Function() quandoRestart;

  const Resultado(this.resultado, this.quandoRestart);

  String get fraseResult {
    if (resultado < 8) {
      return "Parabens";
    } else if (resultado < 12) {
      return "Você é bom";
    } else if (resultado < 16) {
      return "Impresionante";
    } else {
      return "Nível Jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            child: Text(
              fraseResult,
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: quandoRestart,
          child: const Text("Reiniciar?",
              style: TextStyle(fontSize: 20, color: Colors.red)),
        )
      ],
    );
  }
}
