import 'package:flutter/material.dart';
import 'package:max_process/providers/tema.dart';
import 'package:max_process/views/tela_tab_dois/tela_info.dart';
import 'package:max_process/views/tela_tab_um/tela_cliente.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  void initState() {
    super.initState();
    ThemeNotifier darkTema = Provider.of(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
        darkTema.systemTheme();
      }
    });
  }

  int _selectedScreenIndex = 0;

  List<Widget> _screens = [TelaCliente(), TelaInfo()];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: "Clientes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Informações",
            )
          ],
        ),
      ),
    );
  }
}
