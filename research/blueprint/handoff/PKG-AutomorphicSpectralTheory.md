# PKG-AutomorphicSpectralTheory — blocked checkpoint

Issue: #7893. Worker: Codex (GPT-6), session `codex-SBSm5m`, 10 October 2026.
Branch: `codex-SBSm5m-automorphic-spectral-package`.
Claim: [6093454341](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093454341).
Bot confirmation: [6093455247](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093455247).
This continues the four merged checkpoints #8173, #8191, #8202 and #8211.

## Current status and scope boundary

**Blocked checkpoint, not a completed package.** The authoritative inputs are
unchanged from #8211: their SHA-256 receipts below still match. The latest
independent acceptance is a target-level inventory pass, with all seven stages
`planned`, 52 gaps, 22 supplier requests and no closed stage. Acceptance does not
supply the seven target signatures and eight API signatures the input explicitly
omits. Their absence was freshly checked in executable declarations after stripping
nested Lean comments, rather than inferred from the previous handoff.

The blocker is a specification and ownership boundary, not an inability to prove
the proposed theorems during this run. The issue permits editing only its README,
Suggested file, metadata and handoff, and explicitly forbids changing a packet.
WORKERS requires higher-tier inputs to move down into their proper owner; the
packet and supplier contracts must change to record those moves. The local-real
induction request also specifies an extension beyond its existing supplier's
minimal-parabolic principal series. Completing the package's full interfaces
without those changes would either duplicate other owners or reinstate the
arbitrary-operator/transform assertions that the accepted review removed.

The current `AutomorphicFormsOnReductiveGroups.json` has `review.status =
needs_changes`. Its `AF.1/principal-series` treats a minimal parabolic and a
finite-dimensional inducing representation. Its `AF.1/sf-representation` defines
the representation category; it does not construct the requested holomorphic
compact-picture induction from every Levi. The precise general-Levi request in
AS still exists. Neither the current upstream operator roadmaps nor the current
Tau Ceti source search supplies the missing automorphic induction/intertwiner or
modular spatial-kernel interfaces.

The latest AS review says historical B1–B4 continuation/Fourier/test blockers
were repaired. Do not reopen them merely because older gap text or older handoff
paragraphs use their former wording. The current blocking evidence is the named
omissions and the unresolved ownership/supplier contracts listed here.

Metadata remains absent, as in the preceding checkpoints; the eventual topic is
`math.NT`. Do not infer completion from successful Lean elaboration.

## Improvement in this checkpoint

`dit_91.operatorAdjoint` now has a proof using the pinned native APIs, replacing
its admitted proof without changing its signature. For the domain-aware partial
Laplacian A and both bounded-inverse resolvent points, write
u = R_s y and v = R_conj(s) x. The native inverse equations give
Au − s(1−s)u = y and Av − conj(s)(1−conj(s))v = x. Formal self-adjointness
identifies the two resulting inner products, and bounded-adjoint extensionality
gives R_s* = R_conj(s).

This is the sign/parameter adapter to upstream **SelfAdjointSpectralTheory
SA-D20**: the native resolvent is (zI−A)⁻¹, while DIT uses (A−s(1−s))⁻¹.
Generic resolvent theory remains owned upstream. The proof invokes the existing
`dit_91.inverseEquation`, native `IsSelfAdjoint.isFormalAdjoint`,
`ContinuousLinearMap.adjoint_inner_right`, and Hilbert-space extensionality.
No opaque proposition or new generic carrier was introduced.

The README now gives this owner explicitly and distinguishes complement-inverse
analyticity from the geometric identification with a projected ambient inverse.
The latter needs a genuine reducing restriction. Operator adjointness still does
not construct a spatial kernel representative or point evaluations on L²;
`dit_91.kernelSymmetry` remains an explicit omission. DIT's continuation at an
embedded cusp eigenvalue still requires the separate weighted/test-space kernel
realization described in the preceding handoff.

A standalone Lean check of the adapter, its definition and its inverse equation
has **no errors or warnings**. `#print axioms` reports only `propext`,
`Classical.choice` and `Quot.sound`; it reports no `sorryAx`.

## Fresh validation

