import 'package:flutter/material.dart';
import 'package:nd_utils/nd_utils.dart';

Widget statefulBuilderPage() {
  return NDStatefulBuilder(
    initStateHandler: (state) {
      state['count'] = 0;
    },
    buildHandler: (context, setState, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('NDStatefulBuilder Examples'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(state['count'].toString()),
              TextButton(
                child: const Text('Increase'),
                onPressed: () {
                  setState(() => state['count']++);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
