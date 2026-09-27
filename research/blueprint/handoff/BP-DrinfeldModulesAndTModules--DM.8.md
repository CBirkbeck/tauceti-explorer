# BP-DrinfeldModulesAndTModules--DM.8 handoff

Author: Codex — codex-hjdg0j. Issue #1009. Status: partial.

## Completed component

Nine nodes: seven lemmas and two theorems; zero new definitions/constructions,
zero new definition API items and zero definition tests. Native Mathlib objects
supply the fixed submodule and scalar-extension map. Two planets, thirty baseline
declarations, six precise supplier requests and three stage-level gaps.
The nine-node graph is acyclic and ends entirely in the pinned baseline.
Every implementation status remains unchecked.

The component proves, at blueprint level, descent of independence for fixed
vectors of a semilinear operator with exact constant field, comparison
injectivity, finite dimensionality of the fixed space, its dimension bound and
the bijectivity criterion. It includes a unique-constant-coordinate statement.
All named signatures appear in the suggested file; twelve concrete acceptance
examples distinguish exact constants, fixedness, independence and trivialization.

## Sources and audit

Papanikolas arXiv math/0506078v2, 29 June 2007, was read completely, physical and
printed pages 1–39, in batches of at most three. Rendered pages 8,16,17,21,30,33,34
were inspected. PDF SHA-256:
`6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`.
Six preprint notation/indexing findings were recorded with corrections, reasons
and correction-search evidence. The publisher PDF endpoint returned HTML; the
version of record was not collated. All findings await independent review.

AUDIT-20 DM.8 was read before planning. The full campaign document, DM.2/DM.4
contracts, MC.6 stage and relevant candidate node statements were checked.
Thirty baseline statements were read in verified pinned source files. The
upstream GrothendieckEulerForms and JacobianChallenge documents were read in full
in this session and byte-verified unchanged. No existing DM.8 packet or decomposition
was present. The link-map screen found no stage-specific DM entry.

The ABP criterion's proof (Anderson–Brownawell–Papanikolas, Annals 160 (2004),
Theorem 3.1.1 and Proposition 3.1.3) was not read; only its statement/use in
Papanikolas was read. Lang's theorem and the analytic/scheme inputs cited by
Papanikolas need their own exact source/baseline matching.

## Resume precisely

Preserve all nine nodes and the native Lean signatures. Start with analytic
fields, coefficient inverse Frobenius and L^σ=F_q(t), then connect the native
fixed-submodule comparison to the actual motive supplied by DM.4. The six-item
coverage.remaining list and the reader's source inventory give the complete
continuation boundaries:

1. Actual analytic setup: Papanikolas §§2.1–2.2, Lemmas 2.2.6–2.2.7 and 3.3.2. Decompose restricted/entire series, coefficient inverse Frobenius, Tate algebra and fraction field, separability, fixed field L^σ=F_q(t), divisor/norm arguments and the Gauss-norm twisting limit. Search the pinned restricted/Hahn-series libraries before introducing objects.

2. Motive and Betti packaging: consume DM.4 rather than duplicating its objects; split §§3.2–3.4, the comparison construction 3.3.1, fundamental-matrix criterion and integral analytic trivialization 3.3.9(a–c), subobject/quotient exactness 3.3.11, faithfulness 3.3.13, tensor and dual comparison 3.3.14, and neutral-category theorem 3.3.15. Supply every definition API and at least three tests; identify the smaller category T of Definition 3.4.10 separately from all rigid-trivial pre-t-motives R.

3. Difference-Galois theory: decompose §§4.1–4.4 into σ-admissible fields, solution spaces, fundamental matrices, Σ, Λ, Z, Δ and Γ with APIs/tests, ideal descent 4.2.3, σ-simplicity 4.2.5, descent 4.2.7, torsor 4.2.8/4.2.11, relative algebraic closure 4.3.3, group smoothness/dimension 4.3.1 and fixed-field theorem 4.4.6. The Lang-isogeny and Riemann–Roch inputs need actual source/baseline or owner matches; geometric integrality alone does not imply smoothness for arbitrary schemes.

4. Tannakian identification: split §§4.5.1–4.5.10 into solution-ring comparisons, functorial representations, faithfulness, full faithfulness, invariant-subspace descent, subobjects and tensor generation. Import the positive-characteristic neutral reconstruction requested from MC.6. Verify scheme-theoretic faithful flatness, not only pointwise surjectivity.

