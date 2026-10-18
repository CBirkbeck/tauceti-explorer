# DESIGN-AnticyclotomicLocalUnits

Issue #1688. Worker: Codex, session codex-temU1Z. The bot confirmed this session’s claim before work began. This is a completed target-level planning pass, ready for independent review; it is not a closed blueprint or an implementation.

The five deliverables define the requested ColemanPowerSeries Part II with nine layers ALU.0–ALU.8. The packet has 50 targets, 16 definitions/constructions, 56 API items, 48 discriminating definition tests, 43 planets (at most six per layer), nine pinned baseline declarations, twelve supplier requests and ten exact missing-input contracts. All nine layers are `planned`, the packet is `complete`, and every implementation status is `unchecked`. This follows the current WORKERS.md target-level and compact Suggested.lean rules, which supersede the older issue’s declaration-by-declaration Lean shape.

## What the plan establishes

The reader gives the full statements, proof steps, sources, APIs, tests and worked checks. The dependency graph reaches the integral signed decomposition, rank-one freeness, nonzero derivatives at every matching-parity character, and finite signed formal-point Kummer exports. Units kill opposite parity; points kill same parity; the trivial character is plus. Order p corresponds to conductor p². The π-adic Tate sequence has the (−1)^n correction. The trivial derivative has the factor 1+p⁻¹. The seven-map CM projection uses the early zeta classes, before the final p-adic L-function. The dual-exponential comparison is a distinct target from Wiles’s trace pairing.

Two proof-order choices deserve review. Coefficient descent of the Finis unit value gives ξ* without assuming signed freeness. Finite-level formal saturation is proved in ALU.3, before it is used to deduce positive quotient rank from unbounded point components. The final Nakayama argument explicitly uses augmentation linearity, rather than continuity alone.

The primitive point is obtained from a separable optimal modular parametrization, with a good-prime Manin-unit argument based on the publicly readable Abbes–Ullmo proof. The three point-counting bounds are separate. A stronger generic count handles every p≥13, including p=47; p=5/11 use level 27 and p=7 uses level 32. Fine level M=p+1 is prime to p. The two-coordinate Hecke lattice list gives p distinct forward neighbours and the backward neighbour. Initial conditions are y₀=0 and Tr y₁=−y. The Herbrand/cohomology proof uses only the primitive trace system, with no global Heegner-point construction. Finite signed exports do not assert an unproved equality between finite invariants and finite Kummer images.

Exact small-prime quadratic-field checks are retained in the reader: discriminants −7, −15 and −31, with complete reduced-form certificates and Euler criteria, cover every prime 5≤p≤47. The general analytic class-number bound remains G10. In that bound π_real denotes the real circle constant, distinct from π=−p.

## What prevents closure

The packet and reader specify the consumers and exact statements for all ten contracts:

- G1: register the Lubin–Tate/quasi-canonical foundation, including conductor, Honda/logarithm and adic-completion realization interfaces. Issue #3355 is a restructuring lead, not a registered supplier stage.
- G2: register the early CM special-value foundation, including canonical character/root number, zeta-class reciprocity, semilocal projection data and the precise Finis unit theorem. Issue #3350 is the restructuring lead. These inputs must precede the signed p-adic L-function.
- G3: register the general supersingular finite-field/mass/Schoof inputs. Issue #3398 is the restructuring lead.
- G4: provide composite-level proper good models, connectedness/genus, mixed fine levels, integral Hecke correspondence and differential-comparison infrastructure. Current upstream ModularCurves Layer 10 is prime-level only and does not cover N=27/32. Extend the existing modular-curve direction rather than inventing a second foundation here.
- G5: locate/read the general one-variable unit norm-control theorem used by Wintenberger §5.2; finite local reciprocity alone is insufficient.
- G6: read/decompose the full height-two Coleman construction. The parent supplies cyclotomic machinery, not this new interpolation theorem automatically.
- G7: finish the actual finite formal Cartier/Kummer/elliptic comparison, coefficient trace and reciprocity conventions; do not assume self-duality of an arbitrary formal group.
- G8: justify the shrinking formal-norm estimate after every finite ramified base change and in a cofinal direction of the two-variable tower. Hazewinkel Theorem 1.3 as read assumes an unramified base.
- G9: obtain and read Wiles’s original reciprocity proof. It was not accessible in this run. The read BKO/Rubin statements fix the required interfaces but do not close this proof obligation.
- G10: locate/read the general Dirichlet class-number/L-value estimate used for p≥53; the finite p≤47 computation is supplied.

