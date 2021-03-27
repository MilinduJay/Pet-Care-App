import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:redmaster/config/palette.dart';

class BackgroundPainter extends CustomPainter{
  BackgroundPainter ({ Animation<double> animation}) :
        bluePaint = Paint()
          ..color = Palette.lightBlue
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
        ..color = Palette.darkBlue
        ..style = PaintingStyle.fill,

        orangePaint = Paint()
        ..color = Palette.orange
        ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
          parent: animation,
        ),
        orangeAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
              0,
              0.7,
              curve: Interval(0,0.8,curve: SpringCurve()),
          ),
        ),
        greyAnimAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.8,
            curve: Interval(0,0.9,curve: SpringCurve()),
          ),
        ),
        blueAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint:animation);

  final Animation<double> liquidAnim;
  final Animation<double> blueAnim;
  final Animation<double> greyAnimAnim;
  final Animation<double> orangeAnim;

  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;
  @override
  void paint(Canvas canvas, Size size) {
    print('painting ');
    paintBlue(canvas, size);
    paintGrey(canvas, size);
    paintOrange(canvas, size);
  }

  void paintBlue(Canvas canvas, Size size){
    final path = Path();
    path.moveTo(size.width, size.height /2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, blueAnim.value),
    );
//    path.quadraticBezierTo(size.width/2, 0, size.width, size.height /2);
    _addPointsToPath(path, [
      Point(
      lerpDouble(0, size.width /4, blueAnim.value),
      lerpDouble(0, size.height, blueAnim.value),

      ),
//      Point(size.width,size.height/4),
      Point(
        lerpDouble(size.width / 2, size.width /4 * 3, liquidAnim.value),
        lerpDouble(size.height / 2, size.height /4 * 3, liquidAnim.value),

      ),
      Point(
          size.width,
          lerpDouble(size.height /2,size.height * 3 / 4, liquidAnim.value)),
    ]);
    canvas.drawPath(path, bluePaint);
  }

  void paintGrey(Canvas canvas, Size size){
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(size.height/4, size.height/ 2, greyAnimAnim.value),
    );
//    path.quadraticBezierTo(size.width/2, 0, size.width, size.height /2);
    _addPointsToPath(path, [
      Point(
        size.width/4,
        lerpDouble(size.height /2, size.height * 3 /4, liquidAnim.value),

      ),
//      Point(size.width,size.height/4),
      Point(
       size.width *3/5,
        lerpDouble(size.height / 4, size.height /2, liquidAnim.value),

      ),
      Point(
          size.width *4/5,
          lerpDouble(size.height /6,size.height   / 3, greyAnimAnim.value)),
      Point(
          size.width,
          lerpDouble(size.height /5,size.height   / 4, greyAnimAnim.value)),
    ]);
    canvas.drawPath(path, greyPaint);
  }
  void paintOrange(Canvas canvas, Size size){
    if(orangeAnim.value >0){
      final path = Path();
      path.moveTo(size.width*3/4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height/12, orangeAnim.value),
      );
//    path.quadraticBezierTo(size.width/2, 0, size.width, size.height /2);
      _addPointsToPath(path, [
        Point(
         size.width /7,
          lerpDouble(0, size.height /6, liquidAnim.value),
        ),
//      Point(size.width,size.height/4),
        Point(
          size.width/3,
          lerpDouble(0,size.height / 10, liquidAnim.value),
        ),
        Point(
            size.width/3*2,
            lerpDouble(0,size.height / 8, liquidAnim.value)),
        Point(
            size.width/3*2,
          0,
           ),
      ]);
      canvas.drawPath(path, orangePaint);

    }

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points){
    if(points.length<3){
      throw UnsupportedError('Need three or more points to create a path');
    }

    for(var i=0; i < points.length -2; i++){
     final xc=(points[i].x + points[i + 1].x) /2;
     final yc=(points[i].x + points[i + 1].x) /2;
    }

    path.quadraticBezierTo(
      points[points.length -2].x,
      points[points.length -2].y,
      points[points.length -1].x,
      points[points.length -1].y,
    );
  }
}
class Point{
  final double x;
  final double y;

  Point(this.x,this.y);
}

class SpringCurve extends Curve{

  const SpringCurve({
   this.a = 0.15,
   this.w = 19.4,
});
  final double a;
  final double w;
@override
  double transformInternal(double t){
    return (-(pow(e, -t /a)* cos(t * w))+ 1).toDouble();
  }
}