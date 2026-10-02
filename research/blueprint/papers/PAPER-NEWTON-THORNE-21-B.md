# PAPER-NEWTON-THORNE-21-B: Symmetric power functoriality for holomorphic modular forms, II

James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*, [Publications Mathématiques de l'IHÉS 134 (2021), 117–152](https://doi.org/10.1007/s10240-021-00126-4); arXiv [2009.07180](https://arxiv.org/abs/2009.07180).

Original extraction: Claude Code, session `cc-39fac3`, 23 September 2026, issue #1450. Independent review: Claude Code, `cc-38267a`. Confirmed red-team fixes: Codex, **codex-J6LwjP**, 2 October 2026, [#5533](https://github.com/CBirkbeck/tauceti-explorer/issues/5533). Status: **complete at extraction/routing scope**; implementation and proof closure are not claimed.

The [result JSON](PAPER-NEWTON-THORNE-21-B.result.json) now has **64 items: 2 library, 30 planned, 32 missing**, with every missing item routed exactly once across **seven routes**, **25 prerequisite works** and **four unchanged source issues**. All original item IDs/statuses are preserved. The [fixes report](../redteam/RT-PAPER-NEWTON-THORNE-21-B.fixes.md) applies the six assigned confirmed findings and reconciles the separately confirmed low-severity inventory finding. It adds no source erratum or own independent verdict.

## Source boundary

The original extraction and independent review read the published article in full. The review compared arXiv v2 (27 September 2021) and identified three copy-edits; the versions are close, **not identical**. Historical details remain below. This fix checked published pp. 117–118, 121, 131, 137 and 146–147, BLGGT14 Lemma 1.4.3 on p. 533, and Dummigan–Martin–Watkins's completion on p. 1312. Those three decisive pages were inspected as rendered images. Their downloaded PDF hashes match the red team's files. No new full-paper rereading, preprint collation or recursive supplier audit is claimed. All current source versions, hashes and limits are recorded in the JSON and fixes report; no new correction search is claimed for unchanged E1–E4.

## What the paper proves

Theorem A gives every symmetric-power lift of a non-CM regular algebraic cuspidal representation of GL₂ over ℚ. Theorem 3.1 writes the endpoint as Sym^(n−1), while the introduction uses Sym^n; the indexing is explicit in the items. Corollary B gives entire continuation for the completed symmetric-power L-functions of non-CM elliptic curves. Appendix A assembles the weight-one and CM cases from known transfers; its icosahedral case uses Kim's tensor-product results.

The proof inducts on the number of supercuspidal primes, starting with Newton–Thorne I's endpoint. Seasoned representations supply good-dihedral and Steinberg places and large residual images. Propositions 3.9–3.11 and the proof of Theorem 3.1 remove supercuspidal primes by congruences and lifting.

**Why the new lifting theorem is needed.** Sufficiently large residual characteristic and a sufficiently large residual image give the required irreducibility of Sym^(n−1). The induction also encounters small-characteristic cases where that irreducibility cannot be assumed, while the relevant supercuspidal local representations are nonordinary. Theorem 2.1 is built for those circumstances. There is no blanket claim that p≤n makes Sym^(n−1) reducible: at p=n the exponent p−1 lies in the low-degree irreducibility range.

Theorem 2.1 retains the full item 4 setup: weight two, non-CM, local nonordinarity at p, congruence and matching Steinberg places, and the exact sandwich

```text
PSL₂(F_(p^a)) ⊂ Proj r̄(G_F) ⊂ PGL₂(F_(p^a)),
p^a > max(5, 2n−1).
```

The argument compares the rank-two deformation ring and the conjugate-self-dual pseudodeformation ring through algebraic symmetric powers. The latter's regularity at the known automorphic point follows from Newton–Thorne's adjoint Selmer vanishing, imported from **PolarizedAutomorphyLifting**, not reconstructed in the specialized symmetric-power Part II.

## Corrected support and normalization interfaces

**Odd primes.** Item 16 now covers p>2 only. The patched-module dimension argument identifies R_∞ with the domain R_loc[[X]]. The irreducible spectrum maps into the unique component through the regular automorphic point of P_∞, which lies in patched unitary support. The target point is therefore in support, and Labesse base change and soluble descent give automorphy.

**The dyadic branch.** The separate missing item `dyadic-support-translation` imports Proposition 2.8 (item 20) and the Khare–Wintenberger actions/invariants (item 60). Here R′_∞≅R_loc[[X]] is irreducible. R_∞ lies over the invariant ring of R′_∞ as a Ĝ_m^γ[2]-torsor and can have several components. The group acts transitively on those components. Translate the known automorphic point r′_∞ to r″_∞ on a component containing the target r_∞, then map to p″_∞. Equivariance of P_∞ and H_G,∞ preserves support, and translation preserves the regularity bound. Apply the unique-component argument at p″_∞ to reach the target. The proof never assumes that dyadic R_∞ is a domain. The formal fibre ℤ₂[[x]]/(x(x+2)) is a small counterexample to that inference.

**Weights.** Item 41 retains an algebraic Hecke character bringing π to a normalized weight-k π₀. Only π₀ has the paper's specific algebraic coefficient representation and Hodge–Tate weights {0,k−1}. A general twist by a character of Hodge–Tate weight h has {h,h+k−1}, retaining its determinant twist. For example the inverse cyclotomic twist changes normalized {0,1} to {1,2}, under the paper convention HT(ϵ)=−1. The owner remains **GL2AutomorphicRepresentationsAndTransfer:R16.6**.

**Potential diagonalisability.** The filtration branch of item 59 now requires **potentially crystalline** representations with one-dimensional graded pieces, including ordinary representations only under that hypothesis. The crystalline Fontaine–Laffaille and potentially Barsotti–Tate branches are preserved. An ordinary split multiplicative Tate-curve representation has nonzero semistable monodromy and cannot meet this guard. The PolarizedAutomorphyLifting brief carries the same correction.

**Completed L-function.** Item 45 and the ML.3 source route use the DMW09 completion `Λ(s)=N_n^(s/2)γ_n(s)L(Sym^n E,s)`, with N_n the symmetric-power conductor and the existing geometric-Frobenius Euler convention. The conductor factor is a nowhere-zero entire exponential, so removing it preserves entireness, but introduces an s-dependent factor in the reflected functional equation. It is not silently omitted from the attributed definition.

## Library reuse and ownership

Two items are library:

- Item 28, the compositum Galois fibre-product statement, retains its reviewed Mathlib/Tau Ceti restriction and range declarations.
- `algebraic-symmetric-power-functor` explicitly reuses Tau Ceti's `Representation.symmetricPower`, its intertwining/equivalence functoriality and `SymmetricPower.map`. These are algebraic results for commutative semirings, monoids and modules; they do not assert continuity or finite-field irreducibility.

The separate missing `finite-field-symmetric-power-irreducibility` item states the directly used theorem: for **prime t** and 0≤m<t, Sym^m of the natural representation over F̄_t is irreducible on SL₂(F_t). It is a source addition to **ArithmeticGaloisRepresentations:G7/R01.4**, consumed by items 29 and 36. The existing scope owns residual-image arguments but does not explicitly state this theorem. G7 also supplies continuity and Galois-specific comparisons. The complex SU(2) theorem is a different result. Item 9's new Barsotti–Tate/pseudodeformation conclusion and item 38's automorphic transfer definition remain distinct from the library algebraic functor.

The thirty planned items retain their existing owners, including local deformation rings, global deformations, quaternionic modules, patching, prescribed lifts, ordinary/Hida theory, transfers and determinant theory. Their status does not claim implementation is complete.

## Routes

| Route | Destination | Membership and boundary |
| --- | --- | --- |
| 1, source | ModularityAndLanglandsExtensions:ML.1, ML.3, ML.5 | Six planned endpoint/definition items, including Theorem A, Corollary B, Appendix A and the corrected completion. |
| 2, Part II | SymmetricPowerAutomorphyLifting | 23 missing items: the specialized lifting method and seasoned induction, now with separate odd/dyadic support results. Import the general NT20 ring/Selmer inputs. |
| 3, coalesced Part II | SmoothRepresentationsPartII | One missing Henniart GL₂ types item. |
| 4, coalesced Part II | PolarizedAutomorphyLifting | Five missing general lifting/deformation items: BLGGT14, the NT20 ring and Selmer vanishing, connection relations and potential diagonalisability. |
| 5, source | AutomorphicGaloisRepresentations:R19.3 | One missing Ribet–Momose large-image input. |
| 6, source | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4–R07.5 | One missing Gee residual-inertia input. |
| 7, source addition | ArithmeticGaloisRepresentations:G7/R01.4 | One missing finite-field low-degree irreducibility theorem and its residual-image application. |

These ownership decisions supersede the initial reader's request for another reviewer to choose a treatment. The specialized Part II remains a sibling of the existing symmetric-power methods, importing their endpoint rather than duplicating them. No upstream roadmap or blueprint packet was authorized for editing in this paper-fix job.

## Existing source issues and prerequisites

All four independently reviewed source-issue records remain unchanged: E1's 3-adic image notation, E2's Frob/adjoint indices, E3's conclusion in the 2-supercuspidal induction, and E4's §2 notation. None is newly alleged here. The 25 prerequisite works are unchanged, with cited results kept as black boxes at extraction scope.

The exact regression checks confirm the two-component squaring fibre, 95 weight shifts, conductor-reflection exponent identities, and full generated matrix algebras for 17 low-degree SL₂ symmetric-power examples at p=2,3,5,7, including every boundary m=p−1. Degree-p Frobenius subspaces provide the guard check. These finite calculations do not prove the universal lifting theorem or supplier analytic results. Paper, intake and whitespace checks pass. No Lean file or compilation was requested.

## Review (REV-PAPER-NEWTON-THORNE-21-B, 23 September 2026)

The review accepted the extraction and all six routes after corrections made in place. It was done by Claude Code (session cc-38267a), and the full record is `research/blueprint/reviews/REV-PAPER-NEWTON-THORNE-21-B.md`. The review read the published PDF (the same file) in full, together with the arXiv v2 TeX.

- **Sources:** arXiv v2 is close to, but not identical with, the published text. The review found three copy-edits:
  - the proof of Proposition 2.5 cites ANT20 Proposition 2.5, where arXiv cites Bellaïche–Chenevier Proposition 1.5.1;
  - p. 148 says "potentially crystalline" twice, where arXiv says "potentially Barsotti–Tate";
  - p. 140 corrects ⊗_{v∈T} to ⊗_{l∈T}.
- **Statements corrected:**
  - Item 36 omitted the hypotheses of BLGGT14 Theorem 4.2.1 (CM base, polarization, l ≥ 2(d + 1), ζ_l ∉ F, irreducibility over F(ζ_l)).
  - Item 32 now records how the case 2 ∈ sc(π) must end (E3).
  - Item 34 no longer includes Gee's Theorem 4.6.1, which is now item 61.
  - Items 6, 15 and 18 name the Kisin paper they cite.
  - Planned layers were added to items 3 (R19.1), 6 (R08.5) and 7 (R04.4).
- **New items (24):**
  - **Planned (20):**
    - the definition of Sym^n π;
    - local Langlands and Weil–Deligne representations;
    - Galois representations of polarizable representations;
    - Gelbart's correspondence;
    - Newton–Thorne I Theorem B;
    - BCDT;
    - Godement–Jacquet;
    - Λ(Sym^n E, s);
    - the low-degree transfers;
    - ordinarity;
    - soluble base change and descent;
    - Labesse's base change;
    - Chenevier's determinants;
    - the unique decomposition of multiplicity-free determinants;
    - Cohen–Macaulay support;
    - Cline–Parshall–Scott;
    - Chebotarev;
    - Dickson;
    - Hida control;
    - the Khare–Wintenberger Ĝ_m^γ-invariants.
  - **Missing (4):**
    - the Ribet–Momose large-image theorem (a new source route to R19.3);
    - BLGGT14's relation ∼ and potential diagonalisability (to PolarizedAutomorphyLifting);
    - Gee's Theorem 4.6.1 (a new source route to R07.4–R07.5).
- **Routes:**
  - Items 8 and 17 moved from the new Part II to PolarizedAutomorphyLifting. They are the Newton–Thorne 2020 ring P and the vanishing of adjoint Selmer groups, which three extractions use, so they need one general owner.
  - The Part II brief was rewritten to state its imports and the corrections its layers must respect.
- **Source issues:**
  - E1 and E2 are confirmed.
  - **E3 (new, gap).** In the case 2 ∈ sc(π) of the proof of Theorem 3.1, the argument repeated with 3 replaced by 2 cannot end with Proposition 3.11, because π″ may have 3 ∈ sc(π″). It ends with the case already treated.
  - **E4 (new, misprints).** Notational slips in §2.

  None affects a stated result.
