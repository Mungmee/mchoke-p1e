import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'schedules_record.g.dart';

abstract class SchedulesRecord
    implements Built<SchedulesRecord, SchedulesRecordBuilder> {
  static Serializer<SchedulesRecord> get serializer =>
      _$schedulesRecordSerializer;

  @nullable
  String get time;

  @nullable
  @BuiltValueField(wireName: 'scheduled_for')
  DocumentReference get scheduledFor;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SchedulesRecordBuilder builder) =>
      builder..time = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schedules');

  static Stream<SchedulesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SchedulesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SchedulesRecord._();
  factory SchedulesRecord([void Function(SchedulesRecordBuilder) updates]) =
      _$SchedulesRecord;

  static SchedulesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSchedulesRecordData({
  String time,
  DocumentReference scheduledFor,
}) =>
    serializers.toFirestore(
        SchedulesRecord.serializer,
        SchedulesRecord((s) => s
          ..time = time
          ..scheduledFor = scheduledFor));
