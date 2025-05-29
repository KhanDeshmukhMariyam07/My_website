import 'package:flutter/material.dart';
import 'package:flutter_portfolio/pages/about_me_page.dart';
import 'package:flutter_portfolio/pages/contact_me_page.dart';
import 'package:flutter_portfolio/pages/projects_page.dart';
import 'package:flutter_portfolio/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Portfolio',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/',
            routes: {
              '/': (context) => const AboutMePage(),
              '/projects': (context) => const ProjectsPage(),
              '/contact': (context) => const ContactMePage(),
},

          );
        },
      ),
      
    );
  }
}
