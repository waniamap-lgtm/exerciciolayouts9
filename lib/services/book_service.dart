class BookService {
  // Simula a busca de dados brutos (como se estivesse vindo de uma API ou Banco de Dados)
  List<Map<String, dynamic>> fetchRawBooks() {
    return [
      {
        'title': 'Crime e Castigo',
        'author': 'Fiódor Dostoiévski',
        'imageUrl': 'https://images-na.ssl-images-amazon.com/images/I/71wDb9997XL.jpg', 
      },
      {
        'title': 'O Olho Mais Azul',
        'author': 'Toni Morrison',
        'imageUrl': 'LINK_QUEBRADO_TESTE', // Link inválido propositalmente para o teste
      },
      {
        'title': 'Frankenstein',
        'author': 'Mary Shelley',
        'imageUrl': 'https://images-na.ssl-images-amazon.com/images/I/81bcM4N+g9L.jpg',
      },
      {
        'title': 'O Médico e o Monstro',
        'author': 'Robert Louis Stevenson',
        'imageUrl': 'https://images-na.ssl-images-amazon.com/images/I/817290mbyvL.jpg',
      },
    ];
  }
}