# REV-ShimuraData~2: independent revision review

Reviewer: Codex (GPT-6), session `codex-9lFWhH`. Date: 2026-10-08. Issue: [#7091](https://github.com/CBirkbeck/tauceti-explorer/issues/7091). The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7091#issuecomment-6052200174) was confirmed by the bot. This session wrote none of BP-ShimuraData or BP-ShimuraData~2; the revision under review was written by `codex-HpHgRn` for #7009.

**Verdict: needs_changes. This is a completed independent review, not a checkpoint.** Most first-review defects are repaired. Nine named prototypes still state different or insufficient conclusions, including one that assumes its exact conclusion. The packet records each in `review.checked` and a precise gap. Honest supplier leaves and expressly omitted unavailable hypotheses are permitted by PROTOCOL §13 and are not the reason for this verdict.

## Coverage and counts

All 122 input nodes were checked for source locator, hypotheses, direct prerequisites, proof outline, granularity, API, tests, prototype and planet. The added integral GL₂ calculation brings the final register to 123 nodes. Every node has an individual review note; none is deferred.

| Stage | Input nodes | Final nodes | Verified | Corrected | Unverifiable | Added |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| D0 | 5 | 5 | 5 | 0 | 0 | 0 |
| D1 | 25 | 25 | 23 | 2 | 0 | 0 |
| D2 | 13 | 13 | 11 | 2 | 0 | 0 |
| D3 | 27 | 27 | 25 | 2 | 0 | 0 |
| D4 | 15 | 15 | 12 | 3 | 0 | 0 |
| D5 | 37 | 38 | 23 | 5 | 9 | 1 |
| Total | 122 | 123 | 99 | 14 | 9 | 1 |

The final packet has 19 definitions, 25 constructions, 53 lemmas and 26 theorems; 140 definition/construction API items plus two equivalence interfaces; 132 unit tests; 27 planets; 38 baseline citations; 26 supplier requests; and 11 gaps. Fourteen nodes receive `corrected`; the Hilbert datum also receives test corrections but retains an unresolved API defect and is counted as `unverifiable`.

`status: complete` denotes a finished planning pass, not implementation. All six stages remain `planned`, with zero `closed` stages and all 123 implementation statuses `unchecked`. The D0–D5 target register is represented by nodes or supplier inputs. The remaining signature defects do not erase their mathematical specifications. Planet counts are 1,4,4,6,6,6; all names are mathematical noun phrases within the limits, and none needs changing.

## First-review corrections checked

The full [first report](REV-ShimuraData.md) and the revision handoff were read. Its five substantive revision groups have the following outcomes.

| First-review requirement | Revision result |
| --- | --- |
| Graded S-representation/Hodge equivalence, lawful inverse coaction, both round trips, tensor/dual/Tate and conjugation | The finite real comodule and graded Hodge categories, actual functors and comparisons are retained. Conjugation follows from the split-coaction Galois equation. Pure native decomposition remains an input. This review also restores finite support in the named internal-sum API. |
| Complex h-orbit, integrability, bounded symmetric domains, uniqueness and actual orbit differential | The named geometric outputs replace unrelated bracket/J identities. Complex quotient proofs remain honest supplier leaves. This review installs chart instances in three tangent signatures and imports native separation/countability. |
| Flat holomorphic variation, actual homogeneous filtration, connection-compatible maps, horizontality and isotropic compact dual | The revised carriers and maps retain these objects. Rational/integral scalar-extension and sheaf comparisons are explicitly missing conditions. The Siegel dual now uses Lagrangian subspaces. |
| Rational torus specialness, actual elliptic cases, connected adjoint witnesses and rational weight | Rational Hopf torus immersions replace abstract commutative subgroups. The abelian witness includes the derived-to-adjoint square, while preabelian type uses connected domains. Rational weight is actual cocharacter descent. Independent elliptic classification remains a named H0/H1 leaf. |
| Actual example μ/domain/reflex, compact Cartan, rational trace immersion and freeness from neatness | Most named outputs are restored. The compact Cartan is a real matrix subgroup with a separate character lattice. Trace immersion and real conjugacy are retained. Freeness starts from rational neatness and an algebraic effective quotient. The residual Hilbert determinant API and Iwahori level theorem are listed below. |

All further clear corrections in the first report were checked: MT contains the image of the weight rather than an unconditional Gm; MT connectedness and polarizable reductivity remain separate nodes; real component finiteness remains separate; finite grading and its constructor/extensionality are present; Borel injectivity retains SV1 and central weight; Schubert closures are loci rather than disjoint scheme unions; a supplied fixed central-isogeny lift is unique; adjoint injection uses the finite joint kernel; reflex flag descent is a complex base-change comparison; representation independence applies after extension to subfields of ℂ; and V0 remains downstream of D5. The strong Iwahori conclusion is now correct in the packet, but its named prototype still omits it.

The first review's source, ownership and proof-leaf corrections are preserved. No source excerpt remains in the packet. The reader contains all node statements, hypotheses, proof steps, API statements, tests and acceptance prose, including this review's changes.

## Corrections made in this review

1. **D1 decomposition API:** `hodgePieceInternal` now states both internal direct sum and finite nonzero support under the existing `Module.Finite` hypothesis.
2. **D1 rational weight:** reversed `Supplier.inverseDiagonal` to `O(S)→O(Gm)`, the coordinate arrow for the cocharacter Gm→S. The previously reversed arrow could not compose contravariantly with an S-map.
3. **D2/D3 tangent signatures:** installed the supplied `A.charts` in `complexStructureOperator`, `hodgeIntegrability` and `compactDualTangent`. Pinned `TangentSpace` requires the charted-space instance.
4. **D2 orbit separation:** added the two native quotient instances to the baseline and prerequisites. The local prototype now includes the quotient-to-h-orbit homeomorphism and its conjugation formula, alongside imported Hausdorffness and second countability. The faithful real-representation/local-chart comparison remains an explicitly omitted supplier condition.
5. **D3 GL₂ cocharacter test:** replaced generic orbit membership by the characteristic polynomial `(X−z)(X−1)` for every cocharacter in the actual GL₂ μ-class, using the specified algebraic point evaluation. It detects the weights 1 and 0.
6. **D4 category/product:** removed the false arbitrary datum inclusion test. For g↦(g,1), the image of h is `(h,1)`, which generally is not in the second datum's orbit. The replacement pairs two datum morphisms and tests their projection equations. `productMaps` now states uniqueness and has role `universal-property`.
7. **D4 product examples:** replaced abstract commutator, Boolean cardinality and group-product identities by tests on `productDatum`: two torus data have a singleton zero-dimensional domain; GL₂×GL₂ has dimension two and four components; product with the trivial torus datum is a datum isomorphism.
8. **D4 adjoint examples:** replaced unrelated group/Möbius identities by actual adjoint datum tests. The component caveat now uses F=ℚ(√2): G* has two components, its full adjoint domain has four, and the canonical domain injection is not onto.
9. **D5 level tests:** `levelPrincipal` no longer assumes neatness of every principal level to conclude level three. It states neatness of the actual K(3) in GL₂(𝔸f). The full-level non-example now tests GL₂(Ẑ), which contains −I.
10. **D5 component test:** `gammaGl2` now uses the rational Möbius action and principal finite-adelic level; its characterization includes positive determinant and an integral invertible matrix congruent to I. The generic restatement of subgroup membership was insufficient to test the promised example.
11. **D5 Hilbert tests:** F=ℚ tests now state actual datum isomorphisms for both G and G*. `hilbertNonHodge` now states the promised obstruction for the standard trace representation with nonscalar determinant. The old prototype asserted the stronger global negation of Hodge type without the requisite rational-character argument.
12. **D5 trace sign:** added `u≠0` to the negative `ψ(u,h(i)u)` assertion, since the value at zero is zero.
13. **D5 principal GL₂ lemma:** separated the non-routine integer torsion-root calculation into `ShimuraData:D5/gl2-integral-torsion-root`, marked `addedBy: REV-ShimuraData~2`. `gl2CongruenceNeat` now states the actual `neatLevel` conclusion for every conjugate principal adelic intersection. Added the finite-adele and GL base-change baseline carriers, AA.1 point/level input and the direct neat-level prerequisite. AA.3's rational lattice comparison stays an input, without a V0 cycle.
14. **Baseline qualification:** `TauCeti.Hodge.IsPolarization` is an integral predicate on a ℤ-bilinear form, not directly a predicate on a rational form. Its `provides` text now says so; its legitimate integral use and the rational H1 request are retained.
15. **Documentation/provenance:** updated source access dates, included Milne pp.63–64, corrected Deligne's source-register introduction locator from the erroneous §0 p.251 to pp.247–248, reissued all source verdicts in this review's name while retaining earlier verdicts, and synchronized counts, dependencies, tests, baseline rows and the remaining-work descriptions. Removed blanket claims that every named prototype already states its promised conclusion. The suggested-file introduction explicitly identifies the nine residual names.

The added GL₂ lemma is a local arithmetic application, not a second general reduction-theory or neat-level construction. Its argument is: determinant one makes the eigenvalues λ,λ⁻¹; if λ is torsion, the integer trace lies in [−2,2]; principal congruence gives N² dividing `2−tr M`; for N≥3 this forces trace two and λ=1. The original API name had conflated this calculation with the later adelic consequence.

## Nine remaining named-conclusion defects

These are precise revision tasks, not a request to implement unavailable suppliers. Existing auxiliary calculations can be retained under appropriate names. The planned theorem names must state their own conclusions on the specified supplier objects, with genuinely unavailable conditions omitted openly if necessary.

| Node | Current named prototype | Required conclusion |
| --- | --- | --- |
| D5/hilbert-datum | `hilbertDeterminantMap` repeats the GL₂ determinant/norm identity and does not use F or its embedding. | A rational datum morphism from the constructed Hilbert datum to the restriction-of-scalars norm torus, with the determinant coordinate map and Hodge compatibility. |
| D5/siegel-root-convention | `siegelRootConvention` is one rational-number subtraction. | Identification of the imported based roots/BP Borel, the compact/noncompact positive systems, rho and dominant cones. |
| D5/siegel-weyl-permutations | `siegelWeylPermutations` counts functions `Fin g→Bool`. | Reflected-index Weyl permutation comparison and minimal-left-representative cyclic criterion, with the 2^g count following from that comparison. |
| D5/kostant-sequence-geometry | The premise `rank` is exactly the universally quantified conclusion. | Derive the intersection dimension from membership in the specified Bruhat cell, with representative independence and constancy on that cell. |
| D5/gsp4-cg-roots | `gsp4CgRoots` checks parity of the coordinate conversion. | The CG root/coroot lists, simple roots, rho, dominant cones and comparison with the imported R7 root datum. |
| D5/gsp4-kostant | `gsp4Kostant` states only the final two coordinate actions. | All four minimal representatives, lengths 0,1,2,3, both longest elements and the stated reversal. These distinctions are the purpose of the node. |
| D5/gsp4-unitary | `gsp4Unitary` proves one matrix is unitary from two equations. | The actual K∞,1→U(2) group isomorphism, with the inverse block formula; continuity/Lie structure may use the recorded real-point supplier. |
| D5/gsp4-pilloni-convention | `gsp4PilloniConvention` consists of two additions of rational constants. | Comparison of the imported parity and dual lattices, corrected lower-Borel roots/coroots and rho, distinguishing the BP compact order. |
| D5/iwahori-neat | `iwahoriNeat` proves torsion-freeness of one supplied local generated eigenvalue subgroup. | For every k in the compact level, strong adelic neatness at the retained Iw₁ place, followed by rational neatness of all conjugate-level intersections. |

The math statements in these packet nodes agree with the cited sources or their explicitly derived specializations. `unverifiable` records the unresolved packet/prototype acceptance discrepancy. It does not accuse those mathematical statements of being false.

## Sources and source issues

All eleven public source PDFs were independently inspected at the recorded locators; all eleven SHA-256 hashes match the packet. Deligne and CG subscripts were checked visually. Read dates are 2026-10-08; source-version distinctions and hashes are retained.

| Public copy | Passages checked |
| --- | --- |
| [Milne, 2017 notes](https://www.jmilne.org/math/xnotes/svi.pdf) | §§1–3 pp.10–12,15–18,23–32,34; §§4–6 pp.44–45,54–59,63–64,67–69; §9 pp.91–95; §12 pp.111–113; Lemmas A.5–A.6 p.155. |
| [Deligne, published 1979 scan](https://publications.ias.edu/sites/default/files/34_VarietesdeShimura.pdf) | Introduction pp.247–248; §1.1 pp.251–256; §2.1 pp.265–267, from page images. |
| [Boxer–Pilloni, higher Hida author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) | Copy dated 2025-11-05, §§1.1–1.3 pp.2–5, §3.1 pp.33–34 and §6.1 p.60. |
| [Boxer–Pilloni, higher Coleman v1](https://arxiv.org/pdf/2110.10251v1) | §3.1 pp.31–32, especially Lemma 3.1.2. BL03 I Lemma 1 remains an unread proof leaf. |
| [Calegari–Geraghty, Duke advance publication](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) | §§2.1–2.2 PDF pp.7–11; Theorem 5.5 proof PDF pp.28–29. Final pagination is not assigned in this copy. |
| [Pilloni, 2019 author copy](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) | §§5.1.1–5.1.6 pp.20–24 and §15.2 pp.107–108. |
| [Bakker–Klingler–Tsimerman, published JAMS](https://par.nsf.gov/servlets/purl/10200187) | §1.3 pp.920–921 and §2.1 pp.922–923, PDF pp.4–7. Its polarized-variation application does not supply the bundle construction. |
| [Benoist, published IHÉS](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | §6.2 pp.93–95, especially Proposition 6.6 proof p.94, for the geometric variation example. |
| [Boxer–Calegari–Gee–Pilloni, published IHÉS](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | Definition 3.2.1 pp.201–202 and Lemma 7.8.3 proof p.409. |
| [Masser–Zannier, published Annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf) | §1.2 p.637; full GSp is the genericity target, without an elliptic MT classification proof there. |
| [Hansen–Johansson, published JLMS copy](https://pure.mpg.de/rest/items/item_3525265_3/component/file_3560933/content) | §4.1 p.1980, Definition 4.1 and preceding type definitions, PDF p.27; compatible connected adjoint data are required. |

All 16 source issues receive this review's independent `confirmed` verdict. E1–E4 concern the BP Levi, positive Levi-root criterion, cyclic inverse-index order and the cell/closure terminology; E5–E10 concern CG's second character exponent, Levi/full longest distinction, positive centralizer, transposed subgroup indices, missing odd exponential-kernel coset and fixed-coordinate parity; E11–E12 concern Pilloni's incompatible simple/coroot choices and rank-four identity; E13–E14 concern Milne's missing infinitesimal similitude scalar and inverse-diagonal weight; E15 is the generated-products proof gap in BCGP; E16 is the isotropic submodule stabilized by Pilloni's parabolic.

The qualifications matter: E4 changes words rather than correct closure formulas; E10 does not deny an abstract rank-three lattice isomorphism with ℤ³; E11 does not call the displayed positive system invalid, but its asserted simple pair and coroot are incompatible. For E15, diagonal eigenvalues 2 and −1/2 illustrate why checking individual torsion eigenvalues is insufficient. The positive-valuation ball is closed under multiplication and inversion, repairing the gap without changing the source lemma's truth. No new source mistake or author/publisher corrigendum is claimed. Previous extraction and review credit is retained.

## Baseline, ownership and closure

Every one of the 34 input baseline declarations was read with its surrounding hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All names and modules are confirmed. None was removed; `IsPolarization` was qualified as integral. The four additions were also read at the exact Mathlib pin:

| Added baseline declaration | Scope supplied |
| --- | --- |
| `QuotientGroup.instT2Space`, ProperAction/Basic.lean:206 | Hausdorff quotient of a topological group by a closed subgroup; closedness is an instance hypothesis. |
| `QuotientGroup.instSecondCountableTopology`, Group/Quotient.lean:142 | Second countability passes to subgroup quotients under the section's continuous multiplication assumptions. |
| `IsDedekindDomain.FiniteAdeleRing`, FiniteAdeleRing.lean:95 | Existing restricted-product ring/topology and canonical diagonal algebra map, specialized to ℤ,ℚ. |
| `Matrix.GeneralLinearGroup.map`, GeneralLinearGroup/Defs.lean:188 | Group base change along a commutative-ring homomorphism. |

Native pure Hodge decomposition/tensor/dual/Tate/Weil operations, lawful finite comodules, Hopf-ideal supremum, rational GL coordinate algebra, local systems and additive valuation operations are reused. None supplies the later Shimura comparison merely by sharing its carrier. The reviewed D0–D5 library audit and native Hodge/Reductive/Lie documents were checked; the local quotient result now avoids replanning native Hausdorffness.

All 26 supplier requests were compared with their owner's statement and RS-04/RS-23/RS-31 boundaries. Native R7 owns absolute root/Weyl/field flags; R9 owns integral cells and incidence; RG2.0a owns affine restriction, not nonaffine Resℙ¹; RG2.5 owns dualization, not a duplicate absolute root system. Pure/polarized Hodge inputs belong to H0/H1. CM.0 is consumed only by downstream D5, and V0 proves later arithmeticity/discreteness rather than serving as a D5 prerequisite. AA.3 supplies the rational adelic lattice comparison; AA.1 supplies point and compact-open level operations.

The existing precise stronger requests remain honest: AF.1 does not already provide the requested real algebraic homogeneous quotient bridge; native L2/L4/L8 do not by themselves provide all analytic/parabolic quotient charts; RG2.0 requires an extension for finite real components; LF0 requires the exact cyclotomic valuation identity; R7/SF.1 require parabolic-type representability/effective projective descent. Wolf's complex quotient proof, BL03 integral incidence, general parabolic-type representability and the independent elliptic MT classification were not newly established here. The review does not reject those admitted leaves.

Confirmed [RT-AREA-algebraicgeometry/27](../redteam/RT-AREA-algebraicgeometry.review.json) was checked. This packet and reader include H0→D1 and H1→D3 requests and direct prerequisites. The native outgoing graph and the Selmer L4, Compactifications C1 and AbelianSchemes A5 edges remain in `upstreamNotes` for the maintainer. No native roadmap or atlas data was edited, and no installed graph edge is claimed.

## Validation and handoff

- Packet checker with the exact pinned declaration index: **0 errors, 0 warnings**; 123 nodes and all six stages planned.
- Source-issue/version schema checks: **0 errors**; all 16 verdicts name this review. All eleven public PDF hashes match.
- Structural synchronization checks: all 123 node declarations, 142 API names and 132 labeled examples occur in the suggested file; every packet node's statement, hypotheses, proof steps, API/test and acceptance prose occurs in the reader. Every definition/construction has at least three tests, and every node has one review verdict. This establishes coverage of names and prose, not adequacy of the nine residual signatures.
- Individual import source paths exist at the relevant pins. Deliverable scope, JSON and whitespace checks passed.
- **Lean was not compiled.** No existing shared build has both required source commits. The available default build has the exact Mathlib pin and a different Tau Ceti revision. WORKERS prohibits constructing or updating a build; no Lean invocation, language server, build or cache download was started.

For the orchestrator: the review is complete and supports a further BP-ShimuraData revision focused on the nine rows above. Route the native graph note and stronger supplier extensions to their owners. There is no unanswered external question or unfinished audit blocking this submission. The permanent [handoff](../handoff/REV-ShimuraData~2.md) records where to resume; scratch is not required.
