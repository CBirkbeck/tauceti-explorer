# Independent review: CrystallineLocalGlobalCompatibilityCM

**Accepted after correction**, 7 October 2026. Job REV-DESIGN-CrystallineLocalGlobalCompatibilityCM; issue #6904. Reviewer: Codex, session **codex-cTg2oy**. The input design was written by Codex session **codex-YUlWGm**; this is an independent session, not self-review.

Acceptance concerns the correctness and honest scope of this target-level planning pass. Every node has a verified, corrected or added verdict; every baseline citation is confirmed; no contradictory assertion remains in the corrected specifications. Open supplier and prototype gaps prevent closure and implementation. The qualified lifting theorem remains qualified, and no claim about the unrestricted theorem is made.

## Counts and coverage

| Item | Reviewed result |
|---|---|
| Nodes | 97: 19 definitions, 15 constructions, 63 theorems |
| Individual verdicts | 1 added, 43 corrected, 53 verified; 0 unverifiable |
| Definition/construction API | 103 items |
| Discriminating tests | 104, at least three for every definition/construction |
| Planets | 37; no stage has more than six |
| Baseline citations | 9 confirmed; 0 removed or replaced |
| Source findings | 16 confirmed: 14 inherited, E19/E20 added |
| Requests / gaps | 27 / 40 |
| Stages | 10 planned, 0 closed |

The 96 original node IDs are retained. One construction is added with `addedBy: "REV-DESIGN-CrystallineLocalGlobalCompatibilityCM"`: CL.9/prepared-pgl2-level. The 84-item extraction routing is retained: 82 owned items, Theorem 1.3 routed to the full Theorem 4.2.15, and the generic tensor identity Lemma 2.3.15 imported/requested from its owner. The added carrier gives 15 carriers beyond the 82 routed targets. Local CN 5.3.2–4 component statements remain imported from LocalGaloisDeformationRings. All implementation statuses are unchecked.

## Sources actually read

