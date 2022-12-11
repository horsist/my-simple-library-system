package com.sky.library.view;

import java.util.*;

public class Testlist {
    public static void main(String[] args) {
        List<Integer> integerList = new ArrayList<>();
        integerList.add(1);
        integerList.add(2);
        integerList.add(20);
        integerList.add(10);
        integerList.add(5);
        System.out.println("sort前"+integerList.toString());
//        Collections.sort(integerList, new Comparator<Integer>() {
//            @Override
//            public int compare(Integer o1, Integer o2) {
//                return o1-o2;
//            }
//        });
        Collections.sort(integerList);
        System.out.println("sort后"+integerList.toString());

        System.out.println(Collections.binarySearch(integerList,2));

        Collections.reverse(integerList);
        System.out.println("反转后"+integerList);

        Integer[] integers = (Integer[]) integerList.toArray();
        List<Integer> integerList1 = Arrays.asList(integers);


    }








}
