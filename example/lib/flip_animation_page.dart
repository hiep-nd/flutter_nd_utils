import 'package:flutter/material.dart';
import 'package:nd_utils/nd_utils.dart';

class FlipAnimationPage extends StatelessWidget {
  const FlipAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Animation Examples'),
      ),
      body: Builder(
        builder: (context) {
          var isFront = ValueNotifier<bool>(true);
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: isFront,
                  builder: (_, value, ___) => NDFlipAnimationBuilder(
                    isFront: value,
                    builder: (context, isFront) {
                      if (isFront) {
                        // build front
                        return Container(
                          width: 100,
                          height: 200,
                          color: Colors.red,
                          child: const Center(child: Text('Front')),
                        );
                      } else {
                        // build back
                        return Container(
                          width: 200,
                          height: 200,
                          color: Colors.blue,
                          child: const Center(child: Text('Back')),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isFront,
                      builder: (_, value, ___) => Text(
                          '${value ? 'Front' : 'Back'}. Turn ${value ? 'Back' : 'Front'}'),
                    ),
                    onPressed: () {
                      isFront.value = !isFront.value;
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
