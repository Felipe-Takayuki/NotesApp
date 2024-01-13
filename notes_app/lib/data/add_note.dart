import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
class AddNote {

  Future<void> addNote (String text) async {
    final url = Uri.parse("http://localhost:8080/api/post_note");
    var body = jsonEncode({"text" : text});
    var headers = {'Content-Type': 'application/json',};
    var response = await http.post(url, body: body, headers:  headers);
     Map<String, dynamic> responseData = jsonDecode(response.body);
     if (responseData['nota']) {
       log("deu certo");
     } else {
      log("deu ruim!");
     }

  }
}