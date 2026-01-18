## 📑 Book Store App Test Automation (Playwright)
본 프로젝트는 Robot Framework와 **Browser Library(Playwright)**를 활용하여 DemoQA 'Book Store' 서비스의 주요 비즈니스 로직을 자동화한 QA 포트폴리오입니다. 
+2

## 🚀 프로젝트 개요
사용자 가입 유효성 검사, 인증(Login), 도서 검색 및 상세 정보 확인 등 핵심 사용자 시나리오를 자동화하여 소프트웨어 품질을 검증합니다. 
+2

## 📂 프로젝트 구조 및 테스트 스코프
관심사 분리(SoC) 원칙에 따라 3개의 독립적인 테스트 스위트로 구성되었습니다.

### 1. 회원가입 유효성 검사 (00_register.robot) 


입력 폼 검증: 필수 필드 누락 시 UI 피드백(CSS 에러 클래스) 확인. 
+1


정책 검증: 비밀번호 복잡성 미달 시 페이지 전환 차단 확인. 


보안 요소 확인: CAPTCHA 미체크 시 시스템 메시지("Please verify reCaptcha...") 노출 검증. 

### 2. 사용자 인증 (01_login.robot) 


로그인 시나리오: 성공 시 프로필 이동 및 실패 시(비밀번호 오류, 존재하지 않는 계정) 에러 핸들링 검증. 
+3


접근 제어: 로그인 후 세션 유지 및 로그아웃 후 권한 박멸 확인. 


Keywords 활용: 중복 코드를 방지하기 위해 Login 키워드를 정의하여 유지보수성 향상. 

### 3. 도서 라이브러리 관리 (02_BookStore.robot) 


데이터 로드: 페이지 진입 시 도서 목록의 동적 로딩 여부 확인. 


검색 로직: 특정 키워드 검색 시 결과 테이블의 행(Row) 개수 및 데이터 일치성 검증. 


상세 정보: 상세 페이지 진입 시 URL 파라미터(ISBN) 정합성 확인. 


UI 제어: 페이지당 표시 행 수 변경 등 테이블 컨트롤 기능 검증. 

## 💡 기술적 트러블슈팅 및 핵심 역량
### ✅ 동적 상태 기반 동기화 (Dynamic Wait)
단순 Sleep 사용을 지양하고, Wait For Condition 및 Wait For Elements State를 사용하여 비동기적으로 변하는 웹 페이지 상태에 맞춘 안정적인 테스트를 구현했습니다. 
+3

### ✅ CSS 속성 검증을 통한 UI 테스팅
에러 발생 시 시각적으로 표시되는 빨간 테두리를 확인하기 위해 Get Attribute 키워드로 HTML 클래스의 변화(is-invalid)를 추적하는 정밀한 UI 검증 방식을 채택했습니다. 
+1

### ✅ CAPTCHA 대응 전략
자동화가 어려운 CAPTCHA 구간에 매몰되지 않고, 이를 인지한 시스템의 '에러 메시지 처리'를 검증 포인트로 설정하여 테스트 커버리지를 전략적으로 확보했습니다. 
+1

## 🏃 실행 방법
- 의존성 설치: pip install robotframework-browser
- 드라이버 초기화: rfbrowser init
- 전체 테스트 실행:

```Bash
robot -d results tests/
```
