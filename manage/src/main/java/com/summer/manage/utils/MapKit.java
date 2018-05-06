package com.summer.manage.utils;

import java.util.HashMap;

public class MapKit {
    java.util.Map<String, Object> map = new HashMap();

    public static MapKit New(String key, Object v) {
        MapKit m = new MapKit();
        m.set(key, v);
        return m;
    }
    public static MapKit New() {
        MapKit m = new MapKit();
        return m;
    }
    public static MapKit okNoContent() {
        MapKit m = new MapKit();
        m.set("code", 200);
        return m;
    }

    public static MapKit okAsList(Object data, Long count) {
        MapKit m = new MapKit();
        m.set("code", 0);
        m.set("data", data);
        m.set("count", count);
        return m;
    }

    public MapKit set(String key, Object v) {
        map.put(key, v);
        return this;
    }

    public java.util.Map<String, Object> getMap() {
        return map;
    }
}
