import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const kMainColor = Color(0xFF7e5512);
const kMainColor = Color(0xFF7e0095);
const kTitleColor = Color(0xFF030303);
const kBorderColorTextField = Color(0xFFE8E7E5);
const kGreyTextColor = Color(0xFF818181);


final kTextStyle = GoogleFonts.manrope(
  color: Colors.white,
);

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

List<String> language = [
  'English',
  'French',
  'Spanish',
  'Arabic',
  'Urdu',
  'Hindi',
];
