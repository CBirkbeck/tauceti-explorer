# Independent review of AnticyclotomicLocalUnits

Accepted as a target-level planning pass, with eleven explicit gaps and no
closed layer. Reviewer: Codex, session `codex-q34rWa`, 2026-10-18; job #1717.
The design was written by a different session. This verdict does not certify
that the proposed mathematics has been formalised or that its proof inputs
are available in the pinned libraries.

The packet records an individual verdict for every node: 31 verified and 19
corrected, with no added or unverifiable nodes. Its nine layers contain 50
nodes: eight definitions, eight constructions, 31 theorems and three
comparisons. There are 72 API entries, 49 discriminating tests, 43 planets,
nine confirmed baseline declarations and 16 supplier requests. All nine
coverage entries remain `planned`; none is `closed`.

The review checked every statement, hypothesis, source locator, prerequisite,
proof sketch, API, test and planet. Small supporting arguments remain in
proof sketches, following the current target-level granularity rule in
WORKERS.md. The existing 79-line suggested file already follows the current
compact shape and was left unchanged.

## Material mathematical corrections

The original coefficient descent needed an additional argument. Scalar
vanishing of a derivative in C_p does not imply vanishing of the corresponding
tensor-valued derivative after finite free coefficient extension. For example,
with W=O[ζ_p] and E=Φ(ζ_p), the nonzero element
ζ_p⊗1−1⊗ζ_p of E⊗_O W vanishes under multiplication into C_p.
An O-basis of W therefore cannot justify the original scalar-kernel argument.

The signed-unit base-change API now uses derivatives into C_p⊗_O W; for
these maps a finite basis does justify equality with the extended signed
module. New gap G11 asks for the missing comparison for the actual CM class.
The scalar reciprocity formulas and root-number vanishing remain valid.
Their tensor-valued signed-membership consequence, and hence this packet's
descent of a unit-valued CM specialization, explicitly require G11. The
finite-free coordinate argument is applied only after signed membership has
been established. This preserves the intended independence from plus
freeness. BKO Proposition 3.3 and Theorem 3.4, pp.953–954, give the scalar
formulas and signed result; their use of earlier signed freeness does not
supply this packet's alternative pre-freeness descent.

A possible sufficient comparison uses an unramified CM coefficient field
and the totally ramified finite Lubin–Tate fields, but the existence and
integrality of that coefficient choice must itself be proved. It is recorded
as a proposed route, not as an established consequence of finite freeness.

The generic Herbrand-quotient prerequisite was wrongly assigned to
ArithmeticGaloisDuality R02.1. That supplier's coefficient-limit statements
do not prove cyclic Herbrand multiplicativity. The request, node and layer
now cite ClassFieldTheory Layer 0. R02.1 remains a separate, precisely scoped
request for finite Tate-module inverse limits and the discrete torsion
quotient, where those statements actually apply.

Other corrections and additions are:

- The nontrivial auxiliary character of order ℓ^r has conductor exponent
  r+1, for r≥1. The trivial character retains conductor exponent zero.
- The projected CM class has a group-ring evaluation test that checks
  [g]↦ν(g) and the Hilbert-class augmentation; a procedural dependency check
  was replaced by this mathematical test.
- Sixteen API entries supply missing constructors, extensionality,
  coefficient linearity, quotient compatibility, marking changes and trace
  compatibility. The Tate-basis evaluation API now states its basis
  hypothesis. Every definition and construction has at least three tests.
- Test kinds use the protocol vocabulary (`computation`, `compatibility`,
  `non-example`, `degenerate`). The signed-unit tests now exhibit the
  same-parity nonvanishing boundary and the tensor/scalar distinction.
- The divisible-point-sum locator includes Rubin Lemma 5.5(vi), p.413,
  which supplies its integral p^n bound, as well as part (v).
- Hazewinkel's journal was corrected to Duke Mathematical Journal 44,
  no.2 (1977), 305–314, in both source inventories and the version record.

## Source checking and source issues

The public versions read are recorded by URL and SHA-256 in the packet:

