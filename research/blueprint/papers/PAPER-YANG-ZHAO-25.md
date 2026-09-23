# Yang–Zhao (2025): cohomological Milnor formula and Saito's conjecture, extraction and routing

Issue [#1218](https://github.com/CBirkbeck/tauceti-explorer/issues/1218). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** E. Yang and Y. Zhao, *Cohomological Milnor formula and Saito's conjecture on characteristic classes*, Invent. Math. 240 (2025), 123–191.
  - arXiv v4 was re-fetched; its SHA-256 (e3da9817…) matches the checkpoint.
  - The journal text is closed access, and Crossref registers no erratum.
- **Items.** The result has **142 items: 9 library, 12 planned and 121 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Nine are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**Items.**
- Saito's conjecture (Conjecture 6.12, stated as Conjecture 1.2) was only in the `conjecturalBoundaries` list. It is now the statement-only item M19.
- The introduction's Theorems 1.3, 1.5, 1.9, 1.12 and 1.14, Corollary 1.6 and Proposition 1.11 restate body results; the body items now name them.

**Reclassified to affect nothing.**
- **E7.**
  - The problem: Lemma 3.2's final specialization needs Λ_X to be ULA over S.
  - Why it is harmless: that holds over a field, and the lemma's one use (Lemma 3.15) is over a perfect field.

**Unchanged.** E6 and E8 affect the proof, and the checkpoint already gives their repairs:
- **E6.** The projection formula in place of σ_*σ^*F = F^⊕d.
- **E8.** A coefficient extension, because a nontrivial additive character F_p → Λ^× can fail to exist.

No finding affects a stated result.

**Gaps.**
- G07 is recorded as E8.
- G01 is unavailable.
- The others are deferred as cited suppliers' proofs or design work. G09 is among them: UYZ's journal lemma for quasi-projective X is not openly available, and item M15 keeps it as a verification point.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), §2.3(3), p.8, prose and (2.3.5), arXiv v4. *Printed:* δ!Λ *Correction:* Replace the displayed δ!Λ factors by δ!G in the description of the left vertical map of (2.3.4).
- **E2** (misprint; affects nothing), §3.6, p.16, two tensor-dual expressions, arXiv v4. *Printed:* D_X/S(F) *Correction:* Use D_X/S(G) in both descriptions of a correspondence from G to F.
- **E3** (misprint; affects nothing), Lemma3.14 proof, p.21, prose immediately after (3.14.5), arXiv v4. *Printed:* F⊠D_X'/S(G) → F⊠K_X'/Y *Correction:* The evaluation morphism to which c is applied is (F⊠S D_X'/S(G))⊗p2*G→F⊠S K_X'/S.
- **E4** (misprint; affects nothing), Proposition4.14, p.27, vanishing hypothesis preceding (4.14.2), arXiv v4. *Printed:* K_X'/Y' *Correction:* Replace Y' by Y. In the following formula spell out ν_target^−1 after the defect pushforward when only target C2 is assumed.
- **E5** (misprint; affects nothing), Proposition4.15 proof, p.28, isomorphism string after (4.15.4), arXiv v4. *Printed:* (f'e0)* *Correction:* Use (e0 f')* (equivalently f'^* e0^*) in that pullback expression.
- **E6** (error; affects the proof), Theorem6.13 proof, p.50, sentence before (6.13.2), arXiv v4. *Printed:* σ*σ*F=F^⊕deg(k'/k) *Correction:* Use the projection formula σ*σ*F≃F⊗σ*Λ. The finite-free lisse sheaf σ*Λ has rank d but need not be constant. Apply Lemma3.2 to cohomological classes and the étale-local additive rank-twist identity M13 to characteristic cycles/Chow classes; then the needed endpoint equalities in(6.13.2) follow, and d is inverted only in Λ-cohomology.
- **E7** (gap; affects nothing), Lemma3.2, p.15, final specialization, arXiv v4. *Printed:* C_X/S(L)=rankL·C_X/S(Λ) *Correction:* For the stated general base add Λ_X∈Dctf(X/S,Λ) to this specialization, or restrict to the field-base applications where it holds. For nonlocal coefficient rings specify trace-rank or constant finite-free rank.
- **E8** (gap; affects the proof), arXiv2209.11086v4 p.45, paragraph before Theorem6.3 and §6.4 character choice; journal passage not inspected. *Printed:* We choose a non-trivial additive character ψ : Fp → Λ* *Correction:* First replace Λ by the finite local faithfully free algebra B of Q01, run the character-admitting proof there and descend by Q07–Q10. Do not divide by the coefficient extension degree.
- **E9** (misprint; affects nothing), Saito, On the proper push-forward of the characteristic cycle of a constructible sheaf, arXiv1607.03156v1 p.3, paragraph preceding (8); journal text not inspected. *Printed:* equals the support of X *Correction:* The base of SS(F) is the support of F.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G01, Final journal-version reconciliation** (unavailable). The Inventiones text is closed (Unpaywall, Springer previews only); arXiv v4 was read in full.
- **G02, Enhanced six-operation and coherence proof closure** (deferred). Gaitsgory–Rozenblyum, Hemo–Richarz–Scholbach and Lurie are cited suppliers.
- **G03, General-base relative duality and transversality leaves** (deferred). Saito, Illusie and Lu–Zheng are cited suppliers; the Lemma 3.2 scope is E7.
- **G04, Absolute-purity, semipurity and regular-class scope** (deferred). Fujiwara and ILO are cited suppliers.
- **G05, Hansen–Scholze ULA extension descent** (deferred). Hansen–Scholze is a cited supplier.
- **G06, Nearby-cycle finiteness and goodness domain** (deferred). The nearby-cycle finiteness results are cited suppliers.
- **G07, Local Fourier and modular-to-adic proof closure after coefficient descent** (recorded). The missing character is E8, with its coefficient-extension repair; UYZ and Laumon are cited suppliers.
- **G08, Positive-characteristic microlocal existence and integrality** (deferred). Beilinson and Saito's characteristic-cycle theory are cited suppliers.
- **G09, Quasi-projective pencil and blowup hypothesis reconciliation** (deferred). UYZ's journal Lemma 4.2.7 is a cited supplier. Its final text returned HTTP 403, and the accessible arXiv version treats projective X, so item M15 keeps the quasi-projective form as a verification point.
- **G10, Localized Chern and conductor comparison input** (deferred). Saito's localized Chern input is a cited supplier.
- **G11, Complete prerequisite granularity** (deferred). Prerequisite granularity is design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-YANG-ZHAO-25 — localized Chern classes and the global conductor comparison

Third partial checkpoint, Codex `codex-c83e7a`, issue #1218, continuing [PR #2029](https://github.com/CBirkbeck/tauceti-explorer/pull/2029). The earlier report is preserved below as a historical record. This checkpoint has 141 items: 9 library, 12 planned and 120 missing, with 298 acyclic dependency edges and six routes. Its 52 definitions/constructions have 158 API entries and 156 proposed specification tests. Eleven gaps still prevent source closure. No Lean implementation or independent review is claimed.

### What this checkpoint adds

The central addition is an explicit proof chain for the global localized-Chern comparison in Yang–Zhao Remark 6.8. It keeps the class on the bad fiber distinct from its image on the target curve. It also corrects an error in our previous extraction: the two-term cotangent presentation need not be exact off the bad fiber. Its degree-zero cohomology there is a locally free sheaf of rank `n−1`. For the smooth projection `P¹×A¹→A¹`, that cohomology is the nonzero relative cotangent line bundle.

All 130 previous item IDs and statuses, the nine source findings and the conjectural boundaries are retained. M08's statement is corrected; M05's generic intersection operations are delegated to their existing owner; A14 gains the explicit proof bridge. These are changes to this extraction, not additional alleged errors in the papers.

### Sources and precise reading scope

The newly downloaded [Yang–Zhao arXiv v4](https://arxiv.org/pdf/2209.11086v4) is byte-identical to the version read completely in this session for PR #2029. That full 51-page reading is reused, and pp.48–49 were freshly reread here. The final 69-page journal version remains unavailable; this is not a claim of a fresh second full reading or of journal collation.

The new source work is:

- [Saito, arXiv:1704.04832v4](https://arxiv.org/pdf/1704.04832v4), §2.1 on pp.28–31 through Lemma 2.1.4, including the complete displayed proofs of Lemmas 2.1.1–2.1.4. Pages 30–31 were also inspected as images. The conductor theorem on p.34 was inspected for context; its full proof was not read. The AMS endpoint returned 403, so all locators explicitly refer to arXiv v4.
- [Kato–Saito, *On the conductor formula of Bloch*](https://www.numdam.org/item/PMIHES_2004__100__5_0.pdf), printed pp.50–51, PDF pp.46–47: the rank-threshold definition, Proposition 2.3.1, the resolution-independence paragraph, Lemma 2.3.2 with its whole proof, and Corollary 2.3.3. Printed p.50 was checked as an image. Proposition 2.3.1 refers to earlier sources for its proofs; those references are still gaps.
- The complete [one-page author corrections](https://www.ms.u-tokyo.ac.jp/~t-saito/bcor.pdf) concern printed pp.94 and 101 of Kato–Saito, not §2.3. Saito's arXiv history identifies corrections incorporated before v4. No new source issue is proposed.

URLs, dates and SHA-256 hashes are in `sourceLedger`. Bloch's original §1 and the full graph-construction/Whitney proof chain remain unacquired. Reading a later proposition that records their properties does not close those leaves.

### Localized construction and section comparison

J02 states the required construction accurately. A bounded complex K of finite locally free sheaves has cohomology only in degree zero on `U=X−Z`, where `H⁰(K)` has rank `n−1`. Its Chern classes of degree at least n acquire support on Z. The lower classes remain ordinary classes. Forgetting support gives the virtual total class

`c(K)=∏q c(Kq)^((-1)^q)`.

The construction must retain quasi-isomorphism invariance, support enlargement, proper compatibility and the localized Whitney formula. These are explicit supplier obligations, not consequences of agreement after forgetting support.

J10 extracts the Cartier normalization from Kato–Saito Lemma 2.3.2. For the complex `[O→O(D)]`, with its canonical section, the total class acting on `[X]` is `[X]+[D]`. Higher supported components vanish. Specializing that lemma to `E=O_D` gives this identity directly; its proof uses deformation to a section of a projective line bundle and the resulting injective support pushforward.

J03 then expands Saito Lemma 2.1.4. For a section s of a rank-n bundle E, the zero-section intersection equals the localized top Chern class of `[O→E]` on the scheme-theoretic zero locus. After reduction to integral X, the zero-section case is handled by self-intersection. Otherwise blow up the ideal generated by the components of s. Factoring out its local generator gives a primitive vector and a line subbundle `L=O(D)⊂E`, with locally free quotient F of rank `n−1`. Both localized Whitney and excess intersection give

`c_(n−1)(F|D)∩[D]`.

Proper compatibility pushes this equality back to the original zero scheme. This argument retains nonreduced multiplicities and uses no resolution of singularities. The example `s=x^m` on A¹ gives `m[0]`. The example `s=(x²,0)` in a trivial rank-two bundle on A² has nonempty zero scheme but zero top class, because the excess line is trivial.

For the application J04, proper flat `f:X→Y`, smooth off `X_y`, has the presentation

`[f*Ω¹_Y/k → Ω¹_X/k]` in degrees `−1,0`.

Flatness makes each nonempty smooth component dominate the curve; generic smoothness makes the line-to-bundle map injective. Its cokernel is `Ω¹_X/Y`. Near y a uniformizer t trivializes `Ω¹_Y/k` and yields the derivative section `d(f*t)`. Changing t rescales this section by a unit, so the refined intersection and isomorphism class of the complex are unchanged. This uses the global localized class and a neighborhood of the entire fiber, not an unsupported assertion that Chow classes glue from arbitrary open patches.

### The cotangent-cycle calculation

J05 isolates the correspondence `T*X ← X×Y T*Y → T*Y`. Its left lci Gysin map has dimension shift `m−n`; its right map is proper on the relevant support. Their composition sends `CH_n(C)` to `CH_m(f∘C)`. Under the dimension bounds it is a map of integral top-dimensional cycle groups. The commutative-square proof of its composition law is retained.

J06 gives Saito's curve-target expansion. Over the properly transversal open V, the zero-section coefficient is minus the degree of the signed fiber pullback. At a missing closed point y, the cotangent-fiber coefficient is the degree over `k(y)` of the intersection with df. The minus sign comes from codimension one in the signed pullback convention. For the tame map `t=x^m` on A¹:

`f![zero_X] = m[zero_Y] + (m−1)[T*_0Y]`.

This is an intersection-theoretic identity, without a sheaf direct-image theorem or a projectivity hypothesis. For a general C, the smooth neighborhood of its base support is used when forming the fiber cotangent intersection. The full signed-transversality supplier proof remains an explicit inherited leaf.

### A global proof using the earlier trace interfaces

J07 makes the virtual Chern calculation explicit. Put `α=f*c1(ΩY)`. Since Y is a smooth curve, `α²=0`. Thus `c(K)=c(ΩX)(1−α)`, and dualization gives the integral identity

`(-1)^n c_n(K) = c_n(TX) − f*c1(TY)·c_(n−1)(TX)`.

J08 obtains the needed smooth proper Euler-class calculation from the already extracted proper trace compatibility C12 and constant-sheaf normalization C14. This identifies the trace of the top tangent Chern class with the Euler rank **in Λ**. It does not infer an integer equality from equality modulo a coefficient characteristic, and it does not need the late characteristic-cycle index theorem.

Let β be the localized class in `CH0(X_y)`, let i include that fiber in X, and let r be the Euler rank of `Rf*Λ` on `Y−{y}`. J02's global-image property, J07 and projection reduce J09 to calculating the image of

`f_*(c_(n−1)(TX)∩[X]) = m[Y]`.

A smooth proper fiber computes the image of m in Λ: its tangent exact sequence has trivial rank-one quotient, and J08 gives r. Consequently, in `H0(Y,K_Y/k)`,

`cl(f_*i_*((-1)^n β)) = cl(f_*(c_n(TX)∩[X])) − r cl(c1(TY)∩[Y])`.

This is exactly the expression in Yang–Zhao (6.8.3). A14 follows by the source's proper trace/fibration calculation. The dependency chain avoids importing the later Saito comparison M16 to prove one of its own earlier ingredients.

The support boundary is testable. Over an algebraically closed field of characteristic 5, take Λ=F3 and `f:A¹→A¹`, `t=x²`. The signed local Chern term is `−[0]`, with nonzero class `−1` in `H0_{0}(A¹,K)=F3`. Its image in `H0(A¹,K)=H²(A¹,F3(1))` is zero. Thus the global identity alone cannot recover the supported equality expected in Remark 6.8. No new claim is made about that conjecture.

### Ownership and remaining work

The complete SchemeAndStackFoundations document and EDC.3 description were read, together with reviewed AUDIT-01 SF.5 and AUDIT-18 EDC.3. SF.5 already owns generic integral Chow, Gysin, Chern, projection and excess constructions. A sixth **source** route supplies the rank-threshold localized-Chern interface and section calculation to that existing layer. EDC.3 keeps the geometric étale realization. The Microlocal continuation imports both and owns the cotangent application. All five prior roadmap IDs remain unchanged.

The complete pinned Mathlib algebraic-cycle file was read. L09 reuses its actual cycle carrier, weighted quasi-compact pushforward and identity lemma. It does not mistake those for Chow groups or a functorial Chow pushforward. Searches of both pinned geometric libraries and the reviewed audits found no localized Chern or refined-intersection construction. Current paper items, pending roadmaps, packets, decompositions and relevant link hits were screened for overlap. Before publication, 555 inputs were verified at `c43ee0b12d70c8c7fdc710b5647c2794e6068729`. The newly added Zavyalov25 trace routes concern rigid mod-p/almost or coherent duality; its introductory scheme duality reuses the same EDC supplier. The later Qian23 update changes completion metadata, with item and route contracts unchanged. Other concurrent AKY22, CHT17, Fu24, Tsuzuki23 and Yuan26 updates introduce no competing localized-Chern construction.

G10 is narrowed, not deleted. The graph construction and its bivariant/Whitney invariance still require their original proofs. G11 now names the SF.5/EDC.3 division of M05 but still requires implementation-level supplier decomposition. The final journal versions, UYZ pencil and Fourier inputs, enhanced geometry, purity, nearby-cycle goodness and other inherited gaps remain open.

### Validation

The paper checker, three-file intake and structural audit pass. The structural audit checks 1,603 assertions, including all preserved IDs/statuses, the two statement corrections, unchanged source issues, resolved dependencies, acyclicity, actual planned stage IDs, route uniqueness and definition APIs/tests. Exact diagnostics pass 20,654 cases for the virtual Chern signs over a square-zero base class, product-family cancellation, derivative degeneracy and finite-coefficient distinctions. These calculations do not prove the geometric supplier theorems. No Lean file is authorized for this paper issue, and none was compiled.

### Historical report from the second checkpoint

The following is preserved from PR #2029. Its counts, routes and reading boundaries describe that checkpoint; the current refinements and totals are above.

## PAPER-YANG-ZHAO-25 — non-acyclicity classes and characteristic-class comparison

Second research checkpoint by Codex, session `codex-c83e7a`, for issue #1218, continuing PR #1963 by `codex-a71f92` on 2026-09-23. This is a paper extraction, not an implementation or a closed blueprint.

### Result and reading boundary

The extraction records 130 interfaces: 8 library items, 10 planned interfaces and 112 missing items, with 272 acyclic dependency edges. Its 47 definitions/constructions carry 141 API entries and 141 mathematical specification tests. Every missing item has exactly one route. Eleven explicit gaps prevent a completion claim.

This continuation reread the entire [arXiv v4](https://arxiv.org/pdf/2209.11086v4), including all proofs and references on pp.1–51, was read. The authors label it their final version but explicitly warn that its numbering differs from the journal. The [journal record](https://link.springer.com/article/10.1007/s00222-025-01319-y) establishes Inventiones 240 (2025), 123–191; the full subscription text was not obtained. Locators below therefore name arXiv v4, not unverified journal pages.

The previous worker read the author's [alternative fibration proof](https://yelmath.github.io/PFF.pdf) visually in full: eleven image pages, printed 31–41. This reading is inherited; the present worker did not repeat it. It replaces the longer difference-of-prisms argument with a nine-diagram identity. The author calls it an alternative proof, not an erratum. The extraction retains both proofs and records their different numbering. The previous worker also read selected Hansen–Scholze, Umezaki–Yang–Zhao and Saito passages; their exact scopes and SHA-256 hashes are in `sourceLedger`. Selected Lu–Zheng and Laumon readings from the immediately preceding Abe audit are reused with their original limited scope.

### What is proved, and what is not

For a Noetherian base and the paper's torsion Noetherian coefficients, the central diagram is Z→X→Y→S. Write U=X\Z, K_X/Y=f!Λ, and K_X/Y/S for the explicit diagonal-transversality defect. Three conditions must not be conflated:

- C1 makes K_Y/S locally constant and gives its specified inverse through diagonal evaluation.
- C2 is the pair H0(Z,K_Z/Y)=H1(Z,K_Z/Y)=0.
- C3 says F is ULA over S and ULA over Y on U.

Under C1 and C3 the tilded non-acyclicity class has coefficients K_X/Y/S. Only with C2 is it transported to the untilded class with coefficients K_X/S. The fibration theorem identifies C_X/S with the diagonal action on the uniquely extended C_X/Y plus the image of this particular supported class. Merely showing that the difference restricts to zero on U does not identify the supported lift: the localization exact sequence need not make that lift unique.

For smooth g:Y→S of relative dimension r, the diagonal action is cap product with c_r(f*Ω_Y/S^∨). This top-Chern factor is not an identity map.

Over a perfect field of characteristic p>0 with finite local coefficients of residue characteristic ℓ≠p, the main local theorem is

`C^{x}_X/Y/k(F) = −dimtot RΦ_x(F,f)`

for separated finite-type f:X→Y to a smooth curve, ULA off the single closed point x. X need not be smooth. Total dimension is the alternating rank-plus-Swan invariant, after the appropriate derived coefficient reduction. The origin skyscraper has Φ=Λ[1], hence total dimension −1 and class +1. This test catches the wrong Fourier/vanishing-cycle sign.

The finite-set formula and cohomological Grothendieck–Ogg–Shafarevich formula follow. Proper pushforward gives the conductor formula without assuming smooth X, flat f or projectivity. For a positive-dimensional bad fiber, its source tilded class need not have an untilded counterpart. The target curve's support-vanishing is what permits the inverse comparison after pushforward.

The final comparison cl(cc_X(F))=C_X/k(F) is proved for **smooth quasi-projective X**. It does not prove the embeddable-singular Conjecture 6.12. The source also leaves the supported Bloch localized-Chern identity and the general non-isolated cotangent/non-acyclicity comparison conjectural. Only their explicitly stated weaker global or finite-support consequences are extracted as theorems.

### Proof decomposition

| Items | Work isolated |
| --- | --- |
| L01–L08, B01–B07 | Existing quasicategory/derived/K0 carriers; actual coefficient, ULA and relative-duality extensions |
| T01–T20 | Exchange morphism, transversality, composition/pullback/pushforward, diagonal purity, defect functor |
| C01–C21 | Correspondences, characteristic classes, support extension, base change, blowup and specialization |
| N01–N15 | Defect coefficient object; the two non-acyclicity classes and their separate functoriality hypotheses |
| S01–S17 | Stable coherent lifts, difference prisms, correspondence cube, both fibration proofs |
| A01–A14 | Fourier deformation, absolute-integral-closure extension, Milnor/GOS/conductor formulas |
| M01–M18 | Positive-characteristic micro-support, characteristic cycles, Chow induction and final comparison |

The original proof constructs a coherent cube by unstraightening the sheaf-valued correspondence functor. Its exchange map is characterized by cocartesian and locally cartesian lifts. Passing to cofibers then preserves the needed higher coherence. The final prism comparison explicitly matches the restriction homotopy β and acyclicity homotopy γ.

The alternative proof gives a reusable lemma in a stable infinity-category: from a nine diagram and three compatible maps out of A, vanishing of Hom(A,K00) and Hom(A,ΣK00) identifies the middle map as the sum of the two unique lifts. In the geometric application, A=Λ and K00=τ*K_Z/Y; C2 supplies exactly those two vanishings. The alternative still needs the coherent exchange cube. Neither proof can be supplied by ordinary triangulated K0 or by arbitrary choices of cones.

The local Milnor proof deforms by the Artin–Schreier kernel, passes to a finite parameter cover with a ULA extension, and compares the 0 and infinity fibers. The latter is supported on the isolated point; local Fourier theory identifies its alternating dimension. The proof needs descent of both the complex and its prescribed identification on the open chart. A nontrivial additive character is not automatically available in every finite local coefficient ring: for example F3 has no nontrivial character into F2×. The new Q01–Q10 give the coefficient extension and descent argument below. The actual local Fourier and modular-to-adic suppliers remain open.

### Coefficient descent without dividing by its degree

The unrestricted choice of an additive character on arXiv v4 p.45 omits a
coefficient step: F2 admits no nontrivial character of the additive group F3.
This is now E8, a proof gap with a proposed repair, awaiting independent review.
It concerns the inspected preprint; the journal passage remains unavailable.

For finite local Λ with p invertible, form R=Λ[T]/(Φp), choose a maximal ideal q,
and put B=R_q. The pinned monic power-basis construction makes R finite free of
rank p−1 over Λ and hence a finite nonzero Artinian ring. If ζ is the image of T,
then ζ^p=1 and

`(ζ−1) Φp′(ζ) = p ζ^(p−1)`.

The right side is a unit, so both factors are units. The standard étale
criterion applies to R. Artinian-localization surjectivity makes B finite over
Λ, and localization preserves flatness. Finite flat local freeness then makes
B a free Λ-module of positive rank. It is étale: localization is formally
étale and finite presentation follows from finiteness over Noetherian Λ.
Reduction modulo the maximal ideal of Λ localizes a separable polynomial
algebra over its residue field; it is the residue field of B. The element ζ
has exact order p, giving ψ(a)=ζ^a. Nilpotents of Λ are retained.

The residue-field criterion for a split injection applies to Λ→B, since its
reduction is the unit inclusion of a field into a nonzero algebra. It supplies
a Λ-linear retraction λ with λ(1)=1. Thus M→M⊗ΛB is split injective for every M.
There is no division by rankΛB. For F2→F4 the rank is zero in F2 and the field
trace kills 1, but the coefficient-of-1 functional in the basis (1,ζ) retracts
the inclusion. Replacing Λ by its residue field would fail: Z/4→F2 loses the
nonzero class 2.

Q02/Q03 are formal coefficient interfaces inside the existing EDS direction.
The geometric consumers separately require the actual six operations in B02;
this formal interface does not construct those operations or import the whole
relative-trace continuation. Finite free scalar extension is exact and strong
symmetric monoidal. After forgetting B, it is a finite sum of the identity,
so the canonical additive derived-operation comparisons can be checked using
a basis. Exceptional pullback follows from its adjunction and dualizability
of the finite free constant coefficient object. The comparisons carry their
units, counits, evaluation and exchange maps. They do not supply arbitrary-base
constructibility or nearby-cycle goodness.

Q04 compares the strict-local maps defining ULA and detects their cones after
faithful tensor. Q05 transports the relative trace as a **B-valued** trace;
it does not multiply by rankΛB. Q06 transports the actual diagonal-defect
triangle and C1/C2. Q07 transports the support factorization through τ* and τ!
in (4.5.3), hence the particular supported non-acyclicity class. Equality after
forgetting support alone would not suffice. Supported cohomology commutes
with this finite free coefficient extension, making its coefficient map
injective. When C2 holds, its comparison also transports the inverse ν used
to define the untilded class.

Q08 compares Ψ=i*Rj* and its specialization cofiber, including inertia. For Q09,
derived residue reduction identifies the new inertia complex with extension
of the old one to the new residue field. Flat field extension preserves
cohomology dimensions and the kernels of all finite matrices (g−1) that define
wild invariants. Consequently the Swan sum and alternating total dimension
are unchanged as integers measured over their respective coefficient fields.
This uses the existing conductor construction; it does not prove its existence.

Run the geometric Fourier argument first with the supplied character over B.
Its Milnor equality is then the image of the desired Λ equality by Q07–Q09;
the injectivity in Q02 proves it over Λ. Q10 expresses this conditional descent
without using the general-coefficient Milnor theorem as a prerequisite. The
remaining local Fourier and modular-to-adic proofs stay in G07, and geometric
suppliers G02/G03/G06 remain open. The character-choice component is resolved
relative to them, rather than declared a recursively closed foundation.

### Finite étale pushforward in the final comparison

This continuation read all of pp.1–5 of Saito's
[proper-pushforward preprint](https://arxiv.org/pdf/1607.03156v1), including
Lemma 2 and its entire proof on pp.3–4. Pages 6–9 were not read. The lemma
proves the stronger finite-on-support characteristic-cycle formula using
the direct-sum decomposition of vanishing cycles on a finite fiber and the
Milnor intersection formula. M17 uses only the finite étale case needed here.

For that case, trivialize the cover étale locally. Direct-image additivity
and étale pullback give the equality of integral characteristic cycles.
Equality of cycles descends; no descent of rational equivalence is asserted.
The cartesian square of zero sections then commutes with proper pushforward
under refined Gysin, yielding

`u_* cc(F′) = cc(Ru_*F′)`.

M18 also imports the existing proper compatibility of the cycle map. For a
finite separable constant-field extension, relative dimension zero gives the
canonical identification of the two base-field dualizing conventions without
a twist or shift.

This completes the specific missing pushforward input to the E6 repair:
σ*σ*F=F⊗σ*Λ, whose rank-d local system need not be constant. Rank twisting and
proper pushforward give d times the desired difference in Λ-cohomology. The
geometric extension in M14 has degree invertible in Λ, so that degree can be
cancelled **there**. No cancellation occurs in integral Chow groups. This
geometric field extension must be distinguished from Q01's coefficient
extension, whose degree can be divisible by ℓ.

A harmless slip in Saito's inspected preprint is E9: the sentence preceding
(8) on p.3 identifies the base of singular support with the support of X;
it should be the support of F. The zero complex on nonempty X verifies the
distinction. Conjecture 1 and Lemma 2 already state the correct support.
The page image was checked. The author bibliography and arXiv history showed
no correction for this paper; its journal text was not compared. This finding
has no independent-review verdict and does not affect M17.

### Ownership and library evidence

The pinned commits remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All eight cited library declarations were read in those source trees in this continuation. The four additions are `AdjoinRoot.powerBasis'`, `IsArtinianRing.localization_surjective`, `Module.free_of_flat_of_isLocalRing`, and `IsLocalRing.split_injective_iff_lTensor_residueField_injective`; exact source paths and statement ranges are recorded in the JSON. Mathlib supplies the quasicategory horn-filling predicate and ordinary derived localization. Tau Ceti supplies generic triangulated K0, its triangle relation and shift signs. None constructs a stable infinity-category, étale ULA complex or non-acyclicity class.

Reviewed AUDIT-22 establishes the missing stable/enhanced machinery in EnhancedDerivedSheaves. AUDIT-18 distinguishes partial ordinary inputs from the absent ctf/support/Gysin/cycle/trace constructions. AUDIT-19 does not turn ordinary trait nearby cycles into a general-base Fourier theorem. Full upstream GrothendieckEulerForms and CharacterTheory documents were read in earlier programme work, with the original worker provenance retained. This pass read the complete current EnhancedDerivedSheaves and EtaleDualityAndPerverseSheaves documents, the LPV scope and LPV.0–3 prefix, and the relevant reviewed coverage entries. A partial upstream reread is not counted as a new full reading. Existing carriers are imported.

There are five routes:

1. **EnhancedDerivedSheaves** receives the generic cofiber-lifting, difference-square and nine-diagram constructions inside E0/E1/E3/E5:abstract.
2. **EtaleDualityAndPerverseSheaves** receives only the already scoped field support, semipurity, ordinary Chow/Gysin and smooth-center blowup interfaces.
3. **EtaleDualityAndPerverseSheavesPartIIRelativeTraces** reuses the pending ID from PAPER-ABE-25. It extends that relative-trace prefix with generalized transversality, the supported defect and coherent fibration/Milnor/conductor proofs.
4. **LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier** also reuses the Abe proposal: the shared exponential deformation and ULA extension are built once.
5. **EtaleDualityAndPerverseSheavesPartIIMicrolocal** reuses the Shende–Tsimerman proposal. Its brief already requires a separately sourced positive-characteristic branch. This extraction supplies that branch's Saito comparison target, not a deduction from complex conormal topology.

Pending proposals are **missing**, not accepted planned stages. No guessed stage IDs or retired suppliers are used.

The item-level dependency graph is important: early ULA/transversality and independent microlocal definitions precede Fourier/Milnor; the final Saito comparison is later. The weak localized-Chern conductor comparison consumes the early Chern construction, not the late Saito theorem. Replacing these prefix contracts by mutually dependent whole-roadmap imports would introduce a false cycle.

### Source issues and independent checks

The seven inherited version-specific findings and two new entries are recorded in `sourceIssues`, without independent-review verdicts:

| Finding | Locator in arXiv v4 | Disposition |
| --- | --- | --- |
| E1 | p.8, §2.3(3) | δ!G must remain δ!G in the description of the left vertical arrow; the printed Λ is a slip |
| E2 | p.16, §3.6 | A correspondence from G to F uses D(G), not D(F), in both tensor descriptions |
| E3 | p.21, Lemma 3.14 proof | The evaluation description omits the G factor and uses the wrong relative dualizing base |
| E4 | p.27, Proposition 4.14 | The target vanishing uses Y, not undefined Y'; spell out the target inverse comparison |
| E5 | p.28, Proposition 4.15 | The composable base map is e0 f', not f'e0 |
| E6 | p.50, Theorem 6.13 proof | A finite étale pushforward is not generally a constant direct sum |
| E7 | p.15, Lemma 3.2 | The specialization F=Λ requires Λ to lie in the ULA domain |

The previous worker checked E1–E6 against page images. E7 follows from the stated domain and was checked in the continuous text reading. The coefficient-rank convention for nonlocal rings is also made explicit, rather than silently treated as a single integer.

For E6, take k=F2, k'=F4 and Λ=F3. Frobenius on σ*Λ swaps two basis vectors; on Λ² it is identity. Their traces are 0 and 2, and their invariant spaces have dimensions 1 and 2. The printed sheaf isomorphism is therefore false. The needed class equality is repairable: projection gives F⊗σ*Λ, cohomological classes obey the rank-twist lemma, and characteristic cycles obey rank twisting by étale-local trivialization and additivity. Division by the degree occurs after applying cl into Λ-cohomology, not in the integral Chow group. This corrects a proof step; it is not evidence against the final theorem.

The inherited correction search covered the journal page, arXiv history, current and older author pages, the complete alternative proof, and title searches with correction/erratum. This continuation checked the journal landing page, arXiv history, current author page and title correction searches again, without representing the alternative proof as reread. No matching correction was found. “New” records that search outcome only; the full journal-version comparison is still open. Nothing was sent to authors.

### Why this remains partial

The full main text is read, but source closure is not achieved. The highest-value next step is obtaining the final Umezaki–Yang–Zhao journal statements. Its inspected arXiv v4 good-pencil lemma assumes projectivity, and its Chow induction proposition requires smooth properly transversal fibers on the divisor of the rational differential. Those exact conditions must be reconciled with the quasi-projective reduction cited in Yang–Zhao's final proof. No disagreement between versions is invented and no false-theorem claim is made from the older preprint alone.

Other remaining leaves include the actual enhanced correspondence realization, purity domains, Hansen–Scholze's full extension proof, Ψ-goodness, local Fourier and modular-to-adic comparison, Beilinson/Saito existence and integrality, and Bloch's localized Chern construction. The JSON gaps identify their consuming items. Some foundational interfaces must still be expanded against supplier blueprint nodes; this checkpoint does not claim every generic six-operation leaf has been decomposed.

### Validation

The paper checker, three-file intake check and custom structural audit passed. A separate exact diagnostic passed 159 finite algebra cases: cyclotomic identities over several finite coefficient rings, additive-character multiplication, a retraction F4→F2 with trace(1)=0, failure of Z/4 residue reduction to detect equality, scalar-extension invariants and the skyscraper sign. These examples do not prove the general sheaf theorems. The 141 specification tests are not Lean results. No suggested Lean file is part of this paper issue's authorized deliverables, and no Lean compilation or formalization is claimed.

Ownership and overlap inputs: 495 files verified at `4d7a180e18ac9704c1ad1f36a943f6bea6c658f1`. All five existing route IDs are retained. All eleven gap IDs remain, with the character-choice and finite étale pushforward portions narrowed as described above.
