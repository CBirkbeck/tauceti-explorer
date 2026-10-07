# ASM-ShimuraVarieties — completed assembly

Issue [#259](https://github.com/CBirkbeck/tauceti-explorer/issues/259). Worker: Codex, session `codex-1HlRed`; claim confirmed by the bot in comment 6027842454. This submission completes the assembly job, not the implementation or independent acceptance of its mathematical plan. It is not a checkpoint.

## Delivered

- [Full reader](../readmes/ShimuraVarieties.md): one purpose/scope/boundary introduction, reconciled conventions and source editions, a ten-layer overview and all 95 nodes, 72 API items and 42 unit-test specifications from the corrected part packets. The three conditional V8 foundations are displayed after V4, before the V5/V6 consumers; their identifiers and parent stages remain unchanged. The chapter includes all supplier requests, gaps, four ownership proposals, and source corrections with part-qualified issue numbers.
- [Combined suggested file](../suggested/ShimuraVarieties.lean): one standard note, one block of 20 distinct Mathlib imports, consistent `TauCeti.Shimura` names and explicit prototype/omission boundaries. The two reviewed prototypes are joined; their declarations and tests are retained. The stale comment treating arithmetic S⁺ as an unconstructed supplier is corrected to name the remaining complex-functoriality and logarithmic-section inputs.
- [V8 packet](../packets/ShimuraVarieties--V8.json): 17 consuming nodes now reference the finer V0–V7 declarations where they supply the required statement. Five redundant internal stage requests are replaced by exact node references; the three residual stage contracts are narrowed, and three corresponding gaps are added to the gap/coverage registers and summary. The V0 packet has no changes.

The full reader is reconstructed from the reviewed packet statements rather than reproducing superseded mathematics in the input readers. It uses the reviewed effective-action/neatness correction, positivity in abelianized components, the effective image of a normal-level action on a disconnected cover, semistable square-zero inertia in the CM reduction proof, connected adjoint S-maps, and the unresolved exceptional central adjustment. In V8 it distinguishes the two-point determinant Shimura set from the strict singleton torus datum, uses E(D) for datum maps, requires a neat target for finite étaleness, imports R13.4a/b for the full modular compactification, and follows Pink 12.10/12.12 for partial/minimal descent. No mixed torus torsor is silently assumed.

## Review and mathematical scope

Both finished input reviews have verdict `needs_changes`: [REV-ShimuraVarieties--V0](../reviews/REV-ShimuraVarieties--V0.md) and [REV-ShimuraVarieties--V8](../reviews/REV-ShimuraVarieties--V8.md). Every review object and source-issue verdict is unchanged. No node statement, hypothesis, proof step, API, test, proposed name, planet, source locator, implementation status or parent stage has changed. The reviewed node mathematics has not been replaced or weakened. Dependency precision and the explicit gap register have changed; independent review should check those changes and the assembled reader.

The packet status `complete` for V8 means its target inventory is complete; it does not mean closure or accepted implementation. V0 remains `partial` because the all-type boundary predicate is incomplete. Across the two packets there are 27 gaps and 45 requests, nine planned layers, one partial layer and zero closed layers. Exact references import the supplier's remaining proof/carrier refinements. Removing a broad internal request does not certify the referenced theorem.

The three additional V8 gaps require: (1) an actual compact-open level index category under the V1 owner; (2) the precise smooth partial-open/log-canonical section interface of Pink 8.2 used in 12.12, refining V2; and (3) promotion of `ReflexNorm.map` to a lemma node with the full-idele field-change norm and Artin restriction, as PROTOCOL §4 requires. These needs were implicit in the old stage requests; the assembly exposes them instead of substituting a nearby node with a weaker statement.

V8's original complex Baily–Borel datum-functoriality/product-embedding/finite-quotient gap and auxiliary-class gap remain open. The three new V8 nodes added by its independent review (extended zero-dimensional Shimura sets, component reciprocity, codimension-one arithmetic extension) remain candidates for re-review as that report requests. The assembly does not close the V0 exact boundary-definition, primary proof, connected symmetry or exceptional-conjugation gaps. Formal parent-stage reassignment of the conditional foundations and the CA.0/CM.S/RG/ALS restructurings still need the orchestrator; only the reading order is applied here.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V0.json`: 69 nodes, 56 API items, 27 tests; zero errors and zero warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties--V8.json`: 26 nodes, 16 API items, 15 tests; zero errors and zero warnings after reconciliation.
- Combined dependency traversal: 95 unique nodes, every internal node reference resolves, no cycle. The V4 conditional foundations have no V5–V7 existence dependency.
- Reader/packet comparison: each node appears exactly once, with its exact statement, hypotheses, proof steps, API, tests and acceptance properties. Source locators and proposed names are retained. All 133 explicit anchors and 658 internal links resolve. Duplicate source identifiers `svi`/`milne-svi` denote the same PDF; overlapping source-issue numbers are qualified by part.
- Suggested-file comparison: all 95 proposed node names, 72 API names and 42 test names are represented by declarations, labelled examples or explicit omissions; one standard note and 20 unique imports. This counts an honest omission manifest as an omission, not as a Lean declaration.
- `lean-check research/blueprint/suggested/ShimuraVarieties.lean`: exit 0, no errors, 79 warnings, all exactly `declaration uses sorry`. Available memory before checking was 105 GiB; one check ran and finished. The shared Mathlib source was at exact pinned commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared project root has a different Tau Ceti revision from `f790474`; the combined file imports only Mathlib, and no Tau Ceti declaration is used or certified by this compile.
- Submission file checks and `git diff --check` are recorded below after final validation.

Compilation verifies the native group-action and categorical slices plus the incomplete scheme signature sketches. It does not construct Shimura data, analytification, canonical-model existence, logarithmic sections or any omitted advanced signature. Numerical proxy examples alone do not establish the arithmetic modular comparisons. Every implementation status remains `unchecked`.

## Assembly source and library footprint

Read WORKERS, the blueprint and expansion protocols, UPSTREAM_GUIDE, the whole issue, the two finished review reports, part packets and reader/prototype material, the ShimuraVarieties atlas entry and reviewed library audit, and all touching link maps. The upstream ReductiveGroups and HodgeStructures roadmaps supplied style and boundary checks. The assembly inspected each of the 15 distinct cited Mathlib baseline declarations at the exact pinned commit; they supply generic carriers and operations only. No new Tau Ceti baseline declaration is cited.

The original part source audit and edition records remain authoritative for their respective nodes. For the assembly, fetched the matching public Milne SVI, Pink dissertation and Deligne 1971 PDFs and inspected the relevant passages for the cross-part canonical/descent and pure partial/minimal compactification route. This is not a new full audit of the CM, Baily–Borel, Borel, Kazhdan or exceptional conjugation primary proofs. The source bytes checked in scratch were:

| Source | Public URL | SHA-256 | Access date |
| --- | --- | --- | --- |
| Milne, SVI (2017) | https://www.jmilne.org/math/xnotes/svi.pdf | `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e` | 2026-10-07 |
| Pink, author-typeset dissertation | https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf | `6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669` | 2026-10-07 |
| Deligne, Bourbaki exposé 389 | https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf | `054847cecac9c396e2a6f568443db180786a0c5528ec08530fd464d5474bd534` | 2026-10-07 |

The V0 source-issue E8 allegation remains rejected: a fat point in the intended nilpotent analytic category does not establish an error in the specific convention of SVI Remark 3.9. The assembled reader does not adopt that alleged source correction. Confirmed corrections retain their individual source/version scopes.

## Submission scope

The issue's full instructions expressly permit correcting the two listed part packets. This submission uses that permission for V8's prerequisites, requests, gaps and coverage notes. The queue's `outputs` array currently lists only the three assembled outputs; `intake.py` therefore treats the packet correction as outside that array and may leave this PR to the maintainer, although it is explicitly authorized by task 2 and the issue's RULES. Do not broaden the PR to queue/data changes or remove the necessary packet corrections to hide this mismatch. The maintainer can reconcile the queue with the issue's allowed scope.

## Resume point for independent review and supplier work

The assembly itself is complete. Review the full reader and combined prototype against the packet/review inputs, check the 17 dependency substitutions and three explicit residual gaps below, and schedule the part revisions/re-reviews without changing their existing verdicts. For formalisation start at CA.0/AA/ALS and the exact V2 boundary predicate; then expose the promoted reflex-norm lemma and partial-open/logarithmic interface before claiming compactification closure. The following register preserves every current request, gap and ownership proposal needed by the next worker; no scratch artifact is required to resume.

## Cross-part reference substitutions

Only prerequisite lists change in these nodes. Broad stage contracts which still lack an exact supplier node remain beside the finer references and an explicit gap.

| Consumer | Replaced broad references | Added exact references or residual stages |
| --- | --- | --- |
| `ShimuraVarieties:V8/translation-descent` | `ShimuraVarieties:V1`, `ShimuraVarieties:V3`, `ShimuraVarieties:V4` | `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/hecke-density` |
| `ShimuraVarieties:V8/level-tower` | `ShimuraVarieties:V1` | `ShimuraVarieties:V1/holomorphic-level-maps`, `residual ShimuraVarieties:V1` |
| `ShimuraVarieties:V8/translation-laws` | `ShimuraVarieties:V1` | `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-level-maps` |
| `ShimuraVarieties:V8/finite-level-maps` | `ShimuraVarieties:V1`, `ShimuraVarieties:V3` | `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization` |
| `ShimuraVarieties:V8/hecke-span` | `ShimuraVarieties:V1` | `ShimuraVarieties:V1/holomorphic-hecke` |
| `ShimuraVarieties:V8/datum-functoriality` | `ShimuraVarieties:V3` | `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/hecke-density`, `residual ShimuraVarieties:V4` |
| `ShimuraVarieties:V8/zero-dimensional-shimura-variety` | `ShimuraVarieties:V4` | `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/torus-model` |
| `ShimuraVarieties:V8/component-reciprocity` | `ShimuraVarieties:V0` | `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/hecke-density`, `residual ShimuraVarieties:V4` |
| `ShimuraVarieties:V8/abelian-instance` | `ShimuraVarieties:V6` | `ShimuraVarieties:V6/abelian-canonical` |
| `ShimuraVarieties:V8/gl2-moduli-reciprocity` | `ShimuraVarieties:V4`, `ShimuraVarieties:V5` | `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V5/main-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/siegel-canonical` |
| `ShimuraVarieties:V8/gl2-determinant-pairing` | `ShimuraVarieties:V4` | `ShimuraVarieties:V4/geometric-artin` |
| `ShimuraVarieties:V8/gl2-compact-model` | `ShimuraVarieties:V2` | `ShimuraVarieties:V2/baily-borel` |
| `ShimuraVarieties:V8/codim-one-extension` | `ShimuraVarieties:V2` | `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/baily-borel`, `residual ShimuraVarieties:V2` |
| `ShimuraVarieties:V8/minimal-descent` | `ShimuraVarieties:V3` | `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `residual ShimuraVarieties:V2` |
| `ShimuraVarieties:V8/minimal-map-extension` | `ShimuraVarieties:V3` | `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `residual ShimuraVarieties:V2` |
| `ShimuraVarieties:V8.general/general-tower` | `ShimuraVarieties:V7` | `ShimuraVarieties:V7/general-canonical` |
| `ShimuraVarieties:V8.general/general-minimal` | `ShimuraVarieties:V7` | `ShimuraVarieties:V7/general-canonical` |

The original V0→V8 references from Hodge inheritance and Hodge uniqueness already used exact node identifiers and are retained. Removed internal stage requests are V0, V3, V5, V6 and V7; their consuming nodes now cite the exact component, algebraization/quotient, CM/Siegel, abelian-model and general-model statements. V1/V2/V4 stage requests remain only for the narrowed missing interfaces. The original 42 external requests (20 in V0, 22 in V8) are retained; the five internal substitutions leave three internal requests, for 45 total.

## Complete request register

Requests below are the current packet text, with all consuming nodes retained. The earlier broad internal requests are superseded by the exact substitutions just listed. Supplier implementation and review status are not inferred from this register.

### Part V0: 20 requests

**V0 R1. `AdelicAlgebraicGroups:AA.3`**

Strengthen the existing arithmetic-subgroup-of-level discreteness node to: G(Q)∩aKa⁻¹ is commensurable with G(Q)∩GL_n(Z) for every faithful rational embedding and compact open K. Preserve finite-index rational component stabilizers. Import class-number-finite separately; do not replan reduction theory in V0.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`.

**V0 R2. `AdelicAlgebraicGroups:AA.4`**

Extend the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or quotient-action degree. Supply finite topological level maps, the effective kernel of a normal K/K′ action, Hecke-span composition via double cosets, and the Cartesian comparison only with its precise U′L=U hypothesis. Arithmetic neatness remains owned by D5/AA.4. Distinguish the effective normal-level quotient action from the full automorphism group over the base of a disconnected cover. Specialize the existing class-set/Kneser/Hasse nodes for components; expose the integral almost-all-prime image and openness refinement of SVI 5.21.

Consumers: `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`, `ShimuraVarieties:V0/simply-connected-components`.

**V0 R3. `ArithmeticLocallySymmetricSpaces:ALS.0`**

Properness of the symmetric-space isometry action, arithmetic finite covolume after compact ineffective factors, and the finite normalizer-index/finite automorphism theorem for torsion-free arithmetic Hermitian quotients. For weak conjugation additionally supply the precisely ranked S-arithmetic arithmeticity and superrigidity conclusions of Milne 1983 §§3.5–3.7; these additions are an explicit extension gap, not already present ALS.0 outputs.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/finite-rigidifying-points`.

**V0 R4. `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`**

Import the existing rational parabolic/root, maximal-torus, Weyl and reductive structural theory only. The rational real-density theorem, arithmetic images, restriction-of-scalars classification of Q-simple groups, real maximal-torus conjugacy, corrected finite-place H¹(k,Z) injectivity, adjoint Hasse principle, norm/weak-approximation assertions and root-centre identities require the specified ReductiveGroups Part II extension, recorded as a gap. The adelic ν-image/class-set and simply connected torsor inputs are imported separately from AA.4; none is claimed as an existing upstream Layer 7 output. For the exceptional §3.10 adjustment, import the exact Platonov–Rapinchuk rank-one perfection result and prove its marked-torus/central comparison; do not attribute simplicity of the full reductive Hα to it (E12).

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`.

**V0 R5. `ReductiveGroupsPartII:RG2.0a`**

Weil restriction of affine group schemes, torus norms and their split character/cocharacter products, base-change maps and diagonal embeddings for finite field extensions. Apply these to the reflex norm and auxiliary totally real extension.

Consumers: `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`.

**V0 R6. `ComplexComparisonPartII:C0`**

Analytification of locally finite-type complex schemes as locally ringed spaces, including nonreduced spaces; compatibility with products, open and closed immersions, étale local isomorphisms and smooth manifolds; faithful analytic comparison of morphisms and invariant local finite quotients. The missing analytic category and gluing carrier are specified in the CA.0 ownership proposal and gap, rather than assumed to be in PR196 or retired LI.2.

Consumers: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/unique-algebraization`.

**V0 R7. `ComplexComparisonPartII:C2`**

Projective GAGA for coherent sheaves and ideals, section comparisons and algebraization of projective analytic data, applied to the already constructed automorphic compactification.

Consumers: `ShimuraVarieties:V2/baily-borel`.

**V0 R8. `ComplexComparisonPartII:C4`**

Chow for closed projective analytic subspaces and graph algebraicity between proper algebraic schemes; proper graph comparison after normal-crossing compactification. The added definable-graph route requires an independent arithmetic-to-algebraic definability comparison, polarized period-map definability and Peterzil–Starchenko o-minimal Chow; route those additions to a Complex Comparison Part II extension, with gaps until certified.

Consumers: `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V5/weight-one-algebraization`.

**V0 R9. `tauceti:TauCetiRoadmap/ModularCurves#layer-0-scheme-theoretic-prerequisites`**

Import Layer 0D’s already specified equivalence between finite continuous absolute-Galois sets and finite étale field schemes, with products and morphisms. Import Layer 0C’s invariant affine quotient/free-action gluing API. A general finite-group quotient of a normal quasi-projective characteristic-zero scheme still needs an invariant ample line bundle and invariant affine cover; request that exact extension from the algebraic-moduli owner rather than repeating the finite Galois-set construction in V4.

Consumers: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/torus-model`.

**V0 R10. `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**

Absolute arithmetic Artin reciprocity, continuity and kernel, compatibility of norms with restriction, ray class fields and generation by good primes. The upstream README §Conventions explicitly fixes arithmetic Frobenius; geometricArtin in V4 inverts that map. CM norm-kernel lemmas are proved in V5, not supplied by class field theory alone. Do not read a generic Hasse norm theorem or Chevalley’s topology on global units into Layer 11: their common-owner Part II proposal is the separate CM norm-kernel inputs gap.

Consumers: `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`.

**V0 R11. `AlgebraicModuliForArithmeticGeometry:R09.3`**

Faithful base change and effective continuous quasi-projective descent of schemes/morphisms, including Milne 1999 Theorem 1.1 under infinite transcendence degree and its finite rigidifying-point criterion. Descend invariant closed images and finite quotient towers with compatible maps. Also expose the general characteristic-zero quasi-projective finite-group quotient through an invariant ample line bundle and invariant affine open cover; current 0C alone does not assert that general result.

Consumers: `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

**V0 R12. `AlgebraicModuliForArithmeticGeometry:R09.4`**

Finite group quotient stacks with actual inertia and common-normal-refinement equivalence, for the AGHMP generic torus stack.

Consumers: `ShimuraVarieties:V4/aghmp-stack-comparison`.

**V0 R13. `AlgebraicModuliForArithmeticGeometry:R09.5`**

Existence and finite quotient description of the coarse moduli scheme for the specific AGHMP finite-inertia torus stack; distinguish it from the stack.

Consumers: `ShimuraVarieties:V4/aghmp-stack-comparison`.

**V0 R14. `AlgebraicModuliForArithmeticGeometry:R09.7d`**

For smooth quasi-projective schemes in characteristic zero, a smooth projective compactification whose boundary is a simple normal-crossing divisor, including the local punctured-polydisk charts after analytification. General smooth sources reduce by quasi-projective open covers.

Consumers: `ShimuraVarieties:V3/borel-algebraicity`.

**V0 R15. `PELModuli:M3`**

Generic rational Siegel moduli with actual polarization and integral/adelic symplectic level, including the fine/neat and coarse/non-neat distinctions, its analytic family/uniformization and the moduli map used after V3 to algebraize weight-one variations. This request uses M0–M3 only; M4 canonical models are not an input to V5.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/siegel-canonical`.

**V0 R16. `AbelianSchemesAndArithmeticModuli:A2`**

Dual abelian schemes, rational polarizations and Rosati involutions, with E-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

Consumers: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-polarization-level`.

**V0 R17. `AbelianSchemesAndArithmeticModuli:A3`**

Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/cm-polarization-level`.

**V0 R18. `AbelianSchemesAndArithmeticModuli:A4`**

Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and Lie-eigenspace comparison, including faithful action of quasi-isogenies.

Consumers: `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/shimura-taniyama`.

**V0 R19. `AbelianSchemesAndArithmeticModuli:A5`**

The analytic equivalence of polarizable integral homological type (−1,0),(0,−1) variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is V5 after M3 and Borel; A5 must not use V5 to provide its analytic equivalence.

Consumers: `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`.

**V0 R20. `AbelianSchemesAndArithmeticModuli:A6`**

Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, rigidity and spreading of endomorphisms, and specialization of CM endomorphisms. For the Frobenius proof, supply the positive-characteristic rational Hom/Tate comparison or the precise Milne 10.8 substitute showing Frobenius lies in the specialized CM algebra; do not assume all geometric special-fibre endomorphisms lift.

Consumers: `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/siegel-special-cm`.

### Part V8: 25 requests

**V8 R1. `AlgebraicModuliForArithmeticGeometry:R09.2`**

The relative Hom scheme of cocharacters Hom(G_m, T) for the family of maximal tori T_v over the regular semisimple locus V of Lie(G), representing Deligne's incidence cover W -> V (Deligne 5.1) as a finite étale V-scheme, with its base change.

Consumers: `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

**V8 R2. `AlgebraicModuliForArithmeticGeometry:R09.3`**

Faithful field base change on morphisms; descent along C/E of morphisms fixed by Aut(C/E) (Milne 13.1) and of closed subschemes; effective polarized projective descent; flat base change of global sections of an invertible sheaf on a quasi-compact separated E-scheme; dense-open equality for reduced source and separated target.

Consumers: `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/codim-one-extension`.

**V8 R3. `AlgebraicModuliForArithmeticGeometry:R09.5`**

Finite quotients of quasi-projective schemes by finite group actions (effective quotients), descent of finite/surjective/étale properties, normal projective curve compactifications and finite correspondences, and scheme-theoretic closure compatible with extension of fields.

Consumers: `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/codim-one-extension`.

**V8 R4. `InverseGaloisAndArithmeticFundamentalGroups:IG.2`**

Hilbert irreducibility for a finite étale cover over a number field with geometrically irreducible total incidence variety, prescribed nonempty real open, and linear disjointness from a fixed finite extension. Existing elementary-polynomial nodes do not state this.

Consumers: `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

**V8 R5. `ModularCurvesPartII:R12.1`**

Uniformisation E(C) ≅ C/Lambda with H_1(E,Z) = Lambda, compatible with Tate modules and full level-N bases, and the analytic formula for the scheme-theoretic Weil pairing; in particular the reference root zeta_ref = e_N(tau/N, 1/N) on C/(Z tau + Z), Im tau > 0, is independent of tau (the calibration behind E2).

Consumers: `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-cusps-tate`.

**V8 R6. `ModularCurvesPartII:R12.2`**

Analytic uniformization of the full ordered level N >= 3, fixed-pairing, Gamma1 (N >= 4) and coarse Gamma0 (every N > 0) curves as isomorphisms, with the ordered-basis determinant identified with the chosen root of unity. Agreement with AA.5's adelic component calculation is AA.5's own target, since AA.5 consumes R12.2.

Consumers: `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`.

**V8 R7. `ModularCurvesPartII:R12.3`**

Cusp labels, effective stabilizers and widths, analytic parameter exp(2 pi i z/w) and its transformation under level maps.

Consumers: `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-cusps-tate`.

**V8 R8. `ModularCurvesPartII:R12.4`**

Open fixed-pairing fibre geometrically connected and irreducible, deduced from Gamma(N) quotient without importing arithmetic compactification.

Consumers: `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`.

**V8 R9. `ModularCurvesPartII:R12.5`**

The basic isogeny correspondences on the modular curves (both legs as moduli maps), their description on the upper half-plane, and the pullback and trace normalization of the Hecke action on differentials. The adelic dictionary for nonintegral g is V8's row-basis node, not R12.5.

Consumers: `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

**V8 R10. `ModularCurvesPartII:R12.6`**

Compatibility of the analytic–algebraic comparison with level changes, diamond operators and complex conjugation; fields of definition of the components and of the canonical cusp. Residue fields of all cusps come from R13.4b.

Consumers: `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

**V8 R11. `ModularCurvesPartII:R13.4a`**

Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute Layer-10 prime diamond quotients.

Consumers: `ShimuraVarieties:V8/gl2-compact-model`.

**V8 R12. `ModularCurvesPartII:R13.4b`**

Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

Consumers: `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

**V8 R13. `PELModuli:M3`**

Genus-one fine full ordered-basis generic-fibre moduli scheme with N >= 3, homology/Tate comparison to the GL2/GSp2 complex double quotient.

Consumers: `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

**V8 R14. `PELModuli:M4`**

Actual normalized CM action on genus-one full-level moduli and its agreement with the V4 special-pair reciprocity condition, including all determinant components.

Consumers: `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

**V8 R15. `PELModuli:M5`**

The genus-one Siegel moduli and its comparison with #81's Y_full(N) (N >= 3), including the determinant/Weil-pairing convention, the basis-change determinant exponent and the cyclotomic target.

Consumers: `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

**V8 R16. `ShimuraCompactifications:C1`**

Complex rational boundary components with their parabolic subgroups and Levi quotients; the codimension-one components are those attached to surjections G -> PGL2,Q; the quotient data (G,X)/SL2,Q and (G̃,X̃) for G̃ = G ×_{PGL2} GL2 used in Pink 12.10. Arithmetic descent is V8's codim-one-extension.

Consumers: `ShimuraVarieties:V8/codim-one-extension`.

**V8 R17. `ShimuraVarieties:V1`**

The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither the reviewed V1 packet nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

Consumers: `ShimuraVarieties:V8/level-tower`.

**V8 R18. `ShimuraVarieties:V2`**

Refine the complex Baily–Borel interface at neat level: the partial open M_K(C)^+ obtained by adjoining all codimension-one strata is smooth with smooth boundary divisor and complement of codimension at least two; sufficiently high powers of omega[dlog] are globally generated there and embed the full minimal compactification (Pink 8.2, BB66 10.11). Also supply the Pink 12.10 product closed immersion and finite-quotient statements and extension of datum morphisms to complex minimal compactifications. Existing rational-boundary, baily-borel, automorphic-finite-generation, koecher and minimal-level-extension nodes are cited separately and do not yet state these refinements. The arithmetic construction is V8/codim-one-extension, not a missing mixed torus-torsor input.

Consumers: `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`.

**V8 R19. `ShimuraVarieties:V4`**

Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

Consumers: `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/component-reciprocity`.

**V8 R20. `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`**

Connected centralizers of cocharacters, conjugacy and geometry of maximal tori, regular semisimple Lie open and compact-mod-centre real tori. Import this structure theory; the incidence specialization belongs to the requested IG.2/R09.2 contracts.

Consumers: `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

**V8 R21. `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`**

Existing full ordered-basis scheme for N >= 3 and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. R12.1/R12.2 supply the analytic comparison.

Consumers: `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`.

**V8 R22. `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`**

Existing fine Gamma1 moduli scheme for N >= 4 with a point of exact order; the K1 stabilizer dictionary uses the first row-basis generator.

Consumers: `ShimuraVarieties:V8/gl2-gamma1`.

**V8 R23. `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`**

Existing characteristic-zero coarse Gamma0 cyclic-subgroup moduli: Y_0(1) is the coarse j-line and, for N >= 3, Y_full(N)/B by the coarse Borel-quotient formula. No universal elliptic family is claimed.

Consumers: `ShimuraVarieties:V8/gl2-gamma0`.

**V8 R24. `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`**

The equivalence between finite étale K-schemes and finite continuous Gal(K^s/K)-sets over a field K, used to attach a scheme to the Galois set of formula (64).

Consumers: `ShimuraVarieties:V8/zero-dimensional-shimura-variety`.

**V8 R25. `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`**

Coarse moduli M([Gamma0(N)]) as a finite quotient of a rigidified representable cover, for N = 2, where 9E's Borel-quotient formula is not used.

Consumers: `ShimuraVarieties:V8/gl2-gamma0`.

## Complete gap register

These are mathematical planning or signature gaps, not unfinished assembly tasks. Part-qualified G labels match the assembled reader; the packet gap titles remain authoritative.

### Part V0: 20 gaps

**V0 G1. Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3**

Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison. Encode CA.0→C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3 and list those consumers in the PR196 external record. C0/repair-analytification supplies a requested target, not a constructed carrier. The issue permits no edits to those supplier/atlas files, so the repair is a concrete unapplied ownership proposal.

Consumers: `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V3/borel-extension`.

**V0 G2. Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28**

The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7). Encode M5/M6 or CA.0→AnalyticToricGeometry Layer 3 and M7 or CA.0→C0, with the direct V1 edge. If PR279 is tracked instead, expose those milestones as real stage ids. Update its external consumers and declared_by_areas with AnalyticToricGeometry. LI.4/LI.2 are retired and provide none of this; no edge through them remains in the packet.

Consumers: `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V1/analytic-structure`.

**V0 G3. Arithmetic and effective-level supplier extensions**

AA.3/arithmetic-subgroup-of-level currently states discreteness, not the required arithmetic commensurability. AA.4 covering/freeness has a real stabilizer compact-mod-A_G hypothesis; rational central units in general Shimura data require an effective-domain extension. The two stage requests specify exactly these missing outputs.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`.

**V0 G4. Baily–Borel primary proof decomposition**

Milne SVI 3.12–3.13 gives the correct proof path but explicitly says the only full proof is Baily–Borel (1966). Publisher access did not yield the full primary text. Certify §§3–4 rational boundary incidence/Satake compactness; §§5–7 Poincaré–Eisenstein convergence/restriction; §§8–10 analytic local rings/normality, separation, finite generation and graded projective realization; identify exact weight and growth conventions and finite-index boundary extension. These nodes are proof obligations, not imported theorem axioms. General rational boundary and automorphic growth signatures stay mathematically specified until this source/carrier refinement.

Consumers: `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`.

**V0 G5. Borel multivariable extension proof source**

SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument. Obtain the original algebraicity paper or a full public proof and certify the extension across (Δ*)ʳ×Δˢ with torsion-free effective target. Projective SNC source compactification is separately requested from R09.7d.

Consumers: `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`.

**V0 G6. Independent definable comparison and graph suppliers**

Certify the PS13/KUY16 theorem comparing the algebraic Baily–Borel definable structure with arithmetic fundamental-set charts independently of Borel algebraicity; state the o-minimal structure precisely. Import/propose a single owner for BKT period-map definability and Peterzil–Starchenko o-minimal Chow, with the corrected maximal-compact and Cartan conditions. A bare arithmetic-definable graph is not yet a graph in the algebraic-target definable structure.

Consumers: `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`.

**V0 G7. Full CM spreading and specialization inputs**

Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field, and the A6 positive-characteristic Hom/Tate comparison used to identify Frobenius with E. Integral eigenspace splitting in the unramified Frobenius calculation is over O_{k,P}, not globally O_k, as the published author erratum corrects.

Consumers: `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/shimura-taniyama`.

**V0 G8. Connected canonical symmetry and coherence**

Read and specify Deligne 1979 §§2.7.10–2.7.13 completely: the adelic/Galois extension acting on the connected Qbar model, its group law, congruence completions, special reciprocity and reconstruction of finite components. The scanned 1983 appendix certifies the complex completion action only. The algebraic inverse system with completion alone is not the entire connected canonical object.

Consumers: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/conjugation-cocycle`.

**V0 G9. Serre/Taniyama extension common owner**

MS1982c pp.229–230 and 242–243 and MS1982d p.281 were inspected, including the actual contracted product. No atlas layer owns the Serre protorus and Taniyama extension with finite-adelic section and compatible cocycle. Propose Complex Multiplication and Explicit Reciprocity, Part II, first new layer CM.S: Serre character lattice (σ−1)(c+1)χ=0, global Weil/class-formation extension, norm-compatible finite-adelic section, torsor multiplication and marked-cocharacter pushout. This is beyond existing CM.0 types/reflex types; refine the uninspected extension proof in MS1982c §§2–3. Supply CM.S→V7/conjugated-datum, with no CM.2/CM.4→V5 cycle.

Consumers: `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/conjugation-cocycle`.

**V0 G10. Kazhdan exceptional uniformization proof**

Milne 1983 Theorem 3.2 is a key theorem with proof references, not a full proof. Decompose Kazhdan’s universal-cover and lattice theorem for exceptional noncompact E₆/E₇/mixed D cases, including its analytic metric inputs; no general Langlands conjugation theorem can serve as an axiom. Route reusable metric results to the analytic supplier and retain this arithmetic conjugation application in V7.

Consumers: `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`.

**V0 G11. S-arithmetic and central-cohomology supplier extension**

ALS.0 does not yet expose Milne §§3.5–3.7: recovery of a Q-group from irreducible S-arithmetic lattices at total rank≥2, local finite-prime identifications and superrigidity. Extend ReductiveGroupsPartII for corrected Lemma 3.8: for simply connected semisimple G with no A_n factor n≥4, H¹(k,Z(G))→∏_{v finite}H¹(k_v,Z(G)) is injective; plus the adjoint Hasse principle/real localization and torus norm weak-approximation assertions used in §§6.3–6.6. Preserve the actual hypotheses; no arbitrary finite group cohomology theorem is asserted.

Consumers: `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/special-independence`.

**V0 G12. A₁ comparison and completion density**

Canonical-model existence for A₁ is not itself its marked conjugation comparison. Certify the CM/Siegel comparison bridge in 1983 Remark 1.5/MS1982d §9 and its functorial inclusion. Read MS1982d §8 and corrected 1983 Proposition 6.1 for the exact finite totally real base-extension density in the congruence completion. Do not revive the deleted extra A₁-generation claim in the annotated scan.

Consumers: `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`.

**V0 G13. General quasi-projective finite quotient API**

ModularCurves Layer 0D already explicitly plans the finite-continuous-Galois-set/finite-étale-field-scheme equivalence; V4 imports it. The remaining extension is the invariant ample line bundle and invariant affine-cover quotient API for a general finite-group action on a normal quasi-projective characteristic-zero scheme, supplied once by the algebraic-moduli owner. Current Layer 0C states affine/free-action cases, so it alone is not the general quotient theorem.

Consumers: `ShimuraVarieties:V3/finite-quotient-algebraization`.

**V0 G14. Suggested signatures requiring absent mathematical carriers**

The exact mathematical declarations/API/tests are named in the reader and in the suggested file’s explicit omission manifest. The pinned libraries contain no pure Shimura datum, nilpotent complex analytic-space category/analytification, canonical model special-pair predicate, automorphic boundary section ring or connected canonical Galois extension. Their full Lean conditions cannot be stated yet. Section 13 requires omitting such conditions honestly: the compiled prototype implements the genuine double-orbit carrier and geometric Artin conversion at the native group-action/group-hom level, and gives no Prop-valued fake fields, unproved existence instances or schematic True conclusions. Restore each omitted signature when the recorded owner supplies its carrier, preserving all names and discriminating tests. Compilation certifies only the stated prototype, not the advanced mathematics. The point prototype specifies the orbit set without its quotient topology; the Artin prototype specifies inversion of a supplied homomorphism without constructing global reciprocity, profinite continuity or the literal number-field tests. Those mathematical specializations are also omitted conditions, not certified by the native tests.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V0/stabilizer-commensurable`, `ShimuraVarieties:V0/neat-sublevels`, `ShimuraVarieties:V0/effective-proper-action`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V1/analytic-points`, `ShimuraVarieties:V1/analytic-structure`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-hecke`, `ShimuraVarieties:V1/datum-analytic-map`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/satake-compactness`, `ShimuraVarieties:V2/analytic-automorphic-ring`, `ShimuraVarieties:V2/poincare-eisenstein`, `ShimuraVarieties:V2/normal-analytic-compactification`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V3/borel-extension`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/unique-algebraization`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V3/definable-target-comparison`, `ShimuraVarieties:V3/definable-borel`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/torus-model`, `ShimuraVarieties:V4/aghmp-stack-comparison`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V5/weight-one-algebraization`, `ShimuraVarieties:V5/cm-abelian-variety`, `ShimuraVarieties:V5/cm-tate-rank-one`, `ShimuraVarieties:V5/cm-number-field-model`, `ShimuraVarieties:V5/cm-potential-good-reduction`, `ShimuraVarieties:V5/cm-frobenius`, `ShimuraVarieties:V5/shimura-taniyama`, `ShimuraVarieties:V5/cm-ideal-reciprocity`, `ShimuraVarieties:V5/main-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/siegel-canonical`, `ShimuraVarieties:V6/hodge-inheritance`, `ShimuraVarieties:V6/hodge-canonical`, `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/connected-full-equivalence`, `ShimuraVarieties:V6/connected-products`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/conjugated-datum`, `ShimuraVarieties:V7/kazhdan-uniformization`, `ShimuraVarieties:V7/weak-conjugation`, `ShimuraVarieties:V7/marked-conjugation`, `ShimuraVarieties:V7/completed-conjugation-equivariance`, `ShimuraVarieties:V7/special-independence`, `ShimuraVarieties:V7/conjugation-cocycle`, `ShimuraVarieties:V7/finite-rigidifying-points`, `ShimuraVarieties:V7/continuous-descent`, `ShimuraVarieties:V7/general-canonical`.

**V0 G15. Adelic abelianization integral images**

AA.4/class-set-abelianization and its simply connected Kneser/Hasse nodes are actual existing plans. For the rational-positivity specialization also expose ν(G(Q)_+)=T(Q)∩ν(Z(R)), and certify SVI 5.21: after spreading ν to a smooth model with connected kernel, Lang gives residue-field surjectivity at almost all finite primes and smooth Hensel lifting gives integral surjectivity. Combine this with local openness to show ν(K) compact open and with restricted-product surjectivity. This is an AA.4 extension request, not an RG Layer 7 theorem.

Consumers: `ShimuraVarieties:V0/simply-connected-components`.

**V0 G16. CM norm-kernel inputs**

Milne 2007c Lemma 3.6 uses Chevalley’s theorem that the finite-idelic topology on a finite-index torsion-free subgroup of O_E× is its full profinite topology. This identifies closure(E×)/E× with a uniquely divisible group fixed by CM conjugation. Lemma 3.12 also uses the Hasse norm theorem for the cyclic quadratic CM extension E/E⁺ to turn a totally positive everywhere-local norm into a global norm. CFT Layer 11 does not state these inputs. Propose ClassFieldTheory, Part II, first new layer CFT.N, for these generic unit-topology/cyclic-norm interfaces, also consumed by the Serre-protorus construction; retain the CM-specific norm-kernel deduction in V5. Read the Chevalley and cyclic-norm primary proofs before claiming closure, and handle CM product algebras componentwise.

Consumers: `ShimuraVarieties:V5/main-cm`.

**V0 G17. Connected adjoint datum convention and carrier**

The Appendix (C) carrier is a connected class of S→G^ad_R, including when G is simply connected. D4/special-pair is applied to the adjoint pure datum, with the maximal torus pulled back to G. D4/central-isogeny-lift assumes a given full S-map lift and cannot provide one here: the standard PGL₂ Hodge cocharacter does not lift to SL₂. V6 must expose this connected carrier and its comparison to D4/adjoint-datum before the omitted Lean signatures are restored. The corrected packet and omission manifest now agree; synchronize the reader, whose old full-datum acceptance and torus test for conjugatedDatum are outside this carrier.

Consumers: `ShimuraVarieties:V6/connected-tower`, `ShimuraVarieties:V6/central-isogeny-descent`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-subdata`, `ShimuraVarieties:V7/conjugated-datum`.

**V0 G18. Exceptional central adjustment and rank-one perfection**

Milne 1983 §3.10, p.252, attributes absence of noncentral normal subgroups to Platonov–Rapinchuk 1979 and applies it to a reductive Hα containing the full maximal torus. The primary paper Theorem 1 (p.279) proves perfection of the three-dimensional norm-one group SL₁(D) when D is split at every finite place; its final discussion (p.282) still calls simplicity modulo centre a conjecture. The full reductive Hα need not be perfect: its derived rational subgroup is a proper noncentral normal subgroup when its central torus has positive dimension. Replace the printed argument with the exact semisimple perfection input, then prove the missing comparison that eliminates the central adjustment on the marked torus, retaining the totally real extension and all-place split hypotheses. A subgroup containing T is not interchangeable with its derived group. This remains a ReductiveGroups Part II proof-interface request, independent of corrected Lemma 3.8 centre cohomology; see E12.

Consumers: `ShimuraVarieties:V7/weak-conjugation`.

**V0 G19. Arithmetic reductive supplier ownership**

The read upstream ReductiveGroups Layer 7 gives structural root/tori/parabolic theory, not rational real density, arithmetic images under algebraic maps, all-place torus norm obstructions or restriction-of-scalars classification with Hermitian real hypotheses. Route arithmeticity of adelic stabilizers to the existing AA.3 extension; route abelianized component images to AA.4; refine the remaining rational real-density/torus-conjugacy, Q-simple classification and cohomological/root-centre interfaces in ReductiveGroups Part II. Each use must preserve the input field, real component and centre hypotheses. No edits to the upstream roadmap are part of this review.

Consumers: `ShimuraVarieties:V0/stabilizer-arithmetic`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/special-existence`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V7/simple-connected-reduction`, `ShimuraVarieties:V7/auxiliary-cm-splitting`, `ShimuraVarieties:V7/rank-one-central-separation`, `ShimuraVarieties:V7/special-independence`.

**V0 G20. Exact automorphic boundary predicate**

The general definition currently names Baily–Borel holomorphy/growth and a nonnegative Fourier cone without defining the all-type rational boundary charts, allowed exponents and analytic extension predicate. This is a missing definition, not just a missing convergence proof. SVI 3.13(c) specifies the Jacobian automorphy factor but does not provide that predicate. Obtain BB66’s primary definitions, state the precise predicate independently of the later compactification, and check the restriction/product API, weight-zero piece, modular weight 2n and Veronese convention. The Annals landing page https://annals.math.princeton.edu/1966/84-3/p11 exposes metadata but did not serve the full article. V2 is partial until this target is unambiguous.

Consumers: `ShimuraVarieties:V2/analytic-automorphic-ring`.

### Part V8: 7 gaps

**V8 G1. Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding**

Pink 12.10 for pure data needs, at suitable levels: (i) for a lift (G,X) -> (GL2,H±) of a surjection G -> PGL2,Q, that the embedding (G,X) -> (G′,X′) × (GL2,H±) induces a closed immersion of M_K(C)^+ into M_K′(G′,X′)(C) × M(C)^min(GL2), with image the closure of M_K(C); (ii) in general, that M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is the quotient by a finite group. minimal-map-extension also needs the extension of datum morphisms to complex Baily–Borel compactifications (Pink 3.4, 6.2 and the complex form of 12.3(b)). V2's stated targets cover the boundary stratification and level maps, not datum morphisms; no ShimuraCompactifications stage before V8 states them (C3's datum-morphism extensions are toroidal and consume V8). The arithmetic codimension-one extension itself is no longer a gap: codim-one-extension constructs it from gl2-compact-model, open canonical models, descent of closed subschemes and finite quotients, and uses no torus torsor (Pink 12.8 concerns mixed data). The natural owner of (i)–(ii) is V2.

Consumers: `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8.general/general-minimal`.

**V8 G2. Abelian auxiliary class for Pink 12.10**

In the abelian-type lane, Pink 12.10 needs canonical models of (G,X)/SL2,Q and of (G̃,X̃) for G̃ = G ×_{PGL2} GL2, including data in Pink's sense whose X maps non-injectively to Hom(S,G_R) (for GL2 itself, the two-point datum (G_m,{±1}) of zero-dimensional-shimura-variety). Verify that these stay in the existence class of V5/V6, or state precisely the stronger hypothesis on the actual auxiliary models; this prevents a hidden V7 dependency in the abelian lane. The logarithmic line is not part of this gap: on M_K^+ over E, omega[dlog] is defined algebraically and its sections commute with E -> C (R09.3), and V2's projective realization supplies the comparison with the complex Baily–Borel embedding.

Consumers: `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8.general/general-minimal`.

**V8 G3. Concrete canonical-model and comparison carriers at the pinned Lean baseline**

Pinned Mathlib and Tau Ceti provide schemes/slice categories/functors/pullbacks/spans but no concrete pure datum, canonical reciprocity predicate, finite-adelic level tower or actual full modular-curve carrier under the audited names. Suggested theorem forms explicitly omit those not-yet-expressible conditions rather than use proposition fields or assume their conclusions. Their elaboration checks types only and is not a valid universal theorem about arbitrary schemes. Bind them to the named suppliers, restore every hypothesis and strengthen the schematic finite/proper forms to the full packet statements.

Consumers: `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/abelian-instance`, `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8.general/general-minimal`, `ShimuraVarieties:V8/zero-dimensional-shimura-variety`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/codim-one-extension`.

**V8 G4. AA.5 exact principal-level representative contract**

The AA packet is reviewed needs_changes, not an accepted implementation. Its GL2 principal-level calculation supplies the right target, but the literal stabilizer Gamma(N) requires determinant representatives g_c in GL2(Zhat), which normalize K(N); arbitrary finite-adelic representatives give conjugate stabilizers. Require this restriction or explicit conjugating isomorphisms in the supplying node. Do not reproduce the underlying adelic quotient in V8.

Consumers: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`.

**V8 G5. Compact-open level index category**

The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither the reviewed V1 packet nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

Consumers: `ShimuraVarieties:V8/level-tower`.

**V8 G6. Log-canonical section interface on the codimension-one partial compactification**

The V2 targets and nodes do not yet state the smooth partial-open and logarithmic global-generation interface of Pink 8.2 used in Pink 12.12. Supply M_K(C)^+, its smooth boundary divisor, codimension of the omitted strata, and the high-power logarithmic canonical section embedding. V2/koecher treats the no-PGL2 range; V2/automorphic-finite-generation does not alone identify this all-type log-canonical linear system. The existing complex-functoriality gap separately records the Pink 12.10 closed immersion/finite quotient and datum-morphism extensions. These refinements belong to V2 and do not invalidate the arithmetic partial-extension construction conditional on them.

Consumers: `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8.general/general-minimal`.

**V8 G7. Reflex-norm functoriality API promotion**

Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

Consumers: `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/component-reciprocity`.

## Complete restructuring register

Four proposals originate in V0. The text below is preserved for the orchestrator; their references to the original part job describe that input, not the assembly deliverables. No supplier/atlas restructuring is applied. V8 has no current proposal: its earlier C2 reassignment was withdrawn by the finished review and must not be restored.

### Proposal 1: rescope — ComplexComparisonPartII

RT-AREA-algebraicgeometry/3 and /28: analytic spaces/analytification and holomorphic gluing have no mathematical owner; external PR196/279 are not encoded stages, and FoundationsAndLibraryIntegration is retired.

Insert CA.0: Complex analytic foundations before C0, with analytic local models including nilpotents, morphisms/gluing/fibre products, SGA1 analytification, smooth/étale comparison and compatible complex manifold gluing/finite-gluing topology/holomorphic bundles. Encode the consumer edges and PR196/279 external record updates listed in the two gaps. It agrees with PR196 Layers 0–2 and PR279 Milestones 5–7 if those PRs merge. This proposal is not applied in the present four-file job.

### Proposal 2: rescope — ComplexMultiplicationAndExplicitReciprocity

V7 needs the actual Serre/Taniyama torsor, not only types/reflex types or the scalar CM reciprocity theorem.

Add a Part II layer CM.S owning the Serre protorus and Taniyama extension with adelic section and norm/cocycle API. V7 owns the contracted-product Shimura twist and its comparison. Keep CM.0 types and V4 reflex-norm application, and avoid CM.2/CM.4→V5 cycles.

### Proposal 3: rescope — ReductiveGroupsPartII, ArithmeticLocallySymmetricSpaces

The common cohomological/rigidity inputs used in Milne 1983 are broader than the current exposed supplier scopes.

Expose the corrected finite-place centre H¹ injectivity, adjoint Hasse principle and real torus norm/weak approximation in ReductiveGroups Part II; expose precisely ranked S-arithmetic arithmeticity/superrigidity and normalizer finiteness in the locally symmetric supplier. V7 retains weak/marked conjugation and Weyl-length independence.

### Proposal 4: rescope — ShimuraVarieties

V6 imports the existing V8 foundational disjoint-reflex-field and conditional uniqueness nodes; their proofs depend on V1–V4, not on canonical-model existence in V6/V7. Keeping all of them behind an undifferentiated V8 stage creates a misleading stage cycle.

At assembly move the existing V8/disjoint-special-reflex-fields and the conditional V8 translation-descent/model-uniqueness foundation to the V4 canonical-model lane, preserving node ids by aliases. Keep V8 actual-tower applications and V8.general separated. Until assembly use those exact existing node ids; the expanded declaration graph is acyclic.

The presentation portion of proposal 4 is implemented: the three unchanged V8 nodes appear in the V4 reading lane and are linked by their existing identifiers. Parent-stage reassignment/aliases and atlas metadata remain for the orchestrator. The implementation does not create duplicate nodes or add an existence dependency.

## Final submission validation

`python3 research/blueprint/intake.py check-files` on the four changed deliverable paths reports zero problems. `git diff --check` reports no whitespace errors. Both part checkers and the combined graph/reader/name checks pass as above. The shared Lean process has finished; no build or language server was started. Scratch inputs and generation/check logs are removed after the pull request opens; all necessary continuation information is in this note.
