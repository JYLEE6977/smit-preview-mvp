# SMIT Preview 디자인 시스템

기준일: 2026-11-10 (Asia/Seoul). 범위: 메인 페이지·공통 헤더·버튼·카드 및 이 컴포넌트를 사용하는 기존 체험/신청 화면.

## 근거와 채택 구분

- **확인·소스:** `docs/design-reference.md`의 Reference Lab 인라인 CSS에서 밝은 배경, 카드 radius 20px, gap 24px, 단계 번호, 선택·포커스·disabled 규칙을 확인했다. 해당 로컬 파일은 브라우저의 `file://` 정책으로 열지 못했다. 원본의 실제 화면을 검증한 것으로 간주하지 않는다.
- **기존 프로젝트 확인:** 정적 HTML/CSS/JavaScript 한 파일 `index.html`. 빌드·UI 프레임워크 없이 동작한다. npm 의존성은 Supabase/Vercel CLI 개발 도구다. `.header`, `.btn`, `.course`, `.panel`, `.answer`, `.slot`, `.field`, `.form-card`가 재사용 컴포넌트 역할을 한다. `screen()`으로 3개 화면을 전환하고 Map으로 주간 활동을 보관한다. 신청은 기존 Supabase REST POST와 publishable 키를 사용한다.
- **우리 프로젝트 채택:** 원본의 녹색 대신 SMIT 빨강, 원본의 실습 폼 대신 학교 사진·하루 상상 선택·수업 체험을 사용한다. 사진, 그림자, 하루 체험 구성은 SMIT용 신규 결정이며 원본에서 관찰했다고 주장하지 않는다.
- **검증:** 아래 규칙은 채택값이다. 실제 브라우저 검증 결과는 문서 끝에 별도로 기록한다.

## 디자인 토큰

| CSS 변수 | 채택값 | 역할·근거 |
| --- | --- | --- |
| `--paper` | `#F7F5EF` | 따뜻한 전체 배경. 레퍼런스의 밝은 배경 역할 참고, 값은 신규 채택 |
| `--white` | `#FFFFFF` | 카드·입력 배경 |
| `--ink` | `#28232A` | 본문·제목 |
| `--muted` | `#6E666C` | 설명·보조 텍스트 |
| `--red` | `#AE152D` | 기존 SMIT 브랜드 유지, 행동·선택 |
| `--red-hover` | `#8F1025` | 활성 버튼 hover |
| `--red-secondary` | `#CC3A3A` | 보조 강조·작은 점 |
| `--tint` | `#F8EAED` | 선택·피드백의 옅은 배경 |
| `--accent` | `#F5DFA9` | 단계 번호·작은 장식의 따뜻한 보조색. 신규 채택 |
| `--line` | `#DDD8D4` | 카드·헤더·필드 테두리 |
| `--focus` | `#8F1025` | 공통 3px outline, offset 4px |
| `--radius` | `20px` | 카드, 원본 값 채택 |
| `--radius-control` | `10px` | 버튼·입력·일정 블록 |
| `--shadow` | `0 16px 40px #35242C0D` | 히어로 사진만 사용. 원본 관찰값 아님 |
| `--space-1/2/3/4/5/6/7/8` | `4/8/12/16/24/32/48/64px` | 반복 간격 체계 |
| `--content-width` | `1160px` | 기존 최대 너비 유지 |

## 타이포그래피·언어

- 시스템 폰트: `system-ui, -apple-system, "Segoe UI", "Malgun Gothic", sans-serif`. 외부 폰트 요청을 추가하지 않는다. 실제 선택된 폰트 파일은 별도 확인 전 미확인이다.
- 본문 16px / 1.65, 설명 14~16px / 1.65. 보조 라벨은 11~12px. 모바일 입력·select도 16px로 유지해 읽기 쉽게 한다.
- 히어로 제목 `clamp(38px, 4.6vw, 60px)` / 1.12, 700, 자간 -0.045em. h2 `clamp(24px, 3vw, 32px)` / 1.25, 700, 자간 -0.025em. h3 19px / 1.4, 700.
- 버튼 14px / 1.4, 700. 비정형 750·850 굵기를 복제하지 않는다.
- 제품 문구는 영어 유지. 문서와 추후 한글 콘텐츠에는 `:lang(ko){word-break:keep-all;overflow-wrap:break-word}`를 사용한다. 기본 영어는 `word-break:normal;overflow-wrap:break-word`. 작은 칸을 만들지 않는 레이아웃 조정이 우선이며 강제 한 글자 분할을 사용하지 않는다.

## 레이아웃·이미지

