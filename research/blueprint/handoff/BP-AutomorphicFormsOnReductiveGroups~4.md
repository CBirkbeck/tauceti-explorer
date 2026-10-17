# Automorphic forms on reductive groups — revision 4

Job `BP-AutomorphicFormsOnReductiveGroups~4`, issue #10103. Agent: Codex; session `codex-O1zLUr`. Completed revision for independent review, not a checkpoint or implementation claim. This run claimed only this job.

## Delivered

The packet is `complete`, with the same 100 node IDs: 26 definitions, 25 constructions and 49 theorems. It retains all 311 API items, all 209 previous definition/construction tests and 30 planets; three general-group tests bring the test count to 212. There are 57 baseline declarations, 43 supplier requests, 23 explicit construction/source-proof refinements and 36 sources. AF.0, AF.1, AF.1a, AF.2, AF.3, AF.4 and AF.5 are all `planned`; zero stages are `closed`. Every implementation status remains `unchecked`.

The previous `review` object, every `reviewHistory` entry, all nineteen source findings (including rejected E8), and the historical `restructure` proposals are preserved. This revision does not accept itself. No other packet, review, supplier, registry, campaign or atlas file was edited.

## Revision findings addressed

The remaining finding in `REV-AutomorphicFormsOnReductiveGroups~3` concerned the missing first and third conclusions of `AF.4/bhr-large-weight`. Its packet and reader contracts now distinguish:

1. Arithmetic essential temperedness: a uniform bound is chosen before the coherent weight, actual discrete automorphic occurrence and degree. For semisimple parameter `(k−1,l−2)`, each of the four type-C₂ coroot evaluations must be zero or strictly farther than the bound from zero, at every real place. The source's sufficient weight inequalities use a possibly different constant. Discrete occurrence, weighted central norm/unitary twist and tensor-central balance are actual prerequisites.
2. Pilloni's local two-limit classification at large negative first parameter, preserving the corrected sign, parity, coefficient and essentially-unitary hypotheses.
3. A degree-zero implication for every irreducible admissible module on the selected Hodge component, without a large-weight or preselected-model assumption; and, under essential temperedness, the three class/degree cases, dimension one and vanishing in every other degree for the fixed coefficient. The boundary is `l≥2`. Full disconnected-group induction and its antiholomorphic partner are distinguished from the chosen holomorphic component.

Four intended theorem names identify those contracts. The reader also separates the local all-degree classification from the geometric interior comparison's `i≤1` and non-Eisenstein localization hypotheses. Root-wall Checks include the permitted `l=2` wall, a nearby compact wall, strict equality at the threshold, the `l=1` excluded lowest-weight module, and several-place degree addition.

The other review corrections remain: actual differentiated Lie actions; finite compact-type multiplicity; real versus complex archimedean reciprocity; smooth automorphic-subspace topology; cusp-kernel compactness and density obligations distinct from pointwise rapid decay; the Maass `p^(−1/2)` raw-Hecke factor; fundamental-Cartan/compact-centre scope; tensor balance before central quotient; field of rationality versus field of definition; and class-set versus effective-stabilizer finiteness.

## Generality and existing suppliers

The foundational automorphic, cuspidal, admissibility, tensor-factorization and spectral interfaces are explicitly for every connected reductive group over a number field. They impose no splitness, quasi-splitness, genericity or multiplicity-one assumption. GL_n and GL₂ are specializations. New product and inner-form Checks distinguish this scope. Hermitian coherent theory, the GSp₄ classification and GL_n reciprocity/rationality retain their narrower hypotheses.

Current upstream ownership was checked against main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only:

- [ReductiveGroupsPartII #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785): actual points/topologies, Weil restriction, local integral/hyperspecial models and Cartan/Iwasawa interfaces. Local model existence does not discharge the stronger global spreading-out request.
- [AdelicAlgebraicGroups #792](https://github.com/TauCetiProject/TauCetiRoadmap/pull/792): adelic groups, diagonal/central quotients and measures, parabolics, reduction/heights, finite class sets and level/Hecke geometry.
- [SmoothRepresentationsOfLocalGroups #793](https://github.com/TauCetiProject/TauCetiRoadmap/pull/793): finite-place smooth/admissible categories, compact-open invariants, Hecke modules, induction/Jacquet and Satake. This PR merged on 2026-10-14 and is on main, although the issue described all four suppliers as open. It does not supply archimedean Harish-Chandra theory.
- [AutomorphicSpectralTheory #925](https://github.com/TauCetiProject/TauCetiRoadmap/pull/925), checked head `64380dd10f4e9f85e4b0253a6cf1aad53b336cf2`: §§4.1–4.6 supply the complete general-G Hilbert spectral transform and actual discrete occurrences, including residual constituents. Nonunitary twists require the specified norm comparison. §4.10 Wallach is a separate input with central-reduction hypotheses. §0.51 already supplies normalized constant terms in stages; AF retains conjugation/maximal-standard and convention compatibility.
- [ArithmeticLocallySymmetricSpaces #871](https://github.com/TauCetiProject/TauCetiRoadmap/pull/871), checked head `e7e16145f2be8db4cddbda88b2ccab63f1bb52fd`: ALS.F.1 and ALS.F.5–F.7 now own overlapping real-point, cochain, automorphic/constant-term/cusp and coefficient foundations; ALS.4.5 also owns full-Levi Kostant theory and splitting-characteristic-zero descent. Corresponding AF IDs remain only as the finer compatibility contracts, with explicit `supplierContract`/`upstreamContracts` records. No second foundation, Laplacian proof or descent construction is proposed.

Existing DifferentialGeometry forms/de Rham theory, RealAlgebraicGeometry finite-cell results, GlobalNumberFields algebraic Hecke characters and ReductiveGroups adjoint Kostant-lattice stability remain imports. The latter does not prove arbitrary coefficient group-stability without integral-model/coaction data.

The preserved historical restructuring text has older ownership directions. Current supplier contracts take precedence: packaging must redirect those old registry routes, retain AF's extra compatibility requirements and avoid an ALS→AF→ALS cycle. The internal 100-node graph is acyclic; no combined external stage-graph closure is claimed.

## Suggested file and the current shape rule

The inherited 13,354-line file contained admitted data carriers. WORKERS.md's binding 2026-10-12 shape requires only light real-bodied definitions and representative statements on carriers available at the pins, with heavy unavailable-carrier targets in the reader. The replacement follows that rule, with generic growth/equivariance/compact-orbit/kernel predicates, stable local lattices, nonzero torsion eigensystems, algebraic-form equivariance and explicit coroot computations. Every definition/construction target is also identified in its closing comment.

Consequently the old exhaustive native-declaration inventory is not a compilation claim for this revision. All main/API/test contracts remain in the reader, including the complete three-part BHR statement and four intended theorem names. Their actual discrete-occurrence and Hodge-cohomology carriers are unavailable at the pins, so they are reader targets rather than theorems over admitted carriers. Numerical coroot Checks are not counted as the representation-theoretic conclusions. This resolves the mathematical omission while applying the current shape rule instead of reinstating the older admitted-carrier approach.

## Source reading and limits

All new source descriptions state the needed results in our own words. No passage or source-by-section synopsis is deposited. The maintainer-cleared Pilloni PDF was read in place, without copying its file, pages or extracted text. No uncleared book copy was used.

- BCGP21, arXiv:1812.09269v3, §3.10: Theorem 3.10.1, p.70; Hodge pair/coefficient setup, p.72; arithmetic regularity, essential temperedness and local three-case argument, p.73.
- Pilloni, author version of *Higher coherent cohomology and p-adic modular forms of singular weight*, §15.2.1–§15.2.3, pp.107–108, especially Theorem 15.2.2.1 and the following specialization supporting the sign correction.
- Pitale–Schmidt, arXiv:0809.0482v1, §§2.1–2.4, pp.3–7; particularly §2.3, p.6, equation (2), the unique irreducible lowest-weight module and the `l≥3`, `l=2`, `l=1` distinctions, and §2.4, pp.6–7, central extension/disconnected induction. This is the added source. Its deeper analytic realization proofs were not audited.
- Calegari–Geraghty, arXiv:1907.08691v1, §§2.0.1–2.0.2, pp.6–9, and §5.3, pp.21–23, for the coroot, coefficient and parameter conventions.

The public BHR publisher endpoint presented an access challenge. The original proof of Theorem 4.2.3/Proposition 2.4.5 was not read, and remains an explicit proof-source refinement. BCGP and Pilloni supply the inspected statements; they are not represented as an inspection of the original proof. Other prior source/proof limitations remain in the 23 gap records.

## Validation and next step

- Packet checker: zero errors and warnings; the counts above and seven planned/zero closed stages.
- Preservation/correspondence audit: all 100 IDs, all 311 API items and all 209 previous tests retained; every main/API/test name appears in the reader; every definition/construction has at least three specified tests. Review/history, source findings and historical restructure objects are unchanged.
- Suggested elaborates with `lean-check` in the existing shared pinned build, exit 0, with only declaration-uses-`sorry` warnings. It imports Mathlib only; this is not a new compilation check of individual Tau Ceti imports or the removed inventory. Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; packet Tau Ceti baseline: `f790474821cf4256814db967cb154e7af3d0c369`. Memory was checked before compilation. No library build, update, cache download or language server was started.
- Intake file check and whitespace/scope checks pass for the four deliverables.

The next step is independent revision review, especially the BHR quantifiers, component/central conventions, source boundaries and current supplier imports. After acceptance, packaging uses the current supplier contracts and resolves the recorded registry routes. The 23 refinements and 43 requests remain construction/proof work, not missing target coverage or implementation claims. No scratch artifact is required to resume.
