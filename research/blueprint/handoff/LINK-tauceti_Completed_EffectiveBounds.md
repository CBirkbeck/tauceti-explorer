# Effective arithmetic bounds: link-job handoff

## Identity and input

Worker: **ChatGPT Pro — cgp-a70a276fbaff**. Job `LINK-tauceti_Completed_EffectiveBounds`, issue **#35**. The claim was accepted specifically for this session in [bot comment 5713511977](https://github.com/CBirkbeck/tauceti-explorer/issues/35#issuecomment-5713511977), following claim comment 5713510247. This is an authored link submission, not an independent review or implementation.

Input revision: `dbafc759460581dbd23999a3c112149fedefe2b5`. Submission base: `66e35f2051d4e49644701ad398112de45095d315`. The commit comparison changes only AUDIT-24/AUDIT-25 results and reviews, the queue and ledger. The catalogue, relevant AUDIT-03 entry, retirement policy, protocols, pins, source roadmaps and link packets used here are unchanged.

The complete input came from the published Pages artifact, run 35210869629, artifact 10491219312. Its checked ZIP SHA-256 is `42073dce6a2708590def6f040b6b88fa988a03f7ca5bf1da18b9314b8cbadfb7`; the atlas SHA-256 is `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56`.

Only two authored files are delivered:

- `research/blueprint/links/tauceti_Completed_EffectiveBounds.json`
- `research/blueprint/handoff/LINK-tauceti_Completed_EffectiveBounds.md`

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. No git command, Lean build, default-branch write, integration, approval or issue closure was performed.

## Screen and outcome

The packet records **one new outgoing dependency, two rescope recommendations, and 217 examined active roadmaps**. There is no new incoming edge. Two NumberFieldArithmetic links and one ArithmeticDirichletSeries overlap already recorded elsewhere are listed under `alreadyRecorded`, not duplicated.

`status: complete` means the catalogue-wide link screen is finished at this input revision. It does not say that all EffectiveBounds targets are implemented, or that all mathematical proofs in the catalogue were audited. All active roadmap summaries were read, including every upstream roadmap and all classical, diophantine and analysis neighbours. Full document text and stage descriptions were searched across the catalogue and all six new-roadmap files. EffectiveBounds and Multiquadratic documents and their stages were read in full; complete candidate stages were inspected for proposed relationships and substantive near misses. Individual `examined` notes distinguish these readings from the broader text screen.

`FoundationsAndLibraryIntegration` is retired. Historical consumer mentions do not make it a valid supplier, and no proposed endpoint is retired.

## Four-layer inventory

**Layer 0:** the particular outputs are measure-free cardinal packing and doubling in coordinate polydiscs, not arbitrary lattice asymptotics. For finite coordinate set, positive radii, and strictly separated points in a polydisc, the checked packing theorem gives finiteness and cardinality at most `(4c/epsilon)^(2d)`, under `0 < epsilon <= c`. For an additive subgroup the doubling factor is `49^d`, and finiteness of the intersection at scale two is an explicit input. A real-lattice consumer must supply its coordinate and finiteness comparison. Neither theorem is a Haar-volume formula or a boundary-error estimate.

**Layer 1:** basis/discriminant estimates, the coarse ideal count `X^2 2^[K:Q]` for `X >= 1`, a coarse class-number bound, and `[O_K^x:(O_K^x)^2] <= 2^[K:Q]`. Integral-unit squares are not arbitrary field squares or an arbitrary generated finite-index unit subgroup. A numerical upper bound does not compute an invariant or certify an enumeration.

**Layer 2:** quantitative Hermite–Minkowski counts number-field intermediate subfields of a fixed characteristic-zero ambient field. The checked bound is `(2C+1)^(D+1)D` for the named degree and coefficient bounds depending on the discriminant threshold. It is not a weighted isomorphism-class asymptotic. A candidate-list certificate needs the generating-polynomial construction and verified enumeration/comparison, not merely this scalar bound.

**Layer 3:** Mathlib provides the Dirichlet-unit regulator as a covolume, positivity, and a unit-family index formula. The checked Tau Ceti file gives regulator equal to one, hence at least one, **when the unit rank is zero**. AUDIT-03 marks the positive-rank effective target partial. This screen does not establish absence of stronger results from the entire library; it establishes that the inspected rank-zero declaration does not provide them. A source-qualified positive-rank inequality must be specified before making it a consumer prerequisite.

## Dependency and scope recommendations

The exact dependency is EffectiveBounds Layer 1 → Multiquadratic Layer 2. Multiquadratic names `units_sq_index_le` as its unit-square-class input and says it is shared with EffectiveBounds. The producer states the same integral-unit inequality. Three literal excerpts establish the output, use and shared ownership. `NumberField.units_sq_index_le` was read at the Tau Ceti pin, where its hypotheses and carrier match.

The associated **rescope** removes duplicate migration responsibility. Keep the reusable estimate and existing API with EffectiveBounds. Multiquadratic consumes it and owns its ambiguous-class-number, class-group quotient and genus-field arguments. Do not infer an identification of a class group's two-torsion subgroup with its quotient by squares from equality of cardinalities.

