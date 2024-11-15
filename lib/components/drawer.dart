import 'package:flutter/material.dart';

class MeuDrawer extends StatelessWidget {
  const MeuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ThemeData().primaryColor,
            ),
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: const Text('Países'),
            onTap: () {
              //context.pushReplacement('/');
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.engineering),
            title: const Text('Configurações'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/configuracoes',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.earbuds),
            title: const Text('Cadastrar'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushNamed(
                '/cadastro',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: const Text('Lugares'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushNamed(
                '/lugares',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.travel_explore),
            title: const Text('Países'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushNamed(
                '/paises',
              );
            },
          ),
        ],
      ),
    );
  }
}
