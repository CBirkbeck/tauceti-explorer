# Handoff: Lie groups and the Lie algebra correspondence — link audit

## Identity, scope and disposition

- Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups`; issue [#61](https://github.com/CBirkbeck/tauceti-explorer/issues/61).
- Author/worker: **ChatGPT Pro — cgp-14f035649b9f**. This is an author submission, not an independent review.
- Claim [5697561585](https://github.com/CBirkbeck/tauceti-explorer/issues/61#issuecomment-5697561585) was explicitly accepted for this session by bot confirmation [5697563391](https://github.com/CBirkbeck/tauceti-explorer/issues/61#issuecomment-5697563391). The issue and both comments were re-fetched before submission; there was no conflicting claim.
- Deliverables: this handoff and `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json`. No other repository files are proposed for modification. No git commands were run.
- Status: **complete link-audit pass; independent review and integration pending**. This does not assert that the LieGroups blueprint is mathematically closed, that requested interfaces exist, or that anything has been implemented. A stage link describes a planned supplier/consumer contract.

The packet contains **14 new links (6 incoming, 8 outgoing), 11 overlap proposals (7 rescope, 4 keep, 0 merge), and 217 examined roadmaps**. The latter are every other raw-atlas roadmap (211) plus six additional blueprint definitions. Four existing incident links are reused rather than repeated. No whole-roadmap merger is recommended.

## Input revisions and source provenance

Initial claim input: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`.

The small atlas extract and the full target README were first read through the GitHub connector. A full local input became available through the repository's deployed GitHub Pages workflow artifacts:

| Input | Revision / identification |
| --- | --- |
| First working snapshot | `262dee344399d4123a712655f2be585d7e68720d`; run `35097901665`, artifact `10446703864` |
| Refreshed submission inputs | `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`; run `35099069170`, artifact `10446963221` |
| Refreshed artifact ZIP SHA-256 | `4e2e1610f490ae2125bc74ea94af72c1930531b80a476ace6928d6b6da4110c9` |
| Imported upstream roadmap revision | `faa5423b925964415cc926802ab206567719d3f4` in atlas metadata |
| Raw atlas blob | `37f2add06983c206067d1104e0f40a839cc3961a` |
| Target README blob | `c43ea63965d2efdcdcb5379064c117deb271a5a1` |
| Link validator blob | `88135efe5a74ef82e088f3fa3189893e27a7867a` |
| Baseline file blob | `fdb00afdfae8e5728e070f310f5a880707764bc2` |
| Pinned Tau Ceti | `f790474821cf4256814db967cb154e7af3d0c369` |
| Pinned Mathlib | `082e2d37e8b0463410cdb532e111cd43d5a66174` |
| Baseline created | `2026-09-16T09:50:49Z` |

GitHub's commit comparison showed that the first snapshot differed from the initial claim revision only in presentation/classification files. At refresh, the atlas, target/source roadmap texts, baseline and validator were unchanged. The newly integrated AlgebraicCurves, LocalFieldsRamification and ModularCurves link packets and five new Habiro-related roadmap definitions were loaded into the local validation world. It contained 212 raw roadmaps, 1,968 raw stages, 3,508 recorded stage edges, six additional definitions and 15 other link packets.

All evidence is primary repository text at these input revisions. Each retained link quotes both endpoint contracts and records a repository-relative source path and exact line range. The evidence is not a quotation from a textbook proof. Public/private mathematical references named by those roadmaps were **not independently checked in this link job**. Likewise, no Lean declaration was claimed to exist or be absent at the baseline: names inside quotations are the roadmap authors' named targets or claims. No Lean code was added, compiled or represented as completed.

## Audit coverage and the distinction between screening and checking

Every raw-atlas roadmap summary was read. The full catalogue's stage descriptions and README texts were searched for objects and synonyms including Lie groups, Lie functor/differentiation, exponential/one-parameter subgroups, BCH/Baker–Campbell–Hausdorff, universal covers, Frobenius, adjoints, enveloping algebras, maximal tori, compact real forms, Cartan/Iwasawa, flags, nilmanifolds, compact duals and homogeneous quotients. The six additional definitions were read at summary/purpose/stage-inventory level. Summary-only entries say so. An `examined` result of `none` means no sufficiently supported direct pair was retained; it is not a proof of absence.

