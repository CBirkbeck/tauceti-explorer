# PKG-EllipticCurveModularity — completed package

Agent: Codex (GPT-6). Session: `codex-GUIptE`. Date: 2026-10-10.
Issue: #7469. Branch: `codex-GUIptE-elliptic-modularity-package`.
The bot confirmed the claim in
[comment 6091344437](https://github.com/CBirkbeck/tauceti-explorer/issues/7469#issuecomment-6091344437).

**All four package deliverables are present. The full Suggested.lean elaborates
at the required pins with zero errors and only sorry warnings.** This completes
the package job; it does not assert implementation of the roadmap's mathematics
or closure of the unchanged accepted packet's external supplier requests.

## Changes and attribution

The README, unified suggested file and 19 direct definition/construction
examples were drafted in the earlier `codex-ZSEmbF` checkpoint. Session
`codex-6PzyiM` corrected Markdown mathematical notation; `codex-4oIQdS` checked
that the old shared dependency blocker persisted. Those contributions are
retained. This session read the entire package and accepted inputs, repeated
source and library checks, completed full-file elaboration in the now available
pinned build, and added the one-line metadata.

The README now credits the current native elliptic torsion action, Tate-module
representation, rank-two equivalence and cyclotomic determinant. The Lean
header explains how those replace the explicitly owned interfaces when moving
beyond the compilation baseline. Its companion-statement comment now correctly
credits the pinned abelian-variety and endomorphism-ring types: the missing
interface there is the conductor and real-multiplication compatible system,
not the abelian-variety type.

Only this issue's README, Suggested.lean, metadata and handoff were changed.
No packet, original reader, original suggested file, audit, library, roadmap
checkout or other job's deliverable was modified. No library was built or
copied. The former missing-Newform blocker is resolved.

## Validation receipt

- `lean-check research/blueprint/packages/EllipticCurveModularity/Suggested.lean`:
  **exit 0, zero errors, 111 warnings, all `declaration uses sorry`**.
  The complete file, including the Newform import, all 23 direct examples,
  actual definitions and typed imported interfaces, elaborated. Available
  memory before the final check was 102 GB. No compiler or language server
  remains running.
- Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
  Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
  Mathlib HEAD and the build manifest agree with the pin. The shared Tau Ceti
  source tree has no Git metadata; all **5,478** source-tree files were compared
  by Git blob hash with the read-only library's tree at f790474, with **zero
  mismatches**. No alternate-library or substitute-Newform check was used.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularity.json`:
  **zero errors, zero warnings**. The unchanged input reports 23 nodes,
  23 API items, 19 tests, six planned stages, 11 requests and two gaps.
  Its status remains `partial`; packaging does not silently edit it to closed.
- Correspondence: all 23 API names and all 19 named tests occur in both
  package files, and their signatures were read against the accepted inputs.
  The six layer headings occur once in order. There are 18 distinct imports,
  one opening header and 23 direct examples: the 19 named definition tests,
  three elementary norm/pigeonhole checks and the analytic example.
- Independently recomputed c₄ and Δ for all nine test models, point counts
  giving a₂(11a1) = −2, a₃(11a1) = −1, a₃(274a1) = −2 and
  a₃(37a1) = −3, equal traces for 11a1/11a2/11a3 at odd good primes
  through 43, and the −1 twist trace relation at those primes.
  Rational Weierstrass addition verifies exact orders 5 and 7 for (5,5)
  on 11a1 and (1,0) on 26b1. For 162b1, arithmetic in
  ℚ[x]/(x³−3x²+3) verifies divisibility of the seventh division polynomial,
  irreducibility of that cubic and the duplication three-cycle on its roots.
  These are arithmetic checks, not proofs of the sorry-backed declarations.
- `git diff --check` passed. README is approximately 80 KB and retains the
  exact targets, source locators, imported contracts and mathematical examples;
  it has no job, packet, checkpoint or review narrative and no source passages.

## Target correspondence

IDs in this table follow `EllipticCurveModularity:`. Suggested.lean carries
the same target IDs in docstrings; the final scope application is specified
in prose and explained in its concluding comment, as the accepted input does.

| Target | README location |
| --- | --- |
| R29.1/exceptional-primes | The exceptional set; tests of all four clauses |
| R29.1/residual-conductor-divides | Comparison of conductors before and after reduction |
| R29.1/residual-conductor-equality | Same section, exact criterion and p = 5 source boundary |
| R29.1/residual-irreducibility-and-the-conductor-of-E-p | The residual representation outside the exceptional set |
| R29.2/finite-flat-weight-two | Finite flatness determines the weight |
| R29.2/weight-two-and-level-N-from-the-weight-recipe | The witness at a residual characteristic; witness tests |
| R29.2/trivial-nebentypus-by-reduction | Trivial character from reduction |
| R29.3/pigeonhole-infinite-fiber | The finite-range argument |
| R29.3/algebraic-integer-norm-vanishing | Vanishing of an algebraic integer |
| R29.3/attached-newform | Attachment and uniqueness across levels |
| R29.3/a-single-newform-for-infinitely-many-p-and-exact-coefficients | From infinitely many congruences to one exact form |
| R29.3/newform-of-E | The newform of an elliptic curve |
| R29.3/rational-coefficient-field | Rationality of the whole coefficient field |
| R29.4/tate-module-comparison | The rational Tate-module comparison |
| R29.4/exact-conductor | The level is the conductor |
| R29.4/bad-euler-factors | The bad factors and all Dirichlet coefficients |
| R29.5/isogeny-to-E | Isogeny from the modular quotient |
| R29.5/modular-parametrisation | The morphism from X₀ at the conductor; degree tests |
| R29.6/absolute-irreducibility-of-the-rational-tate-module | Absolute irreducibility of the rational Tate module |
| R29.6/newform-from-a-modular-quotient | Recovering a primitive form from a Jacobian quotient |
| R29.6/modularity-theorem | The three equivalent modularity formulations |
| R29.6/l-function-continuation | Continuation and the functional equation |
| R29.6/what-theoreme-4-asserts-and-its-scope | Theorem 4 and the real multiplication boundary |

## Library and ownership checks

Read WORKERS, both protocols and UPSTREAM_GUIDE; read the upstream
ConformalMapping and RepresentationTheory/SemisimpleAlgebras READMEs in full.
Read the relevant EllipticCurves and ModularForms interfaces in current
TauCetiRoadmap, including Layer 2 torsion, Layer 5 cross-level multiplicity one
and Layer 8g coefficient conjugation. Current roadmap revision:
`618e0b30d21791d6a492ce88ba8602745697b21a`; current Tau Ceti revision:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The nine newer roadmaps named by WORKERS were searched in their Suggested
files (including all eight OperatorTheory files). No duplicate elliptic
modularity target was found. LocalGaloisGroups' Tate module is its local
Galois-layer module, a different input, not an elliptic Tate module.

Read the EllipticCurveModularity reviewed audit in AUDIT-32 and the related
R28.6, ModularForms Layers 5/8g and BSD.0 entries in data/library-coverage.json.
Read all 16 accepted baseline declaration statements in the pinned source,
including the actual Newform record, fixed-level strong multiplicity one,
local polynomial and L-function definitions.

Current native declarations read and credited, rather than replanned:

- `WeierstrassCurve.torsionGaloisAction` in
  `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean`;
- `WeierstrassCurve.tateModuleGaloisRepresentation` in
  `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`;
- `WeierstrassCurve.nonempty_linearEquiv_tateModule` in the corresponding
  `TateModule/Basic.lean` (separably closed extension, invertible prime);
- `TauCeti.det_tateModuleGaloisRepresentation` in
  `TateModule/Determinant.lean` (same hypotheses, cyclotomic determinant).

These postdate the atlas compilation pin. The stand-ins remain explicitly
owned input signatures at that pin. Current strong multiplicity one also has
`Newform.level_eq_of_dvd_of_forall_prime_eigenvalue_eq`: it assumes a divisor
level and agreement at every good prime. It does not supply arbitrary-level
agreement outside a finite set, so the Layer 5 import is still required.
Pinned `TauCeti.AlgebraicGeometry.AbelianVariety` and `AbelianVariety.End`
were read when correcting the companion comment.

## Preserved mathematical contracts

All 11 external requests remain precise supplier contracts; no further result
is claimed to exist merely because this package compiles. In particular:

1. End_ℚ(E) = ℤ is owned by FaltingsFinitenessAndIsogenyTheorems R28.6
   under RS-06. The unchanged accepted packet records that its current supplier
   assumes it and points back to R29.1. This supplier-plan correction still
   belongs to R28.6; this package imports the exact statement and does not
   silently resolve the circular attribution or duplicate it here.
2. The sharp Mazur bound 163 remains an unread refinement of the input.
   It is not needed: exceptional-set finiteness uses the explicitly cited
   R28.6 finite-isogeny-class/rank-one-Hom route.
3. Serre p. 207 states the conductor criterion for p > 5. The accepted
   signature is p ≥ 5; the README gives the local argument for 5 rather
   than attributing that endpoint to the printed statement. Existence uses
   only p ≥ 7.
4. The exhaustive J₀(N′) old/new decomposition, with all Galois orbits and
   divisor-count multiplicities, belongs to ModularCurvesPartII R14.5.
   An individual J₁ quotient or Tate-module comparison cannot replace it.
   `modularQuotient₀` and its map remain the explicitly requested J₀ interfaces.
5. The real multiplication companion retains the precise hypothesis
   ℚ ⊗ End_ℚ(X) is a totally real field of degree dim X. Its conductor and
   compatible-system prerequisites exceed the elliptic interfaces in this
   file; its source statement and scope are in the README, without a fake
   Prop-valued condition or an asserted elliptic proof of the extension.
6. Arithmetic Frobenius on homological Tate modules, inertia coinvariants
   for Euler polynomials, prime-to-p residual conductors, trivial character,
   J₀ versus J₁ quotients, and arbitrary geometric level N′ versus N_E
   remain explicit. No general object was reassigned to this package.

## Sources read in this session

Fresh public downloads on 2026-10-10 match the accepted source identities.
All listed passages were read afresh. No source file or passage is committed.

| Source | SHA-256 | Passages read (printed pages) |
| --- | --- | --- |
| Serre 1987 | `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038` | §1.3 p. 181; §§2.8–2.9 pp. 189–192; §3.1 pp. 194–195; §3.3 p. 198; §§4.6–4.7 pp. 207–210 |
| Faltings 1983 | `0b7fb3e505d5d63e3e6c5913daf15bd843488e59f80f8d5176b154ac8faa3fc2` | §5, Satz 3–4, Korollar 1–2, pp. 360–361 |
| Carayol 1986 | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` | §§0.1–0.9, normalization, Theorem (A) and §0.8 corollary, pp. 409–411 |
| Deligne–Serre 1974 | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` | Lemme 6.11, proof and variant, p. 522 |
| Cremona 1997 | `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94` | §§2.6–2.7 and Lemma 2.7.1 pp. 24–26; §2.15.1 p. 47 |

The package links to those public sources. The cleared-library index was read;
this job needed no restricted book. Source texts, arithmetic script and logs
are disposable scratch; the evidence and reproducible mathematical cases are
recorded above. No continuation of this package job is needed. Its next step
is the independent package review, by a worker who did none of its authoring.
