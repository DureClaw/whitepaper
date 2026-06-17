# DureClaw — Technical Whitepaper

DureClaw **기술 백서**를 쓰고 PDF로 빌드하는 repo입니다.
_The source + build pipeline for the DureClaw technical whitepaper._

## 📄 다운로드 / Download

- **[DureClaw-Whitepaper-v1.0-KO.pdf](DureClaw-Whitepaper-v1.0-KO.pdf)** — 한국어판 (Korean edition)
- **[DureClaw-Whitepaper-v1.0-EN.pdf](DureClaw-Whitepaper-v1.0-EN.pdf)** — English edition

같은 내용을 두 판으로 — 한글중심 / 영어중심. _Same content, two editions._

## 무엇을 다루나 / Contents

분산 디바이스를 하나의 협력 AI 크루로 묶는 DureClaw의 설계를 정리합니다 — _the design behind turning scattered devices into one collaborating AI crew._

- **문제 / The Problem** — 키·비용, 데이터 주권, 통합, 신뢰의 네 가지 벽
- **핵심 아이디어 / Core Idea** — 한 두뇌·여러 손, keyless 엣지, 결정 동결(LLM as compiler)
- **아키텍처 / Architecture** — 협력 버스(Phoenix Channel, 5-tuple), 마스터 브레인, 노드 패밀리(edgeclaw·webclaw·deskclaw + 어댑터)
- **결정 동결의 두 실재** — 제조 스킬 캐시 · 데스크톱 RPA 매크로
- **보안·거버넌스 / Security & Governance** — human-in-the-loop, keyless, 데이터는 엣지, 감사
- **적용 사례 / Use Case** — 분산 엣지 × 제조 MES (dure-factory + Open MES Korea)
- **시작점 → AX · 로드맵 · 부록**(와이어 프로토콜·노드 env)

원본은 [`src/whitepaper.ko.md`](src/whitepaper.ko.md) · [`src/whitepaper.en.md`](src/whitepaper.en.md)입니다 (GitHub에서 바로 렌더).

## 빌드 / Build

Markdown → HTML(pandoc) → PDF(Chrome headless, 한글 픽셀-퍼펙트 렌더). 한 번에 두 판 생성:

```bash
./scripts/build.sh        # → DureClaw-Whitepaper-v1.0-{KO,EN}.pdf
```

요구 / requires: `pandoc`, Google Chrome (`--headless` print-to-pdf). 폰트는 시스템의
Apple SD Gothic Neo / Pretendard / Noto Sans KR 를 사용합니다.

## 구조 / Layout

```
src/whitepaper.ko.md   한국어판 원본 (Korean source)
src/whitepaper.en.md   English source
src/template.html      pandoc HTML 템플릿 + 인쇄용 CSS (브랜드 팔레트)
scripts/build.sh       MD → HTML → PDF (두 판)
DureClaw-Whitepaper-v1.0-KO.pdf · -EN.pdf   산출물
```

---

_Family: [dureclaw](https://github.com/DureClaw/dureclaw) (bus) ·
[edgeclaw](https://github.com/DureClaw/edgeclaw) · [webclaw](https://github.com/DureClaw/webclaw) ·
[deskclaw](https://github.com/DureClaw/deskclaw) · 데이터는 엣지 · 두뇌는 분산 · 학습은 닫힌 루프 · 결정은 사람._