The target README and all ten target stage descriptions were read in full. The main deep checks included AdoIwasawa's characteristic-zero construction and its Levi/Weyl prerequisites; LieHighestWeight's PBW, classification, Weyl reducibility and reductive extension; CompactGroups' averaging and Peter–Weyl boundaries; UniversalCovers; HopfRinow's generic flow/IFT prefix; SpinRepresentations' bivector/differentiation interface; RootSystems; ClassicalGroups; ReductiveGroups; and the relevant GeometricTopology, AlgebraicTopology, HeegaardFloer, FuchsianOrbifolds and HodgeStructures passages.

Campaign candidate stages were read for AF.0/AF.1/AF.1a, ALS.0 and its arithmetic sequel, ShimuraData D2/D3, AutomorphicBundles B0, AdditiveCombinatorics AC.3–AC.4, BorelRegulators R.1–R.3, GeometryOfNumbersAndQuadraticArithmetic GN.4, AdelicAlgebraicGroups AA.0–AA.5, ReductiveGroupsPartII RG2.4, MetaplecticAutomorphicForms' construction/archimedean passages, GL2AutomorphicRepresentationsAndTransfer, and complex-comparison GAGA. Candidate rejections distinguish algebraic root-datum fundamental groups, nonarchimedean decompositions, compact p-adic Lie groups, coding-theoretic BCH, and derived group stacks from real finite-dimensional Lie theory.

### Stage input/output inventory used in the audit

| Target layer | Inputs and output boundary |
| --- | --- |
| 0 | Finite-dimensional real smooth Lie group, left-invariant vector field and generic ODE/IFT. Constructs the global one-parameter flow, exponential and its local chart. Geodesic completeness is not an input. |
| 1 | Tangent bracket, smooth multiplication/conjugation and differential calculus. Constructs Ad, identifies its derivative with ad, and states exponential/adjoint comparison. |
| 2 | Exponential chart, **closed** subgroup and local limiting arguments. Constructs embedded subgroup/matrix-group smooth structures and automatic smoothness. A general homogeneous quotient is a further unit. |
| 3 | Smooth group homomorphisms and the exponential chart. Constructs the differentiated Lie homomorphism, naturality, connected-source uniqueness and local BCH. |
| 4 | General Frobenius, real characteristic-zero Ado and the independent covering prefix. Constructs immersed integrating subgroups, Lie III and the simply-connected correspondence. |
| 5 | Covering-space lifting and charts supply the covering Lie group **before** Lie III; connected-source descent follows later. Algebraic PBW supplies a separate filtered differential-operator comparison. |
| 6 | Compact connected Lie group, normalized Haar, subgroup/quotient geometry and root-system comparisons. Constructs maximal tori, group/root-system Weyl comparison and the integration formula. |
| 7 | Correctly separated compact-group complexification and real-form interfaces; group-character descent. Its current noncompact/maximal-compact wording needs correction. |
| 8 | Actual Borel characters of the chosen complex reductive group, flag geometry and highest-weight classification with central character. Constructs Borel–Weil and Bruhat/Schubert comparisons; not all partial-flag vector bundles. |
| 9 | A precisely specified real reductive **group** admitting a global Cartan involution/decomposition, and restricted-root theory. Constructs Cartan, Iwasawa and KAK; not nonarchimedean decompositions or arbitrary covers. |

## Retained and reused interfaces

The six incoming links are AdoIwasawa Layer 5 to LieGroups Layer 4; LieHighestWeight Layer 3 to Layer 5; LieHighestWeight Layers 4 and 9 to Layer 8; CompactGroups Layer 0 to Layer 6; and HopfRinow's generic inverse-function prefix in Layer 1 to Layer 0.

The eight outgoing links are LieGroups Layers 1 and 3 to SpinRepresentations Layer 3; Layer 3 to AF.1's finite-dimensional derivative compatibility; Layer 5 to AF.0's differential-operator interface; Layer 9 to ALS.0; Layer 7's valid compact-real-form milestone to ShimuraData D2; Layer 5's cover prefix to GeometricTopology Layer 8; and Layer 4's **general-manifold Frobenius prerequisite**, not Lie III, to GeometricTopology Layer 10.

