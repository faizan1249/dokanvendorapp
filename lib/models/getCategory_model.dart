class CatModel {
  CatModel({
    required this.results,
  });
  late final List<ResultsData> results;

  CatModel.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => ResultsData.fromJson(e)).toList();
  }
}

class ResultsData {
  ResultsData({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    this.image,
    required this.menuOrder,
    required this.count,
    required this.links,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final int parent;
  late final String description;
  late final String display;
  late final Image? image;
  late final int menuOrder;
  late final int count;
  late final _links links;

  ResultsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    image = null;
    menuOrder = json['menu_order'];
    count = json['count'];
    links = _links.fromJson(json['_links']);
  }
}

class Image {
  Image({
    required this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });
  late final int id;
  late final String? dateCreated;
  late final String? dateCreatedGmt;
  late final String? dateModified;
  late final String? dateModifiedGmt;
  late final String? src;
  late final String name;
  late final String alt;

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = null;
    dateCreatedGmt = null;
    dateModified = null;
    dateModifiedGmt = null;
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }
}

class _links {
  _links({
    required this.self,
    required this.collection,
  });
  late final List<Self> self;
  late final List<Collection> collection;

  _links.fromJson(Map<String, dynamic> json) {
    self = List.from(json['self']).map((e) => Self.fromJson(e)).toList();
    collection = List.from(json['collection'])
        .map((e) => Collection.fromJson(e))
        .toList();
  }
}

class Self {
  Self({
    required this.href,
  });
  late final String href;

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }
}

class Collection {
  Collection({
    required this.href,
  });
  late final String href;

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }
}
