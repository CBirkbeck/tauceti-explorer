# PAPER-YANG-ZHAO-25 — non-acyclicity classes and characteristic-class comparison

Second research checkpoint by Codex, session `codex-c83e7a`, for issue #1218, continuing PR #1963 by `codex-a71f92` on 2026-09-23. This is a paper extraction, not an implementation or a closed blueprint.

## Result and reading boundary

The extraction records 130 interfaces: 8 library items, 10 planned interfaces and 112 missing items, with 272 acyclic dependency edges. Its 47 definitions/constructions carry 141 API entries and 141 mathematical specification tests. Every missing item has exactly one route. Eleven explicit gaps prevent a completion claim.

This continuation reread the entire [arXiv v4](https://arxiv.org/pdf/2209.11086v4), including all proofs and references on pp.1–51, was read. The authors label it their final version but explicitly warn that its numbering differs from the journal. The [journal record](https://link.springer.com/article/10.1007/s00222-025-01319-y) establishes Inventiones 240 (2025), 123–191; the full subscription text was not obtained. Locators below therefore name arXiv v4, not unverified journal pages.

The previous worker read the author's [alternative fibration proof](https://yelmath.github.io/PFF.pdf) visually in full: eleven image pages, printed 31–41. This reading is inherited; the present worker did not repeat it. It replaces the longer difference-of-prisms argument with a nine-diagram identity. The author calls it an alternative proof, not an erratum. The extraction retains both proofs and records their different numbering. The previous worker also read selected Hansen–Scholze, Umezaki–Yang–Zhao and Saito passages; their exact scopes and SHA-256 hashes are in `sourceLedger`. Selected Lu–Zheng and Laumon readings from the immediately preceding Abe audit are reused with their original limited scope.

## What is proved, and what is not

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

## Proof decomposition

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

## Coefficient descent without dividing by its degree

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

## Finite étale pushforward in the final comparison

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

## Ownership and library evidence

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

## Source issues and independent checks

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

## Why this remains partial

The full main text is read, but source closure is not achieved. The highest-value next step is obtaining the final Umezaki–Yang–Zhao journal statements. Its inspected arXiv v4 good-pencil lemma assumes projectivity, and its Chow induction proposition requires smooth properly transversal fibers on the divisor of the rational differential. Those exact conditions must be reconciled with the quasi-projective reduction cited in Yang–Zhao's final proof. No disagreement between versions is invented and no false-theorem claim is made from the older preprint alone.

Other remaining leaves include the actual enhanced correspondence realization, purity domains, Hansen–Scholze's full extension proof, Ψ-goodness, local Fourier and modular-to-adic comparison, Beilinson/Saito existence and integrality, and Bloch's localized Chern construction. The JSON gaps identify their consuming items. Some foundational interfaces must still be expanded against supplier blueprint nodes; this checkpoint does not claim every generic six-operation leaf has been decomposed.

## Validation

The paper checker, three-file intake check and custom structural audit passed. A separate exact diagnostic passed 159 finite algebra cases: cyclotomic identities over several finite coefficient rings, additive-character multiplication, a retraction F4→F2 with trace(1)=0, failure of Z/4 residue reduction to detect equality, scalar-extension invariants and the skyscraper sign. These examples do not prove the general sheaf theorems. The 141 specification tests are not Lean results. No suggested Lean file is part of this paper issue's authorized deliverables, and no Lean compilation or formalization is claimed.

Ownership and overlap inputs: 495 files verified at `4d7a180e18ac9704c1ad1f36a943f6bea6c658f1`. All five existing route IDs are retained. All eleven gap IDs remain, with the character-choice and finite étale pushforward portions narrowed as described above.
