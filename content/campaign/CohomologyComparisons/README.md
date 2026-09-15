# Cohomology comparisons: integral diagrams and rational period realizations

## Purpose and proof ownership

Make the comparison maps commute on the same geometric objects and prove the
arithmetic consequences with their exact integral hypotheses. This is not a
second construction of crystalline, derived de Rham, AΩ or prismatic cohomology.
Those owners build their local comparison maps; CP verifies their compatibility,
constructs the rational period-realization assembly, and supplies uniform
torsion, lattice and representation-theoretic exports.

A theorem of existence of some isomorphism is insufficient: the map must respect
base change, products, Frobenius, Galois action, filtrations and, where present,
monodromy. Do not identify a derived base-change theorem with a degreewise
tensor identity. Perfectness of a complex does not mean all its cohomology
modules are finite free.

The initial arithmetic class is smooth proper formal schemes over O_K with
K complete discretely valued of mixed characteristic and perfect residue field;
the integral geometric A_inf class is smooth proper over O_C with C complete
algebraically closed. The log branch uses the precise proper semistable models
of Cesnavicius–Koshikawa. The independent rigid B_dR^+ branch uses proper smooth
adic spaces over C. Broader nonproper, singular or log-prismatic statements
retain the hypotheses of their individual source owner.

<a id="cp-0"></a>

## CP.0. Common objects, coefficient maps and normalization

Build comparison functors between the chosen formal scheme, its special fiber,
its adic/rigid generic fiber and their scheme/pro-étale/log sites. Reuse the
existing formal completion and analytification results; prove algebraic versus
formal proper-cohomology comparison where needed. Fix compatible geometric
points and record the distinction between base change to O_C and reduction
to the algebraically closed residue field.

Create the normalization dictionary for theta, tilde-theta, xi, tilde-xi,
mu, Witt reduction, the Breuil–Kisin uniformizer, arithmetic/geometric
Frobenius and HT(chi_p)=+1. Construct all ring maps to A_cris, B_cris,
B_st and B_dR from the shared objects of AI.0, CR.0 and PadicHodgeTheory.
There is no natural section C→B_dR^+; do not define a canonical deformation
as H_dR tensor_C B_dR^+.

Prove the compatibility of Tate, BK and filtration twists and of scalar
extension with semilinear linearization. This is also the common source
of conventions for R07, local deformation, Galois representations and
the K/Habiro specialization interfaces.

<a id="cp-1"></a>

## CP.1. The integral derived comparison diagram

For K_A=RΓ_Ainf(mathfrak X), instantiate and compare the following maps on
the actual smooth proper O_C-formal scheme.

| Coefficient operation | Compared object | Construction owner |
| --- | --- | --- |
| derived theta base change to O_C | formal de Rham cohomology | AI.4–5 |
| derived tilde-theta reduction | Hodge–Tate complex with BK-twisted differential-form cohomology | AI.4 |
| derived Witt reduction | crystalline cohomology of the special fiber | AI.4–5, CR.2–4 |
| derived base change to A_cris | crystalline cohomology of mathfrak X_(O_C/p) over the PD base | AI.4 |
| mu-inversion | generic-fiber Z_p étale cohomology tensor A_inf[1/mu] | AI.4–5 |
| phi_A-pullback of relative prismatic cohomology for ker theta | K_A itself | PR.6 |

Prove commutativity of the overlaps by the original polynomial/torus maps,
PD universal properties and BS22 §18's uniqueness argument in its valid
range. Preserve Bockstein/de Rham differential and the enhanced multiplicative
structure; an identification of graded groups is not enough.

Transport the relative bounded-prism crystalline/de Rham/Hodge–Tate comparisons
through these maps. Record that the crystalline and de Rham comparisons use
phi-twisted base change whereas Hodge–Tate uses ordinary reduction.
Derived tensors and derived completion are retained on singular/nonflat bases;
the table does not assert each row exists for every animated formal scheme.

