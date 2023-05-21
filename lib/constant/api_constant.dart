const String aBaseUrl = "http://api.weatherapi.com/v1";

const String aApiKey = "a7d6dd36b3214a7d83b81211231905";

const String aGetCityEndPointt = "/search.json?key=$aApiKey&q={name}";
const String aGetThreeDayWeatherEndPoint =
    "/forecast.json?key=$aApiKey&q={name}&days={day}";
