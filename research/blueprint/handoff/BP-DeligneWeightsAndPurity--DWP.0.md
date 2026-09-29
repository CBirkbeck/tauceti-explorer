# Handoff: BP-DeligneWeightsAndPurity--DWP.0 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #706.

- The packet is partial, with 17 nodes and 6 planets. The checker reports no errors and no warnings.
- Stage DWP.0 is `source_decomposed`. DWP.1–DWP.6 and DWP.10 are recorded with the sources to read next.
- RS-17 (accepted) keeps DWP.0 and makes it the single owner of the Weil-number and ι-weight definitions and of the
  reciprocal-spectrum linear algebra. This checkpoint follows that.

## What this checkpoint plans

Sources, both from Numdam scans with OCR. The SHA-256 of each file is the same as recorded in the integrated
decomposition. Every excerpt was matched against the OCR text of its page.
- Weil I: 8392b345…, printed page = PDF page + 271.
- Weil II: b06eea61…, printed page = PDF page + 135.

Numbers:
- `weil-q-number` (planet). The definition goes through the minimal polynomial over ℚ, with algebraicity as an
  explicit clause, because Mathlib's minimal polynomial of a transcendental element is 0. It includes the
  all-embeddings characterisation for K algebraic over ℚ, and uniqueness of the weight for q > 1.
- `weil-number-arithmetic`: products, inverses, rational q^k, and conj(σα) = q^n/σα. For α integral over ℤ, n ≥ 0,
  and weight 0 forces a root of unity (Kronecker).
- `weil-number-base-extension`: α has weight n relative to q iff α^r has weight n relative to q^r.
- `iota-weight` (planet): real weights for a non-continuous ι.
- `embeddings-into-the-complex-numbers`: the existence of ι : ℚ̄_ℓ ≅ ℂ, and extension of embeddings.
- `weil-number-iff-iota-pure-for-every-iota`: Weil II (1.2.6), including the automatic algebraicity.

Linear algebra:
- `endomorphism-weights` (planet): eigenvalues as the roots of the characteristic polynomial in Ē, with multiplicity
  given by generalized eigenspaces. There is no eigenbasis; a Jordan block is pure.
- `characteristic-polynomial-in-short-exact-sequences`.
- `purity-under-subquotients-and-extensions`: Weil II (1.2.5)(i).
- `characteristic-power-series-and-traces`: Weil I (1.5.3).
- `spectra-of-polynomials-in-an-endomorphism`, as multisets.
- `finite-field-base-extension-of-weights`.
- `spectra-of-tensor-products-and-duals`, with the contragredient (F⁻¹)^*.
- `twisting-by-rank-one-characters`: Weil II (1.2.7); Tate twists, the half twist and real-weight twists.
- `reciprocal-pairing-of-eigenvalues` (planet): Weil I (2.4)–(2.5), including the generalized-eigenspace
  orthogonality.
- `disjoint-spectra-no-intertwiner` (planet): Bezout and Cayley–Hamilton, with no base change.
- `weight-decomposition` (planet): over E for Weil weights. For ι-weights it holds only over Ē: T² − 2T − 1 over ℚ is
  a counterexample to descent.

## Errors caught before submission

- **Mathlib claim.** A proof step claimed that Mathlib's `IsAlgClosed.equivOfTranscendenceBasis` gives an isomorphism
  extending a given σ. Mathlib states only a ring isomorphism. Compatibility with σ is recorded as a proof obligation,
  and the case k = ℚ is the stated Mathlib theorem.
- **Garbled excerpt.** One excerpt did not match its page because the OCR reads "h)" for "b)". The item label was
  dropped from the excerpt.

## Requests (new)

- EtaleDualityAndPerverseSheaves EDC.0: the ℚ_ℓ(1) convention under geometric Frobenius, and extension of
  coefficients.

## Suggested Lean file

It imports Mathlib only. It was compiled with `lake env lean` against Mathlib 082e2d3 and exited with code 0. The only
messages are 31 `sorry` warnings, for planned results and tests.

It defines:
- `IsWeilNumber`, `iotaWeight`, `IsIotaPure`;
- `eigenvalues` (in `AlgebraicClosure E`), `IsPure`, `IsIotaPureEnd`, `iotaWeights`;
- `twist`, `tateTwist`.

These proofs are complete:
- `iotaWeight_mul`, `iotaWeight_inv`, `iotaWeight_comp`, `twist_twist`;
- `comp_aeval_of_comp`;
- `eq_zero_of_isCoprime_charpoly`, the no-intertwiner theorem, which uses no extension of scalars;
- two degenerate-case tests.

