if (typeof String.prototype.contains != 'function') {
    String.prototype.contains = function (str) {
        return this.indexOf(str) != -1;
    };
}

jQuery.createWebSocket = function (path) {
    if (!path.startsWith('/')) {
        var pathname = window.location.pathname
        if (pathname.endsWith('/')) {
            path = pathname + path
        } else {
            path = pathname + '/' + path
        }
    }
    return new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + path);
}

var callbackWithAjaxRedirect = function (realCallback) {
    return function () {
        var jqXHR = arguments[2];
        if (jqXHR.status === 278) {
            window.location = jqXHR.getResponseHeader("Location");
        }
        if (realCallback) realCallback.apply(this, arguments);
    }
}

jQuery.each(["get", "post", "put", "delete", "patch"], function (i, method) {
    jQuery[method] = function (url, data, callback, type) {
        // shift arguments if data argument was omitted
        if (jQuery.isFunction(data)) {
            type = type || callback;
            callback = data;
            data = undefined;
        }

        var submitMethod = method;

        if (method === "put" || method === "patch" || method === "delete") {
            var hasParam = url.contains("?");
            if (!hasParam) url = url + "?_method=" + method;
            submitMethod = "post";
        }

        return jQuery.ajax({
            url: url,
            type: submitMethod,
            dataType: type,
            data: data,
            success: callbackWithAjaxRedirect(callback)
        });
    };
});

jQuery.each(["getJSON", "postJSON", "putJSON", "deleteJSON", "patchJSON"], function (i, method) {
    jQuery[method] = function (url, data, callback) {
        if (jQuery.isFunction(data)) {
            callback = data;
            data = undefined;
        }

        var submitMethod = method;

        if (method.startsWith("put") || method.startsWith("patch") || method.startsWith("delete")) {
            var hasParam = url.contains("?");
            if (!hasParam) url = url + "?_method=" + method.replace("JSON", "");
            submitMethod = "post";
        }
        if (method.startsWith("get")) {
            var hasParam = url.contains("?");
            if (!hasParam) {
                url = url + "?now=" + new Date().getTime();
            } else {
                url = url + "&now=" + new Date().getTime();
            }
        }
        return jQuery.ajax({
            url: url,
            type: submitMethod.replace("JSON", ""),
            dataType: "json",
            data: data,
            success: callbackWithAjaxRedirect(callback)
        });
    };
});


function loadSelectList(key, id, data) {
    $.get('/dictionary/getByName?name=' + key, function (res) {
        if (res.code == 0) {
            res.data.map(function (item) {
                if (data == item.id) {
                    $('#' + id).append('<option value="' + item.id + '" selected>' + item.name + '</option>')
                }
                else {
                    $('#' + id).append('<option value="' + item.id + '">' + item.name + '</option>')
                }

            })
        }
        layui.form.render();
        console.log(res)
    })
}

function loadTeacherList(id, data) {
    $.get('/teacher/list?page=1&limit=500', function (res) {
        if (res.code == 0) {
            res.data.map(function (item) {
                if (data == item.id) {
                    $('#' + id).append('<option value="' + item.id + '" selected>' + item.fullName + '</option>')
                }
                else {
                    $('#' + id).append('<option value="' + item.id + '">' + item.fullName + '</option>')
                }

            })
        }
        layui.form.render();
        console.log(res)
    })
}
function loadDepartmentList(id, data) {
    $.get('/department/list?page=1&limit=500', function (res) {
        if (res.code == 0) {
            res.data.map(function (item) {
                if (data == item.id) {
                    $('#' + id).append('<option value="' + item.id + '" selected>' + item.name + '</option>')
                }
                else {
                    $('#' + id).append('<option value="' + item.id + '">' + item.name + '</option>')
                }

            })
        }
        layui.form.render();
        console.log(res)
    })
}
function loadDepartmentsList(id, data) {
    $.get('/departments/list?page=1&limit=500', function (res) {
        if (res.code == 0) {
            res.data.map(function (item) {
                if (data == item.id) {
                    $('#' + id).append('<option value="' + item.id + '" selected>' + item.name + '</option>')
                }
                else {
                    $('#' + id).append('<option value="' + item.id + '">' + item.name + '</option>')
                }

            })
        }
        layui.form.render();
        console.log(res)
    })
}