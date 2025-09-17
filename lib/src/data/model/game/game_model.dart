class GameModel {
  String? id;
  String? mode;
  String? status;
  String? languageId;
  String? createdAt;
  Host? host;
  bool? isFirstGameOfType;
  int? gamesOfThisType;
  int? totalGamesCreated;
  GameTypesCreated? gameTypesCreated;

  GameModel(
      {this.id,
        this.mode,
        this.status,
        this.languageId,
        this.createdAt,
        this.host,
        this.isFirstGameOfType,
        this.gamesOfThisType,
        this.totalGamesCreated,
        this.gameTypesCreated});

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mode = json['mode'];
    status = json['status'];
    languageId = json['language_id'];
    createdAt = json['created_at'];
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
    isFirstGameOfType = json['is_first_game_of_type'];
    gamesOfThisType = json['games_of_this_type'];
    totalGamesCreated = json['total_games_created'];
    gameTypesCreated = json['game_types_created'] != null
        ? new GameTypesCreated.fromJson(json['game_types_created'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mode'] = this.mode;
    data['status'] = this.status;
    data['language_id'] = this.languageId;
    data['created_at'] = this.createdAt;
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    data['is_first_game_of_type'] = this.isFirstGameOfType;
    data['games_of_this_type'] = this.gamesOfThisType;
    data['total_games_created'] = this.totalGamesCreated;
    if (this.gameTypesCreated != null) {
      data['game_types_created'] = this.gameTypesCreated!.toJson();
    }
    return data;
  }
}

class Host {
  String? id;
  String? name;
  String? email;

  Host({this.id, this.name, this.email});

  Host.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

class GameTypesCreated {
  int? qUICKGAME;
  int? gRIDSTYLE;
  int? total;
  List<String>? typesCreated;

  GameTypesCreated(
      {this.qUICKGAME, this.gRIDSTYLE, this.total, this.typesCreated});

  GameTypesCreated.fromJson(Map<String, dynamic> json) {
    qUICKGAME = json['QUICK_GAME'];
    gRIDSTYLE = json['GRID_STYLE'];
    total = json['total'];
    typesCreated = json['types_created'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['QUICK_GAME'] = this.qUICKGAME;
    data['GRID_STYLE'] = this.gRIDSTYLE;
    data['total'] = this.total;
    data['types_created'] = this.typesCreated;
    return data;
  }
}
