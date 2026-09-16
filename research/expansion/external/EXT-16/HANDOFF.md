# EXT-16 — Iwasawa theory and special values — handoff

Job: EXT-16 in `research/expansion/EXTERNAL_AGENTS.md`. Worked 2026-09-16.

Roadmaps: `ModularSymbolsPadicLFunctions`, `NoncommutativeAndEquivariantIwasawa`,
`PadicMeasuresIwasawaAlgebras`, `PhiGammaModulesAndIwasawaCohomology`,
`RankZeroOneBSD`, `SelmerIwasawaCohomology` — 46 stages in total.

Nothing was committed or published. No application code, `data/`, `content/`,
`tests/`, queue or other-job file was modified. No PDF or extracted text was copied
into the repository; downloads and page renders live only in this job's scratch
directory outside the repository.

## Files written

| File | Nodes | Links | Gaps | Coverage |
|---|---|---|---|---|
| `PadicMeasuresIwasawaAlgebras.json` | 25 | 8 | 7 | 1 source_decomposed, 6 partial, 1 not_read |
| `PhiGammaModulesAndIwasawaCohomology.json` | 22 | 7 | 9 | 8 partial |
| `SelmerIwasawaCohomology.json` | 12 | 5 | 7 | 5 partial |
| `ModularSymbolsPadicLFunctions.json` | 7 | 4 | 7 | 5 partial |
| `RankZeroOneBSD.json` | 10 | 7 | 6 | 9 partial, 3 not_read |
| `NoncommutativeAndEquivariantIwasawa.json` | 8 | 7 | 6 | 1 source_decomposed, 6 partial, 1 not_read |
| **total** | **84** | **38** | **42** | **all 46 stages present** |

All six packets have `"status": "partial"`; every node has
`"implementationStatus": "unchecked"`. Only two stages are `source_decomposed`:
`PadicMeasuresIwasawaAlgebras:L3` (RJW §3.6 read in full with proofs) and
`NoncommutativeAndEquivariantIwasawa:NE.1` (CFKSV §2 read in full with proofs).

Validated with python3: JSON well-formed; every `parentStageId` and every
`coverage.stageId` exists in `data/atlas.json`; every node id equals
`parentStageId + "/" + slug`; every `sourceId` resolves inside its packet; every
link endpoint is a real stage or a node defined in these packets; **no proposed
edge reverses an existing `stageEdges` edge and no cycle is created** (checked
against the full 1604-stage graph).

## Sources actually read

Supplied library (`references/papers`, `references/extracted`, `references/text`):

| Source | sha256 (first 12) | What was read |
|---|---|---|
| Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2 | `efa1e10168fb` | §3 in full (pp. 13–26), §13.1 (pp. 65–66), §13.5 in full (pp. 69–72), App. A.1 (pp. 73–77), App. B (pp. 79–81) |
| Colmez, *Fonctions d'une variable p-adique*, Astérisque 330 | `452cae8f8013` | §§I.1.1–I.1.4 (pp. 14–18), I.2 (pp. 18–20), II.2 (pp. 41–42), II.4 (pp. 46–47) |
| Herr, *Sur la cohomologie galoisienne des corps p-adiques*, BSMF 126 | `e1a3162581ed` | Intro (pp. 564–566), §1.1–1.2 (pp. 566–572), §2 in full (pp. 572–575), §3.1–3.3 (pp. 577–584, 589–590), §4 (pp. 591–593) |
| Cherbonnier–Colmez, *Représentations p-adiques surconvergentes* | `cee9e8588ba1` | Intro, §I.1–I.3, §II.1–II.4, statement of III.1.1, §III.5 in full |
| Kedlaya–Pottharst–Xiao, arXiv:1203.5718v3 | `dfd271fa2ef3` | §1, §2.2, §2.3, §4.2, §4.4 (pp. 42–45) |
| Berger, *Limites de représentations cristallines*, arXiv:math/0201262v2 | `2032ac0bca29` | §2.1 (p. 7), §4.1–4.2 (pp. 11–13) |
| Lei–Loeffler–Zerbes, *Wach modules…*, arXiv:0912.1263v3 | `5981c2f6152b` | §2.2 (PDF p. 8) |
| Nekovář, *Selmer complexes*, Astérisque 310 | `61c84e5ad325` | **introduction only**: §§0.8–0.13 (pp. 9–15) |
| Rubin, *Euler Systems* (author draft) | `de47655dc350` | Ch. I §2, §3.1, §5, §7; Appendix B in full (pp. 151–154) |
| Pollack–Stevens, *Critical slope p-adic L-functions* | `b0ca4fa80667` | §1, §2, §3.1–3.2, §8, §9 (eq. (2) and Thm. 8.1 read from page images) |
| Bellaïche, *Critical p-adic L-functions*, arXiv:0912.2925v1 | `0a1c068cfc36` | §1.1–1.5 (formulas (4), (5), Thm. 2, Cor. 1 read from a 500 dpi render) |
| Amice–Vélu, Astérisque 24–25 | `badff36a5511` | Intro (pp. 119–120), Théorème III (p. 125), §IV skimmed from page images |
| Jetchev–Skinner–Wan, arXiv:1512.06894v1 | `908562efddda` | §1.1–1.3 in full, Thm. 3.3.1, §6.1–6.2, §7.2–7.3.1 |
| Bump–Friedberg–Hoffstein, Invent. Math. 102 | `d50ad2f11c99` | §0 (pp. 543–544) — **no text layer; read from 150 dpi page images** |
| Castella, *Erratum* to the multiplicative-prime paper | `c04dff16c27b` | §1 in full, §2 Lemmas 2.1–2.2 |
| Castella–Grossi–Skinner, *Mazur's main conjecture at Eisenstein primes* | `5046d7571ed3` | §1 (pp. 1–5) |
| Keller–Yin, arXiv:2402.12781v2 | `bb64820b49aa` | §0.1–0.3, §4.2 (pp. 42–43) |
| Wei Zhang, *BSD and Heegner points: a survey* | `9bb6e9958481` | §1.4–1.5 (pp. 7–9) |

