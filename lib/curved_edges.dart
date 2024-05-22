
import 'package:flutter/material.dart';

class ECustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

   var path =Path();
   path.lineTo(0, size.height);
   final firstCurve=Offset(0, size.height-70);
   final lastCurve =Offset(70, size.height-70);
   path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

   final secondFirstCurve=Offset(70, size.height-70);
   final secondLastCurve=Offset(size.width-70, size.height-70);
   path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

   final thirdFirstCurve=Offset(size.width,size.height-70);
   final thirdLastCurve=Offset(size.width,size.height-140);
   path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

   path.lineTo(size.width, 0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return false;
  }

} 