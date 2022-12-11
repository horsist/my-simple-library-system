package com.sky.library.view;

import com.sky.library.entity.Book;
import com.sky.library.entity.Page;
import com.sky.library.entity.Readers;
import com.sky.library.service.Service;
import com.sky.library.service.impl.BookServiceImpl;
import com.sky.library.service.impl.ReadersServiceImpl;

import java.util.Collections;
import java.util.List;

public class TestReaders {
    public static void main(String[] args) {
        Service<Readers> readersService = new ReadersServiceImpl();
        Readers jack = new Readers("jack", "1234","2022-12-31");
//        readersService.add(jack);
//        readersService.modify(new Readers(1,"tom","123456","2022-12-31"));
        readersService.removeObject(2);
//

        Page page = new Page(0, 5);
        List<Readers> readers1 = readersService.showAll(page);

//        List<Readers> readers = readersService.showAll();
        for (Readers read:readers1 ) {
            System.out.println(read);
        }





    }
}
