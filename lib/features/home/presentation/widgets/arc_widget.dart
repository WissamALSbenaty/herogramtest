import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double sweepAngle; // Angle of the arc, calculated from the percentage

  ArcPainter(this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Adjust stroke width for smaller size

    // Translate canvas to top-center of the circle
    canvas.translate(size.width / 2, 0); // Move to the top-center

    double startAngle = -90.0; // Start angle (top of the circle)

    // Use size.width/2 to fit the arc within the 48x48 size
    Rect rect = Rect.fromCircle(center: Offset(0, size.width / 2), radius: size.width / 2);
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when the sweep angle changes
  }
}

class ArcWidget extends StatefulWidget {
  final double percentage; // The percentage to animate

  ArcWidget({required this.percentage});

  @override
  _ArcWidgetState createState() => _ArcWidgetState();
}

class _ArcWidgetState extends State<ArcWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _currentPercentage;

  @override
  void initState() {
    super.initState();

    _currentPercentage = widget.percentage; // Initialize with the current percentage

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Duration of the animation
    );

    // Initialize the animation to transition between current and new percentage
    _animation = Tween<double>(begin: _currentPercentage, end: widget.percentage).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Add listener to update state with new animation value
    _animation.addListener(() {
      setState(() {
        _currentPercentage = _animation.value; // Update the percentage as animation progresses
      });
    });

    // Start the animation when widget is created
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant ArcWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Restart the animation when the percentage changes
    if (oldWidget.percentage != widget.percentage) {
      _controller.reset(); // Reset the animation controller
      _animation = Tween<double>(begin: _currentPercentage, end: widget.percentage).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
      _controller.forward(); // Start the animation again
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(48, 48), // Fixed size of 48x48
      painter: ArcPainter((2 * 3.14159265359 * (_currentPercentage / 100))), // Convert percentage to angle
    );
  }
}
