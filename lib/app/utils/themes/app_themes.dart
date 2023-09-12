import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class AppThemes {
  ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgColorLight3,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColorLight2,
    ),
    fontFamily: GoogleFonts.workSans().fontFamily,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.workSans(
        color: greyColor,
      ),
      labelMedium: GoogleFonts.workSans(
        color: greyColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: bgColorLight2,
      foregroundColor: primaryColor,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.workSans(
        color: primaryColor,
        fontSize: bodyFS,
        fontWeight: semiBold,
      ),
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(
        primaryColor.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defaultRadius),
            ),
            side: BorderSide(color: primaryColor),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          side: BorderSide.none,
        );
      }),
      hintStyle: MaterialStateProperty.all(
        GoogleFonts.workSans(
          color: greyColor,
          fontSize: calloutFS,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        GoogleFonts.workSans(
          fontSize: calloutFS,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.workSans(
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(whiteColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.workSans(
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        foregroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.all(
          primaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgColorLight2,
      shape: radiusTopLeftRight,
    ),
  );

  ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgColorDark3,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColorDark2,
    ),
    fontFamily: GoogleFonts.workSans().fontFamily,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.workSans(
        color: mutedColor,
      ),
      labelMedium: GoogleFonts.workSans(
        color: mutedColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: bgColorDark4,
      foregroundColor: primaryColor,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.workSans(
        color: primaryColor,
        fontSize: bodyFS,
        fontWeight: semiBold,
      ),
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(
        primaryColor.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(defaultRadius),
            ),
            side: BorderSide(color: primaryColor),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          side: BorderSide.none,
        );
      }),
      hintStyle: MaterialStateProperty.all(
        GoogleFonts.workSans(
          color: mutedColor,
          fontSize: calloutFS,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        GoogleFonts.workSans(
          fontSize: calloutFS,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.workSans(
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(whiteColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.workSans(
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        foregroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.all(
          primaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgColorDark4,
      shape: radiusTopLeftRight,
    ),
  );
}
