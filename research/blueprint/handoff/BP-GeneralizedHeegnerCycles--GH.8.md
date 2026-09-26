# Handoff: BP-GeneralizedHeegnerCycles--GH.8

## Regulator-descent and validation continuation

Codex — codex-hjdg0j, 26 September 2026. Claim comment 5850583554;
winning bot reply 5850584590. Scope: exactly GeneralizedHeegnerCycles:GH.8.
**Partial checkpoint: none of the five geometric/source gap groups is closed.**

### Changes and preservation

The family comparison now distinguishes three injectivity steps: global
localization, the local regulator after quotient descent, and scalar evaluation
on the ordinary crystalline line. LZ14 Proposition 4.11 has an infinite
unramified-direction hypothesis. CH Theorem 5.1 takes a quotient. A proof that
the descended kernel is zero is an additional required input; an injective
map need not remain injective on quotients. The GH.7 request now specifies the
coefficient/analytic comparison, submodules, kernel equality and nonzero pairing,
as well as the torsion-free/control/nonvanishing/rank-one proof of global
localization. These remain with their existing owner. The narrower cyclotomic
L3 blueprint supplies no replacement for that construction.

The algebraic kernel formula already exists in pinned Mathlib. Four baseline
references replace any need to plan it again: Submodule.mapQ,
Submodule.ker_mapQ, Submodule.mkQ_map_self and LinearMap.ker_eq_bot.
The source and target submodules must be identified before this formula can
be applied to bounded Iwasawa modules and analytic distributions.

Four suggested-file checks cover the sufficient preimage condition,
multiplication by X on Q[X] losing injectivity modulo X, the noninjective first
projection on Q^2, and injectivity of a nonzero functional on a specified line.
The counterexamples test general inference rules; no new error in either
arithmetic theorem is asserted.

Preserved all 12 IDs, 11 entire node objects, all five original baseline names,
all ten supplier stages, three planets and the existing source finding
GeneralizedHeegnerCycles/E-GH8-1. Only ordinary-p-old-family's proof contract,
dependencies and acceptance were expanded. No independently accepted review or
fresh errata search is claimed.

### Sources actually checked

Read the current packet, reader, suggested file and prior handoff; the full
campaign document; GH.8's stage and every touching stage edge; the aggregate
reviewed AUDIT-24 GH.8 row; the integrated decomposition's GH.8 coverage;
HE.0/HE.2/HE.3/HE.8 and L6 ownership descriptions; the relevant integrated
Heegner-point nodes; the GH.4 integrated reciprocity node; and all link-map
entries mentioning this roadmap (one, CFT-L91). The binding protocols and two
upstream documents read earlier in this session, GrothendieckEulerForms and
JacobianChallenge, were verified unchanged.

Fresh bounded primary-source reads, with the exact downloaded hashes in the
packet:

