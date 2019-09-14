class MovieDetailEntity {
  bool hasSchedule;
  String year;
  List<Null> clips;
  List<Null> clipUrls;
  dynamic currentSeason;
  MovieDetailRating rating;
  List<MovieDetailVideo> videos;
  String scheduleUrl;
  List<MovieDetailPhoto> photos;
  List<String> pubdates;
  bool hasTicket;
  List<String> durations;
  String id;
  int ratingsCount;
  int photosCount;
  List<MovieDetailPopularReview> popularReviews;
  MovieDetailImages images;
  List<String> blooperUrls;
  String alt;
  dynamic collection;
  List<String> countries;
  List<MovieDetailBlooper> bloopers;
  List<String> tags;
  List<MovieDetailTrailer> trailers;
  List<MovieDetailPopularCommants> popularComments;
  List<MovieDetailCast> casts;
  dynamic seasonsCount;
  String shareUrl;
  int commentsCount;
  int reviewsCount;
  List<MovieDetailDirector> directors;
  String doubanSite;
  String mobileUrl;
  String title;
  bool hasVideo;
  String subtype;
  List<String> genres;
  dynamic doCount;
  int wishCount;
  String pubdate;
  String summary;
  String website;
  String originalTitle;
  List<String> languages;
  List<MovieDetailWriter> writers;
  int collectCount;
  dynamic episodesCount;
  List<String> aka;
  List<String> trailerUrls;
  String mainlandPubdate;

  MovieDetailEntity(
      {this.hasSchedule,
      this.year,
      this.clips,
      this.clipUrls,
      this.currentSeason,
      this.rating,
      this.videos,
      this.scheduleUrl,
      this.photos,
      this.pubdates,
      this.hasTicket,
      this.durations,
      this.id,
      this.ratingsCount,
      this.photosCount,
      this.popularReviews,
      this.images,
      this.blooperUrls,
      this.alt,
      this.collection,
      this.countries,
      this.bloopers,
      this.tags,
      this.trailers,
      this.popularComments,
      this.casts,
      this.seasonsCount,
      this.shareUrl,
      this.commentsCount,
      this.reviewsCount,
      this.directors,
      this.doubanSite,
      this.mobileUrl,
      this.title,
      this.hasVideo,
      this.subtype,
      this.genres,
      this.doCount,
      this.wishCount,
      this.pubdate,
      this.summary,
      this.website,
      this.originalTitle,
      this.languages,
      this.writers,
      this.collectCount,
      this.episodesCount,
      this.aka,
      this.trailerUrls,
      this.mainlandPubdate});

  MovieDetailEntity.fromJson(Map<String, dynamic> json) {
    hasSchedule = json['has_schedule'];
    year = json['year'];
    if (json['clips'] != null) {
      clips = new List<Null>();
    }
    if (json['clip_urls'] != null) {
      clipUrls = new List<Null>();
    }
    currentSeason = json['current_season'];
    rating = json['rating'] != null
        ? new MovieDetailRating.fromJson(json['rating'])
        : null;
    if (json['videos'] != null) {
      videos = new List<MovieDetailVideo>();
      (json['videos'] as List).forEach((v) {
        videos.add(new MovieDetailVideo.fromJson(v));
      });
    }
    scheduleUrl = json['schedule_url'];
    if (json['photos'] != null) {
      photos = new List<MovieDetailPhoto>();
      (json['photos'] as List).forEach((v) {
        photos.add(new MovieDetailPhoto.fromJson(v));
      });
    }
    pubdates = json['pubdates']?.cast<String>();
    hasTicket = json['has_ticket'];
    durations = json['durations']?.cast<String>();
    id = json['id'];
    ratingsCount = json['ratings_count'];
    photosCount = json['photos_count'];
    if (json['popular_reviews'] != null) {
      popularReviews = new List<MovieDetailPopularReview>();
      (json['popular_reviews'] as List).forEach((v) {
        popularReviews.add(new MovieDetailPopularReview.fromJson(v));
      });
    }
    images = json['images'] != null
        ? new MovieDetailImages.fromJson(json['images'])
        : null;
    blooperUrls = json['blooper_urls']?.cast<String>();
    alt = json['alt'];
    collection = json['collection'];
    countries = json['countries']?.cast<String>();
    if (json['bloopers'] != null) {
      bloopers = new List<MovieDetailBlooper>();
      (json['bloopers'] as List).forEach((v) {
        bloopers.add(new MovieDetailBlooper.fromJson(v));
      });
    }
    tags = json['tags']?.cast<String>();
    if (json['trailers'] != null) {
      trailers = new List<MovieDetailTrailer>();
      (json['trailers'] as List).forEach((v) {
        trailers.add(new MovieDetailTrailer.fromJson(v));
      });
    }
    if (json['popular_comments'] != null) {
      popularComments = new List<MovieDetailPopularCommants>();
      (json['popular_comments'] as List).forEach((v) {
        popularComments.add(new MovieDetailPopularCommants.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = new List<MovieDetailCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new MovieDetailCast.fromJson(v));
      });
    }
    seasonsCount = json['seasons_count'];
    shareUrl = json['share_url'];
    commentsCount = json['comments_count'];
    reviewsCount = json['reviews_count'];
    if (json['directors'] != null) {
      directors = new List<MovieDetailDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new MovieDetailDirector.fromJson(v));
      });
    }
    doubanSite = json['douban_site'];
    mobileUrl = json['mobile_url'];
    title = json['title'];
    hasVideo = json['has_video'];
    subtype = json['subtype'];
    genres = json['genres']?.cast<String>();
    doCount = json['do_count'];
    wishCount = json['wish_count'];
    pubdate = json['pubdate'];
    summary = json['summary'];
    website = json['website'];
    originalTitle = json['original_title'];
    languages = json['languages']?.cast<String>();
    if (json['writers'] != null) {
      writers = new List<MovieDetailWriter>();
      (json['writers'] as List).forEach((v) {
        writers.add(new MovieDetailWriter.fromJson(v));
      });
    }
    collectCount = json['collect_count'];
    episodesCount = json['episodes_count'];
    aka = json['aka']?.cast<String>();
    trailerUrls = json['trailer_urls']?.cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_schedule'] = this.hasSchedule;
    data['year'] = this.year;
    if (this.clips != null) {
      data['clips'] = [];
    }
    if (this.clipUrls != null) {
      data['clip_urls'] = [];
    }
    data['current_season'] = this.currentSeason;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    data['schedule_url'] = this.scheduleUrl;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['pubdates'] = this.pubdates;
    data['has_ticket'] = this.hasTicket;
    data['durations'] = this.durations;
    data['id'] = this.id;
    data['ratings_count'] = this.ratingsCount;
    data['photos_count'] = this.photosCount;
    if (this.popularReviews != null) {
      data['popular_reviews'] =
          this.popularReviews.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['blooper_urls'] = this.blooperUrls;
    data['alt'] = this.alt;
    data['collection'] = this.collection;
    data['countries'] = this.countries;
    if (this.bloopers != null) {
      data['bloopers'] = this.bloopers.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    if (this.trailers != null) {
      data['trailers'] = this.trailers.map((v) => v.toJson()).toList();
    }
    if (this.popularComments != null) {
      data['popular_comments'] =
          this.popularComments.map((v) => v.toJson()).toList();
    }
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['seasons_count'] = this.seasonsCount;
    data['share_url'] = this.shareUrl;
    data['comments_count'] = this.commentsCount;
    data['reviews_count'] = this.reviewsCount;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['douban_site'] = this.doubanSite;
    data['mobile_url'] = this.mobileUrl;
    data['title'] = this.title;
    data['has_video'] = this.hasVideo;
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['do_count'] = this.doCount;
    data['wish_count'] = this.wishCount;
    data['pubdate'] = this.pubdate;
    data['summary'] = this.summary;
    data['website'] = this.website;
    data['original_title'] = this.originalTitle;
    data['languages'] = this.languages;
    if (this.writers != null) {
      data['writers'] = this.writers.map((v) => v.toJson()).toList();
    }
    data['collect_count'] = this.collectCount;
    data['episodes_count'] = this.episodesCount;
    data['aka'] = this.aka;
    data['trailer_urls'] = this.trailerUrls;
    data['mainland_pubdate'] = this.mainlandPubdate;
    return data;
  }
}

