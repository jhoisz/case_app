<h1 align="center"> 🗂️ Case App </h1>

## Descriçāo

Landing page com informaçōes sobre a empresa e as vagas disponíveis.

## Funcionalidades

- Listagem de vagas;
- Busca por vagas;
- Webview;
- Testes unitários;
- Injeçāo de dependências.

## Tecnologias e bibliotecas

Esse projeto foi desenvolvido utilizando o Framework [Flutter](https://flutter.dev/) e a Linguagem [Dart](https://dart.dev/).

Algumas bilbiotecas também foram utilizadas:
- `http`: Usado para realizar a requisiçāo de *GET* na API dispinibiliza.
- `flutter_bloc`: Usado para gerenciar o estado da tela na aplicaçāo, mais especificamente, na seçāo de vagas.
- `get_it`: Usado para injetar as dependências.
- `mocktail`: Usado para criaçāo dos testes.
- `bloc_test`: Usado para criaçāo dos testes de BLoC.
- `webview_flutter`: Usado para webview da aplicaçāo.

## Screenshot

https://github.com/jhoisz/case_app/assets/57508736/d6d25ee0-db42-4f84-b21a-1171c0c5de9c

## Como executar

Primeiro você deve [instalar flutter](https://docs.flutter.dev/get-started/install). Então, você pode clonar e entrar na pasta do projeto:

```bash
git clone https://github.com/jhoisz/case_app
cd case_app
```

Agora, para testar, você deve instalar os pacotes/dependências e usar um dispositivo conectado ao seu computador ou usar um emulador:

```bash
flutter pub get
flutter run
```
