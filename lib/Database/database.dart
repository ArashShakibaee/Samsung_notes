
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart'as path;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:samsung_note/Database/note_entity.dart';
part 'database.g.dart';


LazyDatabase _openConnection (){
  return LazyDatabase(()async{
   final folder = await getApplicationDocumentsDirectory();
   final file = File(path.join(folder.path,"Note_Database"));
   return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [NoteEntity])
class Database extends _$Database{
  Database() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<NoteEntityData>> getAllNotes () async {
    return await select(noteEntity).get();
  }
  Future<NoteEntityData> getSingleNote(int id)async {
    return await (select(noteEntity)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
  Future<bool> updateNote(NoteEntityCompanion entity)async{
    return await update(noteEntity).replace(entity);
  }
  Future<int> createNote (NoteEntityCompanion entity) async{
    return await into(noteEntity).insert(entity);
  }
  Future<int> deleteNote(int id) async{
    return await (delete(noteEntity)..where((tbl) => tbl.id.equals(id))).go();
  }
}