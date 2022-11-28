import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  final String title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController wiggleController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<Offset> wiggleAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.1, 0.0),
  ).animate(CurvedAnimation(
    parent: wiggleController,
    curve: Curves.fastOutSlowIn,
  ));

  // late final AnimationController wiggleController =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 2))
  // ..addStatusListener((status) {
  //   if (status == AnimationStatus.completed) {
  //     Future.delayed(Duration(milliseconds: 5000), () {
  //       wiggleController.forward();
  //     });
  //   }
  // });
  // late final Animation<Offset> offsetAnimation = Tween<Offset>(
  //   begin: Offset.zero,
  //   end: const Offset(20.0, 10.0),
  // ).animate(CurvedAnimation(
  //   parent: wiggleController,
  //   curve: Curves.fastOutSlowIn,
  // ));

  @override
  void dispose() {
    super.dispose();
    wiggleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: wiggleAnimation,
        child: Text(
          this.widget.title,
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}
