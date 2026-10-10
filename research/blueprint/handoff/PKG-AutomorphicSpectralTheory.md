# PKG-AutomorphicSpectralTheory — blocked checkpoint

Issue: #7893. Worker: Codex (GPT-6), session `codex-H2kYpP`, 10 October 2026.
Branch: `codex-H2kYpP-automorphic-spectral-package`.
Claim: [6093805437](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093805437).
Bot confirmation: [6093806570](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6093806570).
This continues the merged checkpoints through #8223, including #8211's
Hilbert-sum repair. Only the package README, Suggested file and this note change.

## Status and reason completion is blocked

This is a checkpoint, not a completed package. The authoritative inputs are
unchanged from #8223. Review `REV-AutomorphicSpectralTheory~2` accepts a
**target-level inventory**: seven planned stages, zero closed stages, 190 nodes,
223 API items and 219 tests, with 52 gaps and 22 supplier requests. Acceptance
has not supplied the seven explicitly omitted target signatures or eight omitted
API signatures listed below.

PROTOCOL §§13 and 20 require the package's theorem signatures, APIs and tests.
The issue explicitly says: “Change no packet; if the plan has a mistake,
describe it in the handoff note.” Completing the genuine source-qualified
interfaces and resolving their ownership requires edits outside this issue's
allowed deliverables. Reintroducing assertions about arbitrary operators,
transforms or kernels would reinstate the false prototypes removed by the
accepted review. A zero local intertwiner cannot satisfy normalized unitary
inversion; a generic transform need not have the Paley–Wiener image; a generic
kernel need not have the spatial parameter-conjugation symmetry.

The AS-to-ET prerequisite conflict also persists: AS is tier 13, ET tier 14.
The ordinary orbital-integral/pseudo-coefficient inputs must acquire a lower-tier
owner; stabilization stays with ET. Calling the absent higher-tier result an
input contract does not resolve the dependency. The exact general-Levi local
induction requested from AF is also absent: minimal-parabolic induction of a
finite-dimensional W and an SF category do not construct that family.

The historical B1–B4 continuation/Fourier blockers were resolved in the earlier
revision; do not reopen them. The blockers here are the recorded full-carrier,
source and ownership obligations. Metadata remains absent; add
`topic = "math.NT"` only when the complete package checklist holds.

## New repair: truthful Eisenstein sum APIs

The inherited `eisenstein_series` is a numerical weighted `tsum` over any
`r : J → G` and `InductionData`. Its three API signatures previously asserted
linearity, automorphy and right equivariance without the necessary hypotheses.
A comment about the intended chamber did not restrict those signatures.

The package now proves three conditional numerical adapters:

- `eisenstein_series.linear` requires summability of the two vector summands.
  It uses native `Summable.mul_left`, `Summable.tsum_add` and `tsum_mul_left`.
  The totalized `tsum` cannot justify unrestricted linearity for divergent sums.
- `eisenstein_series.automorphic` requires an equivalence `e : J ≃ J` and the
  translated height/evaluation equalities for the reindexed representatives.
  The proof uses `Equiv.tsum_eq`. The genuine rational-coset interface must
  supply these equalities for rational translations.
- `eisenstein_series.right_equivariant` requires the pointwise weighted
  translation identity for the normalized inducing action. The proof uses
  `tsum_congr` and associativity. This proves the adapter; `induced_family`
  itself remains a provisional construction.

No opaque proposition or new generic owner is introduced. The standalone
`#print axioms` checks for `linear` and `automorphic` list only `propext`,
`Classical.choice` and `Quot.sound`, with no `sorryAx`. All three new adapter
proof bodies and all three added examples contain no admissions; this does not
certify the admitted induction construction or the full automorphic theorem.

The proved examples distinguish the complete-coset use from an arbitrary list:

1. On the multiplicative presentation of ℤ, use height/rho zero, scalar vector
   1 and evaluation φ(n)=n. A representative list consisting only of the identity
   has value 0 at the identity and 1 after translation by the additive integer 1.
   This is a concrete counterexample to the former universal automorphy API.
