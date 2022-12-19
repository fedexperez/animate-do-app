import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animate Do'),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.pushNamed(context, 'twitter');
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
                child: const Icon(Icons.new_releases,
                    size: 40, color: Colors.lightBlue)),
            FadeInLeft(
              child: const Text(
                'Title',
                style: TextStyle(fontSize: 40, color: Colors.lightBlue),
              ),
            ),
            FadeInRight(
              child: const Text(
                'Sub-Title',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.lightBlue,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'navigation');
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
