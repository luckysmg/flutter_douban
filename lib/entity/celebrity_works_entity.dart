class CelebrityWorksEntity {
  CelebrityWorksCelebrity celebrity;
  int total;
  List<CelebrityWorksWork> works;
  int count;
  int start;

  CelebrityWorksEntity(
      {this.celebrity, this.total, this.works, this.count, this.start});

  CelebrityWorksEntity.fromJson(Map<String, dynamic> json) {
    celebrity = json['celebrity'] != null
        ? new CelebrityWorksCelebrity.fromJson(json['celebrity'])
        : null;
    total = json['total'];
    if (json['works'] != null) {
      works = new List<CelebrityWorksWork>();
      (json['works'] as List).forEach((v) {
        works.add(new CelebrityWorksWork.fromJson(v));
      });
    }
    count = json['count'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.celebrity != null) {
      data['celebrity'] = this.celebrity.toJson();
    }
    data['total'] = this.total;
    if (this.works != null) {
      data['works'] = this.works.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['start'] = this.start;
    return data;
  }
}

class CelebrityWorksCelebrity {
  String name;
  String alt;
  String id;
  CelebrityWorksCelebrityAvatars avatars;
  String nameEn;

  CelebrityWorksCelebrity(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CelebrityWorksCelebrity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CelebrityWorksCelebrityAvatars.fromJson(json['avatars'])
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

class CelebrityWorksCelebrityAvatars {
  String small;
  String large;
  String medium;

  CelebrityWorksCelebrityAvatars({this.small, this.large, this.medium});

  CelebrityWorksCelebrityAvatars.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorksWork {
  CelebrityWorksWorksSubject subject;
  List<String> roles;

  CelebrityWorksWork({this.subject, this.roles});

  CelebrityWorksWork.fromJson(Map<String, dynamic> json) {
    subject = json['subject'] != null
        ? new CelebrityWorksWorksSubject.fromJson(json['subject'])
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

class CelebrityWorksWorksSubject {
  CelebrityWorksWorksSubjectImages images;
  String originalTitle;
  String year;
  List<CelebrityWorksWorksSubjectDirector> directors;
  CelebrityWorksWorksSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<Null> pubdates;
  List<CelebrityWorksWorksSubjectCast> casts;
  String subtype;
  List<String> genres;
  List<Null> durations;
  String mainlandPubdate;
  String id;

  CelebrityWorksWorksSubject(
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

  CelebrityWorksWorksSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new CelebrityWorksWorksSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<CelebrityWorksWorksSubjectDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new CelebrityWorksWorksSubjectDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new CelebrityWorksWorksSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    if (json['pubdates'] != null) {
      pubdates = new List<Null>();
    }
    if (json['casts'] != null) {
      casts = new List<CelebrityWorksWorksSubjectCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new CelebrityWorksWorksSubjectCast.fromJson(v));
      });
    }
    subtype = json['subtype'];
    genres = json['genres']?.cast<String>();
    if (json['durations'] != null) {
      durations = new List<Null>();
    }
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
    if (this.pubdates != null) {
      data['pubdates'] = [];
    }
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    if (this.durations != null) {
      data['durations'] = [];
    }
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['id'] = this.id;
    return data;
  }
}

class CelebrityWorksWorksSubjectImages {
  String small;
  String large;
  String medium;

  CelebrityWorksWorksSubjectImages({this.small, this.large, this.medium});

  CelebrityWorksWorksSubjectImages.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorksWorksSubjectDirector {
  String name;
  String alt;
  String id;
  CelebrityWorksWorksSubjectDirectorsAvatars avatars;
  String nameEn;

  CelebrityWorksWorksSubjectDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CelebrityWorksWorksSubjectDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CelebrityWorksWorksSubjectDirectorsAvatars.fromJson(
            json['avatars'])
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

class CelebrityWorksWorksSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  CelebrityWorksWorksSubjectDirectorsAvatars(
      {this.small, this.large, this.medium});

  CelebrityWorksWorksSubjectDirectorsAvatars.fromJson(
      Map<String, dynamic> json) {
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

class CelebrityWorksWorksSubjectRating {
  dynamic average;
  int min;
  int max;
  CelebrityWorksWorksSubjectRatingDetails details;
  String stars;

  CelebrityWorksWorksSubjectRating(
      {this.average, this.min, this.max, this.details, this.stars});

  CelebrityWorksWorksSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new CelebrityWorksWorksSubjectRatingDetails.fromJson(json['details'])
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

class CelebrityWorksWorksSubjectRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  CelebrityWorksWorksSubjectRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  CelebrityWorksWorksSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorksWorksSubjectCast {
  String name;
  String alt;
  String id;
  CelebrityWorksWorksSubjectCastsAvatars avatars;
  String nameEn;

  CelebrityWorksWorksSubjectCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CelebrityWorksWorksSubjectCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CelebrityWorksWorksSubjectCastsAvatars.fromJson(json['avatars'])
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

class CelebrityWorksWorksSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  CelebrityWorksWorksSubjectCastsAvatars({this.small, this.large, this.medium});

  CelebrityWorksWorksSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
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
