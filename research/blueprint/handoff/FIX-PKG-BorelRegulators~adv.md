# BorelRegulators package fix: checkpoint

Issue #11062; job `FIX-PKG-BorelRegulators~adv`; Codex session
`codex-PFnBy7`; 2026-10-19. **Incomplete: keep `needs_changes`.**

The three findings of `REV-PKG-BorelRegulators~adv.md` remain open. The
permitted source access did not supply readable proof text for Weil's
Tamagawa argument or Bloch's pairing. This checkpoint preserves a checked
normalization correction and the source investigation below; it does not
accept the package or claim an evaluated Bloch–Wigner coefficient.

## Finding dispositions

| Finding | Change and remaining work |
|---|---|
| Norm-one Tamagawa proof, README §6.2 | No mathematical change. Weil's value-one endpoint still lacks its proof prerequisites and a match to the package's measures. Read Theorem 3.3.1 and its proof, including the division-algebra zeta argument, quotient measures and central-isogeny comparison. Consume the existing AdelicAlgebraicGroups contracts rather than reconstructing its groups, gauge measures or compactness. |
| Bloch primitive pairing, README §7.3 | No mathematical change. Bloch's independent definition and the local conversion table remain missing. Read Lectures 1–4 of CRM Monograph Series 11 from a permitted copy, locate the primitive pairing and each local form by numbered statement and page, then compare with §6.6. A formula for rescaling an already specified measure does not identify this pairing. |
| Evaluated Bloch–Wigner coefficient, README §8.5 | Partial normalization correction in §4.5 and its Lean tests; §8.5 now explicitly requires transport of the relative representative and identification of the actual Suslin map. The sign and powers of π in the final coefficient remain unevaluated. |

## Established change

Burgos, §9.7, Propositions 9.25–9.26, pp.87–88, distinguishes the relative
Borel representative from its invariant absolute representative. For
Hermitian matrices, conjugate transpose plus the original matrix doubles
each argument. The new target `traceCocycle_hermitian` records the resulting
factor `2^(2*j-1)` for arbitrary finite matrix size and `j ≥ 2`.

For the ordered Hermitian Pauli triple of README §4.5, the normalized trace
form is −2i. The relative Borel form evaluates to −16i, the invariant absolute
Borel form to −4i, and the invariant absolute Beilinson form to −2i. Dividing
these last three values by 2πi gives −8/π, −2/π and −1/π. The README now gives
this table and distinguishes cochain evaluation from a regulator evaluated
on a K₃ element. Equality of the Borel classes after inclusion does not make
their representatives pointwise equal. The relative form is needed in a
symmetric-space tangent calculation.

The first trace example now computes both −2i and −16i. The named, proved
Tate-coordinate theorem includes the relative coordinate as well. The
general Hermitian identity remains a named admitted roadmap target; it is
not used to prove this numerical test. The numerical trace tests do use
the existing admitted `traceCocycle_three` target, so elaboration does not
independently prove that commutator-reduction theorem. There are still four
light data definitions and eight proved examples; no data definition or
example is admitted.

## Source investigation and resume points

