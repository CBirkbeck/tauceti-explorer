# RT-PAPER-BHARGAVA-GROSS-WANG-17

Complete red-team audit of `PAPER-BHARGAVA-GROSS-WANG-17`, for #4282. Worker: **Codex — codex-rtOQ9t**. Four high-severity findings; two inherited source errors and two extraction errors. The extraction and its accepted review were performed by different workers, recorded below.

## Evidence and scope

- Independent worker Codex — codex-rtOQ9t. Confirmed claim on #4282 after bot reply. Read extraction #1436 and review #1437 histories: Claude cc-fb70e5 submitted extraction PR #1918; Claude cc-7b31c4 submitted review PR #2403. This worker did neither. Audited accepted tree 3b996d5, both extraction files, both accepted review files, all 56 items, all five source issues with review dispositions, all six routes and all 16 prerequisite records.

- Read all 43 pages of the author-hosted published JAMS 30 (2017), 451–493 article at https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf, accessed 2026-10-01; SHA-256 1e553de8d3bafb12a5cb7efccea0eaab0fca14532cb8312bdfe48299be2d0db4. The earlier extraction/review reported publisher access blocked; this author-hosted published text was accessible. Read the introduction, §§2–12, Dokchitser–Dokchitser Appendix A and references. Checked published page images 453, 467 and 479 for decisive statements/formulas.

- Downloaded the exact extraction source https://arxiv.org/pdf/1310.7692v2 (42 pages; SHA-256 8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2), and compared the decisive passages on pp. 2–3, 13, 15–17 and 27 with the published text. The arXiv record still lists v2 as latest. Bounded searches on 2026-10-01 for the title/authors/DOI 10.1090/jams/863 with correction/erratum found no official correction. This does not establish that no private or unpublished correction exists.

- Rechecked cover targets and coefficient groups, rational-torsion edge cases, the obstruction diagram and square-class domain, and the integral ideal construction. Independently derived the Selmer exactness counterexample; exact symbolic checks confirm the duplication polynomials, the even quartic change of variables and its discriminant, and the Proposition 26 quartic discriminant. No numerical rank or Sha assumption is used. Existing E1–E5 and the accepted Kummer-status correction are not resubmitted. Reading the earlier numerical/Gram-matrix evidence is not claimed as rerunning it.

- Read TauCeti.kummerClassMap, ker_kummerMap and kummerClassMap_injective in TauCeti/FieldTheory/GaloisCohomology/Kummer.lean at f790474821cf4256814db967cb154e7af3d0c369. Read groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units and H1ofAutOnUnitsUnique in Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean at 082e2d37e8b0463410cdb532e111cd43d5a66174. The former proves the field-unit Kummer injection, while the latter has a finite-dimensional extension hypothesis; item 21 correctly remains planned. Read the pinned WeierstrassCurve.Affine.selmerGroup₂, range_μ_le_selmerGroup₂, card_range_μ and pow_rank_le_card_of_range_μ_le: these are elliptic explicit square-class descent, not the general-Jacobian geometric two-cover and 4-Selmer fibre assertions attacked here. Targeted searches in both pinned Lean trees found no matching hyperelliptic/generalized-Jacobian two-cover implementation.

- Read reviewed coverage for ST.0, ST.1, ST.2, ST.4, RP.1, RP.3, SF.3 and R11.4. Read all twelve routed/planned stage descriptions and applicable restructurings in the assembled atlas: ST.0/1/2/4, RP.1/3, SF.3, R11.1/4, A3, IG.2 and upstream ProfiniteCohomology Layer 9. Generic Selmer/descent and Picard/Jacobian carriers are imports; the source-specific orbit parametrization belongs to ST.1 and counting to ST.2/ST.4. Checked the related Bhargava–Shankar–Wang extraction’s orbit/counting routes for shared ownership. No new owner or duplicate carrier is proposed by this audit. This is not a full audit of all sixteen cited supplier papers or of those upstream roadmaps.