Downloaded by this job (nothing for `NoncommutativeAndEquivariantIwasawa` exists in
the supplied library), using the URLs printed in that roadmap's own source-label
dictionary at `content/campaign/NoncommutativeAndEquivariantIwasawa/README.md`
lines 129–134:

| Source | arXiv | sha256 | Read? |
|---|---|---|---|
| Coates–Fukaya–Kato–Sujatha–Venjakob | `math/0404297` | `a46184ea4221c87e134c0955d0d539e4246e8fcebe0e42321623f5732d3c8a71` | §§1–5; **§2 in full with all proofs** |
| Kakde | `1008.0142v3` | `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c` | §2.1, §2.3, §2.5 |
| Ritter–Weiss | `1004.2578` | `48811a99c75f3b826f2315cc914563ffab1dd98381fd0af141816e05b99f2dee` | **downloaded, NOT read** |
| Burns–Venjakob | `math/0511672` | `4b33fb11251340c88a8f8a590d9f9296a413aadf4fae98968ea7191a14c857bc` | abstract, §1, start of §2.1 |

## Corrections to existing statements

**Source-level (printed text differs from what a consumer would assume).**

1. **Pollack–Stevens eq. (2) (printed p. 21) has the wrong L-argument.** It prints
   `L(f, χ⁻¹, 1)`, but the left side `μ_f(x^j·χ)` depends on `j` and no other factor
   supplies that dependence. Bellaïche's (4), restating *the same* Pollack–Stevens
   interpolation property, prints `L_∞(f φ⁻¹, j+1)`. Read from page images at 220
   and 500 dpi respectively. Recorded in `ModularSymbolsPadicLFunctions.json`.
2. **Bellaïche eq. (5) (printed p. 8) has `α` in both Euler-factor denominators**
   while its prefactor is `1/β^ν` and the refinement being interpolated is `f_β`
   with `U_p f_β = β f_β`. By Bellaïche's own §1.3 (p. 4) the denominators should be
   `β`. Verified at 500 dpi.
3. **RJW Remark 3.35 (p. 22) overstates the character map.** Integration against a
   nontrivial character does *not* induce a homomorphism on the whole total quotient
   ring `Q(G)`; a denominator can have zero χ-integral. Formula (3.11) is unaffected.
4. **RJW Lemma 3.38 (p. 23) is an odd-p theorem.** Its proof opens "As p is odd,
   `(Z_p/p^n)^×` is cyclic". Everything downstream that uses `μ/([a]−[1])` — including
   Remark 3.47's "pseudo-measures are rigid functions with a simple pole" — inherits it.
