import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;
  // final RxBool isSubmit;
  const TextFieldWithTitle({super.key, required this.title, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // errorText: textEditingController.text.isEmpty && isSubmit.value ? '$title không được để trống' : null
                // hintText: 'Enter text here',
              ),
            ),
          ],
        ),
    );
  }
}