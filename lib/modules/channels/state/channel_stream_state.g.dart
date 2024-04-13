// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_stream_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelStreamStateHash() =>
    r'f7133a39b416c52100f3e7fe945f4a769f3f3a34';

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

abstract class _$ChannelStreamState extends BuildlessNotifier<String?> {
  late final int channelId;

  String? build(
    int channelId,
  );
}

/// See also [ChannelStreamState].
@ProviderFor(ChannelStreamState)
const channelStreamStateProvider = ChannelStreamStateFamily();

/// See also [ChannelStreamState].
class ChannelStreamStateFamily extends Family<String?> {
  /// See also [ChannelStreamState].
  const ChannelStreamStateFamily();

  /// See also [ChannelStreamState].
  ChannelStreamStateProvider call(
    int channelId,
  ) {
    return ChannelStreamStateProvider(
      channelId,
    );
  }

  @override
  ChannelStreamStateProvider getProviderOverride(
    covariant ChannelStreamStateProvider provider,
  ) {
    return call(
      provider.channelId,
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
  String? get name => r'channelStreamStateProvider';
}

/// See also [ChannelStreamState].
class ChannelStreamStateProvider
    extends NotifierProviderImpl<ChannelStreamState, String?> {
  /// See also [ChannelStreamState].
  ChannelStreamStateProvider(
    int channelId,
  ) : this._internal(
          () => ChannelStreamState()..channelId = channelId,
          from: channelStreamStateProvider,
          name: r'channelStreamStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelStreamStateHash,
          dependencies: ChannelStreamStateFamily._dependencies,
          allTransitiveDependencies:
              ChannelStreamStateFamily._allTransitiveDependencies,
          channelId: channelId,
        );

  ChannelStreamStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channelId,
  }) : super.internal();

  final int channelId;

  @override
  String? runNotifierBuild(
    covariant ChannelStreamState notifier,
  ) {
    return notifier.build(
      channelId,
    );
  }

  @override
  Override overrideWith(ChannelStreamState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelStreamStateProvider._internal(
        () => create()..channelId = channelId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channelId: channelId,
      ),
    );
  }

  @override
  NotifierProviderElement<ChannelStreamState, String?> createElement() {
    return _ChannelStreamStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelStreamStateProvider && other.channelId == channelId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channelId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelStreamStateRef on NotifierProviderRef<String?> {
  /// The parameter `channelId` of this provider.
  int get channelId;
}

class _ChannelStreamStateProviderElement
    extends NotifierProviderElement<ChannelStreamState, String?>
    with ChannelStreamStateRef {
  _ChannelStreamStateProviderElement(super.provider);

  @override
  int get channelId => (origin as ChannelStreamStateProvider).channelId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
