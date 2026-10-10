# PKG-AutomorphicSpectralTheory — checkpoint

Issue: #7893. Worker: Codex, session `codex-iL0y8y`, 10 October 2026.
Claim confirmed by the bot on comment 6092200867. Branch:
`codex-iL0y8y-automorphic-spectral-package`.

This is a checkpoint, not a complete package. The accepted input explicitly
omits seven target theorem signatures and eight API signatures. Some prerequisite
contracts also have no source-qualified owner at an admissible upstream tier.
The README and joined Lean draft below preserve useful work without reinstating
the arbitrary-transform/operator assertions removed by the previous review.
`metadata.toml` is deliberately absent: the intake's `deliverables_complete`
predicate otherwise treats the presence of all package outputs as completion.
The appropriate eventual category is `math.NT`.

## Files and validation

- `packages/AutomorphicSpectralTheory/README.md`: 199,891 UTF-8 bytes; all 190
  targets, 223 API names and 219 test names. Targets are grouped into AS.0–AS.6,
  with numbered internal references. Target names are relative to
  `TauCeti.AutomorphicSpectral`; API/test leaf names extend the enclosing target.
  Repeated Y/D/G conventions and library/source labels are stated once.
  Formulae, central quotients, reflected conjugate parameters, coprimality
  restrictions and the componentwise probability-Haar convention are retained.
  Proof sketches and redundant acceptance prose stay in the accepted input.
- `packages/AutomorphicSpectralTheory/Suggested.lean`: one header, one import
  block of 29 individual modules, 219 marked `example` tests. A comment-stripped
  namespace-aware inventory finds 183 of 190 target names and 215 of 223 API
  names as active declarations. The remaining names are listed below. An active
  declaration may still be a restricted compatibility model, rather than the
  full theorem in the README; the inherited comments identify these restrictions.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  0 errors, 0 warnings. The input remains a complete target-planning pass with
  seven planned stages, zero closed stages, 52 gaps and 22 requests.
- The inventory check matched each README target, every qualified API/test name,
  all 219 Lean test markers and all 219 active examples against the accepted
  input. It also checked the 200,000-byte ceiling. The inventory checker was a
  scratch utility, not a new repository deliverable.

The final executable Lean content was checked with:

```text
lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean
```

Result: exit 0; no errors; 796 warnings, all `declaration uses sorry`; no other
warnings. Available memory was 104 GB before the single check. The shared build
uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No library build, update, cache
download or language server was run. Elaboration establishes types, not the
truth of the mathematical assertions or their omitted hypotheses.

## Safe library integration completed here

The current upstream OperatorIdeals, InductionRestriction and
SelfAdjointSpectralTheory READMEs were read in full, together with their relevant
suggested declarations. Upstream main was
`d6f707516e7ede3181dac4b2420ba25c0799d22d`; the current Tau Ceti library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read only. The older
snapshot and the AUDIT-14 library report alone are insufficient for ownership.

The README now consumes the existing generic operator roadmaps:

- Projection-valued measures: SelfAdjointSpectralTheory SA-B14–SA-B33.
- Bounded normal Borel calculus: SA-B01–SA-B36. Unbounded self-adjoint spectral
  theory and partial operators: SA-E01–SA-E47. AS retains measurable
  multiplicity/direct-integral refinements and automorphic applications.
- Hilbert–Schmidt carriers and ideal theory: OperatorIdeals OI-B32–OI-B41,
  OI-B90 and OI-C01–OI-C14. The new AS interface is the general L²-kernel
  identification beyond CompactGroups' continuous compact-group kernels.
- Trace-class carriers and gauges: OI-B29–OI-B30, OI-B46–OI-B52, OI-B83.
  The scalar basis-independent operator trace and its kernel application remain
  the additions here.

There is no native projection-valued-measure or full Schatten carrier to import
at the pinned baseline. The joined file therefore labels its corresponding
models as compatibility sketches for these owners. Finishing their adapters
must consume the canonical planned structures, not create a second generic
operator roadmap.

Three concrete improvements elaborate against declarations already at the pin:

1. `SelfAdjointGraph D A` now abbreviates `IsSelfAdjoint` of the actual
   `LinearPMap` with domain D and map A. It no longer privately redefines
   self-adjointness by a graph predicate.
