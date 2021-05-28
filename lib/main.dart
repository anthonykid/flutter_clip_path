import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            title: Text("Custom Clipper"),
            backgroundColor: Colors.indigo[800],
          ),
          body: Center(
            child: ClipPath(
              clipper:
                  MyClipper(), //making a class that we are gonna call below
              child: Image(
                //Creates a widget that displays an image.
                width: 300,
                image: NetworkImage(
                    "https://i.pinimg.com/564x/02/4f/8d/024f8da166391a9141e319740613c098.jpg"), //Creates an object that fetches the image at the given URL.
              ),
            ),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //Returns a description of the clip given that the render object being clipped is of the given size.
    Path path = Path();

    path.lineTo(0, size.height); //to cut from top left to left bottom.
    path.quadraticBezierTo(size.width / 2, size.height * 0.45, size.width,
        size.height); //to cut like a triangle x1,y1 for the top of the triangular we want to make the curve of, x2,y2 is the final point (size.width, size.height) it means its going to bottom right.
    path.lineTo(
        size.width, 0); //this is from the bottom left, to top left (x,y).
    //path.cubicTo(x1, y1, x2, y2, x3, y3) to make curva ^3 for cubic graph
    //path.conicTo(x1, y1, x2, y2, w) //making a porabolla, or eclipse curva
    path.close(); //this automatically close the lines, it goes back to the start of the line.

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
