# SMIT Preview 디자인 시스템 — 전체 이미지 랜딩

기준일: 2026-11-10 (Asia/Seoul). 적용 범위: 메인·공통 헤더·버튼·카드. 이 문서가 현재 채택 규칙이다.

## 1. 근거·기술 스택

- **확인:** 정적 `index.html` 한 파일에 CSS/vanilla JS. `.header`, `.btn`, `.course`, `.panel`, `.answer`, `.slot`, `.field`가 공통 컴포넌트다. screen 전환 3개, 수업 데이터 3종, Map 기반 활동 보관, Supabase POST 신청을 사용한다. npm 패키지는 CLI 개발 도구이며 새 UI 의존성은 추가하지 않는다.
- **레퍼런스 확인값:** Drivelodge를 1440×1000·390×844에서 실제 확인했다. 흰 제목의 전체 이미지 히어로, 투명 내비게이션, 64px 데스크톱 좌우 여백, 64px/400 제목, 8px 버튼·카드 모서리를 관찰했다. 자세한 값과 미확인은 `design-reference.md`에 분리한다.
- **채택 우선순위:** SMIT 빨강·실제 학교 사진·영문 문구·데이터 보안 > Drivelodge의 랜딩 구성 > Reference Lab의 카드 위계·즉시 피드백. 파랑·차량 이미지·패럴랙스·제품 문구는 복제하지 않는다.

## 2. 현재 채택 토큰

| 변수 | 채택값 | 역할 |
| --- | --- | --- |
| `--paper` | `#F6F6F4` | 밝은 본문 배경 |
| `--white` | `#FFFFFF` | 사진 위 글자·카드·입력 |
| `--ink` | `#202427` | 밝은 배경의 제목·본문 |
| `--muted` | `#61676B` | 보조 설명 |
| `--red` / `--red-hover` | `#AE152D` / `#8F1025` | 기존 학교 브랜드와 주 행동 |
| `--red-secondary` | `#CC3A3A` | 작은 강조 |
| `--tint` | `#F8EAED` | 선택 상태·결과 |
| `--accent` | `#EFE5DC` | 번호·작은 장식 |
| `--line` | `#DDD8D4` | 밝은 배경 테두리 |
| `--focus` | `#8F1025` | 밝은 영역의 3px 포커스 |
| `--hero-ink` | `#14212B` | 사진 미로드 시 배경 |
| `--hero-scrim` | 왼쪽 `rgba(8,18,26,.82)` → 오른쪽 `.18` | 흰 제목 가독성. 레퍼런스 관찰값이 아닌 SMIT용 결정 |
| `--radius` / `--radius-control` | `12px` / `8px` | 카드 / 버튼·입력. 이전 20/10px에서 간결하게 조정 |
| `--content-width` | `1280px` | 본문 및 헤더 콘텐츠 너비 |
| `--hero-copy-width` | `640px` | 히어로 문구 최대 폭 |
| `--space-1..8` | `4,8,12,16,24,32,48,64px` | 기존 간격 체계 유지 |
| `--shadow` | `0 16px 40px #35242C0D` | 필요 시 보조 카드만. 전체 배경 사진에는 그림자 없음 |

모두 우리 프로젝트의 채택값이다. 레퍼런스의 공식 토큰이라고 주장하지 않는다.

## 3. 타이포그래피·한글

- 기존 시스템 스택 `system-ui, -apple-system, Segoe UI, Malgun Gothic, sans-serif` 유지. 웹폰트 로딩 없음.
- 히어로 `clamp(48px,5.6vw,80px)` / 1.06, 500, 자간 -0.045em. 모바일 600px 이하 `clamp(42px,10.5vw,56px)`.
- 본문 16px / 1.65, 보조 14px. 사진 위 설명 16px / 1.65, white 90%. 제목·버튼은 짧은 영어.
- h2 24~32px / 1.25, h3 19~21px. 버튼 14px/700, 최소 높이 48px. 원본의 400 굵기를 모든 제어 요소에 복제하지 않는다.
- `:lang(ko)`에서 `word-break:keep-all;overflow-wrap:break-word`. 기본 영어 normal wrapping. 입력·모바일 select 16px 유지. 한글 본문의 실제 렌더링은 별도 검증 전 미확인.

