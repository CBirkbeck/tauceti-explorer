# Independent review: counting bundles and Hall algebras of curves

Accepted as a complete target-level planning pass. Every node has a justified review verdict and every baseline citation was confirmed. Eleven explicit proof or supplier-interface gaps remain; all twelve stages are planned and none is closed. This acceptance makes no claim that the geometry or the proposed theorems have been formalised.

Reviewer: Codex — codex-wfyOVz, 2026-10-19, issue #3512. Review identity: `independent-review-REV-DESIGN-CountingBundlesAndHallAlgebrasOfCurves`. The design author was Codex — codex-jgfPvj, a different session. The bot confirmed claim comment 6257799998.

## Inventory and scope

The review covers all 82 nodes: 18 definitions, 11 constructions, 49 theorems, two comparisons, one lemma and one application. The packet's `review.checked` ledger records 59 verified and 23 corrected nodes, with no added or unverifiable nodes. No node was removed. All 29 definitions and constructions have at least three discriminating tests. The final packet contains 98 API items, 89 tests, 49 planets, ten baseline declarations, fourteen supplier requests and fourteen source findings. All catalogue routes retain their target assignments.

Every statement, hypothesis, source locator, proof sketch, prerequisite, API item, test, acceptance condition and use was checked. Stage targets are realised by the existing nodes; the internal prerequisite graph is acyclic. The reader carries the corrected specification, including its independent introduction, gap list and supplier contracts. Implementation statuses remain unchecked. Conjectural positivity and Hall-Lie conclusions retain their conjectural status.

## Mathematical corrections

**Positive Higgs categories.** The coherent Higgs category and its HN-nonnegative subcategory now have explicit interfaces. The latter inherits an exact structure; it need not be an abelian subcategory. Its semistability tests admissible positive subobjects and positive quotients. Its semistable locus generally differs from the intersection with the usual semistable Higgs locus. This distinction is explicit in MS14, p.2 and §3.1, pp.5–7. The corrected integration node keeps the positive invariants Ω_K⁺ separate from the usual invariants Ω_K, and invokes the relative factorisation before applying the eventual comparison of Corollary 3.3, p.6. Only after that comparison and degree-r periodicity is the cutoff removed.

Three API items were added for morphism extensionality/isomorphisms, positive exact-category closure and the eventual comparison. Two additional tests distinguish an exact category from an abelian subcategory and relative stability from unrestricted slope testing. On P¹, the sequence O(−1)→O²→O(1) detects failure of closure under arbitrary kernels. The existing Serre-duality argument retains the order Ext²(E,F)=Hom(F,E)* and the required slope inequality.

**Mellit deformation and global poles.** Definition 5.1 and Lemma 5.1 of M20, pp.315–319, require a rational λ-ring with compatible Adams operations and the stated injective localisation. Those hypotheses are now explicit. Theorem 5.2(i), pp.319–321, supplies global Laurentness of H^Sch=(1−z)A(z), after the exchange q_M=z and t_M=q. Part (ii) supplies its value at z=1. This separates the integral Laurent target H from the Q(q)-coefficient Laurent expression H^Sch.

Regularity only at z=1 would leave possible poles at other roots of unity. The new regression A(z)=1/(1−z²), H^Sch=1/(1+z), detects that error. The corrected identification uses global Laurentness to exclude those other poles and Taylor regularity at zero to remove negative powers. The remaining polynomial prefix does not affect eventual coefficients. Residue/Fourier extraction then gives the same count in every degree. Generic Macdonald admissibility remains the explicit supplier obligation G8.

**Framing bound.** G7 is discharged by a sufficient explicit choice, relative to the requested strong-generation criterion. For g≥1 and coprime r>0,d, set ℓ=2g−2 and B=d/r−(r−1)ℓ. Choose the least nonnegative integer d₁>2g−1−B and let l₁=(1−g+d₁)r+d. Choose d₂ at least max(d₁+2g,2g+d+(r+1)d₁,0), with d₂−d₁≡1 mod l₁, and put l₂=(1−g+d₂)r+d. The strict generation inequality holds for the required sheaves by the HN spread estimate. For a kernel K of the fixed-source quotient L₁^l₁↠F, its rank t=l₁−r and degree −l₁d₁−d give μ_min(K)≥−d−(r+1)d₁ when t>0. The zero kernel is handled separately; torsion sheaves satisfy the same strong-generation requirement directly.