- [Castella author copy](https://web.math.ucsb.edu/~castella/Heegner.pdf),
  physical/printed pp. 27–29: Lemma 6.4, Theorem 6.5 and their proofs,
  Remark 6.6. Page 28 was successfully rendered and inspected.
- [CH revision dated 2 July 2022](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf),
  pp. 21–25: Theorem 5.1's quotient construction, Section 5.2 and the ordinary
  line/period comparison of Section 5.3, through the Theorem 5.7 proof.
  Page 22 was rendered and inspected. The remainder of Corollary 5.8 was not read.
- [Loeffler–Zerbes arXiv v3](https://arxiv.org/pdf/1108.5954v3), pp. 16–18:
  Definition 4.6, Theorem 4.7, Propositions 4.8–4.11, including the complete
  proof of Proposition 4.11. Page 18 was rendered and inspected. The UCL
  repository download returned HTTP 403, so the actual file read was obtained
  from arXiv. This 45-page preprint is not the journal typesetting.
- All nine cited Mathlib declarations were read in their pinned files and
  verified against their Git blobs. The four new references were also checked
  in the compiling suggested file.

These are bounded reads, not complete-paper coverage. BDP and the earlier
CH editions/erratum remain inherited evidence. Wach/Yager construction,
cohomological control and source-version transport are unresolved supplier
proofs. The local descent boundary is recorded as a gap, not a new source issue.

### Validation

- Indexed blueprint checker: **0 errors, 0 warnings**.
- Suggested file compiled with **Lean 4.34.0-rc2, Mathlib 082e2d3**:
  **0 errors, 22 warnings, all intended placeholders**. The inherited file
  already elaborated with 18 warnings; four regression examples were added.
  The final reachable Mathlib sources match the pin and cache. There are no
  Tau Ceti imports; the packet's Tau Ceti baseline remains f790474.
- **5 named algebraic signatures, 17 examples, 4 declaration checks**.
  Suggested SHA-256: `c29859fe3e95d703adede60b6c709dac7cc20abd16abb3d0bf278c73a9271843`.
- Internal node graph acyclic; no supplier stage or cross-roadmap edge added.
  The local graph check does not certify closure of every supplier proof.
- **12 nodes:** 5 lemmas, 3 theorems, 2 comparisons, 2 applications;
  **0 definition/construction APIs and 0 definition tests**, since this packet
  introduces no such objects; **43 acceptance conditions**, **3 planets**,
  **9 baseline references**, **10 requests**, **5 gaps**.
- Intake check-files: **4 files, 0 problems**. Only this job's deliverables and
  handoff are changed.

### Resume here

1. GH.7 must supply the actual regulator descent: identify bounded/analytic
   coefficient maps and quotient submodules, prove the zero kernel, and
   transport the nonzero ordinary-line pairing and source-version periods.
   Reuse the pinned quotient algebra; do not infer descent from LZ14 alone.
2. Complete GH.7's global localization argument on every finite component,
   including control and the source-qualified nonvanishing/rank-one inputs.
3. The previous finite Picard–Kummer/Gysin sign, continuous realization,
   initial HE.0/HE.2 degree/trace, and uniform lattice-map obligations remain.
   The current source reads do not resolve the full-unit/half-unit comparison.
4. Repair or bypass the symmetric-power carrier using actual maps, supply the
   consumer comparisons while preserving L6 ownership, and write the seven
   geometric Lean signatures once their interfaces exist. Keep all source and
   normalization restrictions. No opaque replacement carriers are introduced.

---

The preceding handoff is retained as history. Its statements that the compiler
and aggregate audit/link reconciliation were unavailable are superseded here;
its geometric boundaries remain in force.

# BP-GeneralizedHeegnerCycles--GH.8 — continuation checkpoint

Issue: #740. Agent/model: ChatGPT Pro / GPT-6 Astra Pro.
Session: `cgpt-20260926-serre-a7d4`.
Branch: `cgpt-20260926-serre-a7d4-gh8`.
Date: 26 September 2026.
Claim comment: 5849041047. Bot confirmation: 5849042082.

## State and preservation

This is a **partial checkpoint**, continuing the files merged from #2953. It is
not a closed GH.8 blueprint and not a Lean formalization. Only the four issue
paths are changed; the canonical roadmap/decomposition and other stage parts
are untouched.

The seven original IDs remain: `weight-zero-cycle`, `modular-quotient-kummer`,
`character-sum-comparison`, `positive-conductor-stabilization`,
`positive-tail-corestriction`, `differential-evaluation`, and
`ordinary-p-old-family`. Their geometric, coefficient, period and family
boundaries are retained. The source issue `GeneralizedHeegnerCycles/E-GH8-1`
is preserved and still needs independent review. No second source error is
asserted from the initial unit-factor discrepancy.

Counts now: **12 nodes** (5 lemmas, 3 theorems, 2 comparisons, 2 applications),
**41 acceptance conditions, 3 planets, 5 baseline references, 10 supplier
requests, 5 explicit gaps, 1 retained source issue**. There are no new object
definitions, hence **0 definition API items and 0 construction unit tests**.
The suggested file separately contains **5 named algebraic signatures and 13
examples**, including the five earlier linear tests. All implementation statuses
remain unchecked; the scope is exactly `GeneralizedHeegnerCycles:GH.8`.

## New mathematical content

The initial-conductor lemma derives the normalized bottom from the *raw* first
trace and degree. Its hypotheses explicitly include u cor(k_1)=a_p k_0 minus the
two Frobenius terms, u d=p-1, the corestriction/restriction degree formula and the
inverse-Frobenius action on k_0. Expanding with the Hecke polynomial gives
u^{-1}(1-alpha^{-1}sigma)(1-alpha^{-1}tau)k_0. This narrows the remaining work to
actual HE.0/HE.2 arithmetic and its transport; it does not postulate a normalized
Euler-system relation as its hypothesis.

A separate negative test shows that changing only a nonzero bottom term by a
factor other than one breaks the norm relation. A uniform rescaling of the
entire system is different and is allowed. The nonzero condition is not an
arithmetic nonvanishing theorem.

The two integral-tower lemmas use forward/backward maps whose composites are
one **fixed** scalar d. Applying the reverse map bounds the kernel, and applying
it componentwise to a compatible target sequence explicitly lifts d times that
sequence. The latter is a constructive compatibility argument, not an appeal
to right-exactness of inverse limits. An integral isomorphism is not asserted
when d is a nonunit.

The regression counterexample is M_n=Z with transition 2, N_n=Z with transition
1, and f_n=2^n. All rational level maps are isomorphisms, but the rationalized
integral limit map is 0 -> Q. The proof uses divisibility by every power of two.
The rational sequence 2^{-n} explains precisely why changing the order of
coefficient extension and inverse limit is invalid without a uniform bound.

The supplier contracts now require choosing the actual coefficient factor on
which the modular quotient is a rational isomorphism. They do **not** assert a
two-sided inverse up to scalar on the entire Jacobian cohomology. Both composite
identities, their common denominator and all corestriction compatibilities
remain concrete geometric/lattice obligations.

## Checks performed in this continuation

Local Python structural checks passed: JSON syntax, exact one-stage scope and
coverage, all original IDs retained, unique IDs, displayed-node DAG, prerequisite
resolution against the displayed node/baseline and explicitly known supplier
stages, required source fields, planet constraints, all five new library names
present in the suggested file, and absence of private paths or Lean proof text
in the packet/document. These are not the repository-wide validator or its
pinned declaration index.

SymPy verified the symbolic initial-factor identity after substituting the raw
root/degree relations. Exact arithmetic also checked **144 two-dimensional
initial-factor models**, including non-scalar inverse Frobenius matrices, and
**2,500 integer matrix/vector cases** for the fixed-denominator scalar identities
using matrices and their adjugates. **40 finite truncation/rational-section
checks** illustrate the counterexample. Finite tests do not prove its infinite
claim; the uniform divisibility proof is written in the blueprint.

**Lean was not compiled.** No Lean/Lake executable or local pinned repository
checkout was available. The file uses the protocol's signature/example form;
none of the seven geometric targets is replaced by an opaque placeholder.
Repository-wide `check_blueprint.py` and pinned-index validation must run in this
pull request's CI. This handoff does not pre-claim their result.

## Evidence and limits

The current WORKERS/PROTOCOL rules and the existing checkpoint/handoff were read.
The roadmap atlas, the integrated decomposition's scope/source header (which
still marks GH.8 not_read), the accepted scoped AUDIT-24 GH.8 verdict and review,
and the relevant HE.0--HE.3/HE.8 ownership descriptions were inspected. The
aggregate library-coverage file exceeded the connector's size limit; a complete
aggregate-audit/link reconciliation is not claimed. AUDIT-24 records the actual
arithmetic comparisons as absent, not already implemented by nearby cohomology.

CH's published Definition 5.2 on printed p. 601 was independently re-read in its
page image. The relevant revised CH section and its Definition 5.2 image were
also inspected, and the parsed Castella Section 6.2 was read. An additional
Castella p. 28 screenshot request failed. The earlier checkpoint's BDP/erratum
reads and source issue are preserved as earlier work, not relabelled as fresh
full source reads or an independent rediscovery.

The actual pinned `LinearMap` definition was re-read and
`Int.natAbs_le_of_dvd_ne_zero` was newly read, including its statement and proof.
The three dual-space references retain the earlier checkpoint's pinned reads.
No current-branch search result is asserted to be a checked pinned declaration.

## Exact continuation

1. Prove the finite Picard--Kummer/Gysin sign and transition comparison, then the
   continuous realization. Keep the degree-zero cusp correction and the actual
   level fields. The multiplicative Kummer map with mu_m does not provide the
   elliptic Tate-module result.
2. Compute HE.0's unit-index/first-degree formula and HE.2's raw first trace,
   with the level descent, Frobenius convention and basepoint corrections. Apply
   `initial-corestriction-comparison` to each source's actual classes. Only then
   resolve the full-order versus half-order discrepancy. Do not infer arithmetic
   nonvanishing from the rescaling test or silently replace a printed constant.
3. Select the correct f-coefficient factor and construct forward/backward
   integral comparison maps. Bound their denominators by one scalar independent
   of the ring-class level, prove both composite identities, and verify
   corestriction naturality. Instantiate the two coherent comparison lemmas in
   GH.3's existing Iwasawa realization; do not duplicate that carrier.
4. Repair or bypass the general CM-character carrier from E-GH8-1, preserving
   the degree-zero exception. Finish the regulator/twist/version comparison and
   the separate local and global injectivity arguments for the p-old family
   statement; do not extend it to p-new or nonordinary specializations.
5. Finish the source-qualified consumer maps to AutomorphicCongruences L2 and
   BSD.6a without duplicating the downstream L6 formulation work. Reconcile all
   applicable reviewed links and elaborate the suggested file at the pins.
   Keep coverage partial until these mathematical and integration gaps close.
