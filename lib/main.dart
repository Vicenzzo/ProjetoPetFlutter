import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/pet_list.dart';
import 'package:shop/pages/pet_detail_page.dart';
import 'package:shop/pages/pet_form_page.dart';
import 'package:shop/pages/pet_overview_page.dart';
import 'package:shop/pages/pet_page.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple,
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        // home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.petDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.pets: (ctx) => const ProductsPage(),
          AppRoutes.petForm: (ctx) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
