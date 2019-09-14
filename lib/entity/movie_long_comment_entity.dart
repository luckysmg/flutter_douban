class MovieLongCommentEntity {
  int total;
  int nextStart;
  List<MovieLongCommantReviews> reviews;
  MovieLongCommentSubject subject;
  int count;
  int start;

  MovieLongCommentEntity(
      {this.total,
      this.nextStart,
      this.reviews,
      this.subject,
      this.count,
      this.start});

  MovieLongCommentEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    nextStart = json['next_start'];
    if (json['reviews'] != null) {
      reviews = new List<MovieLongCommantReviews>();
      (json['reviews'] as List).forEach((v) {
        reviews.add(new MovieLongCommantReviews.fromJson(v));
      });
    }
    subject = json['subject'] != null
        ? new MovieLongCommentSubject.fromJson(json['subject'])
        : null;
    count = json['count'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['next_start'] = this.nextStart;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['count'] = this.count;
    data['start'] = this.start;
    return data;
  }
}

class MovieLongCommantReviews {
  String summary;
  String subjectId;
  MovieLongCommentReviewsAuthor author;
  MovieLongCommentReviewsRating rating;
  String alt;
  String createdAt;
  String title;
  int uselessCount;
  String content;
  String updatedAt;
  String shareUrl;
  int commentsCount;
  String id;
  int usefulCount;

  MovieLongCommantReviews(
      {this.summary,
      this.subjectId,
      this.author,
      this.rating,
      this.alt,
      this.createdAt,
      this.title,
      this.uselessCount,
      this.content,
      this.updatedAt,
      this.shareUrl,
      this.commentsCount,
      this.id,
      this.usefulCount});

  MovieLongCommantReviews.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];
    subjectId = json['subject_id'];
    author = json['author'] != null
        ? new MovieLongCommentReviewsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new MovieLongCommentReviewsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    createdAt = json['created_at'];
    title = json['title'];
    uselessCount = json['useless_count'];
    content = json['content'];
    updatedAt = json['updated_at'];
    shareUrl = json['share_url'];
    commentsCount = json['comments_count'];
    id = json['id'];
    usefulCount = json['useful_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summary'] = this.summary;
    data['subject_id'] = this.subjectId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['created_at'] = this.createdAt;
    data['title'] = this.title;
    data['useless_count'] = this.uselessCount;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['share_url'] = this.shareUrl;
    data['comments_count'] = this.commentsCount;
    data['id'] = this.id;
    data['useful_count'] = this.usefulCount;
    return data;
  }
}

class MovieLongCommentReviewsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  MovieLongCommentReviewsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  MovieLongCommentReviewsAuthor.fromJson(Map<String, dynamic> json) {
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

class MovieLongCommentReviewsRating {
  int min;
  int max;
  dynamic value;

  MovieLongCommentReviewsRating({this.min, this.max, this.value});

  MovieLongCommentReviewsRating.fromJson(Map<String, dynamic> json) {
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

class MovieLongCommentSubject {
  MovieLongCommentSubjectImages images;
  String originalTitle;
  String year;
  List<MovieLongCommantSubjectDirectors> directors;
  MovieLongCommentSubjectRating rating;
  String alt;
  String title;
  int collectCount;
  bool hasVideo;
  List<String> pubdates;
  List<MovieLongCommantSubjectCasts> casts;
  String subtype;
  List<String> genres;
  List<String> durations;
  String mainlandPubdate;
  String id;

  MovieLongCommentSubject(
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

  MovieLongCommentSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new MovieLongCommentSubjectImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      directors = new List<MovieLongCommantSubjectDirectors>();
      (json['directors'] as List).forEach((v) {
        directors.add(new MovieLongCommantSubjectDirectors.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new MovieLongCommentSubjectRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates']?.cast<String>();
    if (json['casts'] != null) {
      casts = new List<MovieLongCommantSubjectCasts>();
      (json['casts'] as List).forEach((v) {
        casts.add(new MovieLongCommantSubjectCasts.fromJson(v));
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

class MovieLongCommentSubjectImages {
  String small;
  String large;
  String medium;

  MovieLongCommentSubjectImages({this.small, this.large, this.medium});

  MovieLongCommentSubjectImages.fromJson(Map<String, dynamic> json) {
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

class MovieLongCommantSubjectDirectors {
  String name;
  String alt;
  String id;
  MovieLongCommentSubjectDirectorsAvatars avatars;
  String nameEn;

  MovieLongCommantSubjectDirectors(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieLongCommantSubjectDirectors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieLongCommentSubjectDirectorsAvatars.fromJson(json['avatars'])
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

class MovieLongCommentSubjectDirectorsAvatars {
  String small;
  String large;
  String medium;

  MovieLongCommentSubjectDirectorsAvatars(
      {this.small, this.large, this.medium});

  MovieLongCommentSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class MovieLongCommentSubjectRating {
  dynamic average;
  int min;
  int max;
  MovieLongCommentSubjectRatingDetails details;
  String stars;

  MovieLongCommentSubjectRating(
      {this.average, this.min, this.max, this.details, this.stars});

  MovieLongCommentSubjectRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new MovieLongCommentSubjectRatingDetails.fromJson(json['details'])
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

class MovieLongCommentSubjectRatingDetails {
  dynamic one;
  dynamic two;
  dynamic three;
  dynamic four;
  dynamic five;

  MovieLongCommentSubjectRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  MovieLongCommentSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
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

class MovieLongCommantSubjectCasts {
  String name;
  String alt;
  String id;
  MovieLongCommentSubjectCastsAvatars avatars;
  String nameEn;

  MovieLongCommantSubjectCasts(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieLongCommantSubjectCasts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieLongCommentSubjectCastsAvatars.fromJson(json['avatars'])
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

class MovieLongCommentSubjectCastsAvatars {
  String small;
  String large;
  String medium;

  MovieLongCommentSubjectCastsAvatars({this.small, this.large, this.medium});

  MovieLongCommentSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
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
