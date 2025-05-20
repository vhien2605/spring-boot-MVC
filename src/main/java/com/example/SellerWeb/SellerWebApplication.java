package com.example.SellerWeb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication()
public class SellerWebApplication {
    public static void main(String[] args) {
        // SpringApplication.run(SellerWebApplication.class, args);
        // System.out.println("server is running at http:://localhost:8080");
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String storedHashedPassword = encoder.encode("hienhien123@");
        String inputPassword = "hienhien123@";
        boolean isMatch = encoder.matches(inputPassword, storedHashedPassword);
        System.out.println(storedHashedPassword);
        // module này và module cuối tập trung chủ yếu về mảng tối ưu hiệu năng như phân
        // trang, tối ưu query

        // 1 Pagination : phân trang chỉ render data đủ dùng để tiết kiệm băng thông,
        // tăng trải nghiệm người dùng

        // 2 Khái niệm OFFSET LIMIT : giới hạn bản ghi trong SQL
        // LIMIT chỉ giới hạn bản ghi trả về, tiết kiệm khối dữ liệu truyền tải . Chứ
        // hiệu năng thì vẫn phải scan tất cả bản ghi sau đó limit return result

        // OFFSET là bỏ qua n bản ghi đầu tiên. Vai trò cũng khá tương đương LIMIT

        // 3 ta sẽ dùng Query Parameter để Pagination. Query parameter giúp cung cấp
        // thêm thông tin cho url mà không cần phải định nghĩa route mới
        // vd http://localhost:8080/home?page=1&limit=10

        // 4 Các loại reporitory hay dùng với Spring
        // CrudRepository
        // JpaRepository
        // PagingAndSortingRepository

        // Thực chất các Repository này có thể extends nhau là bậc parent child của nhau
        // JpaRepository kế thừa cả interface CrudRepository và
        // PagingAndSortingRepository rồi
    }
}
