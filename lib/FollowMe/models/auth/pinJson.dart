class PinModel {
    PinModel({
        this.code,
        this.message,
        required this.result,
    });

    String? code;
    String? message;
    Result result;

    factory PinModel.fromJson(Map<String, dynamic> json) => PinModel(
        code: json["code"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        required this.coopToken,
    });

    CoopToken coopToken;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        coopToken: CoopToken.fromJson(json["coopToken"]),
    );

    Map<String, dynamic> toJson() => {
        "coopToken": coopToken.toJson(),
    };
}

class CoopToken {
    CoopToken({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
    });

    String? accessToken;
    String? tokenType;
    int? expiresIn;

    factory CoopToken.fromJson(Map<String, dynamic> json) => CoopToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
    };
}
