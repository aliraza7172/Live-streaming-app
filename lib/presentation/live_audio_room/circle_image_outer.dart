import 'package:flutter/material.dart';

class CircularImageOuter extends StatelessWidget {
  final String outerImagePath;
  final String innerImagePath;
  final double outerSize;
  final double innerSize;

  CircularImageOuter({
    required this.outerImagePath,
    required this.innerImagePath,
    this.outerSize = 150.0,
    this.innerSize = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 10,left: 10),
      width: outerSize,
      height: outerSize,
      child: ClipOval(
        child: Stack(
          children: [
            // Outer Image
            Image.asset(
              outerImagePath,
              width: outerSize,
              height: outerSize,
              fit: BoxFit.cover,
            ),
            // Inner Image
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Container(
                    width: innerSize,
                    height: innerSize,
                    color: Colors.white, // Set background color for inner image
                    child: Image.asset(
                      innerImagePath,
                      width: innerSize,
                      height: innerSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
