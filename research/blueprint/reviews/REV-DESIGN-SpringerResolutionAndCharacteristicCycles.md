# Independent review: Springer resolution and characteristic cycles

**Verdict: accepted as a complete target-level planning pass.** Reviewer: Codex,
session `codex-bd4Eue`, 19 October 2026; review job
`REV-DESIGN-SpringerResolutionAndCharacteristicCycles`, issue #3617. The design
was written by the different session `codex-cd8S6C` for issue #3471.

Acceptance follows PROTOCOL §0 and the review issue's explicit distinction
between a finished planning pass and proof closure. Every target has a node,
and every node has an individual, justified verdict in the packet. All fourteen
stages remain **planned**, none **closed**. Eleven prerequisite gaps and nine
supplier requests remain explicit. No implementation or proof closure is
asserted; all implementation statuses remain `unchecked`.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 69: 63 verified, 6 corrected, 0 added, 0 unverifiable |
| Kinds | 23 constructions, 5 definitions, 40 theorems, 1 comparison |
| Definition/construction API | 113 items across all 28 nodes |
| Discriminating definition/construction tests | 84; three per node |
| Stages and planets | 14 stages, 60 planets; at most six per stage |
| Baseline declarations | 14 independently confirmed; 0 removed or replaced |
| Source issues | 12 confirmed, 0 rejected; E7 expanded |
| Outstanding boundaries | 11 gaps, 9 supplier requests |
| Suggested Lean | 141 lines; 2 light definitions, 7 theorems, 7 examples |

I checked hypotheses, direct prerequisites, proof outlines, source matches,
definition APIs, tests and uses for all nodes. The target-level granularity is
appropriate: substantial definitions and key theorems have nodes, while routine
arguments remain in proof outlines. The internal dependency graph is acyclic.
Stage target statements agree with the packet and reader document. Each stage's
transitive gap list was recomputed from its nodes' prerequisites.

## Corrections made

1. **F/orbit-geometry.** Added the direct `Lie-invariants` gap for the precise
   Bruhat closure-order theorem. ReductiveGroups Layer 7 names decomposition
   and BN-pairs, but its current statement does not itself supply this exact
   closure theorem. BHS Proposition 2.2.1, pp. 311–312, supplies the orbit
   dimension calculation. Updated the supplier request and coverage.
2. **C/cm-reductive-and-zero.** Added `Lie-invariants` for the characteristic
   bound on the central-isogeny differential and the corresponding flag
   comparison. Existence of an isogeny in ReductiveGroups Layer 8 does not
   establish these comparisons. BHS Proposition 2.3.3, pp. 315–316, also still
   needs the separately recorded `CM-spreading` argument.
3. **S/raw-fibre-product-comparison.** Replaced an unsupported unconditional
   raw-scheme isomorphism by the canonical comparison
   `Z ≅ Q_red → Q`, for `Q = Ñ ×_N Ñ`, which is an isomorphism exactly when
   `Q` is reduced. BHS §2.4, pp. 319–320, gives the variety-level comparison;
   it does not establish the required radicality of the raw fibre-product
   ideal. The `Steinberg-reduced` gap remains isolated to this optional
   strengthening. No downstream characteristic-cycle identity requires it.
4. **D/filtered-pbw.** Corrected the proof outline and source locator for both
   reversed inclusion announcements around Mustață Theorem 2.11: the easy
   inclusion is `F′ ⊆ F`, and the induction proves `F ⊆ F′`, pp. 3–4.
   Expanded existing issue E7 rather than counting a second source issue.
5. **L/flag-d-affinity.** Made the integration requirement for the selected
   finite-dimensional modules explicit: their weights must be characters of
   the chosen group. LieHighestWeight's Lie-module classification alone does
   not give this group-level assertion. Expanded `BB-sections` and added the
   `CategoryO-elementary` boundary for the split reductive extension of the
   upstream semisimple interfaces. BB §§1–2, pp. 15–17, is the source.
6. **L/localisation-equivalence.** Added `CategoryO-elementary` and an explicit
   central-factor/derived-semisimple comparison in the proof outline. The
   current upstream Verma and Harish–Chandra signatures are semisimple;
   they are not yet the claimed split reductive interfaces. Strict central
   reduction remains distinct from generalized infinitesimal character.