This proves the claimed sufficient choice for every line bundle of the selected degrees. Coprimality follows from l₁≡d mod r and l₂≡r mod l₁. The displayed determinant bound then gives the characteristic cutoff. For g=2,r=2,d=1 the recipe gives d₁=5,l₁=9,d₂=24,l₂=47 and C=423. The cases l₁=1 and t=0 were checked. S16 §6.1, p.336, §6.3 Lemma 6.1, pp.338–339, §6.5, pp.340–341 and §6.7, p.344, support the geometric application; the computable strengthening is justified by the proof in the node rather than attributed to a displayed formula in the paper.

**Existing ownership.** `RG2.3/lang-theorem` already states the general finite-field Lang theorem. The neutrality, Galois-orbit and stable-count nodes now cite it directly. The remaining request is its application to unit groups and extension fields. Connected-band H² existence remains separate in G1.

The current ET.0 packet already contains `ET.2b/hitchin-moduli-stack`, allowing the canonical twist, and `ET.2b/schiffmann-boundedness`. The canonical carrier and existential good-line theorem are imported from there. New work is confined to the coherent/positive interfaces, computable bound and full stable canonical coarse geometry. The ET boundedness statement's kernel clause quantifies over arbitrary source dimension; this review uses only the fixed l₁ version and records the issue in `upstreamNotes` without editing ET. General character-linearised GIT remains a requested R09.5 continuation; finite-inertia coarse moduli do not supply a scalar-gerbe quotient.

Current upstream AlgebraicVectorBundles and QuiverRepresentations were read, including the relevant suggested declarations. General bundle constructions and quiver Krull–Schmidt are imported. The current Tau Ceti library and the reviewed library-coverage audit were checked for overlaps. No generic Lang theorem, generic bundle carrier or generic quiver theory is replanned. The third restructuring proposal was narrowed accordingly. The SF.3 request now distinguishes existing locally free Riemann–Roch/Serre duality from the coherent, two-variable natural Ext¹ duality required here. The reader's dimension convention explicitly assumes g≥1.

## Node correction ledger

The following are all 23 nodes marked corrected. Other node verdicts and their individual reasons are in the packet.

