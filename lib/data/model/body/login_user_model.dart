class LoginUserModel {
  bool? error;
  var code;
  Data? data;
  String? message;

  LoginUserModel({this.error, this.code, this.data, this.message});

  LoginUserModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? baseUrl;
  String? token;
  User? user;

  Data({this.baseUrl, this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    token = json['token'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_url'] = this.baseUrl;
    data['token'] = this.token;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var id;
  var userTypeId;
  String? userTypeTitle;
  String? userTypeSlug;
  String? DOB;
  String? nickName;
  var agencyTitle;
  var users2FullName;
  var companyTitle;
  var countryCodeId;
  var countryCodeCode;
  String? countryName;
  var firstName;
  var lastName;
  String? fullName;
  String? email;
  var username;
  var number;
  var gender;
  String? image;
  var banner;
  var about;
  var address;
  var facebook;
  var linkedin;
  var twitter;
  var instagram;
  var idFront;
  var idBack;
  var idNumber;
  var countPosts;
  var countFollowers;
  var countFollowing;
  var countGoldTrophies;
  var countNominations;
  var countSilverTrophies;
  var countContent;
  var countEngagement;
  var countJudgment;
  var countListed;
  var countPartner;
  var countWatch;
  var score;
  var noOfSources;
  var noOfFollowings;
  var noOfFollowers;
  var code;
  var referenceCode;
  var wallet;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  String? updatedAt;
  var deletedAt;

  User(
      {this.id,
        this.userTypeId,
        this.userTypeTitle,
        this.userTypeSlug,
        this.agencyTitle,
        this.DOB,
        this.nickName,
        this.users2FullName,
        this.companyTitle,
        this.countryCodeId,
        this.countryCodeCode,
        this.countryName,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.username,
        this.number,
        this.gender,
        this.image,
        this.banner,
        this.about,
        this.address,
        this.facebook,
        this.linkedin,
        this.twitter,
        this.instagram,
        this.idFront,
        this.idBack,
        this.idNumber,
        this.countPosts,
        this.countFollowers,
        this.countFollowing,
        this.countGoldTrophies,
        this.countNominations,
        this.countSilverTrophies,
        this.countContent,
        this.countEngagement,
        this.countJudgment,
        this.countListed,
        this.countPartner,
        this.countWatch,
        this.score,
        this.noOfSources,
        this.noOfFollowings,
        this.noOfFollowers,
        this.code,
        this.referenceCode,
        this.wallet,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userTypeId = json['user_type_id'];
    userTypeTitle = json['user_type_title'];
    userTypeSlug = json['user_type_slug'];
    DOB = json['date_of_birth'];
    nickName = json['nickname'];
    agencyTitle = json['agency_title'];
    users2FullName = json['users2_full_name'];
    companyTitle = json['company_title'];
    countryCodeId = json['country_code_id'];
    countryCodeCode = json['country_code_code'];
    countryName = json['country_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    username = json['username'];
    number = json['number'];
    gender = json['gender'];
    image = json['image'];
    banner = json['banner'];
    about = json['about'];
    address = json['address'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    idFront = json['id_front'];
    idBack = json['id_back'];
    idNumber = json['id_number'];
    countPosts = json['count_posts'];
    countFollowers = json['count_followers'];
    countFollowing = json['count_following'];
    countGoldTrophies = json['count_gold_trophies'];
    countNominations = json['count_nominations'];
    countSilverTrophies = json['count_silver_trophies'];
    countContent = json['count_content'];
    countEngagement = json['count_engagement'];
    countJudgment = json['count_judgment'];
    countListed = json['count_listed'];
    countPartner = json['count_partner'];
    countWatch = json['count_watch'];
    score = json['score'];
    noOfSources = json['no_of_sources'];
    noOfFollowings = json['no_of_followings'];
    noOfFollowers = json['no_of_followers'];
    code = json['code'];
    referenceCode = json['reference_code'];
    wallet = json['wallet'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type_id'] = this.userTypeId;
    data['user_type_title'] = this.userTypeTitle;
    data['user_type_slug'] = this.userTypeSlug;
    data['date_of_birth']=DOB ;
    data['nickname']=nickName;
    data['agency_title'] = this.agencyTitle;
    data['users2_full_name'] = this.users2FullName;
    data['company_title'] = this.companyTitle;
    data['country_code_id'] = this.countryCodeId;
    data['country_code_code'] = this.countryCodeCode;
    data['country_name'] = this.countryName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['number'] = this.number;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['banner'] = this.banner;
    data['about'] = this.about;
    data['address'] = this.address;
    data['facebook'] = this.facebook;
    data['linkedin'] = this.linkedin;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['id_front'] = this.idFront;
    data['id_back'] = this.idBack;
    data['id_number'] = this.idNumber;
    data['count_posts'] = this.countPosts;
    data['count_followers'] = this.countFollowers;
    data['count_following'] = this.countFollowing;
    data['count_gold_trophies'] = this.countGoldTrophies;
    data['count_nominations'] = this.countNominations;
    data['count_silver_trophies'] = this.countSilverTrophies;
    data['count_content'] = this.countContent;
    data['count_engagement'] = this.countEngagement;
    data['count_judgment'] = this.countJudgment;
    data['count_listed'] = this.countListed;
    data['count_partner'] = this.countPartner;
    data['count_watch'] = this.countWatch;
    data['score'] = this.score;
    data['no_of_sources'] = this.noOfSources;
    data['no_of_followings'] = this.noOfFollowings;
    data['no_of_followers'] = this.noOfFollowers;
    data['code'] = this.code;
    data['reference_code'] = this.referenceCode;
    data['wallet'] = this.wallet;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
