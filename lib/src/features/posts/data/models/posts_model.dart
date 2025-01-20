

class PostModel {
  String author;
  String authorPayoutValue;
  double authorReputation;
  List<Beneficiary> beneficiaries;
  List<ActiveVote> activeVotes;
  String body;
  String title;
  String category;
  String permlink;
  String url;
  String? communityTitle;
  String? updated;
  int children;
  JsonMetadata jsonMetadata;

  PostModel({
    required this.author,
    required this.authorPayoutValue,
    required this.authorReputation,
    required this.beneficiaries,
    required this.activeVotes,
    required this.body,
    required this.title,
    required this.category,
    required this.permlink,
    required this.url,
    required this.children,
    required this.jsonMetadata,
    required this.communityTitle,
    required this.updated,
  });

  // From JSON constructor
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      author: json['author'],
      authorPayoutValue: json['author_payout_value'],
      communityTitle: json['community_title'],
      updated: json['updated'],
      children: json['children'],
      authorReputation: json['author_reputation'].toDouble(),
      beneficiaries: (json['beneficiaries'] as List)
          .map((e) => Beneficiary.fromJson(e))
          .toList(),
      activeVotes: (json['active_votes'] as List)
          .map((e) => ActiveVote.fromJson(e))
          .toList(),
      jsonMetadata: JsonMetadata.fromJson(json['json_metadata']),
      body: json['body'],
      title: json['title'],
      category: json['category'],
      url: json['url'],
      permlink: json['permlink'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'author_payout_value': authorPayoutValue,
      'author_reputation': authorReputation,
      'beneficiaries': beneficiaries.map((e) => e.toJson()).toList(),
      'active_votes': activeVotes.map((e) => e.toJson()).toList(),
      'body': body,
      'title': title,
      'category': category,
      'permlink': permlink,
      'children': children,
      'json_metadata': jsonMetadata,
      'community_title': communityTitle,
      'updated': updated,

    };
  }
}

class Beneficiary {
  String account;
  int weight;

  Beneficiary({
    required this.account,
    required this.weight,
  });

  // From JSON constructor
  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      account: json['account'],
      weight: json['weight'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'weight': weight,
    };
  }
}

class ActiveVote {
  String voter;
  int rshares;

  ActiveVote({
    required this.voter,
    required this.rshares,
  });

  // From JSON constructor
  factory ActiveVote.fromJson(Map<String, dynamic> json) {
    return ActiveVote(
      voter: json['voter'],
      rshares: json['rshares'],
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'voter': voter,
      'rshares': rshares,
    };
  }
}


class JsonMetadata {
  final String? app;
  final String? description;
  final String? format;
  final List<String>? image;
  final List<String>? tags;
  final List<String>? users;

  JsonMetadata({
    this.app,
    this.description,
    this.format,
    this.image,
    this.tags,
    this.users,
  });

  // Convert JSON to Dart object
  factory JsonMetadata.fromJson(Map<String, dynamic> json) {
    return JsonMetadata(
      app: json['app'] ,
      description: json['description'] ,
      format: json['format'] ,
      image: _convertToListOfString(json['image']),
      tags: _convertToListOfString(json['tags']),
      users: _convertToListOfString(json['users']),
    );
  }

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() {
    return {
      'app': app,
      'description': description,
      'format': format,
      'image': image,
      'tags': tags,
      'users': users,
    };
  }

  static List<String>? _convertToListOfString(dynamic value) {
    if (value == null) return null;  // Handle null case
    if (value is List) {
      return value.map((e) => e.toString()).toList();  // Safely convert items to strings
    }
    return [value.toString()];  // If it's a single value, convert it to a list with one item
  }
}


