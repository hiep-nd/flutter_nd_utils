import 'package:example/flip_animation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'NDUtils Examples',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('NDUtils Examples'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Builder(
                builder: (context) => Center(
                  child: TextButton(
                    child: const Text('NDFlipAnimation'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FlipAnimationPage(),
                      ));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
