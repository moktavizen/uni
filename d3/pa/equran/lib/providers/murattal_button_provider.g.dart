// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'murattal_button_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$murattalButtonHash() => r'dfee079073e5e74bc65e65a0b61cfff293575408';

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

abstract class _$MurattalButton extends BuildlessAutoDisposeNotifier<String> {
  late final int buttonId;

  String build(
    int buttonId,
  );
}

/// See also [MurattalButton].
@ProviderFor(MurattalButton)
const murattalButtonProvider = MurattalButtonFamily();

/// See also [MurattalButton].
class MurattalButtonFamily extends Family<String> {
  /// See also [MurattalButton].
  const MurattalButtonFamily();

  /// See also [MurattalButton].
  MurattalButtonProvider call(
    int buttonId,
  ) {
    return MurattalButtonProvider(
      buttonId,
    );
  }

  @override
  MurattalButtonProvider getProviderOverride(
    covariant MurattalButtonProvider provider,
  ) {
    return call(
      provider.buttonId,
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
  String? get name => r'murattalButtonProvider';
}

/// See also [MurattalButton].
class MurattalButtonProvider
    extends AutoDisposeNotifierProviderImpl<MurattalButton, String> {
  /// See also [MurattalButton].
  MurattalButtonProvider(
    int buttonId,
  ) : this._internal(
          () => MurattalButton()..buttonId = buttonId,
          from: murattalButtonProvider,
          name: r'murattalButtonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$murattalButtonHash,
          dependencies: MurattalButtonFamily._dependencies,
          allTransitiveDependencies:
              MurattalButtonFamily._allTransitiveDependencies,
          buttonId: buttonId,
        );

  MurattalButtonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.buttonId,
  }) : super.internal();

  final int buttonId;

  @override
  String runNotifierBuild(
    covariant MurattalButton notifier,
  ) {
    return notifier.build(
      buttonId,
    );
  }

  @override
  Override overrideWith(MurattalButton Function() create) {
    return ProviderOverride(
      origin: this,
      override: MurattalButtonProvider._internal(
        () => create()..buttonId = buttonId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        buttonId: buttonId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MurattalButton, String> createElement() {
    return _MurattalButtonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MurattalButtonProvider && other.buttonId == buttonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, buttonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MurattalButtonRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `buttonId` of this provider.
  int get buttonId;
}

class _MurattalButtonProviderElement
    extends AutoDisposeNotifierProviderElement<MurattalButton, String>
    with MurattalButtonRef {
  _MurattalButtonProviderElement(super.provider);

  @override
  int get buttonId => (origin as MurattalButtonProvider).buttonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