## Source issues

None found in the passages read.

## What remains (precisely)

- **DWP.0.** Symmetric and exterior powers enter only through tensor powers and the determinant. Add them if DWP.10's
  acceptance suite needs their spectra.
- **DWP.1.** Plan the curve and abelian-variety estimate under RS-17's keeps. The suppliers are A2, A6, TraceFormula
  Layer 8, Tau Ceti EllipticCurves Layer 3 and R01.6. A public account of the Rosati positivity argument still has to be
  chosen.
- **DWP.2.** Refine the integrated decomposition's five Weil I §3 nodes to declaration level. Lemma 3.3 uses this
  packet's `characteristic-power-series-and-traces`.
- **DWP.3 and DWP.4.** Weil I §6 and §7, with suppliers LPV.3–LPV.5, FA.5 and EDC.4.
- **DWP.5 and DWP.6.** Weil II (1.2.2)–(1.2.3) sheaf predicates and §§1.3–1.5. The monodromy filtration of §1.6 is
  imported from LPV.1.
- **DWP.10.** Generic weight transport and the acceptance suite, importing WC.5 and WC.3.

# Checkpoint 2 (DWP.2, Weil I §3)

Agent: Claude Code, session cc-fb70e5. Refs #706.

- The packet now has 28 nodes and 8 planets. The checker reports no errors and no warnings.
- DWP.2 is `source_decomposed`. The source is Weil I §3 (3.1)–(3.9), pp. 283–287, and Scholie (2.10), read in full.
  The Numdam scan is the same file (SHA-256 8392b345…), and every excerpt was matched against its page.
- RS-17 narrows DWP.2, and the plan follows its keeps.

## What checkpoint 2 plans

Kept from the integrated decomposition's ids:
- `weights-and-l-functions-of-lisse-sheaves-on-curves` (planet);
- `fundamental-estimate-theorem-3-2` (planet).

Refined to declaration level from the decomposition's combined nodes:
- `positivity-of-even-tensor-power-traces` (3.3);
- `positive-local-factors` (3.4);
- `radius-of-convergence-of-positive-products` (3.5);
- `poles-of-positive-products` (3.6);
- `coarse-bound-on-compact-cohomology` (3.8);
- `coarse-bound-on-cohomology-of-the-projective-line` (3.9).

New:
- `open-subgroups-of-symplectic-groups-are-zariski-dense`;
- `symplectic-coinvariants-of-even-tensor-powers`, the ℚ_ℓ descent bridge that RS-17 asks for;
- `compact-cohomology-of-even-tensor-powers` (3.7).

The decomposition's node `curve-duality-inputs-2-10-2-12` is not planned here. RS-17 imports smooth duality, so
Weil I (2.10) and (2.12) are requested from EDC.2.

## Requests (new)

- SchemeAndStackFoundations SF.2: the trace formula (1.14.3). RS-17 names the CohomologicalPointCounting trace formula,
  which has no roadmap stage here; SF.2 is the stage that integrates it.
- EtaleDualityAndPerverseSheaves EDC.2: Weil I (2.10) and (2.12).
- Tau Ceti SchurWeyl Layer 9: complex symplectic invariant theory.
- Tau Ceti ReductiveGroups Layers 2–3: Zariski closure, Lie algebras, and connectedness of Sp.

## Fixes to checkpoint 1

- The `sourceVersions` entries now use the kind "published". Checkpoint 1 used "journal scan", which is not a protocol
  value.

## Suggested Lean file

A section for Weil I §3 was added. It gives the sheaf-level signatures in a comment and proves in full:
- Lemma 3.5 for two factors (`coeff_le_coeff_mul_of_nonneg`);
- the arithmetic core of Lemma 3.3.

Lemma 3.4 is stated. The file was compiled with `lake env lean` against Mathlib 082e2d3 and exited with code 0, with 32
`sorry` warnings and no other messages.

## Source issues

None found in Weil I §3.

## What remains

- **DWP.1.** The curve and abelian-variety estimate. AbelianSchemesAndArithmeticModuli's field-level A6 (Rosati
  positivity) is now planned in #3930 and can be imported.
- **DWP.3 and DWP.4.** Weil I §§5–7.
- **DWP.5 and DWP.6.** Weil II §§1.2–1.5, sheaf level.
- **DWP.10.** The acceptance suite.
