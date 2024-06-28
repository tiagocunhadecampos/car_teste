<!-- @format -->

# Sobre o Projeto
O projeto "Reservas de Veículos" é uma aplicação desenvolvida em Flutter que permite aos usuários realizar reservas de veículos. Os dados essenciais para a reserva, como nome, e-mail e telefone, são coletados e armazenados localmente utilizando um banco de dados SQLite integrado.

###  Funcionalidades Principais:
- Reserva de Veículos: Os usuários podem navegar pela lista de veículos disponíveis e realizar uma reserva selecionando o veículo desejado.

- Armazenamento Local: As informações da reserva são armazenadas de forma segura no dispositivo do usuário, garantindo que os dados estejam acessíveis offline e protegidos.

 - Envio de Leads: Periodicamente, a cada 15 minutos, as informações de reserva são enviadas para um servidor remoto no endereço https://www.wswork.com.br/cars/leads. Isso permite que a empresa receba e processe as solicitações de reserva em tempo real.

 - Gerenciamento de Reservas: Além de realizar novas reservas, os usuários têm a opção de visualizar e excluir reservas previamente feitas, proporcionando uma experiência de usuário completa e interativa.

### Pré-requisitos

Antes de começar, certifique-se de ter o Flutter instalado. Para instruções de instalação, consulte o [Guia de Instalação do Flutter](https://flutter.dev/docs/get-started/install).

- **Flutter 3.13.0**: Versão do Flutter utilizado neste projeto.
  
### Clonar o Repositório

Clone este repositório em sua máquina local usando:

```bash
git clone https://github.com/tiagocunhadecampos/car_teste
```

### Navegar até o Diretório do Projeto

Navegue até o diretório do projeto:

```bash
cd car_teste
```

### Instalar Dependências

Execute o seguinte comando para instalar as dependências:

```bash
flutter pub get
```

### Executar a Aplicação

#### Android

Certifique-se de ter um dispositivo Android conectado ou um dispositivo virtual em execução. Em seguida, execute:

```bash
flutter run
```

#### iOS

Certifique-se de ter o Xcode instalado e um simulador configurado. Em seguida, execute:

```bash
flutter run
```

### Pacotes Utilizados

Este projeto utiliza os seguintes pacotes principais:

- **http**: Uma biblioteca para realizar requisições HTTP em Dart, utilizada para comunicação com APIs externas.
- **sqflite**: Um plugin para Flutter que permite acesso a bancos de dados SQLite, utilizado para armazenamento local de dados estruturados.
- **get_it**: Um serviço de localização de dependências (dependency injection) para Dart e Flutter, utilizado para injetar dependências de forma eficiente.
- **equatable**: Um pacote que facilita a implementação de classes Dart que podem ser comparadas de maneira simples e eficiente.
- **shared_preferences**: Um plugin Flutter que fornece uma forma simples e rápida de armazenar dados simples e chave-valor de forma persistente.
- **background_fetch**: Um pacote para Flutter que permite executar tarefas em segundo plano em intervalos regulares, útil para atualizações automáticas e sincronização de dados.

