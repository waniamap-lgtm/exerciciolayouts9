import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/book_view_model.dart';
import 'widgets/book_card.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  @override
  void initState() {
    super.initState();
    // Solicita o carregamento dos dados assim que a ecrã é inserida na árvore de widgets
    // O listen: false é obrigatório dentro do initState
    Provider.of<BookViewModel>(context, listen: false).loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Livraria Estrela branca',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: const Icon(Icons.star, color: Colors.white),
      ),
      // 1. O SingleChildScrollView garante a rolagem vertical de toda a ecrã
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // 2. O Consumer escuta a ViewModel e reconstrói este bloco quando houver alterações
        child: Consumer<BookViewModel>(
          builder: (context, viewModel, child) {
            // Se a lista ainda estiver vazia, exibe um indicador de carregamento
            if (viewModel.books.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            // 3. O Wrap distribui os cards horizontalmente e quebra a linha automaticamente
            return Wrap(
              spacing: 16.0,    // Espaço horizontal entre os cards
              runSpacing: 16.0, // Espaço vertical entre as linhas de cards
              alignment: WrapAlignment.start,
              children: viewModel.books.map((book) {
                return BookCard(book: book);
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}