function compareDate(t1, t2) {
    var strs1 = new Array();
    strs1 = t1.trim().split("-");
    var strs2 = new Array();
    strs2 = t2.trim().split("-");
    if (parseInt(strs1[0]) > parseInt(strs2[0])) {
        return false;
    }
    else if (parseInt(strs1[0]) < parseInt(strs2[0])) {
        return true;
    }
    else {
    }
    if (parseInt(strs1[1]) > parseInt(strs2[1])) {
        return false;
    }
    else if (parseInt(strs1[1]) < parseInt(strs2[1])) {
        return true;
    }
    else {
    }
    if (parseInt(strs1[2]) > parseInt(strs2[2])) {
        return false;
    }
    else if (parseInt(strs1[2]) < parseInt(strs2[2])) {
        return true;
    }
    else {
    }
    return true;
}
