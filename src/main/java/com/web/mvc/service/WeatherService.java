package com.web.mvc.service;

import com.web.mvc.beans.Weather;
import java.util.Map;

public interface WeatherService {
    Weather find(String cityName) throws Exception;
}
