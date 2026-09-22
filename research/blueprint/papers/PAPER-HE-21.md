# He (2021): cordial elements and affine Deligne–Lusztig dimensions

Codex — `codex-a71f92`; issue [#1397](https://github.com/CBirkbeck/tauceti-explorer/issues/1397). **Partial follow-up**, retaining the initial extraction by `codex-c83e7a` and all stable /1–105 identifiers.

There are now **129 items: 7 library, 10 planned and 112 missing**. All missing items are routed exactly once. Eight source routes and three Part II briefs share existing owners. The internal dependency graph has 373 edges; all 44 definitions/constructions have structured API and test entries (138 API entries, 132 specified tests). These structural properties do **not** certify mathematical proof closure. Ten explicit gap records retain the unfinished source and implementation obligations. No Lean formalization or compilation is claimed.

The main advance is a source-backed replacement for the problematic shrunken basic-seed citation, in a carefully restricted scope. The broader seed transport is still open. The bounded-convolution gap now has an explicit local finite-type argument and named producers, and the three previously unrouted interfaces /61, /69 and /92 now have owners.

## Source and reading record

Xuhua He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum of Mathematics, Pi 9 (2021), e9, 1–15, [DOI 10.1017/fmp.2021.10](https://doi.org/10.1017/fmp.2021.10). All fifteen pages of the [published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties.pdf), including every proof and the references, were reread on 2026-09-22. The title page gives CC BY 4.0. The new PDF SHA-256 is `8039273c5ae75cc868ac3343ae8b841d482b309b682a22949d29478b9799cc30`. Cambridge's dynamic download footer can change the bytes; this does not establish a changed mathematical version. The previous acquisition record is retained in the JSON.

The new supporting-source reading is deliberately distinguished from the previous worker's reading:

| Source | New reading | Still not certified |
|---|---|---|
| [He14, published Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf) | Setup §§1.1–1.6; §§2.1–2.3; §4.1 and reduction/minimal-geometry passages through the finite-parahoric portion of Theorem 4.8; all §6 and §11; Theorem 12.1 statement. Printed p.399 image inspected. | Full §§3–4 prerequisite tree, upper-bound/Mazur proofs, general characteristic transport |
| [He–Yang 1203.4680v1](https://arxiv.org/abs/1203.4680v1) | All nine pages, including every Dynkin case and references | Independent verification of all case computations and referenced HN nice-class theorem |
| [He–Nie 1112.0824](https://arxiv.org/abs/1112.0824) | Theorem 2.10 and proof; all §§5.1–5.2; opening §6.1; Corollary 6.6/Theorem 6.7 statements | Earlier RedMin inputs and the based-ring/trace proof of cocenter linear independence |
| [Görtz–He 1006.2291](https://arxiv.org/abs/1006.2291) | §§2.2–2.4; Lemma 2.5.1; entire Proposition 2.5.2 induction; §2.6 including proof | Full geometric reduction and representability/characteristic transfer |
| [GHN erratum](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf) | All three pages reread | Actual application to the current geometric carrier |

Hashes and exact scopes appear in `source.followUpReading`. He14 arXiv v2 was also inspected for the introduction/setup and §11; published locators control the final statements. The original worker's selected GHN15, MV20 and He15 reading is preserved as historical provenance, not represented as fresh full-paper reading. Viehmann14, He09, GHKR10 and the precise general fibre-dimension source remain acquisition/decomposition frontiers. GS0 already owns the Zhu/Bhatt–Scholze perfect-geometry inputs.

## Mathematical targets retained

Let L be the completed maximal unramified extension of F, with Frobenius σ and σ-stable Iwahori I. The paper uses a negative base alcove and **t^λ acts by translation by −λ**. After §2.2, G is simple and quasi-split. Write uniquely

`w = x t^λ y`, with λ dominant and `t^λ y ∈ {}^S Wtilde`.

Then `ησ(w)=σ⁻¹(y)x` and

`d_w(b) = (ℓw + ℓησ(w) − def_G(b))/2 − ⟨ν_b,ρ⟩`.

Every `x t^λ` is cordial and has generic Newton class `[t^λ]`. Cordiality gives the virtual dimension on every nonempty locus and saturation **between a known nonempty lower endpoint and the generic maximum**. It does not supply the basic lower endpoint for free.

Normalized dominant subtraction is leastness in an integral-coroot congruence class, not coordinatewise truncation. It produces `λ_w^{♭♭}`. Theorem 5.5 constructs `w ⇒σ a t^γ`, with γ dominating that double-flat vector and saturated support containing that of ησ(w).

The main theorem retains all three geometric/Newton assumptions:

- the original alcove w·a is shrunken;
- every simple-coroot coefficient of `λ_w^♦−ν_b` is strictly positive;
- `(λ_w^{♭♭})^♦ ≥ ν_b`.

Nonemptiness is then equivalent to equal κ and full σ-support, and the dimension equals d_w(b). Corollary 6.4 replaces the two Newton inequalities by `λ_w^♦≥ν_b+2ρ∨`, retaining the shrunken condition. The split minuscule case does not permit omission of strict positivity. The final Levi remark still needs an actual Hodge–Newton decomposition and renewed hypotheses on the resulting factors.

| Items | Coverage |
|---|---|
| /1–28 | Local data, flag carrier, invariants, virtual dimension, support, chambers |
| /29–52 | Reduction, Demazure product, generic Newton classes, cordiality, Mazur and closures |
| /53–84 | Normalized subtraction and every major factor/correspondence in §5.4 |
| /85–105 | Levi obstruction, seed, main conclusions, corollary and GHN corrections |
| /106–118 | Generic Hecke algebra, twisted cocenter, positive class polynomials and finite-Coxeter reduction |
| /119–122 | Dimension=degree, restricted non-shrunken seed, zero branch and general-scope transport |
| /123–129 | Bounded convolution, local dimension argument, perfect comparison, lattice adapter and geometric reductions |

## G3: a restricted replacement for the shrunken seed citation

The existing A2 diagnostic survives fresh exact checking. In split adjoint A2 use simple-root coordinates (u,v), with base alcove u<0, v<0, u+v>−1. Take λ=ω2∨=(0,1), x=s2s1, y=1. The original element acts by

`x t^λ(u,v) = (v−1, 1−u−v)`.

The three positive-root intervals are (−2,−1), (1,2), (0,1), so it is shrunken. The §5.4 construction has J empty, J′={s1}, x′=s2, z=s1, γ=λ and y′=1, hence a=s1*s2=s1s2. Its action is

`a t^γ(u,v) = (1−u−v, u)`.

Its intervals are (1,2), **(−1,0)**, (1,2). Thus the constructed element is not shrunken. Both finite parts have full support; λ has positive simple-coroot coefficients (1/3,2/3). This invalidates direct use of the cited shrunken theorem, **not** the main theorem or seed nonemptiness.

The new route is:

1. In He14 Proposition 11.6 set J=S, x=a, y=1 and μ=γ≠0. The hypotheses require dominant nonzero γ and full δ-support, but **not** a shrunken alcove. It gives a positive twisted-cocenter contribution from `T_(t^γ c)`, for a finite δ-Coxeter element c.
2. He14 Proposition 11.7, supplied by HY12 Theorem 1.1, reduces `t^γ c` to a minimal twisted Coxeter element `c′τ` in a proper affine parabolic.
3. A finite twisted Coxeter part has zero Newton vector: its linear part is elliptic, so the affine transformation is rationally conjugate to a finite-order linear transformation. Rational conjugacy is **not** used to assert integral conjugacy.
4. The nonnegative class-polynomial recursion prevents the indicated minimal basic coefficient from cancelling.
5. He14 Corollary 6.2 identifies the nonzero coefficient with ADLV nonemptiness.
6. If γ=0, Proposition 11.6 is inapplicable. Use a finite reductive parahoric quotient and Lang surjectivity separately; in the zero κ-fibre the basic class is [1].

This proves a **source-derived restricted seed contract**: simple quasi-split adjoint G, split over L, in He14's equal-characteristic setup with its good-characteristic restriction, γ≠0 dominant, and full δ-support. The generic equal-parameter algebra and full-coweight datum are explicit. He14's shrunken Theorem 11.4 is not invoked; doing so would undo the repair.

He14 §6.3 describes a p-adic **nonemptiness** extension, while explicitly lacking a p-adic dimension theory at that time. It is not an unrestricted mixed-characteristic dimension theorem. Item /122 records the needed actual-datum/characteristic transport; G3 remains open there and at complete verification of the corrected twisted induction/HN inputs. No hypothesis is silently added to He21's headline target.

### Printed-proof issues kept visible

Published p.399 was inspected as an image, not just extracted text. Proposition 11.6 prints `supp_δ(v)=J` where x is the defined variable. Its proof writes x=u x1 with x1 minimal on the left for W_(δ⁻¹J1), then selects a left descent **inside** δ⁻¹J1. That contradicts this minimality: the required descent is in J outside δ⁻¹J1. The next minimum-coset step uses precisely that exclusion. The proof also drops δ from the support assertion for x′; saturated support is what is justified.

The later [He–Zhou–Zhu proof](https://arxiv.org/abs/2109.02594v1), Proposition 3.4.2, explicitly uses the outside-parabolic descent and σ-support. This is a later reformulation, not an official erratum. Its geometric framework is a concrete next lead for /122. The full corrected twisted induction remains a proof-verification obligation. In the nontrivially twisted HY12 conclusion, J is the saturated support of a twisted Coxeter word, not necessarily its ordinary support.

## G2: local finite-type dimension argument

The paper's exclusion of a union of proper closed subsets requires a finite-type/noetherian setting. The follow-up replaces a global finiteness assumption by a local argument:

- Choose a maximal-dimensional irreducible target component and a nonempty finite-type affine open U in it.
- Prove that the relevant forgetful map over U is finite type, by exhibiting it as the appropriate universal bounded convolution projection after base change and locally closed restriction.
- Apply the finite-type fibre lower-bound theorem there. This already gives the required lower bound for the total source dimension.

Item /123 owns the bounded convolution producer: after locally trivializing the first flag, the intermediate flag lies in a bounded Schubert variety; exact relative positions are locally closed conditions. **Finite-level action and descent must still be proved.** Items /78 and /80 supply the two endpoint maps; /125 requires the actual cartesian diagrams including Frobenius. A dimension bound on point fibres alone does not certify a finite-type morphism.

SF.0 owns the general finite-type theorem /68 and its local refinement /124. GS0 owns /123, /125 and the compatible perfect-model comparison /126. In mixed characteristic one must deperfect the **map compatibly**, not independently choose finite-type models for its source and target. Perfection preserves the underlying topology and dimensions once the proper comparison is constructed; it does not make a perfect scheme finite type.

The GH10 Proposition 2.5.2 induction was fully reread: in the descent case, the ordinary-product estimate uses the A1 branch and the Demazure estimate the Gm branch. The corresponding length changes differ. Item /128 isolates that rank-one geometry instead of treating the fibre estimates as unexplained formulas.

G2 is now precisely routed and decomposed, but is not declared closed.

## G1 and other corrections retained

For SL2, ρ∨ for its single node is α∨/2 and is not an original cocharacter. The auxiliary full-coweight construction does not permit an original-group translation by this vector. Item /127 assigns the integral-lattice, Weyl/σ, dominant-representative, double-flat and κ comparisons to RG2.1. Item /61 assigns the geometry/dimension descent to the shared GS flag owner.

The GHN erratum supplies a **componentwise** equal-characteristic flag isomorphism when char(k) does not divide |π1(G_ad)|; a global immersion also needs injectivity on components. It does not license a dimension claim from an unrestricted point bijection. G1 remains open outside that qualified branch.

Other inherited corrections are preserved:

- Use the normal-form **left factor x** in the Levi support obstruction: `x⁻¹wσ(x)=t^λσ(ησ(w))`.
- Keep every closure bar in §4.3; raw disjoint Iwahori cosets cannot satisfy those containments.
- Use nonnegative simple **coroot** coefficients in Proposition 5.1, including zero. Supply feasible-set nonemptiness and leastness, not only lower-directedness.
- In A1, `0−domω∨=ω∨`; truncation to zero violates coroot congruence.
- Distinguish I-normalized Newton-stratum dimension from ADLV dimension by the subtraction of ⟨2ρ,ν⟩.
- Levi-class uniqueness requires basic b. In GL2, diag(t,1) and diag(1,t) have the same G-class but different diagonal-torus classes.
- In the negative-alcove convention, the rank-one alcove s·a=(0,1) is shrunken. The valid diagnostic is the A2 example above.

## Library and owner audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The seven existing library items retain exact declarations:

| Items | Reused declarations |
|---|---|
| /6–7 | CoxeterSystem.length, IsReduced, length_inv, length_mul_le |
| /8 | CoxeterSystem.BruhatStep, BruhatLE, bruhatPartialOrder |
| /24–25 | TauCeti.dominantChamber, openDominantChamber, existsUnique_mem_orbit_inter_dominantChamber, stabilizer_eq_closure_wallReflections |
| /26–27 | TauCeti.posRootCone, mem_posRootCone, finite_setOf_dominant_sub_mem_posRootCone, dualized with exact integrality/root-system hypotheses |

Those statements and signatures were reopened. They do not identify a local group's Weyl group with the abstract root-pairing carrier, nor construct ADLV geometry.

Pinned searches found no matching generic class-polynomial, twisted-cocenter, Demazure-product or twisted-Coxeter implementation. The inspected double-coset Hecke module in Tau Ceti is a different carrier from a generic Z[v,v⁻¹] affine Hecke deformation. The comparison is a theorem to prove, not a renaming.

Ownership was refreshed at explorer `6a3c7756d3446bd54797604ac7089df94a7f8551`. Relevant exact stage descriptions, upstream RootSystems/ReductiveGroups, the reviewed SF/BG/GS/HS audit and changed peer-paper routes were read. The coverage blob is `5e708cfc74a51b10e62149113872fe4e00eb5846`; the local copy's blob hash was checked. No separate RG2/root/SR.1 entry occurs in that file, so actual supplier/source inspection is recorded instead of inventing an audit.

The eight source routes remain RG2.0, RG2.1, RG2.2–3, RG2.4, BG0, BG1, GS0 loop/Witt geometry and SF.0. The new obligations use those same owners.

Three Part II briefs divide the additions:

1. **RootSystemsPartIIDominanceAndDemazure**: abstract root/Coxeter extensions, normalized subtraction and HY12 finite-Coxeter reduction. Preserve this existing candidate, also reused by KPZ26. Consolidate KZ25's overlapping RootSystemsDominancePartII lane at design intake; do not build two integral dominance orders.
2. **HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig**: classical ADLV schemes/perfections, reduction, cordiality, seed geometry and dimension targets. It imports GS flags and BG invariants; local shtuka diamonds are not silently identified with classical ADLVs.
3. **SmoothRepresentationsPartIIParahoricCenters**: reuse the pending KP18 Iwahori/parahoric-center proposal and add its early generic twisted-cocenter/class-polynomial branch. **Center and cocenter are distinct**; this shares the generic Iwahori presentation through explicit specialization while leaving the existing Bernstein-center targets intact. There is no duplicate generic Hecke algebra in the root or ADLV continuation.

Pending briefs are not represented as reviewed implementations. Source and candidate routes specify imports, exact target guards, proof obligations, API/tests and future Lean module homes.

## Structured source findings

The revised protocol was reread at final preflight commit `93ad2ae65555b960e1ce47ae8b144d2173522ab4`. The JSON now records 14 source findings under `sourceIssues`, each with a short printed fragment, locator, correction, reason and correction-search record. They cover the He21 citation/notation/proof interfaces, He14 and HY12 support/descent wording, and both already-published GHN corrections. These are findings awaiting independent review, not self-confirmed errata. Searches did not locate an official He21/He14 correction; that is not a claim that none exists. HY12's finding is confined to the inspected arXiv version. No authors were contacted.

## Validation and remaining work

Fresh finite diagnostics check:

- all 36 A2 generic Hecke basis products, including the ordinary-product coefficient and Demazure leading coefficient in N[h];
- all 216 A2 Hecke associativity triples and all 216 Demazure associativity triples;
- the norm sums for a split A2 Coxeter element (order three) and a diagram-twisted Coxeter element (order six);
- exact alcove-coordinate intervals in the A2 diagnostic and the SL2 half-coroot lattice guard.

For reproduction, use s1=[[-1,0],[1,1]], s2=[[1,1],[0,−1]] on coweight coordinates and δ=[[0,1],[1,0]]. For the finite Hecke checks enumerate S3, choose reduced words by breadth-first search in its adjacent transpositions, and multiply by T_s using T_wT_s=T_ws for an ascent and T_ws+hT_w for a descent. Coefficients are integer arrays in h=v−v⁻¹. Subtract T_xy, or h^(ℓx+ℓy−ℓ(x*y))T_(x*y), and check all coefficients are nonnegative. Compute affine interval endpoints on the vertices (0,0), (−1,0), (0,−1). These are finite diagnostics, not proofs of He14 Proposition 11.6 or the general theorems.

The previous worker's 729 A2/512 A1 subtraction cases and 570 shrunken-input reductions are retained as historical evidence, **not** claimed as rerun in this follow-up.

The paper validator passes. Additional checks verify all 129 stable IDs, exact-once routing for all 112 missing items, all 373 internal edges and acyclicity, and API/test coverage for every definition/construction. The three exact deliverable paths are checked by intake, with existence checked separately. No Lean file is required by this paper job.

G1–G3 remain substantive gates. G4–G10 identify the HN/minimal-geometry, MV purity, Viehmann closure, upper-bound/Mazur, Levi, Lang/rank-one and residual Coxeter/root proof frontiers. The dependency graph is an itemized **partial plan**, not a closed Lean proof graph. Do not upgrade it merely because structural checks pass.
