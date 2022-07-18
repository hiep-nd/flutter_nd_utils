import 'package:flutter/material.dart';
import 'package:nd_utils/nd_utils.dart';

class AutoUnfocusPage extends StatelessWidget {
  const AutoUnfocusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Animation Examples'),
      ),
      body: NDAutoUnfocus(
        child: SafeArea(
          child: Column(
            children: const [
              SizedBox(height: 20),
              Text('Touch outside the textfields to unfocus'),
              SizedBox(height: 20),
              TextField(),
              SizedBox(height: 20),
              TextField(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
