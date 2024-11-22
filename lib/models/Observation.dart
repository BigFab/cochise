/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Observation type in your schema. */
class Observation extends amplify_core.Model {
  static const classType = const _ObservationModelType();
  final String id;
  final amplify_core.TemporalDate? _date;
  final amplify_core.TemporalTime? _time;
  final BodyLocation? _bodyLocation;
  final String? _notes;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ObservationModelIdentifier get modelIdentifier {
      return ObservationModelIdentifier(
        id: id
      );
  }
  
  amplify_core.TemporalDate get date {
    try {
      return _date!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTime get time {
    try {
      return _time!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  BodyLocation get bodyLocation {
    try {
      return _bodyLocation!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get notes {
    return _notes;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Observation._internal({required this.id, required date, required time, required bodyLocation, notes, createdAt, updatedAt}): _date = date, _time = time, _bodyLocation = bodyLocation, _notes = notes, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Observation({String? id, required amplify_core.TemporalDate date, required amplify_core.TemporalTime time, required BodyLocation bodyLocation, String? notes}) {
    return Observation._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      date: date,
      time: time,
      bodyLocation: bodyLocation,
      notes: notes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Observation &&
      id == other.id &&
      _date == other._date &&
      _time == other._time &&
      _bodyLocation == other._bodyLocation &&
      _notes == other._notes;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Observation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("time=" + (_time != null ? _time!.format() : "null") + ", ");
    buffer.write("bodyLocation=" + (_bodyLocation != null ? amplify_core.enumToString(_bodyLocation)! : "null") + ", ");
    buffer.write("notes=" + "$_notes" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Observation copyWith({amplify_core.TemporalDate? date, amplify_core.TemporalTime? time, BodyLocation? bodyLocation, String? notes}) {
    return Observation._internal(
      id: id,
      date: date ?? this.date,
      time: time ?? this.time,
      bodyLocation: bodyLocation ?? this.bodyLocation,
      notes: notes ?? this.notes);
  }
  
  Observation copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalDate>? date,
    ModelFieldValue<amplify_core.TemporalTime>? time,
    ModelFieldValue<BodyLocation>? bodyLocation,
    ModelFieldValue<String?>? notes
  }) {
    return Observation._internal(
      id: id,
      date: date == null ? this.date : date.value,
      time: time == null ? this.time : time.value,
      bodyLocation: bodyLocation == null ? this.bodyLocation : bodyLocation.value,
      notes: notes == null ? this.notes : notes.value
    );
  }
  
  Observation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _date = json['date'] != null ? amplify_core.TemporalDate.fromString(json['date']) : null,
      _time = json['time'] != null ? amplify_core.TemporalTime.fromString(json['time']) : null,
      _bodyLocation = amplify_core.enumFromString<BodyLocation>(json['bodyLocation'], BodyLocation.values),
      _notes = json['notes'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'date': _date?.format(), 'time': _time?.format(), 'bodyLocation': amplify_core.enumToString(_bodyLocation), 'notes': _notes, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'date': _date,
    'time': _time,
    'bodyLocation': _bodyLocation,
    'notes': _notes,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ObservationModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ObservationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TIME = amplify_core.QueryField(fieldName: "time");
  static final BODYLOCATION = amplify_core.QueryField(fieldName: "bodyLocation");
  static final NOTES = amplify_core.QueryField(fieldName: "notes");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Observation";
    modelSchemaDefinition.pluralName = "Observations";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Observation.DATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Observation.TIME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Observation.BODYLOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Observation.NOTES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ObservationModelType extends amplify_core.ModelType<Observation> {
  const _ObservationModelType();
  
  @override
  Observation fromJson(Map<String, dynamic> jsonData) {
    return Observation.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Observation';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Observation] in your schema.
 */
class ObservationModelIdentifier implements amplify_core.ModelIdentifier<Observation> {
  final String id;

  /** Create an instance of ObservationModelIdentifier using [id] the primary key. */
  const ObservationModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ObservationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ObservationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}