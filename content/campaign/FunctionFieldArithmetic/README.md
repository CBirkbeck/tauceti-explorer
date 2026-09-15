# Global function fields, reciprocity and automorphic foundations

## Scope and status

Fix a smooth projective geometrically connected curve C over its exact finite constant field F_q and K=F_q(C). Distinguish separable extensions, constant-field extensions and purely inseparable extensions throughout. This owns the global function-field branch omitted by the original campaign; number-field archimedean arguments cannot be imported unchanged.

Status: curriculum specification, with established theorem targets and explicitly source-gated extensions. This document does not certify formalized proofs or a complete proof-interior source audit. Each AI proof ticket must replace its source route by an inspected theorem/lemma locator, enumerate intermediate lemmas, search the pinned library, and prove the actual geometric or analytic object has the exported properties. A structure field assuming the conclusion is not completion.

## Stages

### FA.0. Curves, fields and constants

**Inputs:** `FoundationsAndLibraryIntegration:LI.4`, `SchemeAndStackFoundations:SF.3`.

**Construction and export:** Construct normalization of a projective model and the contravariant correspondence between one-variable function fields and smooth projective curves over a perfect field. Identify closed points with discrete valuations trivial on constants. Prove the exact constant field is finite and geometrical connectedness follows after choosing it. Export finite morphisms for finite field extensions, with a separate inseparable degree and induced residue-field maps.

**Acceptance:** Recover P^1 from F_q(t), and show that F_{q^m}(t) viewed over F_q does not satisfy the exact-constants/geometric-connectedness contract.

**Source route:** Rosen Chapters 5 and 8; SF.3 normalization and curves.

### FA.1. Divisors, differentials and Riemann--Roch

**Inputs:** `FunctionFieldArithmetic:FA.0`.

**Construction and export:** Construct effective divisors, degree weighted by residue degrees, the principal divisor product formula, spaces L(D), canonical divisors and residue maps. Transport the curve Riemann--Roch theorem with its dimension convention to explicit function-field linear algebra. Prove finiteness of Pic^0(F_q), distinguish rational divisor classes from selected rational points, and obtain bases of L(D) from certified presentations when an algorithm is claimed.

**Acceptance:** Compute L(n infinity) on P^1 and the residue theorem for a rational differential; test a curve with no chosen F_q-point so no degree-one base point is silently assumed.

**Source route:** Rosen Chapters 5--6; SF.3 curve Riemann--Roch.

### FA.2. Adeles, ideles and global Fourier analysis

**Inputs:** `FunctionFieldArithmetic:FA.1`.

**Construction and export:** Build the restricted product from local completions and their valuation rings, prove local compactness and discreteness/cocompactness of K in its additive adeles, and define the idele degree map. Use a nonzero rational differential to construct compatible local residue characters and self-dual Haar measures; establish the global residue pairing and Poisson summation. Export the compact degree-zero idele class group separately from the noncompact degree direction.

**Acceptance:** On F_q(t), check the annihilator of K is K, the product formula, and how changing the differential rescales local measures while preserving the global identity.

**Source route:** Rosen function-field divisor/idele route; Tate thesis and Weil Basic Number Theory as registered campaign analytic sources.

### FA.3. Ramification and positive-characteristic extensions

**Inputs:** `FunctionFieldArithmetic:FA.1`.

**Construction and export:** For finite separable K extensions construct integral closures, decomposition/inertia groups, different and discriminant, lower and upper ramification filtrations, and Riemann--Hurwitz including the wild different. Prove Artin--Schreier and Witt-vector descriptions of cyclic p-power extensions with their equivalence relations. Treat purely inseparable extensions by Frobenius separately: they do not have the same Galois group, different formula or etale-cover interpretation.

**Acceptance:** Compare an unramified constant extension, a tame Kummer cover with roots-of-unity hypotheses, and y^p-y=t^{-m} with p not dividing m; verify the wild conductor.

**Source route:** Rosen Chapters 7--9; campaign local-field ramification API.

### FA.4. Local and global class field theory

**Inputs:** `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.3`.

