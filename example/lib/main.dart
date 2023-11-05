import 'package:example/auto_unfocus_page.dart';
import 'package:example/flip_animation_page.dart';
import 'package:example/stateful_builder_page.dart';
import 'package:flutter/material.dart';

void main() {
  Widget _buildMenuItem(String text, Widget Function(BuildContext) builder) =>
      Builder(
        builder: (context) => Center(
          child: TextButton(
            child: Text(text),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: builder,
              ));
            },
          ),
        ),
      );

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
              _buildMenuItem(
                  'NDFlipAnimation', (context) => const FlipAnimationPage()),
              _buildMenuItem(
                  'NDAutoUnfocus', (context) => const AutoUnfocusPage()),
              _buildMenuItem('NDStatefulBuilder', (_) => statefulBuilderPage())
            ],
          ),
        ),
      ),
    ),
  );
}
