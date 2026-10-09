# PKG-EllipticCurveModularity — checkpoint

Agent: Codex. Session: `codex-ZSEmbF`. Date: 2026-10-09.
Issue: #7469. Branch: `codex-ZSEmbF-elliptic-curve-modularity-package`.
Claim confirmed by the bot on
[the session's claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/7469#issuecomment-6072178649).

**The package is not complete: full Lean elaboration is blocked by the shared
build.** The README and unified Suggested file are authored. The metadata is
deliberately absent from this checkpoint: `issues.deliverables_complete`
currently treats a package as complete when every output exists, without
examining its compilation result or this note. Create metadata only after the
full suggested file passes at both pinned commits. Its entire content is:

```toml
topic = "math.NT"
```

No plan, original reader, original suggested file, queue, audit, link map or
other job's deliverable was changed. No library was built, copied or replaced.

## Work completed

Read WORKERS, both protocols and UPSTREAM_GUIDE. Read the upstream
ConformalMapping and RepresentationTheory/SemisimpleAlgebras READMEs in full,
and the ModularForms opening for area-specific conventions. Read the accepted
EllipticCurveModularity plan and reader, its proposed signatures, relevant
cross-roadmap links and the related reviewed audit rows for R28.6,
ModularForms Layers 5 and 8g, and RankZeroOneBSD BSD.0. The audit has no direct
EllipticCurveModularity layer row; the related rows confirm the boundaries
preserved in the package.

The README is approximately 79 KB and 10,750 words, with six layers in order.
It contains all 23 targets, all 23 API items and all 19 named tests. It gives
definitions, hypotheses, source theorem/section/page locators, exact imported
contracts and their roadmap IDs. It has no process narrative or source
excerpts. The major conventions retained are the prime-to-p residual
conductor, arithmetic Frobenius on homological Tate modules, inertia
coinvariants for Euler polynomials, trivial character, J₀ versus J₁ quotients,
and arbitrary geometric level N′ versus the elliptic conductor N.

Suggested.lean joins the single accepted suggested file, removes its reader
path reference from the opening note, keeps the original declaration names
and individual imports, and adds the 19 required `example` statements beside
the named test assertions. All example signatures were checked for exact
agreement with the corresponding named assertion, including named arguments
and local `haveI` assignments. Imported objects remain explicitly owned typed
stand-ins, not invented Prop-valued fields. No newform type was substituted
for `HeckeRing.GL2.Newform`.

## Target correspondence

The short IDs below follow `EllipticCurveModularity:` in the accepted plan.

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

## Validation and compilation blocker

* `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularity.json`:
  **0 errors, 0 warnings**. The unchanged accepted plan reports 23 nodes,
  23 API items, 19 tests, 11 requests, two gaps and six planned stages. Its
  `partial` status is not a claim of mathematical closure.
* Name/signature screen: all 23 API names and 19 test names appear in both
  the README and Suggested file; all 19 direct examples match the named
  assertions, all six layers occur once, and imports are unique.
* Independent arithmetic checks passed for c₄ and Δ of 11a1, 26b1,
  274a1, 162b1, the CM curve and 37a1; traces at 2 and 3 used in the
  examples; the -1 twist trace relation at every odd prime through 43
  except 11; and exact orders 5 and 7 of the displayed points on 11a1
  and 26b1, using rational Weierstrass addition.
* A Mathlib-only fragment ran through `lean-check` with exit 0,
  **0 errors and 41 warnings, all `declaration uses sorry`**. It contained
  the actual convention definitions through the rational cyclic-subgroup
  predicate, the imported elliptic conductor/residual/Tate interfaces,
  all of R29.1 and its seven direct examples, the root-of-unity and norm
  assertions, and the rational Tate-image span signature. Newform-dependent
  definitions and assertions were excluded, with no replacement newform.
  This validates only that independent fragment.
* `lean-check research/blueprint/packages/EllipticCurveModularity/Suggested.lean`
  stops at its import block with exit 1. Diagnostic, with the machine path
  removed: `Suggested.lean:24:0: error: object file of module
  TauCeti.NumberTheory.ModularForms.Newforms.Newform does not exist`.
  The full file has **not elaborated**; newform-dependent signatures are
  not certified by the fragment check.

The default shared build is TauCeti-adic. Its Mathlib checkout is the
required `082e2d37e8b0463410cdb532e111cd43d5a66174`, but the required
`Newform.olean` is absent. Its Tau Ceti checkout HEAD was
`cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required
`f790474821cf4256814db967cb154e7af3d0c369`; source statements were read
at the required commit with `git show`. Existing alternative shared builds
that contain the object use different Mathlib commits (including
`dc4b8d60d5` and `f6090c7095`). They cannot establish the required baseline
check. Available memory was 111 GB before the runs. No Lean language server
or background compile remains running.

## Preserved plan boundaries and gaps

1. End_ℚ(E) = ℤ belongs to FaltingsFinitenessAndIsogenyTheorems R28.6.
   The accepted plan explicitly discloses that its supplier has no node
   for this statement and its rank-one Hom node points back to R29.1.
   The README imports the exact contract from R28.6; it does not silently
   turn that circular attribution into an established prerequisite.
2. The numerical Mazur bound is an unread refinement in the original
   plan. The qualitative exceptional-set finiteness uses the R28.6
   finite-isogeny-class and rank-one Hom route. No claim concerning the
   sharp constant 163 was added.
3. Serre p. 207 states the conductor criterion for p > 5. The accepted
   signature is for p ≥ 5. The README distinguishes the local argument
   extending it to 5, where finite additive inertia has order prime to 5,
   from the source's statement. The existence proof uses only p ≥ 7.
4. Cross-level prime-agreement strong multiplicity one remains an import
   from ModularForms Layer 5. The existing fixed-level theorem compares
   all good indices outside a finite set and cannot supply that contract.
5. The exhaustive J₀(N′) old/new decomposition, with multiplicity
   σ₀(N′/M) and all Galois orbits, remains the precise R14.5 supplier
   contract. The J₁ quotient and a single orbit's comparison cannot
   replace it. The modularQuotient₀ and quotient-map declaration names
   remain proposed stand-ins as in the accepted suggested file.
6. The real multiplication application is specified in the README with
   K_X = ℚ ⊗ End_ℚ(X) a totally real field of degree dim X. Its existing
   suggested-file comment is retained: the abelian-variety and conductor
   interfaces needed to type Theorem 5 are absent. Following PROTOCOL
   section 13, the unstated condition is not replaced by a fake Prop.
   The accepted target records the companion's scope, not an elliptic
   proof of its additional compatible-system assertions.

All 11 external requests of the accepted plan are retained as contracts in
the README. This package neither resolves their ownership nor claims that
any mathematical result is formalized.

## Sources checked in this run

Fresh public downloads on 2026-10-09 matched the recorded SHA-256 values:

| Source | SHA-256 | Passages read |
| --- | --- | --- |
| Serre 1987 | `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038` | §§1.3, 2.8–2.9, 3.1 lifting, 3.3, 4.6–4.7; pp. 181, 189–192, 194–195, 198, 207–209 |
| Faltings 1983 | `0b7fb3e505d5d63e3e6c5913daf15bd843488e59f80f8d5176b154ac8faa3fc2` | §5, Satz 3–4 and Korollar 1–2, pp. 360–361 |
| Carayol 1986 | `d4a5fb6b1cd76f944f8948e06df1c7ad5656ae5ee14b9189178ee1e8f2b0dab8` | §§0.1–0.9, especially normalization, Theorem (A), and §0.8, pp. 409–411 |
| Deligne–Serre 1974 | `65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc` | Lemme 6.11, proof and variant, p. 522 |
| Cremona 1997 | `432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94` | §§2.6–2.7, pp. 24–26; §2.15.1, p. 47 |

The README links directly to those public sources. No PDF or source passage
is committed. Each baseline reference was checked in its source at the pinned
commit, especially the Newform record and the exact fixed-level
strong-multiplicity-one hypotheses. The library index of cleared private
sources was read; this job required none of them.

## Next worker

The remaining task is full elaboration in an existing shared build containing
the required Tau Ceti modules at both recorded commits. The maintainer must
provide that build; workers may not build libraries, replace Newform, use a
different baseline, or start a Lean language server. Once it is available,
run `lean-check research/blueprint/packages/EllipticCurveModularity/Suggested.lean`,
fix any errors on this job's deliverable, require only sorry warnings, and
record the actual result. Then create metadata.toml with the exact line at
the start of this note and update the handoff as a completed package.

The roadmap is authored; retain its 23 targets and the accepted plan's
boundaries while fixing signatures. Scratch sources and logs are disposable;
the source identities, observed diagnostic, validation extent, missing file
and precise continuation steps are all recorded here.