Acceptance: O_C, the torus, a proper smooth curve, a crystalline prism and
the two theta maps on one A_inf coefficient system.

<a id="cp-2"></a>

## CP.2. Rational crystalline comparison and descent

For a smooth proper formal O_K-model construct the chain of maps from
AI.4's absolute A_cris comparison and mu-inverted étale comparison to
RΓ_et(X_C,Q_p) tensor B_cris ≃
RΓ_crys(X_k/W(k))[1/p] tensor_(W(k)[1/p]) B_cris.
Prove the relevant crystalline change-of-base/invariance statement after
p-inversion; do not infer it integrally or assert it from special-fiber
point counts. Carry any auxiliary residue-field section through the proof
and prove that the final descended map has the claimed independence.

Prove G_K/Frobenius compatibility, multiplication and compatibility with
the de Rham filtration through CP.3. Use perfectness and rational flatness
to pass to individual cohomology groups, and verify the period invariants
needed to identify D_cris with the actual crystalline cohomology.
PadicHodgeTheory R06.2 owns those period invariant/admissibility theorems;
R06.5 imports this geometric comparison instead of rebuilding it.

Acceptance: a good-reduction elliptic curve, ordinary and supersingular
Frobenius, and a proper smooth formal example not presented as a projective
scheme. Sources: BMS1 §§12–14, Theorem 1.1(i), BS22 basic comparisons.
No integral B_cris analogue asserting equality of lattices follows.

<a id="cp-3"></a>

## CP.3. Canonical B_dR^+ deformation and de Rham comparison

For a proper smooth adic space X/C construct the canonical B_dR^+-valued
deformation of de Rham cohomology by the infinitesimal/PD-style embedding
system of BMS1 §13, with the completed tensor and coordinate-independence
proof. Prove finite freeness in the source scope, theta reduction and the
comparison after B_dR-inversion with p-adic étale cohomology. A free
B_dR^+-lattice chosen arbitrarily inside étale cohomology is not this
construction.

When X descends to a proper smooth X_0/K, compare that deformation with
H_dR(X_0/K) tensor_K B_dR^+ and prove agreement with the rational
pro-étale period-sheaf construction supplied by PadicHodgeTheory
P8:local-rational (sheaves, local acyclicity and Poincare lemma). P8's later
proper-comparison application consumes this CP.3 theorem, not conversely.
Use the corrected structural B_dR^+ sheaf: p-complete the integral tensor
before p-inversion, then kernel-of-theta completion and sheafification.

Prove filtration strictness and the Hodge–Tate/de Rham spectral-sequence
comparisons in characteristic zero, with proper smoothness and convergence.
The resulting degeneration does not assert integral degeneration for a
characteristic-p model. Sources: BMS1 Theorem 1.7/§13 and the corrected
Scholze relative period-sheaf argument.

<a id="cp-4"></a>

## CP.4. Semistable, logarithmic and monodromy comparison

Use AI.6's semistable A_inf theory and CR.6's actual Hyodo–Kato complex
to construct the B_st comparison for proper flat semistable O_K-formal
models. Prove compatibility with G_K, Frobenius, monodromy and filtration
after the map B_st→B_dR determined by the convention. In cohomological
grading verify N phi=p phi N and compute the change-of-uniformizer
formula before claiming independence of the comparison as a descended
period statement.

Prove compatibility of the absolute log-crystalline A_cris map with the
B_dR^+ deformation from CP.3; this is the step that gives filtration
compatibility, not merely an isomorphism of vector spaces.
Transport to the admitted algebraic models by formal comparison.
Sources: Cesnavicius–Koshikawa §§5–6,9; Hyodo–Kato §§3–5.

Compare the overlapping semistable examples with PR.8's log-prismatic
maps, retaining Cartier-type and perfect-log-prism hypotheses.
Kummer-étale and ordinary étale generic-fiber cohomology agree only after
the relevant log-structure comparison. This does not prove an integral
semistable theorem in arbitrary weights, a semistable F-crystal
classification not supplied by a source, or weight–monodromy.

