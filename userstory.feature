Feature: Thanh toán giỏ hàng
Là một khách hàng tôi muốn thanh toán giỏ hàng để hoàn tất việc mua xe/phụ kiện

Happy path 1

Given Người dùng đã có tài khoản hợp lệ trên hệ thống.
And Người dùng đã đăng nhập thành công.
And Giỏ hàng đang có ít nhất 01 sản phẩm.
When Người dùng nhấn vào nút "Thanh toán" từ trang xem giỏ hàng.
And Người dùng xác nhận thông tin đặt hàng.
And Người dùng nhấn "Xác nhận đặt hàng".
Then Một bản ghi đơn hàng mới được tạo trong cơ sở dữ liệu với đầy đủ chi tiết các sản phẩm đã chọn.
And Hệ thống gửi một email thông báo xác nhận đơn hàng đến địa chỉ email của khách hàng.
And Thông báo hiển thị thông báo trên màn hình đặt hàng thành công.
And Biến Session chứa giỏ hàng phải được xóa.

Unhappy path 1 - không có sản pẩm 

Given Người dùng đã có tài khoản hợp lệ trên hệ thống.
And Người dùng đã đăng nhập thành công.
And Giỏ hàng không có sản phẩm.
When Người dùng nhấn vào nút "Thanh toán" từ trang xem giỏ hàng.
ThenThông báo hiển thị thông báo trên màn hình giỏ hàng trống.
And đơn hàng không được luu vào csdl.

Unhappy path 2 - chưa đăng nhập

Given Người dùng đã có tài khoản hợp lệ trên hệ thống.
And Người dùng chưa đăng nhập thành công.
And Giỏ hàng đang có ít nhất 01 sản phẩm.
When Người dùng nhấn vào nút "Thanh toán" từ trang xem giỏ hàng.
Then Thông báo hiển thị thông báo trên màn hình hiện vẫn chưa đăng nhập.
And sản phẩm không bị xóa khỏi giỏ.
And đơn hàng không được luu vào csdl.

Unhappy path 3 - lỗi kết nối 

Given Người dùng đã có tài khoản hợp lệ.
And Người dùng đã đăng nhập thành công.
And Giỏ hàng có ít nhất 01 sản phẩm.
When Người dùng nhấn vào nút "Thanh toán".
And Hệ thống gặp lỗi kết nối hoặc lỗi xử lý đơn hàng.
Then Hiển thị thông báo lỗi hệ thống, đề nghị thử lại sau.
And Đơn hàng không được lưu vào CSDL.
And Giỏ hàng vẫn giữ nguyên.

Feature: xem ds tài khoản người dùng
Là một quản trị tôi muốn xem danh sách tài khoản người dùng để xem toàn bộ người dùng đã đăng ký

Happy path 1

Given Người quản trị đã đăng nhập thành công.
And Hệ thống có tài khoản người dùng.
When Người quản trị truy cập vào trang "Danh sách tài khoản".
Then Hệ thống hiển thị danh sách tất cả tài khoản đã đăng ký

Unhappy path 1 - không có tài khoản 

Given Người quản trị đã đăng nhập thành công.
And Hệ thống chưa có tài khoản người dùng nào.
When Người quản trị truy cập vào trang "Danh sách tài khoản".
Then Hệ thống hiển thị thông báo "Chưa có tài khoản nào được đăng ký".

Unhappy path 2 - lỗi kết nối

Given Người quản trị đã đăng nhập thành công.
And Hệ thống chưa có tài khoản người dùng nào.
When Người quản trị truy cập vào trang "Danh sách tài khoản".
And Hệ thống gặp lỗi kết nối cơ sở dữ liệu.
Then Hệ thống hiển thị thông báo "Có lỗi xảy ra, vui lòng thử lại sau".
Danh sách tài khoản không được hiển thị.

User Story:
Là một khách hàng, tôi muốn xem danh sách các đơn hàng của mình được sắp xếp theo ngày mua để dễ dàng theo dõi lịch sử mua hàng.

Happy path 1 

Given khách hàng đã đăng nhập thành công vào hệ thống.

And khách hàng có ít nhất một đơn hàng trong hệ thống.

When khách hàng truy cập vào trang "Đơn hàng của tôi".

Then hệ thống hiển thị danh sách tất cả các đơn hàng của khách hàng.

And danh sách được sắp xếp theo ngày mua, với đơn hàng mới nhất ở đầu danh sách.

And mỗi đơn hàng hiển thị thông tin cơ bản: mã đơn hàng, ngày mua, tổng tiền, trạng thái.

Unhappy path 1 - Không có đơn hàng 

Given khách hàng đã đăng nhập thành công.

And hệ thống không có đơn hàng nào của khách hàng.

When khách hàng truy cập vào trang "Đơn hàng của tôi".

Then hệ thống hiển thị thông báo: "Bạn chưa có đơn hàng nào".

And không hiển thị danh sách đơn hàng.

Unhappy path 2 - lỗi kết nối

Given khách hàng đã đăng nhập thành công.

And hệ thống có đơn hàng của khách hàng.

When khách hàng truy cập vào trang "Đơn hàng của tôi".

And hệ thống gặp lỗi kết nối cơ sở dữ liệu.

Then hệ thống hiển thị thông báo: "Có lỗi xảy ra, vui lòng thử lại sau".

And danh sách đơn hàng không được hiển thị.

User Story:
Là một khách hàng, tôi muốn xem chi tiết đơn hàng của mình để biết những thông tin chi tiết thuộc đơn hàng đó;

Happy path 1 

Given khách hàng đã đăng nhập thành công vào hệ thống.

And khách hàng có ít nhất một đơn hàng trong hệ thống.

When khách hàng chọn một đơn hàng trong danh sách.

Then hệ thống hiển thị chi tiết đơn hàng.

Unhappy path 1 - Không có đơn hàng 

Given khách hàng đã đăng nhập thành công.

And khách hàng nhập hoặc chọn một mã đơn hàng không tồn tại.

When hệ thống tìm kiếm đơn hàng.

Then hệ thống hiển thị thông báo: "Đơn hàng không tồn tại".

And không hiển thị chi tiết đơn hàng.

Unhappy path 2 -  Lỗi phân quyền

Given khách hàng đã đăng nhập thành công.

And tài khoản khách hàng bị gán sai quyền (không có quyền xem chi tiết đơn hàng).

When khách hàng chọn xem chi tiết đơn hàng.

Then hệ thống hiển thị thông báo: "Bạn không có quyền truy cập chức năng này".


And chi tiết đơn hàng không được hiển thị.
