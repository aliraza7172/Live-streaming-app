class StoriesModel {
  int? currentPage;
  List<StoryData>? ownStories;
  List<StoryData>? data;
  int? from;
  int? lastPage;
  var nextPageUrl;
  var path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  StoriesModel(
      {this.currentPage,
        this.ownStories,
        this.data,
        this.from,
        this.lastPage,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  StoriesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['own_stories'] != null) {
      ownStories = <StoryData>[];
      json['own_stories'].forEach((v) {
        ownStories!.add(new StoryData.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <StoryData>[];
      json['data'].forEach((v) {
        data!.add(new StoryData.fromJson(v));
      });
    }
    from = json['from'];
    lastPage = json['last_page'];
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
    if (this.ownStories != null) {
      data['own_stories'] = this.ownStories!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class StoryData {
  int? id;
  var privacyId;
  var referenceId;
  var referenceType;
  String? description;
  String? thumbnail;
  String? publishedAt;
  String? expiresAt;
  String? status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  String? userFullName;
  var userNickname;
  String? userImage;
  String? userUsername;
  String? userAbout;
  var userHeadline;
  int? updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;
  List<Items>? items;

  StoryData(
      {this.id,
        this.privacyId,
        this.referenceId,
        this.referenceType,
        this.description,
        this.thumbnail,
        this.publishedAt,
        this.expiresAt,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userFullName,
        this.userNickname,
        this.userImage,
        this.userUsername,
        this.userAbout,
        this.userHeadline,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.items});

  StoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    privacyId = json['privacy_id'];
    referenceId = json['reference_id'];
    referenceType = json['reference_type'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    publishedAt = json['published_at'];
    expiresAt = json['expires_at'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    userFullName = json['user_full_name'];
    userNickname = json['user_nickname'];
    userImage = json['user_image'];
    userUsername = json['user_username'];
    userAbout = json['user_about'];
    userHeadline = json['user_headline'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['Items'] != null) {
      items = <Items>[];
      json['Items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['privacy_id'] = this.privacyId;
    data['reference_id'] = this.referenceId;
    data['reference_type'] = this.referenceType;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['published_at'] = this.publishedAt;
    data['expires_at'] = this.expiresAt;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_full_name'] = this.userFullName;
    data['user_nickname'] = this.userNickname;
    data['user_image'] = this.userImage;
    data['user_username'] = this.userUsername;
    data['user_about'] = this.userAbout;
    data['user_headline'] = this.userHeadline;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.items != null) {
      data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? storyId;
  var referenceId;
  var referenceType;
  var privacyId;
  String? description;
  String? url;
  String? publishedAt;
  String? expiresAt;
  var tags;
  int? noOfVisitors;
  int? noOfLikes;
  int? noOfComments;
  int? noOfShare;
  int? createdByUserId;
  String? userFullName;
  var userNickname;
  String? userImage;
  String? userUsername;
  String? userAbout;
  var userHeadline;
  var createdByCompId;
  String? status;
  var orderBy;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Items(
      {this.id,
        this.storyId,
        this.referenceId,
        this.referenceType,
        this.privacyId,
        this.description,
        this.url,
        this.publishedAt,
        this.expiresAt,
        this.tags,
        this.noOfVisitors,
        this.noOfLikes,
        this.noOfComments,
        this.noOfShare,
        this.createdByUserId,
        this.userFullName,
        this.userNickname,
        this.userImage,
        this.userUsername,
        this.userAbout,
        this.userHeadline,
        this.createdByCompId,
        this.status,
        this.orderBy,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storyId = json['story_id'];
    referenceId = json['reference_id'];
    referenceType = json['reference_type'];
    privacyId = json['privacy_id'];
    description = json['description'];
    url = json['url'];
    publishedAt = json['published_at'];
    expiresAt = json['expires_at'];
    tags = json['tags'];
    noOfVisitors = json['no_of_visitors'];
    noOfLikes = json['no_of_likes'];
    noOfComments = json['no_of_comments'];
    noOfShare = json['no_of_share'];
    createdByUserId = json['created_by_user_id'];
    userFullName = json['user_full_name'];
    userNickname = json['user_nickname'];
    userImage = json['user_image'];
    userUsername = json['user_username'];
    userAbout = json['user_about'];
    userHeadline = json['user_headline'];
    createdByCompId = json['created_by_comp_id'];
    status = json['status'];
    orderBy = json['order_by'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['story_id'] = this.storyId;
    data['reference_id'] = this.referenceId;
    data['reference_type'] = this.referenceType;
    data['privacy_id'] = this.privacyId;
    data['description'] = this.description;
    data['url'] = this.url;
    data['published_at'] = this.publishedAt;
    data['expires_at'] = this.expiresAt;
    data['tags'] = this.tags;
    data['no_of_visitors'] = this.noOfVisitors;
    data['no_of_likes'] = this.noOfLikes;
    data['no_of_comments'] = this.noOfComments;
    data['no_of_share'] = this.noOfShare;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_full_name'] = this.userFullName;
    data['user_nickname'] = this.userNickname;
    data['user_image'] = this.userImage;
    data['user_username'] = this.userUsername;
    data['user_about'] = this.userAbout;
    data['user_headline'] = this.userHeadline;
    data['created_by_comp_id'] = this.createdByCompId;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