- shell 최대 1160px, 데스크톱 좌우 padding 32px. 헤더는 최소 높이 96px, 브랜드와 행동 영역 양 끝 배치, 일반 문서 흐름 유지.
- 메인 히어로는 `minmax(0,1.15fr) minmax(0,1fr)`, gap 48px, 세로 padding 48px. 사진 아래 ‘Possible day’ 캡션과 출처 있는 기존 학교 이미지를 사용한다.
- 히어로 바로 아래 하루 상상 카드: 데스크톱은 선택 영역 + 하루 일정 2열. 850px 이하에서 1열. 선택지는 같은 공간에서 사진·하루 문구만 갱신하며 실제 학교 시간표로 표현하지 않는다.
- 여정 카드와 수업 카드 3열, gap 24px. 갤러리 2열, gap 24px. 콘텐츠 단위 간격 48px, 모바일 32px.
- 패널 padding 28px, 모바일 20px. 카드 기본은 1px 선·흰 배경·20px 모서리, 기본 그림자 없음.
- 캠퍼스 사진은 object-fit cover, 중앙 크롭. 데스크톱 히어로 최소 높이 480px, 모바일 360px. 어두운 하단 그라데이션으로 흰 캡션을 받친다. 갤러리 사진 높이 220px, 모바일 190px.
- 이미지 URL·alt·출처는 실제 기존 SMIT 사이트 사진을 유지한다. 사용자의 `image.png`, `RE.jpeg`는 이번 작업에서 사용·변경하지 않는다.

## 컴포넌트와 상태

| 컴포넌트 | 규칙 |
| --- | --- |
| `.btn` | 빨강/흰색, 최소 높이 48px, padding 14px 20px, radius 10px. secondary는 흰색·본문색·테두리 |
| `.course`, `.journey-item` | 전체 버튼형 카드. 텍스트 좌측 정렬. 번호·분야 라벨·제목·짧은 설명·행동 문구 |
| 선택 카드/답 | `aria-pressed=true`, 빨간 border, 옅은 빨강 배경 및 ‘Selected’/체크 등 텍스트 표시 |
| 하루 선택 | 3개의 독립 toggle button, 실제 선택은 하나만 true. 결과 영역 `aria-live=polite`. 선택에 따라 헤더 사진과 3개 시간대 문구를 갱신 |
| 단계 진행 | 체험 답변·주간 활동 선택을 각각 1단계로 계산, 완료 수와 progress 즉시 갱신. 저장 신청 여부와 혼동하지 않음 |
| 입력 | 1px 테두리·흰 배경·10px radius, 16px 폰트, label 연결. 기존 필수값·maxlength·오류·전송 흐름 보존 |
| 주간표 | 데스크톱 7열, 850px 이하 요일별 1열·각 요일 내부 시간대 3열, 600px 이하 시간대도 1열. 모바일 select는 시간 라벨 옆 넓은 칸에 16px로 표시 |
| hover | hover 가능한 장치에만 버튼 밝기/배경, 카드 border·2px 이동. 160ms 전환 |
| focus | `:focus-visible` 3px `--focus`, offset 4px. 선택·hover와 별개 |
| disabled | opacity .55, cursor wait, hover 이동 없음. 기존 신청 전송 중 disabled/aria-busy 유지 |
| motion | `prefers-reduced-motion:reduce`에서는 전환·이동·부드러운 스크롤 제거 |

## 반응형 채택값

| 조건 | 규칙 |
| --- | --- |
| 기본 | 히어로 2열, 하루 상상 2열, 수업/여정 3열, 갤러리 2열, 주간표 7열 |
| 850px 이하 | 히어로·하루 상상 1열, 헤더 행동 작은 화면 허용, 주간표는 요일별 행. sticky를 추가하지 않음 |
| 600px 이하 | shell padding 20px, 수업·여정·갤러리·체험 답·결과 카드 1열, 버튼 줄바꿈, 패널 padding 20px. 학교 영문 정식명은 헤더에서 숨기고 SMIT Preview 이름과 외부 링크는 유지 |
| 380px 이하 | shell padding 16px, 헤더 ‘Your preview’ 버튼을 숨김. 시작 버튼·여정 카드로 동일 기능 접근 가능 |

## 기존 동작·데이터 보존

- 세 화면 전환, 세 수업/선택별 피드백, 수업별 주간표·등교일·시간 계산, 활동 Map 보존.
- 기존 Supabase URL·publishable 키·POST payload(name/contact/message), `return=minimal`, 타임아웃·오류·전송중 중복 방지 보존.
- 디자인 검증은 우선 잘못된 입력과 네트워크 실패 처리를 사용하며, 실제 고객 행을 읽거나 불필요한 시험 신청을 추가하지 않는다.
- 기존 RLS·SQL·배포 설정은 디자인 적용 범위 밖이다. 별도 의존성·프레임워크를 추가하지 않는다.

