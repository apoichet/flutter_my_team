double _width;
double _height;
const double _widthRef = 375.0;
const double _heightRef = 667.0;

setResponsiveSize(double width, double height) {
  _width = width;
  _height = height;
}

double getResponsiveSize(double size) {
  return size * _width * _height / (_widthRef * _heightRef);
}

double getResponsiveHeight(double height) {
  return height * _height /  _heightRef;
}

double getResponsiveWidth(double width) {
  return width * _width /  _widthRef;
}
