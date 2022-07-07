import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = const Color(0xff5843BE);
Color orangeColor = const Color(0xffFF9376);
Color blackColor = const Color(0xff000000);
Color whiteColor = const Color(0xffFFFFFF);
Color greyColor = const Color(0xff82868E);
SizedBox box = const SizedBox(height: 20);

const double edge = 24;
const String urlKey = "https://opbdbfnpxfwjxxlyrnms.supabase.co";
const String anonKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9wYmRiZm5weGZ3anh4bHlybm1zIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTY5NDk2OTEsImV4cCI6MTk3MjUyNTY5MX0.EViuRlV1lGYvWBmnkWh04GhOBkJ9q6SZY0x3YnkvjRg";

TextStyle blackTextStyle = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontWeight: FontWeight.w500);

TextStyle greyTextStyle = GoogleFonts.poppins()
    .copyWith(color: greyColor, fontWeight: FontWeight.w300);

TextStyle whiteTextStyle = GoogleFonts.poppins()
    .copyWith(color: whiteColor, fontWeight: FontWeight.w500);

TextStyle purpleTextStyle = GoogleFonts.poppins()
    .copyWith(color: purpleColor, fontWeight: FontWeight.w500);

TextStyle regularTextStyle = GoogleFonts.poppins()
    .copyWith(color: blackColor, fontWeight: FontWeight.w400);

BoxDecoration gradient = BoxDecoration(
    gradient: const LinearGradient(colors: [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.purpleAccent
      //add more colors
    ]),
    borderRadius: BorderRadius.circular(5),
    boxShadow: const <BoxShadow>[
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
          blurRadius: 5) //blur radius of shadow
    ]);