## 4. 랜딩·헤더·사진

- `.shell`은 viewport 전체 폭. 메인 `.hero`가 배경 사진 무대이며 `min-height:100svh`, 최소 760px, 데스크톱 padding-top 160px / bottom 150px.
- 배경은 기존 `.campus-visual`과 `#hero-photo`를 재사용해 absolute inset 0, object-fit cover, radius 0으로 배치한다. overlay 스크림은 hero 상위 레이어에서 담당한다. parallax·자동 슬라이드·자동 영상은 추가하지 않는다.
- 히어로 문구는 640px 이내, 화면 좌우 padding은 `max(32px, calc((100% - 1216px)/2))`. 왼쪽에 주요/보조 버튼, 오른쪽 아래에 짧은 학교·도시 사진 캡션. 이미지 전경의 정확한 구조물 강조보다 텍스트 읽기를 우선한다.
- 랜딩 상태에서만 헤더를 상단 absolute로 겹치고 흰색 브랜드·링크와 빨간 preview 버튼을 사용한다. 체험·신청 화면에서는 밝은 배경의 일반 헤더로 복귀한다. 스크롤을 따라 덮는 fixed 내비게이션은 채택하지 않는다.
- 본문 `.landing-content`, 체험·신청 화면은 최대 1280px, 좌우 32px. 사진 무대와 밝은 카드 구역을 분리한다. 본문 위아래 간격 64px, 모바일 32px.
- 공식 SMIT 사진 3개와 출처·alt 유지. 하루 선택에 따른 이미지 교체 기능 유지. 원본 자동차 사진·로고·영상은 사용하지 않는다.

## 5. 공통 컴포넌트·반응형

- 버튼: radius 8px, 주 행동 빨강/흰색. 히어로 보조 버튼은 흰색/짙은 글자. hover 지원 기기에서만 배경·아이콘 160ms 전환. disabled .55·wait·이동 없음.
- 포커스: 일반 영역 3px 짙은 빨강/offset 4px. 이미지 히어로·투명 헤더에서는 흰색 링 + 어두운 외곽선을 사용한다. 키보드와 선택 상태를 구분한다.
- 카드: 12px 모서리·1px 테두리, padding 24~28px, 기본 그림자 없음. 선택은 빨간 border·tint·체크로 표시. 여정과 수업은 3열, 갤러리 2열, 모바일 1열.
- 850px 이하: 히어로는 단일 사진 무대 유지. 601~850px에서 제목 64px. 작은 보조 캡션 숨김, 데스크톱 추가 메뉴 숨김. 큰 메뉴 대신 기존 직접 preview 행동 제공. 하루 상상 1열, 주간표는 요일별 행.
- 600px 이하: hero padding `124px 20px 52px`, 최소 높이 `max(780px,100svh)`. 버튼 세로 전체 너비, 배경 object-position 56% center. 추가 bottom 메타 문구와 헤더 preview 보조 버튼 숨김. 동일 체험은 hero 시작 버튼·여정 카드로 접근 가능. 외부 학교 링크는 줄바꿈하지 않는다. 본문 좌우20px·카드20px. 수업·여정·갤러리·결과 1열. 시간대도 각각 한 행으로 배치한다.
- 380px 이하: 본문/hero 좌우16px.
- reduced-motion: 기존 전환·이동 제거 규칙 유지. 원본의 거대한 패럴랙스나 관성 스크롤을 추가하지 않는다.

## 6. 기존 기능·데이터 계약