2. On the multiplicative presentation of ℤ/2ℤ, use the scalar vector v and
   evaluation v at the identity, zero elsewhere. Summing both representatives
   gives v before and after the nonidentity translation.
3. The same full two-element orbit satisfies the new automorphy API using the
   swap equivalence, with both covariance hypotheses proved.

README AS.1.2 preserves the full source theorem and the original three named
specification tests, explains the adapter hypotheses and adds the three checks.
Its locator now identifies Arthur §7 equation (7.1), printed p.33, and
Lemma 7.1, printed p.34. Introductory prose was shortened to stay within the
200,000-byte ceiling without dropping targets, APIs or test names.

**Still needed:** the actual rational coset carrier, representative covariance,
normalized inducing action and chamber theorem supplying these hypotheses.
The numerical adapters do not construct those suppliers.

## Fresh validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  exit 0, zero errors/warnings; 190 nodes (36 definitions, 37 constructions,
  117 theorems), 223 API items, 219 tests, 38 planets, 32 baseline declarations,
  52 gaps, 22 requests, seven planned stages and zero closed stages.
- Final `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  **exit 0; 801 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** The inherited file compiled with 804 such warnings before
  this repair. Elaborating admitted roadmap assertions is not proving them.
- The standalone repair also elaborated with zero errors or other warnings;
  its one `sorry` warning belonged to its isolated provisional induction
  construction. The joined check ran only after that check finished.
- Available memory was 107 GB before the final joined check. All checks used
  the shared wrapper sequentially at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. No language server, Lake
  build/update/cache operation or build in the read-only upstream was started.
- A namespace-aware active inventory, removing nested Lean comments, finds
  **183/190 target names**, **215/223 API names**, all **219 specification-test
  markers**, and **235 active examples** (232 inherited, three added).
  All 798 inherited named declarations and all ordered inherited markers remain.
  The missing names are exactly the lists below. Name presence alone does not
  establish the source fidelity of a restricted compatibility sketch.
- The README has **190 target blocks** and **199,993 UTF-8 bytes**. Every input
  target, API name and test name occurs in its corresponding target block.
  Further additions require shortening prose, not dropping targets.
- Intake `check-files` passes on the three changed deliverables;
  `git diff --check` is clean. The packet, reader, original suggested input,
  supplier contracts and read-only checkouts are unchanged.

## Exact active-signature omissions

Names are relative to `TauCeti.AutomorphicSpectral`.

| Target signatures | Required supplied interface |
| --- | --- |
| `eisenstein_convergence`, `cuspidal_constant_term` | Rational parabolic cosets, normalized adelic induction, coherent Haar/quotient measures, finite smooth vectors, positive chamber, rational Bruhat indexing and Weyl transport. |
| `pseudo_eisenstein_l2`, `pseudo_eisenstein_inner_product` | Genuine cuspidal summation and intertwiners, contour/Fourier measures, finite-dimensional Paley–Wiener sections and separate fixed-centre versus full-height quotient conventions. Retain −overline(wλ). |
| `local_normalization` | Genuine local induced spaces and meromorphic intertwiners, rank-one factors and Weyl/induction compatibility; keep unitary, tempered and hyperspecial clauses separate. |
| `real_invariant_paley_wiener`, `real_operator_paley_wiener` | General-Levi real induction, actual Hecke/Paley–Wiener topological carriers, all four Clozel–Delorme image conditions and Arthur's differentiated coefficient relations. |

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

`identity_quotient` remains only the point-quotient model. Other omissions require
an actual local integral, locally finite truncation, finite-radius inverse
transform, two-place quotient/Levi and spatial modular-kernel interfaces. Keep
these omission comments until genuine carriers are supplied; do not conceal
missing data in opaque `Prop` fields.

## Ownership and supplier worklist retained from preceding checkpoints

AS is tier 13; AF/ALS tier 11, AL tier 12, ET tier 14. QM/ER are outside the
ordered family. The preceding handoff's substantive continuation requirements
are retained here without its duplicated chronological records:

1. Move the ordinary orbital integral and pseudo-coefficient inputs used by
   AS.6 down from ET.1, with exact source-qualified targets, APIs and tests;
   keep stabilization in ET. Separate the early real Paley–Wiener/multiplier
   prefix from the weighted trace suffix. The proposed AS.1a prefix is not
   integrated.
2. ET.0 conjugacy data do not supply general/tempered classical packets,
   relevance or pure inner forms. The requested Part II has no supplying node.
3. Replace QM I/J-Bessel, Kloosterman and Laplacian and ER congruence Eisenstein
   continuation dependencies with rank-one AS targets or lower-tier suppliers.
   **K already belongs to `AL.0/bessel-k`; preserve that owner.**
4. Supply AF's general-Levi real compact-picture induction: K∩M covariance,
   half-modulus, finite K-types, holomorphic families and induction in stages.
   Bernstein–Krötz §9.3, Proposition 9.6, pp.39–40 has good-module/globalization
   hypotheses; the preceding source check did not establish the broader
   supplied-SF version from that proposition. AF's current reviewed supplier
   remains narrower than the AS request.
5. SR excludes Plancherel and supplies no BDK regular trace-image theorem.
   SmoothRepresentationsCharactersPartII remains an undesigned supplier for
   AS.6's finite-component trace-image input.
6. AL.3 GL×GL factors do not supply GL×classical, exterior/symmetric-square or
   Asai factors with packet compatibility. AA reduction theory and SR's local
   geometric lemma do not supply global rational Bruhat/adelic-measure comparison.
7. GN/Fuchsian Part II's quadratic-core/oriented-cycle/genus-sign input lacks
   an exact supplier node; cusp/polygon geometry does not supply it. Retain
   conditional finite-cusp geometry in the DIT application.
8. AS.1.10 needs the actual rational Weyl-associate cuspidal carrier, its
   pseudo-Eisenstein generators and common measures, and the source proofs of
   orthogonality and density. Equality of closed generated spans is not itself
   Weyl association of representations.
9. Reconcile the spatial modular resolvent and continued Whittaker carriers
   with the full source targets, retaining valid initial-integral hypotheses
   and the complement spectral-gap restriction.

These are specification/ownership revisions, not requests to prove future
roadmap theorems. A package-only continuation cannot edit their authoritative
contracts. Route this work to a job authorized to edit the affected plan and
supplier contracts before rescheduling completion of this package.

## Preserve the preceding native repairs

- `cuspidal_data_orthosum` consumes an `OrthogonalFamily` of closed generated
  subspaces and density of the span of their union. The proved adapter uses
  native `IsHilbertSum.mkInternal`; `toHilbertSumEquiv`, `inverse_single` and
  `inverse_hasSum` expose the native unitary `lp` identification and summation.
  Its three proved tests reject repeated nonzero blocks and zero total
  generators and assemble the single full block in ℂ. This conditional
  Hilbert-sum construction is not the full automorphic decomposition theorem.
- `SelfAdjointGraph` uses native `IsSelfAdjoint` of `LinearPMap`. The spectral
  (A−zI)⁻¹ convention is proved to be minus native (zI−A)⁻¹ using both inverse
  equations and the native witness. `dit_91` has proved inverse, local analytic
  and `operatorAdjoint` adapters. Keep the spectral gap on the complete
  complement; an eigenvalue embedded in continuous spectrum requires the
  separate spatial weighted/test-space kernel continuation and symmetry.
- The current-library scalar Nevanlinna existence theorem is consumed, not
  planned again. The finite-ρ kernel/`withDensity` convention adapter still
  needs uniqueness/application integration; its density tests remain.
- Polynomial-growth multiplier transport does not supply all differentiated
  coefficient relations or the finite-radius inverse Hecke transform.
- `gz_192.guardedPairSeries` uses native `IsFundamentalDiscriminant`, retaining
  the 12/16 check; primitive quadratic characters remain to be constructed.
- `SpecialFunctions` constrains I/J by principal-power regularized
  hypergeometric formulas, K by AL.0's Mellin integral and Λ by native completed
  zeta. Keep its convention checks and proved `completedZeta_not_zero`.
  `dit_113` retains y>0 and Re(ν+1/2)>0 for the initial Whittaker integral,
  DIT11 Appendix A (A.2), printed p.977. The unrestricted continuation target
  needs a genuinely continued carrier and exceptional-parameter treatment.
- Generic PVM/Borel/unbounded self-adjoint theory belongs to
  SelfAdjointSpectralTheory SA-B01–SA-B36 and SA-E01–SA-E47; generic
  Schatten/Hilbert–Schmidt theory belongs to OperatorIdeals, including
  OI-B29–OI-B52, OI-B83/OI-B90 and OI-C01–OI-C14. Joined compatibility sketches
  ultimately consume those structures. AS owns measurable multiplicities,
  direct-integral and L²-kernel/complex-trace applications.

## Sources, upstream and pinned-library checks

Freshly read Arthur, *An Introduction to the Trace Formula*, §7 equation (7.1),
printed p.33, and Lemma 7.1, printed p.34, in the
[Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf).
The source uses the full rational parabolic coset space, finite discrete inducing
vectors and the positive chamber; the generic numerical sum alone has none of
those restrictions. Repository prose is authored; no source passage or
section-by-section source summary was copied.

Read current upstream **OperatorTheory** and **RepresentationTheory/CompactGroups**
READMEs in full; inspected the relevant SelfAdjointSpectralTheory and
OperatorIdeals owner declarations. Read the AS reviewed library audit, the AF
principal-series and SF-category statements, the AS general-Levi request and the
tier ordering. Current upstream receipt:
`8c72a04753b11cab07fa593cc38ceaa7c0515380`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both checkouts were read only.
Current Tau Ceti's continuous intertwiner and holomorphic weighted Eisenstein
interfaces were inspected; they do not supply general adelic induction families.

The native sum declarations used in this repair were read at the pinned source
in `Mathlib.Topology.Algebra.InfiniteSum.Basic` and
`Mathlib.Topology.Algebra.InfiniteSum.Ring`: `Equiv.tsum_eq`,
`Summable.tsum_add`, `Summable.mul_left`, and `tsum_mul_left`.
The preceding checkpoints read native Hilbert-sum/resolvent/adjoint declarations
and Arthur §12 Lemma 12.4/equation (12.4), pp.64–66, and DIT §8 equations
(8.2)–(8.4), pp.973–974. Those are preserved provenance, not fresh source readings
of this pass. No fresh reading of Fay or Hejhal is claimed. No restricted book,
source passage or private path was copied into the repository.

## Resume

First integrate source-qualified plan/supplier revisions for the exact omissions,
the ownership moves, the AS.1.10 associate-class interface and `dit_113`
continuation mismatch. Then wire their genuine carriers into the joined file,
check remaining restricted compatibility sketches, finish page locators that
still only name sections/equations and add metadata when the whole checklist
holds. Keep the proved native adapters and all counterexample tests. This pass
has not independently reviewed every inherited assertion for source fidelity.

Immutable authoritative-input SHA-256 receipts, verified unchanged this pass:

```text
packets/AutomorphicSpectralTheory.json
c3b928e23edff50069469d0e6d6afa7dd095015d4b1d539ee044a66b24fe5e2d
readmes/AutomorphicSpectralTheory.md
7a64bbcd6818769c8b9a5922133c9839f7bda0539aa20a7541c9cd69fd768479
suggested/AutomorphicSpectralTheory.lean
4403c00620e192a1121e3891b5262c60da56511010e948ac8c36cec07e53055f
```

Disposable scratch scripts and logs are not continuation inputs; all information
needed to resume is recorded here.
