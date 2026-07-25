━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Satoranth CEO OS — B51-HQ73 배포 패키지
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

■ 가장 쉬운 방법 (자동 스크립트)
  1. 이 zip을 풀고
  2. 터미널에서 이 폴더로 이동
  3. 아래 한 줄 실행:

        bash DEPLOY.sh

  → 레포 클론 → App.jsx·에셋 교체 → 커밋 → 푸시까지 자동.
  → Vercel이 알아서 새 빌드 시작.

  * 사전 조건: git 설치 + GitHub 인증(아래 참고)


■ GitHub 인증이 안 돼 있으면
  둘 중 하나:
  (A) PAT 방식 — 푸시할 때 아이디/비번 물으면
      비번 자리에 fine-grained PAT 붙여넣기
  (B) SSH 방식 — 이미 SSH 키 등록돼 있으면
      DEPLOY.sh 안의 REPO 를
      git@github.com:ndebb/kpopwitch.git 로 바꾸면 됨


■ 수동으로 하고 싶으면
  - satoranth-deploy/src/App.jsx          → 레포 같은 경로에 덮어쓰기
  - satoranth-deploy/public/assets/*.webp → 레포 같은 경로에 복사
  - git add / commit / push


■ 포함된 것
  - satoranth-deploy/src/App.jsx          (최신 코드, HQ73)
  - satoranth-deploy/public/assets/       (에셋 18개 .webp)
  - DEPLOY.sh                             (자동 배포 스크립트)


■ 중요 (다음 작업)
  App.jsx가 이미 5.4MB야 (base64 이미지 인라인).
  다음엔 이미지를 CDN/레포에서 URL로 불러오는 구조로
  바꿔야 파일이 안 무거워짐. 지금 배포 후 정리 추천.
