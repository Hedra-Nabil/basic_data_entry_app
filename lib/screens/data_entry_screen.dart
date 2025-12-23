import 'package:flutter/material.dart';
import '../widgets/custom_text_input.dart';
import '../widgets/custom_submit_button.dart';
import '../widgets/text_display_area.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final TextEditingController _textController = TextEditingController();
  String? _displayedText;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    setState(() {
      _displayedText = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Input'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              CustomTextInput(
                controller: _textController,
                hintText: 'Enter text here',
                onSubmitted: (_) => _handleSubmit(),
              ),
              const SizedBox(height: 20),
              CustomSubmitButton(
                onPressed: _handleSubmit,
                text: 'Submit',
              ),
              const SizedBox(height: 30),
              Expanded(
                child: TextDisplayArea(
                  displayedText: _displayedText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
