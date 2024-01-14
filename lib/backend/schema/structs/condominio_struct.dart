// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CondominioStruct extends FFFirebaseStruct {
  CondominioStruct({
    String? condominioAddress,
    String? condominioName,
    String? condominioPhone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _condominioAddress = condominioAddress,
        _condominioName = condominioName,
        _condominioPhone = condominioPhone,
        super(firestoreUtilData);

  // "condominioAddress" field.
  String? _condominioAddress;
  String get condominioAddress => _condominioAddress ?? '';
  set condominioAddress(String? val) => _condominioAddress = val;
  bool hasCondominioAddress() => _condominioAddress != null;

  // "condominioName" field.
  String? _condominioName;
  String get condominioName => _condominioName ?? '';
  set condominioName(String? val) => _condominioName = val;
  bool hasCondominioName() => _condominioName != null;

  // "condominioPhone" field.
  String? _condominioPhone;
  String get condominioPhone => _condominioPhone ?? '';
  set condominioPhone(String? val) => _condominioPhone = val;
  bool hasCondominioPhone() => _condominioPhone != null;

  static CondominioStruct fromMap(Map<String, dynamic> data) =>
      CondominioStruct(
        condominioAddress: data['condominioAddress'] as String?,
        condominioName: data['condominioName'] as String?,
        condominioPhone: data['condominioPhone'] as String?,
      );

  static CondominioStruct? maybeFromMap(dynamic data) => data is Map
      ? CondominioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'condominioAddress': _condominioAddress,
        'condominioName': _condominioName,
        'condominioPhone': _condominioPhone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'condominioAddress': serializeParam(
          _condominioAddress,
          ParamType.String,
        ),
        'condominioName': serializeParam(
          _condominioName,
          ParamType.String,
        ),
        'condominioPhone': serializeParam(
          _condominioPhone,
          ParamType.String,
        ),
      }.withoutNulls;

  static CondominioStruct fromSerializableMap(Map<String, dynamic> data) =>
      CondominioStruct(
        condominioAddress: deserializeParam(
          data['condominioAddress'],
          ParamType.String,
          false,
        ),
        condominioName: deserializeParam(
          data['condominioName'],
          ParamType.String,
          false,
        ),
        condominioPhone: deserializeParam(
          data['condominioPhone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CondominioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CondominioStruct &&
        condominioAddress == other.condominioAddress &&
        condominioName == other.condominioName &&
        condominioPhone == other.condominioPhone;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([condominioAddress, condominioName, condominioPhone]);
}

CondominioStruct createCondominioStruct({
  String? condominioAddress,
  String? condominioName,
  String? condominioPhone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CondominioStruct(
      condominioAddress: condominioAddress,
      condominioName: condominioName,
      condominioPhone: condominioPhone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CondominioStruct? updateCondominioStruct(
  CondominioStruct? condominio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    condominio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCondominioStructData(
  Map<String, dynamic> firestoreData,
  CondominioStruct? condominio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (condominio == null) {
    return;
  }
  if (condominio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && condominio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final condominioData = getCondominioFirestoreData(condominio, forFieldValue);
  final nestedData = condominioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = condominio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCondominioFirestoreData(
  CondominioStruct? condominio, [
  bool forFieldValue = false,
]) {
  if (condominio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(condominio.toMap());

  // Add any Firestore field values
  condominio.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCondominioListFirestoreData(
  List<CondominioStruct>? condominios,
) =>
    condominios?.map((e) => getCondominioFirestoreData(e, true)).toList() ?? [];
