class EditPalavraPage extends StatefulWidget {
  final String word;

  const EditPalavraPage({Key? key, required this.word}) : super(key: key);

  @override
  _EditPalavraPageState createState() => _EditPalavraPageState();
}

class _EditPalavraPageState extends State<EditPalavraPage> {
  final _formKey = GlobalKey<FormState>();
  late String _editedWord;

  @override
  void initState() {
    super.initState();
    _editedWord = widget.word;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _editedWord,
                decoration: InputDecoration(
                  labelText: 'Word',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a word';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _editedWord = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, _editedWord);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
