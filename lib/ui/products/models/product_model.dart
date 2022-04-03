import 'dart:convert';

const String CATEGORY_ALL = 'All';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
      (json.decode(str) as List<dynamic>).map(
        (dynamic x) {
          return ProductModel.fromJson(x);
        },
      ).toList(),
    );

String productModelToJson(List<ProductModel> data) => json.encode(
      List<dynamic>.from(
        data.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
    );

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.count,
    required this.rate,
    required this.url,
  });

  factory ProductModel.fromJson(dynamic json) => ProductModel(
        id: json['id'] as int,
        name: json['title'] as String,
        price: double.parse(json['rate'] as String),
        description: json['description'] as String,
        category: json['category'] as String,
        image: json['image'] as String,
        count: int.parse(json['count'] as String),
        rate: double.parse(json['rate'] as String),
        url: json['url'] as String,
      );

  int id;
  String name;
  double price;
  String description;
  String category;
  String image;
  int count;
  double rate;
  String url;

  static List<ProductModel> empty() {
    return [
      ProductModel(
        id: 1,
        name: '',
        price: 0,
        description: '',
        category: '',
        image: '',
        count: 0,
        rate: 0,
        url: '',
      ),
    ];
  }

  static List<String> getCategories(List<ProductModel> products) {
    final _categories = <String>[CATEGORY_ALL];
    for (final p in products) {
      if (!_categories.contains(p.category)) {
        _categories.add(p.category);
      }
    }
    return _categories;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'count': count,
        'rate': rate,
      };
}

double fromIntToDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  }
  return value as double;
}
