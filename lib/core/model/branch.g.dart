// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return Branch(json['name'] as String, json['tarball_url'] as String,
      json['zipball_url'] as String, json['isBranch'] as bool);
}

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'name': instance.name,
      'tarball_url': instance.tarBallUrl,
      'zipball_url': instance.zipBallUrl,
      'isBranch': instance.isBranch
    };
