# PAPER-DADDEZIO-23: Parabolicity conjecture of F-isocrystals

Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*, [Annals of Mathematics 198 (2023), no. 2, 619–656](https://doi.org/10.4007/annals.2023.198.2.3); arXiv [2012.12879](https://arxiv.org/abs/2012.12879).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #1097). Status: **complete**. Every missing item is routed once.

Confirmed red-team fixes by Codex, session `codex-J6LwjP`, 2 October 2026 (issue #5499). The prior extraction review is historical; these changes await independent fix review.

The machine-readable extraction is [PAPER-DADDEZIO-23.result.json](PAPER-DADDEZIO-23.result.json). It has:
- 74 items: 7 planned, 67 missing;
- 7 routes:
  - one new Part II;
  - three coalesced Part IIs: minimal slopes, crystalline companions and the shared arithmetic-D-module Crew prefix (designs pending);
  - three sources of existing layers;
- 17 prerequisite entries;
- 16 source issues: 13 misprints, 2 errors and 1 gap, with new E15/E16 scoped only to arXiv v4.

After the independent review (REV-PAPER-DADDEZIO-23, research/blueprint/reviews/REV-PAPER-DADDEZIO-23.md) the extraction has 70 items (7 planned, 63 missing) and 14 recorded mistakes, all confirmed. The review corrected it in place:
- **Route 1** adds RD.5, the first stage downstream of RD.1, RD.2 and RD.3. It owns Kedlaya's full faithfulness, docility and semistable reduction.
- **Route 3** moves from AnalyticNumberTheory AN.4, which is number-field only, to FunctionFieldArithmetic FA.5. Item 18 is restated for the curve case the paper uses.
- **Route 6's brief** states the final theorems with their hypotheses.
- **Items.** Remark 3.1.7 is no longer an item. Frobenius semisimplicity for abelian varieties over finite fields (item 71) is added. Twenty items gain statement, planned or note fixes.
- **Five new findings (E10–E14)**, among them an error in the statement of Lemma 4.4.7 that affects nothing (E13).

The accepted supplier proposals remain the owners. The current routes below separate the new adapters and comparisons from their existing foundations; no new roadmap id is introduced by the fix.

## Sources read

- **arXiv v4** (8 February 2023, "final version, to appear in Annals of Mathematics"), read in full: 30 pages. Item locators are v4's pages.
  - v4 was posted two days after acceptance (6 February 2023).
  - The original worker did not obtain the published PDF; it was also not acquired or collated for this fix. All new source issues concern v4 only.
- **Fix reading:** [v4](https://arxiv.org/pdf/2012.12879v4), §2.2 p. 6, §3 pp. 7–11, pp. 19,24,27, with page images 6,10,19; [Abe v3](https://arxiv.org/pdf/1310.0528v3), §§2.4.15–2.4.20 pp. 86–88 and §§4.2.1–4.2.2 pp. 103–104. Full hashes and dates are in `sourceVersions`. This was a targeted rereading, not a full recursive proof audit.
- **Bounded correction search, 2 October 2026:** arXiv still ends at v4; the [Annals page](https://annals.math.princeton.edu/2023/198-2/p03), [author publication list](https://daddezio.pages.math.cnrs.fr/papers.html), title-specific searches and Crossref update/relation fields revealed no relevant correction. No author corrigendum is claimed.
- **Page images:** the original mistakes were checked on v4 images; the two new passages were likewise inspected on images 6,10,19. The published pagination was not collated.

## What the paper proves

**Main theorem (Theorem 4.4.12 = 1.1.1).**
- Setting: X smooth and geometrically connected over a perfect field, η a perfect point, and M† an overconvergent F^n-isocrystal with constant slopes.
- Crew's monodromy group G(M, η) is the subgroup of G(M†, η) stabilising the slope filtration of M_η.
- If M† is semisimple, G(M, η) is parabolic. This answers Crew's question of 1992.

**The key theorem (Theorem 4.1.3 = 1.2.2).** For N ⊆ M with M †-extendable, the †-hull N̄ (the smallest overconvergent subobject containing N) has S_1(N̄) = S_1(N).
- **Curves** (§4.2):
  - reduce to A^1 by Kedlaya's étale covers;
  - prove the statement at the generic point E (Proposition 4.2.2), using the dual description of the hull (Lemma 4.2.4) and de Jong's reverse slope filtration;
  - pass back from the generic point (Proposition 4.2.12) through integral models of the overconvergent rings.
- **Higher dimension** (§4.4): a new Lefschetz theorem (Theorem 4.4.3). For docile M† there is a curve C with ⟨M†⟩ ≃ ⟨M†|_C⟩.
  - It sharpens Abe–Esnault's full faithfulness to an equivalence, by extending rank-one objects through Lemmas 4.4.5–4.4.7 and a Bertini theorem.
  - Its proof uses the curve case, so the two proofs are intertwined, as the author notes.
- **From MS to parabolicity** (§§3, 4.3):
  - Chevalley's theorem and Saavedra's P_G(λ) give parabolicity for F^∞-monodromy (Proposition 4.3.2).
  - Isocrystals with a punctual Q_p^ur-lattice transfer this to Crew's groups: Propositions 3.2.8 and 3.3.2, Corollary 4.3.6.

**Applications (§5).**
- Semisimplicity of Gr^S R^1f_crys for abelian schemes over finite fields (Theorem 5.1.6).
- Finiteness of A(E^sep)[p^∞] under Albert-type hypotheses (Theorem 5.2.2).
- Kedlaya's conjecture (Corollary 5.3.1), and multiplicity one by minimal-slope Hecke eigenvalues via Abe's correspondence (Theorem 5.3.3).
- The PBS filtration (Corollary 5.4.2) and minimal †-compactifications (Corollary 5.4.4).

## What the atlas already has

**Planned (7 items).**
- PadicDifferentialEquationsAndRigidCohomology:
  - ordinary overconvergent/convergent coefficients and Frobenius structures (RD.3); crystalline comparison and F∞ additions are now separately missing /72 and /73. Full-faithfulness results remain separately located source inputs in their proven range;
  - (φ, ∇)-modules at the generic point (RD.1).
- Dieudonné–Manin: VectorBundlesAndIsocrystals VB0. Mathlib has the rank-one classification.
- Tannaka groups: MotivesAndAlgebraicCycles MC.6.
- Parabolic subgroups, tori and centralisers: Tau Ceti ReductiveGroups Layer 7.
- Weights of abelian varieties: WeightsInEtaleCohomology R34.2.

## Routes

The order here matches the machine-readable result.

| Route | Owner | Missing items and boundary |
|---|---|---|
| 1 | PadicDifferentialEquationsAndRigidCohomology RD.1–RD.3, RD.5 | 9: the eight existing foundations and new /72 crystalline model/Frobenius-bearing convergent comparison at RD.3, importing CR.3. Ordinary coefficient categories stay with the parent. |
| 2 | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 | 2: crystalline Dieudonné and de Jong full faithfulness; retain the existing CR.3 input request. |
| 3 | FunctionFieldArithmetic FA.5 | 1: curve Chebotarev with constant-field degree restrictions. |
| 4 | GlobalShtukasPartIICrystallineCompanions | 2: /19 imports Abe's **finite-order** theorem; /74 adds degree-character normalization and untwisting for the general /68 consumer. |
| 5 | PadicDifferentialEquationsPartIIMinimalSlope | 13: the curve MS/†-hull theory, with the earlier E5 gap and Tsuzuki alternative retained. It imports no higher-dimensional DAD layer back. |
| 6 | PadicDifferentialEquationsPartIIMonodromyGroups | 39: additional convergent/perfect-point/punctual groups, new early /73 F∞ construction, Λ, exact squares and correctly typed base change/intersection, higher-dimensional MS, Lefschetz, parabolicity and applications. |
| 7 | PadicDifferentialEquationsPartIIArithmeticDModules | 1: /75 coalesces with Abe's already-promised overconvergent Crew/Weil prefix and adds the scoped coefficient/fibre and object-generated quotient comparison. |

The new monodromy Part II retains its existing id/title/parent/area. Abe's arithmetic-D-module and crystalline-companion proposals and Tsuzuki's minimal-slope proposal likewise retain their identities. A shared early Crew prefix has one owner; the full D-module roadmap does not depend on the full DAD roadmap. The Bessel consumer imports basic overconvergent groups from this shared prefix, then any additional DAD comparisons or parabolicity results it needs.

The following is the **proposed prefix order**, not a claim that these are live atlas edges:

```mermaid
flowchart LR
  RD[RD.3 coefficient categories] --> Crew[Shared Crew prefix /75: arithmetic D-modules]
  MC[MC.6 reconstruction] --> Crew
  RD --> Cr[/72 crystalline comparison]
  CR[CR.3 crystalline input] --> Cr
  Cr --> Inf[/73 coherent F-infinity]
  Crew --> Geo[/33 additional DAD groups]
  Cr --> Geo
  Inf --> Lambda[Lambda /37]
  Lambda --> Exact[Exact square /41]
  Geo --> Exact
  Exact --> Base[/42 fibre comparison over K Omega]
  Base --> Inter[/50 common-field intersection]
  Inter --> Para[DAD parabolicity]
  Curve[Curve MS supplier] --> Para
  Crew --> D[Later arithmetic D-modules]
  D --> Abe[Abe finite-order theorem /19]
  Abe --> Twist[Degree-character adapter /74]
  FA[FA.4 degree and reciprocity] --> Twist
  Twist --> App[General cuspidal application /68]
  Para --> App
  Crew --> Bessel[Bessel overconvergent monodromy]
```

The previous review's CR.3→RD.3, CR.3→R07.2 and VB0→RD.3 requests are retained as requests. They are not silently declared implemented. /72 needs the early crystalline/Frobenius input, not the later crystalline duality successor.

## Corrected interfaces

**Finite-order theorem and general twisting adapter (/19, /74, /68).** Abe's Theorem 4.2.2 has finite-order central character on the automorphic side and finite-order determinant on the isocrystal side. Retain that theorem. For a general smooth central character use FA.4's idele class/degree theory: its degree-zero restriction has finite image, so write `χ_π=χ_fin·a^deg`. Choose `c^r=a^(-1)` and set `π_0=π⊗(χ_c∘det)`, with `χ_c=c^deg`. Apply Abe to π_0 and recover `E_π=E_{π_0}⊗κ_c^(-1)`.

The new constant line κ_c must have Abe Frobenius `c^d` at a degree-d point. Abe §4.2.1 defines this Frobenius as the **inverse** of the linearized geometric operator, so κ_c has q-linearized operator `c^(-1)`, where q=p^s. Its local Hecke valuation shift is `d·v_p(c)`; its conventional p-Newton slope shift is `−v_p(c)/s`. The adapter must prove the convention comparison with the DAD slope API rather than identify these oppositely signed quantities. Tensoring with a line shifts all slopes by the same amount and carries the minimal-slope subobject through the tensor equivalence. Tests check degrees 1,2,3, central exponent r, inverse twisting and normalization-choice independence through finite-order twist compatibility. Rank one with `χ_p=p^deg` is the infinite-order test: normalize to 1 and recover κ_p with degree-d Frobenius p^d. /68 remains a theorem for **all** cuspidal representations.

**Crystalline comparison and F∞ carrier (/1, /72, /73).** Item /1 now marks only covered ordinary coefficient categories as planned at RD.3. /72 imports the crystalline site/crystal data and Frobenius from CR.3 and separately plans the cited F^n-crystalline/convergent equivalence; it does not assert convergence of every bare crystal or overconvergence. Its supporting Kedlaya theorem remains a stated prerequisite.

For /73 index positive integers by divisibility. At n|nm the transition keeps M and replaces Φ with `Φ^(m)`, using `Φ^(m)=Φ∘(F^n)^*(Φ^(m−1))`. Include pullback-composition identifications, identity/composition coherence for `n→nm→nml`, eventual morphisms at common multiples and their witness-independent composition, exact tensor/dual structure and the faithful forgetful functor. The transition is not assumed full: eigenvalues 1 and −1 acquire a new intertwiner after squaring. At n=2,m=2 the correct iteration uses F²-pullback and has source F⁴; the printed F-pullback cannot compose. For geometrically connected X record `End(1)=⋃_n K(k)^{σ^n}`; with the chosen F̄_p⊂k of §3 this is Q_p^ur, not its completion K(k). This prefix precedes Λ (/37), observability and the exact square (/41). Positive powers preserve normalized slopes.

**Specified fibre field (/33, /35, /41, /42, /50).** Keep the category scalar extension over `K=K(k)`. The group from `ω_η:⟨M⟩→Vec_{K(Ω)}` is over K(Ω). Supply the tensor identification `V_M⊗_{Q_p^ur}K(Ω)≅ω_η(M)` and derive `G(M,η)≅G(M,V_M,η)⊗K(Ω)`. A descended K(k)-form is a separately named object. Extend the whole exact/cartesian square to K(Ω) and put both factors of /50 in the same `GL_{K(Ω)}(ω_η M)`; the intersection is a closed-subgroup fibre product there. The strict test uses `k=F̄_p`, `Ω=overline{k(t)}` and unit M: the trivial group's coordinate field is K(Ω), which cannot be identified with K(k). The categorical equivalence and parabolicity theorem remain. /51 and E8 now use the same ambient field.

**Shared overconvergent Crew prefix (/75).** Accepted PAPER-ABE-18/25 already assigns `π_1^isoc=Aut^⊗(ω)` and its Weil form to the arithmetic-D-module Part II. Import that construction on the overlap. Compare only specified common overconvergent realizations, after choosing a common coefficient field L and a tensor fibre isomorphism β. If necessary an algebraic closure of K(Ω) can receive the Abe algebraic coefficient field through a chosen compatible embedding. Prove the relevant coefficient/base comparison, not an equivalence of all categories over arbitrary perfect bases. Restriction to ⟨M†⟩ gives the object-generated monodromy quotient, compatible with base change and β; a different β conjugates the embedding. The unit quotient is trivial even if the full fundamental group is not. Weight-2 representation of G_m tests the quotient z↦z². Extra convergent, perfect-point, punctual and parabolicity work remains in DAD; generic reconstruction stays at MC.6.

## Source issues (`sourceIssues` E1–E16)

**E5 (gap, the proof of Proposition 4.2.12, p. 17).**
- The proof asserts that, "since Q_{W,n} is compact", inf{‖f_n(m)‖ : m ∈ Q_{W,n} ∖ pQ_{W,n}} = p^{−s_n} > 0. It deduces that the p^∞-torsion of P_W/f(Q_{W,n}) is killed by p^{s_n}.
- **Counterexample.** For the trivial rank-one module, Q_{W,n} = A_n and P_W = W⟨u⟩, and:
  - the element ū_n^j = p^j u^{nj} is not in pA_n, but has norm p^{−j};
  - so the infimum is 0, and W⟨u⟩/A_n has unbounded p^∞-torsion.
- **Consequence.** Lemma 4.2.11 does not apply, and the injectivity needed for the proposition requires another argument.
- **What survives.** Theorem 4.2.13, the only consumer, is proved independently by Tsuzuki [Tsu23, Prop. 6.1]. The main theorems are unaffected.

**Misprints (affect nothing).**
- E1: Isoc†(X)_F is called a subcategory of itself.
- E2: Lemma 3.1.3's proof writes ω_x, V and K for ω_η, V_M and K(Ω).
- E3: Theorem 4.2.6(i) has the index S_{m−i}/S_{m−i−1}. It should be S_{m+1−i}/S_{m−i}, as Lemma 4.2.7 uses.
- E4: Theorem 4.2.6(ii) writes M† for M†_alg.
- E6: "a simple normal divisor of D" should read "a simple normal crossing divisor D".
- E7: §4.4.10 takes Z ⊆ TX ×_X D′_S. The divisor D_S lies in Y, so it should be TY ×_Y D′_S, applied to each component.
- E8: the proof of Theorem 4.4.12 calls G(M, η) normal in G(M†, η). The normality used is that of G(M†, η) in the arithmetic group. The fix additionally changes its group-level scalar field to K(Ω), as in E16; the original independent normality verdict is preserved.
- E9: in Corollary 5.4.4, the identification M′_1 ≃ M′_2 carries ι to −ι.

The original review added E10–E14; their records and verdicts remain in the JSON. They include E13's corrected prime-order cyclic scope for Lemma 4.4.7. The new entries have no self-authored review:

- **E15 (misprint, affects nothing), v4 p. 6:** replace `F^*(Φ^(m−1))` in the power recursion by `(F^n)^*(Φ^(m−1))`. The n=2,m=2 source/target mismatch and the corrected coherence tests are in /73.
- **E16 (error in stated group identities), v4 pp. 10,19:** the specified Ω-valued group comparison and intersection need K(Ω). Keep K(k) in the category equivalence. The source issue includes the strict-extension unit counterexample and propagates the correction to E8's scalar field on p. 24. No error is asserted against the uninspected published text, and no withdrawal of the categorical equivalence or parabolicity theorem is proposed.

## Prerequisites not yet covered

Seventeen entries:
- Crew (Ann. ÉNS 1992);
- Kedlaya: full faithfulness (2004), semistable reduction I (2007) and IV (2011), étale covers (JAG 2005), notes on isocrystals (JNT 2022);
- Tsuzuki (Invent. 2023);
- Abe–Esnault (Ann. ÉNS 2019);
- de Jong (Invent. 1998);
- Abe (JAMS 2018);
- D'Addezio (Selecta 2020), Ambrosi–D'Addezio (Alg. Geom. 2022), D'Addezio–Esnault (IMRN 2022);
- Saavedra (LNM 265);
- Étesse (Ann. ÉNS 2002);
- Berthelot–Breen–Messing (LNM 930);
- Drinfeld (Moscow Math. J. 2012).

Every DOI was checked against Crossref.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-DADDEZIO-23.result.json` reports no errors.
- Every planned and route stage id exists in `data/atlas.json`.
- Both Mathlib citations were found in the pinned index at Mathlib 082e2d3.


## Fix validation and limitations

Paper validation, intake checks for the three deliverables, shared source-issue/version validation and whitespace checks pass. Exact regression models check the Frobenius recursion and transition coherence, eventual rank-one morphisms, central twist/degree/eigenvalue/slope arithmetic, strict coefficient-field typing, object-generated quotient and prefix dependency order. They check finite models and planning contracts, not the full analytic, crystalline, Tannakian or automorphic proofs. All 67 missing items are routed once; /1 stays planned; item /38 stays removed and /71 stays present. The original source-issue verdicts are preserved, including E8's normality verdict.

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed FA.4/FA.5 audits were read; no reviewed RD.3/CR.3/MC.6 entries were present, which is not an absence certificate. Actual pinned `WittVector.Isocrystal`, its rank-one classification and `TauCeti.Tannaka.fgPointTensorIsoEquiv` were read. The latter reconstructs points of a commutative Hopf algebra from finite-comodule tensor automorphisms; it does not by itself construct these isocrystal categories or prove their comparison. Existing foundations are reused; no library-complete claim is added.

Only the three issue deliverables are changed. No Lean file is required for this job; no suitable existing compiled build at the pins was available, so no Lean compilation was run. The downstream design must prove each new interface before importing it. See [the fixes report](../redteam/RT-PAPER-DADDEZIO-23.fixes.md) for the per-finding handoff and reproducible finite checks.
