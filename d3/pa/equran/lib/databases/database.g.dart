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
  static const VerificationMeta _isFavMeta = const VerificationMeta('isFav');
  late final GeneratedColumn<int> isFav = GeneratedColumn<int>(
      'is_fav', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 0',
      defaultValue: const CustomExpression('0'));
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
        tafsir,
        isFav
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
    if (data.containsKey('is_fav')) {
      context.handle(
          _isFavMeta, isFav.isAcceptableOrUnknown(data['is_fav']!, _isFavMeta));
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
      isFav: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_fav']),
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
  final int? isFav;
  const Ayah(
      {required this.id,
      required this.surahId,
      required this.juzId,
      required this.surahName,
      required this.ayahNum,
      required this.arabic,
      required this.latin,
      required this.translation,
      required this.tafsir,
      this.isFav});
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
    if (!nullToAbsent || isFav != null) {
      map['is_fav'] = Variable<int>(isFav);
    }
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
      isFav:
          isFav == null && nullToAbsent ? const Value.absent() : Value(isFav),
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
      isFav: serializer.fromJson<int?>(json['is_fav']),
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
      'is_fav': serializer.toJson<int?>(isFav),
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
          String? tafsir,
          Value<int?> isFav = const Value.absent()}) =>
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
        isFav: isFav.present ? isFav.value : this.isFav,
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
          ..write('tafsir: $tafsir, ')
          ..write('isFav: $isFav')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, surahId, juzId, surahName, ayahNum,
      arabic, latin, translation, tafsir, isFav);
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
          other.tafsir == this.tafsir &&
          other.isFav == this.isFav);
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
  final Value<int?> isFav;
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
    this.isFav = const Value.absent(),
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
    this.isFav = const Value.absent(),
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
    Expression<int>? isFav,
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
      if (isFav != null) 'is_fav': isFav,
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
      Value<String>? tafsir,
      Value<int?>? isFav}) {
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
      isFav: isFav ?? this.isFav,
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
    if (isFav.present) {
      map['is_fav'] = Variable<int>(isFav.value);
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
          ..write('tafsir: $tafsir, ')
          ..write('isFav: $isFav')
          ..write(')'))
        .toString();
  }
}

