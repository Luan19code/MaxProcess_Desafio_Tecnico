import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:max_process/providers/cliente.dart';
import 'package:max_process/utils/app_rotas.dart';
import 'package:max_process/utils/variaveis_globais.dart';
import 'package:provider/provider.dart';

class AdicionarCliente extends StatefulWidget {
  @override
  _AdicionarClienteState createState() => _AdicionarClienteState();
}

class _AdicionarClienteState extends State<AdicionarCliente> {
  Widget telefones({int index}) {
    var _controllerTel = new MaskedTextController(mask: '(00) 0 0000-0000');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _controllerTel,
        onSaved: (newValue) => _telefones.add(newValue),
        decoration: InputDecoration(
            labelText: "Telefone ${index + 1}",
            hintText: "Digite o Telefone do Cliente"),
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        textAlign: TextAlign.center,
        maxLength: 16,
        validator: (value) {
          if (value.trim().isEmpty) {
            return "Preencha o Campo";
          }
          return null;
        },
      ),
    );
  }

  var _controllerCPF = new MaskedTextController(mask: '000.000.000-00');
  var _controllerData = new MaskedTextController(mask: '00/00/0000');

  var _uFS = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];

  String _nome;
  String _cpf;
  DateTime _dataHoraCadastro = DateTime.now();
  DateTime _dataNascimento;
  String _uf;
  List<String> _telefones = [];
  List<Widget> _telefonesExibir = [];
  int _totalTelefones = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ClientesNotifier _clientesNotifier =
        Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints_um) {
        //
        //
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            //
            //
            child: Scaffold(
              //
              //
              appBar: AppBar(
                title: Text("Adicionar Cliente"),
                centerTitle: true,
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Client cliente = Client(
                            id: Random().nextInt.toString(),
                            nome: _nome,
                            cpf: _cpf,
                            dataNascimento: _dataNascimento,
                            dataHoraCadastro: _dataHoraCadastro,
                            uf: _uf,
                            telefones: _telefones);
                        _clientesNotifier.addClienteLista(cliente);

                        Navigator.of(context).pushNamed(
                          AppRoutes.HOME,
                        );
                      }
                    },
                    child: Text(
                      "Salvar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: VariaveisGlobais.corMaterialPrimaria,
                      ),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              //
              //
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          onSaved: (newValue) => _nome = newValue,
                          decoration: InputDecoration(
                              labelText: "Nome do Cliente",
                              hintText: "Digite o nome do Cliente"),
                          textAlign: TextAlign.center,
                          maxLength: 20,
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return "Preencha o Campo";
                            }

                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _controllerCPF,
                          onSaved: (newValue) => _cpf = newValue,
                          decoration: InputDecoration(
                              labelText: "CPF",
                              hintText: "Digite o CPF do Cliente"),
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textAlign: TextAlign.center,
                          maxLength: 14,
                          validator: (value) {
                            if (_uf == "SP" && value.trim().isEmpty) {
                              return "Campo Obrigatório";
                            }
                            if (value.length < 14 && value.isNotEmpty) {
                              return "Preencha o Campo Corretamente";
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: DropdownButtonFormField<String>(
                                items: _uFS.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem),
                                  );
                                }).toList(),
                                hint: Text(
                                  'UF',
                                ),
                                validator: (value) {
                                  print(value);
                                  if (value == null) {
                                    return "Campo Obrigatório";
                                  }
                                  if (value.length < 2) {
                                    return "Preencha o Campo Corretamente";
                                  }
                                  return null;
                                },
                                value: _uf,
                                onChanged: (value) {
                                  print("obje");
                                  if (value != null || value != "") {
                                    setState(() {
                                      _uf = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _controllerData,
                                onSaved: (newValue) => _dataNascimento =
                                    DateFormat("dd/MM/yyyy").parse(newValue),
                                decoration: InputDecoration(
                                    labelText: "Data Nascimento",
                                    hintText:
                                        "Digite o Data de Nascimento do Cliente"),
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                textAlign: TextAlign.center,
                                maxLength: 10,
                                validator: (value) {
                                  if (value.trim().isNotEmpty) {
                                    int ano = int.parse(value.substring(6));
                                    int dia = int.parse(value.substring(0, 2));
                                    int mes = int.parse(value.substring(3, 5));

                                    int idade = int.parse(DateFormat('yyyy')
                                            .format(_dataHoraCadastro)) -
                                        ano;
                                    if (dia > 31) {
                                      return "Informe um Dia Valido!";
                                    }
                                    if (mes > 12) {
                                      return "Informe um Mês Valido!";
                                    }
                                    if (value.length < 10) {
                                      return "Preencha o Campo Corretamente";
                                    }
                                    if (_uf == "MG" &&
                                        value.trim().isNotEmpty &&
                                        idade < 18) {
                                      return "Você não tem idade suficiente!";
                                    }
                                  } else {
                                    return "Preencha o Campo";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: _totalTelefones.toDouble() * 100,
                          child: Column(
                            children: _telefonesExibir,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              label: Text(
                                "Add Telefone",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              icon: Icon(
                                Icons.add,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                setState(() {
                                  _telefonesExibir
                                      .add(telefones(index: _totalTelefones));
                                  _totalTelefones++;
                                });
                              }),
                          TextButton.icon(
                              label: Text(
                                "sub Telefone",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              icon: Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  _totalTelefones--;
                                  _telefonesExibir.remove(
                                      _telefonesExibir[_totalTelefones]);
                                });
                              }),
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          "Data/Hora do cadastro: " +
                              DateFormat('dd/MM/yyyy hh:mm')
                                  .format(_dataHoraCadastro),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOvserflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
