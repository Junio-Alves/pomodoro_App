import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int valorContar = 100;
  int valorContado = 0;
  bool contando = false;
  bool pausarContador = false;
  pausarContagem() {}
  despausarContagem() {}
  zerarContagem() {
    valorContado = valorContar;
    pausarContagem();
  }

  Future<void> iniciarContagem() async {
    valorContado = valorContar;
    contando = true;
    for (int i = 0; i < valorContar; i++) {
      if (contando = true) {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          valorContado--;
        });
      }
    }
    contando = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pomodoro App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            contando
                ? textWidget(valorContado ~/ 60, valorContado % 60)
                : textWidget(valorContar ~/ 60, valorContar % 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (contando == false) {
                        iniciarContagem();
                      }
                    },
                    child: const Text("Iniciar Contagem")),
                ElevatedButton(
                    onPressed: () {
                      if (contando == true) {
                        zerarContagem();
                      }
                    },
                    child: const Text("Zerar")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textWidget(int minuto, int segundo) {
    return Text(
      "$minuto : $segundo",
      style: const TextStyle(fontSize: 60),
    );
  }
}
