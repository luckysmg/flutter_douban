class DouBanHotMoviesEntity {
  List<DouBanHotMoviesSubject> subjects;
  String title;

  DouBanHotMoviesEntity({this.subjects, this.title});

  DouBanHotMoviesEntity.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = new List<DouBanHotMoviesSubject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new DouBanHotMoviesSubject.fromJson(v));
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

class DouBanHotMoviesSubject {
  DouBanHotMoviesSubjectsImages images;
  String originalTitle;
  String year;
  List<DouBanHotMoviesSubjectsDirector> directors;
  DouBanHotMoviesSubjectsRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<DouBanHotMoviesSubjectsCast> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  DouBanHotMoviesSubject(
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

  DouBanHotMoviesSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new DouBanHotMoviesSubjectsImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<DouBanHotMoviesSubjectsDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new DouBanHotMoviesSubjectsDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new DouBanHotMoviesSubjectsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<DouBanHotMoviesSubjectsCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new DouBanHotMoviesSubjectsCast.fromJson(v));
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

class DouBanHotMoviesSubjectsImages {
  String small;
  String large;
  String medium;

  DouBanHotMoviesSubjectsImages({this.small, this.large, this.medium});

  DouBanHotMoviesSubjectsImages.fromJson(Map<String, dynamic> json) {
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

class DouBanHotMoviesSubjectsDirector {
  String name;
  String alt;
  String id;
  DouBanHotMoviesSubjectsDirectorsAvatars avatars;
  String nameEn;

  DouBanHotMoviesSubjectsDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  DouBanHotMoviesSubjectsDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new DouBanHotMoviesSubjectsDirectorsAvatars.fromJson(json['avatars'])
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

class DouBanHotMoviesSubjectsDirectorsAvatars {
  String small;
  String large;
  String medium;

  DouBanHotMoviesSubjectsDirectorsAvatars(
      {this.small, this.large, this.medium});

  DouBanHotMoviesSubjectsDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class DouBanHotMoviesSubjectsRating {
  double average;
  int min;
  int max;
  DouBanHotMoviesSubjectsRatingDetails details;
  String stars;

  DouBanHotMoviesSubjectsRating(
      {this.average, this.min, this.max, this.details, this.stars});

  DouBanHotMoviesSubjectsRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new DouBanHotMoviesSubjectsRatingDetails.fromJson(json['details'])
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

class DouBanHotMoviesSubjectsRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  DouBanHotMoviesSubjectsRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  DouBanHotMoviesSubjectsRatingDetails.fromJson(Map<String, dynamic> json) {
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

class DouBanHotMoviesSubjectsCast {
  String name;
  String alt;
  String id;
  DouBanHotMoviesSubjectsCastsAvatars avatars;
  String nameEn;

  DouBanHotMoviesSubjectsCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  DouBanHotMoviesSubjectsCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new DouBanHotMoviesSubjectsCastsAvatars.fromJson(json['avatars'])
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

class DouBanHotMoviesSubjectsCastsAvatars {
  String small;
  String large;
  String medium;

  DouBanHotMoviesSubjectsCastsAvatars({this.small, this.large, this.medium});

  DouBanHotMoviesSubjectsCastsAvatars.fromJson(Map<String, dynamic> json) {
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
