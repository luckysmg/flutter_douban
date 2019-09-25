class Top250Entity {
  int total;
  List<Top250Subject> subjects;
  int count;
  int start;
  String title;

  Top250Entity({this.total, this.subjects, this.count, this.start, this.title});

  Top250Entity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = new List<Top250Subject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new Top250Subject.fromJson(v));
      });
    }
    count = json['count'];
    start = json['start'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['start'] = this.start;
    data['title'] = this.title;
    return data;
  }
}

class Top250Subject {
  Top250SubjectsImages images;
  String originalTitle;
  String year;
  List<Top250SubjectsDirector> directors;
  Top250SubjectsRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<Top250SubjectsCast> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  Top250Subject(
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

  Top250Subject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new Top250SubjectsImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<Top250SubjectsDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new Top250SubjectsDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new Top250SubjectsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<Top250SubjectsCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new Top250SubjectsCast.fromJson(v));
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

class Top250SubjectsImages {
  String small;
  String large;
  String medium;

  Top250SubjectsImages({this.small, this.large, this.medium});

  Top250SubjectsImages.fromJson(Map<String, dynamic> json) {
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

class Top250SubjectsDirector {
  String name;
  String alt;
  String id;
  Top250SubjectsDirectorsAvatars avatars;
  String nameEn;

  Top250SubjectsDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  Top250SubjectsDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new Top250SubjectsDirectorsAvatars.fromJson(json['avatars'])
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

class Top250SubjectsDirectorsAvatars {
  String small;
  String large;
  String medium;

  Top250SubjectsDirectorsAvatars({this.small, this.large, this.medium});

  Top250SubjectsDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class Top250SubjectsRating {
  double average;
  int min;
  int max;
  Top250SubjectsRatingDetails details;
  String stars;

  Top250SubjectsRating(
      {this.average, this.min, this.max, this.details, this.stars});

  Top250SubjectsRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new Top250SubjectsRatingDetails.fromJson(json['details'])
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

class Top250SubjectsRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  Top250SubjectsRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  Top250SubjectsRatingDetails.fromJson(Map<String, dynamic> json) {
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

class Top250SubjectsCast {
  String name;
  String alt;
  String id;
  Top250SubjectsCastsAvatars avatars;
  String nameEn;

  Top250SubjectsCast({this.name, this.alt, this.id, this.avatars, this.nameEn});

  Top250SubjectsCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new Top250SubjectsCastsAvatars.fromJson(json['avatars'])
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

class Top250SubjectsCastsAvatars {
  String small;
  String large;
  String medium;

  Top250SubjectsCastsAvatars({this.small, this.large, this.medium});

  Top250SubjectsCastsAvatars.fromJson(Map<String, dynamic> json) {
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