No nonexistent foundation stages were invented. Requests to registered suppliers record exact scope. The fine-grained existing dual-exponential node is imported from PadicHodgeRegulators:L1; no new exponential is planned. No foundational definitions moved to this roadmap from a higher-tier package.

## Library and source audit

The parent/Measures/Duality reviewed library audit, existing packets and links, reserved IDs, current TauCetiRoadmap and current Tau Ceti were inspected. The implementation baseline remains Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Actual source statements at these pins were read for all nine baseline citations. In particular the existing formal-to-elliptic homomorphism, its injectivity and range are reused with their actual Dedekind-domain completion hypotheses. Current ProfiniteProPGroups already has a generic CompletedGroupAlgebra: the Measures request adapts it to O, rather than duplicating that construction.

Read sources and their hashes/URLs are retained in both JSON deliverables: BKO §§1–5 and the finite export boundary in §6; the entire Rubin 1987 article pp.405–422; all Hazewinkel III pp.305–314; Wintenberger’s theorem and proof pp.89–103; Abbes–Ullmo Theorem A and its proof, especially pp.276–279. Nearby current upstream ProfiniteArithmetic and LocalGaloisGroups readers, and the relevant elliptic/modular-curve material, were used for style and boundaries. Source texts were kept only in scratch and will be deleted on submission.

The cleared-library index was read. Wiles78 was unavailable through the attempted public publisher/JSTOR/author routes. Kato’s 1993 LNM 1553 article, Chapter II Theorem 2.1.7, and Cohen’s class-number estimate are not in the cleared library; no uncleared book copy was fetched or read. Their missing proof inputs are explicit gaps.

Thirteen source issues are recorded in the packet. E1–E10 cite the existing atlas errata findings; E11 is the Tate-sequence correction already in BKO’s footnote 2. New E12 is the continuous coefficient-of-T counterexample to Rubin Lemma 4.2 as printed; augmentation linearity repairs its use here. New E13 is the scalar forward-lattice list on BKO p.959: all printed candidates coincide for s≥1, and inserting the independent θ coordinate repairs the enumeration. Both new findings require independent review. The published PDF/scans and sourceVersions are recorded; all statements and corrections are in the worker’s own words. Checking the publisher PDF also confirms that only φ, not ν or χ, is conjugated in the CM value formulas.

## Validation and suggested file

The 79-line suggested file has two real-bodied light definitions on existing natural numbers/power series, two algebraic milestone statements and seven proved examples. Heavy mathematical carriers and their full APIs/tests stay in the reader. No data definition uses `sorry`, no proxy structure encodes the theorem, and no Lean theory is developed.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnticyclotomicLocalUnits.json --index <pinned-declaration-index>`: zero errors, zero warnings; all nine layers planned.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AnticyclotomicLocalUnits.lean`: passed.
- `lean-check research/blueprint/suggested/AnticyclotomicLocalUnits.lean` (absolute path supplied to the wrapper): compiled successfully at the exact pins, with only two `declaration uses sorry` warnings for the algebraic milestones. The examples elaborated with proofs. Memory was checked first; no build or language server was started.
- Submission file checks: all five files passed with zero problems. Independent node/stage acyclicity, JSON coverage, reader target inventory, API/test counts, planet caps and gap/request consumer checks passed. `git diff --check` passed.

Next work is the independent review of this complete plan. The reviewer should first inspect the two new source findings and the exact π normalization in the separate dual-exponential target, then the ramified-base norm-control and missing supplier contracts. No second job was claimed.
