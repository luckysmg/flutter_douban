class CommentEntity {
  int total;
  List<CommantCommants> comments;
  int nextStart;
  CommentSubject subject;
  int count;
  int start;

  CommentEntity(
      {this.total,
      this.comments,
      this.nextStart,
      this.subject,
      this.count,
      this.start});

  CommentEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['comments'] != null) {
      comments = new List<CommantCommants>();
      (json['comments'] as List).forEach((v) {
        comments.add(new CommantCommants.fromJson(v));
      });
    }
    nextStart = json['next_start'];
    subject = json['subject'] != null
        ? new CommentSubject.fromJson(json['subject'])
        : null;
    count = json['count'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['next_start'] = this.nextStart;
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['count'] = this.count;
    data['start'] = this.start;
    return data;
  }
}

class CommantCommants {
  String subjectId;
  CommentCommentsAuthor author;
  CommentCommentsRating rating;
  String createdAt;
  String id;
  int usefulCount;
  String content;

  CommantCommants(
      {this.subjectId,
      this.author,
      this.rating,
      this.createdAt,
      this.id,
      this.usefulCount,
      this.content});

  CommantCommants.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    author = json['author'] != null
        ? new CommentCommentsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new CommentCommentsRating.fromJson(json['rating'])
        : null;
    createdAt = json['created_at'];
    id = json['id'];
    usefulCount = json['useful_count'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['useful_count'] = this.usefulCount;
    data['content'] = this.content;
    return data;
  }
}

class CommentCommentsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  CommentCommentsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  CommentCommentsAuthor.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    signature = json['signature'];
    alt = json['alt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['signature'] = this.signature;
    data['alt'] = this.alt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}

class CommentCommentsRating {
  int min;
  int max;
  double value;

  CommentCommentsRating({this.min, this.max, this.value});

  CommentCommentsRating.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    data['value'] = this.value;
    return data;
  }
}

class CommentSubject {
  CommentSubjectImages images;
  String originalTitle;
  String year;
  List<CommantSubjectDirectors> directors;
  CommentSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<CommantSubjectCasts> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  CommentSubject(
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

  CommentSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new CommentSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<CommantSubjectDirectors>();
      (json['directors'] as List).forEach((v) {
        directors.add(new CommantSubjectDirectors.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new CommentSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<CommantSubjectCasts>();
      (json['casts'] as List).forEach((v) {
        casts.add(new CommantSubjectCasts.fromJson(v));
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

class CommentSubjectImages {
  String small;
  String large;
  String medium;

  CommentSubjectImages({this.small, this.large, this.medium});

  CommentSubjectImages.fromJson(Map<String, dynamic> json) {
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

class CommantSubjectDirectors {
  String name;
  String alt;
  String id;
  CommentSubjectDirectorsAvatars avatars;
  String nameEn;

  CommantSubjectDirectors(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CommantSubjectDirectors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CommentSubjectDirectorsAvatars.fromJson(json['avatars'])
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

class CommentSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  CommentSubjectDirectorsAvatars({this.small, this.large, this.medium});

  CommentSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class CommentSubjectRating {
  double average;
  int min;
  int max;
  CommentSubjectRatingDetails details;
  String stars;

  CommentSubjectRating(
      {this.average, this.min, this.max, this.details, this.stars});

  CommentSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new CommentSubjectRatingDetails.fromJson(json['details'])
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

class CommentSubjectRatingDetails {
  double one;
  double two;
  double three;
  double four;
  double five;

  CommentSubjectRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  CommentSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
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

class CommantSubjectCasts {
  String name;
  String alt;
  String id;
  CommentSubjectCastsAvatars avatars;
  String nameEn;

  CommantSubjectCasts(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  CommantSubjectCasts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new CommentSubjectCastsAvatars.fromJson(json['avatars'])
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

class CommentSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  CommentSubjectCastsAvatars({this.small, this.large, this.medium});

  CommentSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
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
