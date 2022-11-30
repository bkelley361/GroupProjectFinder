import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'group_record.g.dart';

abstract class GroupRecord implements Built<GroupRecord, GroupRecordBuilder> {
  static Serializer<GroupRecord> get serializer => _$groupRecordSerializer;

  @BuiltValueField(wireName: 'GID')
  String? get gid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(GroupRecordBuilder builder) =>
      builder..gid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Group');

  static Stream<GroupRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GroupRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GroupRecord._();
  factory GroupRecord([void Function(GroupRecordBuilder) updates]) =
      _$GroupRecord;

  static GroupRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGroupRecordData({
  String? gid,
}) {
  final firestoreData = serializers.toFirestore(
    GroupRecord.serializer,
    GroupRecord(
      (g) => g..gid = gid,
    ),
  );

  return firestoreData;
}
