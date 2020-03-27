enum FontFamily {
  ARIAL, MONTSERRAT, MONTSERRAT_ALTERNATES
}

getFontFamily(FontFamily fontFamily) {
  switch (fontFamily) {
    case FontFamily.ARIAL : return "Arial";
    case FontFamily.MONTSERRAT : return "Montserrat";
    case FontFamily.MONTSERRAT_ALTERNATES : return "Montserrat_Alternates";
  }
}
