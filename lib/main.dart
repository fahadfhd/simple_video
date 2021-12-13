import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:sample_vid/providers/theame_provider.dart';
import 'package:sample_vid/utils/routes.dart';
import 'package:sample_vid/views/dashboard/provider/dash_provider.dart';
import 'package:sample_vid/views/dashboard/screens/dashboard.dart';
// ignore: unused_import
import 'package:sample_vid/views/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => DashboardProvider()),
              ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,

              home: const LoginView(),
              // home: Dashboard(),
              routes: appRoutes(),
              onGenerateRoute: onAppGenerateRoute(),
            ));
      });
}
