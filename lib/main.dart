// ============================
// Arquivo: main.dart
// Finalidade: Ponto de entrada do app e configuração de rotas
// ============================

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'src/modules/initial/page/initial_page.dart';
import 'src/modules/home/page/home_page.dart';
import 'src/modules/home/controller/home_controller.dart';
import 'src/modules/home/model/address_model.dart';
import 'src/routes/routes.dart';
import 'package:fast_location_project/src/modules/history/page/history_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Hive com o diretório do app
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.initFlutter();

  // Registra o adapter do modelo AddressModel
  Hive.registerAdapter(AddressModelAdapter());

  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = HomeController(); // ✅ Instancia o controller

    return MaterialApp(
      title: 'FastLocation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initial, // ✅ Rota inicial
      routes: {
        AppRoutes.initial: (context) => const InitialPage(),
        AppRoutes.home: (context) => HomePage(controller: homeController), // ✅ Integração da HomePage
        AppRoutes.history: (context) => const HistoryPage(),
      },
    );
  }
}