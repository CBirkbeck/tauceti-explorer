# Lefschetz pencils, nearby cycles and vanishing cycles

## Scope and ownership

Construct the actual geometric suppliers for Deligne's proof and for the
campaign's degeneration applications: nearby/vanishing-cycle functors, their
inertia actions and local calculations, sufficiently ample Lefschetz pencils,
the vanishing-cycle representation and the independent open-monodromy theorem.
Later stages provide perverse exactness and the source-qualified invariant-cycle
and semistable-curve interfaces. This substantially expands the former R34.3–4
outline; those identifiers become import interfaces, not a second construction.

The seven PR196 roadmaps
own the coefficient category, fundamental group, ordinary and compact-support
base change, lisse higher direct images and the Frobenius trace formula.
[EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md)
(EDC) owns trace, duality, cycle classes, weak Lefschetz, projective-bundle and
blowup formulas, and the scheme perverse category. LPV proves the genuinely new
degeneration geometry and its compatibility with those objects. DWP owns weight
bounds and hard Lefschetz; neither is assumed by LPV.0–5.

Adic/scheme nearby-cycle comparison and Shimura compactification-specific
statements remain with ClassicalAdicEtaleCohomology H1/H5, AdicCoefficientsAndComparisons
L5, IgusaVarietiesAndTorsionConcentration IG.3–4 and the relevant integral-model
owners. LPV supplies their **scheme** functors and local calculations, not an
automatic comparison for every analytic space. EDS supplies higher coherent
categories; no unrelated abstract nearby-cycle object substitutes for the
functor defined on the actual geometric sites.

## Conventions that must survive every theorem

Use ℓ invertible on the geometric bases and first finite prime-to-residue-
characteristic coefficients, then the normalized integral/rational adic models
of PR196. Specify an excellent henselian trait, its geometric generic and closed
points and specialization where those are needed; distinguish total-space,
generic-fiber and special-fiber dimensions. A geometric generic point is a
choice, with natural transport, not a canonical algebraic closure.

Let the smooth fiber of a pencil have dimension n; the original smooth
projective variety has dimension n+1. In the odd-n branch, local monodromy is
symplectic/transvection-type; this branch works in characteristic 2 and suffices
for the Weil I induction. Deligne I §5.8 excludes **p=2 and n even** from its
tame orthogonal formula. Do not delete that condition, silently invert 2, or
infer nondegeneracy of the polar bilinear form from smoothness of a quadric in
characteristic 2. The vanishing cycle is determined only up to the actual
orientation/sign or rank-one twist ambiguity.

The early monodromy object is E/(E∩E^⊥), not E presumed nondegenerate.
Both E=0 and a nonzero radical are allowed. Monodromy-purity, hard Lefschetz
and decomposition are downstream theorems. A universal semistable reduction
or weight–monodromy theorem over mixed-characteristic fields is not an input.

<a id="lpv-0"></a>

The nondiscrete valuation-base seam is owned by ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles and H1:formal-adic-comparison, following Huber §§3.5,4.2. LPV.0–2 supply the excellent henselian-trait specialization and its compatibility, not the entire valuation-ring theory. Compare the actual site maps, coefficient restrictions and base-change morphisms on their common domain. Huber’s terminology “vanishing cycles” in this interface denotes RΨ; it must not be confused with the cone RΦ used here.

## LPV.0. Nearby and vanishing cycles on actual sites

Construct the geometric generic/special-fiber diagram over a henselian trait,
the corresponding site morphisms and RΨ_f, with its continuous inertia action.
Realize RΨ_f through the standard geometric generic-fiber direct image and
special restriction, or its equivalent oriented-product-topos construction;
prove the equivalence and stalk formula. Identify stalks with cohomology of
strict-local geometric Milnor fibers. Construct specialization and the triangle
i*K→RΨ_f(j*K)→RΦ_f(K)→, functorially on the source coefficient category.

Prove proper pushforward compatibility, smooth base change, restriction to
opens, finite coefficient change, and bounded constructibility for the
specified excellent finite-type trait setting. Base change is a constructed
transformation and is only an isomorphism under its proved hypotheses; it is
not asserted for arbitrary morphisms of bases. Show smoothness/local acyclicity
gives the expected vanishing-cycle vanishing, and compare with PR196's earlier
local-acyclicity definition. Prove the long exact specialization sequence from
the actual triangle, including inertia and Galois equivariance.

Sources: SGA 7 II XIII §§1–2 and its formalism; SGA 4½ [Th. finitude] for
the requisite constructibility; PR196 EtaleBaseChange Layers 3–8.
Acceptance: a smooth family, a disjoint union and a nodal trait family; test
the direction of specialization and the shift in the vanishing triangle.
No Frobenius weight statement is needed.

<a id="lpv-1"></a>

## LPV.1. Inertia, variation and the monodromy operator

Construct tame/wild inertia and the tame character t_ℓ:I→Z_ℓ(1) using the
existing ramification and roots-of-unity APIs. Compare geometric actions on
the nearby-cycle complex with the induced actions on cohomology. Construct
the canonical/variation morphisms and prove their composition identities
with T−1 in the chosen tame-generator convention, retaining Tate twists.

For a proved unipotent action, define N through the finite logarithm and prove
nilpotence, independence under change of a tame generator after interpreting
N:V→V(-1), and exp(t_ℓ(σ)N)=ρ(σ). Prove the quasi-unipotence theorem in the
geometric coefficient setting actually used, with finite-extension reduction,
wild inertia and continuity checked. An arbitrary continuous representation
over an algebraically closed residue field is not declared quasi-unipotent.
This is the geometric supplier, while ArithmeticGaloisRepresentations owns
the general Weil–Deligne carrier and conductor of an arithmetic representation.

Construct the uniquely characterized monodromy filtration centered at a
specified integer: N lowers the filtration by two and N^r identifies opposite
graded pieces with the appropriate twist. Prove this linear algebra and its
functorial properties independently of any claim that these pieces have the
corresponding Frobenius weights. Sources: SGA 7 I I/VI for geometric monodromy,
SGA 7 II XIII, and the linear-algebra conventions in Deligne II §§1.6–1.7.
DWP.5 owns the later local **weight** estimates; it imports this N and filtration.

<a id="lpv-2"></a>

## LPV.2. Ordinary quadratic singularities and Picard–Lefschetz

Define an ordinary quadratic singularity using the completed/étale local
hypersurface equation and a smooth projective tangent quadric. Construct the
quadratic-form and local-model equivalences, including the characteristic-2
distinction between a nonsingular quadric and a nondegenerate polar form.
Compute the required quadric cohomology and local nearby/vanishing cycles;
prove concentration in the middle degree and identify the rank-one vanishing
module, its twist, variation pairing and orientation ambiguity.

For a proper morphism from a regular (n+1)-dimensional trait scheme, smooth
outside one ordinary quadratic singularity of the special fiber, prove
specialization is an isomorphism outside degrees n and n+1 and construct the
exact five-term sequence in those degrees. In the odd-n case prove the
Picard–Lefschetz formula
ρ(σ)x=x+ε_n t_ℓ(σ)⟨x,δ⟩δ,
with ε_n fixed by the intersection/trace convention and the necessary twists.
In the even-n tame branch prove the quadratic-character reflection formula
under p≠2. Verify the n mod 4 sign table against complex comparison rather
than choosing a convenient unrecorded sign.

Treat δ=0 explicitly: the exceptional skyscraper contribution is in degree
n+1, not a nonzero middle local system. Prove compatibility with finite
extension of the trait and with proper global cohomology. Sources: SGA 7 II
XII–XV; Deligne I 4.1–4.4. The complex Milnor-fiber comparison is an optional
verification through PR196 ComplexComparison and SGA 7 XIV; the all-characteristic
algebraic proof may not assume a characteristic-zero lift of every degeneration.

<a id="lpv-3"></a>

## LPV.3. Existence of sufficiently ample Lefschetz pencils

Construct the dual projective space, incidence variety, conormal/dual variety,
axis and pencil parameter line. Prove openness of the required transversality,
smooth-axis and ordinary-singularity conditions by actual tangent-space and
jet-separation calculations. Starting with a smooth projective geometrically
connected X, prove existence over an algebraically closed field after a
Veronese embedding of degree r≥2 in the source's theorem; a particular original
embedding need not admit a Lefschetz pencil in positive characteristic.

Identify the incidence total space with the blowup along the smooth
codimension-two axis, prove the total space smooth, the morphism projective,
and the singular-value set finite with one ordinary quadratic singularity in
each singular fiber. Include the source's dimension/connectivity reductions
and treat low-dimensional/empty-axis cases separately. All objects are actual
schemes and morphisms, not a finite family of cohomology groups labeled “pencil.”

Over F_q, prove a nonempty admissible open has a point over some finite
extension and descend all finite-presentation data. Do not assert it has an
F_q-point. Give DWP.4 the exact base-extension/Frobenius-power interface used
in Deligne I §7.1. Source: SGA 7 II XVII; Deligne I 5.6–5.7. The private
packet C001's jet/quadratic checklist is reused only after comparison with
these source hypotheses. Acceptance includes an embedding needing replacement
and a characteristic-2 odd-fiber-dimension pencil.

<a id="lpv-4"></a>

## LPV.4. Global vanishing cycles and middle-degree reduction

For LPV.4–5 fix coefficients **Q_ℓ**, and write E for the vanishing-cycle
subspace, not a coefficient extension. On U=P¹−S construct R^n f_*Q_ℓ as a lisse sheaf through PR196 base change,
with its cup-product pairing. Transport local vanishing cycles along explicit
étale paths. Define E as their span and prove independence of path choices as
a monodromy-stable subspace, not independence of the individual oriented
vectors. Prove the locally constant descriptions of R^i f_*Q_ℓ for i≠n in the
nonzero case and the separate degree-(n+1) skyscraper sequence when all
vanishing cycles vanish.

Construct E^⊥, identify the common fixed space of the local transvections,
and prove the pairing descends nondegenerately to E/(E∩E^⊥), with the
symplectic/symmetric distinction in dimensions n odd/even. The equality of
E^⊥ with **global** geometric-monodromy invariants is completed in LPV.5
after its tame-generation argument, not assumed before that argument.
Use EDC.4's blowup/projective-bundle maps to form the Leray and restriction/Gysin
comparisons needed for dimension induction, with all lower-dimensional
summands identified. Do not assume degeneration of a general Leray sequence,
hard Lefschetz, or the SGA 7 XVIII condition (A)/(LV) before it is proved.
The Deligne I argument needs the radical quotient precisely to avoid that shortcut.

Sources: Deligne I 5.8–5.9 and §§6–7; SGA 7 II XVIII §§1–4 and the applicable
parts of §6. Acceptance: zero vanishing cycles, a nontrivial radical, and a
nonzero quotient; export the actual exact sequences and maps, not merely
the assertion that the problem “reduces to the middle degree.”

<a id="lpv-5"></a>

## LPV.5. Irreducibility and open symplectic monodromy

Keep the Q_ℓ model fixed: the open-image theorem concerns Sp(V)(Q_ℓ).
After extending coefficients to a larger finite extension field E'/Q_ℓ, openness in
Sp(V⊗E')(E') does not follow and is not asserted. Prove conjugacy, up to the orientation sign, of local vanishing cycles using
the irreducible dual variety and the required fundamental-group/Bertini
surjectivity. Construct the tame-cover specialization and Abhyankar-lemma
argument controlling ramification along the smooth codimension-one dual
locus. Do not transport the topological fundamental group argument without
proving the algebraic tame comparison. This is a specialized extension of
PR196's finite étale Galois-category/Riemann-existence owners, not a second
fundamental-group object. Prove the required topological generation of the
geometric monodromy image by those local operators, and thereby complete
LPV.4's identification of E^⊥ with the global invariant subspace.

Prove absolute irreducibility of V=E/(E∩E^⊥) from the transvection generators
and conjugacy. For odd n, prove that the compact monodromy image is **open**
in Sp(V), not just Zariski dense. Build the necessary ℓ-adic analytic matrix-
group/closed-subgroup and exponential-logarithm lemmas if unavailable; show
its Q_ℓ-Lie algebra is generated by the square-zero operators
x↦⟨x,δ⟩δ. Prove Deligne I 5.11: an irreducible symplectic Lie subalgebra
generated by these operators is all sp(V), then deduce openness by the local
analytic inverse-function/subgroup argument. Treat V=0 separately.

Sources: Deligne I 5.3–5.11 (including 5.4 and Corollary 5.5) and SGA 7 II XVIII §6, with the correction from
the potentially degenerate E to its radical quotient. Export the pairing,
absolute irreducibility, compactness and open image as **proved** properties
of this geometric local system. DWP.2's abstract majoration theorem may
accept such hypotheses; LPV.5 is what proves them in the pencil application.
No weight theorem enters this proof. No even-dimensional orthogonal openness
claim is substituted for the actual odd-dimensional symplectic argument.

<a id="lpv-6"></a>

## LPV.6. Perverse nearby cycles and comparison interfaces

Import only EDC.5's early perverse t-structure. Prove the nearby-cycle
t-exactness theorem in the trait setting with the source's excellent/
constructibility hypotheses. State the convention explicitly: RΨ between
fiberwise perverse categories is t-exact; for the function-to-A¹ convention
on a perverse complex on the total space, the corresponding ψ[-1] and φ[-1]
normalizations must be derived from the dimension/restriction comparison.
These are not three interchangeable unshifted formulas.

Prove compatibility with intermediate extension where its actual hypotheses
apply, duality, finite coefficient extension and normalized adic realization.
For the IG.4 application prove the needed finite-level/filtered-colimit
support criterion in its stated enlarged category; it is not a general
constructibility assertion for arbitrary filtered colimits. The adic/scheme
comparison is supplied by the existing analytic owners and then checked to
identify these perverse bounds. Source: Illusie's monodromy/nearby-cycle
exposition and SGA 7 XIII, with BBD's early perversity formalism.
This stage has no DWP or decomposition input and can support Igusa independently
of the later purity-based trace argument.

<a id="lpv-7"></a>

## LPV.7. Invariant cycles and semistable-curve exports

<a id="stage-LPV.7:semistable-curves"></a>

The prefix **LPV.7:semistable-curves** is independent of weights. For a proper
strictly semistable curve over a henselian trait, compute normalization/node
nearby cycles, the dual graph, specialization sequence and N using LPV.0–2.
Prove compatibility with the component/Jacobian/Tate-module description used
by modular and Shimura curves. For higher-dimensional strict normal-crossing
models, construct only the source-qualified nearby-cycle description and
weight spectral sequence actually used by the analytic/Shimura consumer,
with intersection-stratum restriction/Gysin maps from EDC.3. Existence of
such a model and degeneration/weight assertions are separate inputs.

<a id="stage-LPV.7:invariant-cycles"></a>

The suffix **LPV.7:invariant-cycles** imports DWP.7–8, but **not DWP.9**.
Prove Deligne II 3.6.1 for a proper family over the henselization of k[T] at
(T), k algebraically closed, with total space essentially smooth over k and
smooth generic fiber. Prove specialization onto inertia invariants by its
weight-filtered exact-sequence argument and arithmetic spreading/descent.
Then prove the potentially pure-complex extension 6.2.8–6.2.9, retaining the
specified arithmetic model over an integral finite-type Z[1/ℓ]-base rather
than treating “potentially pure” as an empty label. Prove the support-bound
weak-Lefschetz refinement 6.2.11 and global invariant-cycle result 6.2.12 with
that proposition's dual-support-dimension hypotheses. These are the exact
inputs for DWP.9's 6.2.13 argument; no hard-Lefschetz or decomposition theorem
is imported while proving them. Do not promote these results to every
mixed-characteristic degeneration. For each use of a semistable weight spectral sequence, state
which weight/monodromy result has actually been proved; general weight–monodromy
remains unclaimed.

Acceptance: a split nodal curve with nontrivial N, a smooth specialization
with N=0, the applicable invariant-cycle surjectivity and a marked excluded
mixed-characteristic generalization. Crystalline Hyodo–Kato N is constructed
by CrystallineCohomology CR.6; CohomologyComparisons compares the realizations.
LPV does not identify the two operators merely because both are named N.

## Sources, implementation and private-work handoff

The main proof sources are SGA 7 II
XII–XV and XVII–XVIII,
Deligne I §§4–5,
II §§1.6–1.7,3.6,4,
SGA 4½, and
Illusie.
The SGA 7 I I/VI monodromy prerequisites are explicit proof obligations even
when a complete copy of that volume remains an access request; the campaign
source register is authoritative for the latest acquisition status.

Private WeilConjectures packets C001/C004/C005 record a useful intended
geometry/monodromy decomposition. C004 and C005 are marked “planned” and the
Lean paths they name are absent in the checked snapshot: they are not proofs
of geometric irreducibility or of the nearby-cycle sequence. Their application
contracts are preserved here with actual constructions and source restrictions.
The private Hasse–Weil curve work is a separate curve-bound supplier, not the
higher-dimensional monodromy proof.

Suggested.lean proves the square-zero transvection algebra
using actual Mathlib linear maps. All geometric theorem specifications live
above until their genuine types are available. Completion requires constructing
the site functors, pencil schemes, local calculations, global representations
and the open-image proof; filling a record with these conclusions is not
completion. No PR or change to the private source repository is proposed here.

## Completion contracts added on 2026-09-15

**Applies to:** `LPV.0`, `LPV.2`, `LPV.3`, `LPV.4`, `LPV.5`, `LPV.7:semistable-curves`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

In LPV.4 use Q_ℓ as the coefficient of R^i f_* throughout; E denotes only the vanishing-cycle subspace. Construct its radical quotient and the inherited pairing with explicit injection/projection maps. For a nodal curve compute the normalization complex and dual-graph maps, retain inertia and the monodromy filtration, then compare with the Jacobian/Tate realization through the existing geometric owners.

### Producer–consumer contract

LPV.5 exports openness in Sp(V)(Q_ℓ) on its fixed rational coefficient model. Scalar extension transports purity conclusions later; it does not make the original compact image open in the larger coefficient group's points. General mixed-characteristic weight-monodromy is a distinct research target.

### Acceptance and source route

The zero vanishing-cycle branch, nonzero radical, characteristic-two odd-dimensional pencil and split nodal curve must each instantiate the correct sequence and sign convention.

**Source route:** Weil I 5.8–5.11, inspected pp.292–293; SGA7 XIII–XV; Weil II 3.6/6.2. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
