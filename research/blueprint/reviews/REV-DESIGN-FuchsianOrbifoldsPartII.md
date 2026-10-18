# Independent review: FuchsianOrbifoldsPartII

Job `REV-DESIGN-FuchsianOrbifoldsPartII`, issue #3532. Reviewer: Codex, session `codex-T92e2f`, 2026-10-18. The design was written by session `codex-dCzvVM`; this reviewer did not contribute to it.

## Verdict and inventory

**Accepted after corrections.** This is a complete target-level planning pass, with six planned layers and no closed or implemented layer. Acceptance concerns the mathematical plan and its explicit import contracts. It does not certify Lean proofs or completed supplier interfaces.

The final packet contains 30 nodes: seven definitions, six constructions, sixteen theorems and one application. All thirteen definitions/constructions have consuming uses and at least three discriminating tests: 62 public API items and 40 tests altogether. There are 29 planets, 22 pinned baseline references, 13 atlas-stage requests and two current-upstream imports. All 27 extraction-route items are mapped. The review records 23 verified nodes, seven corrected nodes, zero added nodes and zero unverifiable nodes. There are no recorded proof gaps or unresolved contradictions. Every implementation status remains unchecked.

## Corrections made

1. **Core cusp cutoff and boundary maps (N.2/class-core).** The Ford polygon contains the full strip above height one, but its intersection with the convex hull need not. In the principal D=28 example the first supporting arc has center 3/2 and radius √7/2. The point 3/2+(6/5)i satisfies every Ford inequality and lies below this arc. The core strip now starts above a chosen bound on all retained arcs. A named cusp-strip API and fourth test, mirrored by a compact Lean example, catch this error. The projection is locally isometric in interior orbifold charts and maps boundary half-discs into full charts; it is not an open local homeomorphism at the genuine boundary.
2. **Existing lifting theory (N.0/boundary-geodesic; N.3/conformal-lift).** Completed/UniversalCovers Stage 2 already supplies the ordinary covering infrastructure. Remove its prospective request and roadmap prerequisite. Add the exact pinned lift criterion and deck-conjugation references, with compatible based lifts, rebasing of the target cover and all connectedness hypotheses. Boundary-axis uniqueness needs the parent quotient charts, not a new covering-theory request.
3. **No duplicated ideal action (N.0/limit-set).** Import the parent F.0 boundary action. Current Tau Ceti already has `OnePoint.instMulActionPSL` and `OnePoint.pslMk_smul`; these are current supplier code, not asserted to exist at the older packet pin. Only compatibility with the Cayley compactification is new here.
4. **Dictionary ownership and complementarity (N.4/complementarity).** IntegralLattices Layer B2–B3 already owns the oriented form/ideal dictionary; GlobalNumberFields Layer 11 owns its order and NarrowPic carriers. GN.3 supplies the maximal-order comparison and DIT coefficient-sign adapter, preserving the orientation clause for a<0. This matches the existing RQ.3 request. Add the once-traversed boundary identification as a direct input; use cancellation of signed boundary arcs and finite sheet densities, without introducing a theory of currents.
5. **Geometric-finiteness attribution (N.0/geometric-finiteness).** Add Series Theorem 3.33, p.21, to the convex-core paragraph on p.33 and Lu §3.1. AT.1 supplies generic finite-cover van Kampen; the finite-type surface exhaustion and incompressible-boundary argument remain part of this target. The reader explains why Lu’s torsion-free surgery passages do not remove the cone points from the stated theorem.
6. **Stokes supplier hypotheses (N.5/core-stokes).** Apply the real-valued Stokes interface to real and imaginary parts with a smooth compactly supported cutoff equal to one near the compact truncation. Retain the separate λ=0 argument, the exact λ/2 coefficient, the height-truncated interpretation, and the stronger integrability conclusion only for the stated spectral inputs. Correct the claim about cutting invariance: every Sₖ and T^m lies in Γ_A, so Γ_A-invariance suffices for the cutting identities. Full modular invariance is needed to descend the one-form to the modular orbifold.
7. Synchronize statements, inputs, acceptance checks, API/tests, source locators and supplier provenance in the reader and roadmap definition. Correct the small-discriminant Lean comment’s layer label. Add independent verdicts to all four source issues and this packet’s review object. No supplier, extraction, library-audit or atlas file is changed.

