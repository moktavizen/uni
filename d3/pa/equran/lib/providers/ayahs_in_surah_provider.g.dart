// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayahs_in_surah_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ayahsInSurahHash() => r'43ecbb98125f27b9f93cac68d49a87f8a32d81f9';

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

abstract class _$AyahsInSurah
    extends BuildlessAutoDisposeStreamNotifier<List<Ayah>> {
  late final int surahId;

  Stream<List<Ayah>> build(
    int surahId,
  );
}

/// See also [AyahsInSurah].
@ProviderFor(AyahsInSurah)
const ayahsInSurahProvider = AyahsInSurahFamily();

/// See also [AyahsInSurah].
class AyahsInSurahFamily extends Family<AsyncValue<List<Ayah>>> {
  /// See also [AyahsInSurah].
  const AyahsInSurahFamily();

  /// See also [AyahsInSurah].
  AyahsInSurahProvider call(
    int surahId,
  ) {
    return AyahsInSurahProvider(
      surahId,
    );
  }

  @override
  AyahsInSurahProvider getProviderOverride(
    covariant AyahsInSurahProvider provider,
  ) {
    return call(
      provider.surahId,
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
  String? get name => r'ayahsInSurahProvider';
}

/// See also [AyahsInSurah].
class AyahsInSurahProvider
    extends AutoDisposeStreamNotifierProviderImpl<AyahsInSurah, List<Ayah>> {
  /// See also [AyahsInSurah].
  AyahsInSurahProvider(
    int surahId,
  ) : this._internal(
          () => AyahsInSurah()..surahId = surahId,
          from: ayahsInSurahProvider,
          name: r'ayahsInSurahProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ayahsInSurahHash,
          dependencies: AyahsInSurahFamily._dependencies,
          allTransitiveDependencies:
              AyahsInSurahFamily._allTransitiveDependencies,
          surahId: surahId,
        );

  AyahsInSurahProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.surahId,
  }) : super.internal();

  final int surahId;

  @override
  Stream<List<Ayah>> runNotifierBuild(
    covariant AyahsInSurah notifier,
  ) {
    return notifier.build(
      surahId,
    );
  }

  @override
  Override overrideWith(AyahsInSurah Function() create) {
    return ProviderOverride(
      origin: this,
      override: AyahsInSurahProvider._internal(
        () => create()..surahId = surahId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        surahId: surahId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<AyahsInSurah, List<Ayah>>
      createElement() {
    return _AyahsInSurahProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AyahsInSurahProvider && other.surahId == surahId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, surahId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AyahsInSurahRef on AutoDisposeStreamNotifierProviderRef<List<Ayah>> {
  /// The parameter `surahId` of this provider.
  int get surahId;
}

class _AyahsInSurahProviderElement
    extends AutoDisposeStreamNotifierProviderElement<AyahsInSurah, List<Ayah>>
    with AyahsInSurahRef {
  _AyahsInSurahProviderElement(super.provider);

  @override
  int get surahId => (origin as AyahsInSurahProvider).surahId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
