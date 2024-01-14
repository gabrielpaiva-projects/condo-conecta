import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class CondominioUsersRecord extends FirestoreRecord {
  CondominioUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "userType" field.
  UserType? _userType;
  UserType? get userType => _userType;
  bool hasUserType() => _userType != null;

  // "userCondominio" field.
  String? _userCondominio;
  String get userCondominio => _userCondominio ?? '';
  bool hasUserCondominio() => _userCondominio != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _userEmail = snapshotData['userEmail'] as String?;
    _userType = deserializeEnum<UserType>(snapshotData['userType']);
    _userCondominio = snapshotData['userCondominio'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('condominioUsers');

  static Stream<CondominioUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CondominioUsersRecord.fromSnapshot(s));

  static Future<CondominioUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CondominioUsersRecord.fromSnapshot(s));

  static CondominioUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CondominioUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CondominioUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CondominioUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CondominioUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CondominioUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCondominioUsersRecordData({
  String? userName,
  String? userEmail,
  UserType? userType,
  String? userCondominio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'userEmail': userEmail,
      'userType': userType,
      'userCondominio': userCondominio,
    }.withoutNulls,
  );

  return firestoreData;
}

class CondominioUsersRecordDocumentEquality
    implements Equality<CondominioUsersRecord> {
  const CondominioUsersRecordDocumentEquality();

  @override
  bool equals(CondominioUsersRecord? e1, CondominioUsersRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userType == e2?.userType &&
        e1?.userCondominio == e2?.userCondominio;
  }

  @override
  int hash(CondominioUsersRecord? e) => const ListEquality()
      .hash([e?.userName, e?.userEmail, e?.userType, e?.userCondominio]);

  @override
  bool isValidKey(Object? o) => o is CondominioUsersRecord;
}
