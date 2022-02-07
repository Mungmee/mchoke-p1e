import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cactgories_record.g.dart';

abstract class CactgoriesRecord
    implements Built<CactgoriesRecord, CactgoriesRecordBuilder> {
  static Serializer<CactgoriesRecord> get serializer =>
      _$cactgoriesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CactgoriesRecordBuilder builder) => builder
    ..name = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cactgories');

  static Stream<CactgoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CactgoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CactgoriesRecord._();
  factory CactgoriesRecord([void Function(CactgoriesRecordBuilder) updates]) =
      _$CactgoriesRecord;

  static CactgoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCactgoriesRecordData({
  String name,
  String img,
}) =>
    serializers.toFirestore(
        CactgoriesRecord.serializer,
        CactgoriesRecord((c) => c
          ..name = name
          ..img = img));
