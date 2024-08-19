import 'package:firststore/src/feature/Batch%20Payments/controller/controller.dart';
import 'package:firststore/src/feature/Reconciliation/controller/controller.dart';
import 'package:firststore/src/feature/Reconciliation/controller/entity_type_controller.dart';
import 'package:firststore/src/feature/home/controller/navigate_controller.dart';
import 'package:firststore/src/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
//new comment

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//ksc;ksmc;k
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => BatchDatapicker()),
        ChangeNotifierProvider(create: (_) => NavigateNotifier()),
        ChangeNotifierProvider(create: (_) => EntityTypeController()),
      ],
      child: MaterialApp.router(
        title: 'FirstStore',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: Gorouter.router,
      ),
    );
  }
}