| Node | Correction |
| --- | --- |
| `CB.1/finite-field-neutrality` | S16 Lemma 2.6, p.311: connected-band H² gives existence, Lang H¹ gives uniqueness. Replaced obsolete broad Lang request by the existing RG2.3/lang-theorem; G1 remains. |
| `CB.1/galois-orbits` | S16 Lemma 2.6 and (2.4)–(2.5), pp.310–311: residue extension degree equals orbit size and divides rank/degree in the stated divisor formula. Cited existing Lang node directly. |
| `CB.3/green-pairing` | Read S16 pairing on p.316 and HN10 coproduct on pp.2–3. Corrected the pairing locator and separated the second source; automorphism weights and tensor twist are retained. |
| `CB.3/flag-pairing` | Corrected source to S16 §4.2 (4.1), p.316. Its ordered Euler sum and total-cutoff pairing give precisely the flag mass; §3.3 (3.3) was the wrong formula. |
| `CB.4/eisenstein-series` | Corrected S16 series locator to §4.3, pp.317–318, and cutoff §4.4, p.319. Coherent/bundle torsion factor and regional coefficient completions match. |
| `CB.4/harder-hecke` | Corrected to S16 §4.3 Theorem 4.2(ii), p.318. The Hecke commutation uses the specified q-shifts and expansion region, rather than part (i). |
| `CB.4/harder-coproduct` | Corrected to S16 §4.3 Theorem 4.2(iii), p.318. Extended coproduct, rank split and shifted arguments agree with its displayed identity. |
| `CB.4/bundle-residue` | Corrected to S16 §4.3 Theorem 4.2(iv), p.318. Ordered normalized residues and rank-dependent prefactor agree with the bundle series, not ordinary differential residues. |
| `CB.4/hn-relations` | Corrected equation (4.4) to S16 §4.4, p.319. HN product order and coefficientwise finite support are part of the equality. |
| `CB.4/spherical-algebra` | Corrected S16 spherical locator to §4.5 and separated HN10 §1.3. Generic quivers are imports; this is the curve-specific torsion/rank-one subalgebra in its HN completion. |
| `CB.4/hn-membership` | HN10 Theorem 3.1 proof and Corollary 3.5 were read through p.8, with S16 §4.5 Theorem 4.3. Corrected the locator omitting the last page and the S16 section. |
| `CB.4/generic-form` | S16 Theorem 4.4 is in §4.5; SV12 §1.11 uses a different coefficient formulation. Corrected locator and retained G3 for invariant, pairing and half-q normalization descent. |
| `CB.4/universal-counts` | Corrected S16 §4.5 corollaries versus §4.6 proof distinction. K_g specialization and uniqueness use the explicit density obligation G4, not a presumed equidistribution stage. |
| `CB.5/torsion-separation` | Proposition 5.1 belongs to S16 §5.1, pp.321–323. Corrected locator; the node already fixes the rank/variable misprints and preserves the exact torsion factor. |
| `CB.7/canonical-higgs` | S16 §6.2 and MS14 pp.2,5–7: added positive exact category, relative stability and large-degree comparison; imported existing ET.2b carrier/boundedness, added morphism extensionality and discriminating tests. |
| `CB.7/cotangent-moment` | Corrected the dual tangent locator to S16 (6.2), p.340, and moment formula to (6.3), p.341. Dual exact sequence and annihilator of scalar Lie algebra agree. |
| `CB.8/framing-cutoff` | Verified the explicit sufficient bound from HN spread, torsion generation and the fixed-source kernel estimate, including zero kernels and l1=1. Corrected source locators; discharged G7 relative to the requested generation criterion. |
| `CB.8/stable-higgs-count` | S16 Theorem 1.2: each coprime indecomposable contributes q^(1−χ)=q^D after scalar-gerbe conversion. Cited existing Lang node directly; characteristic-bounded geometry remains separate from MS14. |
| `CB.8/higgs-hall-integration` | MS14 Theorem 1.2 and §3.1: separated positive relative slope factors and Ω_K^+ from usual semistable factors and Ω_K. Added the precise normalized factorization and retained correct Ext² order. |
| `CB.8/all-characteristic-count` | MS14 Theorem 4.3/Corollaries 4.4–4.5: updated proof to use relative positive HN factors and Corollary 3.3 before eventual comparison and degree-r periodicity remove the cutoff. |
| `CB.10/admissible-deformation` | M20 Definition 5.1/Lemma 5.1: made the λ-ring hypothesis explicit alongside localization injection and compatible Adams operations. Generic admissibility remains the precise G8 supplier obligation. |
| `CB.10/z-one-regularity` | M20 Theorem 5.2(i)–(ii), M18 Theorem 7.1/Corollary 7.2: separated integral H from global Laurent H^Sch=(1−z)A over Q(q), and added a root-of-unity counterexample to using local regularity alone. |
| `CB.10/mellit-identification` | M20 Theorems 1.1/5.2: replaced the invalid local-regularity inference by global Laurent pole exclusion, Taylor regularity at zero and Fourier extraction. Hence the surviving eventual coefficient is independent of degree. |

The roadmap definition's descriptions and direct stage requirements were synchronised with the Lang, canonical-carrier and Mellit corrections. No new node was necessary at target granularity. Every source was stated in our own words; no source passage or excerpt was added.

## Exact pinned baseline

All ten incoming references were confirmed under their recorded names at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was removed, replaced or added. Each entry's `provides` field remains within the actual signature.

