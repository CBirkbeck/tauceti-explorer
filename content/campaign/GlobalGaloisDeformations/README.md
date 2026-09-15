# Roadmap: Global Galois deformation rings

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.

Construct global deformation problems over number fields, compare them with their local counterparts, and prove the presentation and auxiliary-prime results required for modularity lifting and global characteristic-zero lifts.

## Existing material and ownership

Consume R01 for actual representations, R02 for canonical cohomology and duality, and R03 for complete local coefficient categories and representability. General class field theory, ramification theory and finite-subgroup classification remain with their existing or R01 owners. Local p-adic Hodge conditions and the geometry of their rings belong to R08.

## Conventions

A deformation problem includes the finite ramification set, residual representation, determinant lift, coefficient ring, framed places and local deformation conditions. Each local condition has a verified functorial meaning. Do not assert unframed representability without the residual endomorphism hypothesis; framed problems remain available in the exceptional cases.


<a id="r04-1"></a>

## R04.1. Deformation functors

**Milestone:** `R04.1`

Define framed and strict-equivalence unframed deformations over Artinian coefficient rings, continuity, determinant-fixed variants and change of coefficients. Prove that the local equivalence relation is the intended conjugacy relation and that restriction is well-defined. Give a separate determinant/pseudorepresentation deformation functor for residual situations where it is needed; it is not automatically equivalent to representation deformations.

