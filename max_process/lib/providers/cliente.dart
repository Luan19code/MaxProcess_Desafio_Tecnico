import 'package:flutter/material.dart';

class Client with ChangeNotifier {
  final String id;
  final String nome;
  final String cpf;
  final DateTime dataHoraCadastro;
  final DateTime dataNascimento;
  final String uf;
  final List<String> telefones;

  Client(
      {this.id,
      this.nome,
      this.cpf,
      this.dataHoraCadastro,
      this.dataNascimento,
      this.uf,
      this.telefones});

  //
  //

}

class ClientesNotifier with ChangeNotifier {
  ClientesNotifier() {
    _listaControleClientes = [];
  }
  //
  //
  List<Client> _listaControleClientes;
  //
  //

  List<Client> get controllerList {
    return [..._listaControleClientes];
  }

  //
  //
  void addClienteLista(Client cliente) {
    _listaControleClientes.add(cliente);
    notifyListeners();
  }

  //
  //

  int get tamanhoLista {
    return _listaControleClientes.length;
  }
}
