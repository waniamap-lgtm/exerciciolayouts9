import 'package:flutter/material.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';

// O ChangeNotifier torna esta classe capaz de "notificar" a View quando os dados mudarem
class BookViewModel extends ChangeNotifier {
  // Encapsulamento: A ViewModel conhece o Repositório, mas esconde-o do mundo externo
  final BookRepository _repository = BookRepository();

  // Lista privada para armazenar os livros carregados
  List<Book> _books = [];

  // Getter público para que a View possa ler os livros, mas sem permissão para alterar a lista diretamente
  List<Book> get books => _books;

  // Função responsável por pedir os dados ao repositório e avisar a tela
  void loadBooks() {
    // 1. Busca a lista de objetos tratados vindos do Repositório
    _books = _repository.getBooks();
    
    // 2. O ponto mais importante: Avisa todos os widgets ouvintes (View) que os dados mudaram e a tela precisa de ser reconstruída
    notifyListeners();
  }
}