# REV-DiamondEtaleCohomology--C8

Accepted after corrections on 6 October 2026. Reviewer: Claude, session
claude-KlGobo, issue #387. The packet, reader document and suggested file
were written by Codex, session codex-jwdV9s (issue #710, PR #6751), with
earlier checkpoints in #2960 and #3087. This reviewer wrote none of them.

This accepts a complete target-level planning pass under PROTOCOL sections 0
and 2. The roadmap's distance is 9, so target level is the correct
granularity. Stages C8 and C9 both stay **planned**, with ten recorded gaps,
and neither is closed. Every implementation status remains `unchecked`. The
per-node evidence is in the packet's `review.checked`: 42 nodes verified, 21
corrected, 2 added, none unverifiable.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 63 | 65 |
| Definitions / constructions / theorems / lemmas / comparisons / applications | 7 / 1 / 21 / 28 / 5 / 1 | 8 / 1 / 22 / 28 / 5 / 1 |
| API items | 33 | 38 |
| Unit tests | 29 | 36 |
| Planets (C8 / C9) | 6 / 2 | 6 / 2 |
| Pinned baseline declarations | 14 | 18 |
| Supplier requests / gaps | 19 / 10 | 21 / 10 |
| Source issues | 2 | 3 |
| Planned / closed stages | 2 / 0 | 2 / 0 |

`python3 scripts/check_blueprint.py` reports 0 errors and 0 warnings. An
errata-v1 projection of the packet's `sourceIssues` passes
`scripts/check_errata.py`. `lean-check` elaborates the revised suggested file
in the shared build at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
with `sorry` as its only warning (63 occurrences). No local declaration index
was installed, so every baseline declaration was read in the pinned source
trees instead: Mathlib in the shared build at the pinned commit, and Tau Ceti
through `git show f790474821cf4256814db967cb154e7af3d0c369:<path>`.

## What was read

| Source | Version and hash | Passages checked |
| --- | --- | --- |
| [Scholze, Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4) | arXiv v4; SHA-256 matches the packet | §20.1–20.17 (pp.113–122) and §21 in full (pp.122–127), with the rendered pp.126–127 inspected; Convention 22.1–Theorem 22.5. Lemma 21.17 and the two recorded misprints compared in v1 and v3. |
| [Caraiani–Scholze, Annals 186 (2017)](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | published text; hash matches | Propositions 4.2.19 and 4.2.21, Remark 4.2.20, pp.711–712 |
| [Temkin, Topological transcendence degree](https://arxiv.org/pdf/1610.09162v2) | arXiv v2; hash matches | §§2.1–2.2, §§3.1–3.2, Remark 2.1.10 |
| [Conrad, Completion of algebraic closure](https://math.stanford.edu/~conrad/248APage/handouts/algclosurecomp.pdf) | hash matches | entire handout |
| [Kelly–Saito–Tamme, On pro-cdh descent on derived schemes](https://arxiv.org/pdf/2407.04378v3) | arXiv v3, SHA-256 c59e68e7…; also the author copy cited by the packet (hash matches) | Lemma 6.6 and proof, p.24, identical in both |
| [Fargues–Scholze, Geometrization](https://arxiv.org/pdf/2102.13459v4) | arXiv v4; hash matches | §I.11 and Problem I.11.1, pp.41–42 |
| [Stacks Project](https://stacks.math.columbia.edu/) | online, 6 October 2026 | Tags 0719 (Section 20.38), 0A3G, 0D6P, 09SM (Section 13.37), 03RD, 03RF |

Every one of the 63 original excerpts was found verbatim in its source, by a
normalising script over the extracted text for ECD, Temkin, Conrad and KST
and by hand for CS17. Statements were compared with the source statements and
proofs, not only with the excerpts. Several excerpts are very short ("The
objects", "the image of", "This implies that"). They are literal and their
locators are exact, so they were kept.

Supplier statements read: the DiamondsAndVStacks packet nodes the packet
cites (D0/cech-to-derived-comparison, closure-of-pro-constructible,
completion-cardinality-bound, constructible-topology-profinite,
filtered-colimits-and-cohomology-on-coherent-sites,
groupoid-quotients-and-two-fibre-products; D1/pro-etale-maps-over-std-base,
strictly-totally-disconnected; and the four D5 nodes). Also read: the
EnhancedDerivedSheaves--E0 packet's E1 and E2 nodes, and the stated scopes
of E2, E3, AdicEtaleGeometry A2, ArithmeticGaloisDuality R02.1–R02.2,
DiamondsAndVStacks D5 and C0–C7. On the Tau Ceti side: ProfiniteCohomology
Layers 0, 10 and 11, ProfiniteProPGroups Layers 2, 3 and 6, AdicSpaces
Layer 3, and DGAInfinity Layers 5 and 6. The accepted RS-05 result and the
reviewed AUDIT-36 entries for C8 and C9 were read as well.

## Baseline

All 14 cited declarations exist under their names at the pinned commits and
provide what the citing nodes need. These are `topologicalKrullDim`;
`irreducibleSetEquivPoints`, an order isomorphism `IrreducibleCloseds α ≃o α`
for the specialization order on quasi-sober T0 spaces;
`Order.krullDim_eq_of_orderIso`; `IsHomeomorph.topologicalKrullDim_eq`;
`topologicalKrullDim_subspace_le`; and
`topologicalKrullDim_zero_of_discreteTopology`, which gives `≤ 0` only. Next
come `Algebra.trdeg`; `continuousCohomology (n : ℕ) (A : TopRep k G) :
TopModuleCat k`; `IntermediateField` and `Dense`; and `trdeg_add_eq`, for a
scalar tower with `FaithfulSMul` and no zero divisors. The rest are
`TauCeti.IsProP`, the open-normal-quotient form at f790474;
`WithConstructibleTopology`; and `CategoryTheory.SimplicialObject`. None was
removed.

Four declarations were added, each read at the pinned commit:

- `spectralNorm.normedField` and `spectralNorm_extends`
  (`Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean`) give the norm on the
  finite splitting extension in Conrad's argument. The packet's first gap had
  asked for that norm to be constructed.
- `CategoryTheory.ObjectProperty.triangEnvelope`
  (`Mathlib/CategoryTheory/Triangulated/Generators.lean`) is Mathlib's name for
  the retract-closed triangulated closure. Mathlib does not prove that compact
  objects lie in it.
- `IsAlgebraic` is used by the added topological-independence definition.

The packet's claim that `IsAlgClosed.of_denseRange` needs `CharZero` was
confirmed in `Mathlib/Analysis/Normed/Field/Dense.lean`. Tau Ceti at f790474
has continuous cohomology but no cohomological dimension, Hochschild–Serre,
or category of adic spaces. The omitted suggested signatures are therefore
honest.

## Corrections

1. **Compact objects: wrong supplier.** C9/compact-implies-perfect-constructible
   and the E3 request asked EnhancedDerivedSheaves E3 for the statement that
   compact objects are the retract-closed finite closure of compact generators.
   E3's stated scope does not contain it (Kan extensions, adjoint functor
   theorem, localizations, colimit preservation, mates), and neither do the
   EnhancedDerivedSheaves packet's E3 nodes. Tau Ceti's DGAInfinity Layer 6
   states it in DG form, with Layer 5's identification of compact objects and
   thick closure. E1 makes D(Y_ét,Λ) the homotopy category of a DG model. The
   node now imports Layer 6, states the closure as Mathlib's
   `ObjectProperty.triangEnvelope`, and cites the triangulated proof in Stacks
   13.37.3–13.37.4. A request to Layer 6 was added. The E3 request is narrowed
   to what E3 owns: coproduct preservation implying colimit preservation, and
   cutoff compatibility. C9/compact-generators now pins "compactly generated"
   to Stacks Definition 13.37.5.
2. **Postnikov convergence was already planned.** The C9 nodes asked E2 at
   stage level for "the site-level form of Stacks 0719". Tag 0719 is Section
   20.38, on ringed spaces. The site-level statement is Stacks 0D6P, which the
   EnhancedDerivedSheaves packet already plans as
   E2/postnikov-finite-cohomological-dimension. Its uniform truncation window
   (Stacks 0D6M) is planned as E2/postnikov-uniform-window. C9/left-completeness
   and C9/global-sections-coproducts now cite these nodes. The E2 request keeps
   only what no node supplies: category-level left completeness under the same
   bound, and the cosimplicial comparison.
3. **Temkin's theorem made a node.** The finite case of Question 21.4 goes
   through Temkin's independent degree. That definition and Temkin's comparison
   theorem are what C8/topological-trdeg-finite-monotonicity needs, but neither
   was a node. Added C8/topological-independence-degree, a definition with 4 API
   items and 3 tests, and C8/independent-le-generating-degree, a theorem with
   parts (a) Theorem 3.2.1, (b) Theorem 3.2.3 with Remark 2.1.10(i), and
   (c) Lemma 2.2.2. The monotonicity proof is rewritten through them. The
   unread Temkin 2010 Lemma 6.3.2 stays in the gap, which now also lists the
   new theorem.
4. **Completion gap narrowed.** C8/finite-topological-generators now cites
   Mathlib's spectral norm. Conrad's proof was read in full: it uses no
   separability, so the argument holds in characteristic p. What remains of
   the gap is the adapted root-approximation lemma.
5. **Residue bound.** C8/residue-cd-bound had no proof route. It now has the
   standard one:
   - reduce to k(t_1,…,t_n) by closed-subgroup monotonicity;
   - induct on n with extension-cd-bound;
   - for K^alg(t), the Brauer groups of all finite extensions vanish by Tsen
     (Stacks 03RD and 03RF, read).

   The criterion that Brauer vanishing gives cd_ℓ ≤ 1 (Serre, Galois
   Cohomology II.3.1) is recorded as the remaining gap. extension-cd-bound and
   ProfiniteProPGroups Layer 6 were added as prerequisites.
6. **Tame bound.** C8/tame-cd-bound now spells out the ℓ-Sylow lattice Z_ℓ^s
   with s ≤ r. It imports the Sylow equality `cd_p_eq_of_isProPSylow` from
   ProfiniteProPGroups Layer 6, and a request was added.
7. **Missing steps.**
   - C8/fibre-dimension: the comparison with ECD 21.1 needs the fibres to be
     quasi-sober. Fibres of spectral maps are pro-constructible, hence locally
     spectral. Without sobriety the two dimensions differ; an infinite
     cofinite space is an example.
   - C8/injection-direct-image: added D0/closure-of-pro-constructible. After
     strictly totally disconnected pullback, the generalizing pro-constructible
     subset is an intersection of quasicompact opens.
   - C8/wild-kernel-pro-p: added the compact-to-Hausdorff embedding. It turns
     pointwise convergence of g^(p^n) into convergence in G.
8. **Scope.** C8/point-cd was defined for quasiseparated diamonds, but 21.16
   applies it at maximal points of locally spatial ones. The statement now
   covers both, and API item `pointCd_open` was added.
9. **Unit tests.** Seven discriminating tests were added:
   - `topologicalTrdeg_padicComplex` (value 0 for ℂ_p over ℚ_p, against the
     infinite algebraic degree);
   - `topologicalTrdeg_eq_zero_iff_surjective`;
   - `modifiedTopologicalTrdeg_eq_zero_iff_surjective`;
   - `modifiedTopologicalTrdeg_eq_one`, which rejects always-zero and
     supremum-type definitions without using Temkin;
   - the three tests of the added definition.

   Concrete acceptance instances were added to the planets 21.11, 21.16 and
   20.17.
10. **Planets.** "Geometric transcendence dimension" is not a term of the
    source; it is renamed "dim.trg of a morphism". "Maximal-point
    cohomological dimension" becomes "Cohomological dimension of points",
    after ECD's own sentence before 21.16. C8 still has six planets and C9
    two.
11. **Housekeeping.** The KST source now points at arXiv v3 (identical Lemma
    6.6, p.24), with the author copy recorded. The Stacks readSections list
    the new tags. Four nodes using the library path
    `TauCeti/AlgebraicGeometry/DiamondEtale/...` were aligned with the
    packet's `TauCeti/Geometry/Diamonds/...`.

## Source issues

- **E1 (C′×/(1+C′′×) in 21.16): confirmed.** It is on the rendered p.126 of
  v4, and also in v1 and v3.
- **E2 (j : U → X in 20.17): confirmed.** X is undefined. Also present in v3.
- **E3, added.** The proof of Lemma 21.17 says "Let G be the subgroup … generated
  by γ; then G is a cyclic profinite group". For γ of infinite order that
  subgroup is countably infinite, so it is not profinite. The intended G is
  the closure in the topology of pointwise convergence. Its compactness needs
  the isometry and factorial-convergence hypotheses, which the proof does not
  spell out. Recorded as a gap affecting nothing; the wording is the same in
  v1, v3 and v4. A typo, "Is is true" in Question 21.4, was not recorded.

## Closure and scope

Every C8 target of the stage text is realised:

- the definitions of 21.1–21.7 and the local-finiteness predicate;
- the comparisons 21.3, 21.6 and 21.8;
- 21.13 and 21.14;
- 21.9 and 21.10;
- the wild, tame, residue and valuation inputs of 21.16 and 21.17;
- Scheiderer's bound, and 21.11–21.16;
- the CS17 route.

Every C9 target (20.9, 20.10 and 20.17 with their prerequisites) is realised
as well, and the new application keeps one common bound d+e.

The C7/C8 cross-imports are acyclic at node level. Requests are precise.

Two scope decisions are recorded rather than changed:

- 20.17 is planned for commutative Λ, following C7's stage text, although ECD
  allows any ring.
- The R02.1/R02.2 roles follow accepted RS-05, which reverses the stages'
  current headings.

Nothing in the reviewed library audit is planned again.

## Questions for the orchestrator

1. **Reader document.** The reader document
   `research/blueprint/readmes/DiamondEtaleCohomology--C8.md` is not a
   deliverable of this review, and promotion copies it as it stands. It needs
   these syncs:
   - the two added nodes;
   - the supplier changes for compact-implies-perfect-constructible (E3 to
     DGAInfinity Layer 6), left-completeness and global-sections-coproducts
     (the E2 nodes), and residue-cd-bound and tame-cd-bound (ProfiniteProPGroups
     Layer 6);
   - the narrowed E2 and E3 requests and the two new requests;
   - the renamed planets at its lines 1319–1320;
   - the KST URL at line 1330;
   - the new tests, and the point-cd scope.
2. **Scheiderer route.** The C8 stage text requires Scheiderer's
   quasi-augmented route for the spectral-space bound. Scheiderer's paper was
   unavailable (publisher 403). Stacks 0A3G proves the same statement
   completely and is free to read. Should the stage accept the Stacks proof
   for C8/spectral-cohomological-bound, keeping the chain-space construction
   only where a consumer needs it?
3. **RS-05 and the R02 headings.** Accepted RS-05 assigns all-degree
   Hochschild–Serre to ArithmeticGaloisDuality R02.1 and the discrete/compact
   comparison to R02.2. The atlas headings of those stages say the opposite.
   One of the two should be brought into line.
4. **The v-stack dimension.** The topological dimension of a v-stack morphism
   (Remark 21.8, second paragraph) is defined inside the theorem node
   C8/topological-dimension-field-tests rather than as a definition with API.
   If DiamondSixOperations uses `dim f` for representable morphisms, a
   follow-up should promote it to a definition node.