5. **Herr 1998 does not prove Tate duality.** Its introduction (p. 565) defers
   Theorem C to a later publication. `PhiGammaModulesAndIwasawaCohomology:PG.3`
   cannot source duality to this paper; the rational Robba-coefficient version is
   available from Liu via KPX Thm. 2.3.11 and Thm. 4.4.5(3).
6. **Castella's original Theorem A is withdrawn when `p ‖ N`.** The erratum states
   that a point of the Hida family used in `[Cas18, Thm. 4.2]` "is not guaranteed in
   general". Theorem A′ adds the nonsplit-multiplicative condition on `q` and
   `E(Q_p)[p] = 0`, and drops semistability.
7. **Boundary-map sign conventions conflict.** CFKSV: `∂_G(ξ_M) = +[M]` (module,
   Ore set `S*`). Kakde Thm. 11: `∂(ζ) = −[C]` (complex, Ore set `S`).
   `NoncommutativeAndEquivariantIwasawa:NE.2` requires the sign fixed; this must be
   resolved before transporting statements between the two frameworks.

**Stage-level (findings about the atlas, recorded as gaps, no edge proposed).**
Three stage pairs are, as written, mutually dependent. In each case adding the
missing edge would create a two-cycle, so none was proposed:

- `PhiGammaModulesAndIwasawaCohomology` **PG.3 ↔ PG.4.** PG.3's finiteness/Euler-
  characteristic acceptance is Herr's Theorem B, proved in §4 using §3's ψ-results
  (Prop. 3.6(2), Thm. 3.8, Cor. 3.11) — i.e. PG.4 content. The atlas has PG.3 → PG.4.
- `SelmerIwasawaCohomology` **L1 ↔ L2.** Rubin's Poitou–Tate Thm. 7.3 (= L1's
  "annihilator of each local condition") is stated in terms of Def. 5.1's `S^Σ`,
  `S_Σ` and reduces via Lemma 5.3 — both L2 content. The atlas has L1 → L2.
- `ModularSymbolsPadicLFunctions` **L1 ↔ L2.** L1's text owns the p-stabilized-vs-
  newform comparison ("the second familiar Euler factor"), which needs the
  refinement data the atlas assigns to L2. The atlas has L1 → L2.

**Stage-text refinement, not an error.** `PadicMeasuresIwasawaAlgebras:L0` says
"unrestricted weak completeness of the full continuous dual is not asserted".
Colmez §I.1.3 (p. 17) *does* assert it, by Banach–Steinhaus; what fails is that the
weak dual is a Banach space (only when `dim B < ∞`). Weak *compactness* of the
integral dual, which L0 also asks for, was **not** found in either source.

## Shared-supplier requests

1. **Determinant of a perfect complex.** Needed by `PadicMeasuresIwasawaAlgebras:L5`,
   `SelmerIwasawaCohomology:L3` and `NoncommutativeAndEquivariantIwasawa:NE.2`.
   A keyword scan of `CATALOGUE.json` finds no Knudsen–Mumford, no Kato Iwasawa
   lectures and no Fukaya–Kato. One supplier, not three copies. Flagged to EXT-15
   (`IntegralIwasawaTheory:I.4` needs the same) and to whoever owns K-theory
   (EXT-01 `GeneralAlgebraicKTheory:K.5/K.6`, which `NE.2` already requires).
2. **Poitou–Tate and local Tate duality.** `SelmerIwasawaCohomology:L1` names
   `ArithmeticGaloisDuality R02` as the owner. Rubin quotes the global sequence from
   Milne I.4.10; Milne is absent from the library. This is a supplier request, not a
   gap EXT-16 should close.
3. **`LocallyAnalyticDistributions:L1`** must prove "compatibility with R01's bounded
   transform" — that is RJW Thm. 3.25, decomposed in
   `PadicMeasuresIwasawaAlgebras.json` under L2. No new edge proposed: the path
   `PMIA:L2 → LAD:L0 → LAD:L1` already exists.
4. **`PadicHodgeRegulators:L2`** is already a consumer of `PG.5`. What that node
   actually supplies is: the two-term `C_ψ` in degrees 1 and 2 with its
   `R^∞(Γ_K)`-structure, the character specialization (KPX Prop. 4.2.3) and the
   Iwasawa duality quasi-isomorphism with the `ι`-twist (KPX Thm. 4.4.8). It does
   **not** supply a chain-level Iwasawa duality map — KPX Remark 4.4.9 says they do
   not construct one.
