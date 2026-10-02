# FIX-RT-PAPER-DADDEZIO-23

Codex — codex-J6LwjP, 2 October 2026. Refs #5499.

All four findings confirmed by the independent RT review are addressed in the paper result and its reader. This report hands the new interfaces to the existing owners; it does not claim their proofs or implementations are complete. No blueprint packet for these additions is a deliverable of this job, so the paper routes carry their API, tests and dependencies for the future design jobs. No atlas base files or other papers are edited.

## 1. General cuspidal application versus finite-order Abe theorem

Item /19 now states the finite-order central-character/determinant restriction of [Abe v3, Theorem 4.2.2, p. 104](https://arxiv.org/pdf/1310.0528v3). Item /68 retains the general cuspidal application. New missing item /74 belongs to the existing `GlobalShtukasPartIICrystallineCompanions` route, after the finite-order theorem; the old assertion that this route adds no target is removed.

The adapter imports FA.4's function-field reciprocity and idele-degree theory. A smooth central character has finite image on the compact degree-zero subgroup. Write it as a finite-order character times `a^deg`, choose `c^r=a^(-1)`, twist the rank-r representation by `c^deg` composed with the determinant, apply Abe, and untwist the resulting isocrystal by the inverse constant line. The constant-line construction includes its coefficient field, Frobenius, tensor inverse, irreducibility and unramified compatibility. Different choices require finite-order twist compatibility, rather than an unsupported canonical root.

The source convention matters: Abe §4.2.1, p. 103 defines his Frobenius as the inverse of the linearized geometric operator. The constant line κ_c has Abe Frobenius `c^d` at degree d and q-linearized operator `c^(-1)`, q=p^s. The respective shifts are `d·v_p(c)` for Hecke eigenvalues and `−v_p(c)/s` for conventional p-Newton slopes. The API explicitly requires comparison with DAD's slope convention. Tensoring with the line shifts every slope equally and transports the minimal-slope subobject, so the general application is not weakened to finite-order representations. Tests include an infinite-order rank-one degree character, inverse twisting, degree normalization, central exponent r, and independence of normalization through finite-order twist compatibility. This is an adapter to the accepted correspondence, not a second correspondence.

## 2. Covered coefficient foundations, crystalline comparison and F∞

Item /1 remains planned at RD.3 only for ordinary coefficient categories and their F^n structures. New /72 imports the crystalline site/crystal foundations from CR.3 and plans the specific F^n-crystalline/convergent comparison at the RD.3 owner. The cited Kedlaya comparison remains a stated prerequisite: its proof was not re-audited, and the plan does not assert convergence of every bare crystal or overconvergence.

New /73 is an early monodromy Part II prefix, before Λ (/37) and the exact square (/41). Its carrier is the coherent category indexed by positive integers ordered by divisibility. The transition n→nm keeps M and uses

`Φ^(m)=Φ ∘ (F^n)^*(Φ^(m−1))`.

Its API includes canonical pullback identifications, identity and composition coherence, eventual morphisms at common multiples, independence of witnesses, exact tensor and dual operations and the faithful forgetful functor. Transitions are not claimed full: scalar eigenvalues 1 and −1 acquire an intertwiner after squaring. The scalar convention is `End(1)=⋃_n K(k)^{σ^n}`; for the geometrically connected setting with the chosen algebraic closure of the prime field this is Q_p^ur, not its completion K(k). Positive powers preserve slopes normalized by n. CR.3 input here is the early crystalline/Frobenius input, not later duality.

New source issue E15 records the localized v4 p. 6 misprint: the printed F-pullback must be F^n-pullback. At n=2,m=2 the former gives F³M→FM, which cannot compose with Φ:F²M→M; the latter gives F⁴M→F²M. This correction preserves the intended construction and downstream results.

## 3. Specified Ω-valued fibre functor and common ambient field

Items /33, /35, /41, /42, /50 and /51 consistently distinguish the category coefficient field K(k) from the group coefficient field K(Ω). The category scalar-extension equivalence keeps K(k). The group associated with ω_η has coefficients K(Ω), and its comparison now requires a tensor identification `V_M⊗K(Ω)≅ω_η(M)`. A descended K(k)-form, if needed, must be named separately and then extended.

The whole exact/cartesian square is extended to K(Ω), with its kernel comparison, before taking the closed-subgroup intersection inside the single ambient `GL_{K(Ω)}(ω_η M)`. Tests require both embeddings and their compatibility; they are not merely an equality of unnamed abstract groups. The strict-extension test takes k=F̄_p, Ω=overline{k(t)} and the unit object. Its trivial Ω-fibre group has coordinate algebra K(Ω), not K(k); an isomorphism as K(k)-algebras would force this strict extension to be trivial. Reduction of the valuation rings detects the different residue fields. The categorical equivalence and the parabolicity theorem remain in the plan.

New E16 records only the inspected arXiv v4 identities in Proposition 3.3.2, p. 10 and Corollary 4.3.6, p. 19. E8's existing normality correction on p. 24 is propagated to K(Ω). Its original independent review object is unchanged: that verdict concerns the normality correction, not a fresh independent verification of this added field correction.

## 4. One shared Crew owner and bounded comparisons

New /75 and route 7 reuse the owner and route metadata of accepted PAPER-ABE-18/25: `PadicDifferentialEquationsPartIIArithmeticDModules`. Its basic overconvergent fundamental/Weil-group construction is imported once. The added interface compares specified common realizations after choosing a common coefficient field L and tensor fibre isomorphism β. An algebraic closure of K(Ω) can receive the algebraic Abe coefficient field through an explicitly chosen compatible embedding. The plan does not identify all isocrystal categories over arbitrary perfect bases.

Restriction to the tensor category generated by M† gives the object-generated quotient; this must be compatible with coefficient extension and β. Changing β conjugates the embedding. The unit gives a trivial quotient even when the full fundamental group is not trivial. A weight-two G_m representation tests the nonidentity quotient z↦z². Extra convergent, perfect-point, punctual Q_p^ur and parabolicity work stays in DAD; generic reconstruction stays at MC.6. Item /33 and route 6 now import the shared construction on the overlap and remove the no-prior-owner claim. The Bessel consumer imports the shared prefix, then only the additional DAD comparisons it needs.

The prefix must be scheduled after RD.3, MC.6 and the necessary coefficient/fibre foundations, but before later arithmetic D-modules, Abe and DAD applications. The reader gives this as a proposed order, not an assertion that live atlas edges already implement it. No reverse import of the whole D-module roadmap from the whole DAD roadmap is added.

## Source inspection and library reuse

Targeted reading used the exact [D'Addezio arXiv v4 PDF](https://arxiv.org/pdf/2012.12879v4), SHA-256 `f92379bec97564edc2b89f86f6bfc5c271abdc31c5d17cb9ba93b58e204a07a8`, and [Abe arXiv v3 PDF](https://arxiv.org/pdf/1310.0528v3), SHA-256 `b890ef139fd51ce395bf1e373cdeaa1312dbcb95f76d56eff495f96df8c8dd29`. DAD pp. 6–11,19,24,27 and Abe pp. 86–88,103–104 supplied the definitions, conventions and statements. DAD page images 6,10,19 were inspected in addition to extracted text. These are targeted readings, not a new full proof audit of either paper or all their prerequisites.

The bounded correction search on 2 October 2026 checked arXiv version histories, the [Annals article page](https://annals.math.princeton.edu/2023/198-2/p03), the [author's publication page](https://daddezio.pages.math.cnrs.fr/papers.html), title-specific erratum/corrigendum searches and the Crossref record of DOI 10.4007/annals.2023.198.2.3. None supplied a relevant correction. The published Annals text was not obtained or collated. E15/E16 are explicitly v4-only findings; a later alternative-proof paper is not treated as a corrigendum. All fourteen existing source issues retain their independent review objects; neither new entry has a self-authored review.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed FA.4/FA.5 audits and the actual stage contracts for RD.3, CR.3, MC.6 and FA.4 were read. No reviewed RD.3/CR.3/MC.6 entries were found; that is not a library absence certificate. Actual pinned `Mathlib/RingTheory/WittVector/Isocrystal.lean` definitions and rank-one classification were read. They do not implement these geometric categories or the coherent F∞ construction. Tau Ceti's `Tannaka.fgPointTensorIsoEquiv`, in `Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`, reconstructs commutative Hopf algebra points from finite-comodule tensor automorphisms; it does not by itself construct the required neutral isocrystal category or comparison. These foundations are reused without marking any new interface library-complete.

## Validation and reproducible small models

The inventory has 74 items: 7 planned and 67 missing, each missing item routed exactly once, across 7 routes. It retains 17 prerequisites and has 16 source issues. Item /38 stays removed, /71 stays present, /1 stays planned and the minimal-slope curve route is unchanged. Original independent source-issue reviews compare identically with the pre-fix file.

Exact finite regression models passed 132 typed-recursion cases, 1,584 transition-composition cases and 3,332 twist/slope cases. They also checked the F₄ wrong-pullback example, eventual scalar morphisms, coefficient-extension typing and object-generated quotient behavior. The proposed prefix graph is acyclic and the forbidden whole-application-to-D-module reverse edge produces a cycle. A fresh read-only `scripts.build.assemble(require_distances=False)` produced 2,956 stages and 8,634 stage edges. Its graph, including stage requires, has 2,581 incident vertices and 8,634 distinct edges; it is acyclic, including the retained CR.3→RD.3, CR.3→R07.2 and VB0→RD.3 review requests. Isolated stages explain the vertex-count difference. These remain requests rather than claimed implemented imports.

Core finite checks can be reproduced with standard Python:

```python
from fractions import Fraction as Q
for n in range(1, 13):
    for m in range(2, 13):
        assert (n + n*(m-1), n) == (n*m, n)
        for ell in range(1, 13):
            direct = list(range(n*m*ell-1, -1, -1))
            blocks = [i for j in range(m*ell-1, -1, -1)
                      for i in range(n*j+n-1, n*j-1, -1)]
            assert direct == blocks
assert 1 != -1 and 1**2 == (-1)**2
for r in range(1, 8):
    for s in range(1, 5):
        for va in range(-8, 9):
            vc = -Q(va, r)
            assert va + r*vc == 0
            for d in range(1, 8):
                alpha = Q(3, 5)*d
                assert (alpha + d*vc) - d*vc == alpha
                assert (-d*vc)/(s*d) == -vc/s
                slopes = [Q(-2, 3), Q(1, 2), Q(7, 4)]
                shifted = [v-vc/s for v in slopes]
                assert all((slopes[i] < slopes[j]) ==
                           (shifted[i] < shifted[j])
                           for i in range(3) for j in range(3))
```

These finite models check contracts and arithmetic; they do not prove the analytic, crystalline, Tannakian or automorphic inputs. Strict field extension and quotient tests likewise illustrate the obligation rather than formalize Witt-vector fields or group schemes.

Required paper, intake, source-issue/version and whitespace checks pass. No Lean file is required by this job. No usable existing compiled build at the pins was available, so no Lean compilation ran. The independent fix review should inspect E15/E16, the sign/normalization contract and the scoped shared-prefix comparisons before accepting the new plan.
