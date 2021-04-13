import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_process/providers/cliente.dart';
import 'package:max_process/utils/app_rotas.dart';
import 'package:max_process/views/tela_tab_um/widgets/card.dart';
import 'package:max_process/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class TelaCliente extends StatelessWidget {
  const TelaCliente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    final ClientesNotifier _customersNotifier =
        Provider.of(context, listen: true);
    //
    //
    return LayoutBuilder(
      builder: (context, constraints_one) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Clientes"),
                centerTitle: true,
                actions: [
                  //
                  //
                  IconButton(
                      icon: Icon(Icons.add_box),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.ADICIONAR_CLIENTE,
                        );
                      })
                  //
                  //
                ],
              ),
              //
              //
              body: _customersNotifier.tamanhoLista > 0
                  ? ListView.builder(
                      itemCount: _customersNotifier.tamanhoLista,
                      itemBuilder: (context, index) {
                        return CardWidget(
                          client: _customersNotifier.controllerList[index],
                        );
                      },
                    )
                  : Center(
                      child: ListTile(
                        title: Text(
                          "Sem Clientes Cadastrados",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

              drawer: MainDrawer(),
            ),
          ),
        );
      },
    );
  }
}
