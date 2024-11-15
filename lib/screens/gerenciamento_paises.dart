import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaDePaises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paisController = Provider.of<PaisProvider>(context);
    final listaPaises = paisController.listaPaises;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Países'),
      ),
      body: ListView.builder(
        itemCount: listaPaises.length,
        itemBuilder: (context, index) {
          final pais = listaPaises[index];

          return ListTile(
            title: Text(pais.titulo),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          );
        },
      ),
    );
  }
}