- Full `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  **exit 0; 804 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** Available memory before checking was 112 GB. The full
  check and subsequent isolated check were sequential. No Lean server, library
  build, cache fetch or Lake update was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  **exit 0; zero errors and warnings**, 190 nodes, 223 API items, 219 tests,
  38 planets, 32 baseline declarations, seven planned stages, 52 gaps and
  22 requests. The packet was not edited.
- Active package inventory: **183/190 target names**, **215/223 API names**,
  **219/219 packet test markers**, **232 active examples**. The new proof
  preserves every inherited declaration and specification-test comment in its
  previous package order. These counts establish inventory, not full source
  fidelity of every inherited specialization.
- The original suggested input has no `Specification test:` marker comments.
  Accordingly, marker coverage was compared to the packet's 219 test names;
  preservation in order was compared to the inherited package, not to a
  nonexistent input marker list.
- README: **199,986 UTF-8 bytes**, below 200,000; all target, API and test names
  remain represented. Intake `check-files` passes for the three changed
  deliverables; `git diff --check` is clean.
- Only the package README, package Suggested file and this handoff change.
  All reviewed inputs and other roadmaps remain untouched. No independent
  review of this worker's own work is claimed.

## Exact active-signature omissions

All names are relative to `TauCeti.AutomorphicSpectral`.

| Target signatures | Interface that must precede the full signature |
| --- | --- |
| `eisenstein_convergence`, `cuspidal_constant_term` | Rational parabolic cosets, normalized induction, coherent Haar/quotient measures, finite smooth vectors and chamber data; rational Bruhat and Weyl transport for the constant term. |
| `pseudo_eisenstein_l2`, `pseudo_eisenstein_inner_product` | Genuine pseudo-Eisenstein summation and intertwiners, contour/Fourier measures and distinct fixed-centre versus full-height quotient conventions. |
| `local_normalization` | Genuine local induced spaces, their meromorphic intertwiners and rank-one factors, with the unitary, tempered and hyperspecial clauses kept separate. |
| `real_invariant_paley_wiener`, `real_operator_paley_wiener` | General-Levi local real induction, actual Hecke/Paley–Wiener topological carriers, Clozel–Delorme's image conditions and Arthur's differentiated coefficient relations. |

The eight missing API signatures are:

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

Keep the original omission comments until these are stated on genuine supplied
carriers. An arbitrary zero intertwiner contradicts normalized unitary inversion;
an arbitrary transform need not have Paley–Wiener image; an arbitrary kernel need
not satisfy the parameter-conjugated symmetry. Adding similarly named signatures
for those arbitrary inputs would not finish the package.

## Required continuation before another packaging pass

1. Reconcile the AS plan with the scope of the finished package: provide the
   actual omitted carrier/signature contracts, and record the lower-tier
   ownership of the ordinary orbital-integral/pseudo-coefficient prefix. AS is
   tier 13, while ET is tier 14; stabilization stays with ET. The detailed
   ownership list preserved below remains the starting worklist.
2. Supply the precise AF general-Levi local-induction interface named by the
   current AS request, with its source hypotheses. A minimal-parabolic finite-W
   model or the SF category alone does not supply it.
3. Supply the rational Weyl-associate cuspidal carrier and its true orthogonality
   and density theorems for AS.1.10, rather than declaring the conditional
   Hilbert-sum assembly to be the full automorphic theorem.
4. Reconcile the actual modular continued-kernel and Whittaker continuation
   carriers with the source targets, retaining the valid initial-integral
   hypotheses and the complement spectral-gap restriction.
5. With those plan/supplier changes integrated, wire the genuine carriers into
   the package, verify every target/API/test signature, finish remaining page
   locators, check the joined Lean file, and add metadata.

Repeated package-only claims cannot resolve changes to these forbidden files.
The manager should route the specification/ownership work to a job whose
allowed deliverables include the affected contracts before rescheduling the
completion of this package. No labels or issue states were changed by hand.

## Sources and read-only upstream checks

Read the current upstream **SelfAdjointSpectralTheory** and **OperatorIdeals**
READMEs in full, and inspected their relevant Suggested declarations. The
former owns SA-D20 and the PVM/Borel/unbounded operator theory; the latter owns
the generic Schatten and Hilbert–Schmidt carriers. Read the AS reviewed library
audit, the AF minimal principal-series and SF-category statements, the exact
AS general-Levi supplier request and the tier ordering. Current Tau Ceti was
searched for the missing specialized interfaces; unrelated holomorphic
character Eisenstein series do not supply automorphic induction families.

The native proof used statements read from the shared pinned source files:
`TauCeti.Analysis.InnerProductSpace.LinearPMap.SelfAdjoint`,
`TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded`, and
`Mathlib.Analysis.InnerProductSpace.Adjoint`. The wrapper's Mathlib receipt is
`082e2d37e8`; the job baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

Duke–Imamoğlu–Tóth, *Geometric invariants for real quadratic fields*, §8,
equations (8.2)–(8.4), printed pp.973–974, was freshly read in the
[publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf).
Its operator convention and separate spatial continuation were checked;
no fresh reading of Fay or Hejhal is claimed. No book files, source passages or
private paths were copied into the repository.

## Preserved preceding checkpoint

The following record retains the earlier native repairs, exact omissions,
ownership worklist and immutable input receipts. Its validation numbers and
worker attribution belong to #8211; use the fresh results above for this pass.

### Checkpoint #8211

Issue: #7893. Worker: Codex (GPT-6), session `codex-1xGjiX`, 10 October 2026.
Branch: `codex-1xGjiX-automorphic-spectral-package`.
Claim comment: [6093184221](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093184221).
Bot confirmation: [6093185273](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093185273).
This continues merged checkpoints #8173, #8191 and #8202.

## Status and blocking condition

This is a checkpoint. The accepted input explicitly omits seven target signatures
and eight API signatures until source-qualified suppliers exist. Its recorded gap
is **Source-qualified spectral signatures after the round-3 fix review**.
Review `REV-AutomorphicSpectralTheory~2` accepts the target-level plan with those
omissions; it does not supply the missing declarations. PROTOCOL §§13 and 20
require the package's named theorem signatures, APIs and tests. The issue says:
“Change no packet; if the plan has a mistake, describe it in the handoff note.”
A source-qualified supplier/ownership revision is necessary before the full
package can satisfy both requirements. Arbitrary transforms, rings or operators
would reinstate assertions that the accepted review removed as false.

The tier conflicts below are also unresolved. Calling a missing higher-tier
supplier an input contract does not move its mathematics down or establish an
admissible prerequisite chain. Metadata remains absent so intake treats this as
a checkpoint; the eventual topic is `math.NT`.

## New repair: cuspidal Hilbert-sum assembly

The inherited `cuspidal_data_orthosum` asserted orthogonality **and** dense total
span for every family `S : Χ → Set H`, with no hypotheses on S. Taking two equal
nonzero blocks contradicts orthogonality; taking only zero generators in ℂ
contradicts density. Arthur's actual theorem concerns the particular blocks
indexed by all Weyl-associate cuspidal data with coherent quotient measures.

The signature now consumes `OrthogonalFamily` of the closed generated subspaces
and density of the span of their union. A proof establishes the totality
hypothesis of Mathlib `IsHilbertSum.mkInternal`; the conclusion is the native
`IsHilbertSum`, not an unqualified assertion about arbitrary generators.
`toHilbertSumEquiv`, `inverse_single` and `inverse_hasSum` expose the native
unitary identification with `lp` at exponent 2, inclusion of a single coordinate,
and convergence of the coordinate sum. All four declarations have proofs without
`sorry`. No new generic Hilbert-sum owner is introduced.

Three additional proved examples reject repeated nonzero blocks and zero total
generators, and assemble the single full block in ℂ. The standalone repair
compiled without errors or warnings before insertion into the joined file.
README AS.1.10 retains the full automorphic theorem, explains this conditional
assembly and gives its native prerequisite. Introductory and adjacent prose was
shortened to fit the size ceiling without removing targets, APIs or tests.

**Still required for the full AS.1.10 signature:** the genuine AF cuspidal
associate-class carrier, its pseudo-Eisenstein generators and common measures,
and the automorphic proofs of orthogonality and density. The closed-span equality
setoid in `cuspidal_datum_space.blockSetoid` is not itself Weyl association of
representations. The active name inventory must not be mistaken for delivery of
the full automorphic assertion; this declaration is a conditional assembly.

## Fresh validation

- README: **199,985 UTF-8 bytes**, below 200,000. A target-block inventory finds
  all 190 target names, all 223 API names and all 219 test names in their target
  blocks. Further additions require shortening prose, never dropping targets.
- Suggested: **183/190 active target names**, **215/223 active API names**,
  all **219 input specification-test markers**, and **232 active examples**
  (229 inherited, three added). A namespace-aware inventory removes nested
  comments, handles sections/attributes, and verifies that every inherited
  named declaration and the ordered input test markers remain. Name presence
  does not certify full source fidelity of restricted compatibility sketches.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  exit 0; zero errors/warnings; 190 nodes, 223 API items, 219 tests, seven
  planned stages, zero closed stages, 52 gaps and 22 requests.
- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  **exit 0; 805 warnings, all `declaration uses sorry`; zero errors or other
  warnings.** This checks elaboration; admitted assertions are not proved.
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Available memory was 108 GB
  before the full check. Checks ran sequentially through the shared wrapper;
  no language server or Lake build/update/cache operation was started.
- Intake `check-files` on the three changed deliverables: zero problems.
  `git diff --check`: clean. Only the README, Suggested file and this handoff
  change. The packet, reader and original suggested inputs remain unchanged.

## Sources and existing owners checked

Read upstream **SelfAdjointSpectralTheory** and **OperatorIdeals** READMEs in
full and their relevant suggested/library declarations. Current upstream main:
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both checkouts were read only.
The roadmap's reviewed library audit and the accepted AF induction interfaces
were checked; existing generic operator work remains imported rather than
planned again.

For this repair, the pinned statements read include `OrthogonalFamily`,
`IsHilbertSum.mkInternal`, `IsHilbertSum.linearIsometryEquiv`,
`IsHilbertSum.linearIsometryEquiv_symm_apply_single`,
`IsHilbertSum.hasSum_linearIsometryEquiv_symm`, and the submodule closure/density
and closed-subspace completeness results. Their modules are
`Mathlib.Analysis.InnerProductSpace.l2Space`,
`Mathlib.Analysis.InnerProductSpace.Subspace`, and
`Mathlib.Topology.Algebra.Module.Basic`.

Arthur, *An Introduction to the Trace Formula*, §12 Lemma 12.4, equation (12.4),
printed pp.64–66, was read directly in the
[Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf).
SHA-256: `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
This supplies the specific cuspidal-class decomposition and the fixed
G(𝔸)¹ variant, not a theorem about arbitrary generating sets. Repository prose
is authored; no source passages, source-by-source summary or restricted book
was copied into the repository.

