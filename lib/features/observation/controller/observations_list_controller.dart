import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cochise/common/utils/date_time_formatter.dart';
import 'package:cochise/features/observation/data/observations_repository.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';

part 'observations_list_controller.g.dart';

@riverpod
class ObservationsListController extends _$ObservationsListController {
  Future<List<Observation>> _fetchObservations() async {
    final observationsRepository = ref.read(observationsRepositoryProvider);
    final observations = await observationsRepository.getObservations();
    return observations;
  }

  @override
  FutureOr<List<Observation>> build() async {
    return _fetchObservations();
  }

  Future<void> removeObservation(Observation observation) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final observationsRepository = ref.read(observationsRepositoryProvider);
      await observationsRepository.delete(observation);

      return _fetchObservations();
    });
  }

  Future<void> addObservation({
    required String date,
    required TimeOfDay time,
    required BodyLocation location,
    String? notes
  }) async {
    final now = DateTime.now();
    final obsTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    var dateTime = DateFormat("dd-MM-yyyy").parse(date.toString(), true);
    var dateLocal = dateTime.toLocal();
    final observation = Observation(
      date: TemporalDate(dateLocal),
      time: TemporalTime.fromString(obsTime.format('HH:mm:ss.sss')),
      bodyLocation: location,
      notes: notes
    );
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final observationsRepository = ref.read(observationsRepositoryProvider);
      await observationsRepository.add(observation);
      return _fetchObservations();
    });
  }
}
