import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class FutureBuilderWidget extends StatefulWidget {
  final Future<List<NoteModel>> getNotesList;
  const FutureBuilderWidget({super.key, required this.getNotesList});
  
  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.getNotesList, 
      builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
              itemCount: snapshot.data!.length ,
              itemBuilder: (context, index){
                 return ListTile(
                  
                  title: Text(snapshot.data![index].text as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                  subtitle: Text("id: ${snapshot.data![index].id}", style: const  TextStyle(fontSize: 15, fontWeight: FontWeight.w300 ),),
                  );
              })
            );
          } else  {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}