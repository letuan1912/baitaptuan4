# Bài Tập Flutter Tuần 4

Repo này lưu lại bài tập Flutter tuần 4 theo yêu cầu môn học.  
Project gồm 5 bài, mỗi bài được đặt trong thư mục lib/pages.

## 1. ListView
- Tạo danh sách cuộn các tên.
- Mỗi mục có avatar và tiêu đề.

## 2. GridView
- Sử dụng GridView.count và GridView.extent.
- Hiển thị 12 phần tử cho mỗi loại grid.
- Có khoảng cách và tỉ lệ khung theo yêu cầu.

## 3. Shared Preferences
- Nhập tên và lưu vào bộ nhớ.
- Hiển thị lại tên đã lưu.
- Có nút xóa dữ liệu.

## 4. Async
- Hiển thị thông báo "Loading user..."
- Sau 3 giây đổi thành "User loaded successfully!".
- Có thêm hiệu ứng tải và nút bắt đầu.

## 5. Isolate
- Tính giai thừa lớn (ví dụ: 30.000!).
- Dùng compute để xử lý nặng mà không treo giao diện.
- Có thanh tiến trình và khu vực hiển thị kết quả.

## Cấu trúc thư mục

lib/
  main.dart  
  pages/  
    list_view_page.dart  
    grid_view_page.dart  
    shared_pref_page.dart  
    async_page.dart  
    isolate_page.dart  

## Cách chạy project
- Mở bằng Android Studio.
- Chọn thiết bị Android hoặc emulator.
- Chạy lệnh:
flutter pub get
flutter run
