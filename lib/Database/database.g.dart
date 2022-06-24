// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NoteEntityData extends DataClass implements Insertable<NoteEntityData> {
  final int id;
  final bool isImportant;
  final String title;
  final String description;
  final DateTime createdTime;
  NoteEntityData(
      {required this.id,
      required this.isImportant,
      required this.title,
      required this.description,
      required this.createdTime});
  factory NoteEntityData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NoteEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      isImportant: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_important'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      createdTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_important'] = Variable<bool>(isImportant);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  NoteEntityCompanion toCompanion(bool nullToAbsent) {
    return NoteEntityCompanion(
      id: Value(id),
      isImportant: Value(isImportant),
      title: Value(title),
      description: Value(description),
      createdTime: Value(createdTime),
    );
  }

  factory NoteEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteEntityData(
      id: serializer.fromJson<int>(json['id']),
      isImportant: serializer.fromJson<bool>(json['isImportant']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isImportant': serializer.toJson<bool>(isImportant),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  NoteEntityData copyWith(
          {int? id,
          bool? isImportant,
          String? title,
          String? description,
          DateTime? createdTime}) =>
      NoteEntityData(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );
  @override
  String toString() {
    return (StringBuffer('NoteEntityData(')
          ..write('id: $id, ')
          ..write('isImportant: $isImportant, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, isImportant, title, description, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteEntityData &&
          other.id == this.id &&
          other.isImportant == this.isImportant &&
          other.title == this.title &&
          other.description == this.description &&
          other.createdTime == this.createdTime);
}

class NoteEntityCompanion extends UpdateCompanion<NoteEntityData> {
  final Value<int> id;
  final Value<bool> isImportant;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> createdTime;
  const NoteEntityCompanion({
    this.id = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  NoteEntityCompanion.insert({
    this.id = const Value.absent(),
    required bool isImportant,
    required String title,
    required String description,
    required DateTime createdTime,
  })  : isImportant = Value(isImportant),
        title = Value(title),
        description = Value(description),
        createdTime = Value(createdTime);
  static Insertable<NoteEntityData> custom({
    Expression<int>? id,
    Expression<bool>? isImportant,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? createdTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isImportant != null) 'is_important': isImportant,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (createdTime != null) 'created_time': createdTime,
    });
  }

  NoteEntityCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isImportant,
      Value<String>? title,
      Value<String>? description,
      Value<DateTime>? createdTime}) {
    return NoteEntityCompanion(
      id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isImportant.present) {
      map['is_important'] = Variable<bool>(isImportant.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteEntityCompanion(')
          ..write('id: $id, ')
          ..write('isImportant: $isImportant, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }
}

class $NoteEntityTable extends NoteEntity
    with TableInfo<$NoteEntityTable, NoteEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  @override
  late final GeneratedColumn<bool?> isImportant = GeneratedColumn<bool?>(
      'is_important', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_important IN (0, 1))');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime?> createdTime =
      GeneratedColumn<DateTime?>('created_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, isImportant, title, description, createdTime];
  @override
  String get aliasedName => _alias ?? 'note_entity';
  @override
  String get actualTableName => 'note_entity';
  @override
  VerificationContext validateIntegrity(Insertable<NoteEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_important')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['is_important']!, _isImportantMeta));
    } else if (isInserting) {
      context.missing(_isImportantMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NoteEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NoteEntityTable createAlias(String alias) {
    return $NoteEntityTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NoteEntityTable noteEntity = $NoteEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteEntity];
}