**Construction and export:** Specialize and prove the local reciprocity construction for F_{q^d}((t)); then construct the global reciprocity map from ideles, show principal ideles act trivially, and identify every finite abelian quotient by its norm subgroup. State the infinite reciprocity result using profinite completion or dense image, not an isomorphism from the uncompleted idele class group. Relate the degree map to the Galois group of constants and establish ray class fields with conductor data.

**Acceptance:** An unramified constant extension checks the Frobenius/degree sign; the Carlitz cyclotomic example is a later comparison, not an input assumed in reciprocity.

**Source route:** Rosen Chapters 9 and 12; campaign class-formation/Tate-cohomology proof route, specialized with explicit local invariants.

### FA.5. Zeta functions, Artin factors and Chebotarev

**Inputs:** `FunctionFieldArithmetic:FA.3`, `DeligneWeightsAndPurity:DWP.1`.

**Construction and export:** Construct Euler products by closed-point degree, identify the curve zeta function and its numerator using the independent curve Weil theorem, and prove the Riemann--Roch rationality route. For finite Galois covers construct Artin local factors on inertia invariants, including ramification. Prove a function-field Chebotarev statement retaining the congruence restriction on degrees imposed by constants; state error terms only with genus/conductor and representation dimension recorded.

**Acceptance:** A constant-field extension must give zero primes in incompatible degree classes; a quadratic curve cover tests the ramified factor and genus-dependent error.

**Source route:** Rosen Chapters 8--9; DWP.1 and the campaign Grothendieck trace formula for sheaf refinements.

### FA.6. Reductive-group automorphic forms over K

**Inputs:** `FunctionFieldArithmetic:FA.2`, `FunctionFieldArithmetic:FA.4`, `ReductiveGroupsPartII:RG2.4`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Construction and export:** Construct G(K)\G(A_K), compact-level functions, central characters, constant terms and cuspidal subspaces. Prove reduction-theoretic finiteness of cuspidal spaces after fixing level and central character or quotienting the split degree-center by a lattice. Define Hecke correspondences and the unramified Satake dictionary with normalized Frobenius. Export complex or characteristic-zero ell-adic coefficient models, with descent of eigenvalues stated separately. Build function-field-specific reduction and finiteness instead of importing an archimedean Harish--Chandra proof.

**Acceptance:** GL_1 reduces to class field theory; for GL_2 check finite-dimensional cusp space at fixed level and the noncompact degree-center before its quotient.

**Source route:** Rosen arithmetic prerequisites; Vincent/Laurent Lafforgue automorphic setup; original ES7 function-field and local representation source routes.

### FA.7. Explicit arithmetic and downstream contracts

**Inputs:** `FunctionFieldArithmetic:FA.4`, `FunctionFieldArithmetic:FA.5`, `FunctionFieldArithmetic:FA.6`.

**Construction and export:** Package divisor arithmetic, ray characters, conductors, L-polynomials and normalized local completions as independently checkable data. Provide certified finite-field factorization, place enumeration and Riemann--Roch linear algebra; complexity claims require a stated representation and cost model. Export FA.6 to ES7:function-field-automorphic and to global shtukas. Distinguish these global fields from the local equal-characteristic fields used by Fargues--Scholze; the comparison records a chosen place and its completion.

**Acceptance:** Work out F_q(t), one hyperelliptic curve with admissible characteristic, a constant extension and a wild cover end to end, including a machine-verifiable L-polynomial certificate.

**Source route:** Rosen Chapters 5--9 and explicit examples; downstream source reconciliation belongs to the consuming stages.

## Sources and readiness

- **ROSEN:** [Rosen, Number Theory in Function Fields](https://link.springer.com/book/10.1007/978-1-4757-6046-0). Publisher contents inspected; chapter routes selected, proofs not audited.
- **EXISTING:** Campaign primary source registry. Reuse precise source routes and bounded inspection ledger in cohomology_review.json; existing references do not mean existing proofs.

## Integration and completion

The machine-readable stage graph is in cohomology_extensions.json. Preserve each stage identifier when refining tickets. Construction examples are acceptance obligations, not claims of currently available Lean declarations. `Suggested.lean` records the implementation discipline without introducing axioms or placeholder theorem proofs.
