# BP-HodgeTateAndCanonicalSubgroups--T6 handoff

Worker: Codex, session `codex-gcEbbg`; issue #756. This is a completed
target-level planning pass, not a checkpoint or an implementation claim.
The exact three issue stages are in scope; every implementation status remains
`unchecked`.

## Deliverables and coverage

The packet, reader and suggested file are
`HodgeTateAndCanonicalSubgroups--T6.{json,md,lean}` in their respective
`research/blueprint/{packets,readmes,suggested}` directories.

| Quantity | Count |
| --- | ---: |
| Definitions | 11 |
| Constructions | 21 |
| Theorems | 29 |
| Applications | 1 |
| Total nodes | 62 |
| API items | 127 |
| Discriminating mathematical tests | 96 |
| Planets | 11 |
| Baseline declarations | 9 |
| Gaps | 9 |
| Supplier requests | 14 |

`T6:log-sites`, `T6:comparison` and `T6` are each **planned**, with precise
remaining lists. None is closed. Every target has a mathematical statement,
hypotheses, proof architecture, source locator, prerequisites and acceptance
criteria. Every definition/construction has at least three tests. The reader
includes every card and its API/tests, the library boundary, supplier requests,
routing ledger and restructuring proposals.

## Mathematical and ownership decisions

The plan includes analytic fs charts and products, continuous differentials,
coherent Kummer acyclicity, finite descent and Abhyankar, the corrected
transfinite pro-Kummer site, the all-root perfectoid basis, completed local
systems and boundary monodromy, proper log primitive comparison, filtration
completion of structural periods, log Poincaré/Faltings, normalized RH/Higgs,
restricted pullback and unipotent tensor comparison, proper/relative period
comparison, general canonical coefficients, the two-lattice HT filtration and
the central cyclotomic Levi twist.

Three confirmed area findings are addressed through ownership and proposals,
without editing atlas data or other jobs:

- RT-AREA-padic-1/4: sole ownership of BP Theorem 4.4.40 belongs to
  `PerfectoidShimuraVarieties:S6`. All three T6 descriptions are narrowed to
  finite-level 4.4.38–4.4.39 and their logarithmic infrastructure. Preserve the
  diamond statement at S6 without adding a general perfectoid assertion.
- RT-AREA-padic-1/23: BCGP-25's four usual/cuspidal and analytic tower
  comparisons are routed outside T6. The log primitive input remains here;
  ordinary comparisons go to TC.2 and the analytic higher-Hida comparisons
  to HigherHidaAndColemanTheory, as specified in the packet proposal.
- RT-AREA-padic-1/24: an early ordinary primitive owner is requested from P8,
  with proposed `P8:primitive` and `T6:log-primitive` splits. Proposed stage
  ids are not invented prerequisites. No log-site node depends on P8 or
  CP.3. The ordinary primitive request is explicitly restricted to its early
  export; adopting a full late P8 supplier edge would recreate the cycle.

The complete perfectoid-basis theorem is over Spa(Z_p,Z_p), without an extra
log-smoothness or perfectoid-base assumption. Ramification is the exponent of
the characteristic cokernel. Structural periods require filtration completion:
the quadratic sparse series in the tests distinguishes it from plain
localization. The ascending lattice quotient uses its intersection kernel.
The rank-one test pins the lattice shift before converting to a named Tate
weight convention; T1 must supply that convention.

## Precise closure work

The nine gaps in the packet identify their consuming nodes. A follow-up must:

1. Adopt the early ordinary primitive split and reconcile CP.3's existing
   proposed name with `P8:primitive`; connect only the early export to the
   logarithmic primitive package and its tower-cohomology consumers.
2. Close R0/R3/R4's ordinary analytic normalization, continuous differential,
   coherent pushforward and characteristic-zero SNC compactification inputs.
   The compactification assertion is only for a smooth Zariski open in a
   proper rigid space, not for an arbitrary nonproper rigid space.
3. Add the requested PerfectoidSpaces Part II Banach decompletion/good-model
   interface, separately from the early ordinary completed-sheaf acyclicity
   export. Period-quotient towers are decompletion systems; A.2.3.4 is not
   strengthened to stable decompletion.
4. Close the exact arithmetic-rigidity/congruence instances in ALS.1 Part II
   and the proven CM/absolute-Hodge/potentially crystalline tensor input in
   MC.7. No general Shimura motive is assumed.
