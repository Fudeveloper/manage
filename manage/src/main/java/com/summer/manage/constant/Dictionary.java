package com.summer.manage.constant;

public class Dictionary {


   public enum UserState {
        NORMAL("正常", 0), FREEZE("冻结", 1);
        public String name;
        public int code;

        UserState(String name, int code) {
            this.name = name;
            this.code = code;
        }
    }



}
