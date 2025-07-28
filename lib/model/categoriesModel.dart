class CategoriesModel {
  List<CategoryItem> categories = [];

  CategoriesModel();

  CategoriesModel.fromJson(List<dynamic> jsonList) {
    categories = jsonList.map((item) => CategoryItem.fromJson(item)).toList();
  }
}

class CategoryItem {
  String? slug;
  String? name;
  String? url;

  CategoryItem({this.slug, this.name, this.url});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }
}
