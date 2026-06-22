class Book {
  final String title;
  final String author;
  final String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  // Converte o Map bruto em um Objeto Book
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] ?? 'Título Desconhecido',
      author: map['author'] ?? 'Autor Desconhecido',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}