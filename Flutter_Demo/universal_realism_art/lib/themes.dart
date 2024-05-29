import 'package:universal_realism_art/color_styles.dart';
import 'package:flutter/material.dart';


mixin AppThemes {
  static ThemeData get ligthTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurpleAccent,
        primary: ColorStyles.mainColor,
        secondary: ColorStyles.mainColor,
      ),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorStyles.mainColor,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'Pacifico',     
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),   
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.transparent,
        isDense: true,
        errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          fontFamily: 'Pacifico',           
          color: ColorStyles.errorColor,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: 'Pacifico',           
          color: ColorStyles.hintTextFieldColor,
          fontStyle: FontStyle.normal,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: 'Pacifico',           
          color: ColorStyles.mainColor,
          fontStyle: FontStyle.normal,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.horizontal(),
          borderSide: BorderSide(color: ColorStyles.mainColor, width: 1),
        ),       
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.horizontal(),
          borderSide: BorderSide(color: ColorStyles.mainColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.horizontal(),
          borderSide: BorderSide(color: ColorStyles.errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.horizontal(),
          borderSide: BorderSide(color: ColorStyles.errorColor, width: 1),
        ), 
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,  
          fontFamily: 'Pacifico',  
          color: Colors.black54,
          fontStyle: FontStyle.normal,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,    
          fontFamily: 'Pacifico',  
          color: Colors.deepPurpleAccent,
          fontStyle: FontStyle.normal,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,    
          fontFamily: 'Pacifico',  
          color: Colors.deepPurpleAccent,
          fontStyle: FontStyle.normal,
        ),            
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Pacifico',     
              color: ColorStyles.mainColor,
            )
          )
      ),
    );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,  
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white70,
      primary: ColorStyles.mainColor,
      secondary: ColorStyles.secondaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'Pacifico',     
        color: ColorStyles.mainColor,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorStyles.elementsColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(10),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Установите желаемый радиус
          )
        ),        
        backgroundColor: MaterialStatePropertyAll(ColorStyles.elementsColor)
      )
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Установите желаемый радиус
          )
        ),        
        backgroundColor: MaterialStatePropertyAll(ColorStyles.elementsColor)
      )
    ),    
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(ColorStyles.elementsColor)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),   
      alignLabelWithHint: true,
      filled: true,
      fillColor: Colors.transparent,
      isDense: true,
      errorStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        fontFamily: 'Pacifico',           
        color: ColorStyles.errorColor,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Pacifico',           
        color: Colors.white70,
        fontStyle: FontStyle.normal,
      ),
      labelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'Pacifico',           
        color: Colors.white70,
        fontStyle: FontStyle.normal,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius:  BorderRadius.horizontal(),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),       
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.horizontal(),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.horizontal(),
        borderSide: BorderSide(color: ColorStyles.errorColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.horizontal(),
        borderSide: BorderSide(color: ColorStyles.errorColor, width: 1),
      ), 
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,  
        fontFamily: 'Pacifico',  
        color: ColorStyles.mainColor,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,    
        fontFamily: 'Pacifico',  
        color: ColorStyles.mainColor,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24,    
        fontFamily: 'Pacifico',  
        color: ColorStyles.mainColor,
        fontStyle: FontStyle.normal,
      ),            
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
            fontSize: 14,
            fontFamily: 'Pacifico',     
            color: ColorStyles.mainColor,
          )
        )
    ),
  );
}
