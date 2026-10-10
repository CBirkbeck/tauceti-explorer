# PKG-AutomorphicSpectralTheory — blocked checkpoint

Issue: #7893. Worker: Codex (GPT-6), session `codex-qnGs7I`, 10 October 2026.
Branch: `codex-qnGs7I-automorphic-spectral-package`.
Claim: [6094096625](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6094096625).
Bot confirmation: [6094097592](https://github.com/CBirkbeck/tauceti-explorer/issues/7893#issuecomment-6094097592).
This continues the merged checkpoints through #8238. Only the package README,
Suggested file and this handoff change.

## Status and reason completion is blocked

This is a checkpoint. The authoritative packet, reader and original suggested
input remain unchanged. Review `REV-AutomorphicSpectralTheory~2` accepted the
**target inventory**, with 190 targets, 223 API items, 219 tests, 52 gaps and
22 supplier requests. All seven stages are planned; none is closed. That verdict
does not validate an unrestricted Lean prototype or supply its omitted carriers.

[PROTOCOL §§13 and 20](../PROTOCOL.md) require genuine theorem signatures,
APIs and tests for the package. The issue says: “Change no packet; if the plan
has a mistake, describe it in the handoff note.” Several required interfaces
need specification and ownership changes outside the allowed deliverables:

- AS is tier 13; ET is tier 14. Ordinary orbital-integral and pseudo-coefficient
  inputs used in AS.6 must have a lower-tier owner. Stabilization stays in ET.
  Treating the higher-tier result as an input does not repair this dependency.
- AF's actual reviewed principal-series supplier is minimal-parabolic with
  finite-dimensional inducing W. Its generic SF category does not construct the
  requested general-Levi compact-picture induced family, including K∩M
  covariance, half-modulus, finite K-types, holomorphy and induction in stages.
- The full rational-coset, local-normalization, real Paley–Wiener and modular
  spatial-kernel interfaces listed below still lack the source-qualified
  supplier contracts needed by the package.

This pass additionally found ten AS.6 prototypes whose comments mentioned
necessary source hypotheses but whose signatures did not encode them. Some
specializations asserted 1=0. They are removed, with explicit omission comments,
instead of being passed to implementation as universal theorems. There are now
**13 omitted target signatures and 12 omitted API signatures**; the full
mathematical targets remain in the README. Further inherited universal
prototypes are identified below and still require correction.

Metadata remains absent intentionally. `issues.py:deliverables_complete` regards
a package as complete once all output paths exist; adding `metadata.toml` here
would incorrectly send this incomplete package to review. Add
`topic = "math.NT"` only after the full checklist holds. The historical B1–B4
continuation/Fourier blockers were resolved earlier; do not reopen them.

## New repair: AS.6 source hypotheses cannot live only in comments

All names below are relative to `TauCeti.AutomorphicSpectral`. Each former
signature is replaced by a comment naming the actual missing mathematical
objects. The README keeps the full source theorem, rather than weakening its
mathematics to the numerical compatibility model.

| Removed signature | Why its former universal statement fails; required interface |
| --- | --- |
| `automorphic_kernel.operator` | An identity map cannot be represented by an independently chosen zero kernel. Supply the actual arithmetic quotient, measures, right convolution and smooth test domain. |
| `coarse_truncated_kernel.decomposition` | Zero class summands cannot have an independent total 1. Construct both class kernels from the same test and supply absolute integrated convergence. |
| `coarse_truncated_kernel.levi_translation` | An arbitrary constant J=1, with zero shifted/cone functions, contradicts the identity. Supply rational Levi constant terms and Γ′ cone integrals. |
| `coarse_trace_identity` | Independent singleton geometric/spectral totals 0 and 1 differ. Use one test, coherent class-integral families and sufficiently regular truncation. |
| `gm_family.regularized_sum` | A one-member constant family with arbitrary denominator θ(z)=z has a pole at 0. Supply actual relative coroots, covolumes, parabolic adjacency and θ coherence. |
| `gm_splitting` | Independent productValue=1 and zero partial functions give 1=0. Supply partial families, prime transforms, Levi restrictions and determinant coefficients. |
| `fine_geometric_expansion` | Independent total=1 and zero coefficients/integrals contradict the formula. Supply arithmetic coefficients, (M,S)-classes, weighted distributions and the common test. |
| `fine_spectral_expansion` | Zero integrands cannot sum to an independent total 1; arbitrary integrands need not be integrable. Supply the discrete inducing spectrum, normalized weighted characters and the common Hecke test. |
| `invariant_trace_formula` | A zero geometric sequence cannot stabilize at an independent I=1. Supply invariantized distributions, common test/coefficient data and the spectral tail estimates. |
| `compact_trace_specialization` | On a scalar Hilbert space, a zero operator and a unit diagonal kernel have different traces; an infinite-dimensional identity is not trace class. Supply the actual compact quotient and convolution kernel/operator pair. |

Five new Lean counterexamples prove the identity/zero-kernel mismatch, the
zero-sum/nonzero-total mismatch, unequal singleton trace totals, false independent
splitting and false stabilization. They contain no admissions. They reject the
former signatures, not the arithmetic source theorems.

## New compatible two-chamber product calculation

`gm_family.product` now proves both fields: native `AnalyticOnNhd.mul` proves
analyticity, and the two wall equalities prove wall compatibility. Its former
construction used admissions for those fields.

`gm_family.rank_one_product` proves, for two analytic chambers with θ±(z)=±z,
common wall values c₀,d₀ and the existing regularized zero values,

```text
(cd)_M = c_M d₀ + c₀ d_M.
```

The proof applies the inherited `rank_one` zero-value theorem, the native
derivative product rule and the two wall equalities. It does not assert the full
Levi splitting formula or introduce partial-family/determinant carriers.

The new `affineFamily b a₊ a₋` has members b+a±z and wall value b; its analytic
and wall fields are proved. `affineFamily_zeroValue` derives a₊−a₋. Five proved
positive examples check the general coefficient, equal-slope zero, coefficient
2 from slopes 3,1, normalized product addition, and an unnormalized product:
wall values 2,5 and slopes (3,1),(7,4) give 2·5+2·3=16. In particular, multiplying
regularized values alone would give 6 and is not the product rule.

The isolated `#print axioms` check reports only `propext`, `Classical.choice`
and `Quot.sound` for `product` and `affineFamily`. The product-value theorem
**does depend on `sorryAx`**, through the inherited admitted rank-one theorem
and zero-value carrier. Its new proof body has no admission; this does not prove
the inherited principal-value construction or the full Arthur theorem.

README AS.6.7 retains the coroot/covolume denominator and full smooth real
parameter-space statement. AS.6.8 adds the compatible two-chamber calculation
and checks, with printed page numbers. Introductory prose was shortened to
stay under 200,000 bytes without removing targets, API names or test names.

## Fresh validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  exit 0, zero errors/warnings; 190 targets (36 definitions, 37 constructions,
  117 theorems), 223 API items, 219 tests, 38 planets, 32 baseline declarations,
  52 gaps, 22 requests, seven planned stages and zero closed stages.
- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  **exit 0; 790 warnings, all `declaration uses sorry`; zero errors and zero
  other warnings.** The inherited #8238 receipt was 801 such warnings. Removing
  ten declarations and proving the product fields accounts for the decrease;
  elaborating remaining admitted assertions does not establish their validity.
  The only subsequent Lean-file edit was to its introductory comment.
- The standalone adapter/counterexample check passed with eight inherited
  `sorry` warnings and no errors or other warnings. The joined check started
  after it finished. Available memory was 97 GB before the joined check. Both
  used the shared wrapper at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
  and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; no language server,
  build/update/cache operation or compilation in the read-only upstream ran.
- A namespace-aware inventory stripping nested Lean comments finds
  **177/190 active target names**, **211/223 active API names**, all **219
  specification-test markers** in their inherited order and **245 active
  examples** (235 inherited, ten added). Ten named declarations were removed
  and three were added, exactly those described above. Presence alone does
  not certify the remaining restricted sketches.
- README: **190 target blocks, 199,976 UTF-8 bytes**. Every input target,
  API name and test name remains in its own target block.
- Intake `check-files`: three changed deliverables, zero problems.
  `git diff --check` is clean. No files outside the issue deliverables change.
- The packet, reader and original suggested input retain the hashes at the
  end of this note. Supplier contracts and read-only checkouts are unchanged.

