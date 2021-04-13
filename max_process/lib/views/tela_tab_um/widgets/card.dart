import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max_process/providers/cliente.dart';

class CardWidget extends StatelessWidget {
  final Client client;

  const CardWidget({Key key, this.client}) : super(key: key);
  //
  //

  //
  //
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // print(constraints.maxWidth);
        return Container(
          height: 300,
          child: Card(
            color: Theme.of(context).accentColor,
            margin: EdgeInsets.all(10),
            child: Container(
              //
              //
              child: Column(
                children: [
                  //
                  //
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          //
                          //
                          Expanded(
                            child: ListTile(
                              subtitle: Text(
                                "⬆ Cliente ⬆",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor,
                                ),
                                // overflow: TextOverflow.ellipsis,
                              ),
                              title: Text(
                                "${client.nome}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          //
                          //
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    subtitle: Text(
                                      "⬆ CPF ⬆",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    title: Text(
                                      "${client.cpf}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    subtitle: Text(
                                      "⬆ UF ⬆",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    title: Text(
                                      "${client.uf}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          //
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    subtitle: Text(
                                      "⬆ Data/Hora Cadastro ⬆",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    title: Text(
                                      DateFormat(
                                        'dd/MM/yyyy hh:mm',
                                      ).format(
                                        client.dataHoraCadastro,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    subtitle: Text(
                                      "⬆ Data de nascimento ⬆",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    title: Text(
                                      DateFormat(
                                        'dd/MM/yyyy hh:mm',
                                      ).format(
                                        client.dataNascimento,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //
                          //
                          Expanded(
                            child: ListView.builder(
                              itemCount: client.telefones.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      width: constraints.maxWidth * 0.45,
                                      child: ListTile(
                                        subtitle: Text(
                                          "⬆ Telefone ${index + 1} ⬆",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          // overflow: TextOverflow.ellipsis,
                                        ),
                                        title: Text(
                                          "${client.telefones[index]}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          //
                          //
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
