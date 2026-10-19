# DESIGN-ExponentialSumsAndCircleMethodPartII

Agent: Codex, session `codex-qtGvxM`. Issue: [#3400](https://github.com/CBirkbeck/tauceti-explorer/issues/3400). Date: 2026-10-19.

The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3400#issuecomment-6256674574) was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/3400#issuecomment-6256675840). This is the completed design pass for that single job, submitted for independent review. It is not a checkpoint or a claim that the mathematics has been formalized.

## Delivered and coverage

The roadmap definition, packet, reader and suggested Lean file have matching scope. The packet has status `complete`, granularity `target`, and all implementation statuses remain `unchecked`.

- 85 nodes: 59 theorems, 17 definitions, 9 constructions.
- All 83 routed items occur exactly once; the two additional targets are `finite-projection-degree` and `finite-localization-filtration`.
- 105 API items; 79 discriminating tests across all 26 definitions/constructions.
- 54 planets, with at most six on any layer.
- 13 declarations verified at the pinned libraries; 14 supplier requests; six named gaps.
- 46 source findings, re-expressed in our own words and checked against the published text. No review verdict was copied from the extraction. Findings retain their extraction identifiers through `inheritedFrom`; no independent blueprint review is claimed.

Every layer GCM.0–GCM.13 is **planned**. No layer is **closed**. Each coverage record names the specific refinement and the directly relevant gaps. The reader is definitive; heavy carriers absent at the pins are targets there, with their full APIs and tests, rather than substitute records in Lean.

| Layers | Targets | Purpose and remaining boundary |
| --- | ---: | --- |
| GCM.0 | 3 | Independent intersection, degree/projection and fibre-dimension geometry; G1 remains. |
| GCM.1 | 1 | Independent uniform strict-height polynomial count, including all boundary cases; G1 remains. |
| GCM.2 | 2 | Separate coefficient-prime and residue-prime quantifiers, from pinned arithmetic APIs. |
| GCM.3 | 6 | Coefficient mapping scheme, phase, Fourier complex and orthogonality; requested geometry/cohomology carriers. |
| GCM.4 | 7 | Determinantal models, reduced arcs, Padé data and good charts, including the odd-length ceiling. |
| GCM.5 | 14 | Major-arc complexes, trace reduction and signed configuration descent; G2 and G5. |
| GCM.6 | 6 | Universal pair, primitive extension and monodromy specialization; G4. |
| GCM.7 | 5 | Finite localization adapter, relative first page and odd-page vanishing; G4 and requested enhancements. |
| GCM.8 | 6 | Geometric Weyl differencing with extended cohomological degree and closed-point detection. |
| GCM.9 | 5 | Parent arithmetic imports, corrected cover and conservative minor arcs; G1 and G3. |
| GCM.10 | 10 | Spreading, conservative comparison/support/irreducibility, and distinct sharp targets; G3 and G5. |
| GCM.11 | 12 | Pointwise germs, compact-open inclusion, escaping loop and end winding; connectivity input at G5. |
| GCM.12 | 5 | Fixed-radius weighted collar and extension-space comparison; global topology gate G6. |
| GCM.13 | 3 | Trace conjecture, compact-open obstruction and conditional degeneration; G3, G5 and G6. |

## Ownership and integration instructions

The `parent` field records lineage. The roadmap-level prerequisite list is the union of interfaces, not an instruction to execute an entire parent before every layer. Use the explicit stage/node graph.

The independent prefixes GCM.0–2 import no ES layer, geometric suffix or configuration theory. Integration should add only these consumer directions:

1. `ExponentialSumsAndCircleMethod:ES.0/polar-dimension-bound` consumes `ExponentialSumsAndCircleMethodPartII:GCM.0/rev-affine-dimension-theorem-for-intersections`.
2. `ExponentialSumsAndCircleMethod:ES.1/uniform-function-field-minor-count` consumes `ExponentialSumsAndCircleMethodPartII:GCM.1/polynomialbox`; ES.5 has its own separate application of that counting input.
3. GCM.9 imports the existing parent ES.0–1 nodes and GCM.10 consumes GCM.9. Never add ES.5→ES.0 or reverse whole-roadmap execution edges.

The packet records this rescoping proposal; this job does not edit the parent packet. The proposed fine consumer edges were included in the cycle checks.

Generic universal hypersurface monodromy belongs to the pending `LefschetzPencilsAndVanishingCyclesPartII` route `UniversalHypersurfaceMonodromy`. Generic configuration and rational-loop theory belongs to the pending `AlgebraicTopologyPartII` route `ConfigurationSpacesAndRationalLoops`. Their exact node ids are absent at this snapshot. LPV.5 and current AlgebraicTopology stage requests explicitly route the missing extensions; they are not fulfilled theorem imports. Replace those requests with verified companion exports when available. GCM retains only its proof-specific applications.

Existing current AlgebraicTopology Stages 4, 5 and 8 supply generic CW/cofibration, fibration/finite-cover and relative-homotopy infrastructure. The pinned circle fundamental group and compact-open currying are cited directly. SchemeAndStackFoundations, EtaleDualityAndPerverseSheaves, FiniteFieldsAndCharacterSums and FunctionFieldArithmetic retain their generic interfaces. FoundationsAndLibraryIntegration LI.3 has been replaced by the actual Mathlib spectral-object carrier plus the missing finite-localization adapter here. The fourteen exact contracts and their consumers are in the packet and reader; no separate supplier issues were created.

## Mathematical boundaries to preserve

Let t=floor(d/(k−1)) and δ=n/2^k−k+1. The conservative minor cutoff is `2dn+4(k−1)−4tδ`; comparison holds for `i>−4(tδ−(k−1))`, and the supported irreducibility condition is `tδ>k−1`. The remainder `4(r+1)` in m=(k−1)q+r cannot simply be dropped. The printed +4 bound, sharper range and equality endpoint remain separate targets at G3. The odd-length minor cover ends at ceil(kd/2)−1. Localization uses minor cohomology in degrees j and j+1, consistently with the stated strict range.

Degree bounds use the sum of degrees of all reduced geometric components, including isolated components. Arc nesting and strata use reduced closed loci; only the determinantal model is asserted to commute directly with arbitrary field extension.

The compact-open prescribed-germ space has an escaping Fermat loop detected by end winding −1. In the cubic forty-variable, degree-two example this obstructs both the proposed double-loop equivalence and the degree-one trace pairing. A local controlled collar can be straightened, but it is not the missing global topology construction and is not claimed to give a strong deformation retract. Conjectures 1.3 and 7.1 remain propositions under explicit assumptions, never axioms or established degeneration theorems.

## Sources and unresolved debts

The full published Browning–Sawin article, Annals 191 (2020), 893–948, was read, with formula images checked at pp.903, 920 and 934. The packet records the published PDF URL, reading date and SHA-256. BV15, *Rational points on cubic hypersurfaces over F_q(t)*, §2.5, Lemma 2.8 and its proof, public-preprint pp.12–13, was read. Stacks tags 05F9, 012K and 0BK5 were read for their stated uses. Statements, proof plans and findings in the deliverables are in our own words, with exact locators. No source passage or source file is included.

The six gaps specify the remaining work precisely:

- **G1:** certify a uniform finite-grid/projection argument and polynomial-height control, with exceptional fibres and total degree handled correctly.
- **G2:** verify the original Katz §8.2.5(2) Fourier/middle-extension input, its hypotheses and shifts, through FF.2. Its original book was not available in the cleared sources used here.
- **G3:** obtain a new sharp minor estimate, address the irreducibility equality endpoint separately, and justify the geometric trace outside conservative irreducibility.
- **G4:** close the monodromy companion and original Katz–Sarnak 11.4.9/subsidiary source audit, retaining both cubic exceptions and Zariski-closure eigenvalue conventions.
- **G5:** close the configuration/rational-loop companion, including arrangement purity, corrected diagonal identity, bouquet connectivity and rational loop formulas, with original Broughton/Hilton/Sullivan sources and finite-type hypotheses verified.
- **G6:** specify and prove the global stronger-germ topology, compact-family control, coordinate compatibility, polynomial inclusion continuity and fixed-collar comparison. The trace comparison is still conjectural after this gate.

No unavailable original source was represented as read. The Annals page, arXiv record and author publications page were searched for existing corrections; none was located, without making a priority claim.

The audited pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only trees were also checked: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine post-snapshot roadmap directions. The two full style references were ArithmeticDirichletSeries and AlgebraicTopology.

## Validation and next action

- `scripts/check_blueprint.py` reports **zero errors and zero warnings**, using the pinned declaration index.
- Inventory, roadmap schema, stage coverage, definition/construction API/test counts, planet caps and reader/packet agreement pass.
- Explicit stage and node graphs, including the parent packet and the proposed fine consumer links, are acyclic. Early-prefix transitive dependency closures exclude ES, the geometric suffix and configuration theory.
- Source-finding and source-version validators pass for all 46 entries.
- Independent rational arithmetic checks verify the remainder identity and conservative cutoff in 20,520 cases; the odd-length Hankel example has the stated anti-identity matrix.
- The **271-line suggested file compiled successfully through `lean-check` at the pins**. Its 44 warnings are exclusively the standard placeholder-proof warning. Every data definition has a real body; there is no fabricated heavy carrier. No Lean build or language server was started.

The next worker should independently review these five deliverables, then discharge or route the six gaps and exact supplier contracts. Do not promote a planned layer to closed or remove a conjectural gate on the strength of the compiling suggested file. The source receipts, graphs, exact contracts, remaining lists and all durable mathematical notes are in these deliverables; scratch material is not needed for continuation.
