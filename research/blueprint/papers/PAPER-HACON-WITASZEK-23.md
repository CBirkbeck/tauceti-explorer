# Hacon–Witaszek (2023): the relative MMP for fourfolds in positive and mixed characteristic, extraction and routing

Issue [#1369](https://github.com/CBirkbeck/tauceti-explorer/issues/1369). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints (Codex and Claude Code), whose report follows below as history.
- **The paper.** C. Hacon and J. Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*, Forum Math. Pi 11 (2023), e10.
  - The checkpoint's published copy (SHA-256 d7ba34ec…) remains the reference.
  - The Cambridge endpoint returned HTML to this environment, so this continuation re-read arXiv v2.
- **Items.** The result has **163 items: 10 library, 5 planned and 148 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
  - The published numbering in the locators is continuous in every section.
  - Theorems 1.1 and 1.2 now name their body items (Theorems 4.1/4.6 and 5.1).
- **Mistakes.** Eleven are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**E6 rechecked.** The lemma (Lemma 6.6; Lemma 6.4 in arXiv v2) is proved only by citing [KM92, 12.1.8] and [dFH11, Prop. 3.1]. Both are local statements near the special fibre, so the unrestricted global form is not supported by its proof, and the checkpoint's counterexample stands.

**Gaps.** Every gap now has a status.
- **gap-surface** is resolved; the fixed-coefficient lemma is proved.
- **Recorded as findings:**
  - gap-index (E1);
  - gap-difficulty (E4, E5);
  - gap-qcartier (E6);
  - gap-picard (E7, the gap in Theorem 6.1(2b)).
- **Deferred.** gap-n1 is the verification the paper leaves "to the reader". The rest are cited suppliers' proofs, a routine R-boundary reduction, or review.

**Unchanged.** E1, E2 and E6 affect a stated result, and E7 affects the proof of Theorem 6.1(2b). The main MMP theorems are unaffected.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Lemma 2.2, second paragraph, p.5 of the published version (arXiv v2 Lemma 2.2, p.6). *Printed:* index of K_X *Correction:* m should be the Cartier index of K_X + S at P, the log index. For the plt surface germ obtained by localising at P, this equals the order of the local class group, and the conclusions then hold.
- **E2** (error; affects a stated result), Lemma 2.16, p.13 of the published version (arXiv v2 Lemma 2.16, p.14). *Printed:* all these discrepancies *Correction:* Also fix a finite set I ⊂ [0, 1) and require the coefficients of B to lie in I. Then, over the minimal resolution, the exceptional discrepancies take finitely many values. This is what the proof of Proposition 2.15 needs, since the boundaries B_n of a flip sequence all have the coefficients of B.
- **E3** (misprint; affects nothing), Proof of Lemma 2.16, p.13 of the published version (arXiv v2 p.15). *Printed:* −c_i ≤ 2/a_i *Correction:* c_i ≤ 2/a_i ≤ 2/ε.
- **E4** (misprint; affects nothing), Proof of Proposition 2.15, definition of the difficulty d⁺_α, p.12 of the published version (arXiv v2, same passage). *Printed:* b_i ≤ 0 *Correction:* The first sum is over b_i ≥ 0, which is AHK07 Definition 2.3's index a(B_i) ≤ 0 with a(B_i) = −b_i.
- **E5** (misprint; affects nothing), Proof of Proposition 2.15, p.12 of the published version. *Printed:* (−∞,1) *Correction:* W^±_α is defined on (−∞, 1). The weights w^±_α must be defined on all of R, or at least on (−1, ∞), with value 0 at arguments above α, as in AHK07 Definition 2.2.
- **E6** (error; affects a stated result), Published version, Lemma6.6 pp.28–29 and global Q-factorial clause of Corollary6.7(1) p.29. *Printed:* also Q-Cartier *Correction:* Retain a neighborhood of the special fibre in the local deformation lemma; add properness for its global application. The unrestricted global statements fail.
- **E7** (gap; affects the proof), Published version, Theorem6.1(2b) proof p.33, choice of Acal,Hcal. *Printed:* A|_X=A *Correction:* Use Q-Cartier numerical representatives, with restrictions numerically equivalent after rational scaling; construct the needed effective boundary separately.
- **E8** (misprint; affects nothing), Published version, Lemma2.16 proof p.13, equality case in the convexity paragraph. *Printed:* c_2=−2 *Correction:* c_2=2, equivalently C_2²=−2r_2.
- **E9** (misprint; affects nothing), Published version, Theorem4.3 proof p.17, last paragraph. *Printed:* codimension two *Correction:* The flip is an isomorphism in codimension one, equivalently off subsets of codimension at least two.
- **E10** (misprint; affects nothing), Published version, Corollary1.3 proof p.20, crystalline trace display. *Printed:* H^i_crys(X/K) *Correction:* Use H^i_crys(Y/K) for the smooth proper resolution Y whose point count appears on the left.
- **E11** (misprint; affects nothing), Published version, Corollary1.3 proof p.20, sentence after the trace display. *Printed:* all the slopes *Correction:* The slope≥1 assertion is for positive cohomological degrees. Degree zero supplies the contribution1.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **gap-index** (recorded). E1; the log-index version needed by Lemma 4.2 rests on Kollár's surface classification, a cited supplier.
- **gap-difficulty** (recorded). E4 and E5; transferring AHK07's invariance, positivity and decrease proofs is supplier work.
- **gap-surface** (resolved). E2 and E3 are recorded, and the fixed-coefficient lemma Proposition 2.15 needs is proved in fixed-boundary-surface.
- **gap-real-boundary** (deferred). The rational approximation for R-boundaries is a standard reduction the paper uses implicitly; implementation work.
- **gap-vanishing** (deferred). Bhatt's vanishing theorems (BMP) are cited suppliers.
- **gap-lower-mmp** (deferred). The surface and threefold MMP inputs are cited suppliers.
- **gap-f-singularities** (deferred). HX15, HW19, Das15, Sch14, ST18 and SZ13 are cited suppliers.
- **gap-positivity** (deferred). Witaszek, Cascini–Tanaka and Keel are cited suppliers.
- **gap-witt** (deferred). Chatzistamatiou–Rülling, NT20, GNH19 and BBE are cited suppliers.
- **gap-qcartier** (recorded). E6: the global statement fails without properness. The local deformation theorem is KM92 and dFH11, cited suppliers.
- **gap-picard** (recorded). E7: Theorem 6.1(2b)'s proof uses prescribed line bundles that numerical surjectivity does not supply. The numerical repair is in the items; the boundary variant remains proof work.
- **gap-n1** (deferred). The paper leaves property (3) of Claim 5.5 'to the reader' (using ρ(X_k/Z) = 1); writing it out is routine proof work.
- **gap-formal** (deferred). Hartshorne, ABL22 and the Stacks formal-existence results are cited suppliers.
- **gap-audit** (deferred). Independent review and route confirmation are the review pipeline's job.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## Hacon–Witaszek: relative fourfold MMP

Third checkpoint for #1369 · Codex codex-c83e7a · 2026-09-22.
Builds on merged PRs #1682 (codex-a71f92) and #1838 (cc-fb70e5).

Status: **partial**. The whole published 35-page paper has been read again.
The extraction now contains 163 items: 10 library, 5 planned, 148 missing, routed
exactly once through the existing nine routes. The 373 dependency edges
are acyclic. All 46 definitions/constructions have APIs, uses and three planning
tests (138 total). No Lean implementation or compilation is claimed.

This checkpoint proves the properness step needed to globalize Q-Cartier
deformation and supplies an integral flat counterexample to the unrestricted
global statement. It also constructs the numerical effective perturbation used
in the flop-lifting argument. The local mixed-characteristic deformation input
and the perturbed special-step identification remain open. Six newly recorded
source findings supplement the previous five and await independent review.

The paper proves two special relative fourfold MMPs, not the general fourfold MMP:

- **Theorem 4.1:** Q-factorial dlt fourfolds birational over a normal Q-factorial target, with exceptional locus in the floor boundary, over perfect fields of characteristic greater than five or the stated mixed-characteristic DVRs. Standard coefficients suffice; otherwise the strong non-snc-blowup log-resolution assumption is required.
- **Theorem 5.1:** arbitrary MMP sequences for the specified standard-coefficient dlt fourfolds over a DVR terminate when the generic adjoint has nonnegative Iitaka dimension and the special support lies in the floor. The standing strong-resolution hypothesis remains. In equal characteristic, the model must spread over a curve over an algebraically closed field.
- **Theorem 6.1:** for a flat projective lift of a terminal Q-factorial threefold with pseudoeffective canonical class, some possibly non-Q-factorial minimal model lifts. With surjective restriction on rational numerical divisor classes, every chosen MMP sequence and every Q-factorial minimal model lift. With big canonical class, the canonical model lifts. Resolutions are assumed for pairs birational to the **total space**.
- **Theorem 6.2:** the birational liftability statement for terminal Q-factorial Calabi–Yau threefolds requires a **complete** DVR. The source convention includes trivial canonical sheaf and vanishing of intermediate structure-sheaf cohomology.

Other outputs include adjoint-section extension, pl-flips with an ample boundary component, conditional special termination, Witt-rational klt fourfold singularities, the finite-field point congruence with an RCC resolution, dlt modifications and inversion of adjunction. The result file splits the principal theorem conclusions.

### Sources and exact reading boundary

Primary: Hacon–Witaszek, *On the relative minimal model program for fourfolds in
positive and mixed characteristic*, Forum of Mathematics, Pi 11 (2023), e10, 1–35,
[DOI 10.1017/fmp.2023.6](https://doi.org/10.1017/fmp.2023.6).
SHA-256 `d7ba34ecde6764ca39071e14e79854e3c8e8db0750343c0dcc1729b84eda328b`.
The current direct Cambridge request returned non-PDF bytes and was rejected;
the prior public-source PDF was copied and its hash checked against the merged
checkpoint. Every published page, proof and reference was read; pp.13,17,20,29,
30,33 were inspected as images. No private source archive was used.

This pass also read [de Fernex–Hacon v3](https://arxiv.org/pdf/0901.0389v3),
pp.4–7, including its complex-field convention and the full local deformation
proof, and [Stacks 0D3A](https://stacks.math.columbia.edu/tag/0D3A), statement and
proof. Earlier bounded supporting reads remain attributed to their checkpoints:

- [AHK07](https://arxiv.org/abs/math/0605137): §§1–2 through Theorem 2.15, plus Lemma 3.1's statement. This is a characteristic-zero source; transfer is not automatic.
- [BMPSTWW v3](https://arxiv.org/abs/2012.15801v3): selected full proof blocks in §§2–4,6–7, plus 9.32–9.37, not the whole 132-page paper. In particular, the Matlis/local-cohomology, absolute-closure vanishing, adjoint stable-section and inversion-of-adjunction blocks were inspected. Their Bhatt/Popescu and lower-MMP dependencies remain open.
- [Witaszek's relative semiampleness paper](https://arxiv.org/abs/2106.06088): Theorem 1.2's statement and all of §2.4, including Theorem 2.22's proof. The full fibrewise theorem proof is not yet read.
- [de Fernex–Hacon](https://arxiv.org/abs/0901.0389): the characteristic-zero convention, Proposition 3.1's complete proof and neighboring corollary/remarks.
- Stacks [08Z9](https://stacks.math.columbia.edu/tag/08Z9), [08BE](https://stacks.math.columbia.edu/tag/08BE), its [08B7 setup](https://stacks.math.columbia.edu/tag/08B7), [09ZT](https://stacks.math.columbia.edu/tag/09ZT) and [09ZW](https://stacks.math.columbia.edu/tag/09ZW): the selected statements/proofs, not their transitive closure.
- The preceding partial PAPER-WITASZEK-22 extraction: its entire 46-page preprint reading and bounded Keel/CT20/quotient/descent audit are reused with their existing gaps.

The source list also gives direct primary pointers for the still-unread ABL22, Ber21, Waldron, CR12, BBE07, NT20, GNH19 and Schwede proofs. Locating an abstract is not counted as reading its theorem or proof.

### Local Q-Cartier deformation and proper globalization (E6)

Lemma 6.6 is printed for an arbitrary normal scheme over a DVR and gives a global
Q-Cartier conclusion. The cited dFH11 Proposition 3.1 gives a conclusion on a
neighborhood of the central Cartier divisor. The unrestricted global claim is
false, even with an integral, flat, excellent total space and smooth special fibre.

Let R=Z_p for p>5, with fraction field K and residue field k, and put

`V=Spec R[x,y,z,w]/(xy−zw)`,
`T=V minus {(p,x,y,z,w)}`, `S=T_k`,
`Z=V(x,y,z,w) intersect T`, `D=V(x,z) intersect T`.

The ring is a domain and R-flat. As a hypersurface it is Cohen–Macaulay; its
singular vertex section has codimension 3, so it is normal by R1 and S2. The
special fibre S is the punctured threefold node, which is smooth, normal and S3.
The remaining generic vertex Z is a nonempty closed subset of T, isomorphic to
Spec K, disjoint from S. The ruling D is a prime Weil divisor and is Cartier
off Z, hence restricts to a Cartier divisor on S.

Here is an explicit check that D is not Q-Cartier at the generic vertex. Resolve
the generic node by the incidence scheme in `N×P¹_[s:t]` with equations
`xt=zs` and `wt=ys`. Its two smooth charts are

| Chart | Coordinates | Map to the node |
| --- | --- | --- |
| s≠0 | x,w,u=t/s | z=ux, y=uw |
| t≠0 | z,y,v=s/t | x=vz, w=vy |

The overlap has v=1/u. The map is an isomorphism away from the node and has
exceptional fibre P¹, with no exceptional prime divisor. The strict transform
of D has local equations x and z; their transition is z=ux. Its divisor line
bundle restricts to O_P¹(−1). If mD were Cartier on a neighborhood of the node,
its pullback would equal m times that strict transform because the morphism
has no exceptional divisor. But a pulled-back line bundle restricts trivially
to the fibre over a point, whereas this restriction has degree−m. This
contradiction holds for every positive m.

All the printed hypotheses of Lemma 6.6 are therefore satisfied, including
the codimension condition since Z∩S is empty. The global conclusion fails.
The special fibre is also a smooth Q-factorial terminal threefold, so the same
example disproves the unrestricted global Q-factorial implication in
Corollary 6.7(1). It does not contradict the paper's **projective** lifting
applications. The failure occurs precisely at a closed bad locus whose image
is only the generic point; that image is not closed.

The required repair is elementary. If `f:T→Spec A` is proper with A local,
every nonempty closed subset C of T meets the closed fibre: f(C) is closed
and nonempty, and every nonempty closed subset of Spec A contains its closed
point. Thus every open neighborhood of the entire closed fibre is all of T.
For a fixed divisor D, union the local Q-Cartier neighborhoods supplied along
the closed fibre and apply this fact. Quasi-compactness then supplies a common
Cartier multiple by taking the least common multiple of finitely many local
indices. No uniform index is needed before forming the union.

This proves `proper-neighborhood-exhausts` and the corrected conditional
`qcartier-global`. The pinned `IsProper` and `Scheme.Hom.isClosedMap` declarations
were read and reused. The local theorem is a separate input; dependencies of
the canonical, Q-factorial and lifted-step items now explicitly retain it.
In particular, the local-cohomology module to which the dFH proof applies
Nakayama needs an actual finiteness or vanishing justification before transfer
to mixed characteristic. Surjective multiplication on an arbitrary non-finite
module does not suffice. That is an unresolved proof leaf, not a claim that
the cited local theorem is false.

### Numerical representatives and the effective perturbation (E7)

On p.33, surjectivity on rational numerical divisor classes is used to choose
Cartier divisors with specified restrictions as line bundles. That inference
is stronger than the hypothesis. The necessary effective perturbation can
instead be constructed as follows.

1. For a chosen flop contraction f:X→Z, choose H=f*H_Z with H_Z ample and
   A the Q-Cartier strict transform of an ample divisor on the chosen flop.
   N¹_Q surjectivity gives Q-Cartier total-space representatives Hcal,Acal
   satisfying Hcal|X≡H and Acal|X≡A. Clear multiples only where needed.
2. H is nef and big. Choose a relatively ample B. For every rational δ>0,
   Hcal|X+δB|X is ample. By Stacks 0D3A it is relatively ample: the open
   neighborhood of the closed point in a local base is the whole base.
   Hence Hcal_eta is nef. Flat cubic-intersection constancy and the nef
   top-intersection criterion give Hcal_eta³=H³>0, hence bigness.
3. For m sufficiently large, mHcal_eta+Acal_eta is big. A divisible multiple
   has a nonzero section on the generic fibre. For its line bundle L on
   the total space, M=H⁰(T,L) is finite and torsion-free over the DVR, with
   nonzero generic localization. Choose a primitive element s∉πM.
   The exact sequence `0→L --π→L→L|X→0` says that s|X≠0. Its effective
   divisor therefore does not contain X. Dividing by the chosen multiple
   gives Dcal with Dcal|X≡mH+A.
4. On the prescribed ray, H has degree zero and A has negative degree, so
   Dcal has the required negative degree. Under the standing strong
   resolution hypothesis, a fixed common log resolution permits ε>0
   sufficiently small so that the total pair with boundary X+εDcal is plt
   and the special pair with boundary εDcal|X is terminal.

This argument uses neither completeness nor H²(O_X)=0. The independent
special-ampleness statement is now separated from Lemma 6.5's actual Picard
lifting result. The latter keeps both of those additional hypotheses.

This closes the *choice of numerical representatives and effective boundary*,
not the entire proof of Theorem 6.1(2b). One must still verify the boundary-pair
version of the lifted-step argument, identify its special output with the
prescribed flop, and prove the needed numerical descent/persistence. Numerical
positivity and coherent finiteness/base-change suppliers remain explicit
foundation imports. `gap-picard` is narrowed accordingly; it is not marked
resolved merely because the intersection signs are correct.

### Earlier source findings retained

A continuation on 2026-09-22 (Claude Code, session `cc-fb70e5`) checked the diagnostics below at their locators, on published page images (pp.5, 12, 13) and in arXiv v2 (2021-08-16, the latest version; same wording). It recorded five mistakes in the JSON's `sourceIssues`. Crossref lists no correction for the DOI, and none was found on the journal page. These are worker findings awaiting the independent review.

| id | locator | kind | finding |
|---|---|---|---|
| E1 | Lemma 2.2, p.5 | error | the canonical Cartier index should be the index of K_X + S. On the A1 cone with S = V(x,z), m = 1, yet S has index 2 and the different is ½P. With index(K_X+S) = 2 every clause holds. The only consumer (Lemma 4.2) needs standard coefficients only. |
| E2 | Lemma 2.16, p.13 | error | False without fixing the boundary coefficients: on the same A1 cone, B = bC (0 < b < ½) is ½-lc with one exceptional discrepancy −b/2, which takes infinitely many values. Correct with coefficients in a fixed finite set; proved in `fixed-boundary-surface`. Proposition 2.15 is unaffected. |
| E3 | proof of Lemma 2.16, p.13 | misprint | the negative c_i bound should be c_i ≤ 2/a_i. |
| E4 | proof of Proposition 2.15, p.12 | misprint | The difficulty's first sum over b_i ≤ 0 vanishes identically (W(b) = 0 for b ≤ 0). AHK07 Definition 2.3 sums over a(B_i) ≤ 0, that is b_i ≥ 0. |
| E5 | proof of Proposition 2.15, p.12 | misprint | The weights w^±_α are given domain (−∞,1) but are evaluated at arguments ≥ 1. They should be defined on R, with value 0 above α (AHK07 Definition 2.2). |

**Corrected Lemma 2.16 (proof in the JSON).** Fix m, ε and a finite coefficient set I ⊂ [0,1). The only new ingredient beyond the source's own [Kol13] inputs is a bound. From (K_{S′}+B_{S′})·C_i = 0 and adjunction on the conic C_i,

f^{-1}_*B·C_i = 2r_i + a_iC_i² − Σ_{j≠i}(1−a_j)C_j·C_i < 2r_i ≤ 8,

so these right-hand sides lie in the finite set F(I). Convexity along legs leaves at most one constant run per leg, so the collapsed linear system has bounded size and coefficients from a finite set, and a unique solution. Hence finitely many values.

In Proposition 2.15's singular-locus case the germ's boundary coefficients are those of B. The minimal-resolution curves are among the finitely many places of discrepancy ≤ 0, which gives both m and ε. gap-surface is resolved. gap-index keeps only the general excellent-surface proof of the log-index version. gap-difficulty keeps only the transfer of AHK's proofs out of characteristic zero.

E1's impact field now records that the printed lemma itself is false, while
its standard-coefficient consumer remains unaffected by the displayed example.
No independent-review verdict has been added by this continuation.

### Additional transcription corrections

| Finding | Locator | Correction |
| --- | --- | --- |
| E8 | Lemma 2.16 proof, p.13, convexity equality case | c_2=2, since C_2²=−r_2c_2. This differs from E3's bound sign. |
| E9 | Theorem 4.3 proof, p.17, last paragraph | A small flip is an isomorphism in codimension 1, which is what Lemma 2.7 needs. |
| E10 | Corollary 1.3 proof, p.20, trace display | Compute crystalline cohomology of the smooth resolution Y. |
| E11 | Same proof, next sentence | The slope≥1 assertion excludes H⁰; degree 0 contributes 1. |

All four were checked on page images. The author publication page, Cambridge
article page, arXiv history and bounded title/DOI correction searches yielded
no matching published correction on 2026-09-22. This does not establish that no
correction exists. All six new findings E6–E11 are extracting-worker findings
awaiting independent review. No messages were sent to the authors.

### Additional guards retained

- Definition 2.4 uses **floor** rounding; B⁰ trace twists use **ceiling**.
- Adjoint B⁰ uses a direct sum of sheaves before trace. Its images form a sum of submodules, not necessarily a direct sum.
- The B⁰ Weil restriction theorem does not need the extra Q-factorial/strong-F-regular/dimension assumptions of the non-Cartier S⁰ version.
- X⁺ is an inverse limit of schemes, with filtered-colimit structure algebra. Class-by-class finite-cover killing is not uniform killing by one cover.
- A small flip is an isomorphism off a set of codimension at least two; the wording in Theorem 4.3's proof must not be upgraded to an isomorphism in codimension two.
- Proposition 5.2 applies dlt modification to a perturbed general-coefficient boundary although its citation 4.8 is standard-coefficient. Supply the adapter.
- Claim 5.5 leaves an N¹ generation check to the reader. It is now an explicit item.
- Conjecture 5.7 remains conjectural. Mere resolution existence is not the stronger non-snc-blowup hypothesis.
- In the point-count proof, the smooth resolution's cohomology is used in its trace formula. The slope≥1 assertion concerns positive degrees; H⁰ contributes the required one.
- The R-boundary termination statements need a justified bridge to their proofs' Q-linearly effective representatives.

### Library baseline and ownership

Pins remain Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Existing line-bundle, proper,
finite, integral, derived-category, Ext-colimit local-cohomology, Witt-vector,
Frobenius, regular-sequence and Nakayama carriers remain imports. Their presence
does not supply geometric local cohomology, Matlis duality or the MMP.

The current pass refreshed 491 inputs at
`6488244af073abd91f39e4969f06eeda8b980d3d`, reread the full SF roadmap,
reviewed SF.4/SF.5 target entries and the shared numerical-Picard brief. It read
`IsProper` and `Scheme.Hom.isClosedMap` at the exact pin. Earlier supporting
library reads remain attributed in the JSON. No new generic carrier or Part II
identity is introduced.

### Routes

| Owner | Missing items | Decision |
|---|---:|---|
| SchemeAndStackFoundations SF.0 | 4 | General divisor/reflexive and absolute-closure indexing foundations |
| SchemeAndStackFoundations SF.4 | 16 | Formal/lifting/obstruction and guarded Q-Cartier deformation adapters |
| SchemeAndStackFoundations SF.5 | 1 | Flat-family intersection constancy |
| DeformationAndDerivedPatchingAlgebra R03.3 | 1 | Missing Matlis/local-algebra refinement; depth itself is already planned |
| AnalyticStacks AS.1 | 2 | Singular coherent duality, finite trace and derived local-cohomology adapters |
| SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry | 103 | New Part II for the source-scoped birational theory and its applications |
| CrystallineCohomologySingularWittRationality | 5 | New Part II for singular rational-Witt cohomological suppliers |
| SchemeAndStackFoundationsMixedCharacteristicPositivity | 6 | Reuse the pending PAPER-WITASZEK-22 Part II |
| NumericalPicardAndContractionDescent | 10 | Reuse the pending PAPER-SCHROER-23 Part II |

The five planned interfaces are general depth/CM, coherent base change, formal existence, Witt sheaves and the rigid/crystalline trace comparison. The new birational extension imports them and does not reconstruct them.

The coherent duality route refines the classical coherent-formalism owner; its smooth Serre-duality target is not evidence that arbitrary singular finite traces are already planned or proved. The singular-Witt extension starts beyond CR.4's Witt complexes and RD.7's smooth proper comparison. It owns the cohomological supplier, while the birational extension owns the singularity predicate and fourfold theorem.

Pending proposals are deliberately marked **missing**, not planned. Reuse their IDs during design; do not mint another positivity or numerical-Picard roadmap. Every Part II brief specifies final theorem hypotheses, imports and acceptance/diagnostic obligations.

### Remaining work and validation

Thirteen of the fourteen named gaps remain open. The properness step is now
proved, while the local deformation proof still needs its finite-generation
or vanishing argument. The numerical perturbation is constructed, while the
boundary-step identification and descent remain open. Preserve the earlier
log-index, difficulty-transfer, lower-dimensional MMP, stable-section,
Witt-rationality and formal-deformation frontiers.

The paper checker and intake checker passed for the three authorized files.
The separate audit checked all 163 IDs, 373 acyclic dependency edges,
exact single routing of 148 missing items, valid gaps, and all 46 APIs/use lists
with 138 mathematical test contracts. An exact 2061-case diagnostic checked the
node charts and transition, the proper closed-image possibilities and the
rational Cartier-index inequality. Those diagnostics are not a proof of
geometric existence or a Lean test. No Lean file was written or compiled.

## Review (REV-PAPER-HACON-WITASZEK-23, 23 September 2026)

The independent review, by Claude Code (session `cc-7b31c4`, issue #1370), **accepted** this
extraction and all nine routes, and made two corrections. The full record is
[REV-PAPER-HACON-WITASZEK-23.md](../reviews/REV-PAPER-HACON-WITASZEK-23.md).

**Source.** The published Cambridge hash does not reproduce and cannot: a fresh download gave
`32da0efb…` against the recorded `d7ba34ec…`, and every page of the new copy carries a footer with
the date and the requesting IP. A `sha256Note` now records that and names the arXiv v2 e-print as the
reproducible pin — the fifth instance of this in the corpus. The review read the published PDF in
full (35 pages, printed page = PDF page) and the arXiv v2 LaTeX source, which carries every passage
the findings quote outside §§4 and 6.

**The two corrections, both on route 7** (the Part II of `CrystallineCohomology`). Its title read
"Crystalline cohomology, Part II: …", truncating the parent's atlas title, where PROTOCOL §16 asks
for it verbatim and the three sibling Part IIs of the same parent all write it in full; it now does
too. And its area was `cohomology`, which is an atlas group and not a galaxy id; it is now `padic`,
as in `PAPER-ESNAULT-GROECHENIG-20`'s Part II of the same parent. `PAPER-KISIN-MADAPUSIPERA-SHIN-22`
still carries `cohomology` on its Part II of this parent and should be fixed the same way.

**Structure.** 163 items with all 148 missing ones routed exactly once; all five source stage ids and
all five planned ids resolve; all 18 declarations behind the 10 library items resolve, in Mathlib and
Tau Ceti. A note for future checkers: route 5's `AnalyticStacks:AS.1` resolves, but only in
`research/blueprint/roadmaps/AnalyticStacks.json`, whose stages are keyed by `key` and not `id`. No
`libraryPins` are recorded, so there is no commit against which the library claims were checked.

**All eleven findings are confirmed.** The two errors in stated results are the substantial ones and
both counterexamples check out. `E1`: Lemma 2.2 uses the Cartier index of `K_X` where plt adjunction
needs the index of `K_X + S` — on the `A₁` cone with its ruling, `K_X` is Cartier so the printed `m`
is 1, yet the ruling is not Cartier at the vertex, and the log index `m = 2` gives the classical
`(K_X+S)|_S = K_S + ½P`. `E6`: Lemma 6.6 is false as stated, since
`Spec Z_p[x,y,z,w]/(xy−zw)` with the special vertex removed meets every hypothesis while its ruling
fails to be `Q`-Cartier at the generic node. `E2`: the same `A₁` surface with boundary `bC`,
`0 < b < ½`, keeps `m = 1` and `½`-lc while its single exceptional discrepancy `−b/2` sweeps an
interval. `E3` and `E8` are two distinct sign slips against the same proof's convention
`C_i² = −r_i c_i`; `E4` and `E5` are settled by the definitions two lines above them; `E7` is a real
gap, since surjectivity of `N¹` gives numerical representatives and not prescribed line bundles; and
`E9`, `E10`, `E11` are confirmed verbatim, with `E11`'s degree-zero slope-zero term being exactly the
contribution that produces the congruence being proved.
