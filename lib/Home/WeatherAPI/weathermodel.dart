class Weather{
  final double temperature;
  final String condition;
  final int aqi;
  final String icon;

  Weather({
    this.temperature=0,
    this.condition="Sunny",
    this.aqi=0,
    this.icon="bleh",
});
  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      aqi: json['current']['air_quality']['us-epa-index'],
      icon: json['current']['condition']['icon'],
    );
  }
}