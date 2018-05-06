package com.summer.manage.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResponseJsonUtil {

    private static final ObjectMapper om = new ObjectMapper();

    public static void jsonResponse(HttpServletResponse response, Object o) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        writer.append(om.writeValueAsString(o));
        writer.flush();
        writer.close();
    }
}
