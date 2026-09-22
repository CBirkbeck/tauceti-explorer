# PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 — fifth checkpoint

**Status: partial; not ready for acceptance of the whole paper extraction.**

Agent: ChatGPT Pro, session `cgp-0922-b7d49a`, 22 September 2026.
Issue: #1420. Continues merged checkpoints #1636, #1641, #1650 and #1695.
Branch: `cgp-0922-b7d49a-paper-1420`.

## Delivered: the fourth-checkpoint proof supplement is now in the JSON

The previous handoff's first task, machine synchronization, is complete. The extraction now contains **119 items: 22 library, 8 planned, 89 missing**. Its six routes take **82 missing items exactly once**; seven explicitly identified diagnostics remain unrouted. There are 33 definition/construction items, each carrying an API outline and three discriminating tests.

All 110 inherited stable IDs are retained. Of the inherited item objects, 104 are unchanged; the six deliberately revised ones are `reduced-integral-basis`, `largest-minimum`, `two-torsion-no-index-two`, `relative-genus-source-claim`, `two-torsion-general` and `two-torsion-cubic`. No inherited library/planned item was reclassified. Original source-file hashes, pins and prerequisites are preserved. The earlier Codex verification object is preserved verbatim in `verificationHistory`, not attributed to this session.

Nine nodes from the fourth-checkpoint supplement were integrated, with the paper ID prefix:

- `trace-metric-normalization`, `primitive-prefix-extension`, `reduced-basis-product`;
- `hilbert-class-field-input`, `quadratic-coinvariant-extension`, `quadratic-relative-rank`;
- `ramified-place-support`, `quadratic-relative-torsion`, `all-degree-torsion-induction`.

The two generic lattice theorems are a source route to `GeometryOfNumbersAndQuadraticArithmetic:GN.5`, consuming GN.0/GN.1. They do not require GN.3's mass formulas or adelic reduction. The trace metric and number-field applications extend the inherited `EffectiveBoundsClassGroupTorsion` Part II. Ordinary Hilbert class fields are a planned import from `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`; no new class-field-theory owner or implemented Hilbert-class-field declaration is asserted.

The companion paper report is **intentionally unchanged**. Its section “Fourth checkpoint: primitive bases and quadratic towers” contains the full integrated proof supplement. Statements there saying that the nine entries are not yet in JSON describe checkpoint #1695 and are superseded by this handoff and the current JSON. Preserve the earlier report's mathematical work and historical attribution; do not interpret those old synchronization notices as new outstanding tasks.

The baseline JSON was reconstructed locally and checked byte-for-byte using its Git blob hash `e89464b8c926b8bfcc2676e7130c18c94ddca883` before any edits. The updated, locally tested JSON has Git blob hash `ceec6960b756d275354f00c58e429cf0e498c583`; GitHub returned that same content hash when accepting the update. The unchanged report blob is `48f7b052bab8574c85fc0ef4d6ddb467fa56edc1`.

## Mathematical boundaries that must be preserved

The reduced-basis proof uses the trace-weighted Euclidean metric: weight two on each complex modulus squared. Scaling both real coordinates of each complex factor by `sqrt(2)` changes the covolume by `2^s`. Thus ordinary covolume is `2^(-s)sqrt(D_K)`, while trace-metric-induced covolume is `sqrt(D_K)`. The vector 1 is primitive and shortest in the trace metric. Primitive-prefix reduction supplies the comparison at **every index**, including the last, and the product bound handles degree two directly. Ordering is asserted in the trace metric, not simultaneously in the ordinary metric. This is the replacement proof from the report, **not a claim to have acquired Siegel Lecture X**.

Klüners–Wang, arXiv:2003.12161v2 (13 October 2020), Theorem 2.1 and its proof on PDF pages 3–4, is now a later auxiliary source in the machine extraction. This session reread and visually inspected those pages. No new PDF byte hash was measured, and this later paper is not attributed to the original 2017 argument.

For a quadratic extension E/F, the replacement is

```text
r_2(E) <= 2 (r_2(F) + max(t,1) - 1),
h_2(E) <= 4^(max(t,1)-1) h_2(F)^2,
```

where t counts finite ramified places **and real places becoming complex**. Its construction uses `Cl(E)/2Cl(E)`, not an equivariant identification with `Cl(E)[2]` based only on equal cardinality. The everywhere-unramified case allows a nonsplit `C4` extension; the ramified case has an actual order-two inertia lift. The relative-discriminant support bound makes the implied constants uniform while F varies in fixed degree. Strong induction, with the quadratic `D^eta` base case and the existing no-index-two branch, gives the required general exponent.

The literal `relative-genus-source-claim`, with one base-class-group factor and its advertised stronger exponent, remains an **unrouted diagnostic**. The replacement does not certify that stronger historical assertion. It also does not prove the sharper cubic feedback exponent or the remaining quartic resolvent branch.

## Checks actually run in this session

Local Python checks passed:

1. UTF-8 JSON parse; exact baseline Git-blob match; stable-ID preservation; the six-item change boundary; inherited source/hash/pin/prerequisite and verification preservation.
2. The 119-item status counts, six routes, unique routing of 82 missing items, explicit identification of the seven unrouted diagnostics, and API/three-test checks for all 33 definitions/constructions.
3. Exact rational primitive-prefix recurrence through index 30 for `A=1`, `A=3/2` and `A=7`.
4. The involution `(x,y) -> (x,y+x mod 2)` on `Z/4 x Z/2`: it fixes every 2-torsion element but acts nontrivially on the quotient modulo two.
5. Exhaustive square-zero matrices over F2 in dimensions zero through four, with counts `[1,1,4,22,316]`, verifying `dim V <= 2 dim coker T` in each case.
6. The nonsplit C4 lift example and 99 exact quadratic-tower exponent comparisons for base degrees 2 through 100.

These are regression checks, not proofs of the general arithmetic results and not Lean elaboration. The earlier report contains the finite-test approach; the extra recurrence values test the stated general-A formula as well as A=1.

**The unmodified full-catalogue repository checker and intake checker were not run locally.** A local clone/full catalogue could not be acquired in this environment. The existing “Swarm submission check” workflow, whose complete source was read, runs both `scripts/check_paper.py` and `research/blueprint/intake.py check-files` on this PR against the actual repository catalogue. Read its real result and logs; a local structural check is not a substitute for a successful CI run. The PR discussion records any subsequently observed CI result.

For a full clone, the relevant commands are:

```sh
python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json
python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.result.json research/blueprint/handoff/PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md
```

No Lean artifact was requested or compiled. No independent review has occurred. The earlier verificationHistory reports its original worker's checks only.

## Sources and library coverage checked for this integration

Read the current WORKERS, PROTOCOL, BROWSER_AGENTS, UPSTREAM_GUIDE and expansion PROTOCOL; the issue discussion and current handoff; the existing result and the report's replacement-proof supplement. Selected sections 2–4 of the February 2017 main-paper author copy were reread, including visual inspection of the basis paragraph. No new complete reading of all inherited auxiliary papers or of main-paper sections 5–7 is claimed.

Read the complete completed-EffectiveBounds roadmap, the GN atlas record, and the ClassFieldTheory purpose/ownership and relevant complete Layers 11–13. Read the relevant reviewed GN audit entries and REV-AUDIT-02: implemented covolumes and first Minkowski are distinguished from absent successive-minimum, Minkowski-II and general reduced-basis theory.

The actual declarations `NumberField.mixedEmbedding.covolume_integerLattice` and `NumberField.mixedEmbedding.covolume_idealLattice` were reread in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean` at `082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`. Other inherited library citations retain their earlier-worker provenance; they were not all independently reread here. `data/library-coverage.json` returned empty content through the oversized-file reader, so the reviewed split GN audit records were used. Earlier catalogue-wide collision searches are historical verification, not claimed freshly rerun by this session.

## Resume here

Do not repeat the now-completed nine-node synchronization. Preserve all 119 IDs and the inherited evidence. First inspect this PR's canonical check results; fix any genuine catalogue or intake errors on the same branch while it is open. Then proceed with source/proof closure, keeping the following gaps distinct:

- **G0:** Obtain and compare the final 2019-revised/2020 publisher text. Public AMS retrievals failed; bibliographic agreement is not a mathematical version comparison.
- **G1:** The primitive-prefix replacement is now written and machine-integrated. Match the exact generic saturated-prefix/free-quotient, primitive-vector, minimum-attainment and lattice-finiteness supplier declarations; decompose at blueprint granularity and obtain independent checking. No original Siegel verification is claimed.
- **G2:** The later-source quadratic replacement is now integrated. The literal one-factor genus claim stays unverified. Match the class-group/PID base case, inertia-in-towers, ramification/discriminant and ordinary-Hilbert-class-field interfaces; independently check both ramified and unramified branches.
- **G3:** Acquire original Brumer–Kramer Proposition 7.1 and its following remark. Close the HV repulsion, lower-height, packing and height-upper-bound proof interiors, integral model changes and explicit/cohomological Selmer comparison.
- **G4:** Split and close Tsimerman's torus/finite-module transfer, its adelic/Brauer–Siegel inputs and nonduplicating ownership. Establish splitting-field discriminant comparison, resolvent orders/maximalization and reducible cases.
- **G5:** Resolve hyperelliptic curve-model local conditions versus the étale-algebra discriminant, including twists, leading coefficient, even degree and reducible algebras.
- **G6:** Verify del Pezzo weighted representatives, fiber-uniform height comparison with the correct leading constant, singular fibers and the 2.87 optimization.
- **G7:** Certify Bombieri–Pila integer rounding and constants 11/12, retaining the corrected lambda substitution and `q <= p`; complete the exact generic supplier audit.
- **G8:** Read original Baily, Cohn, Bhargava–Shnidman and Cohen–Morra counting inputs, retaining dependence on a fixed quadratic resolvent.
- **G9:** Repair the function-field determinant bound's q-uniformity and epsilon/degree conventions, then the claimed gonality consequence, especially characteristic two and inseparable maps.
- **G10:** Complete the remaining proof-input inventory and the structured source-issue documentation required by the protocol. Existing report discussions of source errors are not automatically a completed `sourceIssues` record. Synchronization itself is no longer part of this gap.

Depth still prevents marking this paper complete. Do not approve its own work, merge manually, or `/unclaim` a submitted job. The normal intake merges a partial checkpoint and releases the job for continuation.
