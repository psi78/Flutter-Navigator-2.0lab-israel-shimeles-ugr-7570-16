import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// 🔹 ROUTER
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id', // path param
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final filter = state.uri.queryParameters['filter'] ?? "all";
        return ProductDetailScreen(id: id, filter: filter);
      },
    ),
  ],
);

// 🔹 MAIN
void main() => runApp(const MyApp());

// 🔹 APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

// 🔹 HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/product/42?filter=popular'),
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

// 🔹 PRODUCT DETAIL SCREEN
class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Text('Showing product $id\nFilter: $filter'),
      ),
    );
  }
}
