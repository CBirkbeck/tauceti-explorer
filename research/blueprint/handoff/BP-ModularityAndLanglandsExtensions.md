# BP-ModularityAndLanglandsExtensions — checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1033; the bot confirmed the claim (comment 5884987608). **Status: partial.**

## Checkpoint 2: ML.3 (symmetric powers and Sato–Tate)

**Sources.**
- Newton–Thorne I, arXiv:1912.11261v3 (sha 6d50b55…): the introduction and the theorem statements.
- Newton–Thorne II, arXiv:2009.07180v2 (sha 0f08214…): the introduction, Theorem 2.1 with its reductions, Theorem 3.1 and Theorem A.1.
- Kedlaya's notes, Chapter 24: text layer, and page images of pp. 134–135.

**Nodes (16).**
- `symmetric-power-lifting` (definition).
- `accessible-regular-refinement` (definition).
- NT I Theorem 2.33 (planet), Buzzard–Kilford, Theorem 3.1 (planet), Theorem 5.2, the level-raising package (Theorems 4.1, 6.1, 7.1), Theorems 7.6, 7.7 (planet), Proposition 8.3 and Theorem 8.1.
- NT II Theorem 2.1 (planet), Theorem A (planet) and Theorem A.1.
- The equidistribution criterion, and Sato–Tate for elliptic curves over ℚ (planet).

**Requests.**
- New: PadicFamilies L2 and AG2.3 (eigenvarieties), GL2AutomorphicRepresentationsAndTransfer R17.5 (weight one and CM), AnalyticNumberTheory AN.2 (the Tauberian theorem).
- Extended: AL.2 (entireness), AL.3 (Jacquet–Shalika nonvanishing), AG2.2.

**Gaps.** The Newton–Thorne proofs are recorded at statement level. ML.4's classification inputs are not planned.

**Findings (Kedlaya Chapter 24).**
- E4: the complex-multiplication definition is reversed.
- E5: Theorem 24.6 claims holomorphic continuation (only meromorphic was known before Newton–Thorne) and a wrong abscissa.
- E6: Conjecture 24.3's multiplicity condition is misprinted.

**Lean.** Three new checked examples:
- 577 is prime and ≡ 1 (mod 48·3!);
- ∫₀^π sin²θ dθ = π/2 (the Sato–Tate density has mass one);
- 2- versus 3-regularity for α/β = −1.

The suggested file compiles with 0 errors and 0 warnings.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings (48 nodes, 12 planets). `intake.py check-files`: 0 problems. Unit tests pass.

**Continue with:**
1. ML.4 (Arthur, Mok, KMSW), which unblocks ML.3's residual automorphy.
2. ML.1 (weight one).
3. Decompose NT I §2 (the infinitesimal R = T).

# BP-ModularityAndLanglandsExtensions — checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1033; the bot confirmed the claim (comment 5884639939). **Status: partial.** There was no earlier packet.

## What this checkpoint does

**Source.** BLGGT arXiv:1010.2561v4 (sha c953df6…, 93 pp.), read on the text layer:
- §1.4, §§2.1–2.4, the statements of §3, and the proofs of Propositions 3.1.1 and 3.2.1;
- Proposition 4.1.1 with its proof;
- §§4.2–4.5 and §§5.4–5.5.

It was compared with arXiv v1, which PM R24.3 cites. v4 renumbers §§2 and 5 and renames RAECSDC to "polarized"; `blggt-version-register` records the correspondence.

**Nodes (32).**
- ML.0 (2): the normalisation register and the version register.
- ML.2 (30):
  - 6 definitions with API and tests: polarized, adequate, ı-ordinary, connects, potentially diagonalizable, automorphic;
  - GHTT adequacy;
  - Lemma 1.4.3;
  - Lemmas 2.2.1–2.2.4;
  - Theorems 2.3.1 and 2.4.1;
  - Propositions 3.1.1, 3.2.1, 3.3.1, Theorem 3.1.2;
  - Proposition 4.1.1, Theorems 4.2.1, 4.3.1, 4.4.1, 4.5.1 and Corollaries 4.5.2–4.5.3;
  - Theorem 5.4.1 with Corollaries 5.4.2–5.4.4, Proposition 5.4.6, Theorems 5.5.1–5.5.3.

**Planets (ML.2, 6).**
- PD automorphy lifting;
- change of weight and level;
- the potential automorphy theorem;
- potential automorphy of compatible systems;
- meromorphic continuation of their L-functions;
- PD representations lie in compatible systems.

**Reused, not re-planned.**
- PM R24.5 (systems, predicates, L-functions, Grothendieck ring, residual irreducibility, constituents lemma) and PM R23.1 (Moret-Bailly).
- LGD R08.1 and R08.3 (lifting rings).
- GGD G7 (polarized deformation problems).
- FF R07.3 (Fontaine–Laffaille).

**Requests (5).**
- AG2.0 and AG2.2: polarized automorphic representations and r_{l,ı}(π).
- ET.7a: Arthur–Clozel base change and automorphic induction.
- AL.2: Godement–Jacquet.
- AL.3: the Rankin–Selberg pole.

**Gaps (4).**
- The Thorne 2012 lifting theorems.
- GHTT Theorem 9.
- The BLGHT11 Dwork family.
- Clozel, HSBT, Taylor and Caraiani citations.

**Source findings.** Checked against v1 as well; all misprints, affecting nothing:
- E1: µ for χ in the polarized-automorphic parity condition.
- E2: index and reference slips in §4.5.
- E3: Theorem 4.4.1 names π before it exists.

**Lean.** `suggested/ModularityAndLanglandsExtensions.lean` (new) imports Mathlib only. It contains signature sketches in a comment and 6 checked examples:
- the partial-sum condition of Corollary 5.4.4 for {1, 2, 4}, and its failure for {1, 2, 3};
- the n² regularity condition of Proposition 4.1.1, with a non-example;
- scalars in sl_3 over F₃;
- the non-polarizable Hodge–Tate set {0, 1, 5}.

It elaborates against Mathlib 082e2d3 with 0 errors and 0 warnings.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings. `intake.py check-files`: 0 problems. Unit tests pass.

## What a continuation should do

1. **ML.3.** Newton–Thorne, *Symmetric power functoriality for holomorphic modular forms* I and II (arXiv:1912.11261, 2009.07180) and the Hilbert case (2212.03595), using ML.2's potential automorphy and AL.2/AL.3.
2. **ML.1.** Deligne–Serre and weight one, importing GL2AutomorphicRepresentationsAndTransfer R17.5 per RS-21.
3. **ML.2.** Read BLGGT Appendix A and the ACC+ route (Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne §7).
4. **PM R24.5.** Pick up BLGGT v4 §5.2 (rational compatible systems), which is new relative to v1.
