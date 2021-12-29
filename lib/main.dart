import 'package:ecom/screens/sign_in_screen.dart';
import 'package:ecom/screens/test.dart';
import 'package:ecom/state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StateCubit(),
      child: MaterialApp(
        title: '',
        color: const Color(0xffF7366B),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xffF7366B),
          textTheme: TextTheme(
            bodyText2: GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold),
            subtitle1: GoogleFonts.lato(),
            headline1: GoogleFonts.ubuntu(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            headline2: GoogleFonts.ptSans(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            bodyText1: GoogleFonts.raleway(
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: const Color(0xff9C9C9C),
            ),
            button: GoogleFonts.josefinSans(fontWeight: FontWeight.bold),
          ),
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