The RootSystems packet already supplies RootSystems Layers 1 and 2 to LieGroups Layers 6 and 8 respectively. The UniversalCovers packet already supplies its first two stages to LieGroups Layer 5. These four arrows are not duplicated. RootSystems also already records the mismatch between reduced root systems and possibly nonreduced restricted systems in LieGroups Layer 9; this proposal is referenced rather than recreated.

No direct BorelRegulators cochain link was added: R.2 explicitly uses AF.1a, which owns the relevant invariant-form/relative-cochain comparison. Similarly, generic automorphic machinery reaches the GL2-specific consumer through its named AF interface. The real metaplectic cocycle construction is not identified with a universal-cover construction without an additional comparison theorem.

## Concrete corrections and ownership requests for the blueprint

The locators in this section refer to `content/tau-ceti/RepresentationTheory/LieGroups/README.md` at the input revision unless another path is named. These requests do not modify the upstream README in this submission.

### 1. Correct the sequential closed-subgroup criterion

At **line 280**, the displayed criterion permits `t_n = 0` for every n and `X_n = X`. Then the right side holds for every X because `lieExp 0 = 1` belongs to every subgroup. Require nonzero parameters (at least eventually), convergence and the closed-subgroup hypotheses used in the limiting proof. The corrected statement must be proved, not imported from the uncorrected display.

At **lines 269–271**, the claimed difference-quotient proof of bracket closure is also not justified for a general nonclosed subgroup by taking limits inside it. For the closed-subgroup construction, keep closedness in the elementary limit argument. An arbitrary-subgroup assertion needs an independent argument with its own dependencies. Do not use the later immersed-subgroup theorem circularly to justify its own foundations.

### 2. Define the exponential derivative's removable singularity

At **line 264**, `(1 - exp(-ad X))/ad X` must mean the entire power-series function of `ad X`, not division by an invertible endomorphism. `ad X` need not be invertible, including at X = 0. State the value at zero and its power-series/functional-calculus definition before this identity becomes an API theorem.

### 3. Preserve the existing noncircular proof order

At **lines 330–356**, the target already distinguishes the independent universal-cover construction from connected-source homomorphism descent. Retain declaration-sized units in the order: covering space/lifted group law/smooth cover; Frobenius plus real Ado; Lie III; simply-connected morphism integration; central-kernel descent. Numerical layer order is not a valid prerequisite order.

Ado's characteristic-zero proof uses Levi theory and algebraic Weyl complete reducibility. LieHighestWeight's selected route is Casimir-based, not a proof via integrating to a compact group. Keep that algebraic route to avoid Ado -> Lie III -> compact integration -> Weyl -> Ado. Positive-characteristic Ado and strengthened nilpotence statements are not prerequisites here.

### 4. Separate real irreducibility from scalar infinitesimal characters

At **lines 357–364**, the enveloping-algebra construction is explicitly over R, but the scalar-central-action sentence needs additional hypotheses. A one-dimensional real abelian Lie algebra acting by rotation J on R^2 is real irreducible, while J is not a real scalar. `RepresentationTheory/LieHighestWeight/README.md`, **lines 690–697**, already records the algebraically closed finite-dimensional convention and this counterexample. Use the finite-dimensional complex/algebraically closed statement, or explicitly assume an infinitesimal character for a broader class. Do not silently promote this to all real or infinite-dimensional irreducibles.

The universal property of U(g) gives the differential-operator homomorphism, not its injectivity/surjectivity. Preserve the PBW filtration and principal-symbol argument. Reductive irreducible classification additionally needs the central weight; complete reducibility of all reductive representations needs semisimple central action.

### 5. Split compact complexification from noncompact real forms

At **lines 394–402**, the scope includes real reductive G but then asks that G itself be a maximal compact subgroup of its complexification. This cannot apply to a noncompact G: a maximal compact subgroup is compact. Separate the valid compact connected group's complexification/universal property from a specified noncompact real form and its own maximal compact K. Specify admissible global groups, the actual map into a complexification, and central quotient data; not every assertion follows merely from reductivity of the Lie algebra.