2. `spectral_resolvent_eq_neg_native` uses
   `TauCeti.LinearPMap.IsResolventAt` and
   `resolvent_eq_of_isResolventAt` to identify the (A−zI)⁻¹ convention with
   the negative native (zI−A)⁻¹. The witness contains the domain and both
   inverse equations. This adapter has an actual proof.
3. `gz_192.guardedPairSeries` now uses
   `TauCeti.Multiquadratic.IsFundamentalDiscriminant`. Its existing 12/16 test
   no longer receives an arbitrary predicate plus a criterion hypothesis.
   The input comment claiming that Basic.olean was unavailable is stale in the
   shared build. The raw analytic sum still does not construct primitive
   quadratic characters.

All 32 baseline declaration statements were read at the recorded pins, including
TestFunction's locally convex final topology and universal property. The native
partial-adjoint, resolvent and fundamental-discriminant statements used by the
new adapters were checked there too.

## Exact signature omissions to resolve

Names in this section are relative to `TauCeti.AutomorphicSpectral`.

| Target names | Required mathematical interface |
| --- | --- |
| `eisenstein_convergence`, `cuspidal_constant_term` | Rational parabolic cosets, normalized adelic induction, finite smooth inducing vectors, positive root chamber, coherent Weyl transport and quotient measures; rational Bruhat refinements for the general constant term. |
| `pseudo_eisenstein_l2`, `pseudo_eisenstein_inner_product` | The same actual cuspidal summation and intertwining family, central quotient measure, finite-dimensional Paley–Wiener sections and contour space. Keep the fixed-central and full-height variants separate, and retain −overline(wλ). |
| `local_normalization` | Genuine local induced representations and meromorphic J_Q\|P, rank-one factors and Weyl/induction compatibility, with separate unitary, tempered and hyperspecial clauses. J=0 is a counterexample to the discarded arbitrary-operator version. |
| `real_invariant_paley_wiener`, `real_operator_paley_wiener` | General-Levi local real induction, actual Hecke and Paley–Wiener topological algebras, all four Clozel–Delorme conditions and Arthur's differentiated coefficient relations. An arbitrary linear transform or arbitrary pair of rings cannot replace these objects. |

The joined file retains the input's explicit omission comments near these
targets. It does not hide the missing statements in `Prop` fields. The accepted
review, `REV-AutomorphicSpectralTheory~2`, accepts the corrected inventory with
these gaps; it does not supply the missing declarations. PROTOCOL §13 separately
requires that the suggested file “states the named theorems of the layers in
scope,” while allowing omission of an unavailable **condition**. Those are
different requirements. Completing this stricter package checklist needs the
actual source-qualified interfaces, rather than reinstating signatures the
review removed as false. No packet changes are authorized by this issue.

The eight API names without active declarations are:

```text
convergent_intertwiner.intertwines
convergent_intertwiner.identity
convergent_intertwiner.holomorphic_chamber
local_intertwiner.meromorphic_coefficients
arthur_truncation.local_finite
spectral_multiplier.support
weighted_orbital_integral.splitting
dit_91.kernelSymmetry
```

The point-quotient `identity_quotient` model is present but is not the general
`identity` API. The local-integral, truncation, multiplier-radius, two-place
quotient/Levi and actual modular-resolvent-kernel contracts supply the other
omissions. This list counts declarations, not mere occurrences in comments.

## Ownership and tier work still required

AS is tier 13; AF/ALS are tier 11 and AL is tier 12. ET is tier 14, and QM/ER
are outside the ordered family. The accepted input still contains upward edges.
The draft does not cite them as suppliers: it calls them mathematical input
contracts. **This is not a completed move-down.** Replace each contract by an
actual source-qualified target here, with its API/tests, and point the later
consumer at that target. Do not treat the wording substitution as closure.

- ET.1's unweighted orbital integral and pseudo-coefficient prerequisites must
  precede the weighted AS.6 suffix. Extract just the needed ordinary orbital and
  coefficient interfaces; do not move stabilization or the whole ET roadmap.
  Keep the local real Paley–Wiener/multiplier prefix independent of this suffix.
  The proposed AS.1a restructuring has not been integrated as an atlas stage.
- ET.0 is conjugacy data, not the classical packet theory demanded by AS.2.
  The input requests generic/tempered packets, relevance and pure inner forms
  as Part II, with no existing supplying node. Its necessary inputs cannot
  silently be cited from ET.0 or supplied by an arbitrary representation set.
- Replace QM's I/J-Bessel, Kloosterman and Laplacian dependencies, and ER's
  congruence Eisenstein continuation, by explicit rank-one AS definitions or
  genuine lower-tier suppliers. The K-Bessel dependency **does** already have
  the lower-tier `AL.0/bessel-k` definition and API; do not invent another K
  owner or repeat the stale request claiming that no K node exists.
- AF.1's existing principal series uses a minimal parabolic with finite-
  dimensional inducing W. AF.1's separate SF representation definition does
  not itself construct holomorphic induction from every Levi. The exact
  extension requested in the input fixes K∩M covariance, half-modulus,
  finite-K-type coefficient spaces, holomorphic parameters and induction in
  stages. Bernstein–Krötz §9.3, Proposition 9.6, pp.39–40 is the stated route
  with its good-module/globalization hypotheses; wider supplied-SF generality
  must remain distinguished from that theorem.
- Current SR has Bernstein components and normalized induction, but explicitly
  excludes Plancherel theory. Its README/Suggested file does not supply the BDK
  trace-image theorem. The proposed SmoothRepresentationsCharactersPartII has
  no designed stage/node. AS.6 almost-compact/invariant trace inputs need this
  precise finite-component regular trace-image supplier.
- AL.3 supplies GL×GL factors, not all GL×classical, exterior/symmetric-square
  and Asai factors with packet compatibility. Current AA's reduction theory
  and local SR geometric lemma likewise do not supply the global rational
  Bruhat/adelic-measure comparison needed by the constant-term calculation.
- The GN/Fuchsian Part II quadratic-core, oriented-cycle and genus-sign route
  lacks an exact supplier node. Current FuchsianOrbifolds has cusp and polygon
  geometry, not that quadratic-core construction. Retain the conditional
  finite-cusp-geometry distinction in the DIT application.

These are specification/ownership issues, not demands to implement future
proofs. The other inherited analytic proof gaps (Hejhal/Fay, higher residual
strata, analytic Fredholm, Franke–Schwermer) remain in the immutable input;
this package checkpoint does not reopen their source jobs. Resolve the genuine
interface and tier conflicts first, then assemble the complete package and
add metadata. Do not remove valid restrictions merely to make its inventory
look complete.

## Sources and immutable inputs

Results and definitions are expressed in authored prose; no source passage or
paper-by-paper summary was added. No restricted book was copied or used.
Fresh public downloads matched the input's SHA-256 receipts:

| Source | SHA-256 |
| --- | --- |
| Yetter, arXiv math/0309185 | `a3b59a3b059e2d10c55abdd688415c1e20d23e0a536cf9afd09950a5fbae6bf3` |
| Teschl, author second-edition PDF | `8dc8de0b58aa0a3fedfe594a345f9b5875322e5526ea581cb640a98d55b82818` |
| Arthur 2005, Clay PDF | `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510` |
| BPCZ 2022, journal PDF | `a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794` |

Selected statements read afresh include Yetter Definitions 1–2, pp.2–3;
Teschl Theorems 0.23/0.26, pp.22–23, 3.7, p.96, 3.17, p.105, and 3.20,
p.107; Arthur Theorem 7.2, p.35, and Lemmas 12.2–12.4, p.65; BPCZ
Appendix A.0.1–A.0.6, pp.326–329. The README corrects the input's Teschl
§0.4 locator to §§0.4–0.5 and adds selected verified page ranges. Some inherited
locators still give only a section/equation: finish the page audit before
calling this an upstream-ready README. Source labels S1–S30 identify the
bibliography; they are not source-issue ids such as the historical S2.

The packet, reader and suggested inputs were unchanged from origin/main:

```text
packets/AutomorphicSpectralTheory.json
c3b928e23edff50069469d0e6d6afa7dd095015d4b1d539ee044a66b24fe5e2d
readmes/AutomorphicSpectralTheory.md
7a64bbcd6818769c8b9a5922133c9839f7bda0539aa20a7541c9cd69fd768479
suggested/AutomorphicSpectralTheory.lean
4403c00620e192a1121e3891b5262c60da56511010e948ac8c36cec07e53055f
```

Resume from the two package files and the exact omissions/ownership list above.
The README has only 109 bytes to spare below its ceiling; further interface
targets will require shortening repeated prose, never dropping targets or
tests. The scratch utilities, source downloads and compile log are disposable;
everything needed to resume is recorded here.
