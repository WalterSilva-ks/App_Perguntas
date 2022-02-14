// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String respostaTxt;

  final void Function() quandoSelecionado;

  const Resposta(this.respostaTxt, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: quandoSelecionado,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 2, color: Colors.grey),
        primary: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            respostaTxt,
          ),
        ],
      ),
    );
  }
}
