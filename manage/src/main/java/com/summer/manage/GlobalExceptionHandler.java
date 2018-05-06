package com.summer.manage;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;

import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@ResponseBody
public class GlobalExceptionHandler {

    /**
     * 所有异常报错
     *
     * @param request
     * @param exception
     * @return
     * @throws Exception
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Map<String, Object> allExceptionHandler(HttpServletRequest request,
                                                   Exception exception) throws Exception {
        exception.printStackTrace();
        Map<String, Object> objectMap = new HashMap<>();
        objectMap.put("code", "500");
        if (exception instanceof BindException) {
            StringBuilder message = new StringBuilder();
            ((BindException) exception).getBindingResult().getAllErrors().forEach(error -> {
                message.append(error.getDefaultMessage() + "</br>");
            });
            objectMap.put("message", message.toString());
        } else if (exception instanceof ConstraintViolationException) {

            StringBuilder stringBuilder = new StringBuilder();
            ((ConstraintViolationException) exception).getConstraintViolations().iterator().forEachRemaining((r) -> {
                stringBuilder.append(r.getMessage() + "</br>");
            });
            objectMap.put("message", stringBuilder.toString());
        } else {
            objectMap.put("message", exception.getMessage());
        }
        return objectMap;
    }

}