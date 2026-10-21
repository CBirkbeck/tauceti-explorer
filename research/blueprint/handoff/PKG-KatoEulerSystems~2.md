# PKG-KatoEulerSystems~2 — blocked checkpoint

Issue #9178; Codex, session `codex-zhimD5`; 2026-10-13.
Branch: `codex-zhimD5-kato-package-r2`.

**This is a checkpoint, not a completed package revision or an upstream-ready
roadmap.** The package-only edit scope cannot repair the missing prerequisite
plans identified by the independent review. Submit this checkpoint as a draft
for the maintainer: the intake's existence-based package completion predicate
cannot distinguish a blocked revision from a completed one. Do not treat the
presence of all deliverable files as mathematical closure.

## What changed

- Added the required opening `**Summary.**` paragraph marker.
- Retained all forty numbered README targets, their exact hypotheses, source
  locators, API names and prose Checks. No all-prime theorem was weakened or
  erased to bypass a prerequisite defect.
- Added `katoTwistLocalization` and `katoTwistSpecialization` in §5.3: the actual
  integral global/local and finite-level projection squares, followed by
  rational extension. The proof route restricts cup/coefficient maps on finite
  cochains using the same Tate basis, passes through the existing coefficient
  and Iwasawa comparisons, and uses descent for the lower levels. It imports
  ProfiniteCohomology Layer 12 `cup_res`, `cup_coeffMap`, `cup_projection`; no
  second generic cup product is planned. §5.4 uses it componentwise at the
  p-adic places of its fixed conductor field.
- Added controls for j=0, opposite fourth-root bases at p=2, inverse rather than
  direct cyclotomic scalar at p=5, and the finite-projection codomain. The
  mod-four and inverse-scalar controls also appear in Suggested.lean. The
  underlying comparisons are Kato 12.5(1), p.221, and 16.4(i), p.270.
- Brought Suggested.lean to the newer shape: 508 lines, 21 light real-bodied
  definitions, nine independent statements, 64 examples. Removed 31 routine
  unfolding/extensionality/helper statements and 29 redundant examples; their
  mathematical APIs and Checks remain in the README. Kept examples give one
  or two per definition, with additional sign, integral-lattice, prime-set and
  other negative controls. No auxiliary theorem chain or arithmetic carrier
  construction was introduced.
- Replaced the hand-built `upperUnipotent` with
  `Matrix.toLin' !![1, x; 0, 1]`. Its data has no sorry proof fields. The actual
  matrix-to-column-vector formula was separately proved at the pin for any
  commutative ring. This is a specialization of Mathlib, not a new matrix API.
- Metadata remains exactly `topic = "math.NT"`. The input packet, input reader,
  input suggested file, independent report and review.json are unchanged.

The new twist route addresses the particular mathematical compatibility
request; it does not certify the missing regulator, parabolic exponential
injectivity or strict-Selmer comparison. Its independent mathematical review
remains outstanding. The unchanged packet still records fourteen gaps and
thirty-one requests; this checkpoint does not rewrite that source of truth.

## Why the revision cannot finish in this edit scope

WORKERS requires ownership and prerequisite closure (PROTOCOL §§3,15).
The issue permits only this package's three files and this handoff, explicitly
forbids packet changes and says to describe plan mistakes here. The review
requires new exact targets in supplier plans, rather than a change to a source
label. Reinspection of the current packets confirms the hypothesis mismatches
below. Renaming generic maps, deleting target branches, or declaring prospective
exports to exist would not repair them. This is a scope/ownership block, not a
claim that the source mathematics is false or that an unproved Lean theorem
is itself a planning gap.

