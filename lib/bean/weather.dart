class Weather {
  Data? data;
  int? status;
  String? desc;

  Weather({this.data, this.status, this.desc});

  Weather.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['desc'] = desc;
    return data;
  }
}

class Data {
  Yesterday? yesterday;
  String? city;
  List<Forecast>? forecast;
  String? ganmao;
  String? wendu;

  Data({this.yesterday, this.city, this.forecast, this.ganmao, this.wendu});

  Data.fromJson(Map<String, dynamic> json) {
    yesterday = json['yesterday'] != null
        ? Yesterday.fromJson(json['yesterday'])
        : null;
    city = json['city'];
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(Forecast.fromJson(v));
      });
    }
    ganmao = json['ganmao'];
    wendu = json['wendu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (yesterday != null) {
      data['yesterday'] = yesterday!.toJson();
    }
    data['city'] = city;
    if (forecast != null) {
      data['forecast'] = forecast!.map((v) => v.toJson()).toList();
    }
    data['ganmao'] = ganmao;
    data['wendu'] = wendu;
    return data;
  }
}

class Yesterday {
  String? date;
  String? high;
  String? fx;
  String? low;
  String? fl;
  String? type;

  Yesterday({this.date, this.high, this.fx, this.low, this.fl, this.type});

  Yesterday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    fx = json['fx'];
    low = json['low'];
    fl = json['fl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['high'] = high;
    data['fx'] = fx;
    data['low'] = low;
    data['fl'] = fl;
    data['type'] = type;
    return data;
  }
}

class Forecast {
  String? date;
  String? high;
  String? fengli;
  String? low;
  String? fengxiang;
  String? type;

  Forecast(
      {this.date, this.high, this.fengli, this.low, this.fengxiang, this.type});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    fengli = json['fengli'];
    low = json['low'];
    fengxiang = json['fengxiang'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['high'] = high;
    data['fengli'] = fengli;
    data['low'] = low;
    data['fengxiang'] = fengxiang;
    data['type'] = type;
    return data;
  }
}