| Declaration | File and line at the pin | Scope checked |
| --- | --- | --- |
| `TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` | `TauCeti/RingTheory/KrullSchmidt/DirectSum.lean:154` | Finite decompositions, local endomorphisms on one side and indecomposable nonzero summands on the other; no finite-length condition on the ambient module. |
| `TauCeti.isLocalRing_end_of_isIndecomposable` | `TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean:263` | Finite-length indecomposable module has local endomorphism ring; coherent transfer is still a target. |
| `IsArtinianRing.isNilpotent_jacobson_bot` | `Mathlib/RingTheory/Artinian/Ring.lean:54` | Artinian-ring Jacobson radical is nilpotent. |
| `IsArtinianRing.isSemisimpleRing_iff_jacobson` | `Mathlib/RingTheory/Artinian/Module.lean:650` | Under Artinianity, vanishing radical characterises semisimplicity. |
| `Matrix.card_GL_field` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:99` | Finite-field general linear group cardinality; it does not enumerate nilpotents. |
| `YoungDiagram` | `Mathlib/Combinatorics/Young/YoungDiagram.lean:66` | Existing finite lower-closed partition carrier. |
| `YoungDiagram.transpose` | `Mathlib/Combinatorics/Young/YoungDiagram.lean:186` | Coordinate swap, exchanging row and column lengths. |
| `YoungDiagram.armLength` | `TauCeti/Combinatorics/Young/HookLength/Basic.lean:136` | Row length minus column index minus one, with natural subtraction. |
| `YoungDiagram.legLength` | `TauCeti/Combinatorics/Young/HookLength/Basic.lean:140` | Column length minus row index minus one. |
| `Finite.isDomain_to_isField` | `Mathlib/RingTheory/LittleWedderburn.lean:173` | A finite domain is a field; the residue division algebra has the needed hypotheses. |

## Sources and independent reading

The six incoming PDF hashes were independently matched. Public versions, URLs and hashes are recorded in the packet. Its inherited whole-article reading notes describe the design pass. This review independently read every node's cited passages and the finding locations, including the following ranges:

- [S16, published Annals article](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf): the referenced targets from pp.299–358, including the cited appendices and all fourteen finding locations.
- [M20, published Inventiones article](https://link.springer.com/content/pdf/10.1007/s00222-020-00950-1.pdf): pp.302–303 and 310–321, including Proposition 3.1, Definition 5.1, Lemma 5.1 and Theorem 5.2.
- [MS14, arXiv v1](https://arxiv.org/pdf/1411.2101v1): pp.1–10, including the positive-category conventions, relative HN factorisation, Corollary 3.3 and the all-characteristic count.
- [HN10, arXiv v1](https://arxiv.org/pdf/1002.0987v1): pp.1–8, through the proof of Theorem 3.1 and Corollary 3.5.
- [SV12, arXiv v1](https://arxiv.org/pdf/1009.0678v1): §1.11, pp.13–14; the coefficient-ring and Hopf-pairing comparison remains G3.
- [M18, arXiv v2](https://arxiv.org/pdf/1605.01299v2): selected §5, pp.19–21, §6, pp.23–26 and §7, pp.29–31. Its earlier graph-combinatorial admissibility proof remains G8.
- [Deligne, Weil II](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf): §3.5.1–3.5.3, pp.210–211. This newly recorded source confirms the attribution in E12; it does not close universal-family monodromy or its application in G4.

Locator corrections include the Green pairing on S16 p.316; flag formula (4.1) in §4.2; Eisenstein series in §4.3 and cutoffs in §4.4; Theorem 4.2(ii)–(iv), p.318; spherical/generic statements in §4.5, pp.319–321; Proposition 5.1 in §5.1, pp.321–323; the dual tangent formula (6.2), p.340 and moment formula (6.3), p.341. Multiple sources now have separate locator entries instead of attaching one paper's section number to another.

## Source findings

All fourteen incoming `sourceIssues` have independent `confirmed` verdicts with reasons and this job's identity. None was rejected and no additional finding was necessary. These findings concern the following specific statements; they do not assert that the main counting theorems are false.

| Finding | Location in S16 | Confirmed correction or obligation |
| --- | --- | --- |
| E1 | Lemma 2.4, p.309 | Repeated summands contribute full matrix radical blocks; dimensions scale quadratically in multiplicity. |
| E2 | §4.2, p.316 | The torsion commutation exponent includes the bundle rank. Equation (4.3), p.317, checks the normalisation. |
| E3 | Proposition 5.1, p.322 | Align the rank tuple, variable order and final Y-variable with the defined pairing series. |
| E4 | §5.6, p.332 | The total Jordan class is the multiplicity-weighted sum. |
| E5 | §5.7, p.334 | The direct coefficient formula counts the HN-truncated objects; residues recover full counts. |
| E6 | §6.2, p.337 | Stable coarse dimension is 2D; its scalar-gerbe stack dimension is 2D−1. This does not give a dimension theorem for every unstable stratum. |
| E7 | Lemma 6.5, p.345 | The moment map annihilates diagonal scalars. Restrict to the invariant central line before taking the quotient. |
| E8 | §6.11, p.351 | The degree-i Hitchin coefficient has weight i under Higgs scaling. |
| E9 | Equations (6.11)–(6.12), pp.351–352 | Affine rank a shifts compact cohomological degree by 2a and Tate twist by a. |
| E10 | Corollary 1.4, p.301 | Reciprocal-count prefactor is q^D and component classes occur in degree 2D. Rank one checks both. |
| E11 | Examples, p.306 | The rank-three/four genus polynomials are origin constants, not the full counting functions. |
| E12 | Appendix B, p.357 | The equidistribution reference is Weil II Theorem 3.5.3, p.211. |
| E13 | Theorem 7.1/§7.2, pp.352–353 | The parallel localised Hall calculation does not by itself remove parabolic denominators. The R_g target is retained with G10. |
| E14 | §6.3–6.4, p.339 | Hom-frame isomorphisms do not force each restricted evaluation to be onto. The corrected open requires both surjections. |

For E14 the packet records an explicit genus-two example: deg L₁=−5, F=(L₁⊗M)⊕B with M nonspecial effective of degree two, h⁰(M)=1, and deg B=4. The Hom dimension is nine and the Ext¹ group vanishes, but the first evaluation has base points. A sufficiently negative second line generates F, so both Hom frames can be isomorphisms without the first restricted evaluation being onto. This tests exactly the missing open condition. E13 is a proof-closure obligation, not a counterexample to the parabolic theorem. The recorded public correction searches are bounded and do not establish novelty.

## Validation and follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/CountingBundlesAndHallAlgebrasOfCurves.json` passes with zero errors and zero warnings. Intake file checks and `git diff --check` pass. A separate consistency check matches all 82 node statements, hypotheses, prerequisites, source locators, proof steps, acceptance conditions, API items, tests and uses against the reader, together with all fourteen request texts and eleven gaps.

