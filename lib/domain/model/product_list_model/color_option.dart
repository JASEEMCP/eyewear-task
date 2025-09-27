import 'package:json_annotation/json_annotation.dart';

part 'color_option.g.dart';

@JsonSerializable()
class ColorOption {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  int? quantity;
  double? price;
  @JsonKey(name: 'discount_type')
  String? discountType;
  int? discount;
  @JsonKey(name: 'start_date')
  dynamic startDate;
  @JsonKey(name: 'end_date')
  dynamic endDate;
  @JsonKey(name: 'seo_title')
  String? seoTitle;
  @JsonKey(name: 'seo_content')
  String? seoContent;
  @JsonKey(name: 'meta_title')
  String? metaTitle;
  @JsonKey(name: 'meta_description')
  String? metaDescription;
  String? status;
  @JsonKey(name: 'option_value')
  String? optionValue;
  String? optionImage;
  @JsonKey(name: 'option_value_id')
  int? optionValueId;

  ColorOption({
    this.id,
    this.productId,
    this.quantity,
    this.price,
    this.discountType,
    this.discount,
    this.startDate,
    this.endDate,
    this.seoTitle,
    this.seoContent,
    this.metaTitle,
    this.metaDescription,
    this.status,
    this.optionValue,
    this.optionImage,
    this.optionValueId,
  });

  factory ColorOption.fromJson(Map<String, dynamic> json) {
    return _$ColorOptionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ColorOptionToJson(this);

  ColorOption copyWith({
    int? id,
    int? productId,
    int? quantity,
    double? price,
    String? discountType,
    int? discount,
    dynamic startDate,
    dynamic endDate,
    String? seoTitle,
    String? seoContent,
    String? metaTitle,
    String? metaDescription,
    String? status,
    String? optionValue,
    String? optionImage,
    int? optionValueId,
  }) {
    return ColorOption(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      discountType: discountType ?? this.discountType,
      discount: discount ?? this.discount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      seoTitle: seoTitle ?? this.seoTitle,
      seoContent: seoContent ?? this.seoContent,
      metaTitle: metaTitle ?? this.metaTitle,
      metaDescription: metaDescription ?? this.metaDescription,
      status: status ?? this.status,
      optionValue: optionValue ?? this.optionValue,
      optionImage: optionImage ?? this.optionImage,
      optionValueId: optionValueId ?? this.optionValueId,
    );
  }
}
