import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/pet_grid_item.dart';
import 'package:shop/models/pet.dart';
import 'package:shop/models/pet_list.dart';
//Aqui vamos desenvolver o componente de todos os cards para a vitrine de todos os pets
class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid(this.showFavoriteOnly, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    //Condição ternaria para definir os pets que estão como favoritos ou não
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      //Ocorre o carregamento do app, e mostra todos os produtos cadastrados no FireBase
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductGridItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
