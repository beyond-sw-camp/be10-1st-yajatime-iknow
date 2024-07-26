# 💡 I_Know💡
<img src="https://github.com/user-attachments/assets/bf3aba34-18b6-47da-a5fa-1626d6849db1" width="300" height="300">

## 💡맴버🥰
| 구대윤 | 신민철 | 안세령 | 연건창 | 임서연 | 황희순 |
| --- | --- | --- | --- | --- | --- |
| 1 | 2 | 3 | 1 | 2 | 3 |



## 💡 프로젝트 소개❓  
- **I_Know**는 **나만 아는 생활속 꿀팁**에 대한 정보나 방법들을 다양하게 공유하는 서비스입니다. 
- 사용자는 생활 속 꿀팁을 공유하며 서비스 내의 화폐인 <u>“온”</u>(100의 옛 말)을 통해 화폐를 얻을 수 있습니다. 
- “온”을 얻은 사용자는 생활 속 꿀팁 중 조회수, 좋아요 수, 공식 마크를 받은 질 좋은 꿀팁을 구매해 다양한 정보를 얻을 수 있습니다. 
- 해당 프로젝트를 통해 사용자는 일상 생활 속 유용한 정보를 얻어 적용함으로써 삶의 질을 향상할 수 있으며, 나만 아는 꿀팁을 공유해 “온”을 얻음으로써 성취감을 느낄 수 있습니다.

## 💡 프로젝트 필요성🙋‍♀️
- ‘I_Know’는 일상 생활에서 사용하는 물건들을 사용할 때, 나만 아는 다른 사용법이나 정보들을 공유하는 플랫폼입니다.

#### [발을 씻자 다양한 사용 실제 사례]
<img src="https://github.com/user-attachments/assets/61a72db0-9dcd-4a01-8fe3-3002e1540323" width="500" height="500">
    
- 해당 제품은 발을 세척하는 용도로 사용되는 제품입니다. 하지만 해당 제품의 세척 능력이 뛰어나 발을 세척하는 용도 외에 화장실 청소, 주방 청소 등 다양한 용도로 사용되고 있습니다. 
- 해당 제품처럼 주 사용 방법 뿐만 아니라 다양한 사용법과 정보들인 꿀팁을 공유하면서 일상 생활의 편안함과 새로운 정보를 제공하는 플랫폼 입니다.

## 💡프로젝트 주요 기능🛠
1. 정보 공유
2. 고객 관리
3. 문의 & 인증
4. 자세한 팁 질문 게시판

## 💡프로젝트 사업성👍
1. 좋아요, 조회수 등 일정 기준을 측정하면 관리자는 팁에 뱃지를 제공합니다.1-1. 뱃지를 받은 팁은 프리미엄 팁으로 전환됩니다.
2. 사용자는 프리미엄 팁을 구매한 ‘온’을 교환하여 질 좋은 정보를 열람할 수 있습니다.
- “온”이 부족한 사용자는 “온”을 구매하여 정보를 열람할 수 있습니다.
- 질 좋은 팁을 공유한 사용자에게는 “온”을 지급하여 다른 정보를 얻을 수 있습니다.
## 💡기술스택🖥️
<img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=MariaDB&logoColor=white">
<img src="https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=Ubuntu&logoColor=white">
<img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=Github&logoColor=white">
<img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=Linux&logoColor=black">


## 💡요구사항 명세서📕
## 💡DB 설계문서📗
## 💡테이블 정의서📘

<details><summary>회원 테이블-user
</summary>

- user_num: 회원의 고유한 번호 저장
- user_id: 회원의 아이디 저장
- user_email: 회원의 이메일 주소 저장
- user_interest: 회원의 관심사 저장
- user_birth: 회원의 생년월일 저장
- user_gender: 회원의 성별 정보 저장
- user_auth: 회원의 상태 정보 저장(정상, 정지)
- user_role: 회원의 권한 상태 정보(일반유저, 관리자)
- user_on: 회원의 온(화폐) 보유 정보
- user_reportcnt: 회원이 신고 당한 횟수 저장
- user_stopcnt: 회원의 정지 일 수 정보 저장(7일, 30일, 영구)

