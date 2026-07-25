#!/usr/bin/env bash
# ============================================================
#  Satoranth CEO OS — B51-HQ73 배포 스크립트
#  사용법: 이 폴더(deploy_pkg)에서 터미널 열고  bash DEPLOY.sh  실행
#  * git이 설치돼 있고, GitHub 로그인(PAT 또는 SSH)이 돼 있어야 함
# ============================================================
set -e

REPO="https://github.com/ndebb/kpopwitch.git"
BRANCH="profile"
WORK="_kpopwitch_repo"

echo "▶ 1/5  레포 클론 (branch: $BRANCH)"
rm -rf "$WORK"
git clone --branch "$BRANCH" --depth 1 "$REPO" "$WORK"

echo "▶ 2/5  App.jsx 교체"
mkdir -p "$WORK/satoranth-deploy/src"
cp satoranth-deploy/src/App.jsx "$WORK/satoranth-deploy/src/App.jsx"

echo "▶ 3/5  에셋 18개 복사 (public/assets)"
mkdir -p "$WORK/satoranth-deploy/public/assets"
cp satoranth-deploy/public/assets/*.webp "$WORK/satoranth-deploy/public/assets/"

echo "▶ 4/5  커밋"
cd "$WORK"
git add -A
git commit -F - << 'MSG'
B51-HQ73: 소개팅/커플 육성 시스템 대개편 + 단계별 배경 에셋

[버그 수정]
- 소개팅 승급: 키워드 목록 폐기, 채점 모델이 도달 단계 직접 판단 (HQ58)
- 베드씬 실패 팝업/관계 미상승: 애정도 반영을 배달 전으로 분리 (HQ59)
- ACTING 스탯 NaN: 로드 시 스탯 정규화 + 전 계산 Number() 방어 (HQ60)
- 연기 버튼 먹통: runImprov finally로 judgeBusy 무조건 해제 (HQ61)
- 상단 HUD 게이지: meta.dates에서 항상 파생, 대화창과 동기화 (HQ62/63)
- HUD 다음 목표(NEXT): 렌더 시점 재계산으로 항상 표시 (HQ64)
- 관전(5턴 자동)에도 게이지·배경 반영 (HQ65)
- 침실 없는 캐릭터 배경 폴백 체인 (HQ66)

[신규 기능]
- 단계 사다리 재설계: 썸→볼→입맞춤→깊은키스→애무→깊은애무→잠자리→임신→출산 (HQ69)
- 캐릭터 자동 관계 제안: 단계 도달 시 사귀자/약혼/결혼 먼저 꺼냄 (HQ69)
- im yours 고백 수락 화면: 제안 수락 시 「저는 이미 당신의 것이에요」+전용컷 (HQ71/72)

[에셋]
- 젤라토: intimate/kiss 추가
- 카일라: cheek/kiss/aemu/aemu_deep/intimate/imyours 6컷
- 미오: cheek 추가
- 틴토: cheek/kiss/intimate 3컷
MSG

echo "▶ 5/5  푸시"
git push origin "$BRANCH"

echo ""
echo "✅ 배포 완료! Vercel이 자동으로 새 빌드를 시작할 거야."
echo "   (레포 클론 폴더: $WORK — 확인 후 지워도 됨)"
