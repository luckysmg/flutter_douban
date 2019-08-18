///
/// @created by 文景睿
/// description:口碑榜
///

class ComingSoonEntity {
  int total;
  List<ComingSoonSubject> subjects;
  int count;
  int start;
  String title;

  ComingSoonEntity(
      {this.total, this.subjects, this.count, this.start, this.title});

  ComingSoonEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = new List<ComingSoonSubject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new ComingSoonSubject.fromJson(v));
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

class ComingSoonSubject {
  ComingSoonSubjectsImages images;
  String originalTitle;
  String year;
  List<ComingSoonSubjectsDirector> directors;
  ComingSoonSubjectsRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<Null> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  ComingSoonSubject(
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

  ComingSoonSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new ComingSoonSubjectsImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<ComingSoonSubjectsDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new ComingSoonSubjectsDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new ComingSoonSubjectsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<Null>();
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
      data['casts'] = [];
    }
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['durations'] = this.durations;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['id'] = this.id;
    return data;
  }
}

class ComingSoonSubjectsImages {
  String small;
  String large;
  String medium;

  ComingSoonSubjectsImages({this.small, this.large, this.medium});

  ComingSoonSubjectsImages.fromJson(Map<String, dynamic> json) {
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

class ComingSoonSubjectsDirector {
  String name;
  dynamic alt;
  dynamic id;
  dynamic avatars;
  String nameEn;

  ComingSoonSubjectsDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  ComingSoonSubjectsDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['avatars'] = this.avatars;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class ComingSoonSubjectsRating {
  dynamic average;
  int min;
  int max;
  ComingSoonSubjectsRatingDetails details;
  String stars;

  ComingSoonSubjectsRating(
      {this.average, this.min, this.max, this.details, this.stars});

  ComingSoonSubjectsRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new ComingSoonSubjectsRatingDetails.fromJson(json['details'])
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

class ComingSoonSubjectsRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  ComingSoonSubjectsRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  ComingSoonSubjectsRatingDetails.fromJson(Map<String, dynamic> json) {
    this.one = json['one'];
    this.three = json['three'];
    this.two = json['two'];
    this.five = json['five'];
    this.four = json['four'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['one'] = this.one;
    data['three'] = this.three;
    data['two'] = this.two;
    data['five'] = this.five;
    data['four'] = this.four;
    return data;
  }
}
