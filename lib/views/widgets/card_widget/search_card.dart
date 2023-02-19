import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class searchCard extends StatelessWidget {
  const searchCard({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 50,
                    child: customTextField(
                        hintText: 'search',
                        prefixIcon: Icons.search,
                        controller:
                            controller),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (controller
                        .text.isEmpty) {
                      Navigator.pop(context);
                    } else {
                      controller.clear();
                    }
                  },
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}