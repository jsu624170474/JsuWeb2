package com.jsu.commons.utils;

import java.util.Comparator;

/**
 * Created by xufei on 2016/10/25.
 */
public class MapKeyComparator implements Comparator<String> {

    public int compare(String str1, String str2) {
        return str1.compareTo(str2);
    }

}
