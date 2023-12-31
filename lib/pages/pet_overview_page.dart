// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/pet_grid.dart';
import 'package:shop/models/pet.dart';
import 'package:shop/models/pet_list.dart';
import 'package:shop/utils/app_routes.dart';

//pagina que mostra todos os cards cadastrados no sistema
enum FilterOptions {
  favorite,
  all,
}

class PetsOverviewPage extends StatefulWidget {
  const PetsOverviewPage({Key? key}) : super(key: key);

  @override
  State<PetsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<PetsOverviewPage> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<PetList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      setState(() {
        _showFavoriteOnly = false;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 110, 255),
        title: const Text('Meus Pets'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PetGrid(_showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
