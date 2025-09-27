// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShapeListModel _$ShapeListModelFromJson(Map<String, dynamic> json) =>
    ShapeListModel(
      id: (json['id'] as num?)?.toInt(),
      filterGroupId: (json['filter_group_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      sortOrder: (json['sort_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShapeListModelToJson(ShapeListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filter_group_id': instance.filterGroupId,
      'name': instance.name,
      'image': instance.image,
      'sort_order': instance.sortOrder,
    };
