import 'package:example/auto_unfocus_page.dart';
import 'package:example/flip_animation_page.dart';
import 'package:flutter/material.dart';
import 'package:nd_utils/nd_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NDAbsoluteDimentionDesign.ensureInitialized();

  Widget _buildMenuItem(String text, Widget Function(BuildContext) builder) =>
      Builder(
        builder: (context) {
          return Center(
            child: Container(
              width: 300.r,
              height: 100.r,
              color: Colors.yellow,
              child: TextButton(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16.r),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: builder,
                  ));
                },
              ),
            ),
          );
        },
      );

  runApp(Builder(
    builder: (context) => NDAbsoluteDimentionDesign.build(
      context,
      (context) => MaterialApp(
        title: 'NDUtils Examples',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'NDUtils Examples',
              style: TextStyle(fontSize: 30.r),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20.r),
                _buildMenuItem(
                    'NDFlipAnimation', (context) => const FlipAnimationPage()),
                SizedBox(height: 20.r),
                _buildMenuItem(
                    'NDAutoUnfocus', (context) => const AutoUnfocusPage()),
              ],
            ),
          ),
        ),
      ),
      design: NDAbsoluteDimentionDesign(ppi: 458 / 3),
    ),
  ));
}