The unchanged 185-line suggested Lean file was independently elaborated with `lean-check` at the pinned shared build: exit zero, with only permitted declaration-placeholder warnings. Available memory was checked before the serial run. `scripts/check_sorry_data.py` also passes. Its seven definitions have real bodies; its arithmetic, matrix and partition statements use existing carriers. The geometric targets remain in the reader. Elaborating these signatures does not prove the admitted statements or implement the missing geometry. No Lean language server or library build was started, and no background compilation remains.

The orchestrator should retain the eleven named gaps G1–G6 and G8–G12: connected-band H²; primary nilpotent enumeration; the invariant generic Hall form; universal-family monodromy/density; BB–Hesselink; full canonical moduli and tightness; generic Macdonald admissibility; universal positivity/origin evaluation; parabolic denominator removal; constructible Hall Hopf theory; and spread-out/complex cohomology comparison. G7 alone was discharged. All fourteen requests remain precise integration or extension contracts.

Questions for orchestration are which follow-up jobs should implement the R09.5 character-GIT continuation, the QM.0 λ-ring/Macdonald continuation and the LPV/DWP universal-family density continuation, and how to apply the fixed-source boundedness correction to the ET owner. The packet's three restructuring proposals and `upstreamNotes` give their scope. Do not create another Lang or canonical-carrier plan. No foreign roadmap, library audit, atlas promotion file or upstream checkout was changed.
