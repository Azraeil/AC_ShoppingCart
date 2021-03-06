AC Rails 購物車 App 練習。

---
# 購物車 User Stories
三個角色：
- Visitor：訪客。
- Customer：顧客，爲訪客註冊而來。
- Admin：後台管理員。
## Phase 1: 商品展示
- Visitor 可以瀏覽商品 (Product)
- Admin 可以上架商品
  - 加入會員系統 (Devise)，進入後台必須檢查權限
  - 撰寫一個 rake 來建立假商品資料
    - 假資料有 100 筆
    - 商品有圖片屬性，用第三方 API 如 `FFaker::Avatar.image` 來產生內容
  - 撰寫 seed 放預設的管理員資料
## Phase 2:
- Visitor 可以把商品放入購物車 (Cart)
  - 點選「加入購物車」按鈕時，用 Ajax 效果將商品加入購物車
  - 可以調整購物車中的商品數量或移除商品 (Ajax)
- Visitor 可以瀏覽購物車內容，顯示有多少商品在購物車裡面
## Phase 3: 成立訂單
- Customer 可以結帳成立訂單 (Order)
  - 開始結帳時要求登入
  - 訂單欄位包括收件人資訊，並備份訂單成立時的金額明細
  - 訂單成立後，Customer 會收到系統寄發的 e-mail 通知，信件內容會確認收款資訊並告知匯款方法
- Admin 可以看到訂單一覽
- Admin 可以修改訂單出貨狀態，選項有：未出貨 (預設) ／ 已出貨 ／ 已取消
  - 當修改成「已出貨」狀態時，自動寄出 E-mail 通知
- Admin 可以修改訂單金流狀態，選項有：等待匯款 (預設) 、已匯款
  - 當修改成「已匯款」狀態時，自動寄出 E-mail 通知
- Customer 可以瀏覽訂單紀錄
- Customer 可以取消尚未出貨的訂單
## Phase 4: 線上支付
- Customer 可以在線上刷卡支付（整合智付通金流服務)

---
## 購物車 ERD
![](https://i.loli.net/2018/05/22/5b03b9803476f.png)
