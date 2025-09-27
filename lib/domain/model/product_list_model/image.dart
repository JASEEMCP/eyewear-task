import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'option_value_id')
  int? optionValueId;
  String? image;
  @JsonKey(name: 'image_type')
  String? imageType;
  @JsonKey(name: 'sort_order')
  int? sortOrder;

  Image({
    this.id,
    this.productId,
    this.optionValueId,
    this.image,
    this.imageType,
    this.sortOrder,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  Image copyWith({
    int? id,
    int? productId,
    int? optionValueId,
    String? image,
    String? imageType,
    int? sortOrder,
  }) {
    return Image(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      optionValueId: optionValueId ?? this.optionValueId,
      image: image ?? this.image,
      imageType: imageType ?? this.imageType,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
