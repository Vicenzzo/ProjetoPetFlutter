import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/pet.dart';
import 'package:shop/utils/app_routes.dart';

//Aqui vamos desenvolver o componente para cada card de cada pet
class PetGridItem extends StatelessWidget {
  const PetGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Pet>(context, listen: false);
    //Envolvendo no ClipRRect mostra os produto arendondando as pontas
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(221, 0, 0, 0),
          leading: Consumer<Pet>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.petDetail,
              arguments: product,
            );
          },
        ),
      ),
    );
  }
}
