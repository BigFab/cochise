// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$observationControllerHash() =>
    r'285886efe00f22d9531e1af8e8b1e50845b3a6ef';

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

abstract class _$ObservationController
    extends BuildlessAutoDisposeAsyncNotifier<Observation> {
  late final String observationId;

  FutureOr<Observation> build(
    String observationId,
  );
}

/// See also [ObservationController].
@ProviderFor(ObservationController)
const observationControllerProvider = ObservationControllerFamily();

/// See also [ObservationController].
class ObservationControllerFamily extends Family<AsyncValue<Observation>> {
  /// See also [ObservationController].
  const ObservationControllerFamily();

  /// See also [ObservationController].
  ObservationControllerProvider call(
    String observationId,
  ) {
    return ObservationControllerProvider(
      observationId,
    );
  }

  @override
  ObservationControllerProvider getProviderOverride(
    covariant ObservationControllerProvider provider,
  ) {
    return call(
      provider.observationId,
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
  String? get name => r'observationControllerProvider';
}

/// See also [ObservationController].
class ObservationControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ObservationController,
        Observation> {
  /// See also [ObservationController].
  ObservationControllerProvider(
    String observationId,
  ) : this._internal(
          () => ObservationController()..observationId = observationId,
          from: observationControllerProvider,
          name: r'observationControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$observationControllerHash,
          dependencies: ObservationControllerFamily._dependencies,
          allTransitiveDependencies:
              ObservationControllerFamily._allTransitiveDependencies,
          observationId: observationId,
        );

  ObservationControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.observationId,
  }) : super.internal();

  final String observationId;

  @override
  FutureOr<Observation> runNotifierBuild(
    covariant ObservationController notifier,
  ) {
    return notifier.build(
      observationId,
    );
  }

  @override
  Override overrideWith(ObservationController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ObservationControllerProvider._internal(
        () => create()..observationId = observationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        observationId: observationId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ObservationController, Observation>
      createElement() {
    return _ObservationControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObservationControllerProvider &&
        other.observationId == observationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, observationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ObservationControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Observation> {
  /// The parameter `observationId` of this provider.
  String get observationId;
}

class _ObservationControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ObservationController,
        Observation> with ObservationControllerRef {
  _ObservationControllerProviderElement(super.provider);

  @override
  String get observationId =>
      (origin as ObservationControllerProvider).observationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
