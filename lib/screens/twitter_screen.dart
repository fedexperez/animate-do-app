import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool activateAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitter'),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: ZoomOut(
            animate: activateAnimation,
            from: 30,
            duration: const Duration(seconds: 1),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 80,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          activateAnimation = true;
          setState(() {});
        }),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.lightBlue,
          size: 55,
        ),
      ),
    );
  }
}
