package com.summer.manage.utils;

import com.summer.manage.entity.Dictionary;
import com.summer.manage.entity.Node;
import com.summer.manage.entity.Permission;

import java.util.*;

public class TreeUtil {

    /**
     * 列表转换成树形
     */
    public static List<Node> listToTree(List<? extends Node> list) {

        List<Node> newList = new ArrayList<>();
        for (Node l : list) {
            if (l.getPid() == 0) {
                l.setChildren(getChild(l.getId(), list));
                newList.add(l);
            }
        }
        return newList;
    }


    /**
     * 获取子节点
     *
     * @param id      父节点id
     * @param allMenu 所有菜单列表
     * @return 每个根节点下，所有子菜单列表
     */
    public static List<Node> getChild(long id, List<? extends Node> allMenu) {
        //子菜单
        List<Node> childList = new ArrayList<>();
        for (Node nav : allMenu) {
            if (nav.getPid() == id) {
                childList.add(nav);
            }
        }
        //递归
        for (Node nav : childList) {
            nav.setChildren(getChild(nav.getId(), allMenu));
        }
        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.size() == 0) {
            return new ArrayList<>();
        }
        return childList;
    }

    /**
     * 列表转换成树形
     */
    public static List<Node> listToTree2(List<? extends Node> list) {

        List<Node> newList = new ArrayList<>();
        for (Node permission : list) {
            if (permission.getPid() == 0) {
                List<Node> l = getChild2(permission.getId(), list, 1);
                String name = permission.getName();
                if (l.size() != 0) {
                    name = "├── " + name;
                }
                permission.setName(name);
                newList.add(permission);
                newList.addAll(l);
            }
        }
        return newList;
    }

    /**
     * 获取子节点
     *
     * @param id      父节点id
     * @param allMenu 所有菜单列表
     * @return 每个根节点下，所有子菜单列表
     */
    public static List<Node> getChild2(long id, List<? extends Node> allMenu, int i) {
        //子菜单
        List<Node> childList = new ArrayList<>();
        for (Node nav : allMenu) {
            if (nav.getPid() == id) {
                childList.add(nav);
            }
        }
        //递归
        List<Node> newList = new ArrayList<>();
        for (Node nav : childList) {
            List<Node> l = getChild2(nav.getId(), allMenu, i + 1);
            String name = "";
            for (int i2 = 0; i2 < i; i2++) {
                name = name + "&nbsp;&nbsp;&nbsp;";
            }
            if (l.size() > 0)
                name = name + "├── ";
            else name = name + "└── ";
            nav.setName(name + nav.getName());
            newList.add(nav);
            newList.addAll(l);

        }

        //如果节点下没有子节点，返回一个空List（递归退出）
        if (childList.size() == 0) {
            return new ArrayList<>();
        }
        return newList;
    }
}
