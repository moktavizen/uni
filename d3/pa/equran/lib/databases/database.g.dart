// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Surahs extends Table with TableInfo<Surahs, Surah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Surahs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _arabicMeta = const VerificationMeta('arabic');
  late final GeneratedColumn<String> arabic = GeneratedColumn<String>(
      'arabic', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _latinMeta = const VerificationMeta('latin');
  late final GeneratedColumn<String> latin = GeneratedColumn<String>(
      'latin', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahCountMeta =
      const VerificationMeta('ayahCount');
  late final GeneratedColumn<int> ayahCount = GeneratedColumn<int>(
      'ayah_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, arabic, latin, translation, ayahCount, location];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surahs';
  @override
  VerificationContext validateIntegrity(Insertable<Surah> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('arabic')) {
      context.handle(_arabicMeta,
          arabic.isAcceptableOrUnknown(data['arabic']!, _arabicMeta));
    } else if (isInserting) {
      context.missing(_arabicMeta);
    }
    if (data.containsKey('latin')) {
      context.handle(
          _latinMeta, latin.isAcceptableOrUnknown(data['latin']!, _latinMeta));
    } else if (isInserting) {
      context.missing(_latinMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('ayah_count')) {
      context.handle(_ayahCountMeta,
          ayahCount.isAcceptableOrUnknown(data['ayah_count']!, _ayahCountMeta));
    } else if (isInserting) {
      context.missing(_ayahCountMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Surah map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Surah(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      arabic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}arabic'])!,
      latin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latin'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      ayahCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_count'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
    );
  }

  @override
  Surahs createAlias(String alias) {
    return Surahs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Surah extends DataClass implements Insertable<Surah> {
  final int id;
  final String arabic;
  final String latin;
  final String translation;
  final int ayahCount;
  final String location;
  const Surah(
      {required this.id,
      required this.arabic,
      required this.latin,
      required this.translation,
      required this.ayahCount,
      required this.location});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['arabic'] = Variable<String>(arabic);
    map['latin'] = Variable<String>(latin);
    map['translation'] = Variable<String>(translation);
    map['ayah_count'] = Variable<int>(ayahCount);
    map['location'] = Variable<String>(location);
    return map;
  }

  SurahsCompanion toCompanion(bool nullToAbsent) {
    return SurahsCompanion(
      id: Value(id),
      arabic: Value(arabic),
      latin: Value(latin),
      translation: Value(translation),
      ayahCount: Value(ayahCount),
      location: Value(location),
    );
  }

  factory Surah.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Surah(
      id: serializer.fromJson<int>(json['id']),
      arabic: serializer.fromJson<String>(json['arabic']),
      latin: serializer.fromJson<String>(json['latin']),
      translation: serializer.fromJson<String>(json['translation']),
      ayahCount: serializer.fromJson<int>(json['ayah_count']),
      location: serializer.fromJson<String>(json['location']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'arabic': serializer.toJson<String>(arabic),
      'latin': serializer.toJson<String>(latin),
      'translation': serializer.toJson<String>(translation),
      'ayah_count': serializer.toJson<int>(ayahCount),
      'location': serializer.toJson<String>(location),
    };
  }

  Surah copyWith(
          {int? id,
          String? arabic,
          String? latin,
          String? translation,
          int? ayahCount,
          String? location}) =>
      Surah(
        id: id ?? this.id,
        arabic: arabic ?? this.arabic,
        latin: latin ?? this.latin,
        translation: translation ?? this.translation,
        ayahCount: ayahCount ?? this.ayahCount,
        location: location ?? this.location,
      );
  @override
  String toString() {
    return (StringBuffer('Surah(')
          ..write('id: $id, ')
          ..write('arabic: $arabic, ')
          ..write('latin: $latin, ')
          ..write('translation: $translation, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, arabic, latin, translation, ayahCount, location);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Surah &&
          other.id == this.id &&
          other.arabic == this.arabic &&
          other.latin == this.latin &&
          other.translation == this.translation &&
          other.ayahCount == this.ayahCount &&
          other.location == this.location);
}

class SurahsCompanion extends UpdateCompanion<Surah> {
  final Value<int> id;
  final Value<String> arabic;
  final Value<String> latin;
  final Value<String> translation;
  final Value<int> ayahCount;
  final Value<String> location;
  const SurahsCompanion({
    this.id = const Value.absent(),
    this.arabic = const Value.absent(),
    this.latin = const Value.absent(),
    this.translation = const Value.absent(),
    this.ayahCount = const Value.absent(),
    this.location = const Value.absent(),
  });
  SurahsCompanion.insert({
    this.id = const Value.absent(),
    required String arabic,
    required String latin,
    required String translation,
    required int ayahCount,
    required String location,
  })  : arabic = Value(arabic),
        latin = Value(latin),
        translation = Value(translation),
        ayahCount = Value(ayahCount),
        location = Value(location);
  static Insertable<Surah> custom({
    Expression<int>? id,
    Expression<String>? arabic,
    Expression<String>? latin,
    Expression<String>? translation,
    Expression<int>? ayahCount,
    Expression<String>? location,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (arabic != null) 'arabic': arabic,
      if (latin != null) 'latin': latin,
      if (translation != null) 'translation': translation,
      if (ayahCount != null) 'ayah_count': ayahCount,
      if (location != null) 'location': location,
    });
  }

  SurahsCompanion copyWith(
      {Value<int>? id,
      Value<String>? arabic,
      Value<String>? latin,
      Value<String>? translation,
      Value<int>? ayahCount,
      Value<String>? location}) {
    return SurahsCompanion(
      id: id ?? this.id,
      arabic: arabic ?? this.arabic,
      latin: latin ?? this.latin,
      translation: translation ?? this.translation,
      ayahCount: ayahCount ?? this.ayahCount,
      location: location ?? this.location,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (arabic.present) {
      map['arabic'] = Variable<String>(arabic.value);
    }
    if (latin.present) {
      map['latin'] = Variable<String>(latin.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (ayahCount.present) {
      map['ayah_count'] = Variable<int>(ayahCount.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahsCompanion(')
          ..write('id: $id, ')
          ..write('arabic: $arabic, ')
          ..write('latin: $latin, ')
          ..write('translation: $translation, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('location: $location')
          ..write(')'))
        .toString();
  }
}

class Juzs extends Table with TableInfo<Juzs, Juz> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Juzs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _ayahCountMeta =
      const VerificationMeta('ayahCount');
  late final GeneratedColumn<int> ayahCount = GeneratedColumn<int>(
      'ayah_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _surahStartMeta =
      const VerificationMeta('surahStart');
  late final GeneratedColumn<String> surahStart = GeneratedColumn<String>(
      'surah_start', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahStartMeta =
      const VerificationMeta('ayahStart');
  late final GeneratedColumn<int> ayahStart = GeneratedColumn<int>(
      'ayah_start', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, ayahCount, surahStart, ayahStart];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'juzs';
  @override
  VerificationContext validateIntegrity(Insertable<Juz> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_count')) {
      context.handle(_ayahCountMeta,
          ayahCount.isAcceptableOrUnknown(data['ayah_count']!, _ayahCountMeta));
    } else if (isInserting) {
      context.missing(_ayahCountMeta);
    }
    if (data.containsKey('surah_start')) {
      context.handle(
          _surahStartMeta,
          surahStart.isAcceptableOrUnknown(
              data['surah_start']!, _surahStartMeta));
    } else if (isInserting) {
      context.missing(_surahStartMeta);
    }
    if (data.containsKey('ayah_start')) {
      context.handle(_ayahStartMeta,
          ayahStart.isAcceptableOrUnknown(data['ayah_start']!, _ayahStartMeta));
    } else if (isInserting) {
      context.missing(_ayahStartMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Juz map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Juz(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ayahCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_count'])!,
      surahStart: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_start'])!,
      ayahStart: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_start'])!,
    );
  }

  @override
  Juzs createAlias(String alias) {
    return Juzs(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Juz extends DataClass implements Insertable<Juz> {
  final int id;
  final int ayahCount;
  final String surahStart;
  final int ayahStart;
  const Juz(
      {required this.id,
      required this.ayahCount,
      required this.surahStart,
      required this.ayahStart});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_count'] = Variable<int>(ayahCount);
    map['surah_start'] = Variable<String>(surahStart);
    map['ayah_start'] = Variable<int>(ayahStart);
    return map;
  }

  JuzsCompanion toCompanion(bool nullToAbsent) {
    return JuzsCompanion(
      id: Value(id),
      ayahCount: Value(ayahCount),
      surahStart: Value(surahStart),
      ayahStart: Value(ayahStart),
    );
  }

  factory Juz.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Juz(
      id: serializer.fromJson<int>(json['id']),
      ayahCount: serializer.fromJson<int>(json['ayah_count']),
      surahStart: serializer.fromJson<String>(json['surah_start']),
      ayahStart: serializer.fromJson<int>(json['ayah_start']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayah_count': serializer.toJson<int>(ayahCount),
      'surah_start': serializer.toJson<String>(surahStart),
      'ayah_start': serializer.toJson<int>(ayahStart),
    };
  }

  Juz copyWith({int? id, int? ayahCount, String? surahStart, int? ayahStart}) =>
      Juz(
        id: id ?? this.id,
        ayahCount: ayahCount ?? this.ayahCount,
        surahStart: surahStart ?? this.surahStart,
        ayahStart: ayahStart ?? this.ayahStart,
      );
  @override
  String toString() {
    return (StringBuffer('Juz(')
          ..write('id: $id, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('surahStart: $surahStart, ')
          ..write('ayahStart: $ayahStart')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ayahCount, surahStart, ayahStart);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Juz &&
          other.id == this.id &&
          other.ayahCount == this.ayahCount &&
          other.surahStart == this.surahStart &&
          other.ayahStart == this.ayahStart);
}

class JuzsCompanion extends UpdateCompanion<Juz> {
  final Value<int> id;
  final Value<int> ayahCount;
  final Value<String> surahStart;
  final Value<int> ayahStart;
  const JuzsCompanion({
    this.id = const Value.absent(),
    this.ayahCount = const Value.absent(),
    this.surahStart = const Value.absent(),
    this.ayahStart = const Value.absent(),
  });
  JuzsCompanion.insert({
    this.id = const Value.absent(),
    required int ayahCount,
    required String surahStart,
    required int ayahStart,
  })  : ayahCount = Value(ayahCount),
        surahStart = Value(surahStart),
        ayahStart = Value(ayahStart);
  static Insertable<Juz> custom({
    Expression<int>? id,
    Expression<int>? ayahCount,
    Expression<String>? surahStart,
    Expression<int>? ayahStart,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahCount != null) 'ayah_count': ayahCount,
      if (surahStart != null) 'surah_start': surahStart,
      if (ayahStart != null) 'ayah_start': ayahStart,
    });
  }

  JuzsCompanion copyWith(
      {Value<int>? id,
      Value<int>? ayahCount,
      Value<String>? surahStart,
      Value<int>? ayahStart}) {
    return JuzsCompanion(
      id: id ?? this.id,
      ayahCount: ayahCount ?? this.ayahCount,
      surahStart: surahStart ?? this.surahStart,
      ayahStart: ayahStart ?? this.ayahStart,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahCount.present) {
      map['ayah_count'] = Variable<int>(ayahCount.value);
    }
    if (surahStart.present) {
      map['surah_start'] = Variable<String>(surahStart.value);
    }
    if (ayahStart.present) {
      map['ayah_start'] = Variable<int>(ayahStart.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuzsCompanion(')
          ..write('id: $id, ')
          ..write('ayahCount: $ayahCount, ')
          ..write('surahStart: $surahStart, ')
          ..write('ayahStart: $ayahStart')
          ..write(')'))
        .toString();
  }
}

class Ayahs extends Table with TableInfo<Ayahs, Ayah> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Ayahs(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _surahIdMeta =
      const VerificationMeta('surahId');
  late final GeneratedColumn<int> surahId = GeneratedColumn<int>(
      'surah_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _juzIdMeta = const VerificationMeta('juzId');
  late final GeneratedColumn<int> juzId = GeneratedColumn<int>(
      'juz_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _surahNameMeta =
      const VerificationMeta('surahName');
  late final GeneratedColumn<String> surahName = GeneratedColumn<String>(
      'surah_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahNumMeta =
      const VerificationMeta('ayahNum');
  late final GeneratedColumn<int> ayahNum = GeneratedColumn<int>(
      'ayah_num', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _arabicMeta = const VerificationMeta('arabic');
  late final GeneratedColumn<String> arabic = GeneratedColumn<String>(
      'arabic', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _latinMeta = const VerificationMeta('latin');
  late final GeneratedColumn<String> latin = GeneratedColumn<String>(
      'latin', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _translationMeta =
      const VerificationMeta('translation');
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
      'translation', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _tafsirMeta = const VerificationMeta('tafsir');
  late final GeneratedColumn<String> tafsir = GeneratedColumn<String>(
      'tafsir', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        surahId,
        juzId,
        surahName,
        ayahNum,
        arabic,
        latin,
        translation,
        tafsir
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayahs';
  @override
  VerificationContext validateIntegrity(Insertable<Ayah> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('surah_id')) {
      context.handle(_surahIdMeta,
          surahId.isAcceptableOrUnknown(data['surah_id']!, _surahIdMeta));
    } else if (isInserting) {
      context.missing(_surahIdMeta);
    }
    if (data.containsKey('juz_id')) {
      context.handle(
          _juzIdMeta, juzId.isAcceptableOrUnknown(data['juz_id']!, _juzIdMeta));
    } else if (isInserting) {
      context.missing(_juzIdMeta);
    }
    if (data.containsKey('surah_name')) {
      context.handle(_surahNameMeta,
          surahName.isAcceptableOrUnknown(data['surah_name']!, _surahNameMeta));
    } else if (isInserting) {
      context.missing(_surahNameMeta);
    }
    if (data.containsKey('ayah_num')) {
      context.handle(_ayahNumMeta,
          ayahNum.isAcceptableOrUnknown(data['ayah_num']!, _ayahNumMeta));
    } else if (isInserting) {
      context.missing(_ayahNumMeta);
    }
    if (data.containsKey('arabic')) {
      context.handle(_arabicMeta,
          arabic.isAcceptableOrUnknown(data['arabic']!, _arabicMeta));
    } else if (isInserting) {
      context.missing(_arabicMeta);
    }
    if (data.containsKey('latin')) {
      context.handle(
          _latinMeta, latin.isAcceptableOrUnknown(data['latin']!, _latinMeta));
    } else if (isInserting) {
      context.missing(_latinMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
          _translationMeta,
          translation.isAcceptableOrUnknown(
              data['translation']!, _translationMeta));
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('tafsir')) {
      context.handle(_tafsirMeta,
          tafsir.isAcceptableOrUnknown(data['tafsir']!, _tafsirMeta));
    } else if (isInserting) {
      context.missing(_tafsirMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ayah map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ayah(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      surahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_id'])!,
      juzId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}juz_id'])!,
      surahName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name'])!,
      ayahNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_num'])!,
      arabic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}arabic'])!,
      latin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latin'])!,
      translation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}translation'])!,
      tafsir: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tafsir'])!,
    );
  }

  @override
  Ayahs createAlias(String alias) {
    return Ayahs(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(surah_id)REFERENCES surahs(id)ON DELETE CASCADE',
        'FOREIGN KEY(juz_id)REFERENCES juzs(id)ON DELETE CASCADE'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Ayah extends DataClass implements Insertable<Ayah> {
  final int id;
  final int surahId;
  final int juzId;
  final String surahName;
  final int ayahNum;
  final String arabic;
  final String latin;
  final String translation;
  final String tafsir;
  const Ayah(
      {required this.id,
      required this.surahId,
      required this.juzId,
      required this.surahName,
      required this.ayahNum,
      required this.arabic,
      required this.latin,
      required this.translation,
      required this.tafsir});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_id'] = Variable<int>(surahId);
    map['juz_id'] = Variable<int>(juzId);
    map['surah_name'] = Variable<String>(surahName);
    map['ayah_num'] = Variable<int>(ayahNum);
    map['arabic'] = Variable<String>(arabic);
    map['latin'] = Variable<String>(latin);
    map['translation'] = Variable<String>(translation);
    map['tafsir'] = Variable<String>(tafsir);
    return map;
  }

  AyahsCompanion toCompanion(bool nullToAbsent) {
    return AyahsCompanion(
      id: Value(id),
      surahId: Value(surahId),
      juzId: Value(juzId),
      surahName: Value(surahName),
      ayahNum: Value(ayahNum),
      arabic: Value(arabic),
      latin: Value(latin),
      translation: Value(translation),
      tafsir: Value(tafsir),
    );
  }

  factory Ayah.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ayah(
      id: serializer.fromJson<int>(json['id']),
      surahId: serializer.fromJson<int>(json['surah_id']),
      juzId: serializer.fromJson<int>(json['juz_id']),
      surahName: serializer.fromJson<String>(json['surah_name']),
      ayahNum: serializer.fromJson<int>(json['ayah_num']),
      arabic: serializer.fromJson<String>(json['arabic']),
      latin: serializer.fromJson<String>(json['latin']),
      translation: serializer.fromJson<String>(json['translation']),
      tafsir: serializer.fromJson<String>(json['tafsir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surah_id': serializer.toJson<int>(surahId),
      'juz_id': serializer.toJson<int>(juzId),
      'surah_name': serializer.toJson<String>(surahName),
      'ayah_num': serializer.toJson<int>(ayahNum),
      'arabic': serializer.toJson<String>(arabic),
      'latin': serializer.toJson<String>(latin),
      'translation': serializer.toJson<String>(translation),
      'tafsir': serializer.toJson<String>(tafsir),
    };
  }

  Ayah copyWith(
          {int? id,
          int? surahId,
          int? juzId,
          String? surahName,
          int? ayahNum,
          String? arabic,
          String? latin,
          String? translation,
          String? tafsir}) =>
      Ayah(
        id: id ?? this.id,
        surahId: surahId ?? this.surahId,
        juzId: juzId ?? this.juzId,
        surahName: surahName ?? this.surahName,
        ayahNum: ayahNum ?? this.ayahNum,
        arabic: arabic ?? this.arabic,
        latin: latin ?? this.latin,
        translation: translation ?? this.translation,
        tafsir: tafsir ?? this.tafsir,
      );
  @override
  String toString() {
    return (StringBuffer('Ayah(')
          ..write('id: $id, ')
          ..write('surahId: $surahId, ')
          ..write('juzId: $juzId, ')
          ..write('surahName: $surahName, ')
          ..write('ayahNum: $ayahNum, ')
          ..write('arabic: $arabic, ')
          ..write('latin: $latin, ')
          ..write('translation: $translation, ')
          ..write('tafsir: $tafsir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, surahId, juzId, surahName, ayahNum,
      arabic, latin, translation, tafsir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ayah &&
          other.id == this.id &&
          other.surahId == this.surahId &&
          other.juzId == this.juzId &&
          other.surahName == this.surahName &&
          other.ayahNum == this.ayahNum &&
          other.arabic == this.arabic &&
          other.latin == this.latin &&
          other.translation == this.translation &&
          other.tafsir == this.tafsir);
}

class AyahsCompanion extends UpdateCompanion<Ayah> {
  final Value<int> id;
  final Value<int> surahId;
  final Value<int> juzId;
  final Value<String> surahName;
  final Value<int> ayahNum;
  final Value<String> arabic;
  final Value<String> latin;
  final Value<String> translation;
  final Value<String> tafsir;
  const AyahsCompanion({
    this.id = const Value.absent(),
    this.surahId = const Value.absent(),
    this.juzId = const Value.absent(),
    this.surahName = const Value.absent(),
    this.ayahNum = const Value.absent(),
    this.arabic = const Value.absent(),
    this.latin = const Value.absent(),
    this.translation = const Value.absent(),
    this.tafsir = const Value.absent(),
  });
  AyahsCompanion.insert({
    this.id = const Value.absent(),
    required int surahId,
    required int juzId,
    required String surahName,
    required int ayahNum,
    required String arabic,
    required String latin,
    required String translation,
    required String tafsir,
  })  : surahId = Value(surahId),
        juzId = Value(juzId),
        surahName = Value(surahName),
        ayahNum = Value(ayahNum),
        arabic = Value(arabic),
        latin = Value(latin),
        translation = Value(translation),
        tafsir = Value(tafsir);
  static Insertable<Ayah> custom({
    Expression<int>? id,
    Expression<int>? surahId,
    Expression<int>? juzId,
    Expression<String>? surahName,
    Expression<int>? ayahNum,
    Expression<String>? arabic,
    Expression<String>? latin,
    Expression<String>? translation,
    Expression<String>? tafsir,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahId != null) 'surah_id': surahId,
      if (juzId != null) 'juz_id': juzId,
      if (surahName != null) 'surah_name': surahName,
      if (ayahNum != null) 'ayah_num': ayahNum,
      if (arabic != null) 'arabic': arabic,
      if (latin != null) 'latin': latin,
      if (translation != null) 'translation': translation,
      if (tafsir != null) 'tafsir': tafsir,
    });
  }

  AyahsCompanion copyWith(
      {Value<int>? id,
      Value<int>? surahId,
      Value<int>? juzId,
      Value<String>? surahName,
      Value<int>? ayahNum,
      Value<String>? arabic,
      Value<String>? latin,
      Value<String>? translation,
      Value<String>? tafsir}) {
    return AyahsCompanion(
      id: id ?? this.id,
      surahId: surahId ?? this.surahId,
      juzId: juzId ?? this.juzId,
      surahName: surahName ?? this.surahName,
      ayahNum: ayahNum ?? this.ayahNum,
      arabic: arabic ?? this.arabic,
      latin: latin ?? this.latin,
      translation: translation ?? this.translation,
      tafsir: tafsir ?? this.tafsir,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahId.present) {
      map['surah_id'] = Variable<int>(surahId.value);
    }
    if (juzId.present) {
      map['juz_id'] = Variable<int>(juzId.value);
    }
    if (surahName.present) {
      map['surah_name'] = Variable<String>(surahName.value);
    }
    if (ayahNum.present) {
      map['ayah_num'] = Variable<int>(ayahNum.value);
    }
    if (arabic.present) {
      map['arabic'] = Variable<String>(arabic.value);
    }
    if (latin.present) {
      map['latin'] = Variable<String>(latin.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (tafsir.present) {
      map['tafsir'] = Variable<String>(tafsir.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyahsCompanion(')
          ..write('id: $id, ')
          ..write('surahId: $surahId, ')
          ..write('juzId: $juzId, ')
          ..write('surahName: $surahName, ')
          ..write('ayahNum: $ayahNum, ')
          ..write('arabic: $arabic, ')
          ..write('latin: $latin, ')
          ..write('translation: $translation, ')
          ..write('tafsir: $tafsir')
          ..write(')'))
        .toString();
  }
}

class LastRead extends Table with TableInfo<LastRead, LastReadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LastRead(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _screenIdMeta =
      const VerificationMeta('screenId');
  late final GeneratedColumn<int> screenId = GeneratedColumn<int>(
      'screen_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _screenTitleMeta =
      const VerificationMeta('screenTitle');
  late final GeneratedColumn<String> screenTitle = GeneratedColumn<String>(
      'screen_title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahIndexMeta =
      const VerificationMeta('ayahIndex');
  late final GeneratedColumn<int> ayahIndex = GeneratedColumn<int>(
      'ayah_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahNumMeta =
      const VerificationMeta('ayahNum');
  late final GeneratedColumn<int> ayahNum = GeneratedColumn<int>(
      'ayah_num', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, screenId, screenTitle, ayahIndex, ayahNum];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'last_read';
  @override
  VerificationContext validateIntegrity(Insertable<LastReadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('screen_id')) {
      context.handle(_screenIdMeta,
          screenId.isAcceptableOrUnknown(data['screen_id']!, _screenIdMeta));
    } else if (isInserting) {
      context.missing(_screenIdMeta);
    }
    if (data.containsKey('screen_title')) {
      context.handle(
          _screenTitleMeta,
          screenTitle.isAcceptableOrUnknown(
              data['screen_title']!, _screenTitleMeta));
    } else if (isInserting) {
      context.missing(_screenTitleMeta);
    }
    if (data.containsKey('ayah_index')) {
      context.handle(_ayahIndexMeta,
          ayahIndex.isAcceptableOrUnknown(data['ayah_index']!, _ayahIndexMeta));
    } else if (isInserting) {
      context.missing(_ayahIndexMeta);
    }
    if (data.containsKey('ayah_num')) {
      context.handle(_ayahNumMeta,
          ayahNum.isAcceptableOrUnknown(data['ayah_num']!, _ayahNumMeta));
    } else if (isInserting) {
      context.missing(_ayahNumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastReadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LastReadData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      screenId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screen_id'])!,
      screenTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_title'])!,
      ayahIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_index'])!,
      ayahNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_num'])!,
    );
  }

  @override
  LastRead createAlias(String alias) {
    return LastRead(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LastReadData extends DataClass implements Insertable<LastReadData> {
  final int id;
  final int screenId;
  final String screenTitle;
  final int ayahIndex;
  final int ayahNum;
  const LastReadData(
      {required this.id,
      required this.screenId,
      required this.screenTitle,
      required this.ayahIndex,
      required this.ayahNum});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['screen_id'] = Variable<int>(screenId);
    map['screen_title'] = Variable<String>(screenTitle);
    map['ayah_index'] = Variable<int>(ayahIndex);
    map['ayah_num'] = Variable<int>(ayahNum);
    return map;
  }

  LastReadCompanion toCompanion(bool nullToAbsent) {
    return LastReadCompanion(
      id: Value(id),
      screenId: Value(screenId),
      screenTitle: Value(screenTitle),
      ayahIndex: Value(ayahIndex),
      ayahNum: Value(ayahNum),
    );
  }

  factory LastReadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LastReadData(
      id: serializer.fromJson<int>(json['id']),
      screenId: serializer.fromJson<int>(json['screen_id']),
      screenTitle: serializer.fromJson<String>(json['screen_title']),
      ayahIndex: serializer.fromJson<int>(json['ayah_index']),
      ayahNum: serializer.fromJson<int>(json['ayah_num']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'screen_id': serializer.toJson<int>(screenId),
      'screen_title': serializer.toJson<String>(screenTitle),
      'ayah_index': serializer.toJson<int>(ayahIndex),
      'ayah_num': serializer.toJson<int>(ayahNum),
    };
  }

  LastReadData copyWith(
          {int? id,
          int? screenId,
          String? screenTitle,
          int? ayahIndex,
          int? ayahNum}) =>
      LastReadData(
        id: id ?? this.id,
        screenId: screenId ?? this.screenId,
        screenTitle: screenTitle ?? this.screenTitle,
        ayahIndex: ayahIndex ?? this.ayahIndex,
        ayahNum: ayahNum ?? this.ayahNum,
      );
  @override
  String toString() {
    return (StringBuffer('LastReadData(')
          ..write('id: $id, ')
          ..write('screenId: $screenId, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('ayahNum: $ayahNum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, screenId, screenTitle, ayahIndex, ayahNum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastReadData &&
          other.id == this.id &&
          other.screenId == this.screenId &&
          other.screenTitle == this.screenTitle &&
          other.ayahIndex == this.ayahIndex &&
          other.ayahNum == this.ayahNum);
}

class LastReadCompanion extends UpdateCompanion<LastReadData> {
  final Value<int> id;
  final Value<int> screenId;
  final Value<String> screenTitle;
  final Value<int> ayahIndex;
  final Value<int> ayahNum;
  const LastReadCompanion({
    this.id = const Value.absent(),
    this.screenId = const Value.absent(),
    this.screenTitle = const Value.absent(),
    this.ayahIndex = const Value.absent(),
    this.ayahNum = const Value.absent(),
  });
  LastReadCompanion.insert({
    this.id = const Value.absent(),
    required int screenId,
    required String screenTitle,
    required int ayahIndex,
    required int ayahNum,
  })  : screenId = Value(screenId),
        screenTitle = Value(screenTitle),
        ayahIndex = Value(ayahIndex),
        ayahNum = Value(ayahNum);
  static Insertable<LastReadData> custom({
    Expression<int>? id,
    Expression<int>? screenId,
    Expression<String>? screenTitle,
    Expression<int>? ayahIndex,
    Expression<int>? ayahNum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (screenId != null) 'screen_id': screenId,
      if (screenTitle != null) 'screen_title': screenTitle,
      if (ayahIndex != null) 'ayah_index': ayahIndex,
      if (ayahNum != null) 'ayah_num': ayahNum,
    });
  }

  LastReadCompanion copyWith(
      {Value<int>? id,
      Value<int>? screenId,
      Value<String>? screenTitle,
      Value<int>? ayahIndex,
      Value<int>? ayahNum}) {
    return LastReadCompanion(
      id: id ?? this.id,
      screenId: screenId ?? this.screenId,
      screenTitle: screenTitle ?? this.screenTitle,
      ayahIndex: ayahIndex ?? this.ayahIndex,
      ayahNum: ayahNum ?? this.ayahNum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (screenId.present) {
      map['screen_id'] = Variable<int>(screenId.value);
    }
    if (screenTitle.present) {
      map['screen_title'] = Variable<String>(screenTitle.value);
    }
    if (ayahIndex.present) {
      map['ayah_index'] = Variable<int>(ayahIndex.value);
    }
    if (ayahNum.present) {
      map['ayah_num'] = Variable<int>(ayahNum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastReadCompanion(')
          ..write('id: $id, ')
          ..write('screenId: $screenId, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('ayahNum: $ayahNum')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final Surahs surahs = Surahs(this);
  late final Juzs juzs = Juzs(this);
  late final Ayahs ayahs = Ayahs(this);
  late final Index idxAyahsSurahId = Index('idx_ayahs_surah_id',
      'CREATE INDEX IF NOT EXISTS idx_ayahs_surah_id ON ayahs (surah_id)');
  late final Index idxAyahsJuzId = Index('idx_ayahs_juz_id',
      'CREATE INDEX IF NOT EXISTS idx_ayahs_juz_id ON ayahs (juz_id)');
  late final LastRead lastRead = LastRead(this);
  late final Trigger enforceSingleLastRead = Trigger(
      'CREATE TRIGGER enforce_single_last_read BEFORE INSERT ON last_read BEGIN DELETE FROM last_read;END',
      'enforce_single_last_read');
  Selectable<Surah> allSurah() {
    return customSelect('SELECT * FROM surahs', variables: [], readsFrom: {
      surahs,
    }).asyncMap(surahs.mapFromRow);
  }

  Selectable<Juz> allJuz() {
    return customSelect('SELECT * FROM juzs', variables: [], readsFrom: {
      juzs,
    }).asyncMap(juzs.mapFromRow);
  }

  Selectable<Ayah> ayahsInSurah(int var1) {
    return customSelect('SELECT * FROM ayahs WHERE surah_id = ?1', variables: [
      Variable<int>(var1)
    ], readsFrom: {
      ayahs,
    }).asyncMap(ayahs.mapFromRow);
  }

  Selectable<Ayah> ayahsInJuz(int var1) {
    return customSelect('SELECT * FROM ayahs WHERE juz_id = ?1', variables: [
      Variable<int>(var1)
    ], readsFrom: {
      ayahs,
    }).asyncMap(ayahs.mapFromRow);
  }

  Future<int> saveLastRead(
      int screenId, String screenTitle, int ayahIndex, int ayahNum) {
    return customInsert(
      'INSERT INTO last_read (screen_id, screen_title, ayah_index, ayah_num) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<int>(screenId),
        Variable<String>(screenTitle),
        Variable<int>(ayahIndex),
        Variable<int>(ayahNum)
      ],
      updates: {lastRead},
    );
  }

  Selectable<LastReadData> getLastRead() {
    return customSelect('SELECT * FROM last_read', variables: [], readsFrom: {
      lastRead,
    }).asyncMap(lastRead.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        surahs,
        juzs,
        ayahs,
        idxAyahsSurahId,
        idxAyahsJuzId,
        lastRead,
        enforceSingleLastRead
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('surahs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('ayahs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('juzs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('ayahs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('last_read',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('last_read', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $SurahsInsertCompanionBuilder = SurahsCompanion Function({
  Value<int> id,
  required String arabic,
  required String latin,
  required String translation,
  required int ayahCount,
  required String location,
});
typedef $SurahsUpdateCompanionBuilder = SurahsCompanion Function({
  Value<int> id,
  Value<String> arabic,
  Value<String> latin,
  Value<String> translation,
  Value<int> ayahCount,
  Value<String> location,
});

class $SurahsTableManager extends RootTableManager<
    _$AppDatabase,
    Surahs,
    Surah,
    $SurahsFilterComposer,
    $SurahsOrderingComposer,
    $SurahsProcessedTableManager,
    $SurahsInsertCompanionBuilder,
    $SurahsUpdateCompanionBuilder> {
  $SurahsTableManager(_$AppDatabase db, Surahs table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $SurahsFilterComposer(ComposerState(db, table)),
          orderingComposer: $SurahsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $SurahsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> arabic = const Value.absent(),
            Value<String> latin = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<int> ayahCount = const Value.absent(),
            Value<String> location = const Value.absent(),
          }) =>
              SurahsCompanion(
            id: id,
            arabic: arabic,
            latin: latin,
            translation: translation,
            ayahCount: ayahCount,
            location: location,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String arabic,
            required String latin,
            required String translation,
            required int ayahCount,
            required String location,
          }) =>
              SurahsCompanion.insert(
            id: id,
            arabic: arabic,
            latin: latin,
            translation: translation,
            ayahCount: ayahCount,
            location: location,
          ),
        ));
}

class $SurahsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Surahs,
    Surah,
    $SurahsFilterComposer,
    $SurahsOrderingComposer,
    $SurahsProcessedTableManager,
    $SurahsInsertCompanionBuilder,
    $SurahsUpdateCompanionBuilder> {
  $SurahsProcessedTableManager(super.$state);
}

class $SurahsFilterComposer extends FilterComposer<_$AppDatabase, Surahs> {
  $SurahsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get arabic => $state.composableBuilder(
      column: $state.table.arabic,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get latin => $state.composableBuilder(
      column: $state.table.latin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahCount => $state.composableBuilder(
      column: $state.table.ayahCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $SurahsOrderingComposer extends OrderingComposer<_$AppDatabase, Surahs> {
  $SurahsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get arabic => $state.composableBuilder(
      column: $state.table.arabic,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get latin => $state.composableBuilder(
      column: $state.table.latin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahCount => $state.composableBuilder(
      column: $state.table.ayahCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $JuzsInsertCompanionBuilder = JuzsCompanion Function({
  Value<int> id,
  required int ayahCount,
  required String surahStart,
  required int ayahStart,
});
typedef $JuzsUpdateCompanionBuilder = JuzsCompanion Function({
  Value<int> id,
  Value<int> ayahCount,
  Value<String> surahStart,
  Value<int> ayahStart,
});

class $JuzsTableManager extends RootTableManager<
    _$AppDatabase,
    Juzs,
    Juz,
    $JuzsFilterComposer,
    $JuzsOrderingComposer,
    $JuzsProcessedTableManager,
    $JuzsInsertCompanionBuilder,
    $JuzsUpdateCompanionBuilder> {
  $JuzsTableManager(_$AppDatabase db, Juzs table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $JuzsFilterComposer(ComposerState(db, table)),
          orderingComposer: $JuzsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $JuzsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> ayahCount = const Value.absent(),
            Value<String> surahStart = const Value.absent(),
            Value<int> ayahStart = const Value.absent(),
          }) =>
              JuzsCompanion(
            id: id,
            ayahCount: ayahCount,
            surahStart: surahStart,
            ayahStart: ayahStart,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int ayahCount,
            required String surahStart,
            required int ayahStart,
          }) =>
              JuzsCompanion.insert(
            id: id,
            ayahCount: ayahCount,
            surahStart: surahStart,
            ayahStart: ayahStart,
          ),
        ));
}

class $JuzsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Juzs,
    Juz,
    $JuzsFilterComposer,
    $JuzsOrderingComposer,
    $JuzsProcessedTableManager,
    $JuzsInsertCompanionBuilder,
    $JuzsUpdateCompanionBuilder> {
  $JuzsProcessedTableManager(super.$state);
}

class $JuzsFilterComposer extends FilterComposer<_$AppDatabase, Juzs> {
  $JuzsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahCount => $state.composableBuilder(
      column: $state.table.ayahCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get surahStart => $state.composableBuilder(
      column: $state.table.surahStart,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahStart => $state.composableBuilder(
      column: $state.table.ayahStart,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $JuzsOrderingComposer extends OrderingComposer<_$AppDatabase, Juzs> {
  $JuzsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahCount => $state.composableBuilder(
      column: $state.table.ayahCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get surahStart => $state.composableBuilder(
      column: $state.table.surahStart,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahStart => $state.composableBuilder(
      column: $state.table.ayahStart,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $AyahsInsertCompanionBuilder = AyahsCompanion Function({
  Value<int> id,
  required int surahId,
  required int juzId,
  required String surahName,
  required int ayahNum,
  required String arabic,
  required String latin,
  required String translation,
  required String tafsir,
});
typedef $AyahsUpdateCompanionBuilder = AyahsCompanion Function({
  Value<int> id,
  Value<int> surahId,
  Value<int> juzId,
  Value<String> surahName,
  Value<int> ayahNum,
  Value<String> arabic,
  Value<String> latin,
  Value<String> translation,
  Value<String> tafsir,
});

class $AyahsTableManager extends RootTableManager<
    _$AppDatabase,
    Ayahs,
    Ayah,
    $AyahsFilterComposer,
    $AyahsOrderingComposer,
    $AyahsProcessedTableManager,
    $AyahsInsertCompanionBuilder,
    $AyahsUpdateCompanionBuilder> {
  $AyahsTableManager(_$AppDatabase db, Ayahs table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $AyahsFilterComposer(ComposerState(db, table)),
          orderingComposer: $AyahsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $AyahsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> surahId = const Value.absent(),
            Value<int> juzId = const Value.absent(),
            Value<String> surahName = const Value.absent(),
            Value<int> ayahNum = const Value.absent(),
            Value<String> arabic = const Value.absent(),
            Value<String> latin = const Value.absent(),
            Value<String> translation = const Value.absent(),
            Value<String> tafsir = const Value.absent(),
          }) =>
              AyahsCompanion(
            id: id,
            surahId: surahId,
            juzId: juzId,
            surahName: surahName,
            ayahNum: ayahNum,
            arabic: arabic,
            latin: latin,
            translation: translation,
            tafsir: tafsir,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int surahId,
            required int juzId,
            required String surahName,
            required int ayahNum,
            required String arabic,
            required String latin,
            required String translation,
            required String tafsir,
          }) =>
              AyahsCompanion.insert(
            id: id,
            surahId: surahId,
            juzId: juzId,
            surahName: surahName,
            ayahNum: ayahNum,
            arabic: arabic,
            latin: latin,
            translation: translation,
            tafsir: tafsir,
          ),
        ));
}

class $AyahsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Ayahs,
    Ayah,
    $AyahsFilterComposer,
    $AyahsOrderingComposer,
    $AyahsProcessedTableManager,
    $AyahsInsertCompanionBuilder,
    $AyahsUpdateCompanionBuilder> {
  $AyahsProcessedTableManager(super.$state);
}

class $AyahsFilterComposer extends FilterComposer<_$AppDatabase, Ayahs> {
  $AyahsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get surahId => $state.composableBuilder(
      column: $state.table.surahId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get juzId => $state.composableBuilder(
      column: $state.table.juzId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahNum => $state.composableBuilder(
      column: $state.table.ayahNum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get arabic => $state.composableBuilder(
      column: $state.table.arabic,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get latin => $state.composableBuilder(
      column: $state.table.latin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tafsir => $state.composableBuilder(
      column: $state.table.tafsir,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $AyahsOrderingComposer extends OrderingComposer<_$AppDatabase, Ayahs> {
  $AyahsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get surahId => $state.composableBuilder(
      column: $state.table.surahId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get juzId => $state.composableBuilder(
      column: $state.table.juzId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahNum => $state.composableBuilder(
      column: $state.table.ayahNum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get arabic => $state.composableBuilder(
      column: $state.table.arabic,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get latin => $state.composableBuilder(
      column: $state.table.latin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get translation => $state.composableBuilder(
      column: $state.table.translation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tafsir => $state.composableBuilder(
      column: $state.table.tafsir,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $LastReadInsertCompanionBuilder = LastReadCompanion Function({
  Value<int> id,
  required int screenId,
  required String screenTitle,
  required int ayahIndex,
  required int ayahNum,
});
typedef $LastReadUpdateCompanionBuilder = LastReadCompanion Function({
  Value<int> id,
  Value<int> screenId,
  Value<String> screenTitle,
  Value<int> ayahIndex,
  Value<int> ayahNum,
});

class $LastReadTableManager extends RootTableManager<
    _$AppDatabase,
    LastRead,
    LastReadData,
    $LastReadFilterComposer,
    $LastReadOrderingComposer,
    $LastReadProcessedTableManager,
    $LastReadInsertCompanionBuilder,
    $LastReadUpdateCompanionBuilder> {
  $LastReadTableManager(_$AppDatabase db, LastRead table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $LastReadFilterComposer(ComposerState(db, table)),
          orderingComposer: $LastReadOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $LastReadProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> screenId = const Value.absent(),
            Value<String> screenTitle = const Value.absent(),
            Value<int> ayahIndex = const Value.absent(),
            Value<int> ayahNum = const Value.absent(),
          }) =>
              LastReadCompanion(
            id: id,
            screenId: screenId,
            screenTitle: screenTitle,
            ayahIndex: ayahIndex,
            ayahNum: ayahNum,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int screenId,
            required String screenTitle,
            required int ayahIndex,
            required int ayahNum,
          }) =>
              LastReadCompanion.insert(
            id: id,
            screenId: screenId,
            screenTitle: screenTitle,
            ayahIndex: ayahIndex,
            ayahNum: ayahNum,
          ),
        ));
}

class $LastReadProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    LastRead,
    LastReadData,
    $LastReadFilterComposer,
    $LastReadOrderingComposer,
    $LastReadProcessedTableManager,
    $LastReadInsertCompanionBuilder,
    $LastReadUpdateCompanionBuilder> {
  $LastReadProcessedTableManager(super.$state);
}

class $LastReadFilterComposer extends FilterComposer<_$AppDatabase, LastRead> {
  $LastReadFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get screenId => $state.composableBuilder(
      column: $state.table.screenId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get screenTitle => $state.composableBuilder(
      column: $state.table.screenTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahIndex => $state.composableBuilder(
      column: $state.table.ayahIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahNum => $state.composableBuilder(
      column: $state.table.ayahNum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $LastReadOrderingComposer
    extends OrderingComposer<_$AppDatabase, LastRead> {
  $LastReadOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get screenId => $state.composableBuilder(
      column: $state.table.screenId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get screenTitle => $state.composableBuilder(
      column: $state.table.screenTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahIndex => $state.composableBuilder(
      column: $state.table.ayahIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahNum => $state.composableBuilder(
      column: $state.table.ayahNum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $SurahsTableManager get surahs => $SurahsTableManager(_db, _db.surahs);
  $JuzsTableManager get juzs => $JuzsTableManager(_db, _db.juzs);
  $AyahsTableManager get ayahs => $AyahsTableManager(_db, _db.ayahs);
  $LastReadTableManager get lastRead =>
      $LastReadTableManager(_db, _db.lastRead);
}