## Exact omitted signatures

Names below are relative to `TauCeti.AutomorphicSpectral`.

| Target | Required interface |
| --- | --- |
| `eisenstein_convergence`, `cuspidal_constant_term` | Rational parabolic cosets, normalized adelic induction, finite smooth inducing vectors, positive chamber, Weyl transport and coherent measures; global rational Bruhat refinements for the general constant term. |
| `pseudo_eisenstein_l2`, `pseudo_eisenstein_inner_product` | Genuine cuspidal summation/intertwiners, central quotient measure, finite-dimensional Paley–Wiener sections and contour. Separate fixed-central from full-height variants and retain −overline(wλ). |
| `local_normalization` | Genuine local induction and meromorphic J_Q\|P, rank-one factors, Weyl/induction compatibility; distinct unitary, tempered and hyperspecial clauses. Arbitrary J=0 contradicts unitary inversion. |
| `real_invariant_paley_wiener`, `real_operator_paley_wiener` | General-Levi real induction, actual Hecke/Paley–Wiener topological algebras, all four Clozel–Delorme conditions and Arthur's differentiated coefficient relations. |

The eight omitted API names are:

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

`identity_quotient` is only a point-quotient model, not the general identity API.
Other omissions require the actual local integral, locally finite truncation,
finite-radius inverse transform, two-place quotient/Levi and spatial modular
kernel interfaces. Keep the input's explicit omission comments until those
objects are supplied; do not use opaque `Prop` fields to hide them.

## Ownership revisions needed before completion

AS is tier 13; AF/ALS tier 11, AL tier 12, ET tier 14; QM/ER are outside the
ordered family. The following inherited requirements remain substantive:

- Move just the ordinary orbital integral and pseudo-coefficient inputs needed
  by AS.6 down from ET.1, with exact source-qualified targets/API/tests. Do not
  move stabilization. Keep the local real Paley–Wiener/multiplier prefix separate
  from the weighted trace suffix; the proposed AS.1a stage is not integrated.
- ET.0 provides conjugacy data, not generic/tempered classical packets,
  relevance and pure inner forms. Its requested Part II has no supplying node.
- Replace QM I/J-Bessel, Kloosterman and Laplacian, and ER congruence Eisenstein
  continuation dependencies with explicit rank-one AS targets or lower-tier
  suppliers. **K already has `AL.0/bessel-k`; preserve that owner.**
- AF.1's principal series induces finite-dimensional W from a minimal parabolic.
  Its SF category does not construct holomorphic induction from every Levi.
  The requested extension needs K∩M covariance, half-modulus, finite K-types,
  holomorphic families and induction in stages. Bernstein–Krötz §9.3,
  Proposition 9.6, pp.39–40 has good-module/globalization hypotheses; do not
  assert the wider supplied-SF version from that proposition alone.