수업 데이터·선택별 피드백, 주간표·통계·활동 보존, 진행 표시, 하루 상상 3종을 유지한다. 기존 Supabase URL·publishable 키·신청 handler·payload·return=minimal·20초 타임아웃·오류복구는 변경하지 않는다. RLS·DB 스키마·배포 설정도 수정하지 않는다. 이번 디자인 검증에서 실제 고객 데이터를 읽거나 새 신청을 넣지 않는다.

## 7. 검증 결과

### 확인·브라우저 — 수정한 SMIT 페이지

검증 주소: `http://127.0.0.1:5175/`. 아래는 Drivelodge와 별개인 SMIT 구현 검증이다.

| 조건 | 실제 결과 |
| --- | --- |
| 1440×1000 | innerWidth 1440, clientWidth/scrollWidth 1425. hero 실측 폭 약 1424.8px·높이1000px, 제목80px. 전체 배경 사진이 본문 max-width에 제한되지 않음을 확인 |
| 1280px | innerWidth1280, clientWidth/scrollWidth1265. 전체 배경·투명 헤더·CTA와 사진 로드 확인. 내용량에 따라 hero 높이는 100svh보다 커질 수 있음 |
| 390×844 | innerWidth390, clientWidth/scrollWidth375. 제목42px, CTA column, 추가 메뉴 숨김. 메인·체험·신청 가로 넘침 없음 |
| 320×740 | innerWidth320, clientWidth/scrollWidth305. 헤더 실측 폭304.8px, preview 보조 버튼 숨김. 메인 가로 넘침 없음 |
| 경계 양쪽 | 실제848/852px에서 추가 메뉴 none/flex. 실제598/604px에서 CTA column/row. 네 조건 모두 clientWidth=scrollWidth |
| 화면 전환 | 랜딩 header absolute·흰 글자 → 체험에서 header static·짙은 글자(`rgb(32,36,39)`) 복귀 확인 |
| 하루 선택·키보드 | 보조 CTA Enter로 결과 제목에 포커스 이동. Explore Seoul Enter 선택으로 사진·아침 문구·aria-pressed 변경. 선택 버튼 focus-visible true |
| 사진 위 포커스 | 주 CTA에서 Tab으로 보조 CTA 이동, focus-visible true·outlineColor white 확인 |
| 수업·주간표 | 세 수업 피드백과 통계: 디자인2일/6시간, 데이터3일/8시간, 서비스2일/4시간. 수업 전환 후 기존 활동 유지 |
| 모바일 조작 | 활동 변경 가능, 주간표 select16px. 빈 필수 이름과 잘못된 이메일에서 해당 필드 포커스·성공 미표시 확인 |
| 진행 표시 | 체험 선택+주간 활동 후2/2표시 유지 |
| 오류 | 확인 시점 브라우저 error 로그0개 |

### 확인·소스

- JavaScript 문법 검사 통과. Git 기존 버전과 줄바꿈을 정규화해 비교한 결과 Supabase 설정·신청 handler는 동일하다.
- focus-visible·disabled·reduced-motion 규칙과 한글 keep-all을 유지했다. 기존 전송 대기/성공/실패 코드를 수정하지 않았다.
- `AGENTS.md`의 기존 지침을 보존하고 현재 전체 이미지 랜딩 규칙을 따르도록 항목 하나를 추가했다.
- 레퍼런스 브랜드·이미지·문구를 복제하지 않았으며, 사용자의 미추적 이미지 파일은 변경하지 않았다.

### 미확인

- 이번 작업은 새 신청을 실제 DB에 넣거나 기존 신청을 읽지 않았다. 원격 Supabase 저장 성공·서버 현재 상태를 재검증한 것으로 주장하지 않는다.
- 실제 폰트 파일, 스크린리더, 실물 모바일·소프트 키보드, 한글 본문 실제 줄바꿈은 미확인이다.
- hover의 전후 픽셀값·OS reduced-motion 실제 전환은 CSS 확인만 했다. 원본 Drivelodge의 전체 페이지·브레이크포인트·모든 동작을 검사한 것은 아니다.
