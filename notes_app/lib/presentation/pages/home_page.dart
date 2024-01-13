import 'package:flutter/material.dart';
import 'package:notes_app/data/add_note.dart';
import 'package:notes_app/data/get_notes.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/presentation/widgets/future_builder_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  
class _HomePageState extends State<HomePage> {
  late Future<List<NoteModel>> notes;
  late Future<String> name;
  Future<String> getName () async {
    await Future.delayed(const Duration(seconds: 10));
    return "Felipe";
  }
 
  @override
  Widget build(BuildContext context) {
    final TextEditingController txtController = TextEditingController();
    var notes = GetNotes().getNotes();
    var futurebuilder =   FutureBuilderWidget(getNotesList: notes );
    return  SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const  Text("NotesApp"),
          Row(
            children: [
              const SizedBox(width: 1,),
              Expanded(
                flex: 6,
                child: TextField(
                  controller: txtController,
                )),
              Expanded(
                flex: 3,
                child: ElevatedButton(onPressed: ()  {
                  if (txtController.text.isNotEmpty) {
                    AddNote().addNote(txtController.text);
                    setState(() {
                      notes;
                    });
                  } else {
                    debugPrint("nota não adicionada");
                  }
                 
                }, child: const Text("Adicionar Nota", textAlign: TextAlign.center,))),
              const SizedBox(width: 1,),
            ],
          ),
          Expanded(child: futurebuilder)
        ],
      ),
    ));
  }
}

//  FutureBuilder buildContainer() {
    
//     return FutureBuilder(
//         future: GetNotes().getFutureDados(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Center(
//               child: ListView.builder(
//               itemCount: snapshot.data!.length ,
//               itemBuilder: (context, index){
//                  return Text(snapshot.data![index].text);
//               })
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         });
//   }