5. Close V8.general's exact Piatetski-Shapiro embeddings and special-point
   descent inputs; merely having special points is insufficient.
6. Reconcile H0/E1/E2's continuous group cohomology, filtered colimits,
   derived inverse limits and hypercohomology interfaces.
7. Collate author-copy Corollary 6.3.4 with the published chapter before
   asserting a version-of-record error. The author's printed finite-Z_p
   cohomology clause lacks properness; the constant F_p system on a nonproper
   closed disc contradicts it via Remark 6.2.2. Extension does not need
   properness, but finiteness does. This version-scoped issue is recorded
   as `HodgeTateAndCanonicalSubgroups/E1` and corrected in the target.
8. Supply the missing geometric types, then replace the suggested file's
   explicitly unstated geometric contracts with full typed signatures and
   examples. Independent review must check this gap rather than treating
   elaboration of the components as full geometric formalization.

The fourteen requested stages are R0/R1/R3/R4 of AdicSpacesPartII, H0 of
ClassicalAdicEtaleCohomology, E1/E2 of EnhancedDerivedSheaves, P8 of
PadicHodgeTheory, P3 of PerfectoidSpaces, ALS.1, MC.7, V8.general and T1/T2.
Existing CR.5, ordinary site, period and automorphic-coefficient nodes are
imported rather than given duplicate owners. A requested supplier is an
obligation, not evidence of an existing proof.

## Suggested file and validation

`python3 scripts/check_blueprint.py` on the packet reports **0 errors and
0 warnings**. All source excerpts were checked as literal whitespace-normalized
substrings of the hashed public texts. Node, API and test names were checked
against the reader and suggested-file contract catalogue. The exact scope,
internal prerequisite acyclicity and absence of P8/CP.3 in the early log-site
prefix were checked. Deliverables contain no private absolute paths.

`lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups--T6.lean`
elaborates successfully, with `sorry` as its only warning. Memory was checked
before each invocation and exceeded the 20 GB threshold. The mandated shared
build has Mathlib at the exact pin. Its Tau Ceti checkout is newer, but the
imported Huber Pair module and its direct Tau Ceti dependencies were checked
unchanged from f790474; baseline declarations were read at that exact commit.
No language server, Lake build/update or cache download was used.

This is deliberately **not a claim that every geometric signature is typed**.
There are 40 explicit component declarations and 31 elaborated examples.
Components cover 18 of the 32 constructor names, 30 API names (including those
constructors), and 27 named test contracts; four examples are auxiliary
components. Two additional API properties are structure fields. These are
affine/stalk, supplied-site, completion, connection, chart-divisibility,
intersection-quotient and central-twist components. Some components express
only part of the full mathematical test. Every packet name and full
mathematical contract appears in the catalogue; the remaining geometric
declarations, theorem signatures, API and examples are marked **not stated**
with their required carriers. No arbitrary proposition field, dummy truth,
assumed comparison conclusion or uninterpreted proposition definition masks
an omission. The libraries need the ringed log-adic carrier, corrected
geometric site categories, completed analytic tensor sheaves and canonical
Shimura coefficient interfaces before these contracts can be stated faithfully.

## Sources

Read the public DLLZ *Logarithmic adic spaces* copy, §§2–4, 5.1, 5.3–5.4 and
6.1–6.3; DLLZ *Logarithmic Riemann–Hilbert*, §§2–3 and 5.2–5.6, plus the
Appendix A decompletion theorem statements used in §3.3; and BP *Higher Coleman
theory*, §4.4.5, especially 4.4.38–4.4.39 and the boundary of 4.4.40. URLs,
SHA-256 hashes, version records and reading scopes are retained in the packet
and reader, so no scratch file is needed to resume closure work.

The Springer chapter supplied metadata/preview, not the published body; the
AMS published RH endpoint refused access. Neither published text was collated.
Other maintainer-added sources were inspected through their extraction/routing
records to identify targets in T0–T5, T2, TC.2 and higher Hida theory; no
out-of-scope target is claimed as a T6 result. Both upstream AdicSpaces and
HodgeStructures roadmaps were read for granularity and interfaces. The reviewed
coverage audit and atlas links contain no direct T6 library implementation.
