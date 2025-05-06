# cafefind

# ☕ Cafe Seat Tracker

Flutter 기반 모바일 앱으로, 주변 카페의 빈자리 정보를 실시간으로 확인하고  
카페 운영자가 직접 좌석 정보를 입력/관리할 수 있는 시스템입니다.

---

## 🔍 프로젝트 목적

- 손님에게는 실시간 빈자리 정보 제공
- 사장님에게는 카페 등록/관리 기능 제공
- 사장님 계정은 여러 직원이 함께 사용할 수 있는 구조

---

## 🛠️ 기술 스택

| 항목       | 내용                           |
|------------|--------------------------------|
| 프론트엔드 | Flutter (iOS & Android)       |
| 백엔드     | Firebase (Auth, Firestore, Storage, Cloud Functions 예정) |
| 상태관리   | Riverpod (`flutter_riverpod`) |

---

## 👥 사용자 유형 및 권한

### 👤 사장님 (owner)
- 매직 링크 이메일 로그인
- 카페 등록/수정, 좌석 입력, 사진 업로드
- 직원 초대 가능 (추후)

### 👤 직원 (staff)
- 동일한 카페 ID에 소속
- 로그인 후 좌석 수만 입력 가능

### 👤 손님 (guest)
- 로그인 없이 주변 카페 정보 열람 가능
- 지도에서 위치 확인

---

## 🔐 인증 방식

- 이메일 기반 매직 링크 로그인 (Firebase `sendSignInLinkToEmail`)
- 로그인 후 Firestore `users` 컬렉션에서 역할 확인 (`role: owner | staff`)
- 역할에 따라 UI 및 기능 분기

---

## 🧱 폴더 구조 (lib/)
```
lib/
├── core/ # 공통 상수, 유틸
├── data/ # Firebase 통신, models, repositories
│ ├── datasources/
│ ├── models/
│ └── repositories/
├── domain/ # Entity, UseCase, Repository interface
├── presentation/
│ ├── pages/
│ │ ├── splash_page.dart
│ │ ├── guest/
│ │ │ └── guest_home_page.dart
│ │ └── owner/
│ │ ├── login_page.dart
│ │ └── dashboard_page.dart
│ ├── viewmodels/
│ │ ├── owner_login_viewmodel.dart
│ │ └── guest_home_viewmodel.dart
│ └── widgets/ # 공통 재사용 위젯
├── firebase_options.dart # Firebase 설정
└── main.dart
```
