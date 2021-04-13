import 'package:flutter/material.dart';
import 'package:max_process/providers/cliente.dart';
import 'package:max_process/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class TelaInfo extends StatelessWidget {
  const TelaInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    //
    final ClientesNotifier _clientesNotifier =
        Provider.of(context, listen: true);
    //
    //
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
                title: Text("Informações"),
                centerTitle: true,
              ),
              //
              //
              body: LayoutBuilder(
                builder: (context, constraints_dois) {
                  //
                  //
                  return Center(
                    child: Container(
                      height: 60,
                      // color: Colors.red,
                      child: ListTile(
                        subtitle: Text(
                          "Total de Clientes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        title: Text(
                          "${_clientesNotifier.tamanhoLista}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Theme.of(context).accentColor,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
              drawer: MainDrawer(),
            ),
          ),
        );
      },
    );
  }
}
