// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_image_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$channelImageStateHash() => r'ccf76429489d3cac7204e762b7aceabbae800e05';

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

abstract class _$ChannelImageState extends BuildlessAsyncNotifier<Image?> {
  late final Channel channel;

  FutureOr<Image?> build(
    Channel channel,
  );
}

/// See also [ChannelImageState].
@ProviderFor(ChannelImageState)
const channelImageStateProvider = ChannelImageStateFamily();

/// See also [ChannelImageState].
class ChannelImageStateFamily extends Family<AsyncValue<Image?>> {
  /// See also [ChannelImageState].
  const ChannelImageStateFamily();

  /// See also [ChannelImageState].
  ChannelImageStateProvider call(
    Channel channel,
  ) {
    return ChannelImageStateProvider(
      channel,
    );
  }

  @override
  ChannelImageStateProvider getProviderOverride(
    covariant ChannelImageStateProvider provider,
  ) {
    return call(
      provider.channel,
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
  String? get name => r'channelImageStateProvider';
}

/// See also [ChannelImageState].
class ChannelImageStateProvider
    extends AsyncNotifierProviderImpl<ChannelImageState, Image?> {
  /// See also [ChannelImageState].
  ChannelImageStateProvider(
    Channel channel,
  ) : this._internal(
          () => ChannelImageState()..channel = channel,
          from: channelImageStateProvider,
          name: r'channelImageStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$channelImageStateHash,
          dependencies: ChannelImageStateFamily._dependencies,
          allTransitiveDependencies:
              ChannelImageStateFamily._allTransitiveDependencies,
          channel: channel,
        );

  ChannelImageStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.channel,
  }) : super.internal();

  final Channel channel;

  @override
  FutureOr<Image?> runNotifierBuild(
    covariant ChannelImageState notifier,
  ) {
    return notifier.build(
      channel,
    );
  }

  @override
  Override overrideWith(ChannelImageState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChannelImageStateProvider._internal(
        () => create()..channel = channel,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        channel: channel,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<ChannelImageState, Image?> createElement() {
    return _ChannelImageStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChannelImageStateProvider && other.channel == channel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, channel.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChannelImageStateRef on AsyncNotifierProviderRef<Image?> {
  /// The parameter `channel` of this provider.
  Channel get channel;
}

class _ChannelImageStateProviderElement
    extends AsyncNotifierProviderElement<ChannelImageState, Image?>
    with ChannelImageStateRef {
  _ChannelImageStateProviderElement(super.provider);

  @override
  Channel get channel => (origin as ChannelImageStateProvider).channel;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