| Source | Locators used for the review |
| --- | --- |
| [Burungale–Kobayashi–Ota](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1) | §§2–5, pp.948–960, and §6.0.2, pp.962–963; in particular Proposition 3.3, Theorems 3.4 and 5.5, Corollary 5.6 and Theorem 5.8 |
| [Rubin](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf) | §§1–8, pp.405–418, and Lemma 10.1, p.421; in particular Lemmas 4.2–4.4, Propositions 5.2–5.6 and §7 |
| [Hazewinkel](https://ir.cwi.nl/pub/10014/10014D.pdf) | Theorem 1.3, pp.305–306, and its supporting arguments in §§2–4, pp.307–314 |
| [Wintenberger](https://www.numdam.org/article/CM_1980__42_1_89_0.pdf) | §4, pp.91–92; §§5.2–5.5, pp.92–98, including the module criterion and nonexceptional character case |
| [Abbes–Ullmo](https://www.numdam.org/article/CM_1996__103_3_269_0.pdf) | Theorem A, p.269; Lemma 3.2 and Propositions 3.3–3.4, pp.276–279, with the appendix's modular-degree input |

The Rubin scan and the ambiguous BKO formulas were checked as page images;
plain-text extraction loses bars, primes and some field symbols. No source
passage is reproduced in the deliverables. Unread original inputs remain
identified in the gaps; a citation in BKO or Rubin is not counted as reading
the cited original proof.

All 13 source issues now carry independent verdicts: 12 confirmed, one
rejected. Two substantive source reports needed correction:

- E3 concerns the degree label on p.958: its field symbol should be Ψ′_s.
  The tame fixed-field relation on p.959 is correctly printed. The earlier
  report located the error in that relation instead.
- E7 is rejected as a misprint allegation. The proof of Theorem 5.8 on
  p.960 uses the descended δ and does not state δ_1=δ. The correct Euler
  factor δ_1=(1+p⁻¹)δ remains a necessary convention lemma in the plan.

E5's locator was narrowed to the final sentence of the proof of Theorem
5.5(ii), p.959. E2's correction now excludes the trivial character from the
order/conductor shift. The remaining confirmed issues are the weak generic
count at p=47 (E1), forward-index error (E4), missing inverse twist (E6),
wrong Fourier base field (E8), Honda sign (E9), confusion of the j-map with
the parametrization (E10), Tate-sequence sign (E11), continuity versus
augmentation-linearity (E12), and repeated forward lattices without an
independent second coordinate (E13). Each packet entry gives its locator,
reason and effect separately.

## Exact baseline and ownership

Every listed declaration was read at its full recorded commit, including
the surrounding hypotheses. All nine citations are retained; none was
removed or replaced. Their `checked` fields now give independent module and
line evidence. The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Hypothesis and scope check |
| --- | --- |
| `TauCeti.unitFiltration` | `LocalField/UnitFiltration/Basic.lean:88`; existing subgroup of K× for a nonarchimedean local field with its valuation and topology |
| `TauCeti.unitFiltration_one` | Same module, line 173; identifies depth one with principal units |
| `WeierstrassCurve.formalPointHomAdicCompletion` | `FormalGroup/Point/AdicCompletion.lean:264`; a Dedekind-domain height-one completion, fraction-field data and elliptic curve are required |
| `WeierstrassCurve.formalPointHomAdicCompletion_injective` | Same module, line 283; the same hypotheses, not an arbitrary formal group |
| `WeierstrassCurve.range_formalPointHomAdicCompletion` | `FormalGroup/Point/Range.lean:158`; image is zero or the stated x-coordinate valuation locus; the required realization is part of G1 |
| `PowerSeries.coeff` | `PowerSeries/Basic.lean:80`; coefficient linear map over a semiring |
| `PowerSeries.constantCoeff` | Same module, line 143; constant-coefficient ring homomorphism |
| `PowerSeries.derivative` | `PowerSeries/Derivative.lean:50`; formal derivation over a commutative semiring, not analytic torsion-point evaluation |
| `PowerSeries.isUnit_iff_constantCoeff` | `PowerSeries/Inverse.lean:111`; commutative-ring unit criterion, used after the Iwasawa coordinate comparison |

The reviewed library audit was checked against the plan, including its
Coleman, ClassFieldTheory, completed-group-algebra and Iwasawa entries. The
current upstream roadmaps and current Tau Ceti library were also read, since
they contain work newer than the atlas snapshot and implementation pins.
No upstream roadmap or library file was modified or built.

Current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
already has `TauCeti.completedGroupAlgebra`, its general coefficient-ring
API and the compact-module action in
`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/{Basic,Module}.lean`.
The request now cites ProfiniteProPGroups Layer 9, which consumes these
inputs. They are absent at the old pin and were not inserted as fictitious
pinned declarations. The current power-series coordinate is for ℤ_p;
the coefficient-O comparison remains a precise L4/L5 request.

ProfiniteArithmetic Layer 1.3 and `ProP/PadicPow.lean` already supply the
continuous ℤ_p action on abelian pro-p groups. The principal-unit proof
therefore reduces its application to proving the pro-p property from the
unit filtration. It does not plan generic powering again.

Current ClassFieldTheory Layers 0, 5, 6 and 8 supply the generic cohomology,
local duality and reciprocity interfaces; they do not supply Lubin–Tate or
the formal explicit reciprocity law. Current ModularCurves Layers 5 and
8–9 supply fine/coarse affine geometry; Layer 10 still treats prime-level
compactification. Composite levels 27/32 and mixed-level integral models
remain the genuine extension G4. Supplier statements for the dual
exponential, modularity, modular parametrization, newform quotient and
coefficient limits were read. The packet now has explicit requests for the
first three instead of relying on their mere appearance in prerequisites.
No foundational target was moved into a higher-tier supplier.

## Remaining contracts and packaging follow-up

The dependency order separates the two constructions needed for the final
split: a CM optimal unit and a local primitive trace system. The latter
uses no global Heegner point. The minus invariant calculation precedes the
augmentation argument, which precedes the integral decomposition and
matching-character nonvanishing. The corrected proof uses no circular
signed-freeness premise.

The remaining contracts are G1 (Lubin–Tate/quasi-canonical foundations and
formal realization), G2 (early CM special values), G3 (general finite-field
supersingular counts), G4 (composite and mixed-level modular geometry), G5
(general unit norm control), G6 (height-two Coleman interpolation), G7
(formal Cartier/Kummer comparison), G8 (norm vanishing after ramified finite
base change), G9 (original Wiles proof), G10 (class-number bound), and G11
(CM coefficient comparison). Each is attached to the nodes that directly
use it. Later layers inherit those dependencies; a complete planning pass
does not turn them into closed proofs.

Questions/actions for the orchestrator:

1. Register the G1–G3 owners and complete the existing supplier extensions
   before treating this plan as closed. G11 needs an early CM comparison
   contract, or a tensor-valued reciprocity theorem with the required sign.
2. Reconcile the separate BKO errata packet's E3 and E7 with this review.
   That file is outside this issue's allowlist; the differences are also
   recorded in `upstreamNotes`.
3. The reader document is outside this review's deliverables. When packaging,
   regenerate it from the reviewed packet so that it includes G11, the
   corrected ownership, API and source reports. Retain every target, test and
   explicit hypothesis in the README, while keeping heavy carriers out of
   the suggested Lean file.

Validation: `python3 scripts/check_blueprint.py
research/blueprint/packets/AnticyclotomicLocalUnits.json` reports zero errors
and zero warnings. `lean-check
research/blueprint/suggested/AnticyclotomicLocalUnits.lean` elaborated at the
pinned baseline with only the two intended `sorry` warnings, at lines 38
and 48. Its real-bodied conductor and logarithmic-derivative definitions,
seven examples and coefficient-of-T counterexample all elaborate. This
checks the stated lightweight interface, not the unimplemented theory.