The second **rescope** concerns Layer 0 and `GeometryOfNumbersAndQuadraticArithmetic:GN.4`. GN.4 includes lattice packing and covering, hence overlaps the coordinate-polydisc packing subproblem. It does not specify that its broader dynamics depends on this particular estimate, so no directed dependency is guessed. Reuse the explicit API with the required carrier adapter; GN.4 retains covering and star-body problems, transference, Siegel mean-value results and homogeneous dynamics. No whole-roadmap merger is proposed.

## Existing records and rejected shortcuts

The NumberFieldArithmetic packet already records EffectiveBounds Layer 1 → its Layers 3 and 8. Preserve those records; this job does not independently approve that packet or turn a numerical estimate into computation of all number-field invariants.

The ArithmeticDirichletSeries packet already records the Layer-1/Layer-5 overlap. Its README is unchanged from the text read in this session's earlier job, checked blob `e6e17096aebd5b071d9c96539eb7ab2caff718b8`. The quadratic ideal count cannot replace the positive two-sided linear count needed at the convergence boundary, nor make higher prime powers negligible.

Substantive near misses are recorded individually in the JSON. GlobalNumberFields needs a Lipschitz-boundary error for uniform ray-class counts; ArithmeticStatistics needs isomorphism/stabilizer weights, cusp control and sieve tails. SmallRamification needs local upper/global lower discriminant inequalities and list completeness. Qualitative Hermite inputs in Faltings, Mordell–Lawrence–Venkatesh and Selmer finiteness are not redirected to an unnecessary quantitative count. ComputationalNumberTheory's found-unit subgroup differs from the square subgroup; Hilbert modular level/polarization quotients need their own comparisons. Generic finite separable trace-form transfer is broader than the number-field square-root helper. Higher K-theoretic, motivic and Mordell–Weil regulators are not Dirichlet-unit regulators. LLL, algebraic discriminant modules, sublattice correspondences, additive sumset doubling and lattice homology do not specify the coordinate-polydisc estimate.

## Four outstanding owner requests

**R1 — EffectiveBounds Layer 3:** choose the exact positive-rank regulator lower inequality, constants, hypotheses and source. Historical completion prose and the rank-zero theorem must not erase this requirement.

**R2 — ComputationalNumberTheory CN.2:** a regulator stopping certificate should carry a full-rank unit family `u`, a proved `0 < b(K) <= R_K`, and a certified upper bound `regOfFamily(u) <= U`. The pinned index comparison then bounds the generated subgroup's index by `U/b(K)`. Saturation or a strict bound below two is still needed to conclude index one. No edge to an unspecified lower-bound theorem was added.

**R3 — SmallRamification R25.1:** retain exact local/global discriminant inequalities and finite-list completeness proofs. An upper field count is neither a lower-discriminant exclusion inequality nor proof that a displayed list is exhaustive.

**R4 — GN.4:** supply the coordinate-polydisc and finiteness adapter for the actual lattice carrier. The overlap recommendation does not supply uniform asymptotics or dynamics.

For R1, a rejection example is `Q(sqrt(5))`, whose regulator is `log((1+sqrt(5))/2) < 1`. The [LMFDB page 2.2.5.1](https://www.lmfdb.org/NumberField/2.2.5.1), read on 17 September 2026, gives the polynomial `x^2-x-1`, a fundamental unit, and regulator approximately `0.48121182506` in its Unit group section. The strict inequality follows from `(1+sqrt(5))/2 < 2 < e`; the decimal is not the proof. The page was read through the web reader, but an independent byte download failed, so no content hash is claimed. No Lean certification of this example is claimed.

## Verification and validation

The seven `baselineChecks` contain full pinned URLs, blob hashes, read ranges and actual supplied statements: the unit-square index, polydisc packing and doubling, quantitative Hermite–Minkowski, rank-zero regulator bound, Mathlib regulator definition, and unit-family regulator/index comparison. Both libraries were searched; current search results and AUDIT-03 were discovery aids rather than substitutes for reading the pinned statements. This was targeted source-statement verification, not an exhaustive dependency/axiom audit.

The repository validator was run unmodified from the input snapshot with the authored packet as its argument:

```text
python3 scripts/check_links.py <authored-packet>
status complete; links 1; overlaps 2; examined 217
0 error(s), 0 warning(s)
```

The equivalent repository-relative invocation after placement is:

```sh
python3 scripts/check_links.py research/blueprint/links/tauceti_Completed_EffectiveBounds.json
```

An executed scratch checker additionally verified all 217 active roadmap IDs exactly once, raw literal membership of every evidence quote, known/non-retired endpoints, no duplicate new edge against the atlas and **25 other packets**, no new cycle including explicit stage `requires`, absence of private paths, and artifact/atlas hashes. All passed. These are structural and provenance checks, not independent mathematical approval.

## Coordination and remaining handoff

The worker on issue #51 is active under `cgp-9dbda3a312c1`. Its comments were rechecked before this submission: no durable result was announced, and its authorized packet was not retrievable on the previously identified worker branch. Deduplicate the shared pair if that worker publishes it. This does not authorize altering or releasing that worker's claim.

The authored packet now needs the protocol's independent review. Four owner requests remain even though the link screen is complete. Do not mark the job done solely because the validator passes. After durable submission, the orchestrator handles the submitted/review transition; the claim should not be released with `/unclaim`.
