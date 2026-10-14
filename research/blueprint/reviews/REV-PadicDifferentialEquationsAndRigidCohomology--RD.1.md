# REV-PadicDifferentialEquationsAndRigidCohomology--RD.1

Independent review of `BP-PadicDifferentialEquationsAndRigidCohomology--RD.1`, the RD.1 continuation packet written by
Codex, session `codex-jWCKIr` (issue #9743, pull request #9784). Done by Claude, session `claude-bGvLff`, issue
[#9751](https://github.com/CBirkbeck/tauceti-explorer/issues/9751), on 2026-10-14. This session wrote no part of the plan
under review and did not review its parent.

**Verdict: accepted, with corrections made in place.** The packet, its reader and its suggested Lean file were corrected.
The mathematics of the 29 submitted targets is sound, and the five recorded gaps are honest. The review made five kinds of
correction.

- **A closure gap in the radius targets.** The Kedlaya–Xiao targets rest on rational-type fields with several commuting
  derivations and on their intrinsic radii. No packet planned these. The review added three targets: the definition, the
  ∂ⱼ-Frobenius antecedent and descendant, and the decomposition by intrinsic radii.
- **Two missing or near-miss prerequisites.** Generic rotation's Taylor-map prerequisite was a near miss. The descending
  filtration used the isoclinic completion comparison without listing it.
- **Generality of the descending filtration.** Kedlaya proves it only for perfect algebraic extensions of k((t)). The
  packet applies it to Fargues–Fontaine's complete field and to D'Addezio's ring, and now says how; the extension is
  assigned to gap G3.
- **Statements, matches and locators.** Six statements were corrected, four overstated source matches rewritten, and
  locators fixed in fourteen targets.
- **Source issues.** All nine recorded source issues were confirmed, one with a corrected locator. Two new ones were
  added; one is a real gap in the printed proof of monodromy Lemma 4.12.

The `review` object in the packet records a verdict and a note for each of the 32 targets.

## What the packet contains

The accepted main packet `PadicDifferentialEquationsAndRigidCohomology.json` left RD.1 `partial`, with eight `remaining`
items. Five were gaps:

- Katz's cyclic-vector algorithm;
- the interior of Kedlaya–Xiao Theorems 2.2.5–2.5.2;
- the rest of monodromy Lemma 4.12;
- a public proof of Dwork overconvergence;
- the bounded/completed and equal-characteristic Frobenius comparisons.

The other three were new targets moved into RD.1: the dense-open global and reverse slope filtrations, and Robba residue
duality. The continuation answers all eight with 29 targets, five gaps (G1–G5), one request to RD.0 and nine source
issues (E301–E309). It imports 39 targets of the main packet (RD.0, RD.1, RD.2 and RD.3) and adds no planets, keeping the six RD.1 planets of the main
packet.

## Method

- **Sources.** All fourteen public sources with recorded checksums were fetched afresh, and every checksum matches. The
  Hartl–Pink host needs certificate checking relaxed. The published erratum to *Slope filtrations revisited* (Documenta
  Math. 12 (2007), 361–362) was also fetched; the packet had read only the author's additional-errata list, which
  excludes it. Every locator of every target was read on the page, as follows.
  - Katz's paper was read as page images, since its formulas do not extract.
  - Dwork's IHÉS paper was read through its OCR layer, which is noisy but legible at §4(a).
  - The others were read from their text layers. These are Kedlaya–Xiao §§1.2–2.6, the published monodromy paper
    (§2.2, Lemmas 4.11–4.12, Propositions 5.10–5.11), SFR §3.3, §5.4 and §6.3, Fargues–Fontaine §11.2.5–11.3, Hartl–Pink
    §§2, 4 and 8–11, Sperber–Voight §1, Li §2, D'Addezio §2.2 and §4.2, Xu–Zhu §A.2, Notes on isocrystals §§1, 3–4 and
    Dospinescu–Le Bras §6.
- **Baseline.** The four Mathlib declarations (`Derivation`, `Module.Basis`, `LinearMap`, `Matrix.det`) were read at
  082e2d3. Each exists and provides what its citing targets use. The description of `Module.Basis` was corrected: its
  index type is arbitrary, and the packet uses `Fin n`. `WittVector.isocrystal_classification`, mentioned in the upstream
  note, is indeed rank one (`finrank = 1`).
- **Duplication.** Pinned Mathlib and Tau Ceti were searched, as were current TauCetiRoadmap and every atlas packet.
  Nothing plans Newton polygons, the Artin–Hasse series, cyclic vectors of differential modules, Robba rings,
  Kedlaya–Xiao's rational type or intrinsic radii, apart from this roadmap. The added targets duplicate nothing: for
  ∂₀=d/dt the new intrinsic radius is the main packet's toric radius T(E,η).
- **Suppliers.** Every main-packet target the continuation imports (RD.0, RD.1, RD.2, RD.3) was read, and its statement
  compared with the use made of it.
- **Closure and computations.** Every proof route was checked against its prerequisites. The following were recomputed
  by hand:
  - Katz's rank-two example and the Vandermonde step;
  - the Dwork coefficient bound and the Frobenius factor;
  - the rescaling direction for the inverse matrix in Fargues–Fontaine Lemme 11.2.25;
  - the [[1,0],[c,π]] counterexample;
  - the nonvanishing argument for a in Lemma 4.12;
  - the backward series for the negative-slope cokernel, with its overconvergence bound;
  - the five residue-pairing tests;
  - the unipotent duality computation.
  The Dwork bound used is that (p^j−1)/(p−1)−j ≥ (p−1)p^(j−2) for j≥2, with equality at j=2.
- **Reader.** A renderer reproduces the committed reader's 29 target sections byte for byte from the committed packet.
  After the corrections the target sections, the gap sections, the source-issue list and the source register were
  regenerated from the corrected packet. The renderer then reports no mismatch for all 32 targets. The prose sections
  were edited by hand.
- **Checks.** `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings, before and after.
  The source issues pass the errata checker's `check_issues` and `sourceVersions` checks. `lean-check` elaborates the
  suggested file before and after the edits, with proof-placeholder warnings only (6 before, 8 after; 87 lines before,
  115 after). `check_sorry_data.py` passes.

## Counts

| Item | Before | After | Notes |
| --- | ---: | ---: | --- |
| Targets | 29 | 32 | 8 verified, 21 corrected, 3 added |
| API items / unit tests | 19 / 13 | 31 / 18 | the added definition carries 12 and 5 |
| Planets | 0 new | 0 new | the main packet's six RD.1 planets remain |
| Baseline declarations | 4 | 4 | all confirmed |
| Gaps / requests | 5 / 1 | 5 / 1 | G1 and G3 widened |
| Source issues | 9 | 11 | E301–E309 confirmed; E310, E311 added |
| Sources | 15 | 16 | published SFR erratum added |

Coverage of RD.1 stays **planned** and the packet status stays **complete**. Every chain ends in the pins, an accepted
main-packet target or one of the five gaps.

## Substantive corrections

### Closure: rational-type fields and intrinsic radii (KX §§1.4–1.5)

The Kedlaya–Xiao targets all speak of:

- the extrinsic radii R_∂ⱼ of a coefficient derivation;
- the intrinsic radii IR_∂ⱼ=|uⱼ|R_∂ⱼ and IR=min_j IR_∂ⱼ;
- dominance;
- fields of rational type.

These are KX Definitions 1.4.1 and 1.5.1–1.5.3. The main packet's `generic-radius` defines only the radius for ∂=d/dt.
The coefficient theorem's proof uses the ∂ⱼ-Frobenius of KX §1.4 (Theorem 1.4.19), not the t-Frobenius of
`frobenius-antecedent`. The intrinsic-profile proof and the disc splitting decompose a module over K by intrinsic radii,
using KX Theorems 1.4.21 and 1.5.6. The review added three targets (marked `addedBy`):

| Target | Content | Source |
| --- | --- | --- |
| `rational-type-intrinsic-radii` (definition) | rational type, ∂ⱼ- and ∂_J-modules, R_∂ⱼ, IR_∂ⱼ, IR, dominance, subsidiary radii, the Taylor map; 12 API items, 5 tests | KX Lemma 1.2.12, Definition 1.4.1, Remarks 1.4.2–1.4.4, Lemma 1.4.5, Remark 1.4.23, Definitions 1.5.1–1.5.3, Remark 1.5.4 |
| `partial-frobenius-descendant` (theorem) | the ∂-Frobenius, ∂′ of rational type, antecedents and the descendant radii | KX Construction 1.4.7 – Corollary 1.4.20, Remark 1.5.5 |
| `intrinsic-radius-decomposition` (theorem) | V=⊕V_r by intrinsic radii, with the value-group statement | KX Theorems 1.4.21 and 1.5.6 |

KX prove Proposition 1.4.17 and Theorems 1.4.19 and 1.4.21 only by reference to the book (Theorems 10.4.2, 10.5.1,
10.6.2, 10.7.1), so G1 now names them.

The prerequisites were rewired accordingly:

- `extrinsic-…`, `coefficient-…`, `affine-gap-…`, `intrinsic-partial-…` and `constant-profile-…` cite the new targets.
- In `coefficient-…`, `frobenius-antecedent` was replaced by `partial-frobenius-descendant`.
- In `generic-rotation`, `RD.0/change-of-frobenius-lift-taylor-formula` was replaced by the new definition. That RD.0
  target substitutes t↦t′ in R^int; it is a near miss for the Taylor map u_j↦u_j+x_jt in the coefficient variables.

### Missing prerequisite in the descending filtration

The third proof step of `descending-generic-filtration` uses the fixed-slope completion comparison for the graded
standard forms. `isoclinic-completion-comparison` is now a prerequisite; this creates no cycle.

### Generality of Kedlaya's descending filtration

In the monodromy paper a "valued field" is an algebraic extension of k((t)) (§2.2, p. 102). Proposition 5.11 is proved
there for such fields only. The packet states it for Fargues–Fontaine's complete perfect F, and the reverse-filtration
target applies it to D'Addezio's E†_alg, whose residue field k(t)^alg is not complete. The review made three changes.

- **FF's complete F.** A hypothesis now says how FF's field is covered: Galois descent by FF Proposition 11.2.15, and the
  extended-ring step by SFR Proposition 5.4.3, valid for any K. SFR §5.4 was added as a source.
- **D'Addezio's ring.** The reverse-filtration route now intersects back through D'Addezio's remark
  O_(E^alg)[p^(1/b)]∩Γ_(2,b,c)=O†_(E^alg)[p^(1/b)] (proof of Theorem 4.2.6, p. 15).
- **G3.** Both ring comparisons are now part of G3.

### Statements

| Target | Correction |
| --- | --- |
| `annular-projector-descent` | "an idempotent on M⊗S extending one on M⊗T" replaced by decompositions of M⊗S and M⊗T agreeing on M⊗U (KX Lemma 2.3.2) |
| `katz-determinant-criterion` | stated in Katz's c(i,j) form; the criterion is an equivalence, as Katz proves |
| `affine-gap-annular-splitting`, `intrinsic-annular-splitting` | the added hypothesis α>0 removed (KX allow I⊂[0,∞)) |
| `reverse-algebraic-filtration-comparison` | the eigenbasis needs "after possibly replacing (s,r) by (ks,kr)" (D'Addezio 4.2.6(ii)); E†_alg restated precisely |
| `katz-candidate` | the test `bad_translation` attributed to Katz a vanishing for a special translation; Remark (3), p. 68, concerns a badly chosen basis |
| `constant-profile-disc-splitting` | hypothesis (b) may be imposed for one r (KX "for all (some) r") |

### Source matches

- **Sperber–Voight (1.4).** It bounds θ only, under their standing assumption p>2; it does not supply the inverse or p=2.
  The packet's own Artin–Hasse factorisation does.
- **Dwork.** He treats θ but not θ⁻¹.
- **Li.** Li bounds a different gauge factor.
- **SFR 3.3.7(c).** For x∈Γ_con[π⁻¹] SFR's own solution is exactly the packet's backward series (p. 36), and the
  published erratum amends this proof's presentations; both are now recorded. The cokernel claim of Fargues–Fontaine is
  in the proof of Proposition 11.2.24 (p. 378), not in Lemme 11.2.25.
- **FF Remarque 11.3.4.** It says that the R_F classification needs Théorème 11.3.2. For E=F_q((π)) FF attribute that
  theorem to Hartl–Pink Theorem 4.3, which Hartl–Pink derive from their classification (p. 696); the packet's warning not
  to use HP 4.3 as an input is right.
- **SFR Remark 6.3.4.** Its counterexample has imperfect K, so the node keeps only full faithfulness for general perfect F.

### Locators (fourteen targets)

| Where | Was | Is |
| --- | --- | --- |
| KX Hypothesis 2.0.1 | pp. 17–18 | p. 18 |
| KX "Lemmas 2.2.2–2.2.3" | pp. 19–20 | Proposition 2.2.2 and Lemma 2.2.3, p. 19 |
| KX Caution 2.3.6 | pp. 23–24 | p. 25 |
| SFR §6.3 | "Propositions 6.3.2 and 6.3.3(a)", pp. 63–64 | Proposition 6.3.2, Theorem 6.3.3(a), Remark 6.3.4, pp. 64–65 |
| FF | "Propositions 11.2.20–11.2.22" | Proposition 11.2.20 and Corollaire 11.2.22 (11.2.21 is an example) |
| Hartl–Pink §10 | pp. 705–712 | pp. 705–713 |
| Dwork Lemma 4.1 | pp. 55–58 | pp. 55–57 |
| DLB Lemme 6.3 | pp. 356–357 | p. 356 |
| Monodromy Proposition 5.11 | pp. 164–166 | pp. 164–165 |
| Katz "Formula (1)" | — | the formula is unnumbered |

## Source issues

Each recorded issue was read at its locator; all nine are confirmed.

| Id | Verdict | Note |
| --- | --- | --- |
| E301 | confirmed | KX Lemma 2.3.2's proof cites itself (p. 23) |
| E302 | confirmed | KX Theorem 2.6.1's proof cites the disc Theorem 2.5.2 where the annular 2.5.1 is needed (p. 33) |
| E303 | confirmed | D'Addezio's reverse-grade indices; the locator is Theorem 4.2.6(i), not (2) |
| E304 | confirmed | HP §10.17: |w−w_i| bounded by a negative number; log intended (p. 712) |
| E305 | confirmed | HP §10.16: the printed −ρ≤cn is true but too weak; −ρ≤−cn intended |
| E306 | confirmed | monodromy p. 150: U_f(t) for U_h(t) |
| E307 | confirmed | monodromy p. 150: r for s |
| E308 | confirmed | monodromy p. 165: "lowest" copied from Proposition 5.10 |
| E309 | confirmed | monodromy p. 165: c₁≡1, not 0; the bound survives |

The review added two issues.

- **E310 (gap, new).** In monodromy Lemma 4.12 (p. 151), b₂ is a sum over j from 1 to i+l−s(i,l), and the telescoping
  leaves the k=0 term minus the k=i+l−s term. This length can be negative.
  - *Example.* Take q=2, n=1 and one coefficient with v₀(u₀)=−1. The corners of h are t=(2/3)2^l. At t=(2/3)2^(−5) the
    pair (0,−5) lies in S, so its length is −5.
  - *Fix.* The identity holds with oriented summation, as the packet's plan already uses: with T_j=π^(i+l−j)σ^(−nj)(u_iσ^(−l)z),
    one has πσⁿ(T_j)=T_(j−1). The issue was not in either erratum searched.
- **E311 (misprint).** KX Theorem 2.6.1's proof writes "for l=1,…,d" for i.

The issues gained their `source` fields, and the packet gained a `sourceVersions` list: E303 affects a stated result.

## Suggested Lean file

The file had six declarations in the compact shape, all statements correct (checked against the mathematics): the
candidate, the cyclicity adapter, three examples, naturality, the field algorithm and rescaling. The review added the
light definition `IsRationalType` (KX Definition 1.4.1, in the equivalent form ∂u=1 and ‖∂ⁿx/n!‖≤‖u‖⁻ⁿ‖x‖ on an
ultrametric normed field). It also added an example (a rational parameter is nonzero) and the parameter-change theorem
`IsRationalType.add_const` (KX Remark 1.4.3), which the packet's API and tests now list. The intrinsic radii need spectral
norms of modules and remain README targets. `lean-check` at Mathlib 082e2d3: no errors, eight proof-placeholder warnings.

## Questions for the orchestrator

1. **Source-issue numbering.** This continuation numbers its issues E301–E311; the main packet uses E1–E219 and RD.7
   uses E701–E704. A later continuation of RD.3 must not reuse E3xx; a per-stage convention would avoid collisions.
2. **Main packet citation of SFR 3.3.7.** The main packet's `cohomology-of-rank-one-frobenius-modules` cites SFR
   Proposition 3.3.7 without the published erratum (Documenta Math. 12 (2007) 361–362). The statement is unchanged, but
   a later fix to the main packet could add the citation; it lies outside this review's files.
3. **Main source issue E218.** Its correction cites Kedlaya's Proposition 5.11 for Fargues–Fontaine's complete field.
   Like the descending-filtration target here, that use extends Kedlaya's setting, and gap G3 now records the extension.
   The note may be worth carrying to the Fargues–Fontaine extraction.