The Layer 7 -> D2 arrow uses only the separately stated compact-real-form existence milestone, with the algebraic/analytic comparison still required. In Layer 9 (**lines 435–448**), likewise pin the actual global Cartan hypotheses, not just a reductive tangent Lie algebra. A universal cover of a real semisimple group can have a different compact-subgroup/global-center situation.

### 6. Keep group weights, partial flags and bundles honest

Layer 8 (**lines 415–430**) must use characters of the chosen Borel in the chosen group. Lie-algebra integrality does not by itself prove descent through the central kernel of a covering group. Fix the Borel/opposite-Borel, associated-line-bundle and left-action conventions so that the section representation is the stated highest-weight module rather than its dual. Include a concrete standard-versus-dual test.

For ShimuraData D3 and AutomorphicBundles B0, G/B character line bundles do not supply G/P or vector bundles associated to arbitrary parabolic representations. Keep the generic torsor-associated-bundle construction with ReductiveGroupsPartII as B0 requests; assign analytification and arithmetic coefficient descent explicitly. A generic closed-H homogeneous-quotient unit should expose the quotient submersion, local principal-bundle charts and tangent quotient before the separate flag, symmetric-space and dynamics arguments.

### 7. Name the missing maximal-torus degree interface

Layer 6's exhaustion argument (**lines 374–378**) invokes a fixed-point/degree argument on G/T. Identify the exact theorem, orientation and compactness hypotheses, and canonical degree API. AlgebraicTopology Stage 6 itself imports degree infrastructure from HeegaardFloer; the inspected HeegaardFloer Lane F0 states Sard/Fredholm/Sard–Smale, not the required fixed-point/degree contract. Neither text currently justifies an invented hard arrow to a specific degree theorem. The smooth closed-subgroup quotient G/T is also a prerequisite, not a consequence of merely knowing T is embedded.

### 8. Respect the further scope proposals in the packet

Generic ODE/IFT should be shared with HopfRinow without identifying Lie and Riemannian exponentials. General compact-group Peter–Weyl must not be made dependent on later complexification/highest-weight results. Compact and algebraic tori need an explicit integral-character comparison, not an identification of S^1 and C*. Scheme-theoretic quotients and positive-characteristic groups remain distinct from analytic Lie groups.

For AdditiveCombinatorics, local BCH is not global nilpotent exponential coordinates, and neither supplies rational Malcev/lattice/height bounds. For Borel regulators, a compact real form is not yet a compatible compact-dual pair with Lie algebra k + i p, actual subgroups and quotient comparison. For homogeneous quotients, normality is needed for G/H to be a group; a discrete subgroup acts freely on G by translations even with torsion, whereas its action on G/K has separate stabilizer/freeness issues. Keep real and nonarchimedean Cartan/Iwasawa theorems separate.

## Validation and handover

Executed from the refreshed local input tree:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json

status: complete
links: 14
overlaps: 11
examined: 217
0 error(s), 0 warning(s)
exit status: 0
```

Additional scratch assertions passed: all 217 expected other roadmap IDs occur exactly once; all 14 pairs are unique and absent from both the recorded atlas and the 15 other link packets; all 28 excerpts occur within their exact `sourcePath` line ranges. The repository validator checked stage identities, literal evidence, schema constraints and cycle compatibility with the combined recorded graph. These checks are **not** an independent mathematical review or a proof of exhaustive dependency closure.

Neither a Lean build nor `check_blueprint.py` was run: this is a links-v1 submission, not an implementation or blueprint packet. PR CI has not been observed at the time this handoff file is authored; the submission comment records the actual PR and any subsequently observed check status.

The next owner should independently review the retained interfaces, particularly AF.1's finite-dimensional K-piece restriction and the general-manifold Frobenius prefix, and assign the comparison/correction requests above. Refresh duplicate/cycle checks against parallel submissions before integration. Do not treat the audit's `complete` status as completion of these requested mathematical units. The submitted claim is not released merely to take another job; integration and queue disposition remain with the maintainer/orchestrator.
