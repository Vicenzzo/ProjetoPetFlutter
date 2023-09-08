import 'package:flutter/material.dart';
import 'package:shop/models/pet.dart';

//Mostra o pet com detalhes de cada produto selecionado
class PetDetailPage extends StatelessWidget {
  const PetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Referencia o argumento que foi passado dentro da rota
    final Pet product =
        ModalRoute.of(context)!.settings.arguments as Pet;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 110, 255),
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Idade do Pet é: ${product.age}',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
