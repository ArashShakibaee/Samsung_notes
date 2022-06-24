
import 'package:drift/drift.dart';

class NoteEntity extends Table{

  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isImportant => boolean().named("is_important")();
  TextColumn get title => text().named("title")();
  TextColumn get description => text().named("description")();
  DateTimeColumn get createdTime => dateTime().named("created_time")();
}