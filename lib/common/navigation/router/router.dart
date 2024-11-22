import 'package:cochise/common/navigation/router/routes.dart';
import 'package:cochise/features/observation/ui/observations_list/observations_list_page.dart';
import 'package:cochise/features/observation/ui/observation_page/observation_page.dart';
import 'package:cochise/features/observation/ui/edit_observation_page/edit_observation_page.dart';
import 'package:cochise/features/profile/ui/profile_page/profile_page.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const ObservationsListPage(),
    ),
    GoRoute(
      path: '/observation/:id',
      name: AppRoute.observation.name,
      builder: (context, state) {
        final observationId = state.pathParameters['id']!;
        return ObservationPage(observationId: observationId);
      },
    ),
    GoRoute(
      path: '/editobservation/:id',
      name: AppRoute.editObservation.name,
      builder: (context, state) {
        return EditObservationPage(
          observation: state.extra! as Observation,
        );
      },
    ),
    GoRoute(
      path: '/profile',
      name: AppRoute.profile.name,
      builder: (context, state) => const ProfilePage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);