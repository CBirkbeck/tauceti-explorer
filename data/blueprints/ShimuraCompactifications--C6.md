# Analytic toric geometry, Part II: arithmetic toroidal compactifications

## C6. Hilbert and modular specializations

C6 identifies the generic arithmetic compactification machinery with the actual
Hilbert moduli problems and boundary models used in the ordinary Hilbert tower.
Its outputs are schemes and formal neighbourhoods with specified moduli, lattice,
polarization, level and differential data. The main geometric objects are supplied
by C0, C4–C5 and H1–H4; the declarations here specialize those objects and compare
their presentations. The library also needs the arithmetic coefficient argument
that makes Koecher extension work without discarding torsion or nilpotents.

The scope is exactly `ShimuraCompactifications:C6`. Accepted RS-32 makes this
roadmap a Part II of the existing Analytic toric geometry roadmap. Its finite
complex fans are an anchor for toric geometry; the arithmetic extension C0 supplies
relative toric charts and locally finite fans with finite arithmetic unit orbits.
R11.3 owns local polarized Raynaud uniformization, and C4 owns its relative Mumford
chart application. H1 owns HBAV moduli and cusp lattice data; H3 owns polarization
and stabilizer actions; H2 owns ramified local models and ordinary neighbourhoods;
H4 owns finite and infinite level moduli. C6 defines no second versions of them.

This target-level pass is **complete**, with C6 coverage **planned**. Every stage
target has a declaration and a chain ending in pinned library results, exact
supplier requests or the gaps below. This is not a closed plan: the requested
geometric interfaces remain necessary. All nodes have implementation status
unchecked. The suggested file gives the native arithmetic signatures, one native
phase construction, its API and tests. It lists every omitted geometric signature
by node ID because the corresponding supplier carriers are absent from the pinned
baseline. No opaque proposition is substituted for a moduli problem or a chart.

### Conventions and coefficient bases

Let F be a totally real number field of degree g, O its ring of integers, d its
different, and Δ_F its discriminant. For a fractional ideal f, write
f*=f⁻¹d⁻¹, the integral trace dual. Character and cocharacter lattices use the
pairing Tr_F/Q, not a Euclidean pairing chosen independently of the different.
At a real place w, τ_w is the signed embedding; the native infinite-place value
w(x) is its absolute value. The strict totally positive cone consists of elements
with τ_w(x)>0 for every w. Zero is a separate allowed Fourier exponent.

Dimitrov permits the connected determinant group D between G_m and Res_F/Q G_m.
The fine polarized moduli scheme is M¹ and its polarization-class quotient is M.
For a tame ideal n use his torsion-free hypothesis: n is prime to Δ_F and does
not divide 2 or 3, with c chosen prime to n. Write B=Z[1/N(n)] and Δ=N(d n).
The compactifications and the determinant Hodge line are over B. Smoothness and
the arbitrary integral character-weight line ωκ in §8 are used over a weight
base O′[1/Δ], with the character values and square roots needed for polarization
descent present. This distinction allows p dividing Δ_F to remain a legitimate
residue prime of the normal model over B. It does not assert that the model is
smooth there or that its natural O-differential module is rank one everywhere.

BHW uses a scalar tame N≥4, prime to p, a polarization ideal prime to N, and a
perfectoid coefficient field L extending Q_p^cyc. The ordinary model over O_L is
the completion of the tame integral model. Its extra finite p-level models in
§5.1.2 are initially defined over Q and then analytified over L. An integral
compactification at a wild level requires the H2/H4 local-model theorem specified
in the requests. An infinite tower is not itself an integral moduli scheme.

Use Mbar¹_Σ, Mbar_Σ for toroidal models and M^{1,min}, M^{min} for minimal ones.
The source’s superscript star for a minimal model has no relation to the trace
star on ideals. The fine universal family extends semiabelianly over Mbar¹_Σ.
Its conormal has Z-rank g. It has O-rank one on the Rapoport locus, including
split toric boundary charts; Δ inversion supplies the source’s global weight-line
setting. T5 owns the modified integral lattice ω^int. The natural ω⁺ transported
by C6 can differ from it when p ramifies in F.

### Cusp data and the phase character

An H1 cusp has O-lattice L, exact sequence 0→a*→L→b→0, polarization c=ab⁻¹ and
primitive tame level vector. Projecting that vector determines b′⊃b. Its exponent
e, defined by e(b′/b)=0, is an integer, distinct from the ideal n. The toric
character lattice is X=ab′=cbb′ and the cocharacter lattice is X*. The unipotent
stabilizer is X*. The diagonal stabilizer acts effectively by u²ε on characters;
its translations, diagonal subgroup and finite cyclotomic image are separate data.
The H3 congruences are u−1∈n b′b⁻¹ and uε−1∈bb′⁻¹. They were checked in the
rendered author copy of Proposition 3.3(iv), not inferred from extracted prime marks.

A change of uniformization lies in (ab)*/(ab′)*. On the cover adjoining ζ_e its
monomial action is q^ξ↦ζ_e^{eTr(ξx)}q^ξ. The integer exponent exists because
ξ∈ab′ and e(ab′)⊆ab. Moving x by (ab′)* changes that exponent by e times an
integer. The native construction below packages exactly this phase as a character
of a Z-submodule into the existing unit group. It does not create a new cusp
carrier, a period quotient or a completed series algebra.

No primitive-root hypothesis is needed for the character API. The geometric
level cover starts with the specified root, but coefficient specialization can
reduce its order. The phase remains a unit and evaluates to one at ξ=0, including
over nonreduced coefficient rings. The quotient by the wrong trace dual would
lose this distinction: for A=Z, B=(1/4)Z and ζ=2 modulo 5, changing x from 0 to 1
changes the phase at 1/4, even though 1 lies in the dual of A.

The fan is complete in the open positive cone together with zero, rational
polyhedral and locally finite away from zero, compatible with cusp isomorphisms
and finite modulo effective units. This allows infinitely many cones. Regularity
is measured in each actual X*, so a regular fan for the underlying unlevelled
cusp need not be regular for every level-ramified cusp above it. The term
“ramified cusp” describes b′≠b; it does not describe ramification of p in F.

### Koecher and boundary ideals

For g>1 the finite-index cusp units can move a nonzero exponent having a negative
real conjugate to arbitrarily negative trace pairing with a fixed positive vector.
A unit-valued coefficient law preserves nonzero coefficients. A meromorphic
section with finite pole order on a completed regular chart has a lower support
bound. These facts force its nonzero exponents to be zero or totally positive.
C0’s completed coordinate theorem and F0’s coherent completion detection then
turn support positivity into extension of the actual weight-line section.

The Noetherian proof is local on completed charts. For arbitrary coefficient
algebras the plan uses finite presentation and H0 commuting with filtered colimits
on qcqs models and their open submodels, requested from SF.0. Every section and
its relations descend to a finitely generated coefficient algebra. Completion
commuting with an arbitrary tensor product is not used. The pure coefficient
lemmas themselves need neither reducedness nor a domain assumption.

The boundary divisor is a scheme-theoretic union. In a regular chart with boundary
variables x₁,…,x_r, its ideal is (t), t=x₁⋯x_r. A totally positive lattice exponent
has a positive integer pairing with every primitive boundary ray, so its monomial
is divisible by every x_j and hence by t. A section belongs to ωκ⊗I_D precisely
when every cusp constant coefficient vanishes. It is insufficient to inspect
geometric points: a nilpotent constant coefficient is still a nonzero boundary
section. Koecher permits constant terms and therefore does not make a modular
form cuspidal. The unit-character annihilator criterion forces their vanishing
only when the relevant character-minus-one acts injectively on the coefficients.

The minimal contraction uses the determinant Hodge section ring. Six separate
outputs identify semi-ampleness, the contraction and fan independence, finite
generation and normal projectivity with polarization quotient, the cyclotomic
cusp scheme, connected inverse boundary fibres and their completions, and the
parallel-weight extension criterion. The source’s compact minimal quotient can
have nontrivial cusp stabilizers. Its fine-to-coarse map therefore has different
étaleness behaviour from the free toroidal action. Parallel weight lines descend
to the minimal model over the arithmetic weight base; the converse is not
asserted after an arbitrary reduction of that base.

### Ordinary and degree-one interfaces

R07.2 owns the generic BT₁ Hasse invariant det(V*), LF and the BT₁ Hodge–Tate
sequence, following the confirmed finding RT-AREA-padic-1/26. H2 constructs its
Hilbert Hasse ideal from that invariant. T0 extends the differential construction
to the semiabelian charts with their toric and abelian pieces. C6 identifies those
interfaces on its universal family. On a split torus Verschiebung has invertible
differential determinant, so the Hilbert boundary has unit Hasse ideal and lies
in the ordinary locus. A degenerating semiabelian family cannot be treated as an
abelian p-divisible group of constant height 2g at its toric boundary.

For 0≤ε<1, the near-ordinary condition |Ha_lift|≥|p|^ε is independent of the
chosen lift modulo p. H2 supplies the normalized admissible blowup model, with
p-torsion removed. C6 compares its generic fibre with BHW’s compactified
neighbourhood and its boundary. The endpoint ε=1 does not have the same elementary
lift-independence argument. T3 owns canonical subgroups and their numerical bounds,
including the independent p=2 input; T4 owns filtration-position estimates;
T5 owns Igusa torsors and ω^int. The compactified family and its natural lattice
are C6’s interfaces to these consumers.

For F=Q, match the actual full, fixed-pairing, Γ1 or refined Γ0 level and
coefficient field with R13.4a. The generic-fibre toroidal and minimal normal curves
agree with its compactified coarse modular curve by uniqueness of a normal proper
completion of the common dense open. R13.4b supplies analytic and correspondence
compatibility, retaining determinant components, cusp fields, inertia and cusp
widths. For a width-w cusp, q_Tate=t^w in the level cusp parameter. The comparison
with PR81 Layer 10 is restricted to prime N≥5 diamond quotients
H≤(Z/N)×/{±1}. Full and composite levels consume R13.4a’s separate construction.
Degree-one meromorphic functions can have poles at cusps, so no g=1 Koecher
statement follows from the higher-degree argument.

### Coefficient inclusions and module detection

Dimitrov–Tilouine Proposition 7.3(2), the proof cited by Dimitrov §8, explicitly
assumes R⊂R′. It proves descent using q-expansion detection for additive coefficient
modules. Flatness of R′ over R is unnecessary: tensor the coefficient exact sequence
with the line on the flat model, apply left exactness of global sections and detect
the image in the quotient module R′/R. The preceding module-detection lemma retains
prime-power thickenings, then writes arbitrary coefficients as a union of finitely generated submodules. The
invertible coefficient line gives injective coefficient maps, so zero expansion in
the union already means zero at the stage carrying the section. An infinite
product of Fourier coefficients need not commute with filtered colimits; the plan
uses coefficientwise vanishing and finite generation, with the precise generic
facts requested from SF.0/F0. The companion displays nonramified charts; Dimitrov
§8 supplies the general chart with the unit-valued cyclotomic phase.

The companion’s claim that both sides commute with filtered colimits is recorded
as E-C6-3 with the direct-sum coefficient counterexample. The repair above leaves
the q-expansion theorem intact and needs independent review.

The companion also explains the zero-object sentence after Proposition 8.5:
zero coefficient submodule gives ordinary injectivity. A zero unital ring
specialization is vacuous. The earlier checkpoint’s proposed replacement R=C
has been withdrawn. The source record retains the narrower wording precision issue.

C6 exports its conormal comparison to B3 and its geometric q-expansion comparison
to H5/B4. Those downstream stages are consumers; importing them into these proofs
would make a cycle.

## Named declarations and acceptance properties

The following catalogue is organized by mathematical use. Each entry gives its
packet key, proposed declaration, precise statement, proof route, direct inputs
and acceptance properties. These inputs are part of the statement’s planning
contract: citing an unimplemented supplier does not claim that its objects exist
in the pinned libraries.

### Cusp lattices and phase transport

#### Hilbert cusp lattice and trace pairing

`cusp-lattice-comparison` — **hilbert_cusp_lattice_compare** (comparison). For an H1 (R,n)-cusp with exact sequence 0→a*→L→b→0 and c=ab⁻¹, the level-image ideal b′⊃b gives character lattice X=cbb′=ab′. Its cocharacter lattice is X*, and its real pairing is Tr_F/Q. The unipotent stabilizer is X*, and the effective diagonal action is multiplication by u²ε.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Keep the chosen uniformization and finite cyclotomic action H_C separately from translations and diagonal units.