5. Analytic specialization: acquire and read the proof of Anderson–Brownawell–Papanikolas, Annals 160 (2004), Theorem 3.1.1 and Proposition 3.1.3 (https://arxiv.org/abs/math/0207168; https://annals.math.princeton.edu/wp-content/uploads/annals-v160-n1-p06.pdf). Decompose these inputs, Papanikolas 5.1.5, bounded-degree tensor-monomial systems, equality of Hilbert growth, and Theorem 5.2.2. Reading their statements and invocation in Papanikolas does not establish their proofs.

6. Carlitz logarithms: decompose §§6.1–6.4. Construct L_α and X(α_i), prove the Frobenius equation and membership in T, identify the scalar-action unipotent kernel as a linear subspace with a justified smoothness argument, descend defining linear equations, prove 6.3.2(a–c), and handle the division-point reduction 6.4.1 including principal small values and exp_C(λ)=0 period inputs before 6.4.2. Include a nonzero logarithm, a dependent pair and a nontrivialization eligibility counterexample. Do not infer higher-rank independence.

## Ownership requests

- `DrinfeldModulesAndTModules:DM.2`: Supply the chosen completion C_infinity of an algebraic closure of F_q((1/θ)), the Carlitz exponential and its kernel F_q[θ]·π̃, its local inverse on |α|<q^(q/(q−1)), and compatible period normalization π̃=−1/Ω(θ). These are inputs to the actual analytic field, the rank-one test and the arbitrary-logarithm reduction, not assumptions on a generic Prop-valued object.
- `DrinfeldModulesAndTModules:DM.4`: Supply the motive types and rationalization with explicit reconciliation between the campaign contravariant τ convention and Papanikolas dual Anderson σ convention σ(c)=c^(1/q), σ(t)=t. Export the invertible semilinear pre-t-motive operator, its L-scalar extension and the F_q(t)-linear underlying map, Hom compatibility, and the appropriate abelian dual-motive image. Do not assert all t-modules are rigid analytically trivial.
- `MotivesAndAlgebraicCycles:MC.6`: For a rigid abelian neutral Tannakian category over an arbitrary field F (especially the imperfect positive-characteristic field F_q(t)) and an exact faithful F-linear tensor fibre functor to finite vector spaces, supply affine tensor-automorphism representability, reconstruction, tensor-generator finite type, fibre-functor isomorphism torsors, and the fully-faithful/subobject versus faithfully-flat and tensor-generation versus closed-immersion criteria. Current MC.6/tensor-automorphism-group and pro-algebraic-approximation require a specified diagram category and coalgebra; MC.3/tannakian-category assumes characteristic zero. None supplies the needed general input as stated. Reuse native Hopf-comodule reconstruction, then add the missing general interface in MC.6.
- `FunctionFieldArithmetic:FA.0`: Supply the chosen rational function field F_q(θ), exact constant field and its infinite-place normalization, and the smooth projective curve corresponding to a finite separable extension of the one-variable field over the perfect constant field bar(k). Export compatibility of the field/curve correspondence with the coefficient Frobenius automorphism, as needed in Papanikolas Proposition 4.3.3. Keep the analytic completion at DM.2 and the difference-field constant calculation at DM.8.
- `SchemeAndStackFoundations:SF.3`: Through the existing AlgebraicCurves/JacobianChallenge owner, supply Riemann–Roch for a smooth projective curve over bar(k) and a sufficiently large effective divisor above infinity: its L(D) is finite-dimensional and contains field generators. Export functorial transport by the coefficient automorphism for Papanikolas Proposition 4.3.3. Do not re-plan the underlying curve/Riemann–Roch theory in DM.8.
- `SchemeAndStackFoundations:SF.1`: Supply effective faithfully flat descent and detection for affine morphism equality, isomorphisms and torsor action diagrams: DM.8 constructs Σ=K[Ψ,det(Ψ)^−1] and must descend the explicit Z×Z≅Z×Γ_K relation and the group structure from faithfully flat scalar extension. This is scheme-level descent over imperfect fields, not a criterion using only rational points. Generic fibre-functor torsors remain MC.6.


Do not reuse the current MC.3 characteristic-zero neutral-category definition
for F_q(t), or assume the existing Hopf-comodule reconstruction supplies a
general neutral-category theorem. Generic reconstruction belongs in MC.6.
All requests name the stage as consumer because the nine-node component itself
has no outstanding external input.

## Checks

- Suggested file compiled: Lean v4.34.0-rc2, zero errors, twenty-one warnings,
  all placeholder-proof warnings; nine statements, twelve examples, six checks.
- All 1,649 transitive Mathlib source imports were byte-verified against the pin
  and cache; no Tau Ceti imports were needed.
- Suggested file SHA-256: `30f2e76a28629c9c078c1d06fbbfa1ac02946bd4c4c2c516ab0b34f44926b748`.
- Indexed blueprint checker: zero errors and zero warnings.
- Read-only intake: four files, zero problems; source-finding/version schema: zero errors.
- Publication guards: only the four authorized files differ from the snapshot;
  all 61 guarded paths are unchanged on fresh main; no new supplier packet;
  the winning bot claim and complete issue instructions still match.
- All nine named statements are present; twelve examples and six native checks
  match the reader. The packet has twenty-eight theorem acceptance conditions.

The stage is not complete. Do not report the period/logarithm theorems,
Tannakian category or difference-Galois theory as decomposed or implemented.
