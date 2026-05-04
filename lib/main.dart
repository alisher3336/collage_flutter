class GuessInput extends StatelessWidget {
  final Function(String) onSubmitGuess;
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  GuessInput({super.key, required this.onSubmitGuess});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 5, 
              decoration: InputDecoration(labelText: "Enter your guess", 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                  )
                ),
              controller: _textEditingController,
              onSubmitted: (input) {
                _textEditingController.clear();
                _focusNode.requestFocus();
              },
              focusNode: _focusNode,
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.all(8.0),
          icon: Icon(Icons.arrow_circle_up),
          onPressed: () {
            onSubmitGuess(_textEditingController.text.trim());
            _textEditingController.clear();
            _focusNode.requestFocus();
          },
        ),
      ],
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: GamePage()),
        appBar: AppBar(title: Align(alignment: Alignment.centerLeft, child: Text("Bridle"))),
      ),
    );
  }
}
