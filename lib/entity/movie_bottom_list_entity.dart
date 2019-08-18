class MovieBottomListEntity {
  int total;
  List<MovieBottomListSubject> subjects;
  int count;
  int start;
  String title;

  MovieBottomListEntity(
      {this.total, this.subjects, this.count, this.start, this.title});

  MovieBottomListEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = new List<MovieBottomListSubject>();
      (json['subjects'] as List).forEach((v) {
        subjects.add(new MovieBottomListSubject.fromJson(v));
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

class MovieBottomListSubject {
  MovieBottomListSubjectsImages images;
  List<MovieBottomListSubjectsCast> casts;
  String originalTitle;
  String subtype;
  String year;
  List<String> genres;
  List<MovieBottomListSubjectsDirector> directors;
  MovieBottomListSubjectsRating rating;
  String alt;
  String id;
  String title;
  int collectCount;

  MovieBottomListSubject(
      {this.images,
      this.casts,
      this.originalTitle,
      this.subtype,
      this.year,
      this.genres,
      this.directors,
      this.rating,
      this.alt,
      this.id,
      this.title,
      this.collectCount});

  MovieBottomListSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new MovieBottomListSubjectsImages.fromJson(json['images'])
        : null;
    if (json['casts'] != null) {
      casts = new List<MovieBottomListSubjectsCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new MovieBottomListSubjectsCast.fromJson(v));
      });
    }
    originalTitle = json['original_title'];
    subtype = json['subtype'];
    year = json['year'];
    genres = json['genres']?.cast<String>();
    if (json['directors'] != null) {
      directors = new List<MovieBottomListSubjectsDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new MovieBottomListSubjectsDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new MovieBottomListSubjectsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    id = json['id'];
    title = json['title'];
    collectCount = json['collect_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['original_title'] = this.originalTitle;
    data['subtype'] = this.subtype;
    data['year'] = this.year;
    data['genres'] = this.genres;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['title'] = this.title;
    data['collect_count'] = this.collectCount;
    return data;
  }
}

class MovieBottomListSubjectsImages {
  String small;
  String large;
  String medium;

  MovieBottomListSubjectsImages({this.small, this.large, this.medium});

  MovieBottomListSubjectsImages.fromJson(Map<String, dynamic> json) {
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

class MovieBottomListSubjectsCast {
  String alt;
  String name;
  String id;
  MovieBottomListSubjectsCastsAvatars avatars;

  MovieBottomListSubjectsCast({this.alt, this.name, this.id, this.avatars});

  MovieBottomListSubjectsCast.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    name = json['name'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieBottomListSubjectsCastsAvatars.fromJson(json['avatars'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class MovieBottomListSubjectsCastsAvatars {
  String small;
  String large;
  String medium;

  MovieBottomListSubjectsCastsAvatars({this.small, this.large, this.medium});

  MovieBottomListSubjectsCastsAvatars.fromJson(Map<String, dynamic> json) {
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

class MovieBottomListSubjectsDirector {
  String alt;
  String name;
  String id;
  MovieBottomListSubjectsDirectorsAvatars avatars;

  MovieBottomListSubjectsDirector({this.alt, this.name, this.id, this.avatars});

  MovieBottomListSubjectsDirector.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    name = json['name'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieBottomListSubjectsDirectorsAvatars.fromJson(json['avatars'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    return data;
  }
}

class MovieBottomListSubjectsDirectorsAvatars {
  String small;
  String large;
  String medium;

  MovieBottomListSubjectsDirectorsAvatars(
      {this.small, this.large, this.medium});

  MovieBottomListSubjectsDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class MovieBottomListSubjectsRating {
  double average;
  int min;
  int max;
  String stars;

  MovieBottomListSubjectsRating({this.average, this.min, this.max, this.stars});

  MovieBottomListSubjectsRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['min'] = this.min;
    data['max'] = this.max;
    data['stars'] = this.stars;
    return data;
  }
}
