# PKG-AutomorphicSpectralTheory — checkpoint

Issue: #7893. Current worker: Codex, session `codex-0rbj0G`, 10 October 2026.
Claim confirmed by the bot on comment 6093015843. Branch:
`codex-0rbj0G-automorphic-spectral-package`.

## Current pass: normalized special-function consumers

This remains a checkpoint. Seven target signatures and eight API signatures
are still absent, as enumerated below; the accepted plan has supplier and tier
conflicts that this issue forbids us to edit. No metadata was added: intake
would otherwise recognize all three package files as a complete deliverable.
The category remains `math.NT` when the package can actually be completed.
This pass fixes a separate concrete defect in the existing prototype and
preserves the earlier native resolvent/Nevanlinna work.

1. `SpecialFunctions` previously contained four arbitrary functions, despite
   its comment claiming they were the actual supplier functions. Its comparison
   theorems could therefore assert Bessel and completed-zeta identities for
   a wrong normalization, or even a constant-zero supplier. It now requires
   explicit defining equations: I/J use QM.2's principal-power regularized
   hypergeometric formulas; K uses the existing AL.0 Mellin integral; completed
   zeta agrees with Mathlib's `completedRiemannZeta`. These are mathematical
   equality contracts, not unspecified proposition fields or a second general
   special-function library. The adapter still needs wiring to the owners when
   their modules are available; it does not settle QM's upstream tier conflict.
2. Four checks cover completed-zeta reflection, I at order/argument zero,
   positive-argument J at order 1/2, and positive-argument K at order 1/2.
   Reflection has a proof from native `completedRiemannZeta_one_sub`; the three
   Bessel checks have admitted proofs. The additional proved theorem
   `SpecialFunctions.completedZeta_not_zero` uses the native residue at 1
   to exclude the zero adapter. Reflection alone would not exclude zero.
3. `dit_113` now assumes y>0 and Re(ν+1/2)>0. The existing `whittakerW`
   is the initial convergent integral, not its meromorphic continuation.
   DIT11 Appendix A, (A.2), printed p.977 imposes
   Re(ν±μ+1/2)>0; at μ=0 this is exactly the new restriction. At ν=−1/2
   the zero-endpoint integrand has a nonintegrable power, so the totalized
   integral cannot stand in for continued W. The README distinguishes the
   initial comparison from continuation and exceptional-parameter limits.
   **Plan-owner action:** the accepted packet's unrestricted `dit_113` target
   must be reconciled with a genuine continued-W carrier. Do not remove the
   hypothesis from this integral-based prototype to reproduce that target.
4. Repeated introductory wording was shortened to retain every named target
   while fitting the README ceiling. All inherited active named declarations
   and all input test markers remain; this was checked against the base commit.

## Current validation and source receipts

- README: 199,979 UTF-8 bytes, below the 200,000-byte ceiling with 21 bytes
  spare. It still names all 190 targets; additions will require shortening
  prose rather than discarding targets, APIs or tests.
- Suggested file: 183/190 target declarations and 215/223 API declarations;
  all 219 input specification-test markers; 229 active examples (225 inherited,
  four added). Counts use a namespace-aware inventory after removing nested
  comments and recognizing declaration attributes. Name presence alone does
  not establish fidelity to the full mathematical contract.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  exit 0, zero errors and warnings; 190 nodes, 223 API items, 219 tests,
  seven planned stages, zero closed stages, 52 gaps, 22 requests. No plan input
  was edited.
- Intake `check-files` on the three changed deliverables: zero problems.
  `git diff --check`: clean. Only the two package files and this handoff changed.
- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  exit 0; 806 warnings, all `declaration uses sorry`; zero errors or other
  warnings. Memory exceeded 20 GB before each check; elaborations ran
  sequentially in the shared pinned build. Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No Lake build/update/cache
  command or language server was started. Admitted assertions are not proved.

