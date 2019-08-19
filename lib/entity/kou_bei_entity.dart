///
/// @created by 文景睿
/// description:一周口碑榜数据
///

class KouBeiEntity {
  List<KouBeiSubject> subjects;
  String title;

  KouBeiEntity({this.subjects, this.title});

  KouBeiEntity.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = new List<KouBeiSubject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new KouBeiSubject.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class KouBeiSubject {
  KouBeiSubjectsSubject subject;
  int delta;
  int rank;

  KouBeiSubject({this.subject, this.delta, this.rank});

  KouBeiSubject.fromJson(Map<String, dynamic> json) {
    subject = json['subject'] != null
        ? new KouBeiSubjectsSubject.fromJson(json['subject'])
        : null;
    delta = json['delta'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['delta'] = this.delta;
    data['rank'] = this.rank;
    return data;
  }
}

class KouBeiSubjectsSubject {
  KouBeiSubjectsSubjectImages images;
  String originalTitle;
  String year;
  List<KouBeiSubjectsSubjectDirector> directors;
  KouBeiSubjectsSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<KouBeiSubjectsSubjectCast> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  KouBeiSubjectsSubject(
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

  KouBeiSubjectsSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new KouBeiSubjectsSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<KouBeiSubjectsSubjectDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new KouBeiSubjectsSubjectDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new KouBeiSubjectsSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<KouBeiSubjectsSubjectCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new KouBeiSubjectsSubjectCast.fromJson(v));
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

class KouBeiSubjectsSubjectImages {
  String small;
  String large;
  String medium;

  KouBeiSubjectsSubjectImages({this.small, this.large, this.medium});

  KouBeiSubjectsSubjectImages.fromJson(Map<String, dynamic> json) {
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

class KouBeiSubjectsSubjectDirector {
  String name;
  String alt;
  String id;
  KouBeiSubjectsSubjectDirectorsAvatars avatars;
  String nameEn;

  KouBeiSubjectsSubjectDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  KouBeiSubjectsSubjectDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new KouBeiSubjectsSubjectDirectorsAvatars.fromJson(json['avatars'])
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

class KouBeiSubjectsSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  KouBeiSubjectsSubjectDirectorsAvatars({this.small, this.large, this.medium});

  KouBeiSubjectsSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class KouBeiSubjectsSubjectRating {
  double average;
  int min;
  int max;
  KouBeiSubjectsSubjectRatingDetails details;
  String stars;

  KouBeiSubjectsSubjectRating(
      {this.average, this.min, this.max, this.details, this.stars});

  KouBeiSubjectsSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new KouBeiSubjectsSubjectRatingDetails.fromJson(json['details'])
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

class KouBeiSubjectsSubjectRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  KouBeiSubjectsSubjectRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  KouBeiSubjectsSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
    one = json['1'];
    two = json['2'];
    three = json['3'];
    four = json['4'];
    five = json['5'];
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

class KouBeiSubjectsSubjectCast {
  String name;
  String alt;
  String id;
  KouBeiSubjectsSubjectCastsAvatars avatars;
  String nameEn;

  KouBeiSubjectsSubjectCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  KouBeiSubjectsSubjectCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new KouBeiSubjectsSubjectCastsAvatars.fromJson(json['avatars'])
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

class KouBeiSubjectsSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  KouBeiSubjectsSubjectCastsAvatars({this.small, this.large, this.medium});

  KouBeiSubjectsSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
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
