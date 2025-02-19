import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Acao {
  limpar,
  porcentagem,
  divisao,
  apagar,
  multipliacacao,
  subtracao,
  adicao,
  negativoPositivo,
  virgula,
  igual,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JG Calc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora JG Sistemas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double numberA = 0;
  double numberB = 0;
  double resultado = 0;

  String get display => resultado.toString();

  void executarAcao(Acao acao) {
    Map<Acao, Function> acoes = {
      Acao.limpar: limpar,
      Acao.porcentagem: limpar,
      Acao.divisao: limpar,
      Acao.adicao: limpar,
      Acao.apagar: apagar,
      Acao.multipliacacao: limpar,
      Acao.subtracao: limpar,
      Acao.negativoPositivo: limpar,
      Acao.virgula: limpar,
      Acao.igual: limpar,
    };

    acoes[acao]!.call();
  }

  limpar() {
    setState(() {
      resultado = 0;
      numberA = 0;
      numberB = 0;
    });
  }

  apagar() {}

  somar() {
    resultado = numberA + numberB;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    display,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 75,
            margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    display,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.c,
                    value: Acao.limpar,
                    onClicked: executarAcao,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.percent,
                    value: Acao.porcentagem,
                    onClicked: executarAcao,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.divide,
                    value: Acao.divisao,
                    onClicked: executarAcao,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.deleteLeft,
                    value: Acao.apagar,
                    onClicked: executarAcao,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.seven,
                    value: 7,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.eight,
                    value: 8,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.nine,
                    value: 9,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.x,
                    value: Acao.multipliacacao,
                    onClicked: executarAcao,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.four,
                    value: 4,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.five,
                    value: 5,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.six,
                    value: 6,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.minus,
                    value: Acao.subtracao,
                    onClicked: executarAcao,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.one,
                    value: 1,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.two,
                    value: 2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.three,
                    value: 3,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.plus,
                    value: Acao.adicao,
                    onClicked: executarAcao,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.plusMinus,
                    value: Acao.negativoPositivo,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<int>(
                    icon: FontAwesomeIcons.zero,
                    value: 0,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton<Acao>(
                    icon: FontAwesomeIcons.circle,
                    value: Acao.virgula,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 3,
                  child: CalcButton(
                    icon: FontAwesomeIcons.equals,
                    value: Acao.igual,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalcButton<T> extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.icon,
    required this.value,
    this.onClicked,
  });

  final IconData icon;
  final T value;
  final void Function(T)? onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClicked != null) {
          onClicked?.call(value);
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: FaIcon(
            icon,
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
