// ignore_for_file: annotate_overrides, avoid_print, use_key_in_widget_constructors, unused_local_variable

import 'package:aula01/questionario.dart';
import 'package:aula01/resultado.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

@override
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int selecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'Texto': "Qual é seu animal favorito? ",
      'Resposta': [
        {'texto': "camelo", 'nota': 3},
        {'texto': "peixe", 'nota': 5},
        {'texto': "dog", 'nota': 6},
        {'texto': "coelho", 'nota': 3},
      ]
    },
    {
      'Texto': "Qua é sua cor favorita?",
      'Resposta': [
        {'texto': "azul", 'nota': 5},
        {'texto': "vermelho", 'nota': 7},
        {'texto': "amarelo", 'nota': 2},
        {'texto': "marrom", 'nota': 10},
      ]
    },
    {
      'Texto': "Comida favorita",
      'Resposta': [
        {'texto': "feijão", 'nota': 4},
        {'texto': "arroz", 'nota': 7},
        {'texto': "carne", 'nota': 2},
        {'texto': "tomate", 'nota': 2},
      ]
    },
    {
      'Texto': "Jogo favorito",
      'Resposta': [
        {'texto': "Assasin Creed", 'nota': 5},
        {'texto': "God of war", 'nota': 5},
        {'texto': "Need for Speed", 'nota': 8},
        {'texto': "CupHead", 'nota': 0},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        selecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _restart() {
    setState(() {
      selecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return selecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    // Pegar respostas copm Map(Forma mais declarativa)

    // Pegar respostas com for
    // for (String textoResposta in respostas) {
    //   widgetsResposta.add(Resposta(textoResposta, _responder));
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: selecionada,
                responder: _responder)
            : Resultado(_pontuacaoTotal, _restart),
      ),
    );
  }
}