## 실제 검증 결과

### 확인·브라우저

검증 대상은 수정한 SMIT 프로젝트의 `http://127.0.0.1:5174/`이다. 차단된 레퍼런스 파일을 우회해 열지 않았다.

| 화면·조작 | 실제 결과 |
| --- | --- |
| 데스크톱 1280×900 | `innerWidth=1280`, clientWidth/scrollWidth 모두 1265. 메인·체험 가로 넘침 없음. 히어로 2열, 주간표 7열 확인 |
| 모바일 390×844 | `innerWidth=390`, clientWidth/scrollWidth 모두 375. 메인·체험·신청 가로 넘침 없음. 주간표 요일·시간대 1열, select computed font-size 16px |
| 작은 모바일 320×740 | `innerWidth=320`, clientWidth/scrollWidth 모두 305. 메인/헤더 가로 넘침 없음. 헤더 보조 preview 버튼 숨김 확인 |
| 중간 너비 848 / 852px | 실제 innerWidth 각각 848 / 852. matchMedia 850px 이하 true / false, 히어로 1열 / 2열, 가로 넘침 없음 |
| 중간 너비 598 / 604px | 실제 innerWidth 각각 598 / 604. matchMedia 600px 이하 true / false, 모바일 규칙 전환 및 가로 넘침 없음 |
| 적용 토큰 | body computed background `rgb(247,245,239)`, 하루 상상 카드 radius 20px 확인 |
| 하루 선택 | Explore Seoul을 Enter로 선택해 아침 문구와 사진 변경, Meet people으로 결과 라벨 변경 확인 |
| 키보드 포커스 | Enter 사용 후 해당 버튼이 `:focus-visible`에 매치함. 소스 outline 3px, 이 브라우저가 반환한 computed outline-width는 2.4px였음. 값 차이의 원인은 확정하지 않음 |
| 수업 3종 | 디자인 2일/6시간, 데이터 3일/8시간, 서비스 2일/4시간. 각 체험 선택에 따른 역량·진로 결과 확인 |
| 활동 보존 | 화요일 오전에 한국어 활동 선택 후 수업을 바꿨다 돌아와 선택 유지 확인. 모바일에서도 다른 활동으로 변경 가능 |
| 진행 표시 | 수업 답변 + 주간 활동 선택 후 `2 of 2 steps` 확인 |
| 신청 검증 | 빈 필수 이름과 올바르지 않은 이메일에서 브라우저 검증·해당 필드 포커스·성공 화면 미표시 확인. 실제 신청 POST는 보내지 않음 |
| 이미지 | 메인 이미지·갤러리 2개 모두 complete/naturalWidth를 통해 로드 성공 확인 |
| 런타임 오류 | 확인 시점 브라우저 error 로그 0개 |

clientWidth와 innerWidth 차이는 관찰값으로 기록했으며, 화면 너비를 요청값만으로 판정하지 않았다. 850/600px 부근의 요청값과 실제 innerWidth가 소수점·반올림 영향으로 일부 달라져, 위의 여유 있는 경계 양쪽과 matchMedia 결과로 전환을 확인했다. 원인의 정확한 환경 설정은 미확인이다.

### 확인·소스 및 격리 테스트

- JavaScript 문법 검사 통과.
- Git 기존 버전과 줄바꿈을 정규화해 비교한 결과 Supabase URL·공개 키·신청 전송 핸들러가 동일하다.
- 기존 신청 핸들러를 별도 Node VM의 가짜 form/fetch로 실행해 전송 대기 중 disabled/aria-busy, 성공 시 완료 화면·입력 초기화, 실패 시 오류 표시·재시도 가능 상태 복원을 검증했다. 실제 네트워크 요청·DB 쓰기는 발생하지 않았다. 이는 브라우저 실제 disabled 전환 검증과 구분한다.
- 코드에 `prefers-reduced-motion` 분기, 공통 focus-visible, 한글 `:lang(ko)` 단어 단위 줄바꿈 규칙을 확인했다.

### 미확인

- 레퍼런스 원본의 실제 데스크톱·모바일 렌더링, computed style은 계속 미확인이다.
- 실제 글꼴 파일과 대체 폰트, 한글 본문의 실제 줄바꿈, 스크린리더·실물 휴대전화·소프트 키보드 동작은 확인하지 않았다.
- hover 색·이동, OS reduced-motion 설정 상태의 실제 전환은 CSS 규칙만 확인했다.
- 이번 디자인 변경에서 새 Supabase 신청을 저장하거나 기존 신청을 읽지 않았다. 현재 원격 DB 상태와 라이브 저장 성공을 재검증한 것으로 주장하지 않는다.
