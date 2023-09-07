import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

//Aqui vamos desenvolvedor o sidebar para os linkes do cadastro, alterar e deletar
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 110, 255),
            title: const Text('Bem vindo Usuário!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Pets'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.home,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Gerenciar Pets'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.pets,
              );
            },
          ),
        ],
      ),
    );
  }
}