**Weil.** The official IAS record is
[Adeles and algebraic groups](https://albert.ias.edu/20.500.12111/8024).
The official PDF request was refused with HTTP 403; the browser PDF exposed
no readable proof text. An indexed theorem statement is insufficient to
decompose its proof. Do not infer rationality of a quotient volume from
compactness and positivity. The cleared Platonov–Rapinchuk–Rapinchuk,
*Algebraic Groups and Number Theory*, volume 1, §5.3, pp.315–317, was read in
place: its split SL₂ example and survey of Weil's method do not provide the
required norm-one division-algebra proof with measure matching.

**Bloch.** CRM Monograph Series 11 is absent from the cleared library index.
The official AMS book page did not provide readable full text. No other copy
of this uncleared book was used. The next worker needs a permitted source
before assigning numbered locators to the independent pairing; the existing
review gives Borel's side, not Bloch's definition.

**Weight two.** These additional public primary-source passages were read:

- Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*,
  arXiv:math/0207036v3: equation (11), p.7; Proposition 5.4, pp.40–41;
  the de Rham-to-symmetric-space comparison and equation (61), pp.41–43;
  equations (62)–(64) and Theorem 5.7, pp.44–47; Corollary 5.10 and
  Theorem 5.11, p.49. The numerical coefficient in Proposition 5.4
  specializes to 16πi at weight two. This arithmetic is not yet an equality
  between the package's normalized regulator and its real dilogarithm:
  coefficient lines, tangent identifications and the symbol map still need
  comparison. In particular its raw trace de Rham form is not Burgos's
  normalized relative form.
- Burns–de Jeu–Gangl, *On special elements in higher algebraic K-theory and
  the Lichtenbaum–Gross conjecture*, arXiv:1101.5477v1, §4, Theorem 4.1 and
  proof, pp.17–19: gives a map from a kernel of a symbol boundary into
  torsion-free indecomposable K₃, with finite cokernel for number fields.
  A universal sign can be chosen so that its Deligne regulator is the
  imaginary-valued Bloch–Wigner function. This is a possible alternative
  route, but the map is specified naturally only up to sign, runs in the
  reverse direction to the package's Suslin map, and uses a different
  integral tensor quotient. Its relative-K-theory boundary orientation
  must be compared with that particular Suslin map before it determines
  the requested sign. Naturality, rational invertibility and a torsion
  kernel alone cannot distinguish a map from its negative.
- Choo–Mannan–Sánchez-García–Snaith, *Computing Borel's Regulator*,
  arXiv:0908.3765v5, §5.1, Theorem 5.1, p.14: the Karoubi–Hamida integral
  offers another cochain formula. Its bar, adjoint and coefficient
  conventions have not been transported to Burgos's class here. No scalar
  from it has been asserted in the package.

These are targeted comparison notes, not substitutes for the unresolved
source arguments. Once a route is verified, identify its map on ordered
cross-ratios, retain the relative/absolute distinction, and divide by the
Tate generator exactly once. Test a nonzero symbol or cycle: the zero
weight-two target of ℚ cannot distinguish candidate coefficients.

Public source versions downloaded on 2026-10-19:

| Source | URL | SHA-256 |
|---|---|---|
| Burgos | [author's PDF](https://www.icmat.es/miembros/burgos/files/brbr.pdf) | `da6ba8c4b08bf447d1575788c33b96c52d8d0d0a377e8f2990ead6aed73f65ea` |
| Goncharov v3 | [arXiv PDF](https://arxiv.org/pdf/math/0207036v3) | `ac729924bca286113e8aae593f6012bf72c77d935178606e7a2be677bd3440db` |
| Burns–de Jeu–Gangl v1 | [arXiv PDF](https://arxiv.org/pdf/1101.5477) | `0dd66179daae632fe66ae6592fbdd480601a7ba8bcd4b6d87ef75caee682bec7` |
| Choo et al. v5 | [arXiv PDF](https://arxiv.org/pdf/0908.3765) | `9806220f2db6d8297dc49b47c2735cee1135752ce1df28de04453e4acd8c12ce` |

No source passages or source files are committed. Scratch downloads are
disposable; all resume information is above.

## Adversarial pass on touched statements

| Statement | Instances tried and result | Change |
|---|---|---|
| Hermitian trace scaling | Arbitrary finite matrix size; size zero gives zero trace, size one in weight two gives zero by commutativity, zero inputs give zero. For Hermitian Pauli inputs all three arguments double and multilinearity gives 8Φ₃. No trace-zero or positivity hypothesis is used. The application and Lean statement both require `j ≥ 2`. | Named target with explicit Hermitian hypothesis and matching README generality. Existing matrix adjoint and Hermitian carriers are reused. |
| Pauli normalization table | `[Y,Z]=2iX`, `Tr(X²)=2`, hence Φ₃=−2i and the relative value −16i. Swapping X and Y reverses sign; repeating an argument gives zero. Using −4i for the relative value fails the nonzero triple. The −2i/−16i pair is computed in one Lean example; the repeated-input example remains. | Relative and absolute values are labelled separately; no equality of cochains is asserted. |
| Tate coordinates | Odd projection kills 1 and retains i; the even-projection checks remain. The absolute Borel/Beilinson ratio is two. π is nonzero, so division gives −2/π and −1/π; −16i gives −8/π. Empty target coordinates do not establish any nonzero scalar. | Extended the proved coordinate theorem without a second Tate division. |
| Layer 4 worked example | The same fixed Pauli triple has three different representative evaluations. The ℚ and ℚ(i) target dimensions and transfer examples are unchanged. | Explicitly calls these cochain values, without treating the triple as a K₃ class. |
| Exact coefficient resume requirements | Replacing a natural rational symbol isomorphism by its negative preserves naturality and torsion kernel but reverses the coefficient. Weight-two rank zero over ℚ cannot detect this; a nonzero complex-place coordinate is necessary. Equality in cohomology does not identify arbitrary representative values. | Retained `borelRegulator_blochWigner_exact` as open with the actual map and tangent comparison required. |

Trivial groups, residue characteristic, DVRs, primes 2 and residue fields of
size 2 do not parametrize these touched complex-matrix statements. No claim
in these edits extends an arithmetic theorem to those cases. The inherited
every-subsection pass remains in the independent review; this checkpoint
does not claim to rerun that whole review.

## Ownership and validation

The reviewed library audit was read. Baseline remains Mathlib `082e2d3`
and Tau Ceti `f790474`. Current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` were checked read-only,
including the nine roadmaps newer than the atlas snapshot. Relevant current
AdelicAlgebraicGroups measure/inner-form contracts remain imports. The
current library's `Matrix.trace_add_mul_add_mul` expands a quadratic trace
with a fixed matrix; it does not supply the alternating trace cocycle or its
relative Borel representative. `Matrix.IsHermitian` and conjugate transpose
are existing Mathlib objects and are used directly. No target moves or new
supplier development are made.

Validation on this checkpoint:

- `lean-check research/blueprint/packages/BorelRegulators/Suggested.lean`:
  exit 0, only admitted-theorem (`sorry`) warnings, at the pinned build.
  The file has 226 lines and retains eight proved examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`:
  zero errors and warnings; the packet was not changed.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/BorelRegulators/Suggested.lean`:
  exit 0.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  four files, zero problems. `git diff --check`: exit 0.

Resume by resolving the two source-access blockers, then complete all three
finding rows and repeat the affected mathematical and Lean checks. Keep the
review verdict `needs_changes` until the comparisons themselves are verified.

Intake bookkeeping note: the current generic `kind:fix` completion test in
`issues.deliverables_complete` checks output-file existence and does not
inspect this checkpoint status or the `needs_changes` verdict. It may count
this submission as a completed fix despite the explicit residue. This note
and the PR identify the work as incomplete; no queue or label is changed by
this worker.
