import 'dart:html';
import 'package:flutter/material.dart';
import 'invoice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String _title = 'EVA energia';

  void resultado() {
    invoice.periodo = periodoCtrl.text;
    invoice.cpf = cpfCtrl.text;
    invoice.uc = ucCtrl.text;
    invoice.ug = ugCtrl.text;
    invoice.valor = valorCtrl.text;
    invoice.energia = energiaCtrl.text;
    invoice.indicador = indicadorCtrl.text;

    print(invoice);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP EVA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: resultado,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
              width: constraints.maxWidth,
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _firstController,
                child: ListView.builder(
                    controller: _firstController,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              'Por favor, complete os passos ',
                              style: const TextStyle(fontSize: 20),
                            ),
                            const passos(),
                          ],
                        ),
                      );
                    }),
              ))
        ],
      );
    });
  }
}

class passos extends StatefulWidget {
  const passos({Key? key}) : super(key: key);

  @override
  State<passos> createState() => _passosState();
}

class _passosState extends State<passos> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.red)),
        child: Stepper(
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () {
              if (_index <= 3) {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: <Step>[
              Step(
                state: _index > 0 ? StepState.complete : StepState.indexed,
                isActive: _index >= 0,
                title: const Text('1º passo'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Campo(
                          label: 'Periodo:',
                          txtCtrl: periodoCtrl,
                        ),
                      ],
                    )),
              ),
              Step(
                state: _index > 1 ? StepState.complete : StepState.indexed,
                isActive: _index >= 1,
                title: const Text('2º passo'),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Campo(
                        label: 'Nome:',
                        txtCtrl: nomeCtrl,
                      ),
                      Campo(
                        label: 'CPF: ',
                        txtCtrl: cpfCtrl,
                      ),
                      Campo(
                        label: 'UG: ',
                        txtCtrl: ugCtrl,
                      ),
                      Campo(
                        label: 'UC: ',
                        txtCtrl: ucCtrl,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                state: _index > 2 ? StepState.complete : StepState.indexed,
                isActive: _index >= 2,
                title: const Text('3º passo'),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Campo(
                        label: 'Valor:',
                        txtCtrl: valorCtrl,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                state: _index > 3 ? StepState.complete : StepState.indexed,
                isActive: _index >= 3,
                title: const Text('4º passo'),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Campo(label: 'Energia:', txtCtrl: energiaCtrl),
                    ],
                  ),
                ),
              ),
              Step(
                state: _index > 4 ? StepState.complete : StepState.indexed,
                isActive: _index >= 4,
                title: const Text('5º passo'),
                content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Campo(
                        label: 'Indicador:',
                        txtCtrl: indicadorCtrl,
                      ),
                    ],
                  ),
                ),
              ),
            ]));
  }
}

TextEditingController periodoCtrl = TextEditingController();
TextEditingController nomeCtrl = TextEditingController();
TextEditingController cpfCtrl = TextEditingController();
TextEditingController ugCtrl = TextEditingController();
TextEditingController ucCtrl = TextEditingController();
TextEditingController valorCtrl = TextEditingController();
TextEditingController energiaCtrl = TextEditingController();
TextEditingController indicadorCtrl = TextEditingController();

InvoiceModel invoice = InvoiceModel(
    periodo: ' ',
    nome: ' ',
    cpf: ' ',
    ug: ' ',
    uc: ' ',
    valor: ' ',
    energia: ' ',
    indicador: ' ');

class Campo extends StatelessWidget {
  const Campo({
    Key? key,
    required this.label,
    required this.txtCtrl,
  }) : super(key: key);

  final String label;
  final TextEditingController txtCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 20, top: 4, bottom: 4),
      child: TextField(
        controller: txtCtrl,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
