// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayahs_in_juz_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ayahsInJuzHash() => r'f2c2602d83d64b6d1c04878cb3b345e5949f3501';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AyahsInJuz
    extends BuildlessAutoDisposeAsyncNotifier<List<Ayah>> {
  late final int juzId;

  FutureOr<List<Ayah>> build(
    int juzId,
  );
}

/// See also [AyahsInJuz].
@ProviderFor(AyahsInJuz)
const ayahsInJuzProvider = AyahsInJuzFamily();

/// See also [AyahsInJuz].
class AyahsInJuzFamily extends Family<AsyncValue<List<Ayah>>> {
  /// See also [AyahsInJuz].
  const AyahsInJuzFamily();

  /// See also [AyahsInJuz].
  AyahsInJuzProvider call(
    int juzId,
  ) {
    return AyahsInJuzProvider(
      juzId,
    );
  }

  @override
  AyahsInJuzProvider getProviderOverride(
    covariant AyahsInJuzProvider provider,
  ) {
    return call(
      provider.juzId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ayahsInJuzProvider';
}

/// See also [AyahsInJuz].
class AyahsInJuzProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AyahsInJuz, List<Ayah>> {
  /// See also [AyahsInJuz].
  AyahsInJuzProvider(
    int juzId,
  ) : this._internal(
          () => AyahsInJuz()..juzId = juzId,
          from: ayahsInJuzProvider,
          name: r'ayahsInJuzProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ayahsInJuzHash,
          dependencies: AyahsInJuzFamily._dependencies,
          allTransitiveDependencies:
              AyahsInJuzFamily._allTransitiveDependencies,
          juzId: juzId,
        );

  AyahsInJuzProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.juzId,
  }) : super.internal();

  final int juzId;

  @override
  FutureOr<List<Ayah>> runNotifierBuild(
    covariant AyahsInJuz notifier,
  ) {
    return notifier.build(
      juzId,
    );
  }

  @override
  Override overrideWith(AyahsInJuz Function() create) {
    return ProviderOverride(
      origin: this,
      override: AyahsInJuzProvider._internal(
        () => create()..juzId = juzId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        juzId: juzId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AyahsInJuz, List<Ayah>>
      createElement() {
    return _AyahsInJuzProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AyahsInJuzProvider && other.juzId == juzId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, juzId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AyahsInJuzRef on AutoDisposeAsyncNotifierProviderRef<List<Ayah>> {
  /// The parameter `juzId` of this provider.
  int get juzId;
}

class _AyahsInJuzProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AyahsInJuz, List<Ayah>>
    with AyahsInJuzRef {
  _AyahsInJuzProviderElement(super.provider);

  @override
  int get juzId => (origin as AyahsInJuzProvider).juzId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
