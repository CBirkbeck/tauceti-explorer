# PKG-AutomorphicSpectralTheory~2 — completed revision

Issue: #9673. Worker: Codex, session `codex-2GgfPg`. Date: 2026-10-14.
The claim was confirmed by the bot in issue comment 6166181731.
This is a complete package submission, not a checkpoint. The next step is independent
package review. No mathematics is claimed to have been formalised.

## Deliverables and review findings

- Rewrote the README in the upstream form: Summary, scope, conventions, exact supplier
  contracts, build order, seven numbered layers, prose targets and named APIs, Checks,
  and Examples and Dependencies at the end of every layer. Removed atlas target labels,
  baseline/source bookkeeping keys, slugs, field lists and process commentary.
- Preserved the accepted packet's 190 targets, 223 API items and 219 checks, subject to
  the explicit supplier deferrals below. The original package had five additional
  moved-down sections. Its 195 sections become 195: the projection-measure section
  moves into the supplier contract and the general-group Franke weight target is added.
  Added checks and APIs for the light analytic definitions and corrected several
  checks that previously depended on artificial Lean fixtures.
- Wrote Suggested.lean afresh in the required shape. It has 403 lines, 15 light
  real-bodied definitions, 27 theorems and 30 examples. It imports Mathlib and uses
  native measures, normed spaces, hypergeometric functions, the upper half-plane,
  SL₂ and congruence subgroups. There are no surrogate adelic/cohomology carriers,
  sorry'd data definitions or instances, auxiliary theory developments or hidden
  assumptions containing the conclusions. All declared names occur in the README.
- Retained metadata.toml unchanged: `topic = "math.NT"`.
- Left review.json unchanged. It still records the previous independent review's
  needs_changes verdict; replacing it belongs to the next reviewer.

## Ownership and current-library audit

Read the current OperatorTheory/SelfAdjointSpectralTheory and OperatorIdeals roadmaps
in full and their relevant suggested signatures. Checked current Tau Ceti by object
as well as by name. The read-only checkouts were TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build ran there.

- Original AS.0.5's projection-valued measure, scalarMeasure, intersection and Borel
  integral contracts, including all three checks, are now supplied by
  SelfAdjointSpectralTheory Part B. Its unbounded calculus is Part E. Sections 0.6
  and 0.7 retain only measurable-multiplicity multiplication models, not another
  construction of the spectral measure or functional calculus.
- Original AS.0.9's generic Hilbert–Schmidt norm and ideal bounds, and AS.0.10's
  generic trace-class carrier and Hilbert–Schmidt product bound, are supplied by
  OperatorIdeals B29–B30, B32–B41, B46–B52, B83 and B90/C01–C14. The additions
  retained here are measurable L² kernels, their exact norm, the complex trace and
  the representative-sensitive product-kernel diagonal formula. The original
  `norm_basis`, `ideal_bound` and `mul_hs` contracts remain named in the introduction.
- Mathlib already has `Ideal.primaryComponent V J` for arbitrary ideals, not only
  prime ideals. It uses one power J^n annihilating the whole vector. Membership,
  maps and kernel exactness are `Ideal.primaryComponent_mem`, `.map` and
  `.map_ker_eq`; their checks are in the supplier contract. Section 5.3 adds
  stability under the Harish-Chandra and full compact-group actions and the
  derived finite-character comparison. No duplicate primary-component carrier
  survives in Lean. This corrects the accepted plan's library-status assumption;
  the packet was not edited.
- Current Tau Ceti's finite-measure Nevanlinna theorem is beyond the signature pin.
  Its ownership is acknowledged. Section 0.5 adds the density conversion,
  subtracted-kernel uniqueness and resolvent specialization. Suggested.lean states
  these using the explicit kernel and native Measure, without importing the newer API.
- ALS.F.5/F.6 replace the old AF automorphic-form, constant-term, cusp-form and
  relative-cochain references. The union of weighted growth spaces is supplied by
  ALS.5b.3; Section 5.2 retains fixed-weight regularization. The remaining real
  representation and restricted tensor-factorization contracts cite AF Layers 1–2.
- Bessel K stays with AL Layer 0's Bessel transforms (`AL0.BesselK.integral`, `.even`,
  `.entire_order`, `.half`). Only J and I are defined here. The current holomorphic
  weighted Eisenstein series in Tau Ceti are different from this package's
  nonholomorphic primitive-pair families.

## FrankeInput and source corrections

Section 5.14 states the general reductive-group proper-support eigensystem target,
including neat level, irreducible algebraic V_λ, J=Ann(V_λ∨), the ζ_V split-central
twist, 𝔪_G=𝔤/𝔞_G, full K_∞ and the balanced finite-adelic Hecke action. Together
with Sections 5.10 and 5.12 it discharges all three clauses of ALS.5b.4's
`LocallySymmetric.FrankeInput`; that interface is not assumed in its proof.

The source chain is Franke §6 Theorem 14, p.236 and §7.4 (1)–(4), p.256;
Mundy §2.1 (2.1.1), Theorems 2.1.1 and 2.1.4, pp.14–18 and §2.2 Theorem 2.2.3,
pp.22–24; and the imported Kostant theorem. The proof route uses the refined
filtration and its spectral sequence, residual induction in stages, and
σ=δ_P^(1/2)π to pass from normalized to unnormalized induction. The infinitesimal
character representative becomes −w(λ+ρ)+ρ_P, that of the dual Kostant weight.
Franke §7.6 Theorem 20, p.261 is scoped to GLₙ. ACC+23 §2.4.9, pp.949–953 was
read from the maintainer-cleared author copy; it corroborates the GLₙ conversion
and unitary application rather than supplying a general-G theorem. No cleared
file or extracted passage was copied.

Other corrections and qualifications:

- Analytic Fredholm continuation now has a direct source: Dyatlov–Zworski author
  version 1.0 (2022), Appendix C §C.3, Definitions C.6–C.7 and Theorem C.8,
  pp.521–523. An invertible point and norm holomorphy remain explicit.
- BPCZ22 locators use printed pp.326–333, with the exact completeness, nuclear LF,
  barrelledness and common-denominator qualifications. Its pointwise Hom topology
  is distinguished from the new bounded-set meromorphic operator extension.
- Added full references for Chaudouard's author preprint and Lafforgue 1997.
  Lafforgue's title is *Chtoucas de Drinfeld et conjecture de Ramanujan–Petersson*.
- Chaudouard Corollary 5.2.2, preprint p.30 requires deg D>2g−2. It does not
  directly give the canonical-divisor case. Section 6.24 now separates
  `canonical_higgs_mass`, with the invariant-flag/cone-cancellation proof target,
  from scalar-nilpotent vanishing and the Fourier identity. Yu Appendix B p.79
  states the resulting canonical counting relation. Added rank-one normalization
  and noncoprime controls. The accepted packet's unqualified attribution needs
  the same correction if it is subsequently maintained; it was not edited here.
- The sine-power factor 2^(ν−1) and reciprocal-gamma interpretation are retained.
  The zero-frequency, effective-group and induction-normalization protections
  from the accepted plan are preserved.

## Section and moved-down target map

- Layer 0: original 0.5 is in the supplier contract; original 0.6–0.25 become
  0.5–0.24. Original 0.25a becomes 0.25. Original 0.26 onward is unchanged.
- Layer 1: original 1.15a becomes 1.16; original 1.16–1.29 become 1.17–1.30.
- Layer 2: original 2.6a becomes 2.7; original 2.7–2.24 become 2.8–2.25.
- Layers 3–4 are unchanged. Layer 5 adds 5.14 after the unchanged 5.1–5.13.
- Layer 6: original 6.8a becomes 6.9, 6.9–6.16 become 6.10–6.17, 6.16a
  becomes 6.18, and 6.17–6.38 become 6.19–6.40.

The five moves already made by the first packager remain owned here: J/I (0.25),
Kloosterman/Laplacian (1.16), generic packets (2.7), orbital integrals (6.9), and
discrete functional realization/pseudo-coefficients (6.18). Higher roadmaps should
import these, rather than reconstructing them. The old `kloosterman_symm` API is
named `kloosterman_sum_symm` to agree with Suggested.lean. All original checks
survive after removal of their old test labels; changed wording fixes fixture
dependence, supplier ownership or the explicit added hypotheses.

## Source spot-checks

These checks read the actual statements, not only search results. Results are
stated here in our own words; the source text belongs to the source.

| Package target | Source inspected | Result |
|---|---|---|
| 0.1 | Yetter, Definition 1, pp.2–3 | Measurability, saturation and the countable fundamental sequence agree. |
| 0.2 | Yetter, Definition 26 and Theorem 27, pp.13–14 | Null quotient and direct-integral completeness agree. |
| 0.26 | DIT11 Appendix A (A.1)–(A.2), p.977 | Initial integrals and M/W normalizations agree. |
| 0.28 | DIT11 Appendix A (A.3)–(A.5), p.977 | ODE signs and initial asymptotic constants agree. |
| 0.29 | DIT16 Appendix A, p.984 | Retained the corrected missing power of two. |
| 0.30 | DIT16 Lemma 7 (9.4), p.980 and (A.1), p.983 | Both signs agree with the corrected normalization. |
| 0.35 | Gross–Zagier II §2 (2.5)–(2.6), p.238 | Integral and hypergeometric Q branch agree. |
| 0.39–0.41 | Gross–Zagier IV §3 (3.2)–(3.3), p.277 | Strict convergence threshold, gamma value and nonzero-frequency continuation agree. |
| 1.4 | Arthur05 Lemma 7.1, p.34 | Initial intertwining convergence agrees. |
| 2.4 | Arthur05 Theorem 7.2(a), p.35 | Global continuation and functional equations agree. |
| 4.3 | Arthur05 Theorem 7.2(b), p.35 | Onto completeness is separate from the packet isometry. |
| 4.10 | Wallach Theorem 4.3, pp.233–234 | Square-integrable tempered data are cuspidal under the stated hypotheses. |
| 6.1 | Arthur83PW III Theorem 4.1, pp.84–85 | Paley–Wiener image and support control agree. |
| 6.22 | Yu22 Theorem 3.3.1, p.18 | Quasi-polynomial continuation uses sufficiently regular lattice points. |
| 5.7/5.14 | Franke Theorem 14, p.236 and §7.4, p.256 | Filtration and cohomological spectral sequence supply the derived target. |

Also read the BPCZ appendix, Mundy's general-group induced-cohomology calculation,
Chaudouard's relevant counting results, and the direct Fredholm source. Replaced
loose locators for the modular formulas, Langlands66, measurable kernels, isobaric
sums and the fine trace distributions with section/equation/theorem and printed
page numbers. DLMF is cited by its stable equation identifiers rather than a
nonexistent printed pagination.

## Adversarial and mechanical validation

| Statements and interfaces | Instances / controls | Outcome |
|---|---|---|
| Measure, direct-integral and operator contracts | Zero fibres, null changes, two atoms, finite identity, unbounded multiplier, nonsummable diagonal | Retained their discriminating checks; no algebraic inverse stands for a bounded inverse. |
| Strip order and common denominator | Zero/constant, exp(z²), exp(exp(−iz)), pole and essential singularity | Three controls per predicate; ball contained in its open domain and one denominator for the full vector. |
| Herglotz and positive powers | Zero measure, δ₂→5δ₂, F(z)=z, positive square root, x=0 excluded | Correct density, resolvent sign and domain. |
| Bessel and Whittaker | Half orders, negative integer orders, elementary M, vanishing growing coefficient, W symmetry | Separate J/I and M/W checks; strict Euler domain retained. |
| Whittaker cycle and sine integral | Three nonintegral parameter triples, both signs; four sine-integral pairs including (2,0) | Correct power-of-two and gamma constants. |
| Q and V | Four Q integral/hypergeometric pairs; seven V_s(0) pairs, including negative s for k=2 | Integral ranges and continuation separated; all comparisons passed. |
| Modular normalization | Moduli 1–7, primes 2,3,5,7; constant and y² Laplacian; k=1/2 gauge; N=0 raw pair sum | Distinct Kloosterman/Laplacian check lists; positive-level restriction explicit. |
| Cuspidal support | P=G, anisotropic group, GL₂ trivial coefficient, q=2,3,5,7 Hecke values | ρ shift, dual and half-modulus are all observable in the controls. |
| Function-field counts and finite covers | Rank one at genera 0,1,2; q=2,3,5,7; noncoprime rank two; disconnected cycle groups | Stabilizer factors and finite components retained; canonical boundary is a separate target. |
| Finite-character functor | Zero ideal, unit ideal, zero module, size-two nilpotent Jordan operator | Native ideal-power semantics; no per-generator replacement. |

The independent numerical calculations used 40-digit quadrature/hypergeometric
evaluation and finite sums. All 72 instances passed; the largest relative error
was approximately 4.01×10⁻¹⁶ (finite sums evaluated with ordinary complex floats).
They supplement the analytic/source checks and do not constitute proofs.

Commands and final results:

- `lean-check research/blueprint/packages/AutomorphicSpectralTheory/Suggested.lean`:
  exit 0, no errors, 57 warnings, all `declaration uses sorry`. Used the existing
  shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the pinned
  Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`. No Tau Ceti
  module beyond that pin is imported. Memory was checked before compilation;
  only one compilation ran at a time.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no findings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`:
  0 errors, 0 warnings; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  0 problems.
- `git diff --check`: clean.
- Coverage comparison: every original section accounted for; no lost check count;
  the seven API movements/renamings are documented above. All definition sections
  have at least three checks; all seven layers have Examples and Dependencies.
- No private paths or source passages were added to the deliverables. Scratch
  downloads, numerical dependencies and logs are disposable and are removed after
  the pull request opens. Nothing the next reviewer needs depends on scratch.

## Remaining work

Independent package review should verify this revision, especially the derived
general-group Franke and canonical-boundary counting proof routes. There is no
unfinished package work or Lean elaboration failure to resume. The worker submits
one pull request for this issue and takes no second job.
