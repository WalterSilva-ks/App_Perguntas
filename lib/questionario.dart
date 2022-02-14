// ignore_for_file: non_constant_identifier_names

import 'package:aula01/questao.dart';
import 'package:flutter/material.dart';

import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['Resposta']
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['Texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'].toString(),
            () => responder(
              int.parse(
                resp['nota'].toString(),
              ),
            ),
          );
        })
      ],
    );
  }
}
