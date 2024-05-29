// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_button_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerButtonHash() => r'1b79521daabc1d01ccea1968e948fbffe9ce1544';

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

abstract class _$PlayerButton extends BuildlessAutoDisposeNotifier<String> {
  late final int buttonId;

  String build(
    int buttonId,
  );
}

/// See also [PlayerButton].
@ProviderFor(PlayerButton)
const playerButtonProvider = PlayerButtonFamily();

/// See also [PlayerButton].
class PlayerButtonFamily extends Family<String> {
  /// See also [PlayerButton].
  const PlayerButtonFamily();

  /// See also [PlayerButton].
  PlayerButtonProvider call(
    int buttonId,
  ) {
    return PlayerButtonProvider(
      buttonId,
    );
  }

  @override
  PlayerButtonProvider getProviderOverride(
    covariant PlayerButtonProvider provider,
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
  String? get name => r'playerButtonProvider';
}

/// See also [PlayerButton].
class PlayerButtonProvider
    extends AutoDisposeNotifierProviderImpl<PlayerButton, String> {
  /// See also [PlayerButton].
  PlayerButtonProvider(
    int buttonId,
  ) : this._internal(
          () => PlayerButton()..buttonId = buttonId,
          from: playerButtonProvider,
          name: r'playerButtonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerButtonHash,
          dependencies: PlayerButtonFamily._dependencies,
          allTransitiveDependencies:
              PlayerButtonFamily._allTransitiveDependencies,
          buttonId: buttonId,
        );

  PlayerButtonProvider._internal(
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
    covariant PlayerButton notifier,
  ) {
    return notifier.build(
      buttonId,
    );
  }

  @override
  Override overrideWith(PlayerButton Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlayerButtonProvider._internal(
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
  AutoDisposeNotifierProviderElement<PlayerButton, String> createElement() {
    return _PlayerButtonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerButtonProvider && other.buttonId == buttonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, buttonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayerButtonRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `buttonId` of this provider.
  int get buttonId;
}

class _PlayerButtonProviderElement
    extends AutoDisposeNotifierProviderElement<PlayerButton, String>
    with PlayerButtonRef {
  _PlayerButtonProviderElement(super.provider);

  @override
  int get buttonId => (origin as PlayerButtonProvider).buttonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
