import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/book_view_model.dart';
import 'views/book_list_view.dart';

void main() {
  runApp(
    // 1. O MultiProvider envolve toda a aplicação para gerir os estados globais
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookViewModel()),
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
      title: 'Livraria Estrela branca',
      debugShowCheckedModeBanner: false, // Remove a fita de "Debug" do canto superior da ecrã
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      // 2. Definimos a nossa BookListView como a ecrã principal de entrada
      home: const BookListView(),
    );
  }
}