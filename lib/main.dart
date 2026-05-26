import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:full_cours/Meals/Screens/categorie.dart";
import "package:full_cours/Meals/Screens/meals.dart";
import "package:full_cours/Meals/Screens/tabs.dart";
import "package:full_cours/Meals/data/dummy_data.dart";

import "package:full_cours/challenge/quiz.dart";
import "package:full_cours/TODOAPP/widgets/expenses.dart";
import "package:full_cours/TODO_APP_REPLY/expense.dart";
import "package:full_cours/visualisation_demo/ui_updates_demo.dart";

import "package:google_fonts/google_fonts.dart";

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

final theme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),

  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const App());
  /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {

    runApp(
      MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
              colorScheme: kDarColorScheme
          ),
          theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: kColorScheme.secondaryContainer,
              colorScheme: kColorScheme,
              cardTheme:  CardThemeData(
                color: kColorScheme.onPrimaryContainer,
                margin: const EdgeInsets.all(16),

              ),

              elevatedButtonTheme: ElevatedButtonThemeData(

                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(7)
                      )
                  )
              ),
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
                centerTitle: true,
              ),

              textTheme: ThemeData().textTheme.copyWith(
                titleLarge: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 25
                ),


              )
          ),
          themeMode: ThemeMode.dark,
          home: ExpenseScreen()
      ),
    );


  });


  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(colorScheme: kDarColorScheme),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kColorScheme.secondaryContainer,
        colorScheme: kColorScheme,
        cardTheme: CardThemeData(
          color: kColorScheme.onPrimaryContainer,
          margin: const EdgeInsets.all(16),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(7),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
          centerTitle: true,
        ),

        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 25,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: ExpenseScreen(),
    ),
  );

   */
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Flutter Internals'),
        ),
        body: TabsScreen(),
      ),
    );
  }
}