Across these corrections, I synchronized the reader's proof outlines, gaps,
requests and source-issue discussion; changed the S-stage target description
to match the conditional comparison; and updated direct gap consumers and
transitive coverage. I also clarified that AlgebraicVectorBundles supplies
total spaces and their dual convention but does not yet state the required
associated-bundle descent and integral-model comparison, and that
ReductiveGroups Layer 9's group models do not automatically give those
associated Lie-bundle comparisons. These are refinements of existing gaps,
not new local plans for upstream work. Review metadata records individual
node verdicts and individual source-issue confirmations. The Lean file needed
no change.

## Source verification

Only the public versions below were used. Downloaded versions match the five
SHA-256 digests already recorded in the packet. I checked every node locator
and the relevant proof arguments independently. The reader and packet contain
mathematical planning statements in original prose, without source excerpts.

| Source | Passages checked |
| --- | --- |
| [BHS19, published paper](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf) | Entire §2, pp. 309–328, including proofs |
| [BR12, published paper](https://www.numdam.org/item/10.24033/asens.2173.pdf) | §1.1, pp. 538–539; Theorem 2.2.1 and Remark 2.2.2, pp. 557–558; §§2.10–2.11, pp. 570–572; Proposition 2.14.2, pp. 574–575 |
| [Mustață, D-modules and singularities](https://websites.umich.edu/~mmustata/DmodulesNotes.pdf) | §§2–3, relevant definitions and proofs, pp. 1–9, 13–17; §5.1, pp. 35–36; transfer, Kashiwara, Bernstein and cycles, pp. 43–56; duality, pp. 62–63; intermediate extension and classification, pp. 72–77; regularity, pp. 93–94 |
| [Beilinson–Bernstein, author-hosted scan](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/BernBeil_Localization_of_g-modules.pdf) | All available pp. 15–17, §§1–3; p. 18 is missing from this scan and remains a boundary |
| [Ginzburg, Lectures on D-modules](https://math.berkeley.edu/~nadler/ginzburg.dmodules.pdf) | §1.1, pp. 4–6; §2.1, pp. 23–24; §4.1, pp. 60–61 |

The packet's twelve source issues were independently checked, including the
printed glyphs/inclusions where extraction could be misleading:

| Issue | Confirmation and locator |
| --- | --- |
| E1 | BHS Lemma 2.3.2, p. 315: global dimensions alone do not imply flatness. The packet correctly uses the local dimension equation. The disjoint union of a constant point and the identity over an affine line tests the missing local hypothesis. |
| E2 | BHS Lemma 2.5.2 proof, p. 326: the graph's generic point belongs to the completed Cartan ambient space. |
| E3 | BHS Theorem 2.4.7 proof, p. 323: both KL indices need the longest-element prefixes; type A1 detects the printed mismatch. |
| E4 | BHS Lemma 2.4.8 proof, p. 324: the cotangent product uses the Springer resolution, with dimension 4N, rather than the Grothendieck product with dimension 4N+2r. |
| E5 | Ginzburg Definition 1.1.12, p. 5: generic rank on the reduced support loses multiplicity; `D/Dx²` has generic length two. Mustață Definition 6.40, p. 55, supplies the appropriate length convention. |
| E6 | BHS Proposition 2.2.5 proof, p. 313: the reference to 2.2.1 has the wrong result type. |
| E7 | Mustață Theorem 2.11, pp. 3–4: both announced PBW inclusion directions are reversed; the actual induction gives the correct result. |
| E8 | Mustață Proposition 6.24 proof, pp. 50–51: the first quotient is Tor₀; the following kernel is Tor₁. |
| E9 | Mustață Theorem 5.5 proof, p. 36: termwise biduality needs finite projective terms, rather than finite generation alone. A finite free resolution supplies the intended argument. |
| E10 | Mustață Theorem 6.20 proof, p. 50: the Euler-operator product must be applied to the chosen section. |
| E11 | Mustață p. 62: the direct image is a module over the target's structure sheaf. |
| E12 | BHS Proposition 2.3.3 proof, p. 316: flatness and one CM special fibre alone do not prove CM at every generic-fibre point. The scaling/projective-flag argument remains a precise proof obligation, not a refutation of the theorem. |

The confirmations distinguish erroneous general assertions or notation from
false conclusions about the source's main theorem. Existing designer errata
search records retain their original date; they are not presented as new
reviewer searches.

## Baseline and ownership

I read actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All fourteen citations are valid for
their stated, bounded uses. **No baseline citation was removed or replaced;
no new node was needed to repair a citation.** The packet now records the
independent check for each entry.

| Declaration(s) | Confirmed scope and hypothesis boundary |
| --- | --- |
| `AlgebraicGeometry.Scheme` | Native locally affine locally ringed space; not a substitute for geometric theorems |
| `CategoryTheory.Limits.pullback` | Requires `HasPullback`; the pinned Scheme category does have the instance in `Mathlib/AlgebraicGeometry/Pullbacks.lean` |
| `AlgebraicGeometry.AlgebraicCycle` | Locally finitely supported coefficients on scheme points, not Chow classes |
| `Module.length` | Extended-natural-valued length; integer coefficients require finiteness |
| `Module.length_eq_add_of_exact` | Linear maps with injectivity, surjectivity and exactness; its ENat equality needs no finite-length premise |
| `AdicCompletion` | Compatible systems of quotients; flatness and branch comparisons require separate inputs |
| `LinearMap.ker` | Native kernel submodule for the fixed-space construction |
| `Module.finrank` | Gives dimension under an explicit finite-dimensionality premise |
| `Finsupp` | Actual finite-support functions on the component set |
| `DerivedCategory` | Requires the abelian-category and `HasDerivedCategory` infrastructure; supplies no D-module transfer or duality |
| `SheafOfModules` | Native sheaf-of-modules carrier and sheaf condition |
| `SymmetricAlgebra` | Native algebraic symmetric algebra; sheaf versions and geometric total spaces remain upstream |
| `TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf` | Native full subcategory; coherence comparison uses a locally noetherian scheme |
| `Finsupp.linearCombination` | Native finite linear-combination map, preserving integer coefficients |

The ownership audit used current TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, separately from the elaboration
pins. I checked ReductiveGroups, AlgebraicVectorBundles and the relevant
LieHighestWeight statements and suggested signatures, the library's existing
finite locally free sheaves and relative differentials, and the reviewed
library-coverage entries. Existing total-space, symmetric-algebra and
differential carriers are imported, not re-planned. The eight cited local
algebra supplier nodes were checked at their statements, including
`ci-cohen-macaulay` in the R03.3 part. General ownership of scheme foundations
does not silently discharge the exact `AG-geometry` requests.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/SpringerResolutionAndCharacteristicCycles.json`: **0 errors, 0 warnings**.
- Independent consistency audit: 69 distinct node verdicts; matching stage and
  reader statements; all 113 API and 84 test statements present in the reader;
  acyclic graph; exact transitive gap sets; matching direct gap consumers;
  all twelve source issues reviewed; planet limits satisfied.
- `lean-check research/blueprint/suggested/SpringerResolutionAndCharacteristicCycles.lean`:
  **exit 0, fourteen expected `declaration uses sorry` warnings, no other
  warnings or errors**. The unchanged file has no sorry-valued data definition.
- Deliverable file validation and `git diff --check`: passed.

## Questions and routing for the orchestrator

These are follow-up ownership/proof decisions, not unfinished review work.

1. Register the existing AlgebraicVectorBundles roadmap in the atlas and route
   associated-bundle descent and integral base-change extensions to its owner.
2. Register the elementary category O supplier with split reductive/central
   character interfaces before L. Keep its later KL multiplicity theorem after
   localisation; making the elementary layer depend on K would create a cycle.
3. Route Bruhat closure order, the characteristic bound for isogeny
   differentials, Jordan/centralizer results and Chevalley restriction to a
   ReductiveGroups Part II extension, without editing the existing roadmap here.
4. Schedule the precisely recorded BR convolution/cycle, CM-spreading,
   D-homological, D-regular and BB-section obligations. Preserve their field,
   handedness, rho-shift and strict-central-character conventions.
5. Keep raw Springer fibre-product radicality optional and isolated from the
   reduced Steinberg cycle route unless a proof supplier establishes it.

The reviewed packet, reader, roadmap definition and unchanged suggested file
are ready for the next programme step with these boundaries visible.
