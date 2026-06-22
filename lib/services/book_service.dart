class BookService {
  List<Map<String, dynamic>> fetchRawBooks() {
    return [
      {
        'title': 'Crime e Castigo',
        'author': 'Fiódor Dostoiévski',
        'imageUrl': 'assets/im_crime.jpg',
      },
      {
        'title': 'O Olho Mais Azul',
        'author': 'Toni Morrison',
        // Mantido inválido de propósito para testar a caixinha cinza de erro
        'imageUrl': 'LINK_INVALIDO_PROPOSITAL',
      },
      {
        'title': 'Frankenstein',
        'author': 'Mary Shelley',
        'imageUrl': 'assets/im_frank.jpg',
      },
      {
        'title': 'O Médico e o Monstro',
        'author': 'Robert Louis Stevenson',
        'imageUrl': 'assets/im_medico.jpg',
      },
    ];
  }
}