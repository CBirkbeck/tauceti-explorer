# Independent review: valuation cohomology exports

Accepted after corrections, as a complete **planned** pass. The stage is not closed or implemented: its two recorded gaps and three supplier requests remain. Every new node has a verified or corrected statement and proof outline; no unresolved contradiction remains.

Reviewer: Codex (GPT-6), session `codex-qI28iR`, on 2026-10-10. Job [#7033](https://github.com/CBirkbeck/tauceti-explorer/issues/7033). The original planning session was `codex-kWz8uS`; this reviewer did not write that plan.

## Scope and counts

The packet contains eleven new nodes: nine theorems, one comparison and one lemma. It retains eleven imported H0 nodes, twenty-three baseline declarations, four planet nominations, two gaps and three requests. There are no new definition or construction nodes, hence no newly owned definition API or unit tests. The source-issue list has three entries; all three are independently confirmed. No node, baseline citation, imported definition or planet was added or removed.

The eleven new targets and eleven inherited statements cover the stage's support comparisons, total invariance, finite-boundary constructibility, finite-dimensional/finitely-presented global finiteness, and compatibility with nearby and formal/adic exports. The acceptance examples distinguish the required alternatives and canonical maps. The definition APIs and tests remain in their owner packets, rather than being duplicated in this follow-up.

## Corrections made

1. The constructibility node and reader cited the proof of Huber Proposition 4.2.5 on pp. 251–256. The proof is on printed pp. **249–250**; its statement is on p. 243. Both citations and the proof outline now have the correct locator.
2. The adjunction-descent proof compressed the passage from chartwise cohomology invariance to positive higher-direct-image vanishing. Positive cohomology on an affine étale chart need not vanish. The corrected proof first identifies the presheaves naturally, then sheafifies: the associated sheaf of `U ↦ Hⁿ(U,F)` is `Rⁿ(id_X)_*F`, hence zero for positive n. [Stacks Lemma 59.51.6 (03Q8)](https://stacks.math.columbia.edu/tag/03Q8) supplies this description. The packet now cites it and asks SF.2 explicitly for the sheafification and unit compatibility. The reader and suggested-file comment give the same argument. The actual theorem signature required no change.
3. The rank-one closed-support acceptance example now writes the supported skyscraper as `E=i_*Λ`, making the pushforward explicit.
4. The reader's local-support formulas, open-immersion notation, collapse quantifier and C/D notation now have valid math delimiters. Its stale statement that the finite-boundary alternative was missing now points to the separate constructibility target. The supplier paragraph includes the precise higher-direct-image sheafification input.
5. Added a top-level accepted review with a verdict on every new node, and independent confirmation objects on all three source issues. Updated the Stacks access record to include this review and the newly checked tag.

No baseline citation was removed or replaced. No missing definition was discovered that belongs in this packet.

## Node checks

The following ids have the common prefix `ClassicalAdicEtaleCohomology:H1:valuation-exports/`.

| Node | Verdict | Reason |
| --- | --- | --- |
| `total-cohomology-valuation-invariance` | verified | Hansen–Scholze Corollary 4.5, pp. 22–23, supports arbitrary qcqs schemes and bounded-below prime-power coefficients. Lemma 3.5 and the generic Rj*/ULA inputs have explicit owners; the bounded-below étale/pro-étale transfer keeps the qcqs hypothesis. |
| `total-cohomology-separably-closed-valuation-invariance` | verified | The perfection square uses universal homeomorphisms and canonical pullback composition, with Stacks 04DY; it does not confuse separably closed with algebraically closed in positive characteristic. |
| `closed-support-valuation-invariance` | corrected | The localization argument preserves degree and requires a quasi-compact open complement. Corrected the rank-one acceptance example to the closed-immersion pushforward E=i_*Λ; no sheaf-level Ri! exchange is asserted. |
| `proper-nearby-invariance-coherence` | verified | Checked the actual generic/special fibre maps, exchange morphism and adjunction-unit directions against the inherited proper and nearby constructions. The coherent square is a consequence of the requested canonical-functor laws; the formal transport retains microbial continuity hypotheses. |
| `local-cohomology-valuation-base-change` | verified | Huber Corollary 4.2.6(i), pp. 243–244, has no dominance or finite-type assumption, but requires proper pulled-back boundary and torsion prime to char(X′). The full Proposition 4.2.4 input is requested rather than inferred from the narrower existing nearby node. |
| `local-cohomology-collapsed-boundary-vanishing` | verified | Huber Corollary 4.2.6(ii), p. 244, concerns a proper source boundary and the closed point of its open complement. The Lean specialization and collapse predicates match; it concerns pulled-back sheaves. |
| `torsion-sheaf-total-cohomology-valuation-invariance` | verified | Huber Corollary 4.2.7(i), pp. 244–245, allows arbitrary schemes and invertible torsion orders varying by section. The rank-induction proof and separate arbitrary-torsion approximation request keep this generality. |
| `torsion-sheaf-valuation-adjunction-descent` | corrected | Made the sheafification step explicit using Stacks 03Q8 and Rⁿ(id_X)_*F=0. Global chart cohomology comparison does not say positive chart groups vanish. Sharpened SF.2 and synchronized the reader and Lean comment. |
| `finite-rank-descent-of-valuation-data` | verified | Huber Corollary 4.2.8 proof, p. 245, and Corollary 4.2.9 proof, p. 246, support simultaneous descent. The suggested model includes constructible F₀, boundary pullback and invertibility on X₀. Finite-rank algebraic capture and scheme/sheaf descent remain separately owned requests. |
| `constructibility-along-finite-valuation-boundary` | corrected | Huber Corollary 4.2.8, p. 245, keeps the alternative locally finite presentation OR finite base boundary. Corrected Proposition 4.2.5 proof pages to 249–250; empty/full boundary and the finite-rank branch are accounted for. |
| `constructible-cohomology-finiteness` | verified | Huber Corollary 4.2.9, pp. 245–246, gives finite generation for globally finite-type schemes with finite presentation OR finite-dimensional base. No properness or separatedness is added; the exact separably closed field-finiteness input stays an explicit unread-source supplier request. |

## Sources and prerequisite closure

Huber's maintainer-cleared first edition was read directly, without copying the book, its passages or page images into the workspace. The checks cover Proposition 4.2.4 (statement p. 243, proof pp. 246–249), Proposition 4.2.5 (statement p. 243, proof pp. 249–250), Corollary 4.2.6 (pp. 243–244), Corollary 4.2.7 (pp. 244–245), Corollary 4.2.8 (p. 245) and Corollary 4.2.9 (pp. 245–246). Their distinctions are preserved: arbitrary schemes for sheaf invariance, arbitrary valuation changes for proper-boundary local support, a finite **base** boundary versus local finite presentation, and global finite type plus finite dimension or finite presentation for finite generation.

The public Hansen–Scholze copy was checked at Lemma 3.5 (pp. 16–17), Theorem 4.1 and Corollary 4.2 (pp. 19–20), Theorem 4.4 and Corollary 4.5 (pp. 22–23). The bounded-below consequence permits qcqs schemes without finite type. The perfect-constructible ULA/generic-extension inputs are specifically requested from their owners; no generic ULA definition is planned here.

The public Bhatt–Scholze author copy was checked at Corollary 5.1.6 (p. 35), Proposition 5.2.6 (p. 37) and Lemmas 5.4.1–5.4.3 (p. 39); Lemma 5.4.3 was also checked in the published academic mirror (pp. 153–154). The scheme/étale-to-pro-étale transfer is bounded below and keeps the direct-image map qcqs. The source-version hashes match the packet. Orgogozo Remarks 4.4–4.5 (p. 13) and Lu–Zheng Example 4.26 (p. 37) support the distinctions already recorded between finite type, finite presentation and other exceptional loci; they are not substituted for Huber's full statements.

Stacks tags 0DCQ, 0DCS, 04DY, 09XP, 0A45, 0F0B and 03Q8 were checked. The global support triangle preserves degree in invariance; the sheaf support functor and its local-to-global spectral sequence are separate. The field-invariance input has invertible torsion coefficients. The exact general field-finiteness theorem cited by Huber from SGA 4½, Théorème de finitude 1.10, remains explicitly unread and requested; the review does not claim to have verified that source text independently.

All eleven imported H0 statements were inspected, together with the exact external nodes for EDC.0 derived carriers and supports, L2 higher-cohomology continuity, the nearby exchange/radicial/constructibility statements, and formal-completion base-change naturality. The narrower existing nearby base-change statement is not used as the full Proposition 4.2.4 theorem: the precise enlargement is requested. Finite-rank descent of constructible data is kept distinct from approximation of arbitrary torsion sheaves. The reduced-model lemma is not treated as either of these inputs.

## Pinned baseline and current ownership

Every entry below was read in its cited Mathlib source at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The names exist and supply the stated carriers, predicates or maps. Tau Ceti's pinned baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti theorem is cited as an existing valuation-cohomology theorem.

| Baseline declaration | Confirmed use |
| --- | --- |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | The actual small étale Grothendieck topology of a scheme. |
| `AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology` | With abelian Grothendieck coefficients, étale sheaves form a Grothendieck abelian category; this includes ModuleCat coefficients. |
| `DerivedCategory.Plus` | The bounded-below full subcategory for the canonical derived t-structure. |
| `HasDerivedCategory.standard` | A choice of the cochain-complex localization used by DerivedCategory, not a derived étale functor. |
| `CategoryTheory.Adjunction` | Unit, counit and triangle identities for the imported inverse/direct-image adjunction. |
| `Module.FaithfullyFlat` | Flatness and the nontriviality of reduction modulo every maximal ideal. |
| `ValuationRing` | An integral domain with comparability of divisibility; no rank or topology is imposed. |
| `IsAlgClosed` | Splitting of all polynomials over a field. |
| `IsSepClosed` | Separably closed fields; this does not imply algebraic closure in positive characteristic. |
| `FractionRing` | Localization at non-zero-divisors, a fraction field when the ring is a domain. |
| `AlgebraicGeometry.Scheme.Spec` | The contravariant spectrum functor to actual schemes. |
| `CategoryTheory.Limits.pullback.fst` | The first projection from a categorical pullback, used for X_W → X. |
| `AlgebraicGeometry.IsProper` | Separated, universally closed and locally finite-type scheme morphisms. |
| `AlgebraicGeometry.Scheme.Hom.fiberι` | The actual scheme-theoretic fibre inclusion, not a chosen scheme mapping into a fibre. |
| `AlgebraicGeometry.Scheme.pointSmallEtale` | A geometric point defined by a separably closed field induces a point of the actual small étale site. |
| `CategoryTheory.GrothendieckTopology.Point.sheafFiber` | The fibre functor of a site point; used for elementwise torsion conditions on geometric stalks. |
| `CategoryTheory.constantSheaf` | Sheafification of a constant presheaf, used in the expanded constructibility supplier specification. |
| `DerivedCategory.Plus.singleFunctor` | Embeds a sheaf into the bounded-below category concentrated in the specified degree. |
| `DerivedCategory.Plus.homologyFunctor` | The cohomology object of a bounded-below derived object, in the original abelian category. |
| `AlgebraicGeometry.LocallyOfFinitePresentation` | Affine-local finite presentation; the module explicitly specifies finite presentation by this class together with quasi-compactness and quasi-separatedness. |
| `Topology.IsConstructible` | Constructible subsets generated by retrocompact opens; applies to the valuation base without a noetherian hypothesis. |
| `ringKrullDim` | Krull dimension of a ring, used to say that the valuation base has finite dimension. |
| `Module.Finite` | Finite generation of the resulting coefficient module, rather than finiteness of its underlying set. |

The reviewed library audit marks these valuation-cohomology exports absent. Independently screened current TauCetiRoadmap at `dea8191cc6047d6142a65872ebce6eeeb841a29b` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AdicSpaces and LocalFieldsRamification retain the valuation and henselian foundations; the former does not supply derived étale cohomology. The nine newer roadmaps named in WORKERS.md, including OperatorTheory's subdirectories, and the four named completed roadmaps introduce no matching valuation-cohomology target. Current Tau Ceti's generic site-cohomology comparisons do not discharge the requested scheme functors or valuation theorems. Nothing already present was planned again.

The SF.2, H1:valuation-nearby-cycles and AdicSpaces requests name exact conclusions and their consumers. They explain the two retained gaps. `coverage.status=planned` is therefore honest under PROTOCOL §0: all targets are represented and the unfinished proof interfaces are named. `closed` would be incorrect.

The four current planets satisfy the per-star limit. The proposed three-part assembly must reconcile them with H0's six nominations; this review does not authorize ten planets in an unsplit star.

## Source-issue verdicts

- `E-H1-valuation-exports-1`: confirmed in both Bhatt–Scholze versions. For a direct image from Y to X, realization after direct image uses X and realization of the input uses Y. The test object and final bounded-below input also have their recorded corrected bases.
- `E-H1-valuation-exports-2`: confirmed on Huber's printed p. 246, including visual inspection of the spectral sequence without saving an extract. The coefficient must be F; the finite-rank model has `X ≅ X′ ×_A′ A`.
- `E-H1-valuation-exports-3`: confirmed on the same printed page. The special-fibre counit takes C; the printed generic-fibre D is in a different category.

These are notation corrections with no effect on the intended theorem conclusions. Each packet entry now carries the required independent verdict and reason.

## Validation and follow-up

`python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalAdicEtaleCohomology--H1-valuation-exports.json`: zero errors and zero warnings.

`lean-check research/blueprint/suggested/ClassicalAdicEtaleCohomology--H1-valuation-exports.lean`: elaborated at the shared pinned baseline, exit 0, with twenty-six `sorry` warnings and no other diagnostics. The only subsequent Lean edit adds explanatory comments; the signatures and terms are unchanged. This verifies that the prototypes elaborate, not that the mathematics has been implemented.

Questions for the orchestrator: none needed for acceptance. Continue with the named supplier inputs and normal assembly/packaging; retain the exact hypotheses and the planned/closed distinction.
