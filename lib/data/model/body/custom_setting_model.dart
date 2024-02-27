class customSettingModel {
  bool? error;
  int? code;
  Data? data;
  String? message;

  customSettingModel({this.error, this.code, this.data, this.message});

  customSettingModel.fromJson(Map<String, dynamic> json) {
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
  Settings? settings;
  List<UserTypes>? userTypes;
  List<Privacies>? privacies;
  var banners;
  var games;
  List<CountryCodes>? countryCodes;
  List<Countries>? countries;
  List<Provinces>? provinces;
  List<Cities>? cities;
  List<Areas>? areas;
  List<Locations>? locations;
  var audioStreamCategories;
  var videoStreamCategories;
  var newsCategories;
  var blogCategories;
  var eventsCategories;
  var notificationCategories;
  var stories;
  var audioStreams;
  var videoStreams;
  var newsfeeds;
  var events;
  var messages;
  var notifications;
  var store;
  var freshers;
  var populars;
  var pKs;
  var myFollowers;
  var myFollowing;
  var myNewsfeeds;
  var myBag;
  var myLevel;
  var myBadges;
  var myInvites;
  var myEarnings;
  var countryHeads;
  var admins;
  var agencies;
  var hosts;
  var agents;
  var users;

  Data(
      {this.baseUrl,
        this.settings,
        this.userTypes,
        this.privacies,
        this.banners,
        this.games,
        this.countryCodes,
        this.countries,
        this.provinces,
        this.cities,
        this.areas,
        this.locations,
        this.audioStreamCategories,
        this.videoStreamCategories,
        this.newsCategories,
        this.blogCategories,
        this.eventsCategories,
        this.notificationCategories,
        this.stories,
        this.audioStreams,
        this.videoStreams,
        this.newsfeeds,
        this.events,
        this.messages,
        this.notifications,
        this.store,
        this.freshers,
        this.populars,
        this.pKs,
        this.myFollowers,
        this.myFollowing,
        this.myNewsfeeds,
        this.myBag,
        this.myLevel,
        this.myBadges,
        this.myInvites,
        this.myEarnings,
        this.countryHeads,
        this.admins,
        this.agencies,
        this.hosts,
        this.agents,
        this.users});

  Data.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    settings = json['Settings'] != null
        ? new Settings.fromJson(json['Settings'])
        : null;
    if (json['UserTypes'] != null) {
      userTypes = <UserTypes>[];
      json['UserTypes'].forEach((v) {
        userTypes!.add(new UserTypes.fromJson(v));
      });
    }
    if (json['Privacies'] != null) {
      privacies = <Privacies>[];
      json['Privacies'].forEach((v) {
        privacies!.add(new Privacies.fromJson(v));
      });
    }
    banners = json['Banners'];
    games = json['Games'];
    if (json['CountryCodes'] != null) {
      countryCodes = <CountryCodes>[];
      json['CountryCodes'].forEach((v) {
        countryCodes!.add(new CountryCodes.fromJson(v));
      });
    }
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
    if (json['Provinces'] != null) {
      provinces = <Provinces>[];
      json['Provinces'].forEach((v) {
        provinces!.add(new Provinces.fromJson(v));
      });
    }
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['Areas'] != null) {
      areas = <Areas>[];
      json['Areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
    if (json['Locations'] != null) {
      locations = <Locations>[];
      json['Locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    audioStreamCategories = json['AudioStreamCategories'];
    videoStreamCategories = json['VideoStreamCategories'];
    newsCategories = json['NewsCategories'];
    blogCategories = json['BlogCategories'];
    eventsCategories = json['EventsCategories'];
    notificationCategories = json['NotificationCategories'];
    stories = json['Stories'];
    audioStreams = json['AudioStreams'];
    videoStreams = json['VideoStreams'];
    newsfeeds = json['Newsfeeds'];
    events = json['Events'];
    messages = json['Messages'];
    notifications = json['Notifications'];
    store = json['Store'];
    freshers = json['Freshers'];
    populars = json['Populars'];
    pKs = json['PKs'];
    myFollowers = json['MyFollowers'];
    myFollowing = json['MyFollowing'];
    myNewsfeeds = json['MyNewsfeeds'];
    myBag = json['MyBag'];
    myLevel = json['MyLevel'];
    myBadges = json['MyBadges'];
    myInvites = json['MyInvites'];
    myEarnings = json['MyEarnings'];
    countryHeads = json['CountryHeads'];
    admins = json['Admins'];
    agencies = json['Agencies'];
    hosts = json['Hosts'];
    agents = json['Agents'];
    users = json['Users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_url'] = this.baseUrl;
    if (this.settings != null) {
      data['Settings'] = this.settings!.toJson();
    }
    if (this.userTypes != null) {
      data['UserTypes'] = this.userTypes!.map((v) => v.toJson()).toList();
    }
    if (this.privacies != null) {
      data['Privacies'] = this.privacies!.map((v) => v.toJson()).toList();
    }
    data['Banners'] = this.banners;
    data['Games'] = this.games;
    if (this.countryCodes != null) {
      data['CountryCodes'] = this.countryCodes!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['Countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    if (this.provinces != null) {
      data['Provinces'] = this.provinces!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['Cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.areas != null) {
      data['Areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    if (this.locations != null) {
      data['Locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['AudioStreamCategories'] = this.audioStreamCategories;
    data['VideoStreamCategories'] = this.videoStreamCategories;
    data['NewsCategories'] = this.newsCategories;
    data['BlogCategories'] = this.blogCategories;
    data['EventsCategories'] = this.eventsCategories;
    data['NotificationCategories'] = this.notificationCategories;
    data['Stories'] = this.stories;
    data['AudioStreams'] = this.audioStreams;
    data['VideoStreams'] = this.videoStreams;
    data['Newsfeeds'] = this.newsfeeds;
    data['Events'] = this.events;
    data['Messages'] = this.messages;
    data['Notifications'] = this.notifications;
    data['Store'] = this.store;
    data['Freshers'] = this.freshers;
    data['Populars'] = this.populars;
    data['PKs'] = this.pKs;
    data['MyFollowers'] = this.myFollowers;
    data['MyFollowing'] = this.myFollowing;
    data['MyNewsfeeds'] = this.myNewsfeeds;
    data['MyBag'] = this.myBag;
    data['MyLevel'] = this.myLevel;
    data['MyBadges'] = this.myBadges;
    data['MyInvites'] = this.myInvites;
    data['MyEarnings'] = this.myEarnings;
    data['CountryHeads'] = this.countryHeads;
    data['Admins'] = this.admins;
    data['Agencies'] = this.agencies;
    data['Hosts'] = this.hosts;
    data['Agents'] = this.agents;
    data['Users'] = this.users;
    return data;
  }
}

class Settings {
  int? id;
  String? title;
  String? intro;
  var logo;
  var icon;
  String? about;
  String? aboutPage;
  String? emailAddress;
  int? phoneNumber;
  String? copyright;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  String? author;
  var thumbnail;
  String? url;
  String? countryHeadTermsAndConditions;
  String? adminTermsAndConditions;
  String? agencyTermsAndConditions;
  String? hostTermsAndConditions;
  String? agentTermsAndConditions;
  String? userTermsAndConditions;
  String? facebookLink;
  String? twitterLink;
  String? linkedinLink;
  String? instagramLink;
  String? appstoreLink;
  String? playstoreLink;
  String? status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  int? updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  String? updatedAt;
  var deletedAt;

  Settings(
      {this.id,
        this.title,
        this.intro,
        this.logo,
        this.icon,
        this.about,
        this.aboutPage,
        this.emailAddress,
        this.phoneNumber,
        this.copyright,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
        this.author,
        this.thumbnail,
        this.url,
        this.countryHeadTermsAndConditions,
        this.adminTermsAndConditions,
        this.agencyTermsAndConditions,
        this.hostTermsAndConditions,
        this.agentTermsAndConditions,
        this.userTermsAndConditions,
        this.facebookLink,
        this.twitterLink,
        this.linkedinLink,
        this.instagramLink,
        this.appstoreLink,
        this.playstoreLink,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    intro = json['intro'];
    logo = json['logo'];
    icon = json['icon'];
    about = json['about'];
    aboutPage = json['about_page'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    copyright = json['copyright'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    url = json['url'];
    countryHeadTermsAndConditions = json['country_head_terms_and_conditions'];
    adminTermsAndConditions = json['admin_terms_and_conditions'];
    agencyTermsAndConditions = json['agency_terms_and_conditions'];
    hostTermsAndConditions = json['host_terms_and_conditions'];
    agentTermsAndConditions = json['agent_terms_and_conditions'];
    userTermsAndConditions = json['user_terms_and_conditions'];
    facebookLink = json['facebook_link'];
    twitterLink = json['twitter_link'];
    linkedinLink = json['linkedin_link'];
    instagramLink = json['instagram_link'];
    appstoreLink = json['appstore_link'];
    playstoreLink = json['playstore_link'];
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
    data['title'] = this.title;
    data['intro'] = this.intro;
    data['logo'] = this.logo;
    data['icon'] = this.icon;
    data['about'] = this.about;
    data['about_page'] = this.aboutPage;
    data['email_address'] = this.emailAddress;
    data['phone_number'] = this.phoneNumber;
    data['copyright'] = this.copyright;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    data['author'] = this.author;
    data['thumbnail'] = this.thumbnail;
    data['url'] = this.url;
    data['country_head_terms_and_conditions'] =
        this.countryHeadTermsAndConditions;
    data['admin_terms_and_conditions'] = this.adminTermsAndConditions;
    data['agency_terms_and_conditions'] = this.agencyTermsAndConditions;
    data['host_terms_and_conditions'] = this.hostTermsAndConditions;
    data['agent_terms_and_conditions'] = this.agentTermsAndConditions;
    data['user_terms_and_conditions'] = this.userTermsAndConditions;
    data['facebook_link'] = this.facebookLink;
    data['twitter_link'] = this.twitterLink;
    data['linkedin_link'] = this.linkedinLink;
    data['instagram_link'] = this.instagramLink;
    data['appstore_link'] = this.appstoreLink;
    data['playstore_link'] = this.playstoreLink;
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

class UserTypes {
  int? id;
  String? title;
  String? slug;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  UserTypes(
      {this.id,
        this.title,
        this.slug,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  UserTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
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
    data['title'] = this.title;
    data['slug'] = this.slug;
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

class Privacies {
  int? id;
  String? title;
  String? slug;
  String? type;
  var icon;
  String? status;
  var orderBy;
  int? createdByCompId;
  int? createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Privacies(
      {this.id,
        this.title,
        this.slug,
        this.type,
        this.icon,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Privacies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    type = json['type'];
    icon = json['icon'];
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
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['icon'] = this.icon;
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

class CountryCodes {
  int? id;
  int? countryId;
  String? countryTitle;
  var countrySlug;
  String? countryTwoLetterCode;
  String? countryThreeLetterCode;
  var countryFlag;
  double? countryLatitude;
  double? countryLongitude;
  int? code;
  String? status;
  var orderBy;
  int? createdByCompId;
  int? createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;
  CountryCodes(
      {this.id,
        this.countryId,
        this.countryTitle,
        this.countrySlug,
        this.countryTwoLetterCode,
        this.countryThreeLetterCode,
        this.countryFlag,
        this.countryLatitude,
        this.countryLongitude,
        this.code,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CountryCodes.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    countryTitle = json['country_title'];
    countrySlug = json['country_slug'];
    countryTwoLetterCode = json['country_two_letter_code'];
    countryThreeLetterCode = json['country_three_letter_code'];
    countryFlag = json['country_flag'];
    countryLatitude = json['country_latitude'];
    countryLongitude = json['country_longitude'];
    code = json['code'];
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
    data['country_id'] = this.countryId;
    data['country_title'] = this.countryTitle;
    data['country_slug'] = this.countrySlug;
    data['country_two_letter_code'] = this.countryTwoLetterCode;
    data['country_three_letter_code'] = this.countryThreeLetterCode;
    data['country_flag'] = this.countryFlag;
    data['country_latitude'] = this.countryLatitude;
    data['country_longitude'] = this.countryLongitude;
    data['code'] = this.code;
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

class Countries {
  int? id;
  String? name;
  var slug;
  var about;
  var image;
  String? twoLetterCode;
  String? threeLetterCode;
  var flag;
  double? latitude;
  double? longitude;
  String? status;
  var orderBy;
  int? createdByCompId;
  int? createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Countries(
      {this.id,
        this.name,
        this.slug,
        this.about,
        this.image,
        this.twoLetterCode,
        this.threeLetterCode,
        this.flag,
        this.latitude,
        this.longitude,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    image = json['image'];
    twoLetterCode = json['two_letter_code'];
    threeLetterCode = json['three_letter_code'];
    flag = json['flag'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['image'] = this.image;
    data['two_letter_code'] = this.twoLetterCode;
    data['three_letter_code'] = this.threeLetterCode;
    data['flag'] = this.flag;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class Provinces {
  int? id;
  int? countryId;
  String? countryName;
  String? title;
  String? slug;
  var about;
  var image;
  var twoLetterCode;
  var latitude;
  var longitude;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Provinces(
      {this.id,
        this.countryId,
        this.countryName,
        this.title,
        this.slug,
        this.about,
        this.image,
        this.twoLetterCode,
        this.latitude,
        this.longitude,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Provinces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    title = json['title'];
    slug = json['slug'];
    about = json['about'];
    image = json['image'];
    twoLetterCode = json['two_letter_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['image'] = this.image;
    data['two_letter_code'] = this.twoLetterCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class Cities {
  int? id;
  int? provinceId;
  String? provinceTitle;
  int? countryId;
  String? name;
  String? slug;
  var about;
  var image;
  var latitude;
  var longitude;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Cities(
      {this.id,
        this.provinceId,
        this.provinceTitle,
        this.countryId,
        this.name,
        this.slug,
        this.about,
        this.image,
        this.latitude,
        this.longitude,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    provinceTitle = json['province_title'];
    countryId = json['country_id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['province_id'] = this.provinceId;
    data['province_title'] = this.provinceTitle;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['image'] = this.image;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class Areas {
  int? id;
  int? cityId;
  String? cityName;
  int? provinceId;
  String? name;
  var slug;
  var about;
  var image;
  var code;
  var latitude;
  var longitude;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Areas(
      {this.id,
        this.cityId,
        this.cityName,
        this.provinceId,
        this.name,
        this.slug,
        this.about,
        this.image,
        this.code,
        this.latitude,
        this.longitude,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    provinceId = json['province_id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    image = json['image'];
    code = json['code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['province_id'] = this.provinceId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['image'] = this.image;
    data['code'] = this.code;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class Locations {
  int? id;
  int? areaId;
  String? areaName;
  int? cityId;
  String? name;
  String? slug;
  var about;
  var image;
  var latitude;
  var longitude;
  String? status;
  var orderBy;
  var createdByCompId;
  var createdByUserId;
  var updatedByUserId;
  var deletedByUserId;
  String? createdAt;
  var updatedAt;
  var deletedAt;

  Locations(
      {this.id,
        this.areaId,
        this.areaName,
        this.cityId,
        this.name,
        this.slug,
        this.about,
        this.image,
        this.latitude,
        this.longitude,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    cityId = json['city_id'];
    name = json['name'];
    slug = json['slug'];
    about = json['about'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['about'] = this.about;
    data['image'] = this.image;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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


class NewsFeedModel {
  int? currentPage;
  List<NewsFeedData>? data;
  int? from;
  int? lastPage;
  var nextPageUrl;
  var path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  NewsFeedModel(
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

  NewsFeedModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <NewsFeedData>[];
      json['data'].forEach((v) {
        data!.add(new NewsFeedData.fromJson(v));
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

class NewsFeedData {
  int? id;
  int? privacyId;
  var privacyTitle;
  var description;
  var thumbnail;
  var video;
  var type;
  int? noOfLikes;
  int? noOfComments;
  int? noOfShares;
  int? noOfRepost;
  var status;
  var orderBy;
  var createdByCompId;
  int? createdByUserId;
  var userFullName;
  var userImage;
  var userUsername;
  var userAbout;
  var userHeadline;
  var updatedByUserId;
  var deletedByUserId;
  var createdAt;
  var updatedAt;
  var deletedAt;
  bool? isLike;
  bool? isComment;
  bool? isSave;
  bool? isShare;
  bool? isRepost;
  Likes? likes;
  Likes? comments;
  Likes? saves;

  NewsFeedData(
      {this.id,
        this.privacyId,
        this.privacyTitle,
        this.description,
        this.thumbnail,
        this.video,
        this.type,
        this.noOfLikes,
        this.noOfComments,
        this.noOfShares,
        this.noOfRepost,
        this.status,
        this.orderBy,
        this.createdByCompId,
        this.createdByUserId,
        this.userFullName,
        this.userImage,
        this.userUsername,
        this.userAbout,
        this.userHeadline,
        this.updatedByUserId,
        this.deletedByUserId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isLike,
        this.isComment,
        this.isSave,
        this.isShare,
        this.isRepost,
        this.likes,
        this.comments,
        this.saves});

  NewsFeedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    privacyId = json['privacy_id'];
    privacyTitle = json['privacy_title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    video = json['video'];
    type = json['type'];
    noOfLikes = json['no_of_likes'];
    noOfComments = json['no_of_comments'];
    noOfShares = json['no_of_shares'];
    noOfRepost = json['no_of_repost'];
    status = json['status'];
    orderBy = json['order_by'];
    createdByCompId = json['created_by_comp_id'];
    createdByUserId = json['created_by_user_id'];
    userFullName = json['user_full_name'];
    userImage = json['user_image'];
    userUsername = json['user_username'];
    userAbout = json['user_about'];
    userHeadline = json['user_headline'];
    updatedByUserId = json['updated_by_user_id'];
    deletedByUserId = json['deleted_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isLike = json['is_like'];
    isComment = json['is_comment'];
    isSave = json['is_save'];
    isShare = json['is_share'];
    isRepost = json['is_repost'];
    likes = json['Likes'] != null ? new Likes.fromJson(json['Likes']) : null;
    comments =
    json['Comments'] != null ? new Likes.fromJson(json['Comments']) : null;
    saves = json['Saves'] != null ? new Likes.fromJson(json['Saves']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['privacy_id'] = this.privacyId;
    data['privacy_title'] = this.privacyTitle;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['video'] = this.video;
    data['type'] = this.type;
    data['no_of_likes'] = this.noOfLikes;
    data['no_of_comments'] = this.noOfComments;
    data['no_of_shares'] = this.noOfShares;
    data['no_of_repost'] = this.noOfRepost;
    data['status'] = this.status;
    data['order_by'] = this.orderBy;
    data['created_by_comp_id'] = this.createdByCompId;
    data['created_by_user_id'] = this.createdByUserId;
    data['user_full_name'] = this.userFullName;
    data['user_image'] = this.userImage;
    data['user_username'] = this.userUsername;
    data['user_about'] = this.userAbout;
    data['user_headline'] = this.userHeadline;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_by_user_id'] = this.deletedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_like'] = this.isLike;
    data['is_comment'] = this.isComment;
    data['is_save'] = this.isSave;
    data['is_share'] = this.isShare;
    data['is_repost'] = this.isRepost;
    if (this.likes != null) {
      data['Likes'] = this.likes!.toJson();
    }
    if (this.comments != null) {
      data['Comments'] = this.comments!.toJson();
    }
    if (this.saves != null) {
      data['Saves'] = this.saves!.toJson();
    }
    return data;
  }
}

class Likes {
  int? currentPage;
  List<String>? data;
  var firstPageUrl;
  var from;
  int? lastPage;
  var lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  var path;
  int? perPage;
  var prevPageUrl;
  var to;
  int? total;

  Likes(
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

  Likes.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <String>[];
      json['data'].forEach((v) {
        // data!.add(new Null.fromJson(v));
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
      // data['data'] = this.data!.map((v) => v.toJson()).toList();
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


