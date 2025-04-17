# Imersão Mobile - TechTaste

> Evento da Alura

## Tecnologias

- Flutter
- Android

## Galeria imagens

### Splash Screen

![PrintScreen 01](/files/printscreen-01.png)

### Home Screen

![PrintScreen 02](/files/printscreen-02.png)
![PrintScreen 03](/files/printscreen-03.png)

#### Home Screen com Filtros

![PrintScreen 04](/files/printscreen-04.png)
![PrintScreen 05](/files/printscreen-05.png)

### Restaurant Screen

![PrintScreen 06](/files/printscreen-06.png)
![PrintScreen 07](/files/printscreen-07.png)

### Dish Screen

![PrintScreen 08](/files/printscreen-08.png)
![PrintScreen 09](/files/printscreen-09.png)

#### Dish Screen com items adicionados na sacola

![PrintScreen 10](/files/printscreen-10.png)

### Checkout Screen

![PrintScreen 11](/files/printscreen-11.png)
![PrintScreen 12](/files/printscreen-12.png)

### Drawer Menu

![PrintScreen 13](/files/printscreen-13.png)

## Aula 01 - Seu app começa aqui! Monte a base e a primeira tela

### Introdução

Nesta aula, vamos criar a Tela de Splash e a Home do nosso app em Flutter, iniciando a estrutura base do projeto. Você vai configurar o ambiente no IDX, importar assets e explorar conceitos importantes como temas personalizados e widgets fundamentais do Flutter, como Scaffold, Stack, Column, Image, Text e ElevatedButton. Também vamos organizar as cores e estilos com os arquivos AppColor e AppTheme.

Nesta aula, você vai:

- Realizar a configuração inicial do projeto no IDX
- Importar assets e organizar a estrutura de temas
- Criar o arquivo da tela de Splash
- Explorar os principais Widgets do Flutter, como:
  - Scaffold para estrutura básica
  - Stack, Column e Padding para organização dos elementos
  - Image com fonte asset
  - Text, SizedBox e ElevatedButton para a composição visual
- Conhecer e aplicar os arquivos de cores (AppColor) e tema (AppTheme)

### Diferenças em relação a aula

- Uso do Visual Studio Code ao Invés do IDX
- Uso de um Dispositivo Virtual Android do Android Studio
- Para criar o projeto utilizado o comando: flutter create flutter_techtaste
- Pequenas mudanças na UI para ser um pouco mais fiel ao design do Figma

## Aula 2 -Transforme dados em experiência real! Construa a Home e exiba os restaurantes

### Introdução

Nesta aula, vamos evoluir a estrutura do app com a criação da Home completa e a navegação entre telas. Você vai aprender a usar widgets como AppBar, Drawer e um formulário de busca, além de modularizar componentes com o CategoryWidget e RestaurantWidget. Também vamos criar um model e um provider para carregar dados dinamicamente e exibir a lista de restaurantes na tela.

Nesta aula, você vai:

- Implementar a navegação entre telas e construir a HomeScreen com AppBar, Drawer e TextFormField
- Modularizar a interface com os widgets CategoryWidget e RestaurantWidget
- Criar um model de restaurante com construtor, toMap() e fromMap()
- Desenvolver a classe RestaurantData para ler e disponibilizar dados de um JSON
- Utilizar o Provider para gerenciar o estado e exibir dinamicamente os restaurantes na Home

### Diferenças em relação a aula

- Uso do Visual Studio Code ao Invés do IDX
- Uso de um Dispositivo Virtual Android do Android Studio
- Pequenas mudanças na UI para ser um pouco mais fiel ao design do Figma

## Aula 3 - Finalize o fluxo do app! Crie a experiência completa de pedido

### Introdução

Nesta aula, vamos finalizar o nosso app com a construção da tela de detalhes dos restaurantes e a lógica completa do pedido. Você vai modelar os pratos, integrá-los aos restaurantes, e implementar a funcionalidade de sacola de compras usando Provider e Badges. Também vamos modularizar a AppBar com um badge de itens, criar a tela de Checkout e aplicar a lógica de totalização do pedido.

Nesta aula, você vai:

- Construir a tela de detalhes dos restaurantes e permitir adicionar pratos à sacola
- Criar o BagProvider para gerenciar a sacola, com métodos de adicionar, remover e limpar itens
- Modularizar a AppBar com uma função getAppBar, incluindo Badge com contagem de itens
- Modelar os pratos (dishes) e integrá-los aos restaurantes e à sacola
- Desenvolver a tela de Checkout, com lógica para totalização do pedido e exibição de valor com toStringAsFixed

### Diferenças em relação a aula

- Uso do Visual Studio Code ao Invés do IDX
- Uso de um Dispositivo Virtual Android do Android Studio
- Mudanças na UI para ser um pouco mais fiel ao design do Figma
- Adicionado as seções de pagamento, endereço de entrega e confirmação do pedido na página de checkout como no Figma
- Adicionada funcionalidade de calcular o preço total do pedido
- Mudança na exibição dos pratos na tela do restaurante para seguir o Figma
- Adicionado a tela do prato para seguir o Figma
- Adicionadas as funcionalidades de filtrar restaurantes pela categoria e/ou pela barra de pesquisa
- Adicionada implementação do drawer menu
- Drawer menu incrementado em relação ao Figma

## Rodar

### Requisitos

- Android Studio
- Android Virtual Device
- Flutter

### Guia

- clonar este repositório
- rodar o Android Virtual Device
- flutter run --debug

## Links úteis

- [Guia de Mergulho](https://grupoalura.notion.site/Imers-o-Mobile-Guia-de-Mergulho-1ba379bdd09b80e3ac18c8512f31530d)

- [Link do Figma](https://www.figma.com/design/hpAZtmQmPPbdZK9SETFU43/TechTaste-%7C-Imers%C3%A3o--Copy-?node-id=7-47&p=f&t=3xQrLNE0XxJyiPBN-0)

- [Link do IDX](https://idx.google.com/)
