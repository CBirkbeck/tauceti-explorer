# RT-PAPER-MOK-PILA-TSIMERMAN-19: fixes

Fixer: Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5501, job FIX-RT-PAPER-MOK-PILA-TSIMERMAN-19).
- **Findings:** `RT-PAPER-MOK-PILA-TSIMERMAN-19.result.json`, 13 findings, all confirmed in
  `RT-PAPER-MOK-PILA-TSIMERMAN-19.review.json`. All 13 are applied, in the form the verifier gave.
- **Files changed:** `papers/PAPER-MOK-PILA-TSIMERMAN-19.result.json`, and `papers/PAPER-MOK-PILA-TSIMERMAN-19.md`,
  which has a new section after the review corrections.
- **Result:** 49 items (8 planned, 41 missing), three routes and 14 sourceIssues. `check_paper.py` reports ok, and
  `intake.py check-files` reports 0 problems.
- **Independence.** I wrote none of the following:
  - the extraction (`cc-7b31c4`, PR #1915, and the earlier PRs #1666 and #1831);
  - its review (`cc-442dc5`, PR #2323);
  - the errata and their review (PRs #1820 and #2289);
  - the red team (Codex `codex-rtOQ9t`);
  - the verification.
- **Sources read.**
  - The published article (<https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p07-s.pdf>, SHA-256
    `1eab0797…762a0ab`, equal to the red team's): §1 (pp. 946–948), §4 (pp. 953–955), §§5.1–5.2, §§7.1–7.3, §9 (pp.
    964–966), §11 (pp. 969–971), §12 (pp. 972–975) and the bibliography.
  - arXiv v3 (SHA-256 `b3de4f10…0167`, the extraction's), to compare the version-specific passages.
- **Errata numbering.** "Errata E3–E7" below are entries of the separate file
  `research/blueprint/errata/PAPER-MOK-PILA-TSIMERMAN-19.json`. The extraction's own `sourceIssues` E1–E11 are different
  misprints. New entries in `sourceIssues` start at E12.

## /1 (high): the adjoint Hodge structure has weight 0: fixed

- **Item 20** now says weight 0, with types (−1, 1), (0, 0), (1, −1), and adds the published locator (§7.1, p. 958).
- **New sourceIssue E12** records v3's "weight 2" (p. 11), with `known` naming the published correction.
- **The Part II brief** imports "the weight-0 Hodge decomposition". The general Hodge API and the D2/D3 import are
  unchanged.

## /2 (high): the jet compactification keeps the zero orbit: fixed

- **Item 41** now removes the locus Z of pairs (constant jet, s = 0) before the G_m-quotient, or equivalently takes the
  relative weighted Proj, with Taylor coefficients of order |ν| of weight |ν| and s of weight 1.
  - **The chart s ≠ 0** is identified with J^r_kY by (f, s) ↦ (t ↦ f(t/s)).
  - **Functoriality** is stated only for maps that send nonconstant jets to nonconstant jets: immersions, open
    embeddings and automorphisms. These are all the paper uses. Other maps give rational maps.
- **New sourceIssue E13** (kind error) quotes both versions' text (v3 §9.1 p. 19, published §9.2 p. 966) with the
  weights-(1, 1) counterexample.
- **Left to the design:** gluing the local weighted-projective charts is recorded as a design obligation.

## /3 (high): functional dependence: fixed

- **Item 32** now reads rank(p₁, p₂) = rank(p₁): local analytic dependence at regular points, not necessarily rational.
- **The note** links errata E7, says that the extraction's own E7 is unrelated, and records that the equal-rank
  applications are unaffected. No duplicate sourceIssue was added.

## /4 (high): the deduction of Theorem 9.1 from Theorem 12.1: fixed

- **Item 43 now does two things differently:**
  - it recovers the derivatives algebraically, from R = (Dq)r to Dq = R r⁻¹, and at each higher order by subtracting the
    chain-rule terms and inverting r on Sym^j;
  - it applies Theorem 12.1 with rank(z) = dim(z), using the Zariski-closure inequality for the remaining dimensions.
- **The note** links errata E6 with its counterexample (dim U = 2, rank(z) = 1). It says that the repair is conditional
  on Theorem 12.1. Both theorem numbers are given.

## /5 (high): Lemma 11.1 and Theorem 11.3: fixed

- **Item 30 (Lemma 11.1).** Its note records errata E4: the printed proof is invalid, because of the PSp₄ stabilizers of
  orders 2 and 1. The finite-order determination is an unresolved prerequisite, and the existential statement is not
  refuted.
- **Item 31 (Theorem 11.3)** now requires the compatibility of v with u along w: zero-order equality plus du = v₁ ∘ dw
  (or the full jet chain rule), under §11's domain and lifting hypotheses. Its note gives the w = 2t counterexample of
  errata E5. It says that the repair is local and is not a complete global proof.
- **Item 33** builds the compatibility into uniformized loci.
- **The Part II brief** lists both obligations.

## /6 (high): Hwang–To volume growth: fixed

- **Item 16** is now stated for a positive-dimensional closed analytic subvariety Z of the bounded symmetric domain,
  with an invariant Kähler metric and balls centred on Z. It is applied in Lemma 4.3 to the projection of U to Ω, not to
  a subvariety of the quotient.
- **The note** says the exact hypotheses and constants of Hwang–To Theorem 2 have not been read and must be checked
  before blueprint decomposition. I did not acquire the primary paper, and nothing claims otherwise.
- **Item 14's note** now uses the corrected application.
- **New sourceIssue E14** records the ill-typed "γ · W ∩ X ∩ B(R)" (v3 p. 9, published p. 955).
- **The uniform bound on fundamental-domain pieces** (Klingler–Ullmo–Yafaev, Lemma 5.8) is kept separately.

## /7 (high): freeness needs the effective group: fixed

- **Item 22** now defines G_Ω, the image of G(ℂ) in Aut(Ω̂), and states that G_Ω acts freely on id₂(o) and on J^{nd}_kΩ̂
  for k ≥ 2. Equivalently, the stabilizer in G(ℂ) is the action kernel. Lemma 7.1 is now written with B = K_ℂN⁻.
- **The note** gives −I ∈ SL₂ as the witness. It explains that passing to G_Ω changes neither Ω, nor q, nor the action
  of Γ through its image, and that "dim G" in the orbit and expected-dimension computations means dim G_Ω.
- **Item 28** and the brief carry the convention.

## /8 (high): the stabilizer lemmas: fixed

- **Items 13 and 14** are restated as steps inside the contradiction argument for Theorem 1.1. They now carry its
  hypotheses: atypicality, projection not in a proper weakly special subvariety, the triple induction, and the
  very-general replacement before Lemma 4.2.
- **Item 13** now says Θ is normal in G, as in print, not in G(ℝ).
- **Their notes** give the two witnesses: W = Ω × X, and a point at torsion-free level.
- **Item 29** carries the same context for Lemmas 10.1–10.3.

## /9 (medium): the published 2-sorted theorem: fixed

- **New items.** Item 45 is the smallest weakly special subvariety Y^WS containing a set, extending item 2. Item 46 is
  the inequality dim Y^zar + dim q(Y)^zar ≥ dim Y + dim Y^WS, published Theorem 1.2, p. 947. Both go to the existing
  Part II route.
- **`source.published`** records the published version with its SHA-256 and the numbering map:
  - v3 1.2/1.3/1.4 are published 1.3/1.4/1.5;
  - v3 12.3/12.5 are published 12.1/12.2;
  - v3 §9.1 is published §9.2.
- **Collation, not overwriting.**
  - The notes of items 3 and 27 record the hypothesis W = Ŵ ∩ (…) that published Theorems 1.1 and 9.1 add, and the
    published definition of algebraic subvariety.
  - The original v3 locators stay; the changed items, and items 6 and 42, add published ones.

## /10 (medium): prerequisites and DOIs: fixed

- **The Mok prerequisite** is now Mok, *G-structures on irreducible Hermitian symmetric spaces of rank ≥ 2 and
  deformation rigidity*, Contemp. Math. 222 (1999), 81–107, doi:10.1090/conm/222/03174, with §(2.3) for Theorem A.
  - Its `why` separates the optional compactification sources: Mok's 2017 preprint and Mok–Zhong, Ann. of Math. 129
    (1989).
  - It also says that these proofs have not been audited.
- **The DOIs** are now:
  - Scanlon: 10.1016/j.aim.2018.03.008;
  - Bertrand–Zudilin: 10.1515/crll.2003.008;
  - Daw–Ren: 10.1112/s0010437x1800725x.
- **The reader's book attribution** is corrected.

## /11 (medium): jet arity and order: fixed

- **Item 18** now writes π_{a,b} : J^g_{a+b}X → J^g_a(J^g_bX) with g fixed and the ring map at powers a + b + 1, a + 1,
  b + 1, and gives the dimension check (4 against 6).
- **Item 19** uses J^g_a(id_b) and J^g_aW.
- **Item 31** speaks of jets of order m and arity k, and applies J^k_m(w, u) to the identity section.

## /12 (medium): generators, not a basis: fixed

- **Items 4 and 5** now take finitely many generators of the modular function field over ℂ, with their domain
  conditions.
- **Their notes** link errata E3 and keep the transcendence-degree statements.
- **The route brief and the reader** are updated.

## /13 (medium): Theorems A and B: fixed

- **New items.** Item 47 is Theorem A, the local Fundamental Theorem of Projective Geometry, with its hypotheses (n ≥ 2,
  U convex, lines carried into lines). Item 48 is the highest-weight orbit W_x ⊂ PT_x(S), equal to the VMRT. Item 49 is
  Ochiai's Theorem B. All three are external suppliers routed to the Part II.
- **Their full proofs** are not decomposed, as PROTOCOL §16 allows.
- **Item 23's note** says that Theorem 7.4 consumes item 47 and that Theorem 7.5 consumes items 48–49.

## Not changed

- **Items 9, 10, 40** and the two source routes are untouched; no finding concerns them.
- **The Ochiai prerequisite's DOI.** The extraction gives 10.1090/S0002-9947-1970-0284936-6, while the published
  bibliography gives 10.2307/1995645. No finding concerns this, so it is noted here only.
