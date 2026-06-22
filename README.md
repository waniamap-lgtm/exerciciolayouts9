
# Livraria Estrela Branca

Este projeto consiste em um aplicativo mobile desenvolvido em Flutter para a exibição de um catálogo de livros. A aplicação foi estruturada seguindo boas práticas de arquitetura em camadas, componentização e gerência de estado reativa.

## Escopo do Projeto

O objetivo principal do exercício foi consolidar os conceitos de manipulação de fluxos de dados e renderização de layouts responsivos. Os seguintes requisitos técnicos foram implementados:

* **Arquitetura MVVM:** Separação clara de responsabilidades entre as camadas de dados (Model, Service, Repository), lógica de negócios e estado (ViewModel) e interface de usuário (View).
* **Gerência de Estado:** Utilização do pacote Provider para notificação de mudanças de estado e reconstrução otimizada da interface de usuário.
* **Layout Flexível:** Uso do componente Wrap associado a cálculos dinâmicos de largura de tela para distribuir os elementos em formato de grelha de forma simétrica.
* **Tratamento de Exceções Visual:** Implementação de um mecanismo de segurança para capturar falhas no carregamento de imagens remotas (URLs inválidas ou quebradas), exibindo um componente alternativo padrão sem interromper a execução do aplicativo.
* **Depuração:** Monitoramento de eventos de interação na interface por meio de saídas seguras no console de desenvolvimento durante a execução.

## Estrutura de Pastas

A organização dos arquivos no diretório lib reflete a separação de camadas proposta pelo padrão arquitetural:
