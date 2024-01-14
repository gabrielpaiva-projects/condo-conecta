import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CondRecord extends FirestoreRecord {
  CondRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "condominioAddress" field.
  String? _condominioAddress;
  String get condominioAddress => _condominioAddress ?? '';
  bool hasCondominioAddress() => _condominioAddress != null;

  // "condominioPhone" field.
  String? _condominioPhone;
  String get condominioPhone => _condominioPhone ?? '';
  bool hasCondominioPhone() => _condominioPhone != null;

  // "condominioName" field.
  String? _condominioName;
  String get condominioName => _condominioName ?? '';
  bool hasCondominioName() => _condominioName != null;

  void _initializeFields() {
    _condominioAddress = snapshotData['condominioAddress'] as String?;
    _condominioPhone = snapshotData['condominioPhone'] as String?;
    _condominioName = snapshotData['condominioName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cond');

  static Stream<CondRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CondRecord.fromSnapshot(s));

  static Future<CondRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CondRecord.fromSnapshot(s));

  static CondRecord fromSnapshot(DocumentSnapshot snapshot) => CondRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CondRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CondRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CondRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CondRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCondRecordData({
  String? condominioAddress,
  String? condominioPhone,
  String? condominioName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'condominioAddress': condominioAddress,
      'condominioPhone': condominioPhone,
      'condominioName': condominioName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CondRecordDocumentEquality implements Equality<CondRecord> {
  const CondRecordDocumentEquality();

  @override
  bool equals(CondRecord? e1, CondRecord? e2) {
    return e1?.condominioAddress == e2?.condominioAddress &&
        e1?.condominioPhone == e2?.condominioPhone &&
        e1?.condominioName == e2?.condominioName;
  }

  @override
  int hash(CondRecord? e) => const ListEquality()
      .hash([e?.condominioAddress, e?.condominioPhone, e?.condominioName]);

  @override
  bool isValidKey(Object? o) => o is CondRecord;
}