class MovieDetailRating {
  dynamic average;
  int min;
  int max;
  MovieDetailRatingDetails details;
  String stars;

  MovieDetailRating(
      {this.average, this.min, this.max, this.details, this.stars});

  MovieDetailRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new MovieDetailRatingDetails.fromJson(json['details'])
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

class MovieDetailRatingDetails {
  dynamic one;
  dynamic two;
  dynamic three;
  dynamic four;
  dynamic five;

  MovieDetailRatingDetails(
      {this.one, this.two, this.three, this.four, this.five});

  MovieDetailRatingDetails.fromJson(Map<String, dynamic> json) {
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

class MovieDetailVideo {
  String sampleLink;
  bool needPay;
  MovieDetailVideosSource source;
  String videoId;

  MovieDetailVideo({this.sampleLink, this.needPay, this.source, this.videoId});

  MovieDetailVideo.fromJson(Map<String, dynamic> json) {
    sampleLink = json['sample_link'];
    needPay = json['need_pay'];
    source = json['source'] != null
        ? new MovieDetailVideosSource.fromJson(json['source'])
        : null;
    videoId = json['video_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sample_link'] = this.sampleLink;
    data['need_pay'] = this.needPay;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['video_id'] = this.videoId;
    return data;
  }
}

class MovieDetailVideosSource {
  String name;
  String pic;
  String literal;

  MovieDetailVideosSource({this.name, this.pic, this.literal});

  MovieDetailVideosSource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pic = json['pic'];
    literal = json['literal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['literal'] = this.literal;
    return data;
  }
}

class MovieDetailPhoto {
  String cover;
  String image;
  String thumb;
  String alt;
  String icon;
  String id;

  MovieDetailPhoto(
      {this.cover, this.image, this.thumb, this.alt, this.icon, this.id});

  MovieDetailPhoto.fromJson(Map<String, dynamic> json) {
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

class MovieDetailPopularReview {
  String subjectId;
  String summary;
  MovieDetailPopularReviewsAuthor author;
  MovieDetailPopularReviewsRating rating;
  String alt;
  String id;
  String title;

  MovieDetailPopularReview(
      {this.subjectId,
      this.summary,
      this.author,
      this.rating,
      this.alt,
      this.id,
      this.title});

  MovieDetailPopularReview.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    summary = json['summary'];
    author = json['author'] != null
        ? new MovieDetailPopularReviewsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new MovieDetailPopularReviewsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['summary'] = this.summary;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailPopularReviewsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  MovieDetailPopularReviewsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  MovieDetailPopularReviewsAuthor.fromJson(Map<String, dynamic> json) {
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

class MovieDetailPopularReviewsRating {
  int min;
  int max;
  dynamic value;

  MovieDetailPopularReviewsRating({this.min, this.max, this.value});

  MovieDetailPopularReviewsRating.fromJson(Map<String, dynamic> json) {
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

class MovieDetailImages {
  String small;
  String large;
  String medium;

  MovieDetailImages({this.small, this.large, this.medium});

  MovieDetailImages.fromJson(Map<String, dynamic> json) {
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

class MovieDetailBlooper {
  String subjectId;
  String small;
  String resourceUrl;
  String alt;
  String medium;
  String id;
  String title;

  MovieDetailBlooper(
      {this.subjectId,
      this.small,
      this.resourceUrl,
      this.alt,
      this.medium,
      this.id,
      this.title});

  MovieDetailBlooper.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    alt = json['alt'];
    medium = json['medium'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['alt'] = this.alt;
    data['medium'] = this.medium;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailTrailer {
  String subjectId;
  String small;
  String resourceUrl;
  String alt;
  String medium;
  String id;
  String title;

  MovieDetailTrailer(
      {this.subjectId,
      this.small,
      this.resourceUrl,
      this.alt,
      this.medium,
      this.id,
      this.title});

  MovieDetailTrailer.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    alt = json['alt'];
    medium = json['medium'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['alt'] = this.alt;
    data['medium'] = this.medium;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailPopularCommants {
  String subjectId;
  MovieDetailPopularCommentsAuthor author;
  MovieDetailPopularCommentsRating rating;
  String createdAt;
  String id;
  int usefulCount;
  String content;

  MovieDetailPopularCommants(
      {this.subjectId,
      this.author,
      this.rating,
      this.createdAt,
      this.id,
      this.usefulCount,
      this.content});

  MovieDetailPopularCommants.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    author = json['author'] != null
        ? new MovieDetailPopularCommentsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new MovieDetailPopularCommentsRating.fromJson(json['rating'])
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

class MovieDetailPopularCommentsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  MovieDetailPopularCommentsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  MovieDetailPopularCommentsAuthor.fromJson(Map<String, dynamic> json) {
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

class MovieDetailPopularCommentsRating {
  int min;
  int max;
  dynamic value;

  MovieDetailPopularCommentsRating({this.min, this.max, this.value});

  MovieDetailPopularCommentsRating.fromJson(Map<String, dynamic> json) {
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

class MovieDetailCast {
  String name;
  String alt;
  String id;
  MovieDetailCastsAvatars avatars;
  String nameEn;

  MovieDetailCast({this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailCastsAvatars.fromJson(json['avatars'])
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

class MovieDetailCastsAvatars {
  String small;
  String large;
  String medium;

  MovieDetailCastsAvatars({this.small, this.large, this.medium});

  MovieDetailCastsAvatars.fromJson(Map<String, dynamic> json) {
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

class MovieDetailDirector {
  String name;
  String alt;
  String id;
  MovieDetailDirectorsAvatars avatars;
  String nameEn;

  MovieDetailDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailDirectorsAvatars.fromJson(json['avatars'])
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

class MovieDetailDirectorsAvatars {
  String small;
  String large;
  String medium;

  MovieDetailDirectorsAvatars({this.small, this.large, this.medium});

  MovieDetailDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class MovieDetailWriter {
  String name;
  String alt;
  String id;
  MovieDetailWritersAvatars avatars;
  String nameEn;

  MovieDetailWriter({this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailWriter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailWritersAvatars.fromJson(json['avatars'])
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

class MovieDetailWritersAvatars {
  String small;
  String large;
  String medium;

  MovieDetailWritersAvatars({this.small, this.large, this.medium});

  MovieDetailWritersAvatars.fromJson(Map<String, dynamic> json) {
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
