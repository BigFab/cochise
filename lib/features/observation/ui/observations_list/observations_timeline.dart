import 'package:cochise/common/navigation/router/routes.dart';
import 'package:cochise/common/utils/date_time_formatter.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:timelines/timelines.dart';

class ObservationsTimeline extends StatelessWidget {
  const ObservationsTimeline({
    super.key,
    required this.observations,
  });

  final List<Observation> observations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Timeline.tileBuilder(
            builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index) => InkWell(
                onTap: () => context.goNamed(
                  AppRoute.observation.name,
                  pathParameters: {'id': observations[index].id},
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        observations[index]
                            .date
                            .getDateTime()
                            .format('dd-MM-yyyy'),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        observations[index].time!.getDateTime().format('hh:mm a'),
                        style: Theme.of(context).textTheme.bodySmall
                      ),
                      Text(
                        observations[index]
                            .bodyLocation.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: observations.length,
            ),
          ),
        ),
      ],
    );
  }
}
