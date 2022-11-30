// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupRecord> _$groupRecordSerializer = new _$GroupRecordSerializer();

class _$GroupRecordSerializer implements StructuredSerializer<GroupRecord> {
  @override
  final Iterable<Type> types = const [GroupRecord, _$GroupRecord];
  @override
  final String wireName = 'GroupRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.gid;
    if (value != null) {
      result
        ..add('GID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  GroupRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'GID':
          result.gid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$GroupRecord extends GroupRecord {
  @override
  final String? gid;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GroupRecord([void Function(GroupRecordBuilder)? updates]) =>
      (new GroupRecordBuilder()..update(updates))._build();

  _$GroupRecord._({this.gid, this.ffRef}) : super._();

  @override
  GroupRecord rebuild(void Function(GroupRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupRecordBuilder toBuilder() => new GroupRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupRecord && gid == other.gid && ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, gid.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupRecord')
          ..add('gid', gid)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GroupRecordBuilder implements Builder<GroupRecord, GroupRecordBuilder> {
  _$GroupRecord? _$v;

  String? _gid;
  String? get gid => _$this._gid;
  set gid(String? gid) => _$this._gid = gid;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GroupRecordBuilder() {
    GroupRecord._initializeBuilder(this);
  }

  GroupRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _gid = $v.gid;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupRecord;
  }

  @override
  void update(void Function(GroupRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupRecord build() => _build();

  _$GroupRecord _build() {
    final _$result = _$v ?? new _$GroupRecord._(gid: gid, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
