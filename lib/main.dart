import 'package:digi_reto_2/features/shop/data/datasource/products_remote_datasource.dart';

import 'package:digi_reto_2/features/shop/data/repositories/product_repository_impl.dart';
import 'package:digi_reto_2/features/shop/display/providers/product_provider.dart';
import 'package:digi_reto_2/features/shop/display/screens/shop_screen.dart';
import 'package:digi_reto_2/features/shop/domain/usecases/product_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) {
            final remoteDataSource = ProductRemoteDataSourceImpl();
            final repository = ProductRepositoryImpl(remoteDataSource);
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

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
