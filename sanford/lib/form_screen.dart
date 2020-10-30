import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sanford/speech.dart';

class FormScreen extends StatefulWidget {
  @override
  final String text;
  final String question;
  State<StatefulWidget> createState() {
    return FormScreenState();
  }

  FormScreen({Key key, this.text, this.question}) : super(key: key);
}

class FormScreenState extends State<FormScreen> {
  String _feeling;
  String _temp;
  String _active;
  String _new;
  String _other;

  final fb = FirebaseDatabase.instance;

  final notesReference = FirebaseDatabase.instance.reference();

  static String _feelingQ;
  static String _tempQ;
  static String _activeQ;
  static String _newQ;
  static String _otherQ;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFeeling() {
    _valueCheck();
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'How are you feeling?',
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SpeechScreen(text: 'How are you feeling?')),
            );
          },
        ),
      ),
      initialValue: _feelingQ,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _feeling = value;
      },
    );
  }

  Widget _buildTemp() {
    _valueCheck();
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'What is your temperature?',
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SpeechScreen(text: 'What is your temperature?')),
            );
          },
        ),
      ),
      initialValue: _tempQ,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _temp = value;
      },
    );
  }

  Widget _buildActive() {
    _valueCheck();
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'Have you been physically active?',
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SpeechScreen(text: 'Have you been physically active?')),
            );
          },
        ),
      ),
      initialValue: _activeQ,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Answer is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _active = value;
      },
    );
  }

  Widget _buildNew() {
    _valueCheck();
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'Any new problems?',
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SpeechScreen(text: 'Any new problems?')),
            );
          },
        ),
      ),
      initialValue: _newQ,
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _new = value;
      },
    );
  }

  Widget _buildOther() {
    _valueCheck();
    return TextFormField(
      maxLines: null,
      decoration: InputDecoration(
        labelText: 'Other Infomation',
        suffixIcon: IconButton(
          icon: Icon(Icons.mic),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpeechScreen(text: 'Other Infomation')),
            );
          },
        ),
      ),
      initialValue: _otherQ,
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        _other = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Scaffold(
      appBar:
          AppBar(title: Text("Questions"), automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildFeeling(),
                _buildTemp(),
                _buildActive(),
                _buildNew(),
                _buildOther(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    createRecord();

                    print(_feeling);
                    print(_temp);
                    print(_active);
                    print(_new);
                    print(_other);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _valueCheck() {
    if (widget.question == 'How are you feeling?') {
      _feelingQ = widget.text;
    } else if (widget.question == 'What is your temperature?') {
      _tempQ = widget.text;
    } else if (widget.question == 'Have you been physically active?') {
      _activeQ = widget.text;
    } else if (widget.question == 'Any new problems?') {
      _newQ = widget.text;
    } else if (widget.question == 'Other Infomation') {
      _otherQ = widget.text;
    }
  }

  void createRecord() {
    notesReference
        .child("1")
        .set({'question': 'How are you feeling?', 'answer': _feeling});
    notesReference
        .child("2")
        .set({'question': 'What is your temperature?', 'answer': _temp});
    notesReference.child("3").set(
        {'question': 'Have you been physically active?', 'answer': _active});
    notesReference
        .child("4")
        .set({'question': 'Any new problems?', 'answer': _new});
    notesReference
        .child("5")
        .set({'question': 'Other Infomation', 'answer': _other});
  }
}
