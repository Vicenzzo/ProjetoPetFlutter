import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/pet_item.dart';
import 'package:shop/models/pet_list.dart';
import 'package:shop/utils/app_routes.dart';

//Pagina para gerenciar todos os PETs
class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList pets = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 110, 255),
        title: const Text('Gerenciar Pets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.petForm);
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: pets.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(pets.items[i]),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
