class CelebrityEntity {
  String summary;
  String birthday;
  String website;
  List<CelebrityWork> works;
  String gender;
  List<String> akaEn;
  String bornPlace;
  String mobileUrl;
  List<String> professions;
  String alt;
  List<CelebrityPhoto> photos;
  String constellation;
  List<String> aka;
  String name;
  String id;
  String nameEn;
  CelebrityAvatars avatars;

  CelebrityEntity(
      {this.summary,
      this.birthday,
      this.website,
      this.works,
      this.gender,
      this.akaEn,
      this.bornPlace,
      this.mobileUrl,
      this.professions,
      this.alt,
      this.photos,
      this.constellation,
      this.aka,
      this.name,
      this.id,
      this.nameEn,
      this.avatars});

  CelebrityEntity.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    birthday = json['birthday'];
    website = json['website'];
    if (json['works'] != null) {
      works = new List<CelebrityWork>();
      (json['works'] as List).forEach((v) {
        works.add(new CelebrityWork.fromJson(v));
      });
    }
    gender = json['gender'];
    akaEn = json['aka_en']?.cast<String>();
    bornPlace = json['born_place'];
    mobileUrl = json['mobile_url'];
    professions = json['professions']?.cast<String>();
    alt = json['alt'];
    if (json['photos'] != null) {
      photos = new List<CelebrityPhoto>();
      (json['photos'] as List).forEach((v) {
        photos.add(new CelebrityPhoto.fromJson(v));
      });
    }
    constellation = json['constellation'];
    aka = json['aka']?.cast<String>();
    name = json['name'];
    id = json['id'];
    nameEn = json['name_en'];
    avatars = json['avatars'] != null
        ? new CelebrityAvatars.fromJson(json['avatars'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['birthday'] = this.birthday;
    data['website'] = this.website;
    if (this.works != null) {
      data['works'] = this.works.map((v) => v.toJson()).toList();
    }
    data['gender'] = this.gender;
    data['aka_en'] = this.akaEn;
    data['born_place'] = this.bornPlace;
    data['mobile_url'] = this.mobileUrl;
    data['professions'] = this.professions;
    data['alt'] = this.alt;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['constellation'] = this.constellation;
    data['aka'] = this.aka;
    data['name'] = this.name;
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class CelebrityWork {
  CelebrityWorksSubject subject;
  List<String> roles;

  CelebrityWork({this.subject, this.roles});

  CelebrityWork.fromJson(Map<String, dynamic> json) {
    subject = json['subject'] != null
        ? new CelebrityWorksSubject.fromJson(json['subject'])
        : null;
    roles = json['roles']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['roles'] = this.roles;
    return data;
  }
}

class CelebrityWorksSubject {
  CelebrityWorksSubjectImages images;
  String originalTitle;
  String year;
  List<CelebrityWorksSubjectDirector> directors;
  CelebrityWorksSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<CelebrityWorksSubjectCast> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  CelebrityWorksSubject(
      {this.images,
      this.originalTitle,
      this.year,
      this.directors,
      this.rating,
      this.alt,
      this.title,
      this.collectCount,
      this.hasVideo,
      this.pubdates,
      this.casts,
      this.subtype,
      this.genres,
      this.durations,
      this.mainlandPubdate,
      this.id});

  CelebrityWorksSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new CelebrityWorksSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<CelebrityWorksSubjectDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new CelebrityWorksSubjectDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new CelebrityWorksSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<CelebrityWorksSubjectCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new CelebrityWorksSubjectCast.fromJson(v));
      });
    }
    subtype = json['subtype'];
    genres = json['genres']?.cast<String>();
    durations = json['durations']?.cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['original_title'] = this.originalTitle;
    data['year'] = this.year;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['title'] = this.title;
    data['collect_count'] = this.collectCount;
    data['has_video'] = this.hasVideo;
    data['pubdates'] = this.pubdates;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['durations'] = this.durations;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['id'] = this.id;
    return data;
  }
}

class CelebrityWorksSubjectImages {
  String small;
  String large;
  String medium;

  CelebrityWorksSubjectImages({this.small, this.large, this.medium});

  CelebrityWorksSubjectImages.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class CelebrityWorksSubjectDirector {
  String name;
  String alt;
  String id;
  CelebrityWorksSubjectDirectorsAvatars avatars;
  String nameEn;

  CelebrityWorksSubjectDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CelebrityWorksSubjectDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CelebrityWorksSubjectDirectorsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class CelebrityWorksSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  CelebrityWorksSubjectDirectorsAvatars({this.small, this.large, this.medium});

  CelebrityWorksSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class CelebrityWorksSubjectRating {
  double average;
  int min;
  int max;
  CelebrityWorksSubjectRatingDetails details;
  String stars;

  CelebrityWorksSubjectRating(
      {this.average, this.min, this.max, this.details, this.stars});

  CelebrityWorksSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new CelebrityWorksSubjectRatingDetails.fromJson(json['details'])
        : null;
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['min'] = this.min;
    data['max'] = this.max;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['stars'] = this.stars;
    return data;
  }
}

class CelebrityWorksSubjectRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  CelebrityWorksSubjectRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  CelebrityWorksSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
    one = json['one'];
    two = json['two'];
    three = json['three'];
    four = json['four'];
    five = json['five'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['one'] = this.one;
    data['two'] = this.two;
    data['three'] = this.three;
    data['four'] = this.four;
    data['five'] = this.five;
    return data;
  }
}

class CelebrityWorksSubjectCast {
  String name;
  String alt;
  String id;
  CelebrityWorksSubjectCastsAvatars avatars;
  String nameEn;

  CelebrityWorksSubjectCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CelebrityWorksSubjectCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CelebrityWorksSubjectCastsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class CelebrityWorksSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  CelebrityWorksSubjectCastsAvatars({this.small, this.large, this.medium});

  CelebrityWorksSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class CelebrityPhoto {
  String cover;
  String image;
  String thumb;
  String alt;
  String icon;
  String id;

  CelebrityPhoto(
      {this.cover, this.image, this.thumb, this.alt, this.icon, this.id});

  CelebrityPhoto.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    image = json['image'];
    thumb = json['thumb'];
    alt = json['alt'];
    icon = json['icon'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    data['alt'] = this.alt;
    data['icon'] = this.icon;
    data['id'] = this.id;
    return data;
  }
}

class CelebrityAvatars {
  String small;
  String large;
  String medium;

  CelebrityAvatars({this.small, this.large, this.medium});

  CelebrityAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}
