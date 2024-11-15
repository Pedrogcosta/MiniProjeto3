import 'dart:ffi';

import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/cadastro.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/gerenciamento_lugares';
import 'package:f05_lugares_app/screens/gerenciamento_paises.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavController extends ChangeNotifier {
  List<Lugar> favLugares = [];

  void favoritoToggle(Lugar place) {
    favLugares.contains(place)
        ? favLugares.remove(place)
        : favLugares.add(place);

    notifyListeners();
  }
}

class LugarController extends ChangeNotifier {
  LugarController({required List<Lugar> this.listaLugares});
  List<Lugar> listaLugares;

  void adicionarLugar(List<String> pais, String titulo, double avaliacao,
      double customedio, List<String> recomendacoes, String imageurl) {
    Lugar lugar = Lugar(
        id: "p${listaLugares.length + 1}",
        paises: pais,
        titulo: titulo,
        avaliacao: avaliacao,
        custoMedio: customedio,
        recomendacoes: recomendacoes,
        imagemUrl: imageurl);

    listaLugares.add(lugar);

    notifyListeners();
  }
}

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FavController()),
    ChangeNotifierProvider(
        create: (context) => LugarController(listaLugares: List.from(lugares))),
    ChangeNotifierProvider(
        create: (context) => PaisProvider(listaPaises: List.from(paises))),
  ], child: MeuApp()));
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => MinhasAbas(),
        '/lugaresPorPais': (ctx) => LugarPorPaisScreen(),
        '/detalheLugar': (ctx) => DetalhesLugarScreen(),
        '/configuracoes': (ctx) => ConfigracoesScreen(),
        '/cadastro': (ctx) => CadastroScreen(),
        '/lugares': (ctx) => TelaDeLugares(),
        '/paises': (ctx) => TelaDePaises(),
      },
    );

    /* return MaterialApp.router(
      routerConfig: minhasRotas.getRouter(),
    ); */
  }
}
