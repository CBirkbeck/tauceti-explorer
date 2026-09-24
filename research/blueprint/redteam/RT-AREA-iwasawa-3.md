# RT-AREA-iwasawa-3

Worker: Codex — codex-hjdg0j. Issue: [#1499](https://github.com/CBirkbeck/tauceti-explorer/issues/1499). Read date: 2026-09-24. Snapshot: `7c9bbba2668f6108bd9e65fae6731e3e9bd7f210`.

Eight findings, five high and three medium, are specified in the [machine-readable report](RT-AREA-iwasawa-3.result.json). They concern accepted decomposition contracts and one explicit construction omitted from a native roadmap. This report does not modify those contracts. The independent verifier should check each finding against the named public source and the stated negative or positive test.

## Scope and independence

The worker did not author or review the focal native roadmaps or the two decompositions attacked here. Earlier verification of red teams concerning the Coleman/Kato library audits and the p-adic-regulator restructuring, the Binyamini errata review, and the Liu et al. extraction continuation are disclosed as context. Those deliverables are not attacked. In particular, finding 5 is against Kato’s integrated decomposition, not the BT26 route, which already specifies the correct twist. Binyamini’s extraction remains under a revise verdict, so its proposed route is not treated as an accepted addition.

Complete means that the assigned area audit and its reading inventory are complete, not that every source theorem or every proof leaf in the six roadmaps has been independently proved. Native source routes that explicitly report unread proofs remain such routes. The investigation prioritized exact contracts in the accepted decompositions, cross-roadmap ownership, and the formal-period interface. No Lean theorem has been added or compiled.

## Findings

### RT-AREA-iwasawa-3/1 — Separate the Kuga–Sato model from the CM-product model

**High; error.** `data/decompositions/GeneralizedHeegnerCycles.json; GeneralizedHeegnerCycles:GH.0/the-variety-X-r-and-its-smooth-proper-model; its GH.1 consumer link`

The contract attributes a smooth proper model of the CM product X_r=W_r×A^r over Spec Z[1/N] to Conrad’s appendix, and makes p∤N alone ensure its good reduction. A is specified only over H. The appendix constructs the Kuga–Sato factor; the CM factor requires its own field of definition and good model. The technical local comparison assumptions have disappeared.

Evidence: BDP, §3.2, printed p.1067 (PDF p.35), assumption (1): “finite unramified extension of Q_p”; assumption (2) requires models of C and X_r over O_F. The application specifies p∤cNd_K. Appendix opening, pp.1139–1140 (PDF pp.107–108), constructs compactifications of universal elliptic-curve fibre powers; §1.5, p.1054, separately chooses a good integral model of A. [BDP PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf). The introductory sentence on p.1035 really does contain the stronger wording quoted by the decomposition; its quotation is not fabricated, but it does not discharge the technical hypotheses. For r≥1, ramified quadratic twisting of A at a previously good prime away from N preserves CM and its H-definition while destroying good reduction; H¹(A) is a summand of H¹(X_r).

Correction and regression checks: In GH.0 distinguish W_r over Z[1/N] from its product with A over a field defining A. Construct the product model after base change and verification that A extends to an elliptic scheme. For the BDP §3.2 comparison export the finite unramified F, models over O_F, and the stated p∤cNd_K application; carry those data into GH.1 and the source/review annotations. Do not claim that unramifiedness is necessary for every possible Bloch–Kato containment theorem. Add a negative test rejecting p∤N as a sufficient certificate for arbitrary CM twists, and a positive product-model test with good reduction supplied.

### RT-AREA-iwasawa-3/2 — Reverse the duality twist when reversing the isomorphism

**High; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system, statement step (iii), hypothesis 3 and proof step 3`

The node says T_pE=H_p(1), then identifies Sym^(k−2)(T_pE) with Sym^(k−2)(H_p)(2−k). It has reversed the sides of the source identity without reversing the twist. Its composite has twist 4−k−r instead of the declared k−r.

Evidence: Kato §8.4, printed p.182 (PDF p.67), (8.4.1)–(8.4.3): “T_pE ≅ H_p¹(1)”; the next displayed isomorphism places Sym^(k−2)(H_p¹) on the left and Sym^(k−2)(T_pE)(2−k) on the right. The displayed composite passes from the Tate-module symmetric power with twist 2−r to the H_p¹ symmetric power with twist k−r. [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Substituting k=4,r=1 into the node gives −1 instead of 3.

Correction and regression checks: Use Sym^(k−2)(T_pE)≅Sym^(k−2)(H_p)(k−2), or retain Kato’s original orientation with 2−k on the Tate-module side. Correct all three occurrences and the associated review note. Make acceptance compute 2−r+(k−2)=k−r, with both k=2 and k=4 tests; weight two alone masks the error.

### RT-AREA-iwasawa-3/3 — Restore the linear Euler-factor scalars

**High; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations; KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements; equivariance-to-norm link reason`

Both Euler operators omit the scalar on their linear Hecke term. The norm relation lacks ell^(−r); the reciprocity formula lacks p^(−r). The quadratic coefficients are present, so this is not a uniform rescaling of the operator.

Evidence: Kato Prop.8.7(2), printed p.184 (PDF p.69), and Thm.9.5, p.188 (PDF p.73), display “ell^(−r)” and “p^(−r)” respectively multiplying T′ times diag(1/ell,1)* or diag(1/p,1)*. These factors occur in both the two-term and three-term cases. The page images, rather than the defective text extraction, were checked. [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). At k=2,r=1 the missing multiplier is 1/ell (respectively 1/p), already nontrivial.

Correction and regression checks: Replace the linear term by −T′(ell) diag(1/ell,1)* ell^(−r) in both norm cases and by −T′(p) diag(1/p,1)* p^(−r) in the two nontrivial reciprocity cases. Correct the link’s displayed operator and proof/acceptance/review annotations. Retain the quadratic exponent k−1−2r and the trivial factor when p divides M. Test all prime-divisibility cases and r=1; use Lemma 8.8’s declared normalization, without silently redefining T′.

### RT-AREA-iwasawa-3/4 — Use filtration steps as dual-exponential targets

**High; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system and the reciprocity node’s acceptance item 3`

The modular-form target is repeatedly called an associated graded piece in every degree 1≤i≤k−1. It is a filtration step. Interior associated graded pieces vanish because consecutive filtration steps agree. The node also weakens the upper vanishing endpoint from i≥k to i>k.

Evidence: Kato (9.2.2), printed p.187 (PDF p.72), states “D_dR^i(V)=0” for i≥k and identifies D_dR^i(V) with M_k(X)⊗Q_p for 1≤i≤k−1; §9.2 explicitly defines a descending filtration. Section 9.4, p.188, uses F⁰D_dR(V(i))=F^iD_dR(V), not gr^i. [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). If k>2 and 1≤i<k−1 then gr^i=F^i/F^(i+1)=0, which cannot be identified with nonzero M_k(X).

Correction and regression checks: Use filtration-step terminology and types throughout the dual-exponential node and its reciprocity acceptance. Set the endpoint to i≥k. Keep the target exp*:H¹(Q_p,V(i))→F⁰D_dR(V(i))≅F^iD_dR(V)≅M_k(X)⊗Q_p. Add an interior-degree test distinguishing F^i from gr^i and a test at i=k; update the review annotations consistently.

### RT-AREA-iwasawa-3/5 — Twist the Iwasawa class by k−r before specialization

**High; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values, statement composite`

The interpolation composite starts from Iwasawa cohomology of the untwisted V_f but multiplies by compatible roots of unity to power −r after specialization. Kato’s theorem first twists the Iwasawa class by k−r. Thus the node feeds exp* a different representation; a finite-level root alone does not implement the required twist of Q_p representations.

Evidence: Kato Thm.12.5(1), printed p.221 (PDF p.106), has first arrow “H¹(V_f) ≅ H¹(V_f(k−r))”, followed by specialization/localization and exp*. The parenthetical immediately below specifies the compatible roots to tensor power k−r. The display was read visually. [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). For weight k=2 and r=1 the required local representation is V_f(1), whereas the node prescribes V_f(−1).

Correction and regression checks: State the twisting isomorphism on Iwasawa cohomology first, with exponent k−r, then specialize to level n and localize at p before exp*. Record the induced cyclotomic twist of the Iwasawa action. Keep the correctly recorded dual form f*, p-imprimitive value, F-rational gamma and sign rule. Add a k=2,r=1 target-type test and correct the associated source/review annotation.

### RT-AREA-iwasawa-3/6 — Repair the local duality and limit variance

**Medium; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology, proof steps 3–4`

The proof replaces inertia-cohomology invariants by residue-field H¹, then loses a Pontryagin dual and reverses a direct limit. The quoted cohomological-dimension argument therefore does not prove the asserted vanishing of an inverse limit of undualized H¹ groups.

Evidence: Kato Lemma8.5 proof, printed p.184 (PDF p.69), first displays “H⁰(Gal(K_v^ur/K_v),H¹(K_v^ur,T))” as the cokernel. It identifies this with the dual of H¹(F_v,H⁰(K_v^ur,T^∨(1))). The following display factors through the dual of the DIRECT limit of those H¹ groups over F_v(zeta_(p^n)). [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). The node instead writes H¹(Gal(...),H¹(I_v,T)), a dual of H⁰, and an inverse limit without duals.

Correction and regression checks: Replace proof steps 3–4 by the invariants group, its stated local-duality identification, and the dual of the direct limit under restriction; corestriction on the original inverse system must correspond to these restriction maps. Apply p-cohomological dimension zero to the direct limit over the residue-field union. Preserve the theorem statement and test the variance of each transition map, rather than treating lim← and lim→ interchangeably.

### RT-AREA-iwasawa-3/7 — Use pushforward in the theta-divisor argument

**Medium; error.** `data/decompositions/KatoEulerSystems.json; KatoEulerSystems:L0/theta-function-c-normalised, proof step 2`

The existence proof says multiplication-by-a pullback fixes the divisor D=c²[0]−E[c]. It is pushforward that fixes D. Pullback creates additional torsion support, so the planned proof contains a false divisor identity.

Evidence: Kato §1.10, printed p.124 (PDF p.9), uses “a_*” on Pic(E) of degree zero and the image of the divisor under multiplication by a. [Kato PDF](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Over an algebraically closed characteristic-zero field, with c=5,a=2, [2]*D=25E[2]−E[10] as a pullback. A nonzero 2-torsion point has coefficient 24 there and coefficient 0 in D. In contrast [2]_*D=D, since [2] permutes E[5].

Correction and regression checks: Change a^* to divisor pushforward a_* in proof step 2 and explain its compatibility with [a] under Pic⁰(E)≅E. Then [a]x=x and a=2 imply x=0, as required by the existing proof. Tie this to div(N_a f)=a_*div(f). Add the c=5,a=2 pullback countercheck so a future implementation does not introduce the false lemma.

### RT-AREA-iwasawa-3/8 — Localize the formal-period algebra at the Tate symbol

**Medium; missing.** `content/campaign/PeriodsAndSpecialValues/README.md, PS.2; research/blueprint/atlas/roadmaps/PeriodsAndSpecialValues.json, PS.2 (and corresponding stage text); supplier boundary MotivesAndAlgebraicCycles:MC.5–MC.6`

PS.2 lists the effective integration-symbol relations and product but omits localization at the Tate period before comparison with the full Nori tensor-isomorphism torsor. Merely representing 2πi, the current acceptance test, does not supply an inverse or extend evaluation across the localization.

Evidence: Huber–Müller-Stach, arXiv:1105.0865v5, Definition0.1 and Theorem0.2, p.2: “The space of formal periods is the localization P of P+”. The element inverted is the symbol of (G_m,{1},dX/X,S¹); the torsor theorem concerns Spec(P). [Huber–Müller-Stach PDF](https://arxiv.org/pdf/1105.0865v5). MC.4 plans categorical Tate stabilization; MC.5–MC.6 plan Nori tensor/duality and the torsor, but none explicitly supplies this algebra localization. Full pinned-tree searches found no Nori formal-period algebra. Mathlib IsLocalization.Away.lift and TauCeti.Tannaka.fgPointTensorIsoEquiv were read: they provide general infrastructure, not this integration-symbol construction.

Correction and regression checks: PS.2 owns P_eff, its distinguished Tate symbol L, P=P_eff[L⁻¹], and evaluation extending through L↦2πi≠0. Reuse Mathlib localization and import the MC.5–MC.6 category/torsor rather than re-planning them. Make the comparison use P, or explicitly prove the equivalent unit property if choosing a presentation with Tate inverses already built in. Test L·L⁻¹=1, evaluation of the inverse, and the rank-one Tate torsor Q[t,t⁻¹]. This finding does not assert that 1/π is not an effective numerical period.

## Boundaries checked without an additional finding

- Coleman’s analytic primitive/continuation work is distinguished from the arithmetic regulator. The L0 input to Dirichlet L3 and the later Dirichlet L3 input to Coleman L3 are different stages; they do not themselves form a cycle.
- The Heegner-cycle roadmap already distinguishes ordinary/nonordinary source hypotheses, height formulas from squared p-adic Abel–Jacobi formulas, and rational from integral classes. Existing gaps for unread higher-weight formulas remain visible.
- Modular symbols own the single-form homology and signed-period interfaces; general critical-slope/family infrastructure belongs to PadicFamilies. Accepted RS-08 and RS-14 boundaries prevent treating these supplier/consumer appearances as duplicate constructions.
- NE.0 imports the completed-group-algebra carrier and adds its Lie-group/module-theoretic inputs. The ProfiniteProPGroups overlap recommendation already explains the specialized versus general coefficient comparison. Generic Ore localization is present in Mathlib, whereas the canonical Iwasawa Ore set and its hypotheses are additional mathematics. No new duplicate finding is needed for that distinction.
- Noncommutative K₁, reduced norms, relative K-groups and leading-term descent are not replaced by scalar units or ordinary specialization in the native contract. The new Ritter–Weiss reference exists, but this audit checked only its metadata/abstract and does not certify its proof or upgrade the roadmap’s source-access status.
- PS.1’s analytic imports, PS.4’s determinant supplier and PS.6’s conditional BSD interface were checked after the accepted overlays. MC.6→PS.2 already exists: finding 8 is a missing construction inside PS.2, not a missing edge or a request to duplicate Nori motives.

## Reading ledger

- All six focal roadmap documents and all 41 stage descriptions: ColemanIntegration, GeneralizedHeegnerCycles, KatoEulerSystems, ModularSymbolsPadicLFunctions, NoncommutativeAndEquivariantIwasawa, PeriodsAndSpecialValues. No focal blueprint packet was present. Both integrated decompositions: all 28 node contracts (statements, hypotheses, proof steps, acceptance), all 21 links, 14 coverage records and 13 explicit gaps; source excerpts selectively checked as identified in the report.

- All 163 reviewed coverage targets for the focal stages in data/library-coverage.json, including evidence and duplication notes; these are comparison inputs, not a re-review of this worker’s own earlier audit verifications.

- Other area parts: full stage titles and descriptions for AutomorphicCongruences, AutomorphicPadicLFunctions, EulerSystemsAndKolyvaginSystems, GrossZagierAndArithmeticHeights, HeegnerPointEulerSystems, ModularIwasawaMainConjectures, RankZeroOneBSD, SelmerIwasawaCohomology, ColemanPowerSeries, DirichletPadicLFunctions, EulerSystemsCyclotomicMainConjecture, IntegralIwasawaTheory, LocallyAnalyticDistributions, PadicHodgeRegulators, PadicMeasuresIwasawaAlgebras, SpecialValuesBirchTate. Also MC.4–MC.6 in MotivesAndAlgebraicCycles for the period-algebra supplier boundary.

- Focal records in RS-04, RS-06, RS-07, RS-08, RS-11, RS-13, RS-14, RS-16, RS-26 and RS-30; integrated and proposed links were distinguished. Relevant items in touching GeneralAlgebraicKTheory, GrossZagierAndArithmeticHeights and EulerSystemsCyclotomicMainConjecture decompositions were read.

- Eight focal paper routes across BINYAMINI22, BCGP21, BT26, CDT25, FU24, LIU-ETAL22 and NAKAMURA23, together with review status. Binyamini’s revise-status route and the worker’s prior Liu/errata and RT-AUDIT-23/25/RS-26 reviews are context only; none is attacked here.

- Seven actual touching link-map files (ModularCurves, EllipticCurves, ClassFieldTheory, AlgebraicCurves, AdicSpaces, LocalFieldsRamification, ProfiniteProPGroups): seven links and two overlap recommendations. Other string matches were examined-roadmap catalog entries. Built the assembled atlas with scripts.build.assemble(require_distances=False): 2608 stages, 69 focal stages including decomposition nodes, 239 touching edges; screened focal supplier/consumer edges after accepted restructuring overlays.

- Pinned library inventory and blob hashes reverified: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 (8482 Lean files), TauCeti f790474821cf4256814db967cb154e7af3d0c369 (5477 Lean files). Whole-tree name and semantic searches; actual declarations read in Mathlib RingTheory/Localization/Away/Basic.lean, RingTheory/OreLocalization/Ring.lean, RingTheory/Perfectoid/BDeRham.lean and TauCeti Geometry/Hodge/Tate/Twist.lean, Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean. These are infrastructure, not completed arithmetic comparison theorems.

- Public primary sources accessed 2026-09-24: BDP published PDF pp.1034–1035,1054,1067,1139–1140; Kato 2004 printed pp.124,182–189,221,272 (key formulas checked on rendered pages); Huber–Müller-Stach arXiv:1105.0865v5 pp.2–3; Ritter–Weiss arXiv:2608.22601 metadata/abstract only. Source versions, hashes and limits are recorded in the report.

The graph assembly is a read-only interface check. It is not a proof that the full atlas is acyclic; no finding in this report relies on interpreting every stage edge as an unconditional dependency on the whole of another stage.

## Reproducible source register

All sources below were obtained publicly on 2026-09-24. BDP and Kato file hashes match the source files registered in their decompositions. PDF page numbers count from one, including Kato’s cover page. Mathematical displays were checked visually when OCR lost exponents, stars or arrows.

| Source | Exact public version | SHA-256 | Pages used |
|---|---|---|---|
| BDP | [Published Duke PDF](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf) | `223bfdad6571c211a1b3e11c4688f2831f06a642eafef7c3552c9506a7188fbc` | printed 1034–1035,1054,1067,1139–1140 |
| Kato | [Astérisque 295 (2004), 117–290](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` | printed 124,182–189,221,272 |
| Huber–Müller-Stach | [arXiv:1105.0865v5](https://arxiv.org/pdf/1105.0865v5) | `e55d85bf168c4eedb79949c37d648ea5c071af50d18a2c7ccc316d460e96c563` | 2–3; Definition 0.1, Theorem 0.2 |
| Ritter–Weiss | [arXiv:2608.22601](https://arxiv.org/abs/2608.22601) | metadata only | abstract/version identity, no proof claim |

Finding 1 preserves the distinction between a verbatim introductory quotation and a theorem usable under the full local hypotheses. No erratum is claimed to have been found, and no broader correction to the published BDP paper is asserted here. The failure of the unrestricted CM-twist contract is the audit’s mathematical inference, not a quotation from BDP.

The library searches covered every verified Lean file, first by target names and then by period/comparison, Tannakian, Tate-twist and localization interfaces. Names such as `IwasawaStructure` (a group-simplicity criterion), periodic integrals, and the Lean eliminator parameter `motive` were discarded as false positives. Absence claims are limited to the needed concrete formal-period construction, not its general algebraic infrastructure.

Relevant pinned statements read:

- [IsLocalization.Away.mul_invSelf, algebraMap_isUnit, lift and lift_eq](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean): construct and evaluate a localization once a ring, distinguished element and its invertible image have been supplied. They do not select the Tate period or prove the Nori comparison.
- [OreLocalization.universalHom and universalHom_unique](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/OreLocalization/Ring.lean): the general Ore localization universal property, with an OreSet instance and denominator images in units. This is reusable infrastructure for NE.1.
- [BDeRhamPlus and BDeRham](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean): ring constructions from completion/localization, not the filtered comparison for modular-curve cohomology or Kato’s exp*.
- [HodgeStructureOn.tateTwist and tateTwist_F](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Tate/Twist.lean): an abstract pure-Hodge-structure filtration shift, not a Galois-representation realization theorem.
- [TauCeti.Tannaka.fgPointTensorIsoEquiv](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean): a commutative Hopf algebra’s points over a coefficient algebra are equivalent to tensor automorphisms of finite-comodule scalar extension. Constructing the Nori category and its integration-symbol period algebra is still additional work.

## Validation

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-iwasawa-3.result.json` passed. `python3 research/blueprint/intake.py check-files` on both deliverables reported two files and zero problems. A fresh-main check found all 180 tracked inputs unchanged. Only the two authorized report files are submitted. Lean compilation is not applicable to this red-team report.
