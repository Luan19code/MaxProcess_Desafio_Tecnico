import 'package:flutter/material.dart';
import 'package:max_process/providers/tema.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier darkTheme = Provider.of(context, listen: false);
    return SafeArea(
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bem vindo!"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              //
              //
              ListTile(
                leading: Icon(
                  Icons.wb_sunny,
                  size: 26,
                ),
                title: Text(darkTheme.isDark()
                    ? "Tema Esta Claro"
                    : "Tema Esta Escuro"),
                onTap: () {
                  darkTheme.changeTheme();
                },
              ),
              //
              //
            ],
          ),
        ),
      ),
    );
  }
}
