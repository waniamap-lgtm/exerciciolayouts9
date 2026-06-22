import 'package:flutter/material.dart';
import '../../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final double cardWidth = (MediaQuery.of(context).size.width - 48) / 2;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Área da Imagem com o componente padrão do Flutter
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(
                book.imageUrl,
                fit: Alignment.center == Alignment.center ? BoxFit.cover : BoxFit.cover,
                // Tratamento correto exigido pelo exercício
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_not_supported, color: Colors.grey[400], size: 32),
                        const SizedBox(height: 4),
                        Text(
                          'Imagem indisponível',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Área de Conteúdo Informativo
          SizedBox(
            height: 135,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          debugPrint('Livro selecionado para leitura: ${book.title}');
                        },
                        child: const Text('Ler mais', style: TextStyle(fontSize: 12)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        ),
                        onPressed: () {
                          debugPrint('Ação de compra iniciada para: ${book.title}');
                        },
                        child: const Text('Comprar', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}