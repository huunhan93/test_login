# test_login

# WEB API NETCORE 8.0 
- Cần cài đặt NetCore SDK 8.0 , SQL Server 12.0
- Flutter 3.24.0 ; Dart 3.5.0
- Mở thư mục src, chạy QLVTNNCMS.sln 
- Các API nằm ở thư mục QLVTNNCMS.API 
- Thư mục chưa các Migration kết nối DB ở project QLVTNNCMS.Data


# Test API bằng postman 
- File export postman nằm ở thư mục /postman

# Flutter 
- Project nằm ở thư mục /test_login

# Hướng dẫn cài đặt 
- Bước 1: publish API project QLVTNNCMS.API lên IIS với port 8084 (hoặc 1 port tùy thích)
- Bước 2: test API login bằng postman
 + Địa chỉ cần test login: http://[ipmaytinh]:8084/api/admin/auth 
 + User/Pass: admin/Admin@123#
- Bước 3: chạy flutter 
 + Sửa IP lại trong file /lib/constants.dart 
 + const serverName = "[ipmaytinh]";
 + test đăng nhập bằng tài khoản trên
 + Nếu chạy trên máy thật chỉ cần kết nối cùng 1 wifi hoặc 1 mạng LAN là có thể kết nối được
