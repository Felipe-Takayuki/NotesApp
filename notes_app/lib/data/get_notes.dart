import "dart:convert";
import "dart:developer";

import "package:http/http.dart" as http;
import "package:notes_app/models/note_model.dart";

class GetNotes{
final baseUrl = "http://localhost:8080/api";

 Future<List<NoteModel>> getNotes() async => await Future.delayed( const Duration(seconds: 10), () async{
        final url = Uri.parse("$baseUrl/get_notes");
 final response = await http.get(url);
 final body =  jsonDecode(response.body);
 log(body['users'].toString());
 List notes = body['users'];
 List<NoteModel> notesModel = [];
 for (var element in notes) {
    notesModel.add(NoteModel(id: element['id'], text: element['text']));
 }
 return notesModel;
  });
}