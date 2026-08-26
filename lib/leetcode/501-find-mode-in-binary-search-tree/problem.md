501. Find Mode in Binary Search Tree

https://leetcode.com/problems/find-mode-in-binary-search-tree

## Follow-up chưa làm

Đề bài có follow-up: giải mà không dùng bộ nhớ phụ nào ngoài stack đệ quy.
Bản hiện tại dùng `Map<int, int>` để đếm — O(n) bộ nhớ phụ trong trường hợp
xấu (mọi giá trị khác nhau).

Hướng O(1) bộ nhớ phụ: tận dụng tính chất BST — in-order traversal cho ra
dãy tăng dần, nên các giá trị trùng nhau luôn đứng liền kề nhau trong dãy đó.
Chỉ cần duyệt in-order một lượt, giữ `prev` và độ dài đoạn lặp hiện tại
(`curCount`), cập nhật `maxCount`/danh sách kết quả khi đoạn lặp kết thúc —
không cần bảng băm nào.
