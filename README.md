📋 Web Automation Portfolio (DemoQA)
Robot Framework와 **Playwright(Browser Library)**를 활용한 웹 UI 자동화 테스트 프로젝트입니다.

GitHub Actions를 통해 CI/CD 환경을 구축하였으며, 모든 테스트 결과는 실시간 웹 리포트로 제공됩니다.

🚀 1. 실시간 테스트 리포트 (Live Report)
이 프로젝트는 매 커밋마다 자동으로 테스트를 수행하고 그 결과를 웹에 게시합니다.

아래 링크에서 최신 테스트 수행 로그와 스크린샷을 확인할 수 있습니다.

🔗 실시간 테스트 리포트 확인하기 (클릭 시 Robot Framework의 상세 로그 페이지로 이동합니다.)

🛠 2. 주요 기술 스택 (Tech Stack)
언어: Python 3.10

프레임워크: Robot Framework

라이브러리: Browser Library (Playwright 기반)

CI/CD: GitHub Actions

배포: GitHub Pages

💡 3. 핵심 자동화 전략
Page Object Model (POM) 적용: 유지보수성을 높이기 위해 페이지 요소(Selectors)와 공통 키워드를 분리하여 관리합니다.

CI/CD 파이프라인: push 또는 pull_request 발생 시 Headless 모드로 브라우저 테스트가 자동 수행됩니다.

가시성 확보: 테스트 실패 시 자동으로 스크린샷을 캡처하고, 이를 웹 리포트에 포함하여 원인 분석을 용이하게 했습니다.

연습 대상: DemoQA 사이트의 복잡한 UI 요소(Text Box, Buttons 등)를 안정적으로 핸들링합니다.

📂 4. 프로젝트 구조
Plaintext

.
├── .github/workflows/    # CI/CD (GitHub Actions) 설정
├── tests/                # 실제 테스트 시나리오 (.robot 파일)
├── resources/            # 공통 키워드 및 페이지 오브젝트 (추가 예정)
├── results/              # 테스트 결과물 (CI 실행 시 생성)
├── requirements.txt      # 의존성 라이브러리 목록
└── README.md             # 프로젝트 설명서
🏃 5. 로컬에서 실행 방법
본 프로젝트를 로컬 환경에서 실행하려면 아래 명령어를 순서대로 입력하세요.

Bash

# 1. 저장소 클론
git clone https://github.com/YeongjunLim/webtest.git
cd webtest

# 2. 필수 라이브러리 설치
pip install -r requirements.txt

# 3. 브라우저 라이브러리 초기화
rfbrowser init

# 4. 테스트 실행
robot -d results tests/
✉️ Contact
Name: 임영준 (Yeongjun Lim)

GitHub: YeongjunLim

💡 리크루터에게 드리는 팁
README 상단에 Status Badge를 달아보세요. (성공 시 Passing 표시)

방법: ![Robot CI](https://github.com/YeongjunLim/webtest/actions/workflows/robot-ci.yml/badge.svg) 문구를 맨 위에 추가.

스크립트를 다 작성하신 후, 리포트(log.html)의 예쁜 스크린샷 한 장을 README 중간에 삽입하면 시각적 효과가 배가 됩니다.