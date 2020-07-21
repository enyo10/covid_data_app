class ClosedCases {
  final int total;
  final int recovered;
  final int deaths;

  ClosedCases({this.total, this.recovered, this.deaths});

  factory ClosedCases.fromJson(Map<String, dynamic> json) {
    return ClosedCases(
        total: json['total'],
        recovered: json['recovered'],
        deaths: json['deaths']);
  }
}

class ActiveCases {
  final int total;
  final int critical;
  final int mild;

  ActiveCases({this.total, this.critical, this.mild});

  factory ActiveCases.fromJson(Map<String, dynamic> json) {
    return ActiveCases(
      total: json['total'],
      critical: json['critical'],
      mild: json['mild'],
    );
  }
}

class GlobalData {
  final dynamic activeCases;
  final dynamic closedCases;
  final int total;
  final String timeStamp;

  GlobalData({this.activeCases, this.closedCases, this.total, this.timeStamp});

  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
      total: json['total'],
      timeStamp: json['timeStamp'],
      closedCases: json['closedCases'],
      activeCases: json['activeCases'],
    );
  }
}