| Input gap / README consumers | Current evidence and exact remaining action |
| --- | --- |
| Big-local reciprocity / 3.4 | PadicHodgeRegulators D.2 is still an undecomposed atlas stage; only D.1 and L3 packets exist. Authorize its exact non-perfect-residue-field theorem, Kato 10.9.5 square and §11 comparison. Recovered KK3 locators in the previous review remain useful; no new KK3 proof audit was completed here. |
| Early CM input / 4.4, 5.1, 7.1–7.2 | No CMAllPrimeMainConjectures atlas roadmap or packet exists. Assign the early elliptic-unit H²/H¹ theorem including p=2, Q(i) and Kato 15.14; separately stage the 15.13–15.17 length comparison and 15.2 one-direction input. It must precede the Kato map, not consume a main-conjecture equality involving it. |
| Critical arithmetic family / 6.3 | ModularSymbols L3 compares sections already given. The README retains an explicitly conditional family comparison; an isolated critical fiber does not construct the compatible arithmetic section. Do not add a PadicFamilies prerequisite cycle. |
| De Rham and ordinary integral image / 6.1, 6.3, 7.5 | PadicHodgeRegulators L3 is crystalline. Its L4 de Rham extension has an admitted high-conductor open, not every finite character or Kato 17.8–17.10's good-lattice image theorem. Supply the exact 16.4 domain and 17.5/17.8–17.10 image/kernel/cokernel comparisons. |
| Modular strict-Selmer complex / 4.3–4.4, 7.2 | Selmer L3 constructs generic Iwasawa complexes and error/control sequences. Supply the actual modular étale/Galois comparison, strict H² kernel with local corrections, and all-prime rank/freeness passage before the map. |
| Elliptic control / 7.6–7.7 | Selmer `greenberg-structure-hypotheses` explicitly restricts its applications to odd p and requires RFX/LOC/LEO/CRK and a residual alternative. `kernel-control` retains localization-image and H¹-invariants errors. Verify these for the actual elliptic lattice, formal-group norm freeness, local bad-prime torsion exclusions and the squared ordinary correction factor. |
| Period comparison / 3.2, 6.2 | The ModularSymbols period-line, integral-period-lattice and RJW comparison targets fix their own conventions. They do not identify Kato's actual differential and Betti bases with all Gauss, factorial, p-power, character and U_p factors. Build that dictionary. |
| Open-curve comparison / 1.5, 3.1 | ModularCurvesPartII R14.3 supplies compact weight-two Shimura/parabolic statements. Supply full Y(M,N), all weights, cusp-boundary logarithmic de Rham comparison, affine higher-degree vanishing and the full M_k filtration including Eisenstein forms. |
| Full-level moment / 2.5 | R31.2 is a classical-specialization stage; CompletedCohomologyPartII CC.6–CC.7 provide general evaluation/boundary machinery, without Nakamura's literal-dual Borel–Moore tensor map. Supply Lemma 2.10 and §3.1.4 with Hecke, coefficient and conductor compatibility. |
| Dyadic regulators / 6.1–6.3, 7.4–7.5 | L3 `crystalline-regulator`, `growth`, `scalar-projection`, `rubin-coleman-map` still say p odd. The de Rham analytic-open node's use of q=4 does not supply their dyadic integral image, growth or Coleman comparisons. These require owner work; no all-prime conclusion was silently narrowed. |
| Global/local twist / 5.3–5.4 | Particular compatibility and its proof route now supplied in §5.3 from existing cup naturality and Selmer twist/descent; independent checking of the limit identifications is still required. No missing regulator is inferred from this square. |
| Full-algebra support / 5.1–5.2 | PadicMeasures L4 `finite-quotient-criterion` is over O⟦T⟧ and its character decomposition requires tame order prime to p. Supply the full O[[G∞]] regular-μ/p-torsion-free support adapter, including p=2; finite quotient is not equality of lattices. |
| Nonsplit image / 4.1, 4.3–4.4, 7.2 | R19.3's Ribet–Momose node retains the inner-twist quaternion algebra and almost-all-prime residual largeness. It does not furnish a division-place unipotent. Supply the determinant/split comparison and alternative rational weak-Leopoldt/length argument at division places. Elliptic Serre consequences are separate exports. |
| Parabolic inverse-limit comparison / 3.5, 5.4 | No exact supplier node for Nakamura Lemma 3.4 was found. Supply all-weight/full-level torsion-freeness at every twist and twist-one global inverse-limit exp* injection on X(N),j_*V. Open-curve or generic local exp* statements are insufficient. |

KatoEulerSystems also remains outside the ninety-four-roadmap Caraiani–Newton
order. The maintainer must give its suppliers a valid upstream schedule, or
authorize owner changes and the corresponding packet revision. This package
cannot assign a new roadmap or change another owner's plan.

## Existing work and source checks

Read the current ArithmeticDirichletSeries and DifferentialGeometry READMEs
for upstream form, and their representative suggested interfaces. The older
sorry-data conventions in those suggested files do not override the binding
2026-10-12 shape rule. Current upstream was read-only at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Object searches across the entire current roadmap tree (including Completed)
and library covered Kato/Nakamura, Chern and regulator constructions,
Iwasawa/Selmer/Coleman interfaces, plus the inherited forty-target boundaries.
Relevant existing work remains generic continuous cohomology, Kummer maps,
modular forms, elliptic finite-level arithmetic, matrices, spans and bundle
operations. No existing upstream Kato construction was found. Read
ProfiniteCohomology Layer 12's exact pairing, restriction, coefficient and
projection contracts for the new adapter. No existing target was removed or
replanned; no generic ownership was moved upward.

For the changed mathematical prose, fetched the public Numdam Kato 2004 PDF
and read 12.1–12.5, pp.219–221, and 16.4–16.6, pp.270–271. No PDF, extracted
text or source passage is committed. Consulted the cleared-library index; no
private book was needed. This is a revision of the specified comparisons,
not a fresh fifteen-target source sample or a replacement independent review.

## Validation and resumption

- Final package `lean-check`: exit 0, 73 warnings, all
  `declaration uses sorry`; zero errors or other warnings. Build uses Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and the Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` environment; this file imports only
  Mathlib. Available memory exceeded 20 GB.
- Separate normalization check, without sorry: generic unipotent column
  formula, mod-four mismatch, inverse scalar, product-ring zero divisors and
  native torsion-freeness, and degree-two determinant. Exit 0, no warnings.
  This verifies the changed elementary conventions, not the missing arithmetic.
- Unchanged input `scripts/check_blueprint.py`: zero errors and warnings;
  40 nodes, 60 API entries, 41 tests, 14 gaps, 31 requests.
- README comparison: all forty numbered headings, all sixty accepted API
  names and all forty-one accepted test names retained; four new prose Checks.
- Intake file checks: four files, zero problems. `git diff --check`: clean.
  One-line metadata and unchanged independent review also checked.

Resume by assigning/decomposing the exact missing owner exports and approving
the outside-94 dependency schedule. Then revise the accepted plan and supplier
contracts under an issue that authorizes those files, revisit each row above,
and request a new independent package review. The unchanged review.json remains
`needs_changes`; this author does not review or accept its own work. No scratch
material is required for resumption.
