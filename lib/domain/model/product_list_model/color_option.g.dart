// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorOption _$ColorOptionFromJson(Map<String, dynamic> json) => ColorOption(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  discountType: json['discount_type'] as String?,
  discount: (json['discount'] as num?)?.toInt(),
  startDate: json['start_date'],
  endDate: json['end_date'],
  seoTitle: json['seo_title'] as String?,
  seoContent: json['seo_content'] as String?,
  metaTitle: json['meta_title'] as String?,
  metaDescription: json['meta_description'] as String?,
  status: json['status'] as String?,
  optionValue: json['option_value'] as String?,
  optionImage: json['optionImage'] as String?,
  optionValueId: (json['option_value_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ColorOptionToJson(ColorOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
      'discount_type': instance.discountType,
      'discount': instance.discount,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'seo_title': instance.seoTitle,
      'seo_content': instance.seoContent,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'status': instance.status,
      'option_value': instance.optionValue,
      'optionImage': instance.optionImage,
      'option_value_id': instance.optionValueId,
    };
