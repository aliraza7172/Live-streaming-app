class BannerModel {
  int? currentPage;
  List<Data>? data;
  var firstPageUrl;
  int? from;
  int? lastPage;
  var lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  var path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  BannerModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  BannerModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  int? level2Id;
  var childCategoryTitle;
  var title;
  var slug;
  var description;
  var thumbnail;
  var status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  var userFullName;
  var userImage;
  var userSlug;
  var updatedByUserId;
  var deletedByUserId;
  var createdAt;
  var updatedAt;
  var deletedAt;

  Data(
      {this.id,
        this.level2Id,
        this.childCategoryTitle,
        this.title,
        this.slug,
        this.description,
        this.thumbnail,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userFullName,
        this.userImage,
        this.userSlug,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level2Id = json['level_2_id'];
    childCategoryTitle = json['child_category_title'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    userFullName = json['user_full_name'];
    userImage = json['user_image'];
    userSlug = json['user_slug'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level_2_id'] = this.level2Id;
    data['child_category_title'] = this.childCategoryTitle;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_full_name'] = this.userFullName;
    data['user_image'] = this.userImage;
    data['user_slug'] = this.userSlug;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Links {
  var url;
  var label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
