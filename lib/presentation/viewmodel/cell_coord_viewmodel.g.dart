// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_coord_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cellCoordViewModelHash() =>
    r'e30ceae1b7a260c5188e086491d32ff2452cb622';

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

abstract class _$CellCoordViewModel
    extends BuildlessAutoDisposeNotifier<State<CellCoord?>> {
  late final ConfigType configType;

  State<CellCoord?> build(
    ConfigType configType,
  );
}

/// See also [CellCoordViewModel].
@ProviderFor(CellCoordViewModel)
const cellCoordViewModelProvider = CellCoordViewModelFamily();

/// See also [CellCoordViewModel].
class CellCoordViewModelFamily extends Family<State<CellCoord?>> {
  /// See also [CellCoordViewModel].
  const CellCoordViewModelFamily();

  /// See also [CellCoordViewModel].
  CellCoordViewModelProvider call(
    ConfigType configType,
  ) {
    return CellCoordViewModelProvider(
      configType,
    );
  }

  @override
  CellCoordViewModelProvider getProviderOverride(
    covariant CellCoordViewModelProvider provider,
  ) {
    return call(
      provider.configType,
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
  String? get name => r'cellCoordViewModelProvider';
}

/// See also [CellCoordViewModel].
class CellCoordViewModelProvider extends AutoDisposeNotifierProviderImpl<
    CellCoordViewModel, State<CellCoord?>> {
  /// See also [CellCoordViewModel].
  CellCoordViewModelProvider(
    this.configType,
  ) : super.internal(
          () => CellCoordViewModel()..configType = configType,
          from: cellCoordViewModelProvider,
          name: r'cellCoordViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cellCoordViewModelHash,
          dependencies: CellCoordViewModelFamily._dependencies,
          allTransitiveDependencies:
              CellCoordViewModelFamily._allTransitiveDependencies,
        );

  final ConfigType configType;

  @override
  bool operator ==(Object other) {
    return other is CellCoordViewModelProvider &&
        other.configType == configType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, configType.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  State<CellCoord?> runNotifierBuild(
    covariant CellCoordViewModel notifier,
  ) {
    return notifier.build(
      configType,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
