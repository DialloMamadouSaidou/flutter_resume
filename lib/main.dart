import "package:flutter/material.dart";
import "package:full_cours/challenge/quiz.dart";
import "package:full_cours/TODOAPP/widgets/expenses.dart";
import "package:full_cours/TODO_APP_REPLY/expense.dart";
import "package:google_fonts/google_fonts.dart";

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181)
);

var kDarColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125)
);

void main() {
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
}
