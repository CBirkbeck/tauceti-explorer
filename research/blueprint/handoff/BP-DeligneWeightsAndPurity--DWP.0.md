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

# Checkpoint 3 (DWP.1, the Weil estimate for abelian varieties and curves)

Agent: Claude Code, session cc-fb70e5. Refs #706.

- The packet now has 37 nodes and 10 planets.
- The checker reports no errors and no warnings. The run used a check root with origin/main's
  AbelianSchemesAndArithmeticModuli packet, whose A6 and A2 nodes DWP.1 imports.
- DWP.1 is `source_decomposed`.
- Source: Milne, *Abelian Varieties* v2.00, II §1 (pp. 75–78, in full) and III §§9–11 (pp. 113–119). Every excerpt was
  matched against its page.

## What checkpoint 3 plans

The nine DWP.1 nodes:
- `frobenius-endomorphism-over-a-finite-field` (definition).
- `rosati-of-the-frobenius-endomorphism`: π†π = q.
- `absolute-values-from-the-rosati-involution` (Milne II.1.3).
- `weil-estimate-for-abelian-varieties` (planet).
- `point-counts-of-abelian-varieties`: N_m = ∏(1 − a_i^m), the bound, and Z(A, t).
- `weil-estimate-for-curves` (planet), with the component-permutation non-example.
- `weights-of-the-cohomology-of-curves`: H⁰, H¹ and H².
- `compatibility-with-the-hasse-bound`: an identification, not a second proof.
- `the-frobenius-and-points-over-extensions`.

These nodes follow RS-17's keeps:
- They use the imported polarization and Rosati positivity (AbelianSchemesAndArithmeticModuli A2 and A6).
- They depend on no Tate isogeny theorem and nothing from DWP.4.
- They keep the Tate-versus-dual conventions explicit.
- They import the curve trace comparison, requested from SF.2.

## Source issue

- **E1 (known).** Milne III, proof of Proposition 11.2: the author's own footnote 6 reads "Needs fixing". The curve node
  imports the fixed-point formula from its RS-17 supplier, so it does not rely on this proof.

## Requests (new)

- AbelianSchemesAndArithmeticModuli A2.
- ArithmeticGaloisRepresentations R01.6.
- SchemeAndStackFoundations SF.2: the curve trace comparison.
- Tau Ceti JacobianChallenge Layer F.
- Tau Ceti EllipticCurves Layer 3.

## Suggested Lean file

A section for the Weil estimate was added. `norm_add_conj_le`, the complex-number core of the Hasse compatibility, is
proved, and the other signatures are in a comment. The file was compiled with `lake env lean` (exit 0, 32 `sorry`
warnings, no other messages).

## What remains

- **DWP.3 and DWP.4.** Weil I §§5–7.
- **DWP.5 and DWP.6.** Weil II §§1.2–1.5, sheaf level.
- **DWP.10.** The acceptance suite.

# Checkpoint 4 (DWP.3, Weil I §6: the rationality theorem)

Agent: Claude Code, session cc-fb70e5. Refs #706.

- The packet now has 48 nodes and 12 planets. The checker reports no errors and no warnings.
- DWP.3 is `source_decomposed`.
- Source: Weil I (5.12)–(5.13) and §6 (6.1)–(6.13), pp. 294–298, read in full. Every excerpt was matched against its page.

## What checkpoint 4 plans (DWP.3)

- `radical-quotient-of-the-vanishing-system` (construction, planet): the zero quotient is allowed.
- `geometrically-constant-lisse-sheaves`: Lemma 6.4.
- `zeta-of-the-fibres-and-the-pencil-factorization`: Z(X_x, t) = ∏(1 − α^{deg}t)/∏(1 − β^{deg}t) · det(1 − F_x t, ℱ₀).
- `powers-of-a-family-determine-the-family`: Lemma 6.7.
- `open-image-in-the-symplectic-similitude-group`: Lemma 6.11.
- `haar-null-exceptional-eigenvalue-locus`: Lemma 6.12, the Haar-null bridge that RS-17 asks DWP.3 to prove.
- `exceptional-frobenius-set-has-density-zero`: Chebotarev with constant-field congruences (FA.5), plus open-closed
  approximation. The node includes a per-degree statement.
- `denominators-away-from-the-exceptional-set`: Proposition 6.6.
- `divisibility-criterion`: Proposition 6.8.
- `rationality-of-pencil-local-factors` (planet): Theorem 6.2.
- `coarse-bound-for-the-pencil`: Corollary 6.3, through DWP.2.

## A point to check in review

Weil I 6.9 characterises the β-family intrinsically through Lemma 6.7, which needs, for every large admissible n,
points of degree n outside the density-zero set L. Dirichlet density zero alone does not give this, since a
density-zero set can contain every point of a sparse set of degrees. The density node therefore adds a per-degree
statement, which follows from per-degree Chebotarev with constant-field congruences (FA.5, using DWP.1). The source
leaves this implicit. It is not recorded as a source issue, because Deligne's density claim comes from Chebotarev
and plausibly already means the per-degree form.

## Requests (new)

- LefschetzPencilsAndVanishingCycles LPV.3, LPV.4 and LPV.5.
- FunctionFieldArithmetic FA.5, including the per-degree form.
- WeilConjectures WC.1: rationality of Z over ℚ.
- SchemeAndStackFoundations SF.2 and EtaleDualityAndPerverseSheaves EDC.2 now also serve DWP.3 nodes.

## Suggested Lean file

Lemma 6.7 is stated, with the pencil signatures in a comment. The file was compiled with `lake env lean` (exit 0, 33
`sorry` warnings).

## What remains

- **DWP.4.** Weil I §7, the induction on dimension.
- **DWP.5 and DWP.6.** Weil II §§1.2–1.5.
- **DWP.10.** The acceptance suite.