Read the pinned `RegularizedHypergeometric.lean` definition and the completed
zeta reflection/residue statements, and the actual QM.2 I/J and AL.0 K
suggested definitions. Public normalization locators:
[DLMF 10.2.2](https://dlmf.nist.gov/10.2.E2),
[10.25.2](https://dlmf.nist.gov/10.25.E2),
[10.32.10](https://dlmf.nist.gov/10.32.E10).
DIT11 Appendix A's initial-integral conditions and Bessel comparisons were
read directly at printed p.977 from the
[Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf).
SHA-256: `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`.
No source passages or restricted books were copied into the repository.

Current upstream roadmap checkout:
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. They were read only.
The nearby InductionRestriction and OperatorIdeals documents were read;
AF.1's accepted principal-series and SF-representation nodes were checked,
with SR's smooth-induction prototype. AF's principal series still induces
finite-dimensional data from a minimal parabolic. An SF category declaration
and SR's algebraic-coinduction smooth-vector construction do not provide the
required holomorphic general-Levi real family for the two Paley–Wiener
signatures. The recorded AS/ET upward tier conflict likewise remains.

## Resume here

Arrange an authorized plan revision covering the exact seven target/eight API
omissions and ownership moves in the preserved handoff below. Also reconcile
`dit_113` with continued W and its exceptional parameters. Then consume the
actual supplier carriers in the joined prototype, check every remaining
compatibility sketch against its source, finish the locator/page audit, and
add metadata only when the complete package requirements hold. This pass
checks the special-function consumer contract; it does not claim a fidelity
review of every other inherited prototype. Keep the new normalization checks
and the actual native zeta/resolvent proofs.

## Preserved handoff from the preceding checkpoint

The remainder records the preceding worker's work and validation, not new
checks performed by this worker. Its inventory and warning totals are
superseded by the current totals above; its omission/ownership list remains
applicable.

Issue: #7893. Preceding worker: Codex, session `codex-BHt5mH`, 10 October 2026.
Claim confirmed by the bot on comment 6092652810. Branch:
`codex-BHt5mH-automorphic-spectral-package`.
This continues the merged `codex-iL0y8y` checkpoint (PR #8173).

This is a checkpoint, not a complete package. The accepted input explicitly
omits seven target theorem signatures and eight API signatures. Some prerequisite
contracts also have no source-qualified owner at an admissible upstream tier.
The issue makes the accepted packet immutable: “if the plan has a mistake,
describe it in the handoff note.” Finishing the seven signatures and the
source-qualified ownership moves below requires changes to that plan, rather
than a packaging-only claim of closure. This is the blocking condition for this
run. The new work integrates actual library results and corrects the resolvent
adapter; it does not reinstate arbitrary-transform/operator assertions.
`metadata.toml` is deliberately absent: the intake's `deliverables_complete`
predicate otherwise treats the presence of all package outputs as completion.
The appropriate eventual category is `math.NT`.

## Files and validation

- `packages/AutomorphicSpectralTheory/README.md`: 199,834 UTF-8 bytes; all 190
  targets, 223 API names and 219 test names. Targets are grouped into AS.0–AS.6,
  with numbered internal references. Target names are relative to
  `TauCeti.AutomorphicSpectral`; API/test leaf names extend the enclosing target.
  Y/D/G are now standing assumptions for every corresponding target/test; their
  repeated one-line restatements were removed to make room for the adapters.
  Formulae, central quotients, reflected conjugate parameters, coprimality
  restrictions and the componentwise probability-Haar convention are retained.
  Proof sketches and redundant acceptance prose stay in the accepted input.
- `packages/AutomorphicSpectralTheory/Suggested.lean`: one header, one import
  block of 30 individual modules, 219 marked input tests and 225 `example`s
  (six additional convention/growth examples). A comment-stripped
  namespace-aware inventory finds 183 of 190 target names and 215 of 223 API
  names as active declarations. The remaining names are listed below. An active
  declaration may still be a restricted compatibility model, rather than the
  full theorem in the README; the inherited comments identify these restrictions.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  0 errors, 0 warnings. The input remains a complete target-planning pass with
  seven planned stages, zero closed stages, 52 gaps and 22 requests.
- The inventory check matched each README target, every qualified API/test name,
  all 219 Lean test markers and their corresponding active examples against
  the accepted input; the six new examples are identified separately. It also
  checked the 200,000-byte ceiling. The inventory checker was a scratch utility,
  not a new repository deliverable.

The final executable Lean content was checked with:

```text
lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean
```

Result: exit 0; no errors; 803 warnings, all `declaration uses sorry`; no other
warnings. Available memory was 105 GB before the final check; all elaborations
ran sequentially. The shared build
uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No library build, update, cache
download or language server was run. Elaboration establishes types, not the
truth of the mathematical assertions or their omitted hypotheses.

## Library and source integration in this run

1. **Scalar Herglotz existence is already current library work.** At Tau Ceti
   `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`,
   `Analysis/Complex/Pick/Nevanlinna.lean:438` proves
   `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`: a differentiable F
   on the upper half-plane with nonnegative imaginary part has
   F(z)=bz+∫(1+tz)/(t−z)dρ(t)+Re F(i), with finite positive ρ and b≥0.
   Its proof consumes the disk Herglotz representation, already in
   `Analysis/Complex/Herglotz.lean`. Both files were read; no proof of existence
   should be planned a second time. The Nevanlinna file is absent at the pinned
   Tau Ceti commit, so importing it into this pinned prototype would fail.
   AS.0.6 now consumes the current theorem and plans the convention adapter
   dν=(1+t²)dρ, uniqueness, the resolvent asymptotic and polarization.
   `herglotz_representation.weightedMeasure` is an actual `Measure.withDensity`
   definition; `weighted_mass` and `integral_conversion` state its needed API.
   The integral on the finite-ρ side is written out to elaborate at the old pin.
   Three new examples use ρ=0 and ρ=δ₂, detecting density 5 versus 1 or 1/5.
   These are prototypes with admitted proofs, not a claimed verified adapter.
   The input's positive-Poisson proof gap is stale for current scalar existence;
   its remaining uniqueness/application requirements should be separated.

2. **The modular inverse now uses the native partial resolvent.** `dit_91` is
   defined as `-TauCeti.LinearPMap.resolvent` at s(1−s); it has no admitted
   construction. `inverseEquation` assumes membership in the native bounded-
   inverse resolvent set, replacing bare algebraic bijectivity, and has an actual
   proof from `resolvent_mem_domain` and `smul_sub_apply_resolvent`.
   `operatorAdjoint` states the reflected-conjugate identity for a genuinely
   self-adjoint partial Laplacian at both resolvent points. This operator API
   does not supply the omitted spatial `kernelSymmetry` signature.

3. **The old complement theorem was false for its stated inputs.** An arbitrary
   finite-dimensional orthogonal projection P does not remove the spectrum.
   Even P=0 on a scalar zero Laplacian at s₀=0 satisfies the old projection
   hypotheses, while the off-spectrum scalar family −1/[s(1−s)] cannot be
   holomorphic there. The repaired `restrictedResolvent` takes an actual
   complete complement C, its partial Laplacian, and the spectral-gap
   hypothesis s₀(1−s₀)∈resolventSet(Δ_C). Its proof uses the pinned native
   `isOpen_resolventSet` and `analyticAt_resolvent`, composed with s(1−s).
   **This is not the full DIT continuation API.** DIT's positive cusp eigenvalues
   can be embedded in continuous spectrum. Removing their finite-dimensional
   eigenspace does not give a bounded L² inverse at the same spectral value.
   The continued spatial kernel and its finite-rank subtraction need their
   proper weighted/test-space realization. README AS.2.18 and the Lean comment
   explicitly keep this separate. DIT §8 (8.2)–(8.4), printed pp.973–974, was
   read afresh; (8.3) cites Fay Theorem 3.1, p.173, and continuation cites Hejhal.
   Neither the native lemma nor a `Prop` field establishes that analytic input.

4. **Arthur's support estimate requires both growth and relations.** Read Acta
   III §4, printed pp.84–87. `PaleyWienerBound.mul_of_polynomialGrowth` now gives
   the scalar seminorm step: distribution order d is absorbed using input
   seminorm n+d, and exponential radii add. The three new examples use a central
   polynomial, exp(as), and zero. This does not fill `spectral_multiplier.support`:
   all differentiated coefficient relations (III.4.1), actual finite-K-type
   operator families and the finite-radius inverse Hecke transform are still
   needed. The README describes the distinction in authored prose.

The new native resolvent declarations were read at Tau Ceti's pinned commit,
including the full `Resolvent/Analytic.lean`. Current InductionRestriction and
OperatorIdeals READMEs were read in full; the three operator-roadmap folders
below have no changes between the prior recorded upstream commit and current
`dea8191cc6047d6142a65872ebce6eeeb841a29b`. Current library and roadmap checkouts
were read only; no Lake command ran there.

Fresh Arthur Acta 1983 PDF, fetched from
<https://www.claymath.org/library/cw/arthur/pdf/15.pdf>, SHA-256:
`a78240ce1095e2a17591bf829fa726675ca865e77e8c3d663823d3dcf4fb8034`.
This differs from older source receipts; the locator above refers to this
inspected PDF's printed pagination. DIT was read from the public Annals PDF
linked in bibliography S21. No restricted source was copied or used this run.

## Groundwork preserved from PR #8173

The prior worker read the upstream OperatorIdeals, InductionRestriction and
SelfAdjointSpectralTheory READMEs in full, together with their relevant
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

The prior checkpoint's three concrete improvements elaborate at the pin:

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

The prior handoff records all 32 baseline declaration statements read at the pins, including
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
The previous worker's public downloads matched the input's SHA-256 receipts:

| Source | SHA-256 |
| --- | --- |
| Yetter, arXiv math/0309185 | `a3b59a3b059e2d10c55abdd688415c1e20d23e0a536cf9afd09950a5fbae6bf3` |
| Teschl, author second-edition PDF | `8dc8de0b58aa0a3fedfe594a345f9b5875322e5526ea581cb640a98d55b82818` |
| Arthur 2005, Clay PDF | `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510` |
| BPCZ 2022, journal PDF | `a07a6143d3e71f1eca31b6ba9b774bec325a7de07c7417b7796486a77df13794` |

The previous worker's selected statements included Yetter Definitions 1–2, pp.2–3;
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
Before adding metadata, arrange an authorized revision of the seven omitted
signatures and the supplier moves; reconcile the DIT continued-kernel interface
with its embedded-spectrum setting. Consume current Nevanlinna existence and
retain the two genuinely proved native resolvent adapters. Keep the six new
convention/growth examples when reconciling the revised plan.
The README has only 166 bytes to spare below its ceiling; further interface
targets will require shortening repeated prose, never dropping targets or
tests. The scratch utilities, source downloads and compile log are disposable;
everything needed to resume is recorded here.
