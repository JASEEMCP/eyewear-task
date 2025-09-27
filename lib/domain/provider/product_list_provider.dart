import 'package:eyewear/domain/model/product_list_model/product_list_model.dart';
import 'package:eyewear/domain/model/shape_list_model/shape_list_model.dart';
import 'package:eyewear/domain/services/api_service.dart';
import 'package:eyewear/infrastructure/dio_client.dart';
import 'package:riverpod/riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

// FutureProvider for fetching posts
final productListProvider = FutureProvider<List<ProductListModel>>((ref) async {
  final api = ref.watch(apiServiceProvider);
  return api.getProductList();
});

final shapeListProvider = FutureProvider<List<ShapeListModel>>((ref) async {
  final api = ref.watch(apiServiceProvider);
  return api.getShapeList();
});

final searchQueryProvider = StateProvider<String>((ref) => "");

final filteredProductProvider = Provider<List<ProductListModel>>((ref) {
  final productAsync = ref.watch(productListProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();
  
  return productAsync.when(
    data: (products) {
      if (query.isEmpty) return products;
      return products
          .where((p) => (p.name ?? "").toLowerCase().contains(query))
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
});
