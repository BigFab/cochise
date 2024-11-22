import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:cochise/common/navigation/router/routes.dart';
import 'package:cochise/common/ui/bottomsheet_text_form_field.dart';
import 'package:cochise/common/utils/colors.dart' as constants;
import 'package:cochise/common/utils/date_time_formatter.dart';
import 'package:cochise/features/observation/controller/observation_controller.dart';
import 'package:cochise/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditObservationPage extends ConsumerStatefulWidget {
  const EditObservationPage({
    required this.observation,
    super.key,
  });

  final Observation observation;

  @override
  EditObservationPageState createState() => EditObservationPageState();
}

class EditObservationPageState extends ConsumerState<EditObservationPage> {
  @override
  void initState() {
    dateController.text = widget.observation.date.getDateTime().format('dd-MM-yyyy');
    observationTime = TimeOfDay.fromDateTime(widget.observation.time!.getDateTime());
    observationTimeController.text = widget.observation.time!.getDateTime().format('hh:mm a');
    bodyLocationController.text = widget.observation.bodyLocation.name;
    bodyLocation = widget.observation.bodyLocation;
    notesController.text = widget.observation.notes!;

    super.initState();
  }

  final formGlobalKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final bodyLocationController = TextEditingController();
  var bodyLocation = BodyLocation.Estomac;
  final notesController = TextEditingController();
  var observationTime = TimeOfDay.now();
  final observationTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cochise',
        ),
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRoute.observation.name,
              pathParameters: {'id': widget.observation.id},
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15,
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomSheetTextFormField(
                  labelText: 'Date',
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      dateController.text =
                          pickedDate.format('dd-MM-yyyy');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BottomSheetTextFormField(
                  labelText: 'Heure du ressenti',
                  controller: observationTimeController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    await showTimePicker(
                      context: context,
                      initialTime: observationTime,
                      initialEntryMode: TimePickerEntryMode.dial,
                    ).then((timeOfDay) {
                      if (timeOfDay != null) {
                        final localizations = MaterialLocalizations.of(context);
                        final formattedTimeOfDay =
                            localizations.formatTimeOfDay(timeOfDay);

                        observationTimeController.text = formattedTimeOfDay;
                        observationTime = timeOfDay;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<BodyLocation>(
                  onChanged: (value) {
                    bodyLocationController.text = value!.name;
                    bodyLocation = value;
                  },
                  value: bodyLocation,
                  decoration: const InputDecoration(
                    labelText: 'Partie du corps',
                  ),
                  items: [
                    for (var category in BodyLocation.values)
                      DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BottomSheetTextFormField(
                  labelText: 'Notes',
                  controller: notesController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 20,
                ),


                TextButton(
                  child: const Text('OK'),
                  onPressed: () async {
                    final currentState = formGlobalKey.currentState;
                    if (currentState == null) {
                      return;
                    }
                    if (currentState.validate()) {

                      var dateTime = DateFormat("dd-MM-yyyy").parse(dateController.text, true);
                      var dateLocal = dateTime.toLocal();

                      final format = DateFormat.jm();
                      observationTime = TimeOfDay.fromDateTime(
                        format.parse(observationTimeController.text),
                      );

                      final now = DateTime.now();
                      final obsTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        observationTime.hour,
                        observationTime.minute,
                      );

                      final updatedObservation = widget.observation.copyWith(
                        date: TemporalDate(dateLocal),
                        time: TemporalTime.fromString(
                          obsTime.format('HH:mm:ss.sss'),
                        ),
                        notes: notesController.text,
                        bodyLocation: BodyLocation.values
                            .byName(bodyLocationController.text),
                      );

                      await ref
                          .watch(
                              observationControllerProvider(widget.observation.id).notifier)
                          .updateObservation(updatedObservation);
                      if (context.mounted) {
                        context.goNamed(
                          AppRoute.observation.name,
                          pathParameters: {'id': widget.observation.id},
                          extra: updatedObservation,
                        );
                      }
                    }
                  }, //,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
