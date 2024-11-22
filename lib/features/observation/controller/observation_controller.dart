import 'dart:async';
import 'dart:io';
import 'package:cochise/features/observation/data/observations_repository.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'observation_controller.g.dart';

@riverpod
class ObservationController extends _$ObservationController {
  Future<Observation> _fetchObservation(String observationId) async {
    final observationsRepository = ref.read(observationsRepositoryProvider);
    return observationsRepository.getObservation(observationId);
  }

  @override
  FutureOr<Observation> build(String observationId) async {
    return _fetchObservation(observationId);
  }

  Future<void> updateObservation(Observation observation) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final observationsRepository = ref.read(observationsRepositoryProvider);
      await observationsRepository.update(observation);
      return _fetchObservation(observation.id);
    });
  }
}
