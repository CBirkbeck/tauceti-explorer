# REV-DESIGN-InertAnticyclotomicCMMainConjecture — independent review

Refs #1727. Reviewer: Claude (Opus), session `claude-VApKDW`, 19 October 2026.
Claim confirmed by the bot in [comment 6257699185](https://github.com/CBirkbeck/tauceti-explorer/issues/1727#issuecomment-6257699185).
The design under review (DESIGN-InertAnticyclotomicCMMainConjecture, #1690, PR #10445) was written by Codex,
session `codex-VY453x`. This session wrote none of it.

**Verdict: accepted**, with corrections applied in place. The plan's structure is sound and its sign and
coefficient conventions check out against BKO, AHII and AHI. One input was stated wrongly: the inert case of Rubin's
two-variable theorem was given in its split-prime form. Two gaps (G4, G6) are closed by complete arguments. A gap
that waited on an unregistered supplier (G2) is narrowed, now that CMAllPrimeMainConjectures exists. The four
remaining gaps (G1, G2, G3, G5) are recorded honestly.

## Counts

| | design | after review |
|---|---|---|
| nodes | 35 | 36 (one lemma added) |
| verdicts | — | 25 verified, 10 corrected, 1 added |
| API items / unit tests / planets | 37 / 26 / 26 | unchanged |
| baseline declarations | 2 | 6, all read at Mathlib 082e2d3 |
| gaps | 6 (G1–G6) | 4 (G1, G2, G3, G5) |
| requests | 9 | 9 (two PadicMeasuresIwasawaAlgebras requests updated) |
| sourceIssues | 0 | 3 (E1–E3), each with a reviewer verdict |
| sources | BKO21, AHII05, AHI06 | + RUB91 (Rubin 1991), BIL86 (Billot 1986) |

`python3 scripts/check_blueprint.py` on the packet: 0 errors, 0 warnings. The prerequisite graph reachable from the
packet (4,154 blueprint nodes) is acyclic.

## Sources read

All five are public. Hashes are in the packet's `sources`. Nothing was copied into the repository.

- **BKO21**, Annals 194 (2021), the Caltech repository copy. Its PDF pages are offset by 941 from the journal pages
  (the first page is a JSTOR cover). Read §2 (pp.947–950), §3 pp.950–953 (the CM datum, the elliptic-unit variant,
  Proposition 3.3) and §6 in full. The formulas on pp.961–962 were checked on page images:
  - δ(ξ)=L(φ̄,1)/Ω and δ_χ(ξ)=L(φ̄χ,1)/Ω;
  - L_p(χ)=L(\overline{φχ},1)/(Ω·δ_(χ⁻¹)(v_ε)) for nontrivial χ∈Ξ^ε;
  - the definition of F^± and of the signed Selmer groups;
  - Theorems 6.1–6.2.
- **AHII05**, MRL 12 (2005), the published author PDF, read in full. arXiv math/0401124v2 was compared at Theorem 4.1
  and Proposition 5.3.
- **AHI06**, Ann. Inst. Fourier 56 (2006), read at every place the packet cites, plus Lemma 1.1.4 (p.1006),
  Lemma 1.2.1 and Theorem 1.2.2 (pp.1010–1011), Lemma 2.4.5 and Corollary 2.4.6 (pp.1028–1029), and Propositions
  2.4.15–2.4.16 and Theorem 2.4.17 (pp.1032–1034). Its numbering was compared with arXiv math/0302319 v1 (TeX source,
  February 2003), v2, v3 (TeX source, April 2004) and v4.
- **RUB91**, Rubin, Invent. Math. 103 (1991), read in the GDZ scan (the copy CMAllPrimeMainConjectures cites). §4
  (pp.36–37) was read from page images: the standing hypotheses, the modules, sequence (5), Theorem 4.1 and Remarks
  (1)–(2). The design had recorded this paper as unobtainable.
- **BIL86**, Billot, Compositio Math. 58 (1986), from Numdam: the introduction, §3 pp.351–353, and pp.362–365
  (Theorems 3.22–3.24, with Theorem 3.24 on a page image).

Arnold (Crelle 2007) and Rubin's *Euler Systems* were not read. After this review neither is needed (G4 and G6
below).

## Corrections

1. **IC.3/integral-unit-comparison — wrong form of Rubin's theorem (error).** The design took as its integral
   input "char(X₂^η)=char(U₂^η/C̄₂^η)", in proof step 1 and in gap G2. That is part (i) of Rubin's Theorem 4.1, which
   is for p **split**. For p inert or ramified, Theorem 4.1(ii) (p.37) gives two things:
   - char(A_∞) divides char(Ē_∞/C̄_∞);
   - the χ-parts are equal for every irreducible χ of Δ that is nontrivial on the decomposition group of p.

   Rubin's Remark (2) on the same page notes that X_∞ and U_∞/C̄_∞ are not torsion in the nonsplit case, so the
   design's equality is not available. The node now imports part (ii) from CMAllPrimeMainConjectures
   `CZ.2/classical-two-variable-main-conjecture`, with Rubin's modules from `CZ.2/rubin-iwasawa-modules`. It names the
   hypotheses to check for K₀=H(E[p]). It translates through a twisting dictionary as in AHI Lemma 2.4.5 and
   Corollary 2.4.6. At the inert prime the χ-hypothesis, not AHI's local argument, removes the contribution of the
   primes above p.
2. **IC.3/global-unit-module.** The Euler-system supplier is now CMAllPrimeMainConjectures
   `CZ.0/standard-elliptic-unit` and `CZ.2/elliptic-unit-euler-system`. That roadmap's design merged on 19 October,
   and route 6 of the BKO extraction makes it the owner.
3. **IC.1/infinite-modules.** The compact condition at v∤p is now stated: it is the full local cohomology, the
   annihilator of the zero discrete condition (AHII p.612). The design's "same finite conditions" left this open.
4. **IC.1/away-p-vanishing.** The proof is now self-contained: it uses weights and the local Euler characteristic,
   which is AHI Lemma 1.1.4 (p.1006). Arnold Proposition 2.10, which BKO cite, is not needed.
5. **IC.5/global-control.** The integral errors away from p are finite by AHII's own argument (p.619), which applies
   verbatim to the avatar:
   - only places above f matter;
   - there W^(I_v) is a proper R-submodule of W≃L/R, because φ is ramified at v;
   - a proper R-submodule of L/R is finite.

   Together with item 4, this closes **G4**.
6. **IC.5/strict-control.** BKO's first inequality only needs dim Sel_str(K_n,V_pE)^χ ≤ ord char(X_str). The node is
   restated as that inequality and proved from the injective half of control:
   - the kernel of restriction lies in H¹(Γ_n, W^(G_(K_∞))), and W has no invariants over the tower (AHII p.618);
   - coranks are rational dimensions;
   - the new lemma below bounds the dimension by the length.

   Rubin's *Euler Systems*, Proposition 7.3.4, is not needed. This closes **G6**.
7. **IC.5/specialization-length-bound (added lemma).** Over a local ring A, dim_κ(κ⊗_A M) ≤ length_A(M). It is
   applied at the height-one prime of a finite character, where the length is the order of vanishing of the
   characteristic ideal. It rests on four Mathlib declarations read at 082e2d3:
   - `Module.length`;
   - `Module.length_le_of_surjective`;
   - `IsLocalRing.length_restrictScalars`;
   - `Module.length_eq_finrank`.

   No other packet plans this step.
8. **IC.6/strict-divisor, IC.6/matching-bound and IC.6/rank-bounds: χ versus χ⁻¹.** Dual modules specialize at χ⁻¹,
   while BKO bound by ord_χ L_p. ord_(χ⁻¹)L_p=ord_χ L_p when the ideal (L_p) comes from Λ_O, because Φ/Q_p is
   unramified and so an automorphism over Φ inverts χ(γ). This needs O-coefficients. BKO build ξ with R-coefficients
   (Proposition 3.3, p.953), so for a general Gross datum L_p is only R-integral and the two orders are kept apart.
9. **IC.6/rank-bounds: E/K forces h_K=1.** E has CM by O_K, so j(E) generates H over K; "E is defined over K" (BKO
   Theorem 6.2) therefore forces H=K. Then φ is the Grössencharacter of E/K, R=O, and step 8 applies. The h_K=3 test of
   IC.0 belongs to Theorem 6.1 only. This is recorded in the node's acceptance list.
10. **IC.4/relaxed-dual-characteristic and G5.** Both inputs of AHII Theorem 4.1 are now located.
    - **Billot.** Theorem 3.24 (pp.364–365) assumes the Leopoldt hypothesis for all intermediate fields (p.353;
      Brumer's theorem gives it here). It also needs γ−1 prime to the two-variable torsion. Its conclusion relates
      the strict module (Proposition 3.8) and the torsion of the Selmer dual by the involution T↦(1+T)⁻¹−1, over
      Z_p-coefficient algebras.
    - **AH's "[1, Lemma 2.1.2]".** No such lemma exists in any public AHI version (E2). The symmetry that removes
      Billot's involution is AHI Lemma 1.2.1.

    Two points stay open in G5. With O- or R-coefficients, complex conjugation also acts on the coefficients, so it
    gives invariance only under the involution combined with that coefficient automorphism. And AHI's ordinary
    analogue, Theorem 1.2.2, has the equality only up to powers of p.

## Gaps after review

- **G1** (early CM supplier) stands. NonordinaryCMSpecialValues is still an unstarted design job.
- **G2** is retitled "Inert units-form translation of Rubin's Theorem 4.1(ii) to the Gross avatar". The supplier
  exists; what remains is the twisting dictionary for the φ-component over R, Rubin's hypotheses for K₀=H(E[p]), and
  the descent to K_∞ with its common correction divisor. The supplier node is itself unreviewed.
- **G3** (integral Gross normalization) stands unchanged. It is the right list of obligations.
- **G4** is closed (items 4–5).
- **G5** is rewritten (item 10).
- **G6** is closed (item 6).

## Baseline

The design's two declarations were confirmed in the pinned tree:

- `Module.Basis`, the structure in `Mathlib/LinearAlgebra/Basis/Defs.lean`, with `repr` its field;
- `Ideal.span_singleton_mul_left_unit` (`Mathlib/RingTheory/Ideal/Span.lean`, line 101).

The four added declarations are listed in item 7. None was removed.

## Supplier check

Every cross-roadmap node the packet cites exists, and each statement was read:

- ALU.0, ALU.2, ALU.3, ALU.4 and ALU.8 (accepted);
- SelmerIwasawaCohomology L1–L3 (accepted);
- ArithmeticGaloisDuality R02.2 and R02.4 (accepted);
- PadicMeasuresIwasawaAlgebras L4 api-2/4/7/8/9 (the packet is marked needs_changes, but the roadmap is now merged
  upstream as TauCetiRoadmap #780, and its README §4.6 states these targets: charIdeal_mul_of_exact,
  charIdeal_quotient_span, semilinear transport, base change and restriction of scalars to Z_p⟦T⟧);
- CMAllPrimeMainConjectures CZ.0/CZ.2 (design only, review pending).

The PadicMeasuresIwasawaAlgebras L4 request was rewritten. It now asks only for what upstream §4.6 lacks: restriction
of scalars over a base other than Z_p, and the identification of the divisor coefficient with the order of vanishing.
The specialization bound is now planned here. The L5 request no longer lists IC.5/strict-control.

## Source issues added (each with this review's verdict)

- **E1** (misprint, AHII p.620, also in arXiv v2). In the proof of Proposition 5.3, ω_n^+ω_n^− is written γ^(p^k)−1;
  it should be γ^(p^n)−1.
- **E2** (gap, AHII p.616). The proof of Theorem 4.1 cites "[1, Lemma 2.1.2]". Every version of AHI numbers 2.1.2 as
  a remark on Katz's measure. The needed input is the conjugation symmetry of Lemma 1.2.1. It is recorded as a gap,
  not a misprint, because the intended reference cannot be identified with certainty.
- **E3** (misprint, Billot p.342). The introduction calls the body's Theorems 3.23 and 3.24 "3.24" and "3.25".
  AHII cites the body numbering, correctly.

No published correction exists in the places searched (listed in each entry). Nothing in BKO21 was found wrong. Its
remark on p.962 that its "sign convention is opposite" to AH's concerns the character-set labels only; the Selmer
labels and the torsion statement for X^(−ε) agree verbatim.

## Suggested Lean file

The design's 76-line coordinate facet is kept. The review adds light real-bodied definitions whose carriers exist at
the pins:

- IC.0: `Sign`, `conductorExponent`, `bkoSign` and `ahSign`. The swap `ahSign_eq_neg_bkoSign` is **proved**, which
  mechanically checks the AH/BKO label dictionary, and the exponent and label examples are decided.
- IC.5: `InertCM.controlPolynomial` for ω_n^± at an element γ, with `controlPolynomial_product`,
  `controlPolynomial_map` and `controlPolynomial_eval` (the zero criterion at a primitive p^r-th root of unity). The
  level-zero example is proved; the order-p and order-p² examples are stated.
- IC.5: `finrank_residueField_tensor_le_length`.
- IC.6: the containment direction (fg)⊆(f), proved.

`lean-check` at the pins exits 0. The only warnings are 10 `declaration uses 'sorry'`; memory was checked first (78 GB
available). The packet's API names for the heavy carriers (`InertCM.Datum`, `signedLocalCondition`, `signedSelmer`,
`selmerDual`, …) are not in the file: their carriers are not at the pins, so under the 2026-10-12 shape they are reader
targets.

## Roadmap definition

- The README now says four gaps (not six).
- It names CMAllPrimeMainConjectures CZ.2 as the owner of Rubin's theorem.
- It notes that PadicMeasuresIwasawaAlgebras is upstream.
- `CMAllPrimeMainConjectures` is added to `prerequisites`, and `CMAllPrimeMainConjectures:CZ.2` to IC.3's `requires`.
  The atlas treats it as a pending link until that roadmap is promoted.
- The IC.3 and IC.5 descriptions are updated.
- RUB91 and BIL86 are added to `sources`.

## Questions and follow-ups for the orchestrator

1. **The reader document is out of date and is not a deliverable of this job.** The queue lists
   `readmes/InertAnticyclotomicCMMainConjecture.md` among the design's outputs but not the review's, so this review
   did not edit it. Promotion copies it as it stands, so it should be re-rendered from the reviewed packet before or
   as it goes live. The passages that changed (line numbers in the design's reader):

   | line(s) | passage | change |
   |---|---|---|
   | 7 | "Six explicit source/proof gaps…" | four gaps; Rubin input owned by CMAllPrime CZ.2 |
   | 283–308 | IC.1/away-p-vanishing proof and source | AHI Lemma 1.1.4; Arnold not needed |
   | 356–400 | IC.1/infinite-modules statement | full compact condition away from p |
   | 575–617, 700–728 | IC.3/global-unit-module, IC.3/integral-unit-comparison | Rubin 4.1(ii) inert χ-part form; CZ prerequisites |
   | 786–812 | IC.4/relaxed-dual-characteristic | Billot 3.24 and AHI 1.2.1 |
   | 976–1005 | IC.5/global-control | finite away-p errors; no G4 |
   | 1035–1065 | IC.5/strict-control, new IC.5/specialization-length-bound | new statement and proof; new node |
   | 1070–1179 | IC.6/strict-divisor, IC.6/matching-bound, IC.6/rank-bounds | χ⁻¹ orders; h_K=1 |
   | 1192–1255 | requests and gap list | G2/G5 rewritten, G4/G6 removed |
   | 1256–1269 | sources and access | Rubin 1991 obtained (GDZ) |
   | (new) | source issues | E1–E3 |

2. CMAllPrimeMainConjectures CZ.2 should be reviewed with this consumer in mind. Its node already states Rubin's part
   (ii) correctly.
3. NonordinaryCMSpecialValues (G1) is still the main missing supplier.