![회원테이블](https://github.com/user-attachments/assets/dd152258-2f53-4f8a-bbd8-ca8ce79534c5)

</details>

<details><summary>신고기록 테이블-report_record
</summary>

- report_num: 신고의 고유한 번호 저장
- report_user_num: 신고의 대상이 된 회원 번호 저장
- report_date: 신고한 날짜와 시간 저장
- report_content: 신고한 사유 저장
- user_num: 신고를 한 회원의 번호 저장
- question_num: 신고한 질문 글 번호 저장 (NULL 값 허용)
- answer_num: 신고한 답변글 번호 저장 (NULL 값 허용)
- tip_reply_num: 신고한 팁 게시글 댓글 번호 저장 (NULL 값 허용)
- tip_post_num: 신고한 팁 게시글 번호 저장 (NULL 값 허용)

![신고기록테이블](https://github.com/user-attachments/assets/460e3f7b-6d67-4051-8e57-f9a522437b81)
</details>

<details><summary>QnA 질문 글 테이블 - questions
</summary>

- question_num: 질문 글의 고유 번호 저장
- category_num: 질문 글의 카테고리 번호 저장
- user_num: 질문 글을 작성한 회원번호 저장
- question_title: 질문 글의 제목 저장
- question_content: 작성한 질문 글의 내용 저장
- create_date: 질문 글을 작성한 날짜와 시간 저장
- update_date: 질문 글을 수정한 날짜와 시간 저장
- on_count: 질문자가 내건 온(화폐)의 수 저장
- is_blinded: 질문 글의 신고로 인한 블라인드 여부 (true, false)

![QnA질문글테이블](https://github.com/user-attachments/assets/9fc4a985-25de-41a6-82bb-f38c8380db81)

</details>

<details><summary>QnA 답변 글 테이블 - answers
</summary>

- answer_num: 답변 글의 고유한 번호 저장
- user_num: 답변을 작성한 회원의 번호 저장
- question_num: 답변을 작성한 질문 글의 번호 저장
- answer_content: 답변 글의 내용 저장
- create_date: 답변 글을 작성한 날짜와 시간 저장
- update_date: 답변 글을 수정한 날짜와 시간 저장
- is_chosen: 질문자의 답변 글 채택 여부 저장
- is_blinded: 답변 글의 신고로 인한 블라인드 여부 (true, false)

![QnA답변글테이블](https://github.com/user-attachments/assets/cbf8f22c-5287-4e9a-ac16-03c29278cf2f)

</details>
<details><summary>첨부파일 테이블 - attachment
</summary>

- file_id: 첨부한 파일의 고유 번호 저장
- question_num: 파일이 첨부 된 질문 글 번호 저장
- answer_num: 파일이 첨부 된 답변 글 번호 저장
- tip_post_num: 파일이 첨부된 팁 게시글 번호 저장
- tip_reply_num: 파일이 첨부된 팁 게시글 댓글 번호 저장
- file_name: 첨부된 파일이 이름 저장
- file_size: 첨부된 파일의 크기 저장

![첨부파일테이블](https://github.com/user-attachments/assets/1022d457-bd38-4c0a-ac2b-52a835304c24)

</details>
<details><summary>TIP 게시글 테이블 - tip_post
</summary>

- tip_post_num: 작성한 팁 게시글의 고유한 번호 저장
- category_num: 팁 게시글의 카테고리 번호 저장
- user_num: 팁 게시글을 작성한 회원번호 저장
- tip_post_title: 팁 게시글의 제목 저장
- tip_post_content: 팁 게시글의 내용 저장
- create_date: 팁 게시글 작성 날짜와 시간 저장
- update_date: 팁 게시글 수정 날짜와 시간 저장
- is_blinded: 작성한 팁 게시글의 신고로 인한 블라인드 여부 (true, false)
- view_count: 팁 게시글의 조회수 저장

![tip게시글테이블](https://github.com/user-attachments/assets/18a65a94-f90c-44d0-b44c-24ecd78b9306)
</details>
<details><summary>TIP 댓글 테이블 - tip_reply
</summary>

- tip_reply_num: 팁 게시글 댓글의 고유 번호 저장
- user_num: 팁 게시글에 대한 댓글을 작성한 회원 번호 저장
- tip_post_num: 팁 댓글을 작성한 TIP 게시글 번호 저장
- tip_reply_content: 팁 게시글 댓글 내용 저장
- create_date: 댓글을 작성한 날짜와 시간 저장
- update_date: 댓글을 수정한 날짜와 시간 저장

![tip댓글테이블](https://github.com/user-attachments/assets/0c3ecc82-a8d5-4887-bc1e-f4b0c7c57512)

</details>
<details><summary>카테고리 테이블 - category
</summary>

- category_num: 카테고리의 고유 번호 저장
- category_name: 카테고리의 이름 저장

![카테고리테이블](https://github.com/user-attachments/assets/be6e7215-8c84-4df8-ab72-845538e9e0b6)

</details>
<details><summary>TIP 좋아요 테이블 - like_contents
</summary>

- likes_num: 좋아요의 고유한 번호 저장
- user_num: 좋아요를 한 회원의 번호 저장
- tip_reply_num: 좋아요를 한 팁 게시글 댓글의 번호 저장
- tip_post_num: 좋아요를 한 게시글의 번호 저장
- create_date: 좋아요를 한 날짜와 시간 저장

![tip좋아요테이블](https://github.com/user-attachments/assets/df759c8b-4a68-4582-b291-0edd5f3e191f)

</details>
<details><summary>스크랩한 글 테이블 - scrap
</summary>

- scrap_num: 스크랩 한 글의 고유 번호 저장
- tip_post_num: 스트랩한 게시글 번호 저장
- user_num: 스크랩을 한 회원 번호 저장
- scrap_date: 스크랩 한 날짜와 시간 저장

![스크랩한글테이블](https://github.com/user-attachments/assets/3f2f0ed7-f719-4ddc-bdfc-324e315de509)

</details>
<details><summary>아이템 구매 내역 테이블 - credit
</summary>

- buy_num: 구매의 고유 번호 저장
- user_num: 구매한 회원 번호 저장
- item_num: 구매한 아이템 코드 저장
- on_use: 아이템을 구매하는데 사용한 온(화폐)의 수 저장


![아이템구매내역테이블](https://github.com/user-attachments/assets/fce3436a-c4dc-4bf4-9e23-c9705ae5ec8b)

</details>
<details><summary>아이템 테이블 - item
</summary>

- item_num: 아이템의 고유 번호(코드) 저장
- category_num: 아이템이 속한 카테고리 번호 저장
- item_name: 아이템의 이름 정보 저장
- item_price: 아이템의 가격 정보 저장

![아이템테이블](https://github.com/user-attachments/assets/818ad544-cac1-4a43-a496-d80102aec5f7)

</details>
<details><summary>아이템 보관함 테이블 - item_box
</summary>

- user_num: 아이템 보관함을 가지고 있는 회원 번호 저장
- item_num: 아이템 보관함에 저장된 아이템 번호(코드) 저장
- item_equip: 아이템의 장착 유무 정보 저장

![아이템보관함테이블](https://github.com/user-attachments/assets/d707039b-b089-437a-b38c-914af69d4b99)

</details>

<details><summary>아이템 장착 카테고리_상점 테이블 - item_equipcategory
</summary>

- category_num: 카테고리 고유 번호(코드) 저장
- category_clothes: 아이템의 착용 위치 저장

![아이템장착카테고리](https://github.com/user-attachments/assets/8254e793-7ea6-4736-af78-6bc395c7fea9)

</details>

## 💡코드 시연📖

<img src='https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F6326fa9e-f7c6-4b90-ae17-ad470381ee5c%2F339805d1-3f66-42bd-97e9-5da7d6e8ad98%2FUntitled.png?table=block&id=49765cad-d7fc-4a18-a563-55861847808e&spaceId=6326fa9e-f7c6-4b90-ae17-ad470381ee5c&width=2000&userId=40b11d14-da59-453a-8038-fe3a1fdf8c18&cache=v2'>