**Dependencies:** [ArithmeticGaloisDuality R02.2](../ArithmeticGaloisDuality/README.md#r02-2); [ArithmeticGaloisRepresentations R01.1](../ArithmeticGaloisRepresentations/README.md#r01-1); [DeformationAndDerivedPatchingAlgebra R03.1](../DeformationAndDerivedPatchingAlgebra/README.md#r03-1); [DeformationAndDerivedPatchingAlgebra R03.2](../DeformationAndDerivedPatchingAlgebra/README.md#r03-2).

<a id="r04-2"></a>

## R04.2. Representability and universal representations

**Milestone:** `R04.2`

Verify the finiteness hypotheses on G_{F,S} and prove existence of universal framed rings, and unframed rings under absolute residual irreducibility. Construct the universal continuous representation over the inverse-limit ring. Compare framed and unframed rings by formally smooth power-series maps with the correct number of variables. Track changes in determinant and residual coefficient field.

**Dependencies:** R04.1 (preceding layer).

<a id="r04-3"></a>

## R04.3. Local conditions and global presentations

**Milestone:** `R04.3`

Construct the global ring as the appropriate completed fibre product/quotient with prescribed local rings. Prove tangent and obstruction descriptions by the actual adjoint cohomology and the local conditions. Establish the lower bound on global dimension and the bound on the number of relations over the completed tensor product of local rings, in the form of KW II §4, particularly Proposition 4.5 and Corollary 4.7.

**Dependencies:** [ArithmeticGaloisDuality R02.6](../ArithmeticGaloisDuality/README.md#r02-6); [GlobalGaloisDeformations R04.2](README.md#r04-2); [LocalGaloisDeformationRings R08.1](../LocalGaloisDeformationRings/README.md#r08-1).

<a id="r04-4"></a>

## R04.4. Restriction, twisting and change of problem

**Milestone:** `R04.4`

Prove the ring maps associated to restriction to a finite extension, enlarging the ramification set, changing determinant, and twisting by characters. Verify the finiteness and closed-immersion statements needed for descent. Treat p=2 diagonalizable twisting groups and inertia-rigidified deformations in the form used by KW II, including their stabilisers. Finite flatness of a ring map is a theorem, not a default consequence of restriction.

**Dependencies:** R04.3 (preceding layer).

<a id="r04-5"></a>

## R04.5. Taylor–Wiles auxiliary primes

**Milestone:** `R04.5`

Combine Chebotarev, residual-image lemmas and dual Selmer calculations to choose primes with prescribed Frobenius eigenvalues and q≡1 mod p^n. Prove the required dual-Selmer dimension reduction and uniform bound on the number of primes. Keep the p>2 and p=2 constructions separate where the source does. Adequacy, cyclotomic absolute irreducibility and enormous image are different hypotheses: use the one required by the chosen theorem and verify it in the consumer; no automatic implication between them is assumed.

**Dependencies:** R04.4 (preceding layer).

<a id="r04-6"></a>

## R04.6. Arithmetic exports for patching and global lifts

**Milestone:** `R04.6`

Package the global-to-local presentation with its explicit numerical terms, maps and universal representations. Supply the deformation problems used in KW II §§9–10, including the real-place data at p=2. Prove compatibility of all chosen primes and local conditions with the later specialisation. Global finiteness over O is not claimed here: its automorphic proof is R24, after the modularity and potential-modularity inputs are available.

**Dependencies:** R04.5 (preceding layer).

## Required examples and checks

Check unrestricted framed deformations of a finite quotient, a determinant-fixed odd problem over Q, and the change of a single Taylor–Wiles prime. Include a residual representation whose endomorphisms obstruct unframed representability.



## References

MAZUR89, KW2. The bibliography records what was inspected and what remains to be transcribed.

<a id="g7"></a>

## G7. Polarized dimension-n deformation problems

For a CM extension F/F⁺ construct the polarized deformation functor from the actual pairings/multiplier in ArithmeticGaloisRepresentations G7, with unrestricted framed deformation as its ambient functor. Include fixed determinant/multiplier variants, local framing, complex conjugation and coefficient extension. Prove the correct tangent and obstruction spaces through ArithmeticGaloisDuality D7; record the failure of naive scalar/traceless splitting when p divides n.

Treat local deformation conditions as representable subfunctors or quotient rings with a proved point criterion. Construct global-to-local morphisms and presentations over completed tensor products, separating p-torsion-free quotients from their reduced generic fibres. Prove the arbitrary-n auxiliary-prime lemma with prescribed distinct Frobenius eigenvalues and chosen eigenspaces, q_v≡1 mod p^N, disjointness from S and control of dual Selmer. For ACC+ Proposition 6.2.33 require F=F⁺F₀ with F⁺ totally real and F₀ imaginary quadratic, ζ_p not in F, and enormous image of the residual restriction to G_F(ζ_p) in Definition 6.2.29; adequacy alone is not the stated hypothesis. With T=S and q at least the indicated dual-Selmer dimension, construct exactly q primes, with the underlying rational primes split in F₀, and the local-to-global presentation with g=qn−n²[F⁺:Q] variables. Export the auxiliary diamond group and its exact rank/bounds to complex patching. The fixed-determinant and polarized alternatives must recompute their tangent dimensions rather than borrow this variable-determinant count.

<a id="g8"></a>

## G8. Determinant-variable global problems

Construct the arbitrary-rank unpolarized problem with variable determinant, alongside fixed-determinant and polarized variants. For ACC+ Definition 6.2.2 use Λ=completed tensor product of the local Λ_v, absolutely irreducible residual representation and p∤2n; its local subfunctors are quotient-representable and invariant under strict conjugation. The determinant is not fixed in that definition. Prove representability as in Theorem 6.2.3 and the T-framing comparison of Lemma 6.2.4 with n²|T|−1 variables for nonempty T. State the maps between this problem and fixed determinant as separate theorems, with formal smoothness and variable counts proved under their actual hypotheses.


## Implementation handoff: Universal rings and arithmetic auxiliary primes

**Stages:** R04.1, R04.2, R04.3, R04.5, G7, G8. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct framed functors on Artinian coefficient rings, strict conjugacy and the universal inverse-limit representation before tangent-space formulas. The comparison map to completed local tensor products must specify which determinant/multiplier variables are retained. Derive the relative presentation count from the precise adjoint Selmer complex rather than transporting a number across deformation conventions.

**Acceptance and consumer contract.** For one Taylor–Wiles prime prove the selected eigenline, diamond group, local condition and dual-Selmer change simultaneously. Rank n with p dividing n must use the correct scalar/trace-kernel modules. G7 enormous-image and G8 variable-determinant hypotheses are distinct checked inputs; application records include the exact field disjointness and real-place conditions.

## Source anchors and prototype coverage

- GlobalGaloisDeformations source targets.

The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