- Programmatic structural checks passed: 56 unique item IDs = 0 library + 6 planned + 50 missing; every missing item is routed exactly once; all route item IDs and all twelve planned/source stage IDs resolve. Mathematical completeness does not follow from these structural checks. No Lean file is a deliverable for this red-team issue; no Lean compiler, cache download, build or language server was run.

## Findings

### 1. The extraction applies classification by the fibre Y[2] in H¹(Q,J[2]) to a two-cover Y → I of an arbitrary J-torsor I

**High; error.** `research/blueprint/papers/PAPER-BHARGAVA-GROSS-WANG-17.result.json; items[id=PAPER-BHARGAVA-GROSS-WANG-17/3].statement; HeightsRationalPointsAndObstructions:RP.1/RP.3 source route`

The extraction applies classification by the fibre Y[2] in H¹(Q,J[2]) to a two-cover Y → I of an arbitrary J-torsor I. The source restricts this classification to I = J. An arbitrary torsor has no distinguished origin over which to take this fibre, and can have a nonzero obstruction to admitting a two-cover at all.

**Evidence.** Bhargava–Gross–Wang, JAMS 30 (2017), p. 452, §1 (https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf#page=2; read 2026-10-01), first defines covers of general I, then explicitly takes π:Y → J and the “fiber over the origin”. ArXiv:1310.7692v2, p. 2, makes the same restriction. For general I, the Kummer sequence gives δ[I] ∈ H²(Q,J[2]); a cover Y → I requires 2[Y] = [I], equivalently δ[I] = 0. If a reference two-cover exists, twisting gives a simply transitive H¹(Q,J[2])-action on its isomorphism classes, not a canonical pointed identification without that choice. Even when I has rational points, replacing the chosen origin i by i+b changes the fibre class by the Kummer class of b. The source’s analogous generalized-Jacobian obstruction is stated explicitly in Theorem 25, p. 467. This is an extraction error, not an error in the source definition.

**Repair.** Keep the definition of a two-cover for arbitrary I, but restrict the sentence defining Y[2] and its canonical H¹-class to covers of J, with Y[2] = π⁻¹(0). State the general-I existence obstruction and classification by twisting after choosing a reference cover separately. Preserve the locally soluble version as an empty set or a torsor for Sel₂(J), with no distinguished zero in the nonempty unpointed case. Update item 3 and the report/source route to retain this distinction.

### 2. The unconditional identification of Sel₂(J¹) with the fibre of Sel₄(J) → Sel₂(J) over W[2] is false when rational 2-torsion causes the coefficient-inclusion map to have a kernel

**High; error.** `research/blueprint/papers/PAPER-BHARGAVA-GROSS-WANG-17.result.json; items[id=PAPER-BHARGAVA-GROSS-WANG-17/5].statement; HeightsRationalPointsAndObstructions:RP.1/RP.3 source route; sourceIssues`

The unconditional identification of Sel₂(J¹) with the fibre of Sel₄(J) → Sel₂(J) over W[2] is false when rational 2-torsion causes the coefficient-inclusion map to have a kernel. This is inherited from both the published introduction and arXiv v2, and is not among E1–E5.

**Evidence.** The paragraph defining Sel₂(J¹), published p. 453 (https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf#page=3; page image checked), and arXiv v2, pp. 2–3, identifies these sets without a rational-torsion hypothesis. Take C = E:y²=x³−x over Q with its rational Weierstrass point O and degree-two hyperelliptic class d=2O. Then J¹≅E, W[2]=0 and Sel₂(J¹)≅Sel₂(E). The exact sequence 0→E[2]→E[4]→E[2]→0 gives ker(ι:Sel₂(E)→Sel₄(E))=δ₂(E(Q)[2])≅E(Q)[2]/2E(Q)[4]. Here E(Q)[2] has order four and E has no rational point of exact order four: x(2P)=(x²+1)²/(4x(x²−1)); setting x(2P)=0,1,−1 gives respectively (x²+1)²=0, (x²−2x−1)²=0, (x²+2x−1)²=0, none with rational roots. Exactness with the local Kummer conditions gives ker(Sel₄(E)→Sel₂(E))=im ι. Thus this fibre has |Sel₂(E)|/4 elements, whereas Sel₂(J¹) has |Sel₂(E)|. This is within the even-degree family too: x=2u/(1−u), y=v/(1−u)² gives v²=−2u(u−1)(u+1)(3u−1), a separable quartic with discriminant 16384. No rank or Sha computation is needed. The report gives the local exactness argument. Published §8, pp. 473–476, only needs the valid equivalence of nonemptiness with lifting W[2].

**Repair.** Keep Sel₂(J¹) defined as locally soluble two-covers, and keep its empty-or-Sel₂(J)-torsor property. Replace the unconditional fibre identification by the composition map to the fibre, which forgets the specified intermediate two-cover J¹→J. Explain its quotient by automorphisms of that intermediate cover; on a nonempty Sel₂(J)-torsor the subgroup is δ₂(J(Q)[2])≅J(Q)[2]/2J(Q)[4]. Alternatively state the bijection only under the sufficient hypothesis J(Q)[2]=0, retaining the nonemptiness equivalence in general. Add a source issue with the explicit counterexample and both version locators, update item 5 and the report/source route, and distinguish this correction from the density-one statistical conclusions: the paper already isolates the locus J(Q)[2]=0 via Hilbert irreducibility.

### 3. The extracted Proposition 26 allows every a∈K, but puts f₀g(a) into the multiplicative square-class group K×/K×²

**High; error.** `research/blueprint/papers/PAPER-BHARGAVA-GROSS-WANG-17.result.json; items[id=PAPER-BHARGAVA-GROSS-WANG-17/29].statement (Proposition 26); ArithmeticStatistics:ST.1 source route; sourceIssues`

The extracted Proposition 26 allows every a∈K, but puts f₀g(a) into the multiplicative square-class group K×/K×². It omits g(a)≠0. At a rational branch point the asserted class does not exist and the proof divides by zero. The same missing hypothesis occurs in the published statement and arXiv v2.

**Evidence.** Published Proposition 26, p. 467 (https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf#page=17; page image checked), says “For any a ∈ K”; its proof on p. 468 uses α=f₀g(a) and the cocycle σ√α/√α. ArXiv v2, pp. 16–17, agrees. Take K=Q, f₀=1, g(t)=t(t−1)(t−2)(t−3), and a=0. The quartic has nonzero discriminant 144 and nonzero leading coefficient, so satisfies the surrounding hypotheses, but f₀g(0)=0 is not an element of Q× and √α=0. This is not fixed by treating the trivial multiplicative square class as zero: its representative is 1, not the field element 0.

**Repair.** State Proposition 26 for a∈K with g(a)≠0 (equivalently a−β∈L×); retain the full H¹(K,J_m⊔J_m¹) carrier and the connecting maps used by Theorem 25. Add a source issue and update item 29/report/route. When describing the proof of Theorem 25, choose such an a for infinite K. Do not silently assume an arbitrary finite K has a nonbranch rational a: handle finite K separately using H²(K,J_m[2])=0, since char K≠2 and finite fields have prime-to-characteristic cohomological dimension one, so both obstruction classes vanish. This repairs the auxiliary proposition without narrowing Theorem 25’s field scope.

### 4. The explicit ideal in the integral-orbit construction uses I_f(n−3−m/2), but the source has I_f((n−3−m)/2)

**High; error.** `research/blueprint/papers/PAPER-BHARGAVA-GROSS-WANG-17.result.json; items[id=PAPER-BHARGAVA-GROSS-WANG-17/39].statement; ArithmeticStatistics:ST.1 source route`

The explicit ideal in the integral-orbit construction uses I_f(n−3−m/2), but the source has I_f((n−3−m)/2). With even n and odd m the extracted index is a half-integer, whereas the intended index is integral. This changes the ideal construction rather than merely its presentation.

**Evidence.** Published proof of Proposition 34, p. 479 (https://www.math.uwaterloo.ca/~x46wang/Papers/hyper.pdf#page=29; displayed fraction checked on the page image), and arXiv v2, p. 27, put all of n−3−m above the denominator 2 in I_D=⟨f₀^(2m)R(f₀θ),P(f₀θ)I_f((n−3−m)/2)⟩. The squared-ideal calculation on the same published page uses I_f(n−3−m), confirming the index. For n=4 and m=1, already an allowed genus-one case, the intended term is I_f(0)=R_f but the extraction requests I_f(1/2), outside the integral-index family defined on p. 477. E4 and E5 concern other errors and do not repair this transcription.

**Repair.** Replace I_f(n−3−m/2) with I_f((n−3−m)/2) in item 39 and any repeated formula in the report or design brief. Preserve the source’s branch assumption that R(f₀x) is integral for this displayed construction, with the subsequent divisor-reduction induction used otherwise. Check the square expansion gives I_f(n−3−m) and the genus-one m=1 specialization gives R_f. This is an extraction correction; do not add it to the paper’s errata.

## Why the Selmer counterexample works

Write `ι` for the map induced by `E[2] ↪ E[4]`, and `m₂` for the map induced by multiplication by two from `E[4]` to `E[2]`. These are different coefficient maps. The beginning of their cohomology sequence gives

```text
E(Q)[4] --[2]--> E(Q)[2] --δ₂--> H¹(Q,E[2]) --ι--> H¹(Q,E[4]) --m₂--> H¹(Q,E[2]).
```

The connecting class `δ₂(T)` is the ordinary Kummer class of the rational two-torsion point `T`: its halves are four-torsion. It is locally a Kummer class everywhere, so this entire kernel belongs to `Sel₂(E)`.

Exactness also restricts at the middle Selmer term. If `d ∈ Sel₄(E)` and `m₂(d)=0`, choose `c ∈ H¹(Q,E[2])` with `ι(c)=d`. Locally write `d_v=δ₄(P_v)`. Then `δ₂(P_v)=0`, so `P_v=2Q_v` for a local rational point `Q_v`. Thus

```text
ι_v(c_v − δ₂(Q_v)) = δ₄(P_v) − δ₄(2Q_v) = 0.
```

The remaining local kernel is `δ₂(E(Q_v)[2])`, also a local Kummer image. Therefore `c` satisfies every 2-Selmer local condition. Conversely inclusion sends local Kummer classes to local Kummer classes. This proves `ker(m₂|Sel₄)=im(ι|Sel₂)`.

For `y²=x³−x`, the four rational two-torsion points are `O,(0,0),(1,0),(−1,0)`. The duplication equations in finding 2 show no nonzero such point has a rational half, so `δ₂(E(Q)[2])` has order four. Selmer finiteness now yields the factor-of-four discrepancy without computing the Mordell–Weil rank or the Tate–Shafarevich group.

Geometrically, composition with the fixed two-cover `J¹ → J` forgets the identification of the intermediate cover. Its automorphisms are translations by rational `J[2]`. A nonempty `Sel₂(J¹)` is a torsor for `Sel₂(J)`, but the fibre after forgetting this identification is its quotient by the indicated Kummer subgroup. Keeping the intermediate identification, or adding a hypothesis that this subgroup vanishes, is essential. The paper’s nonemptiness criterion survives this correction.

## Handoff and limits

The fixer should change the extraction JSON and human report and propagate the precise hypotheses through their existing source routes. Findings 2 and 3 additionally need new `sourceIssues` entries with the published and arXiv locators. Findings 1 and 4 are transcription/scope errors of the extraction and do not belong in the paper’s errata. The auxiliary finite-field repair in finding 3 preserves Theorem 25’s scope; it does not assume there is an unused rational branch coordinate over every finite field.

Existing E1–E5 remain separate. In particular, the accepted review already downgraded the Kummer isomorphism to planned; the pinned files confirm that correction. No upstream roadmap edit, second Selmer carrier or new roadmap is requested.

Validation: `scripts/check_redteam.py`, the intake allowed-file check, and `git diff --cached --check`. No Lean compilation is applicable to these two report deliverables.
