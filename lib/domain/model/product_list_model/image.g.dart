// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  optionValueId: (json['option_value_id'] as num?)?.toInt(),
  image: json['image'] as String?,
  imageType: json['image_type'] as String?,
  sortOrder: (json['sort_order'] as num?)?.toInt(),
);

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'option_value_id': instance.optionValueId,
  'image': instance.image,
  'image_type': instance.imageType,
  'sort_order': instance.sortOrder,
};
