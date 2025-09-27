import 'package:json_annotation/json_annotation.dart';

import 'color_option.dart';
import 'image.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListModel {
  int? id;
  @JsonKey(name: 'page_key')
  String? pageKey;
  String? name;
  String? model;
  int? manufacture;
  @JsonKey(name: 'product_type')
  String? productType;
  String? description;
  @JsonKey(name: 'seo_title')
  String? seoTitle;
  @JsonKey(name: 'seo_content')
  String? seoContent;
  @JsonKey(name: 'meta_title')
  String? metaTitle;
  @JsonKey(name: 'meta_keyword')
  String? metaKeyword;
  @JsonKey(name: 'meta_description')
  String? metaDescription;
  String? tags;
  int? varient;
  String? image;
  int? material;
  @JsonKey(name: 'frame_type')
  int? frameType;
  int? price;
  int? quantity;
  @JsonKey(name: 'sort_order')
  int? sortOrder;
  int? minimum;
  String? status;
  @JsonKey(name: 'complete_status')
  String? completeStatus;
  @JsonKey(name: 'out_of_stock')
  int? outOfStock;
  @JsonKey(name: 'lense_only')
  int? lenseOnly;
  @JsonKey(name: 'is_sunglass')
  int? isSunglass;
  @JsonKey(name: 'prescription_status')
  int? prescriptionStatus;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  String? category;
  List<Image>? images;
  List<ColorOption>? colorOptions;

  ProductListModel({
    this.id,
    this.pageKey,
    this.name,
    this.model,
    this.manufacture,
    this.productType,
    this.description,
    this.seoTitle,
    this.seoContent,
    this.metaTitle,
    this.metaKeyword,
    this.metaDescription,
    this.tags,
    this.varient,
    this.image,
    this.material,
    this.frameType,
    this.price,
    this.quantity,
    this.sortOrder,
    this.minimum,
    this.status,
    this.completeStatus,
    this.outOfStock,
    this.lenseOnly,
    this.isSunglass,
    this.prescriptionStatus,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.images,
    this.colorOptions,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return _$ProductListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);

  ProductListModel copyWith({
    int? id,
    String? pageKey,
    String? name,
    String? model,
    int? manufacture,
    String? productType,
    String? description,
    String? seoTitle,
    String? seoContent,
    String? metaTitle,
    String? metaKeyword,
    String? metaDescription,
    String? tags,
    int? varient,
    String? image,
    int? material,
    int? frameType,
    int? price,
    int? quantity,
    int? sortOrder,
    int? minimum,
    String? status,
    String? completeStatus,
    int? outOfStock,
    int? lenseOnly,
    int? isSunglass,
    int? prescriptionStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? category,
    List<Image>? images,
    List<ColorOption>? colorOptions,
  }) {
    return ProductListModel(
      id: id ?? this.id,
      pageKey: pageKey ?? this.pageKey,
      name: name ?? this.name,
      model: model ?? this.model,
      manufacture: manufacture ?? this.manufacture,
      productType: productType ?? this.productType,
      description: description ?? this.description,
      seoTitle: seoTitle ?? this.seoTitle,
      seoContent: seoContent ?? this.seoContent,
      metaTitle: metaTitle ?? this.metaTitle,
      metaKeyword: metaKeyword ?? this.metaKeyword,
      metaDescription: metaDescription ?? this.metaDescription,
      tags: tags ?? this.tags,
      varient: varient ?? this.varient,
      image: image ?? this.image,
      material: material ?? this.material,
      frameType: frameType ?? this.frameType,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      sortOrder: sortOrder ?? this.sortOrder,
      minimum: minimum ?? this.minimum,
      status: status ?? this.status,
      completeStatus: completeStatus ?? this.completeStatus,
      outOfStock: outOfStock ?? this.outOfStock,
      lenseOnly: lenseOnly ?? this.lenseOnly,
      isSunglass: isSunglass ?? this.isSunglass,
      prescriptionStatus: prescriptionStatus ?? this.prescriptionStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
      images: images ?? this.images,
      colorOptions: colorOptions ?? this.colorOptions,
    );
  }
}
