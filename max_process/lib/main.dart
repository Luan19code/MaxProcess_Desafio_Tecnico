import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:max_process/providers/cliente.dart';
import 'package:max_process/providers/tema.dart';
import 'package:max_process/utils/app_rotas.dart';
import 'package:max_process/utils/variaveis_globais.dart';
import 'package:max_process/views/tela_adicionar/adicionar_cliente.dart';
import 'package:max_process/views/tela_principal/tela_principal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => new ClientesNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier darkTheme = Provider.of(context, listen: true);

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      theme: VariaveisGlobais.tema(context),
      routes: {
        AppRoutes.HOME: (_) => TelaPrincipal(),
        AppRoutes.ADICIONAR_CLIENTE: (_) => AdicionarCliente(),
      },
      darkTheme: VariaveisGlobais.temaDark(context),
      themeMode: darkTheme.isDark() ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