Acceptance: good reduction recovers CP.2 with N=0; a Tate/nodal curve
detects N; changing uniformizer changes the auxiliary map but commutes
with the proved correction.

<a id="cp-5"></a>

## CP.5. Integral torsion inequalities and lattice recovery

From AI.5's BKF linear algebra prove, for every n≥1 and degree i in the
proper smooth DVR case, the inequality between the length of the
crystalline p-primary torsion modulo p^n over W(k) and the corresponding
étale torsion modulo p^n over Z_p, with crystalline length the upper
bound. Prove the mod-p de Rham dimension bound by the derived base-change
spectral sequence. Torsionfree crystalline H^i implies torsionfree étale
H^i; the converse is not asserted.

For reconstruction of the crystalline lattice from the G_K lattice retain
the torsionfree hypotheses in degrees i **and i+1** of BMS1 Theorem 1.1(iii)
and the actual Kisin/BKF comparison. If a stronger theorem in a special
case is used, state its separate proof. Do not infer a subquotient relation
from the length inequality: BMS1 §2 explicitly supplies counterexamples.

In the semistable branch prove the analogous CK §§7–8 statements with
their log-de-Rham/crystalline torsion assumptions, ramification-normalized
length factors and functorial lattice theorem. A model-independent lattice
is a conclusion under those assumptions, not a default property of all
integral de Rham cohomology.

For the small-weight Fontaine–Laffaille/Breuil–Kisin regimes compare with
R07's classified integral objects and prove the normalization agreement.
These are applications of the common maps, not a second classification.
Acceptance includes both strict torsion inequalities and the adjacent-degree
condition; exclude test specifications that force all examples to be free.

<a id="cp-6"></a>

## CP.6. Reusable coefficient, product and arithmetic exports

Package naturality under base change, products, duals, cup products and the
trace/Gysin operations for which the requisite proper smooth/crystalline
duality has been proved. Compare first Chern classes of line bundles under
the étale Kummer, de Rham dlog, crystalline PD and prismatic logarithm
maps, including twists; extend higher classes/projective bundle formulas
through the source's actual splitting construction. RefinedTraceMethods
owns the cyclotomic Chern character and proves its compatibility with this
same diagram, not an unnamed substitute regulator.

Return geometric crystalline/semistable/de Rham Galois consequences to
PadicHodgeTheory R06.6, R07 and AutomorphicGaloisRepresentationsPartII.
Finite-flat small-weight conclusions still need R07's range/ramification
conditions; the general derived comparison does not erase them.
Habiro consumers receive the precise p-adic and q=1 specialization
diagrams, not an unconditional identification of analytic and algebraic
Habiro cohomology.

A completed milestone includes a map-level test suite, source theorem
number/version, exact hypotheses and proof of the claimed commutative
squares. Suggested.lean checks elementary coefficient-map
composition; advanced cohomology is not represented by an axiom or a
placeholder proposition. See the source register.

## Completion contracts added on 2026-09-15

**Applies to:** `CP.0`, `CP.1`, `CP.4`, `CP.5`, `CP.6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For each arrow record its coefficient map as well as source/target complexes. Prove compatibility first on common framed/PD charts, then use descent to globalize the same transformation. In CP.4 carry the uniformizer-dependent B_st→B_dR map and compute its correction; in CP.5 use the actual base-change spectral sequence to account for neighboring-degree torsion.

### Producer–consumer contract

Supply a single comparison square for Chern classes, cup product and trace after the corresponding crystalline trace is constructed. There is no implicit general finite-field crystalline-versus-ℓ-adic polynomial comparison: PadicDifferentialEquationsAndRigidCohomology RD.7 owns its independent proof route.

### Acceptance and source route

Use a Tate curve with N nonzero and good reduction with N=0. Check Nφ=pφN before and after coefficient transport, and a torsion example where naive degreewise tensor loses information.

**Source route:** BMS1 Theorem 1.8; CK §9.1–9.2; BS22 Theorem 1.8. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