## Sources and independent checks

Read the version-of-record [Duke–Imamoḡlu–Tóth paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Annals 184 (2016), 949–990: §2 pp.950–954; §3 pp.954–959 including Theorem 1, (3.4)–(3.6) and Figures 1–7; §4 pp.959–960; the normalizations in §5 pp.961–962; and Lemmas 1–2 with (7.9)–(7.11), p.972. The relevant diagrams and displays on pp.952, 958, 959, 961 and 972 were inspected visually. The PDF SHA-256 recorded by the design was independently reproduced.

Also read [Lu, Geodesic cover of Fuchsian groups](https://www.numdam.org/item/10.5802/ambp.421.pdf), §3.1 pp.194–195, Proposition 3.5, and the truncation/funnel discussion in §3.2–§3.3 pp.196–198; and [Series, A Crash Course on Kleinian Groups](https://rendiconti.dmi.units.it/volumi/37/01.pdf), Theorem 3.33 p.21 and the convex-core discussion pp.32–33. Both recorded PDF hashes were independently reproduced. No uncleared book or copied source passage is used.

All four source findings are **confirmed**, with their scope made explicit. E1 concerns the noninvariant real-line/above convention when infinity is omitted (DIT §2 p.952). E2 is a missing finite-arc crossing justification in the proof on pp.958–959, repaired by descending endpoint discs. E3 is a missing justification for the selected successive lifts on p.959, rather than a counterexample to conformal rigidity; the doubled covering and maximal-height argument supplies the missing bridge. E4 is the inverse-square Laplacian misprint on p.961, contradicted by the y^s test and by the square factor in (7.10), p.972. The journal page, linked final PDF, author publication pages and title/erratum search disclosed no published correction. No theorem is rejected merely because these two proof justifications were omitted.

Independent exact arithmetic in Q(√3) and Q(√7) confirms periods [4], [3,2], [3,6] and [3,3,2,2,2]. Their determinant-one word matrices are respectively [[4,−1],[1,0]], [[5,−3],[2,−1]], [[17,−3],[6,−1]] and [[23,−18],[9,−7]]. Their traces recover the least norm-one units 2+√3 and 8+3√7. The ideal-generator norm signs and the D=28 cutoff discriminator were also checked. These calculations support the API/tests; they are not claimed as formal proofs of the roadmap.

## Baseline audit

Read the actual source declaration and surrounding hypotheses for every reference at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All twenty original references are confirmed; none is removed or silently replaced by a current-only declaration. The two covering references below are added. The pinned declaration index and packet checker independently resolve all twenty-two names.

| Library | Confirmed declarations | Scope checked |
| --- | --- | --- |
| Mathlib | `UpperHalfPlane.volume_def`, `UpperHalfPlane.dist_eq` | Curvature −1 area density and distance, with the factor two. |
| Mathlib | `ModularGroup.S`, `ModularGroup.T`, `ModularGroup.im_smul_eq_div_normSq` | Integral matrix signs and exact imaginary-part denominator. |
| Mathlib | `ModularGroup.fdo` | Open inequalities, requiring the separate half-open boundary adapter. |
| Mathlib | `Subgroup.closure`, `Subgroup.closure_le` | Generated subgroup and its universal property. |
| Mathlib | `MeasureTheory.Measure.map_apply`, `MeasureTheory.integral_map` | Measurable-set and a.e. measurability hypotheses for pushforward and integration. |
| Mathlib | `ProperlyDiscontinuousSMul.finite_stabilizer` | Finite stabilizers require proper discontinuity, not freeness. |
| Tau Ceti | `UpperHalfPlane.pslMk_smul`, `UpperHalfPlane.psl2zToPSL2R_smul`, `psl2zToPSL2R_injective` | Effective real/integral actions and injective projective embedding. |
| Tau Ceti | `ModularGroup.isFundamentalDomain_fdo`, `UpperHalfPlane.volume_preimage_coe_null` | Effective a.e. domain and transfer of null planar boundaries. |
| Tau Ceti | `NumberField.NarrowClassGroup.instFinite`, `NumberField.NarrowClassGroup.mkPrincipal_sq` | Finite narrow class group and squared principal classes; J²=1. |
| Tau Ceti | `TauCeti.UpperHalfPlane.isProperMap_psl_smul_I`, `Subgroup.instIsCyclicStabilizer` | Proper orbit map and cyclic point stabilizers for discrete projective subgroups. |
| Mathlib (added) | `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le` | Path-connected, locally path-connected source, compatible based lift, continuous map and induced fundamental-group range inclusion. |
| Tau Ceti (added) | `TauCeti.Deck.conjMulEquiv` | An over-base homeomorphism conjugates deck groups; rebase the target first. |

## Suppliers, scope and closure

Read the reviewed `data/library-coverage.json` audit for all parent F.0–F.6 targets. Compare with current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The parent retains actions, quotient/cone charts, polygon theory, cusp data, cofinite signatures and the level-one modular orbifold. Its general polygon theorem is used with local pairing/cycle hypotheses, without claiming its cofinite converse handles an infinite-area Ford polygon. Current library searches found no existing limit-set or Nielsen-core implementation.

Read ConformalMapping L2/L4, AlgebraicTopology Stages 1/7, DifferentialGeometry Layer 5.3/5.5 and the Stokes signatures, Completed/UniversalCovers Stage 2 with STATUS and the lifting signature, IntegralLattices B2–B3 with LayerBContract, and GlobalNumberFields Layer 11. Current Stokes and form/ideal ownership are explicitly imported instead of planned again. Implemented covering theory is cited at the pins.

Read the exact GN.3 minus-period/class/Pell nodes and the three bottom GN.4 oriented-geodesic, length and reversal nodes; the latter are the only GN.4 construction inputs. GN.4 distribution consumes these core measures and is not an input to them. Read MultiquadraticPartII RQ.2’s J-square criterion and RQ.3’s existing dictionary-adapter request. Read AS.1–AS.2’s DIT (5.7)–(5.10) nodes and the smooth differentiated cusp requirements. Requests retain the t=0 cancellation and do not impose first-Fourier-coefficient normalization.

The original brief’s Bakker–Tsimerman continuation remains with HyperbolicCurveVolumesAndGonality (#1697, review #1726). Its 76-node packet and existing review were checked for ownership; that review is needs_changes, so this report does not describe that plan as accepted. It is not a prerequisite for the Nielsen-core construction. No mathematical ownership moves upward or across roadmaps in this review.

All six layers’ targets have nodes at target granularity. Each proof route ends in explicit lower inputs or work performed by that target. The local node graph is acyclic. Every definition/construction has its API, consuming use and tests, and all remain in sync with the full reader. The compact Lean projection does not invent missing hull, quotient, double or measure carriers. The twenty-nine planet labels identify mathematical objects/constructions and central theorems without using implementation lemmas as destinations.

## Per-node decisions

The full node-ID decisions are also recorded in the packet’s `review.checked` array.

| Node | Verdict | Check |
| --- | --- | --- |
| `N.0/limit-set` | corrected | Import the parent’s canonical ideal-boundary action, already implemented in current Tau Ceti. Retain only the Cayley compatibility and orbit-limit arguments here; include infinity and check the elementary examples. |
| `N.0/nielsen-core` | verified | DIT §2 pp.952–953 and Series pp.32–33 support the closed hull quotient. The away-side convention, boundary half-discs and exclusion of elliptic stabilizers at the boundary are consistent. |
| `N.0/geometric-finiteness` | corrected | Add Series Theorem 3.33 p.21 to the source support. Narrow AT.1 to generic van Kampen; the finite-type surface argument is local work of this target, with finite cone data proved rather than assumed. |
| `N.0/bordered-signature` | verified | Capped genus, cone orders, cusps and genuine boundary circles give the stated signature. The three scalar tests distinguish the sign of the boundary contribution and the curvature normalization. |
| `N.0/core-gauss-bonnet` | verified | The finite polygon and truncation proof gives 2π(2g−2+s+t+Σ(1−1/m)); cusp truncations and paired sides do not add genuine boundary terms. |
| `N.0/boundary-geodesic` | corrected | Replace the unneeded future UniversalCovers request by the parent free quotient charts. Primitive supporting-axis stabilizers give simple cone-free funnel boundaries; arbitrary hyperbolic classes retain the orbifold qualification. |
| `N.1/cycle-group` | verified | The two finite generating sets agree by Sℓ=T^mS₀T^−m. Effective projective involutions have order two, whereas their integral lifts square to −I; raw empty lists and geometric admissibility are distinguished. |
| `N.1/cycle-polygon` | verified | Closed Ford inequalities, split half-turn sides and unit-disc tangencies agree with DIT §3 pp.954–956. A digit two makes an empty ideal interval without a zero arc in the upper half-plane. |
| `N.1/ford-domain` | verified | Height reduction and disjoint-disc normal form justify tiling, the free product, the full cusp stabilizer and genus-zero one-funnel topology. The parent’s cofinite converse is not used. |
| `N.1/rotation-conjugacy` | verified | Subtracting the prefix Nᵣ from centers modulo m gives precisely T^−Nᵣ conjugacy; modular projection compatibility uses an integral translation. |
| `N.1/word-endpoints` | verified | The matrix product telescopes in the stated order and the GN.3 Pell interface supplies primitivity and attracting orientation. DIT (3.5), p.958, has the allowed middle equality for digit two. |
| `N.1/second-kind` | verified | A free ideal interval proves second kind directly. Its shallow strip has infinite area, implying infinite modular index in the valid direction; finite core area comes separately from geometric finiteness. |
| `N.2/axis-cutting` | verified | DIT pp.958–959 and Figure 7 were checked visually. Descending endpoint discs prove finite-arc crossings, including the one-digit endpoint case; normal form and boundary-axis uniqueness give one primitive traversal. |
| `N.2/class-core` | corrected | Replace the false universal height-one core cutoff by a cutoff above all retained arcs, with a named API and D=28 discriminator. Qualify local isometry at genuine boundary points as a half-disc map; properness and rotation compatibility remain valid. |
| `N.2/core-invariants` | verified | The constructed core has signature (0;2 repeated ℓ;1;1), hence area πℓ. This follows from its quotient charts and end decomposition, rather than defining a surface by scalar invariants. |
| `N.2/boundary-length` | verified | The finite cutting maps preserve the full oriented primitive cycle. The imported GN.4 length is 2log of the least norm-one unit, with a negative-norm fundamental unit squared. |
| `N.2/lift-spacing` | verified | Curvature −1 distance between height-one lifts is 2arsinh(|x−y|/2); the logarithmic formula is valid for nonnegative arguments. The examples rule out confusing selected lift spacing with quotient cone-point distance. |
| `N.3/core-double` | verified | Reflection of actual boundary charts produces the hyperbolic double with genus 2g+t−1, doubled cusps and cone list, and twice the area. The t≥1 hypothesis excludes a disconnected double. |
| `N.3/conformal-lift` | corrected | Use the exact pinned based covering-lift and deck-conjugation declarations instead of a future request. State rebasing, connectedness, local path connectedness and compatible lifted basepoints; cone-meridian powers and removable extensions handle the orbifold lift. |
| `N.3/highest-elliptics` | verified | The integral imaginary-part denominator is a positive sum of squares, so heights are at most one. Equality reduces to a translation after the appropriate elliptic stabilizer; the full cusp stabilizer identifies the complete maximal-height set. |
| `N.3/conformal-class` | verified | A cusp-fixing lift is az+b with a>0. Maximal elliptic height forces a=1; least translation period and successive cyclic gaps recover the primitive digits. The theorem fixes the field and retains orientation and cone orders. |
| `N.4/dit-domain` | verified | The half-open convention chooses the left arc and vertical tie representatives. Its difference from the pinned open modular domain is null, so it adapts rather than replaces the existing fundamental-domain theorem. |
| `N.4/core-measure` | verified | Pushforward of the actual upstairs measure has mass πℓ and counts all sheets. Properness supplies finite local density off boundaries and cone points; image area alone would fail the overlap test. |
| `N.4/family-probability` | verified | A nonempty finite family is normalized by πΣℓ. The whole-group and narrow-genus cases use existing finite narrow class groups and square cosets, with modular probability 3μmod/π. |
| `N.4/complementarity` | corrected | Add the full boundary-length identification as a direct input and express cancellation through oriented arc multiplicities. IntegralLattices B2–B3 owns the general form/ideal dictionary; GN.3 supplies only the maximal-order/DIT sign adapter already requested by RQ.3. |
| `N.4/exact-cover` | verified | The involution A↦JA⁻¹ preserves the whole narrow class group, a genus when J is a square, and a singleton when A²=J. Summing complementarity gives the exact normalized modular measure; RQ.2 supplies the sum-of-two-squares criterion. |
| `N.4/small-discriminants` | verified | Exact quadratic recurrence checks all four stated periods; their matrices have determinant one and traces twice the least positive Pell units. Explicit ideal generators have the required norm signs; area sums give multiplicities 9 and 21. D=12 is correctly labeled an additional calculation. |
| `N.5/core-truncation` | verified | A cutoff above all compact boundary arcs leaves a full width-m strip. Paired sides cancel, finite cone-circle contributions vanish, and the top horizontal segment has the required reversed orientation. |
| `N.5/core-stokes` | corrected | Specify real and imaginary parts and a smooth cutoff near the compact polygon to satisfy the current Stokes supplier’s support hypothesis. Check dα=(λ/2)F dμ, the top-flux sign, the separate harmonic branch and the distinction between truncated and absolutely convergent integrals. All cutting maps lie in Γ_A; full modular invariance is required for descent to M, not for those cutting identities. |
| `N.5/spectral-stokes` | verified | AS completed Eisenstein and smooth cusp inputs give integrability and vanishing differentiated flux. At t=0 use cancellation of the completed constant-term poles and the permitted √Y log Y bound; no Hecke normalization is imposed. |

## Validation and next step

- `python3 scripts/check_blueprint.py research/blueprint/packets/FuchsianOrbifoldsPartII.json`: zero errors, zero warnings; six planned stages, none closed.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: passes; no admitted data definitions.
- `lean-check research/blueprint/suggested/FuchsianOrbifoldsPartII.lean`: elaborates at the two pins; only the intended admitted-proof warnings. The compact file has 266 lines.
- Exact example arithmetic, local dependency acyclicity, source/API/test/acceptance synchronization and deliverable-only diff checks pass. No quoted passages or private filesystem paths were added.

No question requires an orchestrator decision. The next programme step is packaging the corrected plan. Fulfill the explicit supplier interfaces during implementation, especially the GN.3 convention adapter, differentiated AS estimates and the current Stokes comparison. Recheck current upstream before packaging; this review does not authorize duplicate work or certify those interfaces as implemented.
