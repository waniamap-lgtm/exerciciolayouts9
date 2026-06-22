import 'package:flutter/material.dart';
import '../../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // Calcula a largura dinâmica para caberem 2 cards por linha de forma limpa no Wrap
    final double cardWidth = (MediaQuery.of(context).size.width - 48) / 2;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // Corrigido para .withValues para acompanhar a versão mais recente do Flutter
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Área da Imagem com Tratamento de Erro Dinâmico
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image_rounded, color: Colors.grey[500], size: 40),
                        const SizedBox(height: 8),
                        Text(
                          'Imagem indisponível',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          // 2. Área de Conteúdo Informativo com Altura Fixa (Garante Simetria na Grelha)
          SizedBox(
            height: 135, // Força todos os blocos de texto a terem rigorosamente o mesmo tamanho
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // O SpaceBetween empurra o bloco de texto para o topo e os botões para a base do card
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  // Sub-bloco para os textos (Título e Autor)
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
                  
                  // Sub-bloco para os Botões de Ação
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Substituído por debugPrint conforme boas práticas do Flutter
                          debugPrint('Livro selecionado para leitura: ${book.title}');
                        },
                        child: const Text('Ler mais', style: TextStyle(fontSize: 12)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        ),
                        onPressed: () {
                          // Substituído por debugPrint conforme boas práticas do Flutter
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