Proof route: Apply the cusp classification to the primitive level vector; its projection determines b′. Compute translations preserving that vector as (cbb′)* by Proposition 3.3(iv); identify toric monomials through the trace pairing. Transport, rather than redefine, the H1 lattice and H3 stabilizer.

Direct inputs: `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H3`.

Acceptance: For b′=b one obtains X=cb²; for b′≠b this lattice generally changes. The phase quotient uses (ab)*/(ab′)*, not the inverse quotient.

Source: DIMITROV-AUTHOR, §3, Definition 3.2 and Proposition 3.3(iv), printed pp. 531–535.

#### Admissible Hilbert cusp fans

`admissible-fan-specialization` — **hilbert_admissible_fan_compare** (comparison). C0’s arithmetic fan at a cusp identifies with a complete rational polyhedral decomposition of the open positive cone in X*⊗R, together with zero, locally finite away from zero, stable under the effective cusp-unit action, with finitely many cone orbits and compatibility with cusp isomorphisms.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Use the lattice comparison and transport the signed positive cone. Match the C0 arithmetic admissibility conditions with Definition 7.1; retain finite orbit data, not a finite fan in the whole cone.

Direct inputs: `ShimuraCompactifications:C6/cusp-lattice-comparison`, `ShimuraCompactifications:C0`, `HilbertModularVarietiesAndShimuraCurves:H3`.

Acceptance: In degree >1 finitely many unit orbits need not mean finitely many cones. A fan regular for (cb²)* need not be regular for (cbb′)* at a level-ramified cusp (Remark 7.3).

Source: DIMITROV-AUTHOR, Definition 7.1 and proof of Theorem 7.2, printed pp. 541–542.

#### Integral uniformization exponents

`trace-exponent-integral` — **UniformizationPrototype.trace_exponent_integral** (lemma). For Z-submodules A,B of a number field K, nB⊆A, ξ∈B and x∈traceDual_Z/Q(A), there is an integer m with m=n Tr_K/Q(ξx).

Hypotheses: n is a natural number; these are native Mathlib submodules, not newly defined cusp carriers.

Proof route: Pair x with nξ∈A using the existing trace-dual membership criterion. Use Q-linearity of trace and commutativity to obtain the integer witness.

Direct inputs: `mathlib:Submodule.traceDual`, `mathlib:Submodule.mem_traceDual`.

Acceptance: A=Z, B=(1/3)Z, n=3, ξ=1/3, x=1 gives m=1. Using n=2 for the same B fails to clear the denominator.

Source: DIMITROV-AUTHOR, Proposition 4.1(ii), printed p. 537.

#### Congruence under a uniformization lift

`trace-exponents-congruent` — **UniformizationPrototype.trace_exponents_congruent** (lemma). If ξ∈B and x′−x∈traceDual(B), integer witnesses m=nTr(ξx), m′=nTr(ξx′) differ by n times an integer.

Hypotheses: K is a number field, B a Z-submodule, n∈N.

Proof route: Take the integer trace witness for ξ(x′−x). Subtract the two exponent identities in Q and use injectivity of Z→Q.

Direct inputs: `mathlib:Submodule.mem_traceDual`.

Acceptance: The dual must be that of B, not the smaller module A.

Source: DIMITROV-AUTHOR, Proposition 4.1(ii), printed p. 537.

#### Uniformization phases are well defined

`phase-independent-of-lift` — **UniformizationPrototype.phase_independent_of_lift** (lemma). With the previous exponent witnesses and ζ∈R× satisfying ζ^n=1, ζ^m′=ζ^m.

Hypotheses: R is any commutative ring; primitive order n is unnecessary.

Proof route: Use trace-exponents-congruent and the integer-power laws in the unit group.

Direct inputs: `ShimuraCompactifications:C6/trace-exponents-congruent`.

Acceptance: Roots can specialize to smaller order; the equality still holds over nonreduced R.

Source: DIMITROV-AUTHOR, Proposition 4.1(ii), printed p. 537.

#### Additivity of uniformization phases

`phase-additive-in-character` — **UniformizationPrototype.phase_additive_in_character** (lemma). For integer witnesses mξ=nTr(ξx), mη=nTr(ηx), msum=nTr((ξ+η)x), ζ^msum=ζ^mξ ζ^mη.

Hypotheses: ζ is a unit of a commutative ring.

Proof route: Trace additivity and injectivity of Z→Q give msum=mξ+mη. Apply the integer-power addition law.

Direct inputs: `mathlib:Submodule.traceDual`.

Acceptance: Negative exponents are taken in R×; natural powers do not describe the full lattice.

Source: DIMITROV-AUTHOR, Proposition 4.1(ii), printed p. 537.

#### Uniformization phase character

`uniformization-phase-character` — **UniformizationPrototype.tracePhase** (construction). Given native Z-submodules A,B of K, nB⊆A, x∈traceDual(A) and ζ∈R× with ζ^n=1, construct the additive character B→Additive(R×) sending ξ to ζ^m where m=nTr(ξx).

Hypotheses: K is a number field; R any commutative ring. All exponent witnesses are integral; no choice of a generator of the fractional ideal B. For the geometric specialization use A=ab, B=ab′, n the exponent of b′/b.

Proof route: Obtain integral exponent witnesses by trace-exponent-integral. Independence of the integer witness follows from Z→Q injectivity; phase-additive-in-character supplies the homomorphism laws. The phase depends only on x modulo traceDual(B) by phase-independent-of-lift.

Direct inputs: `ShimuraCompactifications:C6/trace-exponent-integral`, `ShimuraCompactifications:C6/phase-independent-of-lift`, `ShimuraCompactifications:C6/phase-additive-in-character`.

Acceptance: Use A=ab and B=ab′ in the actual H1 chart; this character alone does not construct a cusp action.

Source: DIMITROV-AUTHOR, Proposition 4.1(ii) and equation (5), printed pp. 537, 546.

API derived from use:

- **UniformizationPrototype.tracePhase_apply** (characterisation): For ξ∈B and an integer witness m=nTr(ξx), evaluation equals ζ^m.
- **UniformizationPrototype.tracePhase_zero** (simp): Evaluation at the zero character is one in R×.
- **UniformizationPrototype.tracePhase_add** (relation): Evaluation at ξ+η equals the product of the evaluations at ξ and η.
- **UniformizationPrototype.tracePhase_lift** (compatibility): Changing x by traceDual(B) leaves the character unchanged.
- **UniformizationPrototype.tracePhase_trivial_root** (simp): For ζ=1 the character has every value one.
- **UniformizationPrototype.tracePhase_map** (functoriality): A coefficient ring map transports the character by its induced map on units, without a primitivity hypothesis.

Uses:

- Dimitrov Proposition 4.1(ii): Describes how changing the uniformization acts on toric monomials.
- Dimitrov equation (5) and C6/hilbert-cusp-positive-support: Ensures cyclotomic coefficient multipliers are units, with phase one at the zero exponent.
- HilbertModularVarietiesAndShimuraCurves:H5 and OverconvergentAutomorphicForms:O6: Keeps the q-expansion law compatible with coefficient specialization and ramified level cusps.

Discriminating tests:

- **UniformizationPrototype.phase_third_denominator** (computation): For K=Q, A=Z, B=(1/3)Z, n=3 and x=1, evaluation at 1/3 is ζ (for any ζ³=1).
- **UniformizationPrototype.phase_zero_character** (degenerate): For every datum the zero character evaluates to one, including the zero coefficient ring.
- **UniformizationPrototype.phase_dual_shift** (compatibility): For K=Q, A=Z, B=(1/3)Z, x=1 and x′=4, the characters are equal when ζ³=1, since 3 belongs to traceDual(B).
- **UniformizationPrototype.phase_wrong_dual** (non-example): For A=Z, B=(1/4)Z, n=4, ζ=2 in (Z/5)×, x=0 and x′=1, the evaluations at 1/4 are 1 and 2; quotienting by traceDual(A) would be wrong.
- **UniformizationPrototype.phase_nonprimitive** (compatibility): For any datum with n=4 over Z/8 and ζ=3, evaluation equals 3^m, although this root has order 2.

The phase construction takes actual native submodules and units. Its tests in the suggested file assume the displayed lattice-membership witnesses; these witnesses describe the concrete rational lattices, rather than opaque geometry. The arithmetic lemmas retain their seven independent acceptance examples.

#### The universal family on a Hilbert cusp chart

`uniformized-level-chart` — **hilbert_uniformized_level_chart** (comparison). Over B[ζ_e], where e is the exponent of b′/b, the C4 Mumford family on the C0 toric chart carries the H1 c-polarization and µ_n level structure; on the open abelian locus it is the pullback of the universal fine HBAV. Changing uniformization x∈(ab)*/(ab′)* acts by q^ξ↦ζ_e^{eTr(ξx)}q^ξ.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Import C4’s family and its level exact sequence; use the H1 chosen lift of the projected level data. Identify the phase with tracePhase; verify faces and cusp-unit/cyclotomic changes by Proposition 4.1(iii).

Direct inputs: `ShimuraCompactifications:C6/cusp-lattice-comparison`, `ShimuraCompactifications:C6/uniformization-phase-character`, `ShimuraCompactifications:C4`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H3`.

Acceptance: At b′=b, e=1 and the cyclotomic phase is trivial. A ramified level cusp is a property of b′/b; it does not mean that the residue prime ramifies in F.

Source: DIMITROV-AUTHOR, Proposition 4.1(i)–(iii), printed pp. 536–537.

### Toroidal geometry

#### Fine Hilbert toroidal compactification

`hilbert-toroidal-model` — **hilbert_toroidal_model_exists** (theorem). For an admissible cusp fan system Σ, there is a scheme Mbar¹_Σ over B, an open immersion M¹→Mbar¹_Σ and the prescribed completed cusp-chart identifications compatible with the universal HBAV. This pair is unique up to a unique isomorphism fixing the open and formal data.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Form the finite representative chart cover and its actual face/unit/cyclotomic relation. Apply the requested formal effectivity/descent theorem, verifying its two valuative conditions by Raynaud–Mumford compatibility and the level chart. The formal data determine the algebraization under the requested schematic-density and uniqueness hypotheses.

Direct inputs: `ShimuraCompactifications:C6/admissible-fan-specialization`, `ShimuraCompactifications:C6/uniformized-level-chart`, `ShimuraCompactifications:C5`, `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:SF.1`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

Acceptance: No smoothness at discriminant primes is included. Replacing each ramified cusp lattice by the underlying unlevelled lattice fails Remark 7.3.

Source: DIMITROV-AUTHOR, Theorem 7.2(i), §§5–6, printed pp. 538–543.

#### Polarization quotients of toroidal models

`toroidal-polarization-quotient` — **hilbert_toroidal_polarization_quotient** (theorem). For a fan system invariant under H3’s tame finite polarization group, its action extends to Mbar¹_Σ, and the quotient Mbar_Σ compactifies M with the formal unit/cyclotomic quotient appropriate to G. For Dimitrov’s torsion-free tame situation Mbar¹_Σ→Mbar_Σ remains finite étale.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. For BHW scalar tame N this group is Δ(N)=O×,+/((1+NO)×)²; use H3’s conventions rather than identifying all D or all p-level groups with it.

Proof route: The chart maps are equivariant by Proposition 4.1(iii). The admissible fan is invariant under the full cusp action; apply effective quotient descent to the properly acting free toroidal action.

Direct inputs: `ShimuraCompactifications:C6/hilbert-toroidal-model`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.1`.

Acceptance: This does not make the corresponding map of minimal compactifications étale. Full p-level G* structures need not be preserved by all positive units.

Source: DIMITROV-AUTHOR, Theorem 7.2(ii), printed pp. 542–543; BHW Proposition 8.4, p. 1766.

#### Formal Hilbert cusp neighbourhoods

`hilbert-boundary-formal-comparison` — **hilbert_boundary_formal_compare** (comparison). The boundary completion of Mbar_Σ is the disjoint union over cusp components of the C0 completed toric union divided by the effective cusp units, with coefficient algebra B[ζ_e]^{H_C}. On the fine model use U_C,1 and H_C,1. The root action and weight line are transported together.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Read the completed presentation in Theorem 7.2 on the actual descended chart relation. Apply toroidal-polarization-quotient and identify the cusp lattice and cyclotomic phase.

Direct inputs: `ShimuraCompactifications:C6/hilbert-toroidal-model`, `ShimuraCompactifications:C6/toroidal-polarization-quotient`, `ShimuraCompactifications:C6/cusp-lattice-comparison`, `ShimuraCompactifications:C0`, `HilbertModularVarietiesAndShimuraCurves:H3`, `AdicSpacesPartII:F0`.

Acceptance: The infinite arithmetic unit quotient is not a finite-group quotient of one affine chart. Keep formal completions and arbitrary coefficient tensor products distinct.

Source: DIMITROV-AUTHOR, Theorem 7.2(i),(ii), printed pp. 541–543.

#### Étale toric charts at Hilbert boundary

`hilbert-boundary-etale-charts` — **hilbert_boundary_etale_toric** (theorem). Near the boundary the open immersion M→Mbar is étale locally the C0 relative torus embedding S_C→S_σ for its actual lattice X. Nonopen strata have the toric description after an algebraically closed field base change of characteristic prime to N(n).

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: The effective arithmetic cusp units act freely on nonopen strata. Use the formal identification and the requested algebraization of boundary-local étale charts.

Direct inputs: `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `ShimuraCompactifications:C0`, `AdicSpacesPartII:F0`.

Acceptance: Freeness on toroidal strata does not imply freeness on a contracted minimal cusp.

Source: DIMITROV-AUTHOR, Corollary 7.4, printed p. 544.

#### Smooth Hilbert refinements on the good base

`hilbert-regular-refinement` — **hilbert_regular_refinement_smooth** (theorem). An admissible regular refinement with respect to each actual X* makes Mbar_Σ smooth over Z[1/Δ]. Refinement maps agree with C3 on the open and on completed cusp charts.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Use C0’s regular coordinates and invariant locally finite refinement. Combine the smooth H1 open model on the Δ-inverted base with the étale boundary charts; C3 supplies refinement morphisms.

Direct inputs: `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`, `ShimuraCompactifications:C0`, `ShimuraCompactifications:C3`, `HilbertModularVarietiesAndShimuraCurves:H1`.

Acceptance: Smoothness over Z[1/N(n)] is not asserted when a remaining prime divides Δ_F.

Source: DIMITROV-AUTHOR, Corollary 7.5 and Remark 7.3, printed pp. 543–544.

#### Universal Hilbert semiabelian extension

`hilbert-semiabelian-extension` — **hilbert_semiabelian_extension** (theorem). The universal fine HBAV on M¹ has a unique semiabelian group scheme extension G over Mbar¹_Σ with O-action. It is a torus over the boundary, and its chart pullbacks are the C4 Mumford families.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Descend C4’s semiabelian chart families by their face and cusp equivariance. Glue with the universal abelian family on the open. Apply the requested uniqueness theorem for semiabelian extensions over the normal dense model.

Direct inputs: `ShimuraCompactifications:C6/hilbert-toroidal-model`, `ShimuraCompactifications:C6/uniformized-level-chart`, `ShimuraCompactifications:C4`, `SchemeAndStackFoundations:SF.1`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `NeronModelsAndSemistableAbelianVarieties:R11.3/rigid-uniformisation`.

Acceptance: The fine family has O-action; the coarse polarization quotient is not asserted to carry a universal polarized HBAV. Boundary torus rank is g; its p-power torsion has multiplicative rank p^(ng), not constant abelian height 2g.

Source: DIMITROV-AUTHOR, Proposition 7.6, printed p. 544.

#### Hilbert differentials on degeneration charts

`hilbert-conormal-comparison` — **hilbert_conormal_compare** (comparison). The invariant differential sheaf e*Ω¹_G/Mbar equals the C4 chart differential module and restricts to the HBAV Hodge bundle on M¹. It has Z-rank g everywhere, O⊗O_Mbar-rank one on the Rapoport locus and at split toric boundary charts; after Δ inversion its character-weight lines are the H3 character-weight lines obtained from these differentials. This comparison is exported to B3 for its canonical-extension construction and to H5 for its classical tests.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Identify differentials of the torus through its character lattice, and glue by semiabelian-extension uniqueness. Compare to the H1/H2 Hodge module on the open and to the H3 weight descent on the Δ-inverted base.

Direct inputs: `ShimuraCompactifications:C6/hilbert-semiabelian-extension`, `ShimuraCompactifications:C4`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`.

Acceptance: At ramified primes away from the Rapoport locus O-rank-one local freeness of the natural lattice is not automatic. T5’s modified ω^int is not identified with this natural integral lattice.

Source: DIMITROV-AUTHOR, Proposition 7.6 and beginning of §8, printed pp. 544–546; BHW §7.1, pp. 1759–1760.

#### Proper Hilbert toroidal models

`hilbert-toroidal-proper` — **hilbert_toroidal_proper** (theorem). Mbar¹_Σ and Mbar_Σ are proper over B for a complete admissible fan system.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Apply semistable reduction after a finite extension of the valuation field. Use Raynaud’s polarized period lattice to obtain a positive valuation vector and an appropriate cone modulo units. The C4 chart extends the map over the valuation ring; use the requested valuative descent to conclude properness.

Direct inputs: `ShimuraCompactifications:C6/hilbert-toroidal-model`, `ShimuraCompactifications:C6/toroidal-polarization-quotient`, `ShimuraCompactifications:C6/admissible-fan-specialization`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `NeronModelsAndSemistableAbelianVarieties:R11.3/finite-separable-semistable-extension`.

Acceptance: Properness does not assert projectivity of every toroidal fan.

Source: DIMITROV-AUTHOR, Theorem 7.7, printed pp. 544–545.

### Koecher and boundary coefficients

#### A contracting unit in a cusp subgroup

`finite-index-cusp-unit-contraction` — **finiteIndex_unit_contracts_away** (lemma). If U has finite index and F has more than one infinite place, then for each w₀ there is u∈U with |τ_w₀(u)|>1 and |τ_w(u)|<1 for every w≠w₀.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The cardinality hypothesis is equivalent to [F:Q]>1 in this totally real setting.

Proof route: Apply the pinned Dirichlet exists_unit theorem at w₀ to obtain v whose other absolute values have negative logarithms. Use positivity of unit absolute values and the logarithmic product formula, with all multiplicities equal to one. There is at least one other place, so the logarithm at w₀ is strictly positive. Apply the finite-index positive-power theorem to v. Raising all absolute values to this positive power preserves the strict inequalities and produces an element of U.

Direct inputs: `mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit`, `mathlib:NumberField.Units.sum_mult_mul_log`, `mathlib:NumberField.Units.pos_at_place`, `mathlib:NumberField.IsTotallyReal.mult_eq`, `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero`.

Acceptance: Over Q every integer unit has absolute value one, so the degree assumption cannot be removed. For a principal cusp-unit subgroup, use its actual finite index from H3; no logarithmic density of a discrete lattice is asserted.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### A negative embedding of a nonpositive exponent

`negative-cusp-exponent` — **exists_negative_embedding** (lemma). If ξ∈F is nonzero and is not totally positive, then τ_w(ξ)<0 for some infinite place w.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index.

Proof route: Negate the existing universal strict-positivity predicate to obtain τ_w(ξ)≤0. A field embedding is injective, so ξ≠0 implies τ_w(ξ)≠0; hence the inequality is strict.

Direct inputs: `tauceti:NumberField.isTotallyPositive_iff`.

Acceptance: ξ=0 has no negative embedding and must be excluded. A nonzero element cannot have a zero real conjugate.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### Unbounded negative trace along cusp units

`negative-trace-orbit` — **negative_trace_orbit_unbounded** (lemma). Let U have finite index, [F:Q]>1, ξ≠0 not totally positive, and y_w>0 for every w. For every real B there is u∈U with Σ_w τ_w(u²ξ)y_w<B.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The y_w form a vector of the open positive dual cone. It need not itself be a field element.

Proof route: Choose a negative embedding w₀ by negative-cusp-exponent and a unit v∈U contracting at all other places by finite-index-cusp-unit-contraction. For u=v^n, the w₀ summand is τ_w₀(ξ)y_w₀|τ_w₀(v)|^(2n), tending to negative infinity. At every other place |τ_w(v)|^(2n) tends to zero. The finite sum of these terms tends to zero. Therefore the whole sum is less than any prescribed B for sufficiently large n.

Direct inputs: `ShimuraCompactifications:C6/negative-cusp-exponent`, `ShimuraCompactifications:C6/finite-index-cusp-unit-contraction`, `mathlib:tendsto_pow_atTop_atTop_of_one_lt`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

Acceptance: For Q the orbit of ξ=−1 under integer-unit squares is the singleton {−1}. ξ=0 has identically zero pairing; no unboundedness conclusion applies. For Q(√2), ξ=−√2, v=1+√2 and y=(1,1), the first positive n already gives a negative trace; positive powers continue to negative infinity.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### Nonzero coefficients survive unit transport

`coefficient-unit-orbit` — **coefficient_ne_zero_on_unit_orbit** (lemma). For a commutative ring R, a:F→R, multipliers c:U×F→R× and covariance a(u²ξ)=c(u,ξ)a(ξ), one has a(u²ξ)≠0 if and only if a(ξ)≠0.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. No reducedness, domain, characteristic-zero, or nontriviality condition on R.

Proof route: Rewrite using the stated covariance. Apply Units.mul_right_eq_zero and negate the equivalence. No division by a nonunit or by the coefficient is used.

Direct inputs: `mathlib:Units.mul_right_eq_zero`.

Acceptance: In Z/4, multiplication by the nonunit 2 kills the nonzero coefficient 2; the unit condition is essential. A root of unity and a unit-valued weight character remain units after any coefficient-ring map, even if their reductions equal one.

Source: DIMITROV-AUTHOR, Fourier transformation law preceding Theorem 8.3, p. 23; author copy printed pp. 546–548, §8.

#### Koecher support for coefficient families

`bounded-cusp-support` — **bounded_cusp_support_is_positive** (theorem). Let [F:Q]>1, U have finite index, and a:F→R satisfy unit-valued covariance as in coefficient-unit-orbit. Suppose some y_w>0 and B∈ℝ satisfy B≤Σ_w τ_w(ξ)y_w whenever a(ξ)≠0. Then every nonzero coefficient is indexed by ξ=0 or by a totally positive ξ.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. A coefficient family alone is not a convergent or completed formal series.

Proof route: Suppose a nonzero coefficient has ξ≠0 not totally positive. Apply negative-trace-orbit with the given y and B, obtaining u∈U with pairing strictly below B. The coefficient at u²ξ is nonzero by coefficient-unit-orbit, contradicting the support lower bound.

Direct inputs: `ShimuraCompactifications:C6/negative-trace-orbit`, `ShimuraCompactifications:C6/coefficient-unit-orbit`.

Acceptance: The constant family supported only at zero is permitted. Koecher does not imply cuspidality. The conclusion allows torsion and nilpotents in the coefficient ring because only multiplication by units was cancelled. A geometric application must supply the support bound; it is not assumed from the notation for a formal series.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### Positive exponents vanish on every boundary ray

`positive-exponents-on-charts` — **positive_exponent_pairs_pos** (lemma). If ξ is totally positive and v=(v_w) is nonzero with all v_w≥0, then Σ_w τ_w(ξ)v_w>0. In an integral Hilbert cusp chart, its pairing with each primitive nonzero boundary ray is therefore a strictly positive integer.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. For the final interpretation ξ belongs to the character lattice X and the ray belongs to its integral dual; lattice integrality is imported from C0/H1.

Proof route: All summands are nonnegative. Since v is nonzero, at least one coordinate is strictly positive. Its product with the corresponding strictly positive conjugate of ξ is positive, so the finite sum is positive. Use the character/cocharacter integral pairing to interpret the result as a positive coordinate exponent.

Direct inputs: `tauceti:NumberField.isTotallyPositive_iff`, `mathlib:Finset.one_lt_prod_iff_of_one_le`, `ShimuraCompactifications:C0/relative-regular-coordinates`, `HilbertModularVarietiesAndShimuraCurves:H1`.

Acceptance: The zero dual vector gives zero and must be excluded. For ξ=1 and every y_w>0 the pairing is positive. On a regular chart, positivity at each of its r rays implies divisibility of the monomial by the product x₁⋯x_r.

Source: DIMITROV-AUTHOR, §2 toric coordinates, pp. 5–6, and Theorem 8.3, pp. 23–24; author copy printed pp. 546–548, §8.

#### The annihilator of a constant coefficient

`constant-term-covariance` — **constant_coefficient_annihilated** (lemma). Under a(u²ξ)=c(u,ξ)a(ξ) with c(u,ξ)∈R×, every u satisfies (c(u,0)−1)a(0)=0. For Dimitrov’s actual weight law the root-of-unity phase at zero is one.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. R is any commutative ring; the scalar formula is written after a local trivialization of the invertible coefficient line.

Proof route: Set ξ=0 in the transformation law, since u²·0=0. Subtract a(0); distributivity yields the annihilation relation.

Direct inputs: `ShimuraCompactifications:C6/coefficient-unit-orbit`.

Acceptance: This does not conclude a(0)=0 over a ring with zero divisors. For the trivial character, every a(0) satisfies the relation.

Source: DIMITROV-AUTHOR, Proposition 8.5(iii), p. 24; author copy printed pp. 546–548, §8.

#### Constant-term vanishing with a regular multiplier

`constant-term-vanishing` — **constant_coefficient_eq_zero** (lemma). If, for some u, multiplication by c(u,0)−1 on R has zero kernel, then the covariance relation forces a(0)=0.

Hypotheses: F is a totally real number field; τ_w denotes its signed real embedding at infinite place w. The native InfinitePlace value w(x) is |τ_w(x)|. U is a subgroup of the integer units, not a subgroup of F× with an assumed finite index. The zero-kernel hypothesis is required; c(u,0)≠1 alone is insufficient for a general coefficient ring.

Proof route: Apply constant-term-covariance at the selected u. Apply the zero-kernel hypothesis to a(0).

Direct inputs: `ShimuraCompactifications:C6/constant-term-covariance`.

Acceptance: In Z/4, the unit 3 differs from 1 and fixes the nonzero coefficient 2. Thus the nontrivial-character argument valid over a field does not apply to every R. Over a field, any multiplier different from one supplies the zero-kernel hypothesis.

Source: DIMITROV-AUTHOR, Proposition 8.5(iii), p. 24; author copy printed pp. 546–548, §8.

#### A pole bound on a Hilbert cusp chart

`meromorphic-cusp-support-bound` — **meromorphic_cusp_support_bound** (lemma). Under the stated Hilbert geometric hypotheses, a section of ω^κ over the open part of a completed regular cusp chart, which has finite pole order along its boundary, has Fourier support bounded below under every y in that cone. More explicitly, after a character-compatible local trivialization, write it as t^(−m)g, where t=x₁⋯x_r, m≥0, and g lies in the t-adic completed chart ring. Then a(ξ)≠0 implies ⟨ξ,y⟩≥−mΣ_i⟨m_i,y⟩, with m_i the r polynomial coordinate characters.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. The completion and localization are formed over R; an unproved interchange of completion with arbitrary tensor products is not used. The coefficient description of this completion and the meromorphic representation are requested generic inputs.

Proof route: Import the C0 regular coordinate identification and the boundary-union ideal (t). Complete that R-algebra and use its proven admissible coefficient expansion. Every exponent of g has nonnegative pairing with y in the cone; the Laurent coordinates pair to zero. Multiplication by t^(−m) translates the support by −mΣ_i m_i. Coefficient injectivity yields the stated lower bound.

Direct inputs: `ShimuraCompactifications:C0/relative-regular-coordinates`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C4`, `AdicSpacesPartII:F0`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`.

Acceptance: For r=1 this is the usual lower bound on Laurent-series exponents. The union of coordinate boundary divisors is cut out by their product, whereas the sum ideal defines their intersection. The empty boundary chart r=0 is excluded from boundary-completion detection.

Source: DIMITROV-AUTHOR, §2, p. 5, and Theorem 8.3 proof, pp. 23–24; author copy printed pp. 546–548, §8.

#### Positive support of meromorphic Hilbert expansions

`hilbert-cusp-positive-support` — **hilbert_cusp_support_positive** (theorem). Under the Hilbert geometric hypotheses, every unit-equivariant meromorphic cusp expansion of an open Hilbert modular form has support contained in X_+∪{0}, where X=cbb′ is the actual character lattice at that cusp.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. The finite-index subgroup U consists of the stabilizer pairs (u,1); its action preserves X. Its weight and cyclotomic multipliers are units. The coefficient family on X is extended by zero to F.

Proof route: Use H3’s exact stabilizer congruences and finite-index assertion; use H1’s lattice and trace dictionary, including the distinction between b and b′. Choose an open positive dual vector y. Completeness of the admissible fan puts y in a cone, without asserting that the whole fan is finite. Apply meromorphic-cusp-support-bound on that cone. In a local trivialization of the coefficient line, apply bounded-cusp-support. The result is independent of the trivialization because its transition scalars are units.

Direct inputs: `ShimuraCompactifications:C6/meromorphic-cusp-support-bound`, `ShimuraCompactifications:C6/bounded-cusp-support`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraCompactifications:C0`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `ShimuraCompactifications:C6/uniformized-level-chart`, `ShimuraCompactifications:C6/cusp-lattice-comparison`, `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`.

Acceptance: Both unramified level cusps (b′=b) and ramified level cusps (b′≠b) retain their actual exponent lattice. Ramification of a level cusp does not mean a base prime dividing the field discriminant. No finite flatness of a full p-adic tower is inferred from the finite cusp cyclotomic cover.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### Arithmetic Koecher extension

`arithmetic-koecher` — **arithmetic_koecher** (theorem). For g=[F:Q]>1, every coefficient algebra R over the discriminant-inverted weight base O′[1/Δ], and the actual Hilbert toroidal model, restriction Γ(Mbar_R,ωκ)→Γ(M_R,ωκ) is an isomorphism. No cusp vanishing is included.

Hypotheses: Dimitrov’s torsion-free tame level and admissible fan; Δ=N(d n). The weight κ is integral, the coefficient base contains its values and the square roots needed for polarization descent. The Noetherian case uses coherent completion detection. The general R case uses finite presentation and the requested qcqs filtered-colimit theorem; completion is not asserted to commute with arbitrary tensor products.

Proof route: Use schematic density of the open immersion and invertibility of the line to obtain injectivity. For an open section, use the requested finite-pole and formal-detection theorem to examine it on every completed cusp chart. Apply hilbert-cusp-positive-support. Its exponents lie in every positive dual monoid, so the existing meromorphic expansion has no negative coordinate exponents and belongs to the completed regular ring. Use the actual equivariant chart relation to glue these regular formal sections, then coherent formal detection to extend across the boundary. Uniqueness follows from injectivity. Descend the finite-presentation model, line and section data to finitely generated subalgebras of R over O′[1/Δ]. Apply the Noetherian result there and use the requested qcqs H0/filtered-colimit comparison for both open and compactified schemes. This is the explicit supplier input for arbitrary coefficients.

Direct inputs: `ShimuraCompactifications:C6/hilbert-cusp-positive-support`, `AdicSpacesPartII:F0`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `ShimuraCompactifications:C6/hilbert-toroidal-model`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`.

Acceptance: For degree one the weakly holomorphic q^(−1) behavior is not eliminated by units; the theorem is not claimed for F=Q. The constant coefficient need not vanish. No ramified-base Hasse-ideal conclusion follows from a theorem over o′[1/Δ]. Changing an admissible fan uses common-refinement comparison maps from C3, not equality of the chosen toroidal schemes.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24 (author copy printed p. 547); author copy printed pp. 546–548, §8.

#### Hilbert cusp forms and the boundary ideal

`hilbert-boundary-constant` — **hilbert_cuspidal_iff_constant_zero** (theorem). Under the Hilbert geometric hypotheses, let D be the scheme-theoretic relative toroidal boundary and I_D its ideal, locally (x₁⋯x_r). For s∈Γ(M̄_Σ,R,ω^κ), membership in the image of Γ(M̄_Σ,R,ω^κ⊗I_D) is equivalent to vanishing of its constant Fourier coefficient at every cusp component, after the stated étale coefficient and line-trivializing covers.

Hypotheses: Use the actual Hilbert moduli and toroidal model supplied by H1–H4 and C4–C5, not an arbitrary scheme record with the conclusions as fields. F is totally real of degree greater than one; n is prime to the discriminant and divides neither (2) nor (3); c is prime to n. Use a regular admissible cusp fan, finite modulo its unit group, and a Noetherian algebra R over o′[1/Δ], Δ=N(d n), containing the weight values and the required square roots for polarization descent. Adjoin the finite cyclotomic cusp coefficients by an étale cover when needed. ω^κ is the actual descended invariant-differential line; no general automorphic-bundle construction is duplicated here. This is the scalar Hilbert coefficient comparison on its zero-dimensional cusp bases. It is not the generic B5 theorem for higher-dimensional boundary coefficients, and it does not import B3 or B5 back into their C6 supplier. The Noetherian case is followed by the same filtered-colimit argument as arithmetic-koecher; it is not a pointwise or reduced-base test.

Proof route: Use arithmetic-koecher to identify open forms with regular extended sections, and hilbert-cusp-positive-support for their expansions. For ξ∈X_+, positive-exponents-on-charts makes every boundary coordinate exponent a positive integer. Hence each nonconstant monomial is divisible by t=x₁⋯x_r. Division by t preserves the requested completed-ring support condition. The constant coefficient survives modulo (t). Thus an expansion is in (t) exactly when its constant coefficient is zero. This is a scheme-theoretic coefficient computation, valid with nilpotents. Use the invertible-line boundary exact sequence, étale descent of its ideal and coherent formal detection at every cusp to obtain the asserted global equivalence.

Direct inputs: `ShimuraCompactifications:C6/arithmetic-koecher`, `ShimuraCompactifications:C6/positive-exponents-on-charts`, `ShimuraCompactifications:C0/relative-boundary-coordinates`, `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C6/hilbert-boundary-etale-charts`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`.

Acceptance: A section with nonzero constant term may satisfy Koecher extension but is not cuspidal. On a rank-one formal boundary chart the condition reduces to divisibility by q. Use every cusp component; a single scalar at one cusp does not replace all boundary restrictions. For a general Shimura variety a boundary coefficient can itself be a nonconstant form; that case remains owned by AutomorphicBundles:B5.

Source: DIMITROV-AUTHOR, Theorem 8.3, pp. 23–24, and §2 boundary coordinates, p. 5; author copy printed pp. 546–548, §8.

### Minimal geometry and q-expansions

#### Semiample determinant Hodge line

`hilbert-hodge-semiampleness` — **hilbert_hodge_semiample** (theorem). A positive power of the determinant Hodge line λ=det_Z(e*Ω¹_G) on Mbar¹_Σ is generated by its global sections.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Use the determinant line over B, not a nonparallel weight line only defined after Δ inversion.

Proof route: Specialize the C5 semi-ampleness theorem for the imported polarized semiabelian family. Check the determinant convention λ=ω^t on the rank-one O-locus.

Direct inputs: `ShimuraCompactifications:C6/hilbert-semiabelian-extension`, `ShimuraCompactifications:C6/hilbert-toroidal-proper`, `ShimuraCompactifications:C5`.

Acceptance: A boundary-effective divisor twist is not part of λ.

Source: DIMITROV-AUTHOR, Theorem 8.6(i) and proof citing [9] IX.2.1 / [7] V.2.1, printed pp. 548–549.

#### Hilbert minimal contraction

`hilbert-minimal-contraction` — **hilbert_minimal_contraction** (theorem). The determinant section ring Rλ=⊕_{k≥0}Γ(Mbar¹_Σ,λ^k) defines a surjective contraction π:Mbar¹_Σ→M^{1,min}=Proj_B Rλ. The minimal scheme is independent of Σ.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. For g>1 use arithmetic Koecher to identify the section ring independently of the fan; degree one is treated by the modular comparison.

Proof route: Use semi-ampleness and the C5 normalized section-ring contraction. Identify the Veronese Proj with Proj Rλ via the requested generic comparison. Use Koecher on the Δ-inverted locus and the C5 integral section-ring independence on B; do not infer arbitrary integral independence merely from generic equality.

Direct inputs: `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`, `ShimuraCompactifications:C6/arithmetic-koecher`, `ShimuraCompactifications:C5`.

Acceptance: An isomorphism over Q alone does not identify integral minimal models.

Source: DIMITROV-AUTHOR, Theorem 8.6(ii) and proof, printed pp. 548–549.

#### Finite generation of the Hilbert section ring

`hilbert-minimal-finite-generation` — **hilbert_minimal_sectionRing_finite** (theorem). Rλ is a finitely generated B-algebra.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Use C5’s normalization/Veronese construction after a globally generated power. Import its finite-generation and integral-closure theorem, including finiteness of the full section ring over the chosen Veronese; the bare word integral does not establish finite type.

Direct inputs: `ShimuraCompactifications:C6/hilbert-hodge-semiampleness`, `ShimuraCompactifications:C5`.

Acceptance: Retain finiteness over the Veronese as a supplier obligation.

Source: DIMITROV-AUTHOR, Theorem 8.6(iii) and proof, printed pp. 548–549.

#### Normal projective Hilbert minimal models

`hilbert-minimal-normal-projective` — **hilbert_minimal_normal_projective** (theorem). M^{1,min} is a normal projective finite-type B-scheme; π is proper birational with connected fibres and π_*O=O.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Apply the C5 normal section-ring construction and finite generation. Use properness and Zariski connectedness from the generic normal contraction, with its schematic-density hypotheses.

Direct inputs: `ShimuraCompactifications:C6/hilbert-minimal-contraction`, `ShimuraCompactifications:C6/hilbert-minimal-finite-generation`, `ShimuraCompactifications:C6/hilbert-toroidal-proper`, `ShimuraCompactifications:C5`, `SchemeAndStackFoundations:SF.0`.

Acceptance: Connected fibres are a theorem, not the definition of the contraction.

Source: DIMITROV-AUTHOR, Theorem 8.6(iii) and proof, printed pp. 548–549.

#### Polarization quotients of minimal models

`minimal-polarization-quotient` — **hilbert_minimal_polarization_quotient** (theorem). The H3 finite tame polarization action on the section ring induces an action on M^{1,min}; the quotient M^{min} is normal projective finite type over B, and the contraction descends. The action can stabilize minimal cusps, so the fine-to-coarse minimal map is not generally étale.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Transport the linearized determinant section ring under the H3 action. Apply C5/SF1 finite projective quotient and normalization theorems, and the equivariance of π.

Direct inputs: `ShimuraCompactifications:C6/toroidal-polarization-quotient`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C5`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.1`.

Acceptance: A nontrivial cusp stabilizer can arise after contraction even when the toroidal action is free.

Source: DIMITROV-AUTHOR, Theorem 8.6(iii) and proof, printed pp. 548–549.

#### Cyclotomic cusps of Hilbert minimal models

`hilbert-minimal-cusps` — **hilbert_minimal_cusps** (theorem). The contraction identifies M with a dense open of M^{min}. Its reduced boundary is the finite étale B-scheme ⨿_C Spec(B[ζ_e]^{H_C}), with e the exponent of b′/b; it has relative codimension g, hence at least two when g>1.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. The cusp subscheme here has the source’s finite étale structure. Boundary ideals under coefficient base change use this scheme, not only its geometric points.

Proof route: Apply the C5 description of contracted toric boundary fibres and formal functions. Use the H3 finite cyclotomic quotient to compute the cusp rings; e is invertible on B.

Direct inputs: `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C6/minimal-polarization-quotient`, `ShimuraCompactifications:C5`, `HilbertModularVarietiesAndShimuraCurves:H3`, `AdicSpacesPartII:F0`.

Acceptance: For e=1 the component is Spec B. A cusp component is not in general a B-rational geometric point.

Source: DIMITROV-AUTHOR, Theorem 8.6(iv), printed p. 548.

#### Connected boundary fibres of Hilbert contraction

`hilbert-minimal-boundary-fibres` — **hilbert_minimal_boundary_fibres** (theorem). Each minimal cusp has inverse image one connected toroidal boundary component. Every other geometric fibre of π is one point of the open Hilbert variety.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Use the C5 constancy of the abelian part along contraction fibres and connectedness. At a Hilbert cusp the abelian part is zero, so the whole boundary component contracts to its cyclotomic cusp.

Direct inputs: `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C6/hilbert-minimal-cusps`, `ShimuraCompactifications:C6/hilbert-semiabelian-extension`, `ShimuraCompactifications:C5`.

Acceptance: Do not replace connected boundary components by separate fan cones.

Source: DIMITROV-AUTHOR, Theorem 8.6(v) and proof using [7] V.2.2, printed pp. 548–549.

#### Toroidal completion over a minimal cusp

`hilbert-minimal-formal-comparison` — **hilbert_minimal_formal_compare** (comparison). Completion of Mbar along π⁻¹(C) is the completed toric union divided by the cusp units with coefficient ring B[ζ_e]^{H_C}; this agrees with the toroidal completion. At e=1 the cyclotomic factor is B.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: Combine the boundary-fibre theorem with the toroidal formal identification. Apply the requested formal-functions theorem for the contraction and coefficient descent; do not assert that the minimal local ring is a single regular toric chart.

Direct inputs: `ShimuraCompactifications:C6/hilbert-minimal-boundary-fibres`, `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `AdicSpacesPartII:F0`, `HilbertModularVarietiesAndShimuraCurves:H3`, `AdicSpacesPartII:F0/completion-of-morphism`, `AdicSpacesPartII:F0/theorem-on-formal-functions`.

Acceptance: The formal completion is on the toroidal inverse image, not an identification of the minimal model with a torus embedding.

Source: DIMITROV-AUTHOR, Theorem 8.6(v), printed p. 548.

#### Weights extending to the Hilbert minimal model

`hilbert-minimal-weight-extension` — **hilbert_minimal_weight_extension** (theorem). For g>1 and integral weight κ over O′[1/Δ], the canonical weight line on M extends to an invertible sheaf on M^{min} if and only if κ is parallel. The pushforward π_*ωκ is coherent for every κ.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. This is the arithmetic weight-base statement of Theorem 8.6(vi); no assertion of the converse over an arbitrary special-fibre quotient of O′ is made.

Proof route: Use C5 coherent proper pushforward and normal/codimension-two extension. Use the H3 cusp-unit action on the trivialized line. For nonparallel κ choose a place of maximal component and the finite-index contracting unit at that place; the weighted logarithmic sum is strictly positive because another component is smaller. Thus the character cannot be trivial. For parallel κ use the norm/polarization law in H3 and C5’s descended determinant line.

Direct inputs: `ShimuraCompactifications:C6/hilbert-conormal-comparison`, `ShimuraCompactifications:C6/hilbert-minimal-cusps`, `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`, `ShimuraCompactifications:C5`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.0`, `ShimuraCompactifications:C6/finite-index-cusp-unit-contraction`.

Acceptance: Nonparallel weights can have reduced characters become trivial in a special coefficient ring; that does not prove invertible extension over the arithmetic weight base.

Source: DIMITROV-AUTHOR, Theorem 8.6(vi) and proof, printed pp. 548–549.

#### The geometric Hilbert q-expansion map

`hilbert-q-expansion-comparison` — **hilbert_qExpansion_compare** (comparison). The q-expansion in Dimitrov Definition 8.4 of a section at an H1 uniformized cusp agrees with its restriction to the C0 completed toric chart, with coefficients in a(κ)=(a⊗O′[1/Δ])^(-κ) and the H3 weight/cyclotomic covariance. A scalar coefficient family is obtained only after trivializing this line.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. g>1 for Koecher automatic regularity; the line and coefficient base include ζ_e.

Proof route: Use the actual universal level chart and weight-line trivialization (5). Apply hilbert-cusp-positive-support and identify the canonical completed restriction with the source’s evaluation map. Export this comparison to H5/B4; neither downstream consumer is a supplier.

Direct inputs: `ShimuraCompactifications:C6/uniformized-level-chart`, `ShimuraCompactifications:C6/hilbert-conormal-comparison`, `ShimuraCompactifications:C6/hilbert-cusp-positive-support`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraCompactifications:C0`, `AdicSpacesPartII:F0`.

Acceptance: Changing uniformization changes the expansion by tracePhase, not by a new modular form.

Source: DIMITROV-AUTHOR, Definition 8.4, equation (5), printed pp. 546–547.

#### Hilbert q-expansion detection with coefficient modules

`hilbert-q-expansion-module-injective` — **hilbert_qExpansion_module_injective** (lemma). On the fixed smooth geometrically connected component over the Δ-inverted weight base A₀ (a localized number ring containing the character and cyclotomic values), completion at the chosen uniformized cusp detects sections of ωκ⊗_{A₀}N for every A₀-module N. The target consists of the actual completed coefficient-line expansions, not a tensor product identified with formal series without proof.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. No claim of injectivity at one cusp for a disjoint union of untested components. Use the smooth Δ-inverted model, not a ramified-base singular local model. The line is invertible and the underlying model is flat over A₀.

Proof route: For finitely generated coefficients over the Dedekind base, reduce to a finite projective module and quotients by prime powers. Use geometric irreducibility of the smooth fibres and schematic density on each thickening to detect a section by the boundary completion. These generic density/completion facts are precise SF.0/F0 requests. Write N as the directed union of its finitely generated submodules. The section descends to a submodule N₀ by the qcqs H0 colimit theorem. The invertible coefficient line a(κ) is flat over A₀, so N₀⊂N induces injective coefficient maps. Thus zero expansion over N already means zero expansion over N₀, where finite-module detection applies. This needs no interchange of a full power-series module with filtered colimits. At a ramified cusp retain the cyclotomic cover and the unit-valued trace phase in the coefficient line; faithful cover descent reduces to the same detection statement.

Direct inputs: `ShimuraCompactifications:C6/hilbert-q-expansion-comparison`, `HilbertModularVarietiesAndShimuraCurves:H1`, `SchemeAndStackFoundations:SF.0`, `AdicSpacesPartII:F0`.

Acceptance: Detection is for a fixed weight; the direct sum of all weight spaces is not injective after reduction (a Hasse form and 1 can have the same expansion). Torsion coefficient modules and infinitesimal thickenings are retained. Testing only reduced geometric points is insufficient. No assertion that an infinite product of coefficients commutes with filtered colimits is used.

Source: DIMITROV-TILOUINE-AUTHOR, §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586; DIMITROV-AUTHOR, Proposition 8.5(i), printed p. 547 (proof delegated to [6], §7).

#### Hilbert q-expansion injectivity

`hilbert-q-expansion-injective` — **hilbert_qExpansion_injective** (theorem). At a uniformized cusp in the fixed geometrically connected c-component, the q-expansion map for ωκ is injective for every coefficient algebra R over O′[1/Δ,ζ_e].

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. No claim of injectivity at one cusp for a disjoint union of untested components.

Proof route: Apply module-coefficient detection to N=R, with its A₀-module structure. Use the completed-chart comparison to obtain the source’s fixed-weight q-expansion principle.

Direct inputs: `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`.

Acceptance: Testing only one component cannot detect a form supported on another component.

Source: DIMITROV-AUTHOR, Proposition 8.5(i), printed p. 547 (proof delegated to [6], §7); DIMITROV-TILOUINE-AUTHOR, §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586.

#### Coefficient descent from Hilbert q-expansions

`hilbert-q-expansion-coefficient-descent` — **hilbert_qExpansion_coefficient_descent** (theorem). For an inclusion R⊂R′ of coefficient algebras and a fixed-weight section f′ over R′, if its full q-expansion at the chosen component cusp has coefficients in the image of the R-valued coefficient line, then f′ descends uniquely to an R-valued form. Flatness of R′ over R is not required.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. The coefficient map is injective. Use the smooth flat model and invertible line over the fixed weight base; a noninjective map requires a separate image formulation.

Proof route: Apply the coefficient exact sequence 0→R→R′→R′/R→0 to the invertible line on the flat model. Global sections are left exact. The image of f′ in the quotient-coefficient section module has zero expansion. Module-coefficient detection makes this image zero. Exactness gives existence over R; injectivity gives uniqueness.

Direct inputs: `ShimuraCompactifications:C6/hilbert-q-expansion-module-injective`, `SchemeAndStackFoundations:SF.0`.

Acceptance: An injective nonflat map is permitted: Z/4→(Z/4)[t]/(2t) supplies a coefficient test for the stronger statement. For a noninjective map R→0, unique recovery is false for nonzero R. The zero coefficient submodule recovers injectivity; the zero unital coefficient ring alone gives a vacuous specialization.

Source: DIMITROV-AUTHOR, Proposition 8.5(ii), printed p. 547 (proof delegated to [6], §7); DIMITROV-TILOUINE-AUTHOR, §7, Definition 7.2 and Proposition 7.3 proof, printed pp. 585–586.

#### Hilbert minimal and toroidal cusp ideals

`hilbert-boundary-ideal-pushforward` — **hilbert_boundary_ideal_pushforward** (theorem). For g>1, on the stated normal Hilbert models π_*I_D=I_cusp, where D is the toroidal boundary and I_cusp is the ideal of the finite étale minimal cusp subscheme. For a parallel weight line Lmin, π_*(π*Lmin⊗I_D)=Lmin⊗I_cusp.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. First over the source arithmetic base; any coefficient extension requires the requested coherent pushforward/base-change comparison, not an automatic equality of pulled-back ideals.

Proof route: Use π_*O=O and the formal q-expansion identification. A function has zero boundary restriction exactly when its constant coefficients vanish, hence exactly when it lies in I_cusp on the minimal model. Glue by completion detection and apply the projection formula for an invertible Lmin.

Direct inputs: `ShimuraCompactifications:C6/hilbert-boundary-constant`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C6/hilbert-minimal-cusps`, `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`, `ShimuraCompactifications:C5`, `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:SF.0`, `AdicSpacesPartII:F0/formal-direct-image-comparison`.

Acceptance: No equality π*I_cusp=I_D is claimed; orders of vanishing can change under refinements. Boundary ideals retain nilpotent coefficients.

Source: DIMITROV-AUTHOR, Theorem 8.6(iv),(v), equation (5) and Theorem 8.3, printed pp. 546–549.

### Ordinary models and finite levels

#### Hilbert models at arbitrary residue primes

`hilbert-ordinary-model-comparison` — **hilbert_ordinary_integral_model_compare** (comparison). For any prime p not dividing the tame level, including p=2 and p ramified in F, the completions of the H2 Deligne–Pappas model and its minimal/toroidal compactifications identify with the C6 models on their common moduli open and cusp charts. The ordinary locus and Hasse neighbourhood models are those of H2’s actual local model.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Use the H2 moduli condition at ramified primes and its ordinary/Rapoport locus, rather than C5’s good-prime smoothness. BHW uses N≥4, (N,p)=1.

Proof route: Match H1/H2 moduli data and the H2 local model on the interior. On the boundary use the C4 family and actual lattice/level maps. Identify the completed models via the requested uniqueness/descent comparison; retain H2’s ordinary-locus hypotheses.

Direct inputs: `ShimuraCompactifications:C6/hilbert-toroidal-model`, `ShimuraCompactifications:C6/hilbert-minimal-normal-projective`, `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H1`, `AdicSpacesPartII:F0`.

Acceptance: Ramification in F and ramification of a level cusp are independent.

Source: BHW-2023, BHW §§5.1.2–5.2, pp. 1744–1748; Dimitrov Theorems 7.2, 8.6.

#### Hilbert Hasse ideal on the boundary

`hilbert-hasse-boundary-comparison` — **hilbert_hasse_boundary_compare** (comparison). The H2 total Hasse ideal on the ordinary Hilbert model is the ideal obtained from the R07.2 determinant of Verschiebung on invariant differentials on its abelian locus, and from T0’s semiabelian extension on the C4 boundary charts. These agree on overlaps and are compatible with the O-action and changes of polarization.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. The generic BT₁ determinant invariant, LF and BT₁ Hodge–Tate sequence have owner R07.2. C6 does not define them. At the toric boundary use the semiabelian Verschiebung/differential construction, not an abelian BT₁ of fixed height 2g.

Proof route: Compare the abelian H2 determinant with imported R07.2 Ha. Use T0’s extension along the C4 charts and the conormal identification; determinant functoriality glues the ideal. Use the actual H2 ordinary local model for p=2 and ramified primes.

Direct inputs: `ShimuraCompactifications:C6/hilbert-conormal-comparison`, `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`, `HilbertModularVarietiesAndShimuraCurves:H2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `HodgeTateAndCanonicalSubgroups:T0`, `HilbertModularVarietiesAndShimuraCurves:H3`.

Acceptance: The determinant line is Z-rank g; partial Hasse factors after splitting are not the definition of a new invariant.

Source: BHW-2023, BHW §5.2, Lemma 5.12 proof, pp. 1746–1748; §7.1, pp. 1759–1760.

#### The Hilbert boundary is ordinary

`hilbert-boundary-ordinary` — **hilbert_boundary_ordinary** (theorem). The Hasse ideal is the unit ideal on the formal toric boundary. Consequently every cusp lies in the ε=0 ordinary neighbourhood, for every permitted prime including p=2 and discriminant primes.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level.

Proof route: On a split torus, Verschiebung is the identity after the Frobenius factorization of [p]; its differential determinant is a unit. Descend this unit-ideal statement from the splitting/cyclotomic chart cover to the actual boundary.

Direct inputs: `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`, `ShimuraCompactifications:C6/hilbert-semiabelian-extension`, `HodgeTateAndCanonicalSubgroups:T0`, `HilbertModularVarietiesAndShimuraCurves:H2`, `SchemeAndStackFoundations:SF.1`.

Acceptance: The boundary lies in the Rapoport locus even though the whole special fibre need not be smooth.

Source: BHW-2023, BHW Lemma 5.12 proof, printed p. 1748.

#### Hasse neighbourhood model comparison

`hilbert-near-ordinary-model` — **hilbert_nearOrdinary_model_compare** (comparison). For 0≤ε<1 with |p|^ε in |L×|, the H2 admissible normalized blowup model of |Ha|≥|p|^ε on the compactified Hilbert model has generic fibre exactly BHW’s X*(ε). Locally its blowup chart before normalization is the p-torsion-free quotient of R⟨T⟩/(T Ha_lift−p^ε). It contains the entire boundary.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Choose an integral element of valuation ε in a coefficient extension, as in H2; normalization and p-torsion removal are part of the supplied model.

Proof route: Compare the H2 ideal construction with the local lift equation. If Ha′−Ha∈pR and ε<1, the ultrametric inequality makes the two valuation conditions equivalent. Use boundary-ordinary and formal/adic generic-fibre comparison.

Direct inputs: `ShimuraCompactifications:C6/hilbert-ordinary-model-comparison`, `ShimuraCompactifications:C6/hilbert-hasse-boundary-comparison`, `ShimuraCompactifications:C6/hilbert-boundary-ordinary`, `HilbertModularVarietiesAndShimuraCurves:H2`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`.

Acceptance: At ε=1, Ha=0 and Ha′=p need not define the same condition. This node does not prove any canonical-subgroup radius; T3 owns those estimates.

Source: BHW-2023, BHW §5.2, pp. 1746–1748; elliptic convention §2.1, p. 1721.

#### Polarization quotients of ordinary neighbourhoods

`hilbert-ordinary-polarization-quotient` — **hilbert_ordinary_polarization_quotient** (theorem). For tame Δ(N), the Hasse inequality is invariant under changing the chosen polarization, and the G ordinary-neighbourhood model is the effective quotient of the G* model. For Γ0(p^n) level, the diagram over the corresponding unlevelled opens is Cartesian and is a finite étale Δ(N)-torsor on the adic moduli locus.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. For compactified formal charts use the actual toroidal/minimal action above; no étale torsor assertion is added at minimal cusps.

Proof route: The underlying O-abelian scheme, hence Hasse ideal, is unchanged by the polarization action. Use H4’s relative Γ0 moduli problem and H3’s tame quotient. The natural subgroup is O-stable, giving the Cartesian property of Lemma 8.5; compare formal charts by equivariance.

Direct inputs: `ShimuraCompactifications:C6/toroidal-polarization-quotient`, `ShimuraCompactifications:C6/minimal-polarization-quotient`, `ShimuraCompactifications:C6/hilbert-near-ordinary-model`, `HilbertModularVarietiesAndShimuraCurves:H3`, `HilbertModularVarietiesAndShimuraCurves:H4`, `SchemeAndStackFoundations:SF.1`.

Acceptance: For full G* p-level, the positive-unit action need not preserve the Weil-pairing constraint; the mixed full-level model is needed.

Source: BHW-2023, BHW Proposition 8.4 and Lemma 8.5, pp. 1766–1767.

#### Finite-level Hilbert boundary maps

`hilbert-p-level-boundary-comparison` — **hilbert_pLevel_boundary_compare** (comparison). The forgetful and finite effective H4 level/polarization maps between Hilbert generic-fibre normal compactifications extend their open moduli maps and agree on completed cusp data, including the induced lattice inclusions, root actions and determinant pairing. The full-level comparison passes through H4’s mixed G-level problem; it is not the quotient of X_{Γ*(p^n)} by all positive units.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Integral models at wild p-level are only those explicitly supplied by H2/H4 and the applicable C5 extension theorem; the BHW generic-fibre tower alone supplies no all-level smooth integral model.

Proof route: Use H4’s actual finite-level action (precomposition by γ∨=det(γ)γ⁻¹) and effective centers. Apply C5’s finite normal compactification extension to the finite open maps. Use C4’s level period maps and H3’s phase compatibility to identify the formal boundary maps.

Direct inputs: `ShimuraCompactifications:C6/hilbert-boundary-formal-comparison`, `ShimuraCompactifications:C6/hilbert-minimal-formal-comparison`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`, `HilbertModularVarietiesAndShimuraCurves:H4`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

Acceptance: The map from full G* to full G level is not generally surjective (BHW §8.2). Finite effective groups at fixed n are not the profinite group Δ(p∞N).

Source: BHW-2023, BHW §5.1.1–5.1.2 and §8.2–8.4, pp. 1742–1745, 1768–1779.

#### Natural integral Hilbert differential lattice

`hilbert-integral-differential-interface` — **hilbert_integral_differential_compare** (comparison). The natural integral conormal lattice on the C6 ordinary toroidal model pulls back on H4 finite levels to the ω⁺ used in BHW §7.1. This comparison supplies the boundary family and natural lattice to T3–T5; the modified inverse-image lattice ω^int, its local freeness and estimates remain T5’s own constructions.

Hypotheses: F is totally real of degree g; O its integers, d its different; f*=f⁻¹d⁻¹. The tame ideal n is coprime to Δ_F and does not divide 2 or 3, as in Dimitrov’s introduction; c is prime to n. B=Z[1/N(n)]. Use the actual torsion-free moduli input H1, not an unrestricted level. Use O⊗O⁺-rank one only on the stated Rapoport locus; p may ramify in F.

Proof route: Take the conormal of the actual formal semiabelian family and apply the requested formal/generic-fibre sheaf comparison. Use the moduli compatibility of finite level pullback and the ordinary-model comparison.

Direct inputs: `ShimuraCompactifications:C6/hilbert-conormal-comparison`, `ShimuraCompactifications:C6/hilbert-near-ordinary-model`, `ShimuraCompactifications:C6/hilbert-p-level-boundary-comparison`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H4`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R3`.

Acceptance: At ramified primes the natural lattice can differ from T5’s ω^int. No canonical subgroup or Igusa torsor is constructed here.

Source: BHW-2023, BHW §7.1, Definition 7.3 and Proposition 7.4, pp. 1759–1760.

### Modular curve comparisons

#### Degree-one compactification comparison

`modular-toroidal-minimal-comparison` — **modular_toroidal_minimal_compare** (comparison). For F=Q, after identifying principal polarizations and the same tame and finite p-level moduli data and bases, the generic-fibre normal Hilbert toroidal and minimal curves are canonically isomorphic to the compactified coarse modular curves of R13.4a. The isomorphism restricts to the moduli identification on the open and identifies the cusp subschemes.

Hypotheses: Work in characteristic zero, component by component, with the precise full/fixed-pairing/Γ1/Γ0 level and coefficient field supplied by R13.4a. For full level retain the Weil-pairing/cyclotomic component field; do not collapse it to the tame Γ1 curve.

Proof route: The H1 HBAV moduli problem at F=Q is the elliptic one with the specified level. Use the R13.4a normal proper coarse construction. Normal proper curve completions of the common dense open are uniquely isomorphic. A proper birational contraction of normal curves is an isomorphism, so toroidal and minimal generic curves coincide.

Direct inputs: `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H4`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `ModularCurvesPartII:R13.4a`, `SchemeAndStackFoundations:SF.0`.

Acceptance: g=1 does not satisfy arithmetic Koecher; a pole at a cusp can exist. Composite and full levels use R13.4a.

Source: MODULAR-CURVES-II, R13.4a; BHW §2.1 and §5.1.2.

#### Modular cusp parameters and analytification

`modular-formal-cusp-comparison` — **modular_formal_cusp_compare** (comparison). Under the degree-one comparison, the C4 Tate/Mumford family, cusp fields and the formal q parameter agree with R13.4a/R13.4b. For a cusp of width w, j=q_Tate⁻¹+744+… and q_Tate=t^w in its level cusp parameter t. Analytification and the permitted level/degeneracy correspondences commute with this identification.

