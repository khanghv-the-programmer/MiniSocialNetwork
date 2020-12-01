/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.utils;

import java.util.Vector;

/**
 *
 * @author USER
 */
public class SearchArrayElements {

    public SearchArrayElements() {
    }
    
    public static boolean isFound(Vector<String> list, String keyword)
    {   
        if(list.size() == 0)
        {
            return false;
        }
        for(int i = 0; i < list.size(); i++)
        {
            if(list.get(i).equals(keyword))
                return true;
        }
        return false;
    }
}
