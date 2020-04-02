class CountryStats {
  String provinceState;
  String countryRegion;
  int lastUpdate;
  var lat;
  var long;
  int confirmed;
  int recovered;
  int deaths;
  int active;
  String admin2;
  String fips;
  String combinedKey;
  String incidentRate;
  String peopleTested;
  String iso2;
  String iso3;

  CountryStats(
      {this.provinceState,
      this.countryRegion,
      this.lastUpdate,
      this.lat,
      this.long,
      this.confirmed,
      this.recovered,
      this.deaths,
      this.active,
      this.admin2,
      this.fips,
      this.combinedKey,
      this.incidentRate,
      this.peopleTested,
      this.iso2,
      this.iso3});

  CountryStats.fromJson(Map<String, dynamic> json) {
    provinceState = json['provinceState'];
    countryRegion = json['countryRegion'];
    lastUpdate = json['lastUpdate'];
    lat = json['lat'];
    long = json['long'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    active = json['active'];
    admin2 = json['admin2'];
    fips = json['fips'];
    combinedKey = json['combinedKey'];
    incidentRate = json['incidentRate'];
    peopleTested = json['peopleTested'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provinceState'] = this.provinceState;
    data['countryRegion'] = this.countryRegion;
    data['lastUpdate'] = this.lastUpdate;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['deaths'] = this.deaths;
    data['active'] = this.active;
    data['admin2'] = this.admin2;
    data['fips'] = this.fips;
    data['combinedKey'] = this.combinedKey;
    data['incidentRate'] = this.incidentRate;
    data['peopleTested'] = this.peopleTested;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    return data;
  }
}
