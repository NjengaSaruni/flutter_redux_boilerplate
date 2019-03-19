class User {
    final String _token;
    final String _id;

    User(this._token, this._id);

    String get token => this._token;
    String get id => this._id;

    Map<String, dynamic> toJSON() => <String, dynamic>{
        'token': this.token,
        'id': this.id
    };

    factory User.fromJSON(Map<String, dynamic> json) => new User(
        json['token'],
        json['id'],
    );

    @override
    String toString() {
        return '{token: $token, id: $id}';
    }


    Map<String, dynamic> toMap() {
        var map = new Map<String, dynamic>();
        map["token"] = _token;
        map["id"] = _id;

        return map;
    }
}