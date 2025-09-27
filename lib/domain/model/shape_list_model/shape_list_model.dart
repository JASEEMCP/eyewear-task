import 'package:json_annotation/json_annotation.dart';

part 'shape_list_model.g.dart';

@JsonSerializable()
class ShapeListModel {
  int? id;
  @JsonKey(name: 'filter_group_id')
  int? filterGroupId;
  String? name;
  String? image;
  @JsonKey(name: 'sort_order')
  int? sortOrder;

  ShapeListModel({
    this.id,
    this.filterGroupId,
    this.name,
    this.image,
    this.sortOrder,
  });

  factory ShapeListModel.fromJson(Map<String, dynamic> json) {
    return _$ShapeListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShapeListModelToJson(this);

  ShapeListModel copyWith({
    int? id,
    int? filterGroupId,
    String? name,
    String? image,
    int? sortOrder,
  }) {
    return ShapeListModel(
      id: id ?? this.id,
      filterGroupId: filterGroupId ?? this.filterGroupId,
      name: name ?? this.name,
      image: image ?? this.image,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
