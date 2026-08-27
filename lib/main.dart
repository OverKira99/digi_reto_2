import 'package:digi_reto_2/features/shop/data/datasource/products_local_datasource.dart';
import 'package:digi_reto_2/features/shop/data/datasource/products_remote_datasource.dart';

import 'package:digi_reto_2/features/shop/data/repositories/product_repository_impl.dart';
import 'package:digi_reto_2/features/shop/display/providers/product_provider.dart';
import 'package:digi_reto_2/features/shop/display/screens/shop_screen.dart';
import 'package:digi_reto_2/features/shop/domain/usecases/product_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) {
            final remoteDataSource = ProductRemoteDataSourceImpl();
            final localDataSource = ProductLocalDataSourceImpl(
              sharedPreferences,
            );
            final repository = ProductRepositoryImpl(
              remoteDataSource,
              localDataSource,
            );
            final useCase = ProductsUseCase(repository);
            return ProductProvider(
              getProductUseCase: useCase,
              getProductsUseCase: useCase,
              saveProductUseCase: useCase,
            );
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digi Reto 2',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Color(0xFF4F46E5))),
      home: ShopScreen(),
    );
  }
}
