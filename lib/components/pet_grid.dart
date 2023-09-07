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
      //para o grid nao ficar grudado nas laterais
      padding: const EdgeInsets.all(10),
      //Pega o tamanho total da lista, para identificar quantos elementos vao ter
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: const ProductGridItem(),
      ),
                          //Utiliza quando temos os elementos pra rolagem
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //Dois itens na coluna por linha
        crossAxisCount: 2,
        //dimensão de altura e largura de cada elemento
        childAspectRatio: 3 / 2,  
        //Espaço de 10, entre os cards aos lados entre eles
        crossAxisSpacing: 10,
        //Espaço de 10, em cima e em baixo entre os cards
        mainAxisSpacing: 10,
      ),
    );
  }
}
