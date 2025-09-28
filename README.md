# FastLocation

Aplicativo Flutter desenvolvido como parte do **Desafio 1** da disciplina **Desenvolvimento de Sistemas Móveis e Distribuídos**. O projeto tem como objetivo permitir a consulta de endereços via CEP, com armazenamento local e visualização em mapa.

---

## 📱 Funcionalidades

- 🔍 Consulta de endereço por CEP via API ViaCEP
- 🏠 Consulta de CEP por endereço
- 💾 Armazenamento local com Hive
- 📋 Histórico de consultas
- 🗺️ Traçar rota com MapLauncher
- ⚡ Interface reativa com MobX
- 🎬 Tela inicial com animação e redirecionamento automático

---

## 🧱 Estrutura do Projeto

- `lib/src/modules/home` → Tela principal, controller, modelo, repositórios e serviços
- `lib/src/modules/history` → Tela e controller do histórico
- `lib/src/modules/initial` → Tela de abertura
- `lib/src/shared` → Cores, métricas, armazenamento
- `lib/src/http` → Cliente HTTP com Dio
- `lib/src/routes` → Rotas centralizadas

---

## 🚀 Como executar o projeto

1. **Clone o repositório:**


git clone https://github.com/SEU_USUARIO/fast_location_project.git

2. **Instale as dependências:**


flutter pub get

3. **Gere os arquivos `.g.dart`:**


flutter pub run build_runner build --delete-conflicting-outputs

4. **Execute o app:**


flutter run

---

## 📦 Dependências principais

- `dio` – Comunicação HTTP
- `mobx`, `flutter_mobx`, `mobx_codegen` – Gerenciamento de estado
- `hive`, `hive_flutter`, `hive_generator` – Armazenamento local
- `map_launcher`, `geocoding` – Integração com mapas
- `flutter_lints`, `build_runner` – Desenvolvimento e boas práticas

---

## 📋 Requisitos

- Flutter SDK 3.9.2 ou superior
- Android Studio (recomendado)
- Git instalado e configurado

---

## 📎 Licença

Este projeto é privado e não está publicado no pub.dev.

