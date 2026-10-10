# BP-DeformationAndDerivedPatchingAlgebra--P9 handoff

Issue #6319. Agent: Codex, session `codex-dgMKxY`. Bot-confirmed claim, 10 October 2026. This is a complete planning pass for P9, ready for independent review, not a checkpoint or an implementation. P9 coverage is **planned**, with no stage marked closed.

## Delivered

The packet contains 58 nodes: four definitions, forty lemmas, eight theorems, one construction and five applications. Its five definition/construction interfaces have 22 API items and 15 discriminatory tests. Six planets and 19 checked baseline declarations are recorded. The integrated identifiers `P9/codimension-amplitude-lemma`, `P9/derived-length-identity` and `P9/support-transport-avoiding-ihara` are preserved, with the full roadmap prefix.

The reader states the regular-local first-cohomology argument, balanced concentration and its projective-dimension/depth consequences; perfect support and derived coefficient changes; derived finite-algebra actions, ghost kernels and Euler lengths; generic idempotent localization; normalization and module-defect steps of the ACC divisor identity; and the complete ACC comparison hypotheses and top-component argument. The four required examples and a non-Cohen–Macaulay example compute integral cohomology, derived specialization and rationalization without confusing them.

Important distinctions retained: Tor-amplitude versus ordinary cohomology width; nonzero versus zero complexes; integral torsion versus rational concentration; generic Euler nonvanishing versus mere nonzero cohomology; spectral support through nilpotent quotients versus a fictitious module action; every top component versus all components; near faithfulness versus faithful action or integral R=T. The reducible-local example uses a genuinely perfect two-term complex. Power-series rationalization is not identified with all power series over the fraction field.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--P9.json --index <baseline declaration index>`: **0 errors, 0 warnings**. Checked JSON validity, prerequisite ownership and tier boundaries, retained identifiers, API/test name alignment, allowed deliverable paths and absence of private paths/source excerpts.

`lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--P9.lean`: **elaborates at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 / Tau Ceti f790474821cf4256814db967cb154e7af3d0c369, with only omitted-proof (`sorry`) warnings**. Memory was checked before compilation. This validates signatures, not proofs. Every node's implementation status remains unchecked.

All five definition/construction names, their 22 API names and 15 test names occur in the suggested file. Its generic localization computes an actual idempotent retract and the cohomological range; the algebra-localization identification still uses the supplier bridge. The scalar-domain test checks the unit summand after scalar localization. The file exposes honest intermediate forms of the derived-length and component-chain arguments. It omits the complete native excellent module-length theorem and ACC local-condition theorem rather than inventing an opaque hypothesis. The general quotient-support signature is explicitly separate from the ACC theorem.

## What remains, with owners

Two gaps and three requests prevent mathematical/library closure. Resume from the packet's `requests`, `gaps` and P9 coverage `remaining` list; no source-reading pass or target discovery needs restarting.

1. **R03.3:** provide fine nodes for excellence of complete Noetherian local rings, finite algebras and localizations; finite normalization of a one-dimensional excellent local domain; semilocal Dedekind normalization as a PID; preservation of closed-support dimension under finite integral maps; and catenary regular-local height/dimension formulas. Replace the coarse stage prerequisites of the normalization, finite-algebra support, divisor bridge and seed nodes by these precise suppliers.
2. **DGAInfinity, Part II:** connect its existing DG derived modules/perfect envelopes and Karoubi completion to the native bounded derived category of finite modules, with splitting preserving bounded finite cohomology and the perfect envelope. P9 owns the specialized algebra-action localization, not generic idempotent completion. The packet's rescope proposal records this bridge.
3. **P7:** supply native equivariant truncations for actual derived algebra actions, bounded ghost nilpotence, finiteness of perfect derived endomorphism modules, exact base-change action comparisons, and the T-linear coefficient-spectral right edge. Its existing spectral-action node requires strict chain actions and does not supply this last bridge for arbitrary derived actions.

Then replace the marked incomplete native source forms by full signatures retaining the reader's hypotheses, and re-run Lean and the packet checker. P7, R03.3 and R03.6 keep their established definitions and module theorems. P8 owns patched-complex construction; PotentialAutomorphyInfrastructure:PA.3 owns arithmetic realization. No higher-tier definition was imported or moved downward in this pass. No other packet or upstream file was edited.

## Sources and provenance

Read CG arXiv:1207.4224v2, Lemmas 6.1–6.2 pp.65–66, Theorems 6.3–6.4 and Proposition 6.6 pp.66–70. Read the maintainer-cleared author copy of ACC, *Potential automorphy over CM fields*, Annals 197 (2023), §6.3 pp.1047–1053 and §6.4.1 setup p.1053, in place. No copy or verbatim source passage was saved in the deliverables. The packet records source hashes, public bibliographic URLs and read dates. Read Stacks tags 0656, 07LQ and 07LT; pinned baseline statements; reviewed P7, P7 Part II and R03.6 suppliers; the integrated decomposition and library audit; and current upstream DGAInfinity/GrothendieckEulerForms documents and suggested files alongside current Tau Ceti. Generic upstream constructions are imported, never replanned. No necessary source is missing; the remaining gaps concern fine formal interfaces.

The packet's two source findings are own-words descriptions, following the standing no-quotation instruction: CG Lemma 6.2 needs nonzero cohomology before the first-degree argument; the ACC scalar-cone paragraph needs regularity to identify its cone with ordinary divisor reduction. ACC Lemma 6.3.4 already assumes regularity. The published CG author's statement was also checked. No separate correction was found in the checked versions and public correction search; the packet records the scope of that search.
