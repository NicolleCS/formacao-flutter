import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void criarTransferencia(context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
}

class FormularioState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(controlador: widget._controladorCampoNumeroConta, rotulo:'Número da conta', dica:'0000'),
            Editor(controlador: widget._controladorCampoValor, rotulo:'Valor', dica:'00.0', icone:Icons.monetization_on),
            ElevatedButton(
              onPressed: () => widget.criarTransferencia(context),
              child: Text(_botaoConfirmar,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text(_tituloAppBar)),
    );
  }

}