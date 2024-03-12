import 'package:flutter/material.dart';

class CustomProcessingDialog extends StatelessWidget {
  final String title = '';

  const CustomProcessingDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("We are processing your information..."),
          ],
        ),
      ),
    );
  }
}

void openProcessingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const CustomProcessingDialog(),
  );
}

void closeProcessingDialog(BuildContext context) {
  Navigator.of(context).pop();
}