class LastReadTable extends Table with TableInfo<LastReadTable, LastRead> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  LastReadTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _screenSubtitleMeta =
      const VerificationMeta('screenSubtitle');
  late final GeneratedColumn<String> screenSubtitle = GeneratedColumn<String>(
      'screen_subtitle', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _screenCaptionMeta =
      const VerificationMeta('screenCaption');
  late final GeneratedColumn<String> screenCaption = GeneratedColumn<String>(
      'screen_caption', aliasedName, false,
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
  static const VerificationMeta _surahNameMeta =
      const VerificationMeta('surahName');
  late final GeneratedColumn<String> surahName = GeneratedColumn<String>(
      'surah_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        screenId,
        screenTitle,
        screenSubtitle,
        screenCaption,
        ayahIndex,
        ayahNum,
        surahName
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'last_read';
  @override
  VerificationContext validateIntegrity(Insertable<LastRead> instance,
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
    if (data.containsKey('screen_subtitle')) {
      context.handle(
          _screenSubtitleMeta,
          screenSubtitle.isAcceptableOrUnknown(
              data['screen_subtitle']!, _screenSubtitleMeta));
    } else if (isInserting) {
      context.missing(_screenSubtitleMeta);
    }
    if (data.containsKey('screen_caption')) {
      context.handle(
          _screenCaptionMeta,
          screenCaption.isAcceptableOrUnknown(
              data['screen_caption']!, _screenCaptionMeta));
    } else if (isInserting) {
      context.missing(_screenCaptionMeta);
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
    if (data.containsKey('surah_name')) {
      context.handle(_surahNameMeta,
          surahName.isAcceptableOrUnknown(data['surah_name']!, _surahNameMeta));
    } else if (isInserting) {
      context.missing(_surahNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LastRead map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LastRead(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      screenId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}screen_id'])!,
      screenTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_title'])!,
      screenSubtitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}screen_subtitle'])!,
      screenCaption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_caption'])!,
      ayahIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_index'])!,
      ayahNum: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_num'])!,
      surahName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name'])!,
    );
  }

  @override
  LastReadTable createAlias(String alias) {
    return LastReadTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LastRead extends DataClass implements Insertable<LastRead> {
  final int id;
  final int screenId;
  final String screenTitle;
  final String screenSubtitle;
  final String screenCaption;
  final int ayahIndex;
  final int ayahNum;
  final String surahName;
  const LastRead(
      {required this.id,
      required this.screenId,
      required this.screenTitle,
      required this.screenSubtitle,
      required this.screenCaption,
      required this.ayahIndex,
      required this.ayahNum,
      required this.surahName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['screen_id'] = Variable<int>(screenId);
    map['screen_title'] = Variable<String>(screenTitle);
    map['screen_subtitle'] = Variable<String>(screenSubtitle);
    map['screen_caption'] = Variable<String>(screenCaption);
    map['ayah_index'] = Variable<int>(ayahIndex);
    map['ayah_num'] = Variable<int>(ayahNum);
    map['surah_name'] = Variable<String>(surahName);
    return map;
  }

  LastReadCompanion toCompanion(bool nullToAbsent) {
    return LastReadCompanion(
      id: Value(id),
      screenId: Value(screenId),
      screenTitle: Value(screenTitle),
      screenSubtitle: Value(screenSubtitle),
      screenCaption: Value(screenCaption),
      ayahIndex: Value(ayahIndex),
      ayahNum: Value(ayahNum),
      surahName: Value(surahName),
    );
  }

  factory LastRead.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LastRead(
      id: serializer.fromJson<int>(json['id']),
      screenId: serializer.fromJson<int>(json['screen_id']),
      screenTitle: serializer.fromJson<String>(json['screen_title']),
      screenSubtitle: serializer.fromJson<String>(json['screen_subtitle']),
      screenCaption: serializer.fromJson<String>(json['screen_caption']),
      ayahIndex: serializer.fromJson<int>(json['ayah_index']),
      ayahNum: serializer.fromJson<int>(json['ayah_num']),
      surahName: serializer.fromJson<String>(json['surah_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'screen_id': serializer.toJson<int>(screenId),
      'screen_title': serializer.toJson<String>(screenTitle),
      'screen_subtitle': serializer.toJson<String>(screenSubtitle),
      'screen_caption': serializer.toJson<String>(screenCaption),
      'ayah_index': serializer.toJson<int>(ayahIndex),
      'ayah_num': serializer.toJson<int>(ayahNum),
      'surah_name': serializer.toJson<String>(surahName),
    };
  }

  LastRead copyWith(
          {int? id,
          int? screenId,
          String? screenTitle,
          String? screenSubtitle,
          String? screenCaption,
          int? ayahIndex,
          int? ayahNum,
          String? surahName}) =>
      LastRead(
        id: id ?? this.id,
        screenId: screenId ?? this.screenId,
        screenTitle: screenTitle ?? this.screenTitle,
        screenSubtitle: screenSubtitle ?? this.screenSubtitle,
        screenCaption: screenCaption ?? this.screenCaption,
        ayahIndex: ayahIndex ?? this.ayahIndex,
        ayahNum: ayahNum ?? this.ayahNum,
        surahName: surahName ?? this.surahName,
      );
  @override
  String toString() {
    return (StringBuffer('LastRead(')
          ..write('id: $id, ')
          ..write('screenId: $screenId, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('screenSubtitle: $screenSubtitle, ')
          ..write('screenCaption: $screenCaption, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('ayahNum: $ayahNum, ')
          ..write('surahName: $surahName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, screenId, screenTitle, screenSubtitle,
      screenCaption, ayahIndex, ayahNum, surahName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LastRead &&
          other.id == this.id &&
          other.screenId == this.screenId &&
          other.screenTitle == this.screenTitle &&
          other.screenSubtitle == this.screenSubtitle &&
          other.screenCaption == this.screenCaption &&
          other.ayahIndex == this.ayahIndex &&
          other.ayahNum == this.ayahNum &&
          other.surahName == this.surahName);
}

class LastReadCompanion extends UpdateCompanion<LastRead> {
  final Value<int> id;
  final Value<int> screenId;
  final Value<String> screenTitle;
  final Value<String> screenSubtitle;
  final Value<String> screenCaption;
  final Value<int> ayahIndex;
  final Value<int> ayahNum;
  final Value<String> surahName;
  const LastReadCompanion({
    this.id = const Value.absent(),
    this.screenId = const Value.absent(),
    this.screenTitle = const Value.absent(),
    this.screenSubtitle = const Value.absent(),
    this.screenCaption = const Value.absent(),
    this.ayahIndex = const Value.absent(),
    this.ayahNum = const Value.absent(),
    this.surahName = const Value.absent(),
  });
  LastReadCompanion.insert({
    this.id = const Value.absent(),
    required int screenId,
    required String screenTitle,
    required String screenSubtitle,
    required String screenCaption,
    required int ayahIndex,
    required int ayahNum,
    required String surahName,
  })  : screenId = Value(screenId),
        screenTitle = Value(screenTitle),
        screenSubtitle = Value(screenSubtitle),
        screenCaption = Value(screenCaption),
        ayahIndex = Value(ayahIndex),
        ayahNum = Value(ayahNum),
        surahName = Value(surahName);
  static Insertable<LastRead> custom({
    Expression<int>? id,
    Expression<int>? screenId,
    Expression<String>? screenTitle,
    Expression<String>? screenSubtitle,
    Expression<String>? screenCaption,
    Expression<int>? ayahIndex,
    Expression<int>? ayahNum,
    Expression<String>? surahName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (screenId != null) 'screen_id': screenId,
      if (screenTitle != null) 'screen_title': screenTitle,
      if (screenSubtitle != null) 'screen_subtitle': screenSubtitle,
      if (screenCaption != null) 'screen_caption': screenCaption,
      if (ayahIndex != null) 'ayah_index': ayahIndex,
      if (ayahNum != null) 'ayah_num': ayahNum,
      if (surahName != null) 'surah_name': surahName,
    });
  }

  LastReadCompanion copyWith(
      {Value<int>? id,
      Value<int>? screenId,
      Value<String>? screenTitle,
      Value<String>? screenSubtitle,
      Value<String>? screenCaption,
      Value<int>? ayahIndex,
      Value<int>? ayahNum,
      Value<String>? surahName}) {
    return LastReadCompanion(
      id: id ?? this.id,
      screenId: screenId ?? this.screenId,
      screenTitle: screenTitle ?? this.screenTitle,
      screenSubtitle: screenSubtitle ?? this.screenSubtitle,
      screenCaption: screenCaption ?? this.screenCaption,
      ayahIndex: ayahIndex ?? this.ayahIndex,
      ayahNum: ayahNum ?? this.ayahNum,
      surahName: surahName ?? this.surahName,
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
    if (screenSubtitle.present) {
      map['screen_subtitle'] = Variable<String>(screenSubtitle.value);
    }
    if (screenCaption.present) {
      map['screen_caption'] = Variable<String>(screenCaption.value);
    }
    if (ayahIndex.present) {
      map['ayah_index'] = Variable<int>(ayahIndex.value);
    }
    if (ayahNum.present) {
      map['ayah_num'] = Variable<int>(ayahNum.value);
    }
    if (surahName.present) {
      map['surah_name'] = Variable<String>(surahName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LastReadCompanion(')
          ..write('id: $id, ')
          ..write('screenId: $screenId, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('screenSubtitle: $screenSubtitle, ')
          ..write('screenCaption: $screenCaption, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('ayahNum: $ayahNum, ')
          ..write('surahName: $surahName')
          ..write(')'))
        .toString();
  }
}

class Favorites extends Table with TableInfo<Favorites, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Favorites(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _surahNameMeta =
      const VerificationMeta('surahName');
  late final GeneratedColumn<String> surahName = GeneratedColumn<String>(
      'surah_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahIdMeta = const VerificationMeta('ayahId');
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
      'ayah_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ayahIndexMeta =
      const VerificationMeta('ayahIndex');
  late final GeneratedColumn<int> ayahIndex = GeneratedColumn<int>(
      'ayah_index', aliasedName, false,
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
  static const VerificationMeta _screenSubtitleMeta =
      const VerificationMeta('screenSubtitle');
  late final GeneratedColumn<String> screenSubtitle = GeneratedColumn<String>(
      'screen_subtitle', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _screenCaptionMeta =
      const VerificationMeta('screenCaption');
  late final GeneratedColumn<String> screenCaption = GeneratedColumn<String>(
      'screen_caption', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        surahId,
        surahName,
        ayahId,
        ayahIndex,
        screenTitle,
        screenSubtitle,
        screenCaption
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
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
    if (data.containsKey('surah_name')) {
      context.handle(_surahNameMeta,
          surahName.isAcceptableOrUnknown(data['surah_name']!, _surahNameMeta));
    } else if (isInserting) {
      context.missing(_surahNameMeta);
    }
    if (data.containsKey('ayah_id')) {
      context.handle(_ayahIdMeta,
          ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta));
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('ayah_index')) {
      context.handle(_ayahIndexMeta,
          ayahIndex.isAcceptableOrUnknown(data['ayah_index']!, _ayahIndexMeta));
    } else if (isInserting) {
      context.missing(_ayahIndexMeta);
    }
    if (data.containsKey('screen_title')) {
      context.handle(
          _screenTitleMeta,
          screenTitle.isAcceptableOrUnknown(
              data['screen_title']!, _screenTitleMeta));
    } else if (isInserting) {
      context.missing(_screenTitleMeta);
    }
    if (data.containsKey('screen_subtitle')) {
      context.handle(
          _screenSubtitleMeta,
          screenSubtitle.isAcceptableOrUnknown(
              data['screen_subtitle']!, _screenSubtitleMeta));
    } else if (isInserting) {
      context.missing(_screenSubtitleMeta);
    }
    if (data.containsKey('screen_caption')) {
      context.handle(
          _screenCaptionMeta,
          screenCaption.isAcceptableOrUnknown(
              data['screen_caption']!, _screenCaptionMeta));
    } else if (isInserting) {
      context.missing(_screenCaptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      surahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_id'])!,
      surahName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name'])!,
      ayahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_id'])!,
      ayahIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_index'])!,
      screenTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_title'])!,
      screenSubtitle: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}screen_subtitle'])!,
      screenCaption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}screen_caption'])!,
    );
  }

  @override
  Favorites createAlias(String alias) {
    return Favorites(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int surahId;
  final String surahName;
  final int ayahId;
  final int ayahIndex;
  final String screenTitle;
  final String screenSubtitle;
  final String screenCaption;
  const Favorite(
      {required this.id,
      required this.surahId,
      required this.surahName,
      required this.ayahId,
      required this.ayahIndex,
      required this.screenTitle,
      required this.screenSubtitle,
      required this.screenCaption});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_id'] = Variable<int>(surahId);
    map['surah_name'] = Variable<String>(surahName);
    map['ayah_id'] = Variable<int>(ayahId);
    map['ayah_index'] = Variable<int>(ayahIndex);
    map['screen_title'] = Variable<String>(screenTitle);
    map['screen_subtitle'] = Variable<String>(screenSubtitle);
    map['screen_caption'] = Variable<String>(screenCaption);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      surahId: Value(surahId),
      surahName: Value(surahName),
      ayahId: Value(ayahId),
      ayahIndex: Value(ayahIndex),
      screenTitle: Value(screenTitle),
      screenSubtitle: Value(screenSubtitle),
      screenCaption: Value(screenCaption),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      surahId: serializer.fromJson<int>(json['surah_id']),
      surahName: serializer.fromJson<String>(json['surah_name']),
      ayahId: serializer.fromJson<int>(json['ayah_id']),
      ayahIndex: serializer.fromJson<int>(json['ayah_index']),
      screenTitle: serializer.fromJson<String>(json['screen_title']),
      screenSubtitle: serializer.fromJson<String>(json['screen_subtitle']),
      screenCaption: serializer.fromJson<String>(json['screen_caption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surah_id': serializer.toJson<int>(surahId),
      'surah_name': serializer.toJson<String>(surahName),
      'ayah_id': serializer.toJson<int>(ayahId),
      'ayah_index': serializer.toJson<int>(ayahIndex),
      'screen_title': serializer.toJson<String>(screenTitle),
      'screen_subtitle': serializer.toJson<String>(screenSubtitle),
      'screen_caption': serializer.toJson<String>(screenCaption),
    };
  }

  Favorite copyWith(
          {int? id,
          int? surahId,
          String? surahName,
          int? ayahId,
          int? ayahIndex,
          String? screenTitle,
          String? screenSubtitle,
          String? screenCaption}) =>
      Favorite(
        id: id ?? this.id,
        surahId: surahId ?? this.surahId,
        surahName: surahName ?? this.surahName,
        ayahId: ayahId ?? this.ayahId,
        ayahIndex: ayahIndex ?? this.ayahIndex,
        screenTitle: screenTitle ?? this.screenTitle,
        screenSubtitle: screenSubtitle ?? this.screenSubtitle,
        screenCaption: screenCaption ?? this.screenCaption,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('surahId: $surahId, ')
          ..write('surahName: $surahName, ')
          ..write('ayahId: $ayahId, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('screenSubtitle: $screenSubtitle, ')
          ..write('screenCaption: $screenCaption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, surahId, surahName, ayahId, ayahIndex,
      screenTitle, screenSubtitle, screenCaption);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.surahId == this.surahId &&
          other.surahName == this.surahName &&
          other.ayahId == this.ayahId &&
          other.ayahIndex == this.ayahIndex &&
          other.screenTitle == this.screenTitle &&
          other.screenSubtitle == this.screenSubtitle &&
          other.screenCaption == this.screenCaption);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> surahId;
  final Value<String> surahName;
  final Value<int> ayahId;
  final Value<int> ayahIndex;
  final Value<String> screenTitle;
  final Value<String> screenSubtitle;
  final Value<String> screenCaption;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.surahId = const Value.absent(),
    this.surahName = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.ayahIndex = const Value.absent(),
    this.screenTitle = const Value.absent(),
    this.screenSubtitle = const Value.absent(),
    this.screenCaption = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int surahId,
    required String surahName,
    required int ayahId,
    required int ayahIndex,
    required String screenTitle,
    required String screenSubtitle,
    required String screenCaption,
  })  : surahId = Value(surahId),
        surahName = Value(surahName),
        ayahId = Value(ayahId),
        ayahIndex = Value(ayahIndex),
        screenTitle = Value(screenTitle),
        screenSubtitle = Value(screenSubtitle),
        screenCaption = Value(screenCaption);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? surahId,
    Expression<String>? surahName,
    Expression<int>? ayahId,
    Expression<int>? ayahIndex,
    Expression<String>? screenTitle,
    Expression<String>? screenSubtitle,
    Expression<String>? screenCaption,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahId != null) 'surah_id': surahId,
      if (surahName != null) 'surah_name': surahName,
      if (ayahId != null) 'ayah_id': ayahId,
      if (ayahIndex != null) 'ayah_index': ayahIndex,
      if (screenTitle != null) 'screen_title': screenTitle,
      if (screenSubtitle != null) 'screen_subtitle': screenSubtitle,
      if (screenCaption != null) 'screen_caption': screenCaption,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? id,
      Value<int>? surahId,
      Value<String>? surahName,
      Value<int>? ayahId,
      Value<int>? ayahIndex,
      Value<String>? screenTitle,
      Value<String>? screenSubtitle,
      Value<String>? screenCaption}) {
    return FavoritesCompanion(
      id: id ?? this.id,
      surahId: surahId ?? this.surahId,
      surahName: surahName ?? this.surahName,
      ayahId: ayahId ?? this.ayahId,
      ayahIndex: ayahIndex ?? this.ayahIndex,
      screenTitle: screenTitle ?? this.screenTitle,
      screenSubtitle: screenSubtitle ?? this.screenSubtitle,
      screenCaption: screenCaption ?? this.screenCaption,
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
    if (surahName.present) {
      map['surah_name'] = Variable<String>(surahName.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (ayahIndex.present) {
      map['ayah_index'] = Variable<int>(ayahIndex.value);
    }
    if (screenTitle.present) {
      map['screen_title'] = Variable<String>(screenTitle.value);
    }
    if (screenSubtitle.present) {
      map['screen_subtitle'] = Variable<String>(screenSubtitle.value);
    }
    if (screenCaption.present) {
      map['screen_caption'] = Variable<String>(screenCaption.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('surahId: $surahId, ')
          ..write('surahName: $surahName, ')
          ..write('ayahId: $ayahId, ')
          ..write('ayahIndex: $ayahIndex, ')
          ..write('screenTitle: $screenTitle, ')
          ..write('screenSubtitle: $screenSubtitle, ')
          ..write('screenCaption: $screenCaption')
          ..write(')'))
        .toString();
  }
}

class SettingTable extends Table with TableInfo<SettingTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  SettingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY');
  static const VerificationMeta _isDarkMeta = const VerificationMeta('isDark');
  late final GeneratedColumn<int> isDark = GeneratedColumn<int>(
      'is_dark', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _arabicFontSizeMeta =
      const VerificationMeta('arabicFontSize');
  late final GeneratedColumn<int> arabicFontSize = GeneratedColumn<int>(
      'arabic_font_size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _latinFontSizeMeta =
      const VerificationMeta('latinFontSize');
  late final GeneratedColumn<int> latinFontSize = GeneratedColumn<int>(
      'latin_font_size', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _autoScrollSpeedMeta =
      const VerificationMeta('autoScrollSpeed');
  late final GeneratedColumn<int> autoScrollSpeed = GeneratedColumn<int>(
      'auto_scroll_speed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isTranslateMeta =
      const VerificationMeta('isTranslate');
  late final GeneratedColumn<int> isTranslate = GeneratedColumn<int>(
      'is_translate', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isBarMeta = const VerificationMeta('isBar');
  late final GeneratedColumn<int> isBar = GeneratedColumn<int>(
      'is_bar', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        isDark,
        arabicFontSize,
        latinFontSize,
        autoScrollSpeed,
        isTranslate,
        isBar
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_dark')) {
      context.handle(_isDarkMeta,
          isDark.isAcceptableOrUnknown(data['is_dark']!, _isDarkMeta));
    } else if (isInserting) {
      context.missing(_isDarkMeta);
    }
    if (data.containsKey('arabic_font_size')) {
      context.handle(
          _arabicFontSizeMeta,
          arabicFontSize.isAcceptableOrUnknown(
              data['arabic_font_size']!, _arabicFontSizeMeta));
    } else if (isInserting) {
      context.missing(_arabicFontSizeMeta);
    }
    if (data.containsKey('latin_font_size')) {
      context.handle(
          _latinFontSizeMeta,
          latinFontSize.isAcceptableOrUnknown(
              data['latin_font_size']!, _latinFontSizeMeta));
    } else if (isInserting) {
      context.missing(_latinFontSizeMeta);
    }
    if (data.containsKey('auto_scroll_speed')) {
      context.handle(
          _autoScrollSpeedMeta,
          autoScrollSpeed.isAcceptableOrUnknown(
              data['auto_scroll_speed']!, _autoScrollSpeedMeta));
    } else if (isInserting) {
      context.missing(_autoScrollSpeedMeta);
    }
    if (data.containsKey('is_translate')) {
      context.handle(
          _isTranslateMeta,
          isTranslate.isAcceptableOrUnknown(
              data['is_translate']!, _isTranslateMeta));
    } else if (isInserting) {
      context.missing(_isTranslateMeta);
    }
    if (data.containsKey('is_bar')) {
      context.handle(
          _isBarMeta, isBar.isAcceptableOrUnknown(data['is_bar']!, _isBarMeta));
    } else if (isInserting) {
      context.missing(_isBarMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isDark: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_dark'])!,
      arabicFontSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}arabic_font_size'])!,
      latinFontSize: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}latin_font_size'])!,
      autoScrollSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auto_scroll_speed'])!,
      isTranslate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_translate'])!,
      isBar: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_bar'])!,
    );
  }

  @override
  SettingTable createAlias(String alias) {
    return SettingTable(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final int isDark;
  final int arabicFontSize;
  final int latinFontSize;
  final int autoScrollSpeed;
  final int isTranslate;
  final int isBar;
  const Setting(
      {required this.id,
      required this.isDark,
      required this.arabicFontSize,
      required this.latinFontSize,
      required this.autoScrollSpeed,
      required this.isTranslate,
      required this.isBar});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_dark'] = Variable<int>(isDark);
    map['arabic_font_size'] = Variable<int>(arabicFontSize);
    map['latin_font_size'] = Variable<int>(latinFontSize);
    map['auto_scroll_speed'] = Variable<int>(autoScrollSpeed);
    map['is_translate'] = Variable<int>(isTranslate);
    map['is_bar'] = Variable<int>(isBar);
    return map;
  }

  SettingCompanion toCompanion(bool nullToAbsent) {
    return SettingCompanion(
      id: Value(id),
      isDark: Value(isDark),
      arabicFontSize: Value(arabicFontSize),
      latinFontSize: Value(latinFontSize),
      autoScrollSpeed: Value(autoScrollSpeed),
      isTranslate: Value(isTranslate),
      isBar: Value(isBar),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      isDark: serializer.fromJson<int>(json['is_dark']),
      arabicFontSize: serializer.fromJson<int>(json['arabic_font_size']),
      latinFontSize: serializer.fromJson<int>(json['latin_font_size']),
      autoScrollSpeed: serializer.fromJson<int>(json['auto_scroll_speed']),
      isTranslate: serializer.fromJson<int>(json['is_translate']),
      isBar: serializer.fromJson<int>(json['is_bar']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'is_dark': serializer.toJson<int>(isDark),
      'arabic_font_size': serializer.toJson<int>(arabicFontSize),
      'latin_font_size': serializer.toJson<int>(latinFontSize),
      'auto_scroll_speed': serializer.toJson<int>(autoScrollSpeed),
      'is_translate': serializer.toJson<int>(isTranslate),
      'is_bar': serializer.toJson<int>(isBar),
    };
  }

  Setting copyWith(
          {int? id,
          int? isDark,
          int? arabicFontSize,
          int? latinFontSize,
          int? autoScrollSpeed,
          int? isTranslate,
          int? isBar}) =>
      Setting(
        id: id ?? this.id,
        isDark: isDark ?? this.isDark,
        arabicFontSize: arabicFontSize ?? this.arabicFontSize,
        latinFontSize: latinFontSize ?? this.latinFontSize,
        autoScrollSpeed: autoScrollSpeed ?? this.autoScrollSpeed,
        isTranslate: isTranslate ?? this.isTranslate,
        isBar: isBar ?? this.isBar,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('isDark: $isDark, ')
          ..write('arabicFontSize: $arabicFontSize, ')
          ..write('latinFontSize: $latinFontSize, ')
          ..write('autoScrollSpeed: $autoScrollSpeed, ')
          ..write('isTranslate: $isTranslate, ')
          ..write('isBar: $isBar')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isDark, arabicFontSize, latinFontSize,
      autoScrollSpeed, isTranslate, isBar);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.isDark == this.isDark &&
          other.arabicFontSize == this.arabicFontSize &&
          other.latinFontSize == this.latinFontSize &&
          other.autoScrollSpeed == this.autoScrollSpeed &&
          other.isTranslate == this.isTranslate &&
          other.isBar == this.isBar);
}

class SettingCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<int> isDark;
  final Value<int> arabicFontSize;
  final Value<int> latinFontSize;
  final Value<int> autoScrollSpeed;
  final Value<int> isTranslate;
  final Value<int> isBar;
  const SettingCompanion({
    this.id = const Value.absent(),
    this.isDark = const Value.absent(),
    this.arabicFontSize = const Value.absent(),
    this.latinFontSize = const Value.absent(),
    this.autoScrollSpeed = const Value.absent(),
    this.isTranslate = const Value.absent(),
    this.isBar = const Value.absent(),
  });
  SettingCompanion.insert({
    this.id = const Value.absent(),
    required int isDark,
    required int arabicFontSize,
    required int latinFontSize,
    required int autoScrollSpeed,
    required int isTranslate,
    required int isBar,
  })  : isDark = Value(isDark),
        arabicFontSize = Value(arabicFontSize),
        latinFontSize = Value(latinFontSize),
        autoScrollSpeed = Value(autoScrollSpeed),
        isTranslate = Value(isTranslate),
        isBar = Value(isBar);
  static Insertable<Setting> custom({
    Expression<int>? id,
    Expression<int>? isDark,
    Expression<int>? arabicFontSize,
    Expression<int>? latinFontSize,
    Expression<int>? autoScrollSpeed,
    Expression<int>? isTranslate,
    Expression<int>? isBar,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isDark != null) 'is_dark': isDark,
      if (arabicFontSize != null) 'arabic_font_size': arabicFontSize,
      if (latinFontSize != null) 'latin_font_size': latinFontSize,
      if (autoScrollSpeed != null) 'auto_scroll_speed': autoScrollSpeed,
      if (isTranslate != null) 'is_translate': isTranslate,
      if (isBar != null) 'is_bar': isBar,
    });
  }

  SettingCompanion copyWith(
      {Value<int>? id,
      Value<int>? isDark,
      Value<int>? arabicFontSize,
      Value<int>? latinFontSize,
      Value<int>? autoScrollSpeed,
      Value<int>? isTranslate,
      Value<int>? isBar}) {
    return SettingCompanion(
      id: id ?? this.id,
      isDark: isDark ?? this.isDark,
      arabicFontSize: arabicFontSize ?? this.arabicFontSize,
      latinFontSize: latinFontSize ?? this.latinFontSize,
      autoScrollSpeed: autoScrollSpeed ?? this.autoScrollSpeed,
      isTranslate: isTranslate ?? this.isTranslate,
      isBar: isBar ?? this.isBar,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isDark.present) {
      map['is_dark'] = Variable<int>(isDark.value);
    }
    if (arabicFontSize.present) {
      map['arabic_font_size'] = Variable<int>(arabicFontSize.value);
    }
    if (latinFontSize.present) {
      map['latin_font_size'] = Variable<int>(latinFontSize.value);
    }
    if (autoScrollSpeed.present) {
      map['auto_scroll_speed'] = Variable<int>(autoScrollSpeed.value);
    }
    if (isTranslate.present) {
      map['is_translate'] = Variable<int>(isTranslate.value);
    }
    if (isBar.present) {
      map['is_bar'] = Variable<int>(isBar.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingCompanion(')
          ..write('id: $id, ')
          ..write('isDark: $isDark, ')
          ..write('arabicFontSize: $arabicFontSize, ')
          ..write('latinFontSize: $latinFontSize, ')
          ..write('autoScrollSpeed: $autoScrollSpeed, ')
          ..write('isTranslate: $isTranslate, ')
          ..write('isBar: $isBar')
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
  late final LastReadTable lastRead = LastReadTable(this);
  late final Favorites favorites = Favorites(this);
  late final SettingTable setting = SettingTable(this);
  late final Index idxAyahsSurahId = Index('idx_ayahs_surah_id',
      'CREATE INDEX IF NOT EXISTS idx_ayahs_surah_id ON ayahs (surah_id)');
  late final Index idxAyahsJuzId = Index('idx_ayahs_juz_id',
      'CREATE INDEX IF NOT EXISTS idx_ayahs_juz_id ON ayahs (juz_id)');
  late final Trigger enforceSingleLastRead = Trigger(
      'CREATE TRIGGER enforce_single_last_read BEFORE INSERT ON last_read BEGIN DELETE FROM last_read;END',
      'enforce_single_last_read');
  late final Trigger enforceSingleSetting = Trigger(
      'CREATE TRIGGER enforce_single_setting BEFORE INSERT ON setting BEGIN DELETE FROM setting;END',
      'enforce_single_setting');
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

  Selectable<Ayah> allAyah() {
    return customSelect('SELECT * FROM ayahs', variables: [], readsFrom: {
      ayahs,
    }).asyncMap(ayahs.mapFromRow);
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

  Selectable<Ayah> singleAyah(int var1) {
    return customSelect('SELECT * FROM ayahs WHERE id = ?1', variables: [
      Variable<int>(var1)
    ], readsFrom: {
      ayahs,
    }).asyncMap(ayahs.mapFromRow);
  }

  Future<int> saveLastRead(
      int screenId,
      String screenTitle,
      String screenSubtitle,
      String screenCaption,
      int ayahIndex,
      int ayahNum,
      String surahName) {
    return customInsert(
      'INSERT INTO last_read (screen_id, screen_title, screen_subtitle, screen_caption, ayah_index, ayah_num, surah_name) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<int>(screenId),
        Variable<String>(screenTitle),
        Variable<String>(screenSubtitle),
        Variable<String>(screenCaption),
        Variable<int>(ayahIndex),
        Variable<int>(ayahNum),
        Variable<String>(surahName)
      ],
      updates: {lastRead},
    );
  }

  Selectable<LastRead> getLastRead() {
    return customSelect('SELECT * FROM last_read', variables: [], readsFrom: {
      lastRead,
    }).asyncMap(lastRead.mapFromRow);
  }

  Future<int> setFavorite(int var1) {
    return customUpdate(
      'UPDATE ayahs SET is_fav = 1 WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {ayahs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> unsetFavorite(int var1) {
    return customUpdate(
      'UPDATE ayahs SET is_fav = 0 WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {ayahs},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> saveFavorite(
      int surahId,
      String surahName,
      int ayahId,
      int ayahIndex,
      String screenTitle,
      String screenSubtitle,
      String screenCaption) {
    return customInsert(
      'INSERT INTO favorites (surah_id, surah_name, ayah_id, ayah_index, screen_title, screen_subtitle, screen_caption) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<int>(surahId),
        Variable<String>(surahName),
        Variable<int>(ayahId),
        Variable<int>(ayahIndex),
        Variable<String>(screenTitle),
        Variable<String>(screenSubtitle),
        Variable<String>(screenCaption)
      ],
      updates: {favorites},
    );
  }

  Future<int> deleteFavorite(int var1) {
    return customUpdate(
      'DELETE FROM favorites WHERE ayah_id = ?1',
      variables: [Variable<int>(var1)],
      updates: {favorites},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Favorite> allFavorite() {
    return customSelect('SELECT * FROM favorites ORDER BY surah_id',
        variables: [],
        readsFrom: {
          favorites,
        }).asyncMap(favorites.mapFromRow);
  }

  Future<int> saveSetting(int isDark, int arabicFontSize, int latinFontSize,
      int autoScrollSpeed, int isTranslate, int isBar) {
    return customInsert(
      'INSERT INTO setting (is_dark, arabic_font_size, latin_font_size, auto_scroll_speed, is_translate, is_bar) VALUES (?1, ?2, ?3, ?4, ?5, ?6)',
      variables: [
        Variable<int>(isDark),
        Variable<int>(arabicFontSize),
        Variable<int>(latinFontSize),
        Variable<int>(autoScrollSpeed),
        Variable<int>(isTranslate),
        Variable<int>(isBar)
      ],
      updates: {setting},
    );
  }

  Selectable<Setting> getSetting() {
    return customSelect('SELECT * FROM setting', variables: [], readsFrom: {
      setting,
    }).asyncMap(setting.mapFromRow);
  }

  Future<int> setLatinFontSize(int var1) {
    return customUpdate(
      'UPDATE setting SET latin_font_size = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setArabicFontSize(int var1) {
    return customUpdate(
      'UPDATE setting SET arabic_font_size = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setTheme(int var1) {
    return customUpdate(
      'UPDATE setting SET is_dark = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setAutoScrollSpeed(int var1) {
    return customUpdate(
      'UPDATE setting SET auto_scroll_speed = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setIsTranslate(int var1) {
    return customUpdate(
      'UPDATE setting SET is_translate = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> setIsBar(int var1) {
    return customUpdate(
      'UPDATE setting SET is_bar = ?1',
      variables: [Variable<int>(var1)],
      updates: {setting},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        surahs,
        juzs,
        ayahs,
        lastRead,
        favorites,
        setting,
        idxAyahsSurahId,
        idxAyahsJuzId,
        enforceSingleLastRead,
        enforceSingleSetting
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('setting',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('setting', kind: UpdateKind.delete),
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
  Value<int?> isFav,
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
  Value<int?> isFav,
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
            Value<int?> isFav = const Value.absent(),
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
            isFav: isFav,
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
            Value<int?> isFav = const Value.absent(),
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
            isFav: isFav,
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

  ColumnFilters<int> get isFav => $state.composableBuilder(
      column: $state.table.isFav,
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

  ColumnOrderings<int> get isFav => $state.composableBuilder(
      column: $state.table.isFav,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $LastReadTableInsertCompanionBuilder = LastReadCompanion Function({
  Value<int> id,
  required int screenId,
  required String screenTitle,
  required String screenSubtitle,
  required String screenCaption,
  required int ayahIndex,
  required int ayahNum,
  required String surahName,
});
typedef $LastReadTableUpdateCompanionBuilder = LastReadCompanion Function({
  Value<int> id,
  Value<int> screenId,
  Value<String> screenTitle,
  Value<String> screenSubtitle,
  Value<String> screenCaption,
  Value<int> ayahIndex,
  Value<int> ayahNum,
  Value<String> surahName,
});

class $LastReadTableTableManager extends RootTableManager<
    _$AppDatabase,
    LastReadTable,
    LastRead,
    $LastReadTableFilterComposer,
    $LastReadTableOrderingComposer,
    $LastReadTableProcessedTableManager,
    $LastReadTableInsertCompanionBuilder,
    $LastReadTableUpdateCompanionBuilder> {
  $LastReadTableTableManager(_$AppDatabase db, LastReadTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $LastReadTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $LastReadTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $LastReadTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> screenId = const Value.absent(),
            Value<String> screenTitle = const Value.absent(),
            Value<String> screenSubtitle = const Value.absent(),
            Value<String> screenCaption = const Value.absent(),
            Value<int> ayahIndex = const Value.absent(),
            Value<int> ayahNum = const Value.absent(),
            Value<String> surahName = const Value.absent(),
          }) =>
              LastReadCompanion(
            id: id,
            screenId: screenId,
            screenTitle: screenTitle,
            screenSubtitle: screenSubtitle,
            screenCaption: screenCaption,
            ayahIndex: ayahIndex,
            ayahNum: ayahNum,
            surahName: surahName,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int screenId,
            required String screenTitle,
            required String screenSubtitle,
            required String screenCaption,
            required int ayahIndex,
            required int ayahNum,
            required String surahName,
          }) =>
              LastReadCompanion.insert(
            id: id,
            screenId: screenId,
            screenTitle: screenTitle,
            screenSubtitle: screenSubtitle,
            screenCaption: screenCaption,
            ayahIndex: ayahIndex,
            ayahNum: ayahNum,
            surahName: surahName,
          ),
        ));
}

class $LastReadTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    LastReadTable,
    LastRead,
    $LastReadTableFilterComposer,
    $LastReadTableOrderingComposer,
    $LastReadTableProcessedTableManager,
    $LastReadTableInsertCompanionBuilder,
    $LastReadTableUpdateCompanionBuilder> {
  $LastReadTableProcessedTableManager(super.$state);
}

class $LastReadTableFilterComposer
    extends FilterComposer<_$AppDatabase, LastReadTable> {
  $LastReadTableFilterComposer(super.$state);
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

  ColumnFilters<String> get screenSubtitle => $state.composableBuilder(
      column: $state.table.screenSubtitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get screenCaption => $state.composableBuilder(
      column: $state.table.screenCaption,
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

  ColumnFilters<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $LastReadTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, LastReadTable> {
  $LastReadTableOrderingComposer(super.$state);
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

  ColumnOrderings<String> get screenSubtitle => $state.composableBuilder(
      column: $state.table.screenSubtitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get screenCaption => $state.composableBuilder(
      column: $state.table.screenCaption,
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

  ColumnOrderings<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $FavoritesInsertCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  required int surahId,
  required String surahName,
  required int ayahId,
  required int ayahIndex,
  required String screenTitle,
  required String screenSubtitle,
  required String screenCaption,
});
typedef $FavoritesUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<int> id,
  Value<int> surahId,
  Value<String> surahName,
  Value<int> ayahId,
  Value<int> ayahIndex,
  Value<String> screenTitle,
  Value<String> screenSubtitle,
  Value<String> screenCaption,
});

class $FavoritesTableManager extends RootTableManager<
    _$AppDatabase,
    Favorites,
    Favorite,
    $FavoritesFilterComposer,
    $FavoritesOrderingComposer,
    $FavoritesProcessedTableManager,
    $FavoritesInsertCompanionBuilder,
    $FavoritesUpdateCompanionBuilder> {
  $FavoritesTableManager(_$AppDatabase db, Favorites table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $FavoritesFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $FavoritesOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $FavoritesProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> surahId = const Value.absent(),
            Value<String> surahName = const Value.absent(),
            Value<int> ayahId = const Value.absent(),
            Value<int> ayahIndex = const Value.absent(),
            Value<String> screenTitle = const Value.absent(),
            Value<String> screenSubtitle = const Value.absent(),
            Value<String> screenCaption = const Value.absent(),
          }) =>
              FavoritesCompanion(
            id: id,
            surahId: surahId,
            surahName: surahName,
            ayahId: ayahId,
            ayahIndex: ayahIndex,
            screenTitle: screenTitle,
            screenSubtitle: screenSubtitle,
            screenCaption: screenCaption,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int surahId,
            required String surahName,
            required int ayahId,
            required int ayahIndex,
            required String screenTitle,
            required String screenSubtitle,
            required String screenCaption,
          }) =>
              FavoritesCompanion.insert(
            id: id,
            surahId: surahId,
            surahName: surahName,
            ayahId: ayahId,
            ayahIndex: ayahIndex,
            screenTitle: screenTitle,
            screenSubtitle: screenSubtitle,
            screenCaption: screenCaption,
          ),
        ));
}

class $FavoritesProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Favorites,
    Favorite,
    $FavoritesFilterComposer,
    $FavoritesOrderingComposer,
    $FavoritesProcessedTableManager,
    $FavoritesInsertCompanionBuilder,
    $FavoritesUpdateCompanionBuilder> {
  $FavoritesProcessedTableManager(super.$state);
}

class $FavoritesFilterComposer
    extends FilterComposer<_$AppDatabase, Favorites> {
  $FavoritesFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get surahId => $state.composableBuilder(
      column: $state.table.surahId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahId => $state.composableBuilder(
      column: $state.table.ayahId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ayahIndex => $state.composableBuilder(
      column: $state.table.ayahIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get screenTitle => $state.composableBuilder(
      column: $state.table.screenTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get screenSubtitle => $state.composableBuilder(
      column: $state.table.screenSubtitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get screenCaption => $state.composableBuilder(
      column: $state.table.screenCaption,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $FavoritesOrderingComposer
    extends OrderingComposer<_$AppDatabase, Favorites> {
  $FavoritesOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get surahId => $state.composableBuilder(
      column: $state.table.surahId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get surahName => $state.composableBuilder(
      column: $state.table.surahName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahId => $state.composableBuilder(
      column: $state.table.ayahId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ayahIndex => $state.composableBuilder(
      column: $state.table.ayahIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get screenTitle => $state.composableBuilder(
      column: $state.table.screenTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get screenSubtitle => $state.composableBuilder(
      column: $state.table.screenSubtitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get screenCaption => $state.composableBuilder(
      column: $state.table.screenCaption,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $SettingTableInsertCompanionBuilder = SettingCompanion Function({
  Value<int> id,
  required int isDark,
  required int arabicFontSize,
  required int latinFontSize,
  required int autoScrollSpeed,
  required int isTranslate,
  required int isBar,
});
typedef $SettingTableUpdateCompanionBuilder = SettingCompanion Function({
  Value<int> id,
  Value<int> isDark,
  Value<int> arabicFontSize,
  Value<int> latinFontSize,
  Value<int> autoScrollSpeed,
  Value<int> isTranslate,
  Value<int> isBar,
});

class $SettingTableTableManager extends RootTableManager<
    _$AppDatabase,
    SettingTable,
    Setting,
    $SettingTableFilterComposer,
    $SettingTableOrderingComposer,
    $SettingTableProcessedTableManager,
    $SettingTableInsertCompanionBuilder,
    $SettingTableUpdateCompanionBuilder> {
  $SettingTableTableManager(_$AppDatabase db, SettingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $SettingTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $SettingTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $SettingTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> isDark = const Value.absent(),
            Value<int> arabicFontSize = const Value.absent(),
            Value<int> latinFontSize = const Value.absent(),
            Value<int> autoScrollSpeed = const Value.absent(),
            Value<int> isTranslate = const Value.absent(),
            Value<int> isBar = const Value.absent(),
          }) =>
              SettingCompanion(
            id: id,
            isDark: isDark,
            arabicFontSize: arabicFontSize,
            latinFontSize: latinFontSize,
            autoScrollSpeed: autoScrollSpeed,
            isTranslate: isTranslate,
            isBar: isBar,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int isDark,
            required int arabicFontSize,
            required int latinFontSize,
            required int autoScrollSpeed,
            required int isTranslate,
            required int isBar,
          }) =>
              SettingCompanion.insert(
            id: id,
            isDark: isDark,
            arabicFontSize: arabicFontSize,
            latinFontSize: latinFontSize,
            autoScrollSpeed: autoScrollSpeed,
            isTranslate: isTranslate,
            isBar: isBar,
          ),
        ));
}

class $SettingTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    SettingTable,
    Setting,
    $SettingTableFilterComposer,
    $SettingTableOrderingComposer,
    $SettingTableProcessedTableManager,
    $SettingTableInsertCompanionBuilder,
    $SettingTableUpdateCompanionBuilder> {
  $SettingTableProcessedTableManager(super.$state);
}

class $SettingTableFilterComposer
    extends FilterComposer<_$AppDatabase, SettingTable> {
  $SettingTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isDark => $state.composableBuilder(
      column: $state.table.isDark,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get arabicFontSize => $state.composableBuilder(
      column: $state.table.arabicFontSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get latinFontSize => $state.composableBuilder(
      column: $state.table.latinFontSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get autoScrollSpeed => $state.composableBuilder(
      column: $state.table.autoScrollSpeed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isTranslate => $state.composableBuilder(
      column: $state.table.isTranslate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isBar => $state.composableBuilder(
      column: $state.table.isBar,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $SettingTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, SettingTable> {
  $SettingTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isDark => $state.composableBuilder(
      column: $state.table.isDark,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get arabicFontSize => $state.composableBuilder(
      column: $state.table.arabicFontSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get latinFontSize => $state.composableBuilder(
      column: $state.table.latinFontSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get autoScrollSpeed => $state.composableBuilder(
      column: $state.table.autoScrollSpeed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isTranslate => $state.composableBuilder(
      column: $state.table.isTranslate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isBar => $state.composableBuilder(
      column: $state.table.isBar,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $SurahsTableManager get surahs => $SurahsTableManager(_db, _db.surahs);
  $JuzsTableManager get juzs => $JuzsTableManager(_db, _db.juzs);
  $AyahsTableManager get ayahs => $AyahsTableManager(_db, _db.ayahs);
  $LastReadTableTableManager get lastRead =>
      $LastReadTableTableManager(_db, _db.lastRead);
  $FavoritesTableManager get favorites =>
      $FavoritesTableManager(_db, _db.favorites);
  $SettingTableTableManager get setting =>
      $SettingTableTableManager(_db, _db.setting);
}
