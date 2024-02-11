class MessagesModel {
  int? currentPage;
  List<MessagesData>? data;
  int? from;
  int? lastPage;
  var nextPageUrl;
  var path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  MessagesModel(
      {this.currentPage,
        this.data,
        this.from,
        this.lastPage,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <MessagesData>[];
      json['data'].forEach((v) {
        data!.add(new MessagesData.fromJson(v));
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

class MessagesData {
  int? id;
  var type;
  var avatar;
  var banner;
  var description;
  var noOfUsers;
  var conversationReplyToId;
  var conversationReferenceId;
  var conversationReferenceType;
  var conversationText;
  var conversationLatitudeLongitude;
  var conversationUrl;
  var conversationNumber;
  var conversationType;
  var conversationReadStatus;
  var conversationReadTime;
  var conversationIsForward;
  var conversationStatus;
  int? conversationCreatedByUserId;
  var conversationCreatedAt;
  var conversationUpdatedAt;
  var conversationDeletedAt;
  var status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  int? userId;
  var userFullName;
  var userImage;
  var userUsername;
  var updatedByUserId;
  var deletedByUserId;
  var createdAt;
  var updatedAt;
  var deletedAt;
  Conversations? conversations;
  Users? users;

  MessagesData(
      {this.id,
        this.type,
        this.avatar,
        this.banner,
        this.description,
        this.noOfUsers,
        this.conversationReplyToId,
        this.conversationReferenceId,
        this.conversationReferenceType,
        this.conversationText,
        this.conversationLatitudeLongitude,
        this.conversationUrl,
        this.conversationNumber,
        this.conversationType,
        this.conversationReadStatus,
        this.conversationReadTime,
        this.conversationIsForward,
        this.conversationStatus,
        this.conversationCreatedByUserId,
        this.conversationCreatedAt,
        this.conversationUpdatedAt,
        this.conversationDeletedAt,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userId,
        this.userFullName,
        this.userImage,
        this.userUsername,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.conversations,
        this.users});

  MessagesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    avatar = json['avatar'];
    banner = json['banner'];
    description = json['description'];
    noOfUsers = json['no_of_users'];
    conversationReplyToId = json['conversation_reply_to_id'];
    conversationReferenceId = json['conversation_reference_id'];
    conversationReferenceType = json['conversation_reference_type'];
    conversationText = json['conversation_text'];
    conversationLatitudeLongitude = json['conversation_latitude_longitude'];
    conversationUrl = json['conversation_url'];
    conversationNumber = json['conversation_number'];
    conversationType = json['conversation_type'];
    conversationReadStatus = json['conversation_read_status'];
    conversationReadTime = json['conversation_read_time'];
    conversationIsForward = json['conversation_is_forward'];
    conversationStatus = json['conversation_status'];
    conversationCreatedByUserId = json['conversation_created_by_user_id'];
    conversationCreatedAt = json['conversation_created_at'];
    conversationUpdatedAt = json['conversation_updated_at'];
    conversationDeletedAt = json['conversation_deleted_at'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    userId = json['user_id'];
    userFullName = json['user_full_name'];
    userImage = json['user_image'];
    userUsername = json['user_username'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    conversations = json['conversations'] != null
        ? new Conversations.fromJson(json['conversations'])
        : null;
    users = json['users'] != null
        ? new Users.fromJson(json['users'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['banner'] = this.banner;
    data['description'] = this.description;
    data['no_of_users'] = this.noOfUsers;
    data['conversation_reply_to_id'] = this.conversationReplyToId;
    data['conversation_reference_id'] = this.conversationReferenceId;
    data['conversation_reference_type'] = this.conversationReferenceType;
    data['conversation_text'] = this.conversationText;
    data['conversation_latitude_longitude'] =
        this.conversationLatitudeLongitude;
    data['conversation_url'] = this.conversationUrl;
    data['conversation_number'] = this.conversationNumber;
    data['conversation_type'] = this.conversationType;
    data['conversation_read_status'] = this.conversationReadStatus;
    data['conversation_read_time'] = this.conversationReadTime;
    data['conversation_is_forward'] = this.conversationIsForward;
    data['conversation_status'] = this.conversationStatus;
    data['conversation_created_by_user_id'] = this.conversationCreatedByUserId;
    data['conversation_created_at'] = this.conversationCreatedAt;
    data['conversation_updated_at'] = this.conversationUpdatedAt;
    data['conversation_deleted_at'] = this.conversationDeletedAt;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_id'] = this.userId;
    data['user_full_name'] = this.userFullName;
    data['user_image'] = this.userImage;
    data['user_username'] = this.userUsername;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.conversations != null) {
      data['conversations'] = this.conversations!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Conversations {
  int? currentPage;
  List<ConversationData>? data;
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

  Conversations(
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

  Conversations.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ConversationData>[];
      json['data'].forEach((v) {
        data!.add(new ConversationData.fromJson(v));
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

class ConversationData {
  int? id;
  var replyToId;
  int? messageId;
  var referenceId;
  var referenceType;
  var text;
  var latitudeLongitude;
  var thumbnail;
  var url;
  var number;
  var type;
  var readStatus;
  var readTime;
  var isForward;
  var messageConversations2Id;
  var messageConversations2MessageId;
  var messageConversations2ReferenceId;
  var messageConversations2ReferenceType;
  var messageConversations2Text;
  var messageConversations2LatitudeLongitude;
  var messageConversations2Url;
  var messageConversations2Number;
  var messageConversations2ReadStatus;
  var messageConversations2Status;
  var messageConversations2OrderBy;
  var messageConversations2CreatedByCompId;
  var messageConversations2CreatedByUserId;
  var user2Id;
  var user2FullName;
  var user2Image;
  var user2Username;
  var messageConversations2UpdatedByUserId;
  var messageConversations2DeletedByUserId;
  var messageConversations2CreatedAt;
  var messageConversations2UpdatedAt;
  var messageConversations2DeletedAt;
  var status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  int? userId;
  var userFullName;
  var userImage;
  var userUsername;
  var updatedByUserId;
  var deletedByUserId;
  var createdAt;
  var updatedAt;
  var deletedAt;

  ConversationData(
      {this.id,
        this.replyToId,
        this.messageId,
        this.referenceId,
        this.referenceType,
        this.text,
        this.latitudeLongitude,
        this.thumbnail,
        this.url,
        this.number,
        this.type,
        this.readStatus,
        this.readTime,
        this.isForward,
        this.messageConversations2Id,
        this.messageConversations2MessageId,
        this.messageConversations2ReferenceId,
        this.messageConversations2ReferenceType,
        this.messageConversations2Text,
        this.messageConversations2LatitudeLongitude,
        this.messageConversations2Url,
        this.messageConversations2Number,
        this.messageConversations2ReadStatus,
        this.messageConversations2Status,
        this.messageConversations2OrderBy,
        this.messageConversations2CreatedByCompId,
        this.messageConversations2CreatedByUserId,
        this.user2Id,
        this.user2FullName,
        this.user2Image,
        this.user2Username,
        this.messageConversations2UpdatedByUserId,
        this.messageConversations2DeletedByUserId,
        this.messageConversations2CreatedAt,
        this.messageConversations2UpdatedAt,
        this.messageConversations2DeletedAt,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userId,
        this.userFullName,
        this.userImage,
        this.userUsername,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  ConversationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    replyToId = json['reply_to_id'];
    messageId = json['message_id'];
    referenceId = json['reference_id'];
    referenceType = json['reference_type'];
    text = json['text'];
    latitudeLongitude = json['latitude_longitude'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    number = json['number'];
    type = json['type'];
    readStatus = json['read_status'];
    readTime = json['read_time'];
    isForward = json['is_forward'];
    messageConversations2Id = json['message_conversations2_id'];
    messageConversations2MessageId = json['message_conversations2_message_id'];
    messageConversations2ReferenceId =
    json['message_conversations2_reference_id'];
    messageConversations2ReferenceType =
    json['message_conversations2_reference_type'];
    messageConversations2Text = json['message_conversations2_text'];
    messageConversations2LatitudeLongitude =
    json['message_conversations2_latitude_longitude'];
    messageConversations2Url = json['message_conversations2_url'];
    messageConversations2Number = json['message_conversations2_number'];
    messageConversations2ReadStatus =
    json['message_conversations2_read_status'];
    messageConversations2Status = json['message_conversations2_status'];
    messageConversations2OrderBy = json['message_conversations2_order_by'];
    messageConversations2CreatedByCompId =
    json['message_conversations2_created_by_comp_id'];
    messageConversations2CreatedByUserId =
    json['message_conversations2_created_by_user_id'];
    user2Id = json['user2_id'];
    user2FullName = json['user2_full_name'];
    user2Image = json['user2_image'];
    user2Username = json['user2_username'];
    messageConversations2UpdatedByUserId =
    json['message_conversations2_updated_by_user_id'];
    messageConversations2DeletedByUserId =
    json['message_conversations2_deleted_by_user_id'];
    messageConversations2CreatedAt = json['message_conversations2_created_at'];
    messageConversations2UpdatedAt = json['message_conversations2_updated_at'];
    messageConversations2DeletedAt = json['message_conversations2_deleted_at'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    userId = json['user_id'];
    userFullName = json['user_full_name'];
    userImage = json['user_image'];
    userUsername = json['user_username'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reply_to_id'] = this.replyToId;
    data['message_id'] = this.messageId;
    data['reference_id'] = this.referenceId;
    data['reference_type'] = this.referenceType;
    data['text'] = this.text;
    data['latitude_longitude'] = this.latitudeLongitude;
    data['thumbnail'] = this.thumbnail;
    data['url'] = this.url;
    data['number'] = this.number;
    data['type'] = this.type;
    data['read_status'] = this.readStatus;
    data['read_time'] = this.readTime;
    data['is_forward'] = this.isForward;
    data['message_conversations2_id'] = this.messageConversations2Id;
    data['message_conversations2_message_id'] =
        this.messageConversations2MessageId;
    data['message_conversations2_reference_id'] =
        this.messageConversations2ReferenceId;
    data['message_conversations2_reference_type'] =
        this.messageConversations2ReferenceType;
    data['message_conversations2_text'] = this.messageConversations2Text;
    data['message_conversations2_latitude_longitude'] =
        this.messageConversations2LatitudeLongitude;
    data['message_conversations2_url'] = this.messageConversations2Url;
    data['message_conversations2_number'] = this.messageConversations2Number;
    data['message_conversations2_read_status'] =
        this.messageConversations2ReadStatus;
    data['message_conversations2_status'] = this.messageConversations2Status;
    data['message_conversations2_order_by'] = this.messageConversations2OrderBy;
    data['message_conversations2_created_by_comp_id'] =
        this.messageConversations2CreatedByCompId;
    data['message_conversations2_created_by_user_id'] =
        this.messageConversations2CreatedByUserId;
    data['user2_id'] = this.user2Id;
    data['user2_full_name'] = this.user2FullName;
    data['user2_image'] = this.user2Image;
    data['user2_username'] = this.user2Username;
    data['message_conversations2_updated_by_user_id'] =
        this.messageConversations2UpdatedByUserId;
    data['message_conversations2_deleted_by_user_id'] =
        this.messageConversations2DeletedByUserId;
    data['message_conversations2_created_at'] =
        this.messageConversations2CreatedAt;
    data['message_conversations2_updated_at'] =
        this.messageConversations2UpdatedAt;
    data['message_conversations2_deleted_at'] =
        this.messageConversations2DeletedAt;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_id'] = this.userId;
    data['user_full_name'] = this.userFullName;
    data['user_image'] = this.userImage;
    data['user_username'] = this.userUsername;
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

class Users {
  int? currentPage;
  List<UserData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  String? path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  Users(
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

  Users.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
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

class UserData {
  int? id;
  int? messageId;
  int? userId;
  String? user2FullName;
  var user2Username;
  String? user2Image;
  String? status;
  var orderBy;
  int? createdByUserId;
  String? userFullName;
  var userUsername;
  String? userImage;
  var createdByCompId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  UserData(
      {this.id,
        this.messageId,
        this.userId,
        this.user2FullName,
        this.user2Username,
        this.user2Image,
        this.status,
        this.orderBy,
        this.createdByUserId,
        this.userFullName,
        this.userUsername,
        this.userImage,
        this.createdByCompId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    messageId = json['message_id'];
    userId = json['user_id'];
    user2FullName = json['user2_full_name'];
    user2Username = json['user2_username'];
    user2Image = json['user2_image'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByUserId = json['created_by_user_id'];
    userFullName = json['user_full_name'];
    userUsername = json['user_username'];
    userImage = json['user_image'];
    createdByCompId = json['created_by_comp_id'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message_id'] = this.messageId;
    data['user_id'] = this.userId;
    data['user2_full_name'] = this.user2FullName;
    data['user2_username'] = this.user2Username;
    data['user2_image'] = this.user2Image;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_full_name'] = this.userFullName;
    data['user_username'] = this.userUsername;
    data['user_image'] = this.userImage;
    data['created_by_comp_id'] = this.createdByCompId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}


