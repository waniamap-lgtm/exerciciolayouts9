import '../models/book.dart';
import '../services/book_service.dart';

class BookRepository {
  // Encapsulamento: O repositório cria e gerencia sua própria instância do Service
  final BookService _service = BookService();

  List<Book> getBooks() {
    // 1. Pega os dados brutos (List<Map>) vindos do Service
    final List<Map<String, dynamic>> rawData = _service.fetchRawBooks();
    
    // 2. Transforma cada Map em um Objeto Book usando o construtor do Passo 1
    final List<Book> booksList = rawData.map((map) => Book.fromMap(map)).toList();
    
    // 3. Retorna a lista de objetos prontinha para a ViewModel
    return booksList;
  }
}