import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Note.dart';

class NotesOperation with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNote('First Note', 'First Note Description');
  }

  void addNewNote(String title, String description) {
    int id = 0;
    if (_notes.isNotEmpty) {
      id = _notes.last.id + 1;
    }
    Note note = Note(id, title, description);
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int id) {
    int index = 0;
    for(var i =0; i< _notes.length; i++){
      if(_notes[i].id == id){
        index = i;
      }
    }
    _notes.removeAt(index);
    notifyListeners();
  }
}