Hypotheses: Use R13.4b’s component and correspondence descent hypotheses; at stack level keep inertia, and at coarse level keep cusp width. Generic fibre and completed cusp comparisons use the formal/adic comparison F0/R2/R3.

Proof route: Identify the universal Tate object on the common punctured cusp using C4’s uniqueness. Transport the character inclusion at the cusp; its index is the width, giving q_Tate=t^w. Use R13.4b’s analytic and correspondence comparison rather than proving analytic uniformization here.

Direct inputs: `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`, `ShimuraCompactifications:C4`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`, `AdicSpacesPartII:F0`, `AdicSpacesPartII:R2`, `AdicSpacesPartII:R3`.

Acceptance: At width w>1 the coarse parameter t is not the Tate q itself. A coarse-space map is not a substitute for a stack correspondence.

Source: MODULAR-CURVES-II, R13.4a and R13.4b; BHW §2.1.

#### PR81 prime diamond quotient comparison

`prime-diamond-pr81-comparison` — **modular_primeDiamond_PR81_compare** (comparison). For prime N≥5 and H≤(Z/N)×/{±1}, the generic-fibre compactification for the corresponding diamond quotient agrees with PR81 Modular Curves Layer 10 through R13.4a. The comparison identifies the affine open, cusp divisor and normalization over the j-line.

Hypotheses: Apply only to this prime diamond class, with its precise level quotient.

Proof route: Use R13.4a’s agreement with PR81 after inverting N. Compose with the degree-one compactification comparison and retain the checked finite-normal j-line conditions.

Direct inputs: `ShimuraCompactifications:C6/modular-toroidal-minimal-comparison`, `ModularCurvesPartII:R13.4a`, `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.

Acceptance: This statement does not cover general full or composite level, or an arbitrary H in GL2.

Source: MODULAR-CURVES-II, R13.4a; reviewed Modular Curves → C6 link.

## Supplier contracts and closure

The supplier stages without matching declaration-level nodes have the following exact requests. Existing C0 coordinate/boundary node IDs are used directly where their statements match. Their arithmetic completion extensions remain requested.

### ShimuraCompactifications:C0

Arithmetic Hilbert admissible fans: complete positive cone, locally finite away from zero, finite modulo effective units, regular equivariant refinements; completed t-adic toric charts, coefficient/support description, localization shifts and boundary-union ideal (t), retaining nilpotents. Existing relative regular-coordinate nodes are reused; this request is for their missing completion and arithmetic admissibility interfaces.

Consumed by `hilbert-cusp-positive-support`, `admissible-fan-specialization`, `hilbert-boundary-formal-comparison`, `hilbert-boundary-etale-charts`, `hilbert-regular-refinement`.

### ShimuraCompactifications:C4

Relative polarized Mumford chart and its actual semiabelian family, compatible with R11.3 Raynaud uniformization, level exact sequence, face changes, cusp-unit/cyclotomic changes and invariant differentials. For F=Q supply the Tate comparison and character inclusions determining cusp widths. Generic degeneration and Raynaud carriers stay here/R11.3.

Consumed by `meromorphic-cusp-support-bound`, `hilbert-cusp-positive-support`, `arithmetic-koecher`, `uniformized-level-chart`, `hilbert-semiabelian-extension`, `hilbert-conormal-comparison`, `hilbert-toroidal-proper`, `hilbert-p-level-boundary-comparison`, `modular-toroidal-minimal-comparison`, `modular-formal-cusp-comparison`.

### ShimuraCompactifications:C5

Specialize the generic integral compactification effectivity to the Hilbert boundary presentation on B=Z[1/N(n)] with H2 local models at discriminant primes; supply finite normal compactification of finite generic level maps. Supply determinant Hodge semi-ampleness, normalized section-ring/Veronese comparison, finite generation including finiteness over the Veronese, projectivity, normality, connected fibres, constancy of abelian parts, coherent pushforward/projection formula and the allowed base changes. Good-prime smoothness is not imported at a discriminant prime.

Consumed by `hilbert-cusp-positive-support`, `arithmetic-koecher`, `hilbert-toroidal-model`, `hilbert-toroidal-proper`, `hilbert-hodge-semiampleness`, `hilbert-minimal-contraction`, `hilbert-minimal-finite-generation`, `hilbert-minimal-normal-projective`, `minimal-polarization-quotient`, `hilbert-minimal-cusps`, `hilbert-minimal-boundary-fibres`, `hilbert-minimal-weight-extension`, `hilbert-boundary-ideal-pushforward`, `hilbert-p-level-boundary-comparison`, `modular-toroidal-minimal-comparison`.

### ShimuraCompactifications:C3

Cusp-equivariant regular refinements and comparison morphisms on actual arithmetic locally finite fans. The C6 specialization only identifies the Hilbert charts; generic refinement geometry remains C3.

Consumed by `hilbert-regular-refinement`.

### HilbertModularVarietiesAndShimuraCurves:H1

The actual fine HBAV moduli scheme at the stated torsion-free tame level, its universal family, polarization module and trace/different convention f*=f⁻¹d⁻¹. Supply (R,n)-cusp data a,b,L,β, c=ab⁻¹, b′/b and X=cbb′; the latter is the level-image lattice, not cb² at every cusp. Identify the signed real trace pairing and elliptic moduli specialization at F=Q. Supply smoothness and geometric connectedness/irreducibility of the fixed c-component on the Δ-inverted weight base, as used by Dimitrov–Tilouine §7.

Consumed by `positive-exponents-on-charts`, `meromorphic-cusp-support-bound`, `hilbert-cusp-positive-support`, `cusp-lattice-comparison`, `uniformized-level-chart`, `hilbert-regular-refinement`, `hilbert-conormal-comparison`, `hilbert-ordinary-model-comparison`, `modular-toroidal-minimal-comparison`, `hilbert-q-expansion-module-injective`.

### HilbertModularVarietiesAndShimuraCurves:H2

Deligne–Pappas model and Rapoport/ordinary local model at all p prime to tame level, including ramification and p=2; intrinsic total Hasse ideal imported from R07.2 det(V*), compatible with conormal and polarization. Supply finite-presentation ordinary neighbourhoods, normalized admissible blowup with p-torsion removal, lift independence for ε<1, and exact permitted integral compactification comparisons. T3/T5 quantitative canonical subgroup and modified lattice results are not assumed here.

Consumed by `hilbert-conormal-comparison`, `hilbert-ordinary-model-comparison`, `hilbert-hasse-boundary-comparison`, `hilbert-boundary-ordinary`, `hilbert-near-ordinary-model`, `hilbert-p-level-boundary-comparison`, `hilbert-integral-differential-interface`.

### HilbertModularVarietiesAndShimuraCurves:H3

Full cusp stabilizer: 0→X*→stabilizer→U_C→1 with effective action u²ε; congruences u−1∈n b′b⁻¹ and uε−1∈bb′⁻¹, as verified in Proposition 3.3(iv). Supply enlarged component stabilizers, finite cyclotomic H_C and H_C,1, finite-index U_C,1⊂O×, weight/root covariance and line descent. Supply finite tame Δ(N), free toroidal action at torsion-free tame level and possibly stabilizing minimal action. Do not identify the full stabilizer with its finite cyclotomic image.

Consumed by `meromorphic-cusp-support-bound`, `hilbert-cusp-positive-support`, `arithmetic-koecher`, `cusp-lattice-comparison`, `admissible-fan-specialization`, `uniformized-level-chart`, `toroidal-polarization-quotient`, `hilbert-boundary-formal-comparison`, `hilbert-conormal-comparison`, `minimal-polarization-quotient`, `hilbert-minimal-cusps`, `hilbert-minimal-formal-comparison`, `hilbert-minimal-weight-extension`, `hilbert-q-expansion-comparison`, `hilbert-hasse-boundary-comparison`, `hilbert-ordinary-polarization-quotient`, `hilbert-p-level-boundary-comparison`.

### HilbertModularVarietiesAndShimuraCurves:H4

Actual finite full/fixed-pairing/Γ1/Γ0 levels and mixed G-level problem; γ∨=det(γ)γ⁻¹ precomposition on dual level data, pairing components, effective finite groups and componentwise quotients. Supply finite period/character maps at cusps, and exactly the permitted integral models at wild levels; distinguish them from generic-fibre models and from the profinite infinite tower.

Consumed by `hilbert-ordinary-polarization-quotient`, `hilbert-p-level-boundary-comparison`, `hilbert-integral-differential-interface`, `modular-toroidal-minimal-comparison`.

### AdicSpacesPartII:F0

Formal completion, algebraization of the prescribed cusp étale relation and uniqueness from schematic density. On Noetherian models supply finite-pole presentation off an effective Cartier divisor, injectivity of completed coefficient description, detection of regularity/ideal membership, and formal functions for the proper contraction. Specify exactly when these commute with coefficient change; arbitrary completion/tensor interchange is not assumed. Supply the module-valued coefficient description and detection on the specified arithmetic thickenings, retaining torsion; no reduced-point test substitutes for this.

Consumed by `meromorphic-cusp-support-bound`, `arithmetic-koecher`, `hilbert-boundary-constant`, `hilbert-toroidal-model`, `hilbert-boundary-formal-comparison`, `hilbert-boundary-etale-charts`, `hilbert-minimal-cusps`, `hilbert-minimal-formal-comparison`, `hilbert-q-expansion-injective`, `hilbert-boundary-ideal-pushforward`, `hilbert-ordinary-model-comparison`, `hilbert-near-ordinary-model`, `hilbert-integral-differential-interface`, `modular-formal-cusp-comparison`, `hilbert-q-expansion-module-injective`, `hilbert-q-expansion-comparison`.

### AdicSpacesPartII:R2

P-adic completion and generic-fibre comparison for the specified formal ordinary neighbourhoods; normality and codimension conditions for any formal Hartogs use remain explicit.

Consumed by `hilbert-near-ordinary-model`, `modular-formal-cusp-comparison`.

### AdicSpacesPartII:R3

Adic analytification of the finite-type generic models, its agreement with the p-adic completion generic fibre, coherent conormal pullback, and compatibility of the supplied level/cusp maps and Hasse rational domains.

Consumed by `hilbert-near-ordinary-model`, `hilbert-integral-differential-interface`, `modular-formal-cusp-comparison`.

### SchemeAndStackFoundations:SF.0

Semiabelian/conormal and invertible-line boundary exact sequences, normal proper curve uniqueness, proper coherent pushforward and projection formula. For arbitrary coefficients supply H0 on qcqs finite-presentation models/lines commuting with filtered colimits of coefficient algebras; descend line, open immersion and section data to finitely generated subalgebras. This replaces invalid tensor/completion interchange. For q-expansion detection supply schematic density on prime-power thickenings of a smooth geometrically irreducible fibre, flat-line coefficient exactness and H0 on qcqs models commuting with filtered colimits of coefficient modules. Use directed unions of finitely generated submodules and the injective coefficient maps induced by an invertible line; full formal series need not commute with colimits.

Consumed by `arithmetic-koecher`, `hilbert-boundary-constant`, `hilbert-minimal-normal-projective`, `hilbert-minimal-weight-extension`, `hilbert-q-expansion-injective`, `hilbert-boundary-ideal-pushforward`, `modular-toroidal-minimal-comparison`, `hilbert-q-expansion-module-injective`, `hilbert-q-expansion-coefficient-descent`.

### SchemeAndStackFoundations:SF.1

Effective étale and faithful-flat descent of the actual families, weight lines, ideals and sections; finite tame invariant quotients, including finite cyclotomic coefficient covers and normal projective coarse quotients. No exactness by division by a group order in a noninvertible integral coefficient ring.

Consumed by `arithmetic-koecher`, `hilbert-boundary-constant`, `hilbert-toroidal-model`, `toroidal-polarization-quotient`, `hilbert-semiabelian-extension`, `minimal-polarization-quotient`, `hilbert-boundary-ordinary`, `hilbert-ordinary-polarization-quotient`.

### NeronModelsAndSemistableAbelianVarieties:R11.3

Use the existing finite-separable-semistable-extension and positive-residue-characteristic rigid-uniformisation nodes. Additionally specify the split polarized period description needed for complete arithmetic valuation rings in the valuative proof, including equal/residue characteristic zero where the current rigid node does not apply; compatibility with C4 charts and uniqueness of the semiabelian extension remain explicit requests.

