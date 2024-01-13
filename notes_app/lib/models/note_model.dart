class NoteModel {
  int? id;
  String? text;
  bool? stateNote;
  NoteModel({  this.id,  this.text, this.stateNote});

  NoteModel.fromJson(Map<String, dynamic> json, id,text,stateNote) {
    id = json['id'];
    text = json['text'];
    stateNote = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['note'] = stateNote;
    return data;
  }
}