# Independent review: MordellLawrenceVenkatesh, Part II

Accepted as a complete target-level planning pass, with explicit open dependencies. All eleven stages remain **planned**, and none is closed. This verdict uses PROTOCOL §0 and the review issue's allowance for honestly recorded gaps; it does not certify implementation or a closed prerequisite graph.

Reviewer: Codex, session `codex-hOjy3u`, job `REV-DESIGN-MordellLawrenceVenkateshPartII`, issue #3576. The designer was a different session, `codex-VNtbmR`. Review date: 2026-10-19.

## Inventory and coverage

The packet has 79 nodes: 17 definitions, 13 constructions, 10 comparisons, 33 theorems, five lemmas and one application. The individual verdicts are **43 verified and 36 corrected**; no node was added or removed, and none is left unverifiable. The packet's `review.checked` gives a separate mathematical note for every node. There are 94 API entries, 92 discriminating tests, 39 planets, four confirmed baseline references, 10 gaps and 12 requests. Every definition or construction has at least three tests.

All 39 Lawrence–Sawin and 22 Lawrence–Venkatesh items routed to this Part II have dispositions to existing nodes. The item sets were compared with both paper result files, and every disposition refers to a node in this packet. Every stage's targets remain represented. The internal node graph is acyclic. Stage dependencies and the roadmap's supplier list now reflect the corrected direct prerequisites. Definitions and key results stay at target level; the review does not turn proof sketches into a second lemma-level development.

## Mathematical corrections

- **Finite coefficient algebra.** The finite group-scheme construction in LS Examples 5.17–5.21, pp.45–47, now specifies the dual of the function algebra with convolution. Pointwise functions would give the wrong multiplication. An explicit dual-realization API and a C3 test distinguish Q[C3], which decomposes as Q times the quadratic cyclotomic field, from Q³. The earlier C2 example alone would not distinguish them.
- **Rational parabolic and Levi types.** The proof of the adapter to LS Lemmas 5.50 and 5.52, p.62, uses maximal E-split tori in the rational centralizer and conjugacy over E. An argument only about maximal geometric tori would not establish rational conjugacy.
- **Disconnected centers.** The central weight space uses the connected center of the identity component, with the Galois action on character data retained. This makes the convention meaningful for coefficient groups with disconnected orthogonal factors; see LS Definition 8.4, pp.74–75.
- **Induced Levi filtrations.** The unique fixed-point construction is restricted to a single parabolic orbit. It is not asserted on the whole ambient flag variety. In SL2, two fixed points on the projective line lie in different Borel orbits, which supplies a new distinguishing test. The LS source is Lemma 8.2 and Definition 8.3, pp.73–74.
- **Geometric monodromy.** The higher-dimensional theorem now asks geometric monodromy to contain the connected **isometry** group, while computing its adjoint profile in the similitude group, as in LV (10.1), p.968, and Theorem 10.1, pp.969–970. For an elliptic family, SL2 geometric monodromy need not contain the scalar direction of GL2. Finite type of the arithmetic models is explicit in the non-density targets, making their finite residue-disk reductions precise.
- **Point-count estimate.** The corrected 2N frequency cutoff in LV Lemma 12.1, pp.995–996, is retained. The proof now explains ambient-Tate cancellation and the elementary bounds between zero and the point count of the containing projective space, giving the normalized power-sum bound through frequency 2N. The assertion excludes N=0 and retains the bound 3b²/N.
- **Projective Hodge calculation.** The Jacobian formula explicitly assumes n≥2 and d≥2. The rational primitive summand comes from the complete-intersection theorem: the ambient middle Tate line in even dimension has nonzero self-pairing equal to the degree. LPV's radical quotient is not substituted for that summand, and general hard Lefschetz is unnecessary for this particular calculation. The source is Batyrev–Cox Theorems 10.6 and 10.13 and Remark 10.14, PDF pp.30–34, specialized to projective space, together with LV (10.6), pp.971–972.
- **Parameter dimension.** The correction record itself misidentified LV's printed formula. Published p.971 has binomial(n+d,d−1)−1. The correct dimension is binomial(n+d,d)−1. Plane quartics distinguish 14 from 19; plane cubics give 9 in both formulas and were an invalid distinguishing example.

The locator fixes are LS **Lemma** 6.3, pp.64–65; **Definition** 5.44, p.60; Lemma 8.2 and Definition 8.3, pp.73–74; Definition 8.8 and Remark 8.9, pp.77–78; Lemma 8.16, pp.81–83; and the Weil-restriction part of Theorem 9.2's proof, pp.85–86. The reader follows these changes.

## Prerequisites and ownership

The review read the cited supplier statements, including their restrictions and gaps. Broad imports were replaced by existing exact nodes for geometric purity, integral characteristic-polynomial factors, complete-intersection traces and cohomology, period domains/maps, proper p-adic comparisons, admissible tensor categories, Eulerian definitions, Hilbert schemes, resolution, abelian numerical classes and degree, Weil restriction, finite quotients, and Lefschetz theory. There is no separate reconstruction of these suppliers here.

Several written supplier contracts do not establish the stronger theorem this packet needs. The additional gap records local analytic Nullstellensatz beyond complex Weierstrass preparation, the tensor-compatible Sen/Wintenberger cocharacter-image theorem beyond admissibility, the graded regular-sequence Hilbert-series calculation, André normality beyond connected semisimplicity, and exact Eulerian variance and log-concavity with reflection/convolution closure beyond unimodality. The corresponding requests identify the extensions rather than claiming they are already proved by their cited stages.

The other nine gaps remain visible: relative crystalline coefficient comparison; general tensor-isomorphism torsors; disconnected complete reducibility and rational orbit descent; pure integral period-map Ax–Schanuel; the general Eulerian central limit theorem; Katz–Messing and correspondence-trace rationality; universal orthogonal monodromy and Beauville arithmetic finite index; the curve Shafarevich bridge through Torelli/descent; and the number-field comparison in the all-subvarieties finiteness clause. Each stage's `remaining` now names the gaps and precise supplier requests in its transitive chain. The stronger finiteness clause explicitly keeps its arithmetic comparison hypothesis.

Two ownership corrections matter for follow-up work. Current AdicSpaces §0.5 already supplies the Tate-algebra evaluation, Weierstrass and Noetherian inputs to the local transfer. Its stage is imported directly. LPV.5 already has both symplectic openness and a conditional orthogonal open-or-finite alternative. The remaining extension is the universal-family exclusion of the finite branch and Beauville's arithmetic finite-index theorem with its exceptions. It must not re-plan the existing conditional criterion.

## Baseline and duplication checks

All four references were checked by reading the declaration bodies and assumptions at the pins. None was removed or replaced.

| Reference | Pinned file and location | Scope confirmed |
| --- | --- | --- |
| `mathlib:Finsupp` | `Mathlib/Data/Finsupp/Defs.lean`, lines 88–94 | Finitely supported functions with their support/membership condition; the Hodge multiplicity carrier. |
| `mathlib:Ideal.iInf_pow_eq_bot_of_isLocalRing` | `Mathlib/RingTheory/Filtration.lean`, line 431 onward | Noetherian local ring and a proper ideal. The transfer uses localization before applying this result. |
| `tauceti:TauCeti.Cocharacter.parabolic` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`, line 293 onward | The dynamic parabolic functor on Hopf-algebra points. |
| `tauceti:TauCeti.Tannaka.fgPointTensorIsoEquiv` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean`, line 188 onward | Hopf-algebra points versus tensor automorphisms of finite-generated comodule scalar extension; not arbitrary pairs of fibre functors. |

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current library was also screened at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. That screen does not replace the pinned baseline.

The current upstream ReductiveGroups and AlgebraicVectorBundles reader documents were read in full. The declaration inventories of all nine newer directions listed in WORKERS were screened: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Relevant orthogonal-group and reflection carriers were inspected; they do not supply hypersurface-family monodromy. General vector-bundle, reductive-group and orthogonal-group foundations remain with their existing owners.

The reviewed audit has **no row for either this roadmap or its parent**. The original statement implying such a row was corrected. Related audit rows were read: existing combinatorial arithmetic, finite-rank Hom/isogeny theory, abelian Shafarevich and pure Hodge foundations are used through their owners. An absent audit row is not evidence that those foundations should be planned again.

## Sources and source issues

The public texts read are [LS arXiv v5](https://arxiv.org/pdf/2004.09046v5), [LV's publisher-formatted article](https://bimsa.net/doc/publication/2578.pdf), [Beauville's author PDF](https://math.univ-cotedazur.fr/u/beauvill/pubs/mono.pdf), and [Batyrev–Cox arXiv v1](https://arxiv.org/pdf/alg-geom/9306011v1). Exact versions, SHA-256 values, access dates and read ranges are in the packet. LS locators use preprint pages; LV uses printed journal pages; Beauville uses printed pages; Batyrev–Cox uses PDF pages. LV arXiv v3 was also checked at §10.1, pp.55–56, and Proposition 10.6, p.64. Its strict first inequality is not substituted for the published non-strict one. LS publication metadata was inspected, but its version-of-record text was not obtained; every LS source finding remains scoped to v5.

All fourteen source issues were independently confirmed at their locators. Each now has a `review` verdict and its own reason. E1's underlying error is confirmed with its record and example corrected as above. E2–E5 concern the doubled Fourier cutoff, degree-dependent Frobenius multiplier, increasing-flag quotient and root-bijection signs. E6–E14 concern the decreasing-filtration quotient, nonzero translation, cyclic-cocycle finite-order hypothesis, disconnected coefficient subgroup, rational Frobenius coefficients, tail comparison, geometric denominator, variance terminology and incompatible GO2 scope. Proof-interface gaps E9–E10 do not assert counterexamples to the source finiteness theorem. No additional source issue was introduced, and no passage was copied into the deliverables.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/MordellLawrenceVenkateshPartII.json`: zero errors and zero warnings.
- Swarm `intake.py check-files`: all changed deliverables and the handoff pass.
- `git diff --check`: passes.
- Exact arithmetic sanity checks passed for Eulerian rows n=2–12, normalization, variance, central mass and log-concavity; classical adjoint strictness in geometric parity for d=1–4; the GO2 counterexample; plane cubic/quartic and quartic-surface Hodge examples; parameter dimensions; squared-kernel coefficient ratios for N=1–100; a non-involutive A2 root-sign example; and top-sum scaling with multiplicity d=0–4. These finite checks supplement the source proofs; they are not proofs of the general targets.
- Mechanical checks passed for all 61 routed items, all 79 node identities and their acyclic graph, every reader target statement and prerequisite, minimum API/test counts, unchanged baseline entries, and absence of excerpt fields.
- The unchanged 102-line suggested Lean file elaborated successfully with `lean-check` at the pinned Mathlib. It contains three real-bodied numerical definitions, three theorem signatures and six examples, with nine expected `sorry` warnings and no other warnings. No absent geometric carrier is replaced by a fake Lean definition. Memory availability was checked before this single compile.

There is no unfinished review action. The orchestrator should carry the ten explicit gaps and twelve requests into the existing owner/follow-up process. No notion was moved from a higher-tier owner into this packet, no new roadmap was created, and no additional claim is needed. Packaging must retain these dependency qualifications and the exact supplier boundaries.