- SR explicitly excludes Plancherel and has no BDK regular trace-image theorem.
  SmoothRepresentationsCharactersPartII remains an undesigned supplier for the
  finite-component trace-image input of AS.6.
- AL.3's GL×GL factors do not provide GL×classical, exterior/symmetric-square
  or Asai factors with packet compatibility. AA reduction theory and SR's local
  geometric lemma do not supply global rational Bruhat/adelic-measure comparison.
- GN/Fuchsian Part II's quadratic-core/oriented-cycle/genus-sign input lacks an
  exact supplier node. Existing FuchsianOrbifolds cusp/polygon geometry does not
  provide it. Retain the conditional finite-cusp geometry in the DIT application.

These are specification/ownership conflicts, not requests to prove future
roadmap theorems. They require a plan revision authorized to edit the supplying
contracts, followed by packaging of their actual interfaces.

## Preserve the preceding repairs

- `SelfAdjointGraph` uses native `IsSelfAdjoint` of `LinearPMap`. The spectral
  (A−zI)⁻¹ convention is proved to be minus the native (zI−A)⁻¹ using both inverse
  equations and the native resolvent witness.
- The current-library scalar Nevanlinna existence theorem is consumed, not
  re-planned. The finite-ρ kernel and `withDensity` convention adapter still
  need uniqueness/application integration; three density checks remain.
- `dit_91` uses the actual negative partial resolvent with proved inverse and
  local analyticity APIs. A spectral-gap hypothesis on the complete complement
  is necessary. This is not continued spatial-kernel theory at an eigenvalue
  embedded in continuous spectrum; Fay/Hejhal weighted/test-space realization
  remains required for the full DIT continuation and kernel symmetry.
- Multiplier polynomial-growth transport does not replace all differentiated
  coefficient relations and the finite-radius inverse Hecke transform.
- `gz_192.guardedPairSeries` uses native `IsFundamentalDiscriminant`; retain its
  12/16 check. It does not yet construct primitive quadratic characters.
- `SpecialFunctions` constrains I/J by principal-power regularized
  hypergeometric formulas, K by AL.0's Mellin integral and Λ by native completed
  zeta. Keep the four convention checks and proved `completedZeta_not_zero`.
  `dit_113` retains y>0 and Re(ν+1/2)>0 for its initial Whittaker integral:
  DIT11 Appendix A (A.2), printed p.977. The packet's unrestricted continued-W
  target needs a genuine continued carrier and exceptional-parameter treatment.
  Removing these valid integral hypotheses would not fix that mismatch.
- Generic projection measures/Borel calculus/unbounded self-adjoint theory
  belong to SelfAdjointSpectralTheory SA-B01–SA-B36 and SA-E01–SA-E47;
  Schatten/Hilbert–Schmidt carriers belong to OperatorIdeals, including
  OI-B29–OI-B52, OI-B83/OI-B90 and OI-C01–OI-C14. Joined compatibility sketches
  must ultimately consume those structures. AS owns its measurable multiplicity,
  direct-integral and L²-kernel/complex-trace applications.

## Resume

First authorize and apply a source-qualified plan revision for the exact
omissions, ownership moves, AS.1.10 associate-class interface and `dit_113`
continuation mismatch. Then wire the genuine carriers into the joined file,
check the remaining restricted compatibility sketches, finish source page
locators where only section/equation numbers remain, and add metadata when the
complete package checklist holds. Keep the proved native adapters and new
Hilbert-sum checks. This pass does not claim a fidelity review of every other
inherited assertion.

Immutable input SHA-256 receipts:

```text
packets/AutomorphicSpectralTheory.json
c3b928e23edff50069469d0e6d6afa7dd095015d4b1d539ee044a66b24fe5e2d
readmes/AutomorphicSpectralTheory.md
7a64bbcd6818769c8b9a5922133c9839f7bda0539aa20a7541c9cd69fd768479
suggested/AutomorphicSpectralTheory.lean
4403c00620e192a1121e3891b5262c60da56511010e948ac8c36cec07e53055f
```

Scratch scripts, extracted sources and compiler logs are disposable; this note
contains the information required to resume.