Primary source: Caraiani–Newton, [arXiv:2301.10509v3](https://arxiv.org/pdf/2301.10509v3), 27 March 2025. All 97 owned-node defining/proving passages, the relevant §§2–5 prerequisites and all sixteen source-finding locators were checked. The source TeX was read for weight orientation, residual bars and the spectral-sequence index. PDF SHA256: `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`; TeX archive SHA256: `ba97df92337a5b364ef21df65c31d2cce617099cbe48de27722f6f875388df19`.

Secondary source: Allen–Khare–Thorne, [arXiv:1910.12986v2](https://arxiv.org/pdf/1910.12986v2), 2 September 2022 (title page 5 September). Checked PGL₂ Theorems 5.10–5.11, Appendix A.2–A.7 and the A.14 preparation input. A.4/A.5 are on p.86 and A.6 on p.87; Theorem 5.11 begins on p.46 with its proof on pp.47–48. PDF SHA256: `230de16e9688931b1d4a8ea4ba765f1f5f262d32e94ccf92083062fd1d9b4d44`. The Cambridge Journal of Mathematics version was not collated; its separate collation gap remains.

The [Caraiani author PDF](https://www.ma.imperial.ac.uk/~acaraian/papers/Modularity-IQF.pdf), SHA256 `d87c047c01453ac2ca671d79dd41a10259f145292791bd849a2b05e30b51faa0`, was independently compared only at Lemma 5.6.5, pp.85–86. It retains the erroneous Klein-four implication. No complete comparison of the other findings with this older author copy is claimed. Checked the [arXiv version history](https://arxiv.org/abs/2301.10509), [Caraiani publications](https://www.ma.imperial.ac.uk/~acaraian/papers.php) and [Newton publications](https://people.maths.ox.ac.uk/newton/publications.html); no newer version or linked correction was located there. This is a scoped correction search, not an exhaustive novelty claim. The packet now has a `sourceVersions` registry for the exact read texts.

Every node and request excerpt matches its recorded public text after whitespace/control-character normalization. Replaced introduction references and accidental acknowledgement excerpts with the actual statements/proofs, including Lemma 2.3.17, Proposition 4.1.8, Proposition 4.2.6, the separating sub-lemma, Theorem 4.2.15 and the final preparation proof. Corrected the deep-level/Hecke-image pages to p.61 and the dual image to p.65. Source-finding E18 is at p.53, and its full upper bound includes the sum of local degrees.

## Mathematical and ownership corrections

CL.0: unitary and Levi rescaling characters use different longest Weyl elements. Their former restriction equality is removed; the n=2 Siegel test distinguishes them. The cone test now uses central scalar cocharacters in every allowed parabolic rather than an arithmetic one-block parabolic outside Q⊂P. The positive monoid is defined before Lemma 2.1.15. Lemma 2.1.21 uses the global central character, ray-class congruence, Chebotarev and archimedean connectedness; direct evaluation at a potentially ramified p-place is insufficient. The imaginary-quadratic-field hypothesis is explicit whenever Theorem 2.1.20 is invoked.

CL.3–CL.5: distinguish a single Bruhat stratum from the sum of all strata of its length, and use a compact open neighbourhood for nonzero locally constant support. Q-ordinary characteristic-zero spaces require simultaneous unit-slope generalized eigenspaces; ordinary Fitting over E only detects nonzero eigenvalues. The crystallinity proof needs the identity-only geometric lemma and the Steinberg/maximal-compact contradiction. The boundary summand comes from derived Mackey at the identity double coset. Lemma 4.1.6 uses the arithmetic nilmanifold fibre and strong approximation, and Lemma 4.1.7 uses smooth semidirect derived invariants.

CL.6–CL.7: Lemma 4.2.3 needs the integral Levi splitting, the Cab84 P-stability argument and the dual coefficient retract. The dual degree-shifting target is the unitary middle-degree image. Only the nilpotent exponent N is uniform in the torsion comparison; m′ may depend on the input. An integral Hecke image need not surject to the torsion image. Deep unitary membership includes the original K̃. The local reconstruction node currently requires a flat target, so its extension to a torsion target is requested. The existing semistable-ordinary universal crystalline-point export replaces the weaker deformation-carrier citation. Theorem 4.3.1 uses a cyclic CM extension with relative totally-real degree at least four and complete splitting at v,v^c, giving the same local fields; it does not use ramified crystalline descent.

CL.8–CL.9: non-neat perfectness requires bounded derived residue reduction and finite cohomology, and patching needs perfect group-ring models at the finite p-covers. Special generic points have unique **generic** generalizations. Expanded prepared hypothesis (15). Added the PGL₂ level, three parabolic branches, Hecke ideal and coefficient-field choices. Tame χ_v factors through k_v× before applying it to the reduced Iwahori diagonal ratio. The Taylor–Wiles ring is unframed, with its framed-T variant separate; the forgetful map is the Δ_Q augmentation quotient. AKT A.4–A.6, including non-enormous Selmer detection and the CM generator formula, cannot be obtained from the unrelated generic generator-count node or Dickson classification alone.

The complete upstream ReductiveGroups and LieGroups roadmaps and the relevant ProfiniteCohomology/ClassFieldTheory exports were read, together with the reviewed library audit and the exact imported parent/supplier statements. No upstream file or supplier packet was edited. ProfiniteCohomology explicitly excludes Hochschild–Serre: the request is narrowed to continuous cochains/transfer and layer-11 abelian dimension/exterior computations; derived semidirect invariants go to SmoothRepresentationsOfLocalGroups. Existing requests were made precise, including the integral Galois theorem 2.1.24 (distinct from residual 2.1.20), coefficient retracts, PGL₂ consumers and cyclic/solvable field preparation. Five new requests cover derived invariants, central Hecke comparison, Q-ordinary unit-slope linear algebra, torsion-target reconstruction and AKT Taylor–Wiles detection/presentation. For the full CM characteristic-zero scope, the automorphic supplier request explicitly records the narrower imaginary-quadratic/p-splitting scope of CN 2.1.19(3) and asks for the required extension/base-change argument.

The mathematical reader was reconciled with the packet, including all 103 API items, 104 tests and source dispositions. Its declaration order now follows the acyclic local dependencies within each stage. The suggested file retains genuine algebraic carriers and six typed core nodes; the updated source-indexed catalogue honestly records all other absent signatures. The general scalar cone test replaces the one-block test in the typed core.

## Exact pinned baseline

Both existence and applicable hypotheses were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed or replaced; the wrong LieGroups audit path was corrected.

| Declaration at the pin | Confirmed scope |
|---|---|
| [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L87) | Abelian C with HasDerivedCategory C; localization carrier, not smooth arithmetic cohomology. |
| [mathlib:Representation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L49) | Semiring coefficients, monoid and module; an algebraic representation, with no smoothness/continuity. |
| [mathlib:Fin.revPerm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Fin/Rev.lean#L35) | i↦n−i−1, an involution; the generic longest permutation is reused. |
| [mathlib:LinearMap.eventually_isCompl_ker_pow_range_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Artinian/Module.lean#L317) | Both IsArtinian R M and IsNoetherian R M; does not select valuation-zero eigenvalues over E. |
| [mathlib:AlgHom.range](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L545) | Image subalgebra of an actual algebra homomorphism; does not manufacture a Hecke action. |
| [mathlib:AlgHom.mem_range](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L549) | Image membership is equivalent to a preimage; same actual algebra-map requirement. |
| [mathlib:Ideal.exists_pow_inf_eq_pow_smul](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Filtration.lean#L388) | Noetherian commutative ring and finite ambient module; uniform filtration shift for a submodule. |
| [tauceti:TauCeti.ArtinRees.exists_controlled_lift](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Ideal/ArtinRees.lean#L78) | Noetherian finite ambient module and fixed submodule N; one shift works for every surjection onto N and every depth. |
| [mathlib:finAddFlip](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Logic/Equiv/Fin/Basic.lean#L307) | Fin(m+n)≃Fin(n+m); specializes to block exchange, not reversal. |

The reviewed audit marks only parts of the general algebraic/patching infrastructure as built. No new generic derived category, Fitting decomposition, range subalgebra, Koszul library, deformation-ring library or upstream Bruhat library is planned here. Stage-level or weaker exports remain requests, with their sufficient statements specified explicitly.

## Source-finding dispositions

| Finding | Verdict and independent reason |
|---|---|
| E1 | confirmed: In Theorem 3.3.3 on p.52, ζ has source R^□. The universal representation is defined over R^□, so the tensor product must use that source ring before the asserted factorization. |
| E2 | confirmed: Lemma 3.3.5 on p.52 characterizes ordinary finite-B points; its printed condition (2) uses the crystalline quotient where the ordinary R^△ quotient is required by its condition (1). |
| E3 | confirmed: Lemma 3.1.3 on p.44 splits off the first m ordered eigenvalues. Their permutation is S_m; S_n cannot index an m-term slope vector. |
| E6 | confirmed: Lemma 2.2.16 on p.31 has an extraneous coefficient subscript after scalar extension/reduction. The evaluation-kernel type identifies the intended integral dual Weyl module. |
| E7 | confirmed: Proposition 2.1.14 on pp.18–19 refers to the unramified spherical operators defined by (2.1.2), not the preceding weight convention (2.1.1). |
| E8 | confirmed: The displayed action on p.21 evaluates α at x although x is a module vector. The character takes group elements, so the rescaling is α(g)^{-1}ρ(g)x; TeX confirms the printed slip. |
| E10 | confirmed: The even-case sum in Lemma 4.2.5 on p.62 is indexed by v̄∉S̄. Its local degree must use that v̄, replacing the printed leftover v̄″. The rounding argument then yields the required bound, including odd D. |
| E11 | confirmed: The unitary Hecke characteristic polynomial on p.18 lacks X^{2n−j}. With that factor it has degree 2n and constant term q^{n(2n−1)}T_{v,2n}; the q exponent remains j(j−1)/2. |
| E12 | confirmed: The last Klein-four implication in Lemma 5.6.5, pp.85–86, is false. Independently generated all 24 twisted Q₈⋊C₃ matrices over F₇: determinant order three, all 16 outside-kernel trace identities, and irreducible Q₈ kernel. The author copy retains the same conclusion. The qualified Dickson case proof isolates exactly d=3/projective A₄. |
| E13 | confirmed: Lemma 3.3.2 on p.51 uses an ascending filtration; the quotient is F^i/F^{i−1}. An ordinary finite B-valued deformation uses a character into B×, not E×. |
| E14 | confirmed: The proof of Lemma 3.2.2 on p.48 refers to Proposition 3.2.1, but the immediately preceding labelled result is Lemma 3.2.1. |
| E15 | confirmed: The residual representation on p.83 is two-dimensional over the finite residue field k. The printed GL_n(Q̄_p) target conflates n-dimensional unitary/Levi notation and the characteristic-zero realization. |
| E16 | confirmed: The V set in the preparation argument on p.86 is a set of p-adic places of F, the ambient CM field; K denotes the chosen level, not that field. |
| E18 | confirmed: The assertion in §4.1.1 on p.53 concerns arbitrary algebraic coefficients, but its cited Lemma 2.3.8 computes trivial-coefficient U cohomology. Künneth alone does not provide the missing general-coefficient nonvanishing proof. This confirms a justification gap, not a counterexample; the zero-weight computation suffices for the present degree-shifting path. |
| E19 | confirmed: The printed formula has neither the coefficient ring nor the coefficient dual. Already i=0 has left side O/ϖ^m and right side Z_p. For torsion-free abelian U₀ the cochain/Koszul computation gives the displayed continuous dual; the corrected finite modules become trivial after deep restriction. |
| E20 | confirmed: For a cohomological spectral sequence d_r has bidegree (r,1−r). The incoming bidegree is therefore (q−r,d−q+r−1); the printed exponent is wrong for r≥2. The outgoing term and nilpotent-annihilator strategy are unchanged. |

E19 and E20 are local notation/index corrections and do not change a theorem endpoint. E18 confirms a missing justification for arbitrary-coefficient exact nonvanishing, not a false theorem. E12 refutes the printed finite-group lemma, not the automorphy theorem. The qualified lemma is now justified case by case: the trace identity forces the outside-kernel projective order to equal determinant order; scalars lie in the kernel, so determinant descends; the Borel, dihedral, S₄, A₅ and PSL/PGL cases are resolved directly by Dickson. The only irreducible-kernel case is cubic determinant and A₄ projective image. The packet excludes this case in its lifting endpoint and requests preservation of full residual image and cyclotomic degree during preparation. For p=3,5, the cyclotomic degree divides p−1 and is never three.

### Reproducible finite-group check

Over F₇, set i=(0,1;−1,0), j=(2,3;3,−2) and h=(−1+i+j+ij)/2. The code below independently checks the whole group, character and twisted representation, every outside-kernel trace identity, and the determinant/projective orders. The quaternion kernel is absolutely irreducible: a common invariant line gives nonzero eigenvalues a,b for i,j, hence ab=−ab by anticommutation, impossible in odd characteristic.

```python
import json
p=7
I=(1,0,0,1)
def add(a,b):return tuple((x+y)%p for x,y in zip(a,b))
def sc(c,a):return tuple(c*x%p for x in a)
def mul(a,b):
 x,y,z,w=a;u,v,r,s=b
 return ((x*u+y*r)%p,(x*v+y*s)%p,(z*u+w*r)%p,(z*v+w*s)%p)
def power(a,n):
 b=I
 for _ in range(n):b=mul(b,a)
 return b
def det(a):return (a[0]*a[3]-a[1]*a[2])%p
def tr(a):return (a[0]+a[3])%p
def closure(gens):
 g={I};todo=[I]
 while todo:
  a=todo.pop()
  for b in gens:
   c=mul(a,b)
   if c not in g:g.add(c);todo.append(c)
 return g
i=(0,1,6,0);j=(2,3,3,5)
h=sc(4,add(add(sc(-1,I),i),add(j,mul(i,j))))
q8=closure([i,j]);g=closure([i,j,h]);tag={mul(q,power(h,r)):r for q in q8 for r in range(3)}
assert len(q8)==8 and len(g)==24 and set(tag)==g
assert power(i,2)==power(j,2)==sc(-1,I) and mul(i,j)==sc(-1,mul(j,i)) and power(h,3)==I
assert all(tag[mul(a,b)]==(tag[a]+tag[b])%3 for a in g for b in g)
rho={a:sc(pow(2,tag[a],7),a) for a in g}
assert all(mul(rho[a],rho[b])==rho[mul(a,b)] for a in g for b in g)
ker={a for a in g if det(rho[a])==1};outside=g-ker
assert ker==q8 and len(outside)==16
assert all(tr(rho[a])**2%7==(1+det(rho[a]))**2%7 for a in outside)
assert len({det(a) for a in rho.values()})==3
assert len({sc(pow(next(x for x in a if x),-1,7),a) for a in rho.values()})==12
print(json.dumps({'field':7,'Q8_order':len(q8),'group_order':len(g),'h':h,'determinant_order':3,'projective_order':12,'determinant_kernel_order':len(ker),'outside_trace_identities_checked':len(outside),'character_multiplications_checked':len(g)**2,'representation_multiplications_checked':len(g)**2}))
```

Result: |Q₈|=8, |G|=24, h=(2,1,0,4), determinant order 3, projective order 12, kernel order 8, 16 outside-kernel identities, and 576 multiplication checks each for the character and representation. Independently checked the degree-shifting bound for n=1,…,10, D=1,…,20 and every permitted r,q; the proof uses d−q≤ceil(d/2)≤n²ceil(D/2)≤n²r, including odd D/d.

## Per-node review

The following is the complete review ledger, mirrored by the packet’s `review.checked`. The common imaginary-quadratic hypothesis correction applies to all uses of Theorem 2.1.20; the totally real characteristic-zero endpoint has its explicit exception.

| Node | Verdict | Check/correction |
|---|---|---|
| CL.0/weyl-elements | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.0/lem-2-1-12 | verified | Read CN25v3 Lemma 2.1.12, pp.17–18. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.0/parahoric-P-v(b,c) | verified | Read CN25v3 §2.1.13, p.19. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.0/lem-2-1-15 | corrected | Added the positive monoid and cocharacter definitions as direct inputs. |
| CL.0/rescaled-actions | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.0/lem-2-1-17 | verified | Read CN25v3 Lemma 2.1.17, p.20. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.0/lem-2-1-21 | corrected | Restored the global central-character, ray-class and archimedean comparison argument. |
| CL.1/p-ordinary-finite-level | verified | Read CN25v3 §2.2.1, pp.25–26. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.1/p-ordinary-functors | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.1/lem-2-2-4 | verified | Read CN25v3 Lemma 2.2.4, p.27. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/lem-2-2-5 | verified | Read CN25v3 Lemma 2.2.5, p.27. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/lem-2-2-6 | verified | Read CN25v3 Lemma 2.2.6, p.28. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/p-ordinary-completed | verified | Read CN25v3 §2.2.7, p.28. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.1/prop-2-2-8 | verified | Read CN25v3 Proposition 2.2.8, p.28. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/cor-2-2-9 | verified | Read CN25v3 Corollary 2.2.9, p.28. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/prop-2-2-10 | verified | Read CN25v3 Proposition 2.2.10, p.29. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.1/parahoric-variant | verified | Read CN25v3 §2.2.11, p.29. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.1/lem-2-2-12 | verified | Read CN25v3 Lemma 2.2.12, pp.29–30. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.2/lem-2-2-14 | verified | Read CN25v3 Lemma 2.2.14, p.30. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.2/prop-2-2-15 | verified | Read CN25v3 Proposition 2.2.15, p.31. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.2/lem-2-2-16 | verified | Read CN25v3 Lemma 2.2.16, pp.31–32. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.2/prop-2-2-17 | verified | Read CN25v3 Proposition 2.2.17, p.32. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.2/dual-p-ordinary | verified | Read CN25v3 §2.2.18, pp.32–33. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.2/lem-2-2-19 | verified | Read CN25v3 Lemma 2.2.19, p.32. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-2 | verified | Read CN25v3 §2.3.1, Lemma 2.3.2, p.33. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/induction-filtration-functors | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.3/prop-2-3-3 | verified | Read CN25v3 Proposition 2.3.3, p.34. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/prop-2-3-4 | verified | Read CN25v3 Proposition 2.3.4, pp.34–35. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-5 | verified | Read CN25v3 Lemma 2.3.5, pp.35–36. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-6 | verified | Read CN25v3 Lemma 2.3.6, pp.36–37. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-7 | verified | Read CN25v3 Lemma 2.3.7, p.37. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/chi-character | verified | Read CN25v3 §2.3.1, p.37. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.3/lem-2-3-8 | verified | Read CN25v3 Lemma 2.3.8, pp.37–38; Remark 2.3.9 and Corollary 2.3.10, p.38. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/prop-2-3-11 | verified | Read CN25v3 Proposition 2.3.11, p.38. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/cor-2-3-12 | verified | Read CN25v3 Corollary 2.3.12, p.39. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-14 | verified | Read CN25v3 §2.3.13, Lemma 2.3.14, pp.39–40. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.3/lem-2-3-17 | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Recorded and corrected E19: continuous coefficient-dual exterior powers, with the contragredient Levi action. |
| CL.3/lem-2-3-18 | verified | Read CN25v3 Lemma 2.3.18, p.43. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.4/Q-ordinary-hecke | verified | Read CN25v3 §3.1, p.43. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.4/iota-Q-ordinary | verified | Read CN25v3 Definition 3.1.1, p.43. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.4/thm-3-1-2 | corrected | Repaired the crystallinity argument with the missing Steinberg contradiction. |
| CL.4/lem-3-1-3 | verified | Read CN25v3 Lemma 3.1.3, pp.44–45. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.5/boundary-coefficient-object | verified | Read CN25v3 §4.1.1, p.53. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.5/thm-4-1-3 | corrected | Replaced the misplaced coefficient retract by the identity-double-coset Mackey summand. |
| CL.5/prop-4-1-4 | verified | Read CN25v3 Proposition 4.1.4, pp.54–55. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.5/lem-4-1-5 | verified | Read CN25v3 Lemma 4.1.5, p.55. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.5/lem-4-1-6 | corrected | Separated arithmetic nilmanifold fiber cohomology from continuous compact invariants. |
| CL.5/lem-4-1-7 | corrected | Routed derived semidirect invariants to the smooth representation owner. |
| CL.5/prop-4-1-8 | corrected | Placed tame-unipotent exactness in the consuming proposition. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. |
| CL.5/cor-4-1-9 | verified | Read CN25v3 Corollary 4.1.9, p.57. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.6/ord-hecke-algebras-4-2 | verified | Read CN25v3 §4.2.1, p.58. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/prop-4-2-2 | verified | Read CN25v3 Proposition 4.2.2, pp.58–60. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.6/lem-4-2-3 | corrected | Added the integral splitting, P-stability and derived-retract inputs. |
| CL.6/prop-4-2-4 | corrected | Disambiguated which unitary Hecke algebra is identified by duality. |
| CL.6/hecke-images-A | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/lem-4-2-5 | verified | Read CN25v3 Lemma 4.2.5, p.62. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.6/prop-4-2-6 | corrected | Separated the variable deep exponent from the uniform nilpotence exponent. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Recorded E20 and used the correct incoming differential bidegree. |
| CL.6/hecke-images-dual | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/prop-4-2-8 | verified | Read CN25v3 Proposition 4.2.8, pp.65–66. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.7/prop-4-2-9 | verified | Read CN25v3 Proposition 4.2.9, pp.66–67. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.7/prop-4-2-11 | verified | Read CN25v3 Proposition 4.2.11, p.67. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.7/prop-4-2-13 | corrected | Replaced the fixed-type-locus near miss with the universal crystalline quotient interface. The exact IHG reconstruction export requires a flat target; replaced its inapplicable import with an explicit request for the arbitrary/torsion local target. |
| CL.7/sub-lemma-1-twist | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. |
| CL.7/thm-4-2-15 | corrected | Replaced the fixed-type-locus near miss with the universal crystalline quotient interface. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. |
| CL.7/cor-4-2-16 | verified | Read CN25v3 Corollary 4.2.16, p.72. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.7/thm-4-3-1 | corrected | Restored complete local splitting and removed unsupported ramified crystalline descent. |
| CL.9/thm-5-2 | verified | Read CN25v3 §5.1, Theorem 5.2, pp.73–74. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.8/prop-5-4-2 | verified | Read CN25v3 §5.4, Proposition 5.4.2, pp.78–79. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.8/cor-5-4-3 | verified | Read CN25v3 Corollary 5.4.3, p.79. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.8/pgl2-cohomology | verified | Read CN25v3 §5.5, pp.79–80. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.8/lem-5-5-1 | verified | Read CN25v3 Lemma 5.5.1, p.80. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.8/prop-5-5-2 | verified | Read CN25v3 Proposition 5.5.2, pp.80–81. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.8/prop-5-5-3 | corrected | Restored the derived residue criterion and equivariant perfectness supplier. |
| CL.9/setup-5-6 | corrected | Expanded hypothesis (15) exactly; separated the subsequent prepared level and unitary parabolic choices into a construction. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.9/prop-5-6-1 | corrected | Added the prepared PGL₂ level construction as a direct prerequisite. |
| CL.9/deformation-problems-S-chi | corrected | Required the residue-field character that defines an Iwahori character. Separated the title from the independently specified Taylor–Wiles deformation problem. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.9/prop-5-6-2 | corrected | Added the prepared PGL₂ level construction as a direct prerequisite. |
| CL.9/prop-5-6-3 | verified | Read CN25v3 Proposition 5.6.3, p.84. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. |
| CL.9/lem-5-6-4 | corrected | Added the prepared PGL₂ level construction as a direct prerequisite. |
| CL.9/lem-5-6-5 | corrected | Supplied every finite-projective-image case and removed an unstated cyclotomic irreducibility premise. |
| CL.9/proof-thm-5-2 | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. |
| CL.9/akt-tw-primes | corrected | Replaced the inapplicable exact generator-count import with a precise request for AKT A.4–A.6, including the small-image Selmer-detection argument and CM relative generator count; fixed the appendix page locator. |
| CL.0/positive-central-cocharacters | corrected | Corrected test_one_block discriminating test. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.0/positive-parahoric-monoid | corrected | Removed definition/theorem dependency reversal; supplied contracting closure construction. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.0/lowest-weight-scaling-character | corrected | Separated the unitary and Levi normalization characters and their distinct longest Weyl elements. Corrected _mul API. Replaced generic construction sketch with the two normalization calculations. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 4 discriminating tests against the specified uses. |
| CL.1/unipotent-transfer-action | verified | Read CN25v3 §2.2.2, equation (2.2.1), p.26. Verified the expanded statement, hypotheses, direct inputs and proof sketch at target granularity; retained the explicit supplier/prototype gaps. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.1/ordinary-monoid-localization | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.3/bruhat-stratum-induction | corrected | Distinguished an individual stratum from the full length quotient. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.3/bruhat-open-cell-induction | corrected | Corrected test_nonopen_support discriminating test. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.4/q-ordinary-local-subspace | corrected | Replaced the finite-set Fitting near miss by an explicit characteristic-zero supplier extension. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/torsion-hecke-image | corrected | Removed an unsupported algebra map between integral and torsion images. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/unitary-middle-hecke-image | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/deep-levi-level | corrected | Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.6/deep-unitary-level | corrected | Corrected _mem API. Corrected or sharpened the source excerpt and page locator to the actual defining/proving passage. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.9/taylor-wiles-deformation-problem | corrected | Kept unframed and framed global rings distinct. Corrected _forget API. Replaced the tame-definition excerpt on p.83 by the actual Taylor–Wiles definition on p.84. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.8/two-system-patching-data | corrected | Specified generic generalizations, rather than uniqueness of all generalizations. Checked 3 API items and 3 discriminating tests against the specified uses. |
| CL.9/prepared-pgl2-level | added | Added the missing construction from the proof of Proposition 5.6.1, pp.82–83, with four API items and four discriminating tests. Checked 4 API items and 4 discriminating tests against the specified uses. |

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`: zero errors and warnings. The shared source-finding validator and version-registry validator report zero errors. Local-node dependency graph: acyclic. All 87 routing rows (84 extraction rows plus three imported local-ring inputs), source excerpt matches, API/test counts, stage targets and the six-planet limit were checked. The synchronized reader and Lean catalogue contain every proposed name and API/test name.

`lean-check research/blueprint/suggested/CrystallineLocalGlobalCompatibilityCM.lean` elaborated successfully at the pinned Mathlib, with 31 warnings, all `declaration uses sorry`, and no errors. The file imports only Mathlib; it does not require the shared build’s Tau Ceti revision. No language server or Lake build/update/cache command was started. Six typed algebraic core nodes elaborate; this does not make the omitted arithmetic signatures implemented.

No blocking question for the orchestrator. Follow-up work is the precise 27 supplier requests, the unrestricted cubic-tetrahedral preparation argument, general-coefficient nonvanishing, AKT journal collation and genuine Lean carrier/signature completion. Keep all ten stages planned until these exports and prototype gaps are resolved. This review is complete; none of these supplier jobs is claimed in this run.
