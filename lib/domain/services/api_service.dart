import 'package:dio/dio.dart';
import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/domain/model/shape_list_model/shape_list_model.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.hanzprellet.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/api/customer/home/products")
  Future<List<ProductListModel>> getProductList();

  @GET("/api/customer/shapeList")
  Future<List<ShapeListModel>> getShapeList();
}