Consumed by `hilbert-toroidal-model`, `hilbert-semiabelian-extension`, `hilbert-toroidal-proper`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

As required by confirmed RT-AREA-padic-1/26, own the generic BT₁ invariant Ha(G)=det(V*) over F_p-schemes, LF and the BT₁ Hodge–Tate sequence; supply its abelian compatibility to H2. This is an additional requested interface to R07.2, not a claim that its current perfect-field Dieudonné description already proves it.

Consumed by `hilbert-hasse-boundary-comparison`.

### HodgeTateAndCanonicalSubgroups:T0

Keep only the extension of the R07.2 differential/Hasse API to semiabelian degeneration charts, with the toric/abelian pieces and varying boundary height explicit. Supply split-torus Verschiebung determinant a unit and compatibility on overlaps; C6 consumes it to compare the actual Hilbert boundary, without moving generic Ha/LF ownership here.

Consumed by `hilbert-hasse-boundary-comparison`, `hilbert-boundary-ordinary`.

### ModularCurvesPartII:R13.4a

Compactified coarse modular curves for full, fixed-pairing, Γ1 and refined Γ0 levels, with bases, normality/properness, cusps and moduli identification. Supply agreement with PR81 Layer 10 only for prime N≥5 diamond H≤(Z/N)×/{±1}, including finite normal j-line and schematic-density conditions.

Consumed by `modular-toroidal-minimal-comparison`, `modular-formal-cusp-comparison`, `prime-diamond-pr81-comparison`.

### ModularCurvesPartII:R13.4b

Generic-fibre analytic comparison for R13.4a curves with component, determinant and cusp fields and the Tate cusp width parameter. Supply degeneracy/correspondence compatibility with its Hecke normalization and applicable stack-to-coarse descent.

Consumed by `modular-formal-cusp-comparison`.

### tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering

Use the existing prime N≥5 diamond quotient construction, its cusp subscheme and normalization over the j-line, only through the agreement supplied by R13.4a. No upstream construction is re-planned.

Consumed by `prime-diamond-pr81-comparison`.

## Remaining gaps

- **Geometric supplier interfaces and suggested signatures.** The target-level mathematical statements are specified, but the current baseline has no HBAV cusp, arithmetic completed toric fan, Hilbert moduli, relative semiabelian or Hasse-neighbourhood carrier. Exact interfaces are requested from their unique owners. Consequently these named geometric signatures are omitted from the suggested file, with a per-node omission ledger; there are no substitute propositions or axiomatized opaque geometry. Populate genuine signatures once the supplier objects exist.
- **Noninjective maps in the printed coefficient-descent statement.** Dimitrov Proposition 8.5(ii) prints any R-algebra R′ but writes an inclusion of coefficient modules. The cited companion, Dimitrov–Tilouine Proposition 7.3(2), explicitly uses an inclusion R⊂R′ and its proof uses quotient coefficient modules. The inclusion theorem, without a flatness hypothesis, is now planned. A separate image/existence formulation for noninjective maps remains unspecified and is not needed for this target; uniqueness under R→0 is false for nonzero R.
- **Integral wild-level compactification comparison.** BHW §5.1.2 constructs the added p-level models over Q and completes tame level over O_L. It does not by itself identify an integral compactification at every wild full level and ramified residue prime. The H2/H4/C5 requests specify the exact additional local-model and normalization/base-change theorem needed. This remains a supplier gap, not a claim of smooth all-level models.
- **Version-of-record collation and independent source-issue review.** The entire author-hosted typeset copy was read in this run. Its printed pagination differs from the published citation. The publisher version and errata remain unverified; E-C6-1 and E-C6-2 are scoped to the accessed preprint/author copy and require independent review. No result relies on an asserted publisher correction. The companion explains E-C6-2’s intended zero-module interpretation; the earlier proposed replacement R=C is not retained. E-C6-3 records the invalid full-series colimit step in the companion author copy; the node uses a directed-union repair. This new finding also needs version-of-record collation and independent review.

These gaps prevent closure, not target-level coverage. A follow-up closes the supplied interfaces and fills genuine geometric signatures, specifies any separate noninjective-map q-expansion formulation and permitted integral wild-level comparison, and collates the source issues. It does not construct a second HBAV, fan, Raynaud quotient, Hasse invariant or modular-curve carrier.

## Baseline and sources

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was read at that commit, rather than inferred from a name search. The reviewed C6 audit marks the geometric targets missing and identifies the existing unit/positivity slice. A fresh focused search found no Hilbert modular, Koecher, Hasse invariant or semiabelian carrier in the pinned library scope.

- **mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit**: For a selected infinite place, an integer unit has negative logarithm at every other place. Reuse this existing theorem; its unrestricted unit need not lie in the cusp subgroup.
- **mathlib:NumberField.Units.sum_mult_mul_log**: The weighted sum of logarithms of an integer unit is zero.
- **mathlib:NumberField.Units.pos_at_place**: The absolute value of an integer unit at each infinite place is strictly positive.
- **mathlib:NumberField.IsTotallyReal.mult_eq**: Each infinite-place multiplicity is one in a totally real field.
- **mathlib:Subgroup.exists_pow_mem_of_index_ne_zero**: A positive power of every group element belongs to a subgroup of nonzero index, with exponent at most its index.
- **tauceti:NumberField.isTotallyPositive_iff**: The existing strict positivity predicate is positivity at every real infinite place. Zero is not totally positive in a totally real number field.
- **tauceti:NumberField.isTotallyPositive_sq**: Every nonzero square is totally positive, including squares of integer units.
- **mathlib:tendsto_pow_atTop_atTop_of_one_lt**: Powers of a real number greater than one tend to positive infinity.
- **mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one**: Powers of a nonnegative real number strictly below one tend to zero.
- **mathlib:Units.mul_right_eq_zero**: Multiplication by a unit on the left preserves whether an element is zero; no domain or nontriviality hypothesis.
- **mathlib:Finset.one_lt_prod_iff_of_one_le**: The indexed multiplicative statement generates Finset.sum_pos_iff_of_nonneg by to_additive. Its generated additive signature was checked by pinned Lean: a finite sum of nonnegative terms is positive exactly when one term is positive. Both source statements were read; the shared text index lists the generating declaration.
- **mathlib:Submodule.traceDual**: Existing integral trace dual of a Z-submodule of a number field, using the rational trace form.
- **mathlib:Submodule.mem_traceDual**: Membership means every trace pairing with the original module lies in the range of Z→Q.

The upstream AnalyticToricGeometry and AdicSpaces documents were read for object conventions and roadmap/API density. The shared build has the pinned Mathlib. Its missing Tau Ceti TotallyPositive object file is avoided by spelling strict positivity as the equivalent signed-real-embedding condition under IsTotallyReal; the existing Tau Ceti definition is neither duplicated nor replaced by a new predicate.

- [Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)](https://arxiv.org/pdf/math/0212071v3) — Mladen Dimitrov, arXiv math/0212071v3, 7 November 2004, 28 physical pages. Read: Entire 28-page preprint: introduction, §§1–8 and bibliography; read in batches of at most three physical pages. Koecher and Fourier arguments: pp. 22–24; rendered p. 24 inspected. Comparison with author-hosted typeset copy: physical pp. 1, 22–24, with printed pp. 546–548 at the latter three pages; rendered printed p. 547 inspected.
- [Compactifications arithmétiques des variétés de Hilbert et formes modulaires de Hilbert pour Γ1(c,n)](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf) — Mladen Dimitrov, Author-hosted typeset copy, 27 physical pages, printed pp. 525–551; not certified as the publisher version of record. Read: Entire author copy, §§1–8 and bibliography. Rechecked Definition 3.2, Proposition 3.3(iv), Proposition 4.1, Theorem 7.2, Corollaries 7.4–7.5, Proposition 7.6, Theorem 7.7, equation (5), Theorem 8.3, Proposition 8.5, and all six assertions of Theorem 8.6.
- [Overconvergent Hilbert modular forms via perfectoid modular varieties](https://www.numdam.org/item/10.5802/aif.3560.pdf) — Christopher Birkbeck, Ben Heuer and Chris Williams, Annales de l’Institut Fourier 73(4) (2023), pp. 1709–1794, DOI 10.5802/aif.3560. Read: §1.5 notation and §2.1 elliptic compactification and Hasse neighbourhoods. §5.1 moduli/level conventions and §5.2 ordinary neighbourhoods and boundary inputs to Lemma 5.12. Remark 6.9, §7.1 semiabelian and natural versus modified integral differentials. §8.1 finite polarization action, §8.2 mixed full levels, §8.4 tower actions; Remark 9.9 and Theorem 9.12 inspected for consumer boundaries.
- [Modular curves, Part II: integral models and p-adic geometry](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/campaign/ModularCurvesPartII/README.md) — Tau Ceti Atlas roadmap programme, Roadmap supplier contract at this repository’s main input; layers R13.4a and R13.4b. Read: R13.4a and R13.4b with their dependencies; reviewed Modular Curves link-map entries into C6.
- [Variétés et formes modulaires de Hilbert arithmétiques pour Γ1(c,n)](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf) — Mladen Dimitrov and Jacques Tilouine, Author-hosted typeset copy, 58 physical pages, printed pp. 553–610; not certified as the publisher version of record. Read: §7 opening geometric irreducibility and weight extensions, Koecher Theorem 7.1, q-expansion Definition 7.2, Proposition 7.3 and its complete proof, Remark 7.4, printed pp. 584–586.

The preprint’s read record is preserved from the earlier checkpoint. The entire author-hosted Dimitrov copy, the relevant published BHW sections and the full cited Dimitrov–Tilouine §7 q-expansion proof were read for this pass. Rapoport, Chai, Faltings–Chai, Moret-Bailly and Lan are cited by these sources; their generic inputs are requested at their owners, and no independent full reading of those books is claimed. The [BCGP25 routed passage](https://arxiv.org/abs/2502.20645), Theorem 1.8.29 proof, was checked: its smooth toroidal normal-crossing input concerns Siegel threefolds and belongs to C2–C5. It supplies no additional Hilbert C6 theorem. The other issue routes confined to C3–C5 do not enlarge this part’s scope.

Source issues retained for independent verification:

- **ShimuraCompactifications/E-C6-1**, Theorem 8.3 proof, arXiv v3 p. 24; same text in author copy printed p. 547: Choose ξ₀ outside X_+∪{0}: explicitly require ξ₀≠0 before obtaining a strictly negative real embedding or trace pairing. At ξ₀=0 all pairings are zero, so the displayed negative-trace conclusion is false. The preceding definition allows the zero exponent and the theorem retains constant terms. This corrects the proof wording, not the theorem.
- **ShimuraCompactifications/E-C6-2**, Sentence after Proposition 8.5(iii), arXiv v3 p. 24; author copy printed p. 548: Read the zero object as the zero coefficient submodule in the additive-module descent argument: a section whose expansion is zero is zero. As a specialization of unital coefficient-ring inclusions, R=0 forces R′=0 and is vacuous; replacing R by C is not the intended inference. Dimitrov–Tilouine §7, Proposition 7.3 proof, derives both assertions from injectivity with arbitrary abelian coefficient groups. This explains the intended zero-module case. The previous checkpoint’s proposed R=C correction is withdrawn; the only precision issue is calling that zero module a coefficient ring.
- **ShimuraCompactifications/E-C6-3**, Proposition 7.3 proof, author copy printed p. 586: Use directed unions of finitely generated coefficient submodules and coefficientwise injectivity from the invertible coefficient line. Only H0 on the qcqs model needs the colimit theorem; do not claim colimit commutation for the entire formal-series target. Let N_j=Z^j with the coordinate inclusions, N=the direct sum of countably many copies of Z. The series whose ith coefficient is the ith basis vector lies in N[[q]] but in no N_j[[q]]. Hence colim_j N_j[[q]]→N[[q]] is not surjective. The source’s conclusion is repaired by the directed-union argument: zero in N is detected already in each N_j because every coefficient map is injective.

All three findings are scoped to the accessed versions. No publisher erratum is claimed. The arbitrary-map formulation of Proposition 8.5(ii) is recorded as an unresolved precision gap, rather than a proven source error.

The six planets are **Arithmetic Koecher principle**, **Hilbert boundary-ideal criterion**, **Hilbert toroidal compactification**, **Universal semiabelian extension**, **Hilbert minimal compactification**, **Ordinary Hilbert boundary**.
