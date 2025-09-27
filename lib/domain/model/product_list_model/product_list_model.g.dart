// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      id: (json['id'] as num?)?.toInt(),
      pageKey: json['page_key'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      manufacture: (json['manufacture'] as num?)?.toInt(),
      productType: json['product_type'] as String?,
      description: json['description'] as String?,
      seoTitle: json['seo_title'] as String?,
      seoContent: json['seo_content'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaKeyword: json['meta_keyword'] as String?,
      metaDescription: json['meta_description'] as String?,
      tags: json['tags'] as String?,
      varient: (json['varient'] as num?)?.toInt(),
      image: json['image'] as String?,
      material: (json['material'] as num?)?.toInt(),
      frameType: (json['frame_type'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      sortOrder: (json['sort_order'] as num?)?.toInt(),
      minimum: (json['minimum'] as num?)?.toInt(),
      status: json['status'] as String?,
      completeStatus: json['complete_status'] as String?,
      outOfStock: (json['out_of_stock'] as num?)?.toInt(),
      lenseOnly: (json['lense_only'] as num?)?.toInt(),
      isSunglass: (json['is_sunglass'] as num?)?.toInt(),
      prescriptionStatus: (json['prescription_status'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      category: json['category'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      colorOptions: (json['colorOptions'] as List<dynamic>?)
          ?.map((e) => ColorOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page_key': instance.pageKey,
      'name': instance.name,
      'model': instance.model,
      'manufacture': instance.manufacture,
      'product_type': instance.productType,
      'description': instance.description,
      'seo_title': instance.seoTitle,
      'seo_content': instance.seoContent,
      'meta_title': instance.metaTitle,
      'meta_keyword': instance.metaKeyword,
      'meta_description': instance.metaDescription,
      'tags': instance.tags,
      'varient': instance.varient,
      'image': instance.image,
      'material': instance.material,
      'frame_type': instance.frameType,
      'price': instance.price,
      'quantity': instance.quantity,
      'sort_order': instance.sortOrder,
      'minimum': instance.minimum,
      'status': instance.status,
      'complete_status': instance.completeStatus,
      'out_of_stock': instance.outOfStock,
      'lense_only': instance.lenseOnly,
      'is_sunglass': instance.isSunglass,
      'prescription_status': instance.prescriptionStatus,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category': instance.category,
      'images': instance.images,
      'colorOptions': instance.colorOptions,
    };