## Exact active-signature omissions

Names are relative to `TauCeti.AutomorphicSpectral`.

| Target signatures | Required supplied interface |
| --- | --- |
| `eisenstein_convergence`, `cuspidal_constant_term` | Rational parabolic cosets, normalized adelic induction, coherent Haar/quotient measures, finite smooth vectors, positive chamber, rational Bruhat indexing and Weyl transport. |
| `pseudo_eisenstein_l2`, `pseudo_eisenstein_inner_product` | Genuine cuspidal summation and intertwiners, contour/Fourier measures, finite-dimensional Paley–Wiener sections and separate fixed-centre versus full-height quotient conventions. Retain −overline(wλ). |
| `local_normalization` | Genuine local induced spaces and meromorphic intertwiners, rank-one factors and Weyl/induction compatibility; keep unitary, tempered and hyperspecial clauses separate. |
| `real_invariant_paley_wiener`, `real_operator_paley_wiener` | General-Levi real induction, actual Hecke/Paley–Wiener topological carriers, all four Clozel–Delorme image conditions and Arthur's differentiated coefficient relations. |
| `coarse_trace_identity`, `gm_splitting`, `fine_geometric_expansion`, `fine_spectral_expansion`, `invariant_trace_formula`, `compact_trace_specialization` | The AS.6 source-qualified carriers and coherence listed in the new-repair table. |

The twelve omitted API signatures are:

```text
convergent_intertwiner.intertwines
convergent_intertwiner.identity
convergent_intertwiner.holomorphic_chamber
local_intertwiner.meromorphic_coefficients
arthur_truncation.local_finite
spectral_multiplier.support
automorphic_kernel.operator
coarse_truncated_kernel.decomposition
coarse_truncated_kernel.levi_translation
gm_family.regularized_sum
weighted_orbital_integral.splitting
dit_91.kernelSymmetry
```

`identity_quotient` remains only the point-quotient model. Other omissions require
an actual local integral, locally finite truncation, finite-radius inverse
transform, two-place quotient/Levi and spatial modular-kernel interfaces. Keep
omission comments until genuine carriers are supplied; do not hide the missing
mathematics in opaque `Prop` fields or assume the desired conclusion.

## Remaining inherited signatures require correction

This pass did not validate every inherited assertion. In particular, the following
still quantify over unrelated inputs while essential source conditions occur only
in comments; do not treat their current types as faithful implementation targets:

- AS.5: `franke_graded_isomorphism`, `weighted_finite_character_acyclic`,
  `constant_term_resolution`, `franke_comparison`, `gl_sl_cuspidal_diagram` and
  `franke_schwermer_support`. Arbitrary modules need not be isomorphic, arbitrary
  complexes need not be acyclic, and arbitrary dimensions need not satisfy the
  parity formula. Genuine AF/ALS source carriers and comparison maps are needed.
- Function-field AS.6: `yu_025`, `yu_038.continueInT`, `yu_050`, `yu_051`,
  `yu_052`, `yu_054` and `yu_055`. The last four still contain independent
  numerical values, and `yu_050` treats an arbitrary function as having a
  removable singularity. The complex-torus, root-family, kernel and degree
  carriers must be integrated and all hypotheses encoded in the signatures.

These are unfinished packaging obligations, not newly accepted theorems or a
claim that all other inherited types are sound. The existing five numerical
counterexamples also explain why analogous unrestricted total-value templates
cannot be retained in the function-field suffix.

## Preserve the Eisenstein adapters from #8238

The inherited `eisenstein_series` is a numerical weighted `tsum` over any
`r : J → G` and `InductionData`. Its three API signatures previously asserted
linearity, automorphy and right equivariance without the necessary hypotheses.
A comment about the intended chamber did not restrict those signatures.

The preceding checkpoint proved three conditional numerical adapters:

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
`Classical.choice` and `Quot.sound`, with no `sorryAx`. All three adapter
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

README AS.1.2 retains the full source theorem and the original three named
specification tests, explains the adapter hypotheses and adds the three checks.
Its locator now identifies Arthur §7 equation (7.1), printed p.33, and
Lemma 7.1, printed p.34. Introductory prose was shortened to stay within the
200,000-byte ceiling without dropping targets, APIs or test names.

**Still needed:** the actual rational coset carrier, representative covariance,
normalized inducing action and chamber theorem supplying these hypotheses.
The numerical adapters do not construct those suppliers.

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

Fresh source checks used Arthur, *An Introduction to the Trace Formula*, in the
[Clay PDF](https://www.claymath.org/library/cw/arthur/pdf/62.pdf):
§17 definition and Lemma 17.1, pp.93–94; Lemmas 17.4–17.6 and equations
(17.8), (17.12)–(17.14), pp.97–101; §14 Theorem 14.1, pp.74–77; §16
(16.1), pp.88–89; §19 Corollary 19.3 and (19.10), p.115; §21 Theorem 21.6
and Corollary 21.7, pp.137–138, including Remarks 3–4; §23 Theorem 23.4
and (23.11)–(23.13), pp.151–153; §1 (1.2), p.8, and §16 (16.1)″, p.90.
The downloaded public PDF's SHA-256 was
`2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510`.
The fine spectral omission preserves the a_M^L determinant correction recorded
in the authoritative packet's sourceIssues; it does not add a new source-errata
job or assume joint absolute convergence in all spectral variables.

Read the native pinned statements `AnalyticOnNhd.mul` in
`Mathlib.Analysis.Analytic.Constructions` and `deriv_fun_mul`/`deriv_mul` in
`Mathlib.Analysis.Calculus.Deriv.Mul`. The proof uses the lambda-form rule
`deriv_fun_mul` and supplies differentiability from analyticity for each member.

Read the current upstream CompactGroups and OperatorIdeals READMEs in full,
the OperatorTheory overview and relevant operator-ideal signatures. Read the
AS library audit, AF principal-series/SF-category suppliers, AS general-Levi
request and tier ordering. Current upstream receipt:
`8c72a04753b11cab07fa593cc38ceaa7c0515380`; current Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The read-only library's
continuous intertwiners and classical holomorphic Eisenstein construction do
not supply the requested general adelic family.

The preceding checkpoints' source provenance remains: Arthur §7 (7.1), p.33,
Lemma 7.1, p.34; §12 Lemma 12.4/(12.4), pp.64–66; DIT §8 (8.2)–(8.4),
pp.973–974, and Appendix A (A.2), p.977. Their native Hilbert-sum, sum-reindexing,
resolvent, adjoint and Nevanlinna repairs are retained above. Those are inherited
source readings, not fresh readings of this pass. No fresh reading of Franke,
Yu, Fay or Hejhal is claimed. The maintainer's library index was read; no
restricted book was needed. Repository mathematics is in our own words; no
source passage, section-by-section source summary, restricted file or private
path was copied into it.

## Resume

First authorize and integrate source-qualified plan/supplier revisions for the
ownership moves, the omitted interfaces, AS.1.10's associate-class carrier and
`dit_113`'s continuation mismatch. A further package-only job cannot change
those authoritative contracts. Then encode all genuine hypotheses, including
the AS.5 and function-field signatures flagged above, before claiming a complete
package. Keep the proved native adapters and counterexamples. Finish remaining
page locators, rerun the joined Lean check, and add metadata only after every
package requirement holds. The numerical rank-one adapter is useful validation,
not a substitute for general-Levi family regularization/descent.

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
