import 'package:flutter/material.dart';

class Pais {
  final String id;
  final String titulo;
  final Color cor;

  const Pais({
    required this.id,
    required this.titulo,
    this.cor = Colors.blue,
  });
}

class PaisProvider extends ChangeNotifier {
  PaisProvider({required List<Pais> this.listaPaises});
  List<Pais> listaPaises;

  List<Pais> get Paises => listaPaises;
}
