# PC2 Scoreboard

### Giới thiệu
Bảng xếp hạng của [PC^2](https://pc2.ecs.csus.edu/) nhìn khá nhàm chán nên mình làm 1 bảng xếp hạng khác nhìn cho vui mắt một tí.
Bảng xếp hạng này so với bản gốc thì màu của **First Solve** sẽ đậm hơn. Kèm theo một số màu mè như **đồng hồ đếm ngược**, **thanh progress**.

### Hướng dẫn sử dụng
* Copy file **index.xsl** trong thư mục xsl vào **\pc2\data\xsl**
* Đăng nhập vào pc2board và bấm Refesh.
Trong đó pc2 là thư mục chứa PC2 của bạn, khi Refesh PC2 sẽ dùng file **index.xsl** này để generate ra file **index.html** nằm ở **\pc2\bin\html**
* Copy những file trong thư mục html đặt cùng với file index.html
Mình thì lúc tạo host mình đặt Document Root là folder chứa file index.php luôn, tức là **\pc2\bin\html**
* Đổi file logo trong thư mục **\html\img** bằng logo của bạn.
* Để chỉnh thời gian đếm ngược, mở file **\html\js\time.js**

### Features
* Add color for First Solve
* Countdown Timer
* Progress bar (change color to blue during freeze time)

### How to use
* Copy file **index.xsl** in **\xsl** folder and paste in your **\pc2\data\xsl** folder.
* Open Scoreboard Module (file pc2board) and click Refresh.
On Refresh the scoreboard module will read file **index.xsl** in the data\xsl directory and create a new **index.html** file in the html directory. 
* Copy files in **\html** folder and paste in the same folder with **index.html** (ex: **\pc2\bin\html**).
* Go to **\html\img** and replace these logo and favicon by your own ones.
* To set time for counting down, open time.js in **\html\img** folder.


![Demo](https://github.com/tncn1122/Custom-PC2-Scoreboard/blob/master/mini.png)