5. **Cross-roadmap ψ comparison, now source-verified.** The measure-theoretic ψ of
   `PadicMeasuresIwasawaAlgebras:L2` and the (φ,Γ)-module ψ of
   `PhiGammaModulesAndIwasawaCohomology:PG.4` are the *same* operator for the trivial
   representation over `Q_p`: RJW (3.9) and LLZ §2.2 print the identical
   roots-of-unity formula, and the integrality is Herr §3.1.1's trace computation.
   An edge `PMIA:L2 → PG.4` is proposed in the PhiGamma packet.

## Unresolved cross-job dependencies

- **Absent from the library and needed by several roadmaps:** Washington
  *Introduction to Cyclotomic Fields* 2nd ed. (Λ-module structure theorem, Weierstrass
  division), Coates–Sujatha *Cyclotomic Fields and Zeta Values* (characteristic-ideal
  multiplicativity, the `(X_∞)^{c=1} = X_∞^+` step), NSW, BGR, Milne *ADT*,
  Skinner–Zhang, Greenberg [Gre89], Coates–Perrin-Riou [CPR89], Fontaine's
  Grothendieck Festschrift paper, Cherbonnier–Colmez's 1999 JAMS Iwasawa paper,
  Wach 1996, Friedberg–Hoffstein 1995, Fukaya–Kato, Burns's SK₁ paper. EXT-15's
  `IntegralIwasawaTheory` handoff reports the same Washington/Coates–Sujatha absence.
- **Present in the library but not opened by this job** (unread-but-available
  boundaries, not acquisition problems): `R02_KI_BSTW2024.pdf` (the normative
  supersingular route for `BSD.6a`, whose Thm. 1.14 and §§3–6, 9–10 the stage names),
  `BSD_CGLS.pdf` (the actual proof source for *both* Eisenstein BSD formulas),
  `KI_BSW_PadicGL2.pdf` and `KI_Hansen_CriticalIwasawa.pdf` (general-level modular
  symbols), `KI_Kato_ModularZeta_2004.pdf`, `KI_SkinnerUrban_IMC.pdf`,
  `ADD_RT97.pdf` (Ribet–Takahashi), `SUP_YZZ_GrossZagier_2013.pdf`,
  `ES_BurnsSakamotoSano_II_v1.pdf` (the normative source for `PMIA:L6`), and the
  `R02_KI_*` Castella/Hsieh/Wan/Kobayashi–Ota family.
- **No text layer:** `BSD_GrossZagier.pdf` yields only its bibliographic header and
  `BSD_GrossKolyvagin.pdf` yields nothing. Both are essential to `BSD.3` and `BSD.5`.
  BFH was handled by rendering pages at 150 dpi; the same will work for these two.
- **p = 2 and additive primes.** Every theorem decomposed in `RankZeroOneBSD.json`
  excludes `p = 2` (JSW `p ≥ 3`, Castella `p > 3`, CGS/Keller–Yin `p > 2`,
  JSW Thm. 7.2.1 `p` odd). `BSD.8` cannot be assembled from them.

## Next actions

1. Read KPX §§3 and 5 and Cherbonnier–Colmez §§III.2–III.4 — both already in the
   library — to close the two largest unread proofs in `PhiGammaModules…`.
2. Read Nekovář Ch. 6 and Ch. 8 (library copy); the Numdam OCR is poor in the body,
   so page images will be needed. This is the single biggest lever on
   `SelmerIwasawaCohomology:L2/L3`.
3. Read BSTW 2024 §§1, 3–6, 9–10 and CGLS §§5.1, 5.3 (both in the library) for
   `BSD.6a` and `BSD.7`.
4. Render Gross–Zagier Thm. 7.3 and Gross's Kolyvagin exposition from page images
   for `BSD.3`/`BSD.5`.
5. Read Ritter–Weiss arXiv:1004.2578 (already downloaded to this job's scratch area) and
   build the source-by-source coverage table `NE.6` asks for; then obtain
   Fukaya–Kato and Burns's SK₁ paper.
6. Open `ES_BurnsSakamotoSano_II_v1.pdf` §§2–3 for `PadicMeasuresIwasawaAlgebras:L6`,
   the only stage in that packet still `not_read`.
