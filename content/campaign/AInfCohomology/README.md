# Integral A_inf cohomology and Breuil–Kisin–Fargues structures

## Scope and division of work

Build the actual AΩ complex and integral A_inf cohomology of p-adic formal
schemes, with its local computations, BKF structures and semistable extension.
The main proper theorem starts with a smooth proper formal scheme over O_C,
where C is a complete algebraically closed nonarchimedean extension of Q_p.
The local construction admits the explicitly cited perfectoid-field variants;
properness/finiteness conclusions are not asserted for arbitrary affines.

PerfectoidSpaces supplies tilting and almost purity; AdicEtaleGeometry supplies
the corrected pro-étale site. CrystallineCohomology supplies generic PD/crystalline
and log constructions; DerivedDeRhamCohomology supplies derived completion and
cotangent theory; EnhancedDerivedSheaves supplies enhanced sheaf operations.
PadicHodgeTheory supplies rational period rings/functors and relative rational
period sheaves. This owner supplies their common **integral A_inf sheaf** and
AΩ comparison input, not another rational admissibility theory.

The term Breuil–Kisin–Fargues means modules over A_inf. Classical Breuil–Kisin
modules over W(k)[[u]] and their finite-flat classification retain their R07
owner. The cohomological construction over that ring is AI.7. RefinedTraceMethods
owns THH/TC and BMS2's trace-theoretic realization. Prismatics supplies a
compared, Frobenius-twisted construction, not an identification by renaming.

<a id="ai-0"></a>

<a id="stage-AI.0:integral"></a>

## AI.0. Period-ring interfaces and normalization

Reuse the common integral perfectoid ring and Witt-vector definitions to form
A_inf=W(O_C^flat), its Frobenius and theta:A_inf→O_C. Construct the residue
map to W(k), and identify the kernel generator with the existing period-ring
one. With a chosen compatible system epsilon of primitive p-power roots define
mu=[epsilon]−1, xi=mu/phi^(-1)(mu), and tilde-xi=phi(xi). Prove the displayed
quotient exists and generates the stated ideal rather than using field division.

Record theta and tilde-theta=theta∘phi^(-1), their kernels xi and tilde-xi,
and the exact Frobenius twisting of scalar extension. Prove nonzerodivisor,
completeness and torsion properties used later. A_cris is the completed PD
envelope from CR.0, and B_dR^+ is the kernel-adic completion after p-inversion
supplied by PadicHodgeTheory. Prove the common ring maps, not a second set
of unconnected constants.

Construct Breuil–Kisin twists and their tensor powers with source orientation,
distinguishing A_inf{1}, its étale Z_p(1) realization and the reduction twist
(I/I²). Prove change-of-epsilon comparison; auxiliary generators are not part
of the intrinsic cohomology theory. Sources: BMS1 §3; BS22 §§2–3,17.

<a id="stage-AI.0:period-comparison"></a>

The integral A_inf/theta/PD/twist prefix of AI.0 precedes R06.1. Its comparison
with the subsequently constructed rational period rings is a later substage,
AI.0:period-comparison, importing R06.1; the integral definition does not
depend on that comparison. AI.2 uses those rational rings only after they exist.

<a id="ai-1"></a>

## AI.1. The derived décalage operator Lη

For the completion statements of BMS1 §6.2 below, work on a **replete ringed
topos** and take J locally finitely generated, as required in that section's
opening assumptions. These are explicit hypotheses of the completion exports,
not implicit properties of every ringed topos.

For a nonzerodivisor f∈A, construct eta_f on a termwise f-torsionfree complex
inside its localization: in degree i use those elements in f^i K^i whose
differential belongs to f^(i+1)K^(i+1). Establish the shifted convention for
unbounded complexes and prove independence of a torsionfree representative,
yielding Lη_f on the derived category.

Prove its cohomology formula removing f-torsion with the appropriate degree
scaling, its natural transformation after localization, compatibility with
composition in eligible elements, and its lax symmetric monoidal structure.
It is not an exact functor on all triangles and it does not commute with all
base changes. Prove the precise base-change criterion used for AΩ and the
Bockstein description modulo f; carry the Bockstein differential, not just
the graded cohomology modules.

Own the derived-completeness interface explicitly. For an invertible ideal I in a ringed topos, prove that Lη_I preserves derived J-completeness under **BMS1 Lemma 6.19**. This is preservation of completeness, not commutation with arbitrary J-adic completion. For the same ideal I, construct and prove the I-completion comparison maps of **Lemma 6.20**, including the inverse-limit model using C tensor^L O/I^n. Its hypotheses and coefficient ideal must remain on the export consumed by saturated Dieudonne theory in CR.4 and its ordinary de Rham–Witt applications. Include a regression example demonstrating why the unrestricted claim that Lη commutes with completion cannot be substituted. The lemma's ringed-topos and locally free rank-one ideal formulation is the generic owner; the principal f notation above is its affine chart.

Prove the Koszul calculation for commuting endomorphisms and integral
continuous cochains. Crystalline CR.4 imports this early, purely homological
stage for saturated Dieudonne complexes; it does not import later crystalline
comparisons of AΩ and create a cycle.
Acceptance: a two-term multiplication complex, f-torsion cohomology, a
commuting Koszul pair and a case where an unjustified exactness assertion fails.
Sources: BMS1 §§6–7; BLM §§2,7–8.

<a id="ai-2"></a>

## AI.2. BKF modules, lattices and modifications

Construct finitely presented A_inf-modules M, finite free after p-inversion,
equipped with phi-semilinear isomorphisms M[1/xi]→M[1/tilde-xi].
State precisely the relation with the linearized Frobenius presentation.
Build kernels, tensor/dual operations in their valid subcategories, torsion
decompositions and the étale/Witt specializations. This category is not
automatically abelian or closed under arbitrary cokernels.

Prove Fargues' equivalence for **finite free** BKF modules over algebraically
closed C with pairs (T,Xi), where T is finite free over Z_p and Xi is a
B_dR^+-lattice in T tensor B_dR. Construct both directions, full faithfulness
and tensor/Tate-twist compatibility using the analytic annulus/patching
arguments of BMS1 §4. The associated geometric modification comparison uses
the existing Fargues–Fontaine curve/patching carriers; no new FF curve is
built. Do not extend the finite-free classification to every finitely
presented torsion BKF object.

For descent from a discretely valued field retain the Galois action and its
continuity, not only the underlying pair over C. Acceptance: unit object,
Tate twist, a nontrivial lattice modification and a torsion/cokernel failure.
Source: BMS1 Definition 4.22, Lemmas 4.26–27, Theorem 4.28 and its proof.

<a id="ai-3"></a>

## AI.3. Integral pro-étale sheaves and the AΩ construction

On the analytic generic fiber X of a smooth p-adic formal scheme mathfrak X,
construct the completed integral structure sheaf, its tilt and the Witt
A_inf,X sheaf. Prove the comparison with rational period sheaves after the
correct completion/localization. Use the corrected transfinite pro-étale
covers and the structural period-sheaf completion from Scholze's corrigendum;
open surjections of arbitrary profinite sets need not split.

For nu:X_proet→mathfrak X_Zar, define AΩ=Lη_mu Rnu_* A_inf,X in the shared
enhancement and construct Frobenius and multiplication. Build a toric
perfectoid cover of a small framed affine, compute its continuous group
cochains using the canonical general cohomology carrier, and prove the almost
purity comparison. Show exactly how Lη upgrades the needed almost
comparison; an almost isomorphism is not itself an integral isomorphism.

Prove framing independence, restriction/sheaf descent and functoriality.
Separate the integral component of the toric cochains from nonintegral
monomials and prove the annihilation estimates; do not simply label the
complex as q-de Rham. Sources: BMS1 §§7–9.
Acceptance: O_C, the formal torus and two different framings of one smooth
affine. This construction does not use the final prismatic comparison.

<a id="ai-4"></a>

## AI.4. Local specializations and crystalline comparison

Prove the Hodge–Tate reduction of AΩ along tilde-theta, identifying its
cohomology sheaves with differential forms and BK twists. Prove that the
Bockstein reconstructs the de Rham differential. Distinguish this from the
theta specialization, which yields the actual de Rham complex.

Construct the relative de Rham–Witt comparison using CR.4's Langer–Zink
objects and the universal Witt-complex maps. Build the absolute A_cris
comparison by compatible PD envelopes and the all-coordinates construction;
prove presentation independence and the maps of multiplicative complexes.
This gives the Witt-special-fiber comparison only through the correct
derived base change. AI.3's local definition does not depend on this stage.

After mu-inversion prove the étale comparison with the actual p-adic
cohomology of the generic fiber, including derived p-completion where used.
Replacing mu-inversion by p-inversion or special-fiber p-adic étale
cohomology would give a different statement.
Sources: BMS1 §§8,10–12 and Theorem 1.10; BLM's compared crystalline route.

<a id="ai-5"></a>

## AI.5. Proper A_inf cohomology and torsion control

For smooth proper mathfrak X/O_C construct RΓ_Ainf=RΓ(mathfrak X,AΩ).
Prove perfectness and finite presentation of its cohomology, and that the
latter satisfy the BKF conditions. Globalize AI.4 to the derived theta,
W(k), A_cris and mu-inverted specializations, including cup products,
Frobenius, functoriality and base change. Do not replace these derived
equivalences by degreewise tensor identities without flatness/Tor arguments.

Prove the linear algebra controlling integral torsion under these
specializations. CohomologyComparisons CP.5 states the resulting torsion
inequalities and lattice-recovery applications uniformly, importing this
proof rather than assuming cohomology is finite free. In particular, adjacent
degrees matter in finite-free/lattice recovery statements. Use the examples
of BMS1 §2 to test why integral crystalline/étale groups need not be isomorphic
and why a length inequality is not a subquotient theorem.
Sources: BMS1 §§4,14 and Theorems 1.1,1.8.

<a id="ai-6"></a>

## AI.6. Semistable AΩ with logarithmic specializations

Extend AI.3–5 to the precise semistable formal models of
Cesnavicius–Koshikawa: proper flat formal models over a complete
mixed-characteristic DVR with perfect residue field, base changed to O_C,
with their standard semistable charts and divisorial log structures.
Develop the local integral/nonintegral monomial analysis and the log
all-coordinates PD construction; this is additional proof work, not a
consequence of appending "log" to AΩ.

Prove derived comparisons with log de Rham, Hyodo–Kato/log crystalline,
A_cris and étale cohomology, keeping track of which residue field has been
algebraically closed and the induced Witt extension. Construct the B_dR^+
comparison with the smooth generic fiber's canonical deformation.
The semistable rational comparison is assembled in CP.4 using these maps.

Prove the semistable finiteness, torsion and lattice statements with the
source's torsionfree hypotheses; model-independent lattices do not exist
by assertion for arbitrary torsion models. Sources: CK §§2–7, with §§8–9
for the arithmetic handoff. Acceptance: a semistable nodal curve, a good
reduction model, and the comparison under an allowed change of model.

<a id="ai-7"></a>

## AI.7. Cohomological Breuil–Kisin descent and cross-theory interfaces

For a smooth proper formal scheme over O_K, K complete discretely valued
with perfect residue field, construct the S=W(k)[[u]]-valued cohomology and
its Frobenius, using the prismatic construction over (S,(E(u))) and compare
with BMS2 §11's trace construction. RefinedTraceMethods supplies the THH
bridge; R07 owns the representation/group classification, not this
cohomology functor.

Prove the A_inf base change, the Frobenius-twisted de Rham map S→O_K,
and the correctly Frobenius-normalized map S→W(k). Record the dependence
on a uniformizer and compatible roots before proving transport/descent.
Cohomological modules with torsion are not finite-free Kisin modules merely
because the total complex is perfect.

Finally import PrismaticCohomology PR.6's actual comparison
AΩ_R ≃ phi_A^* Δ_(R/Ainf), for the base prism ker(theta), rather than the
incorrect untwisted equality AΩ=Δ. Prove agreement of all prior comparison
maps through the uniqueness and polynomial/torus tests of BS22 §18.
This is a later comparison branch, not a prerequisite of AI.0–6.
Suggested.lean tests concrete Frobenius/monodromy algebra;
the register records the precise
primary sources and proof boundaries.

## Completion contracts added on 2026-09-15

**Applies to:** `AI.1`, `AI.3`, `AI.4`, `AI.5`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Before global comparison, give the toric Koszul model its integral and nonintegral monomial summands and prove the annihilation estimates on the latter. Construct the comparison from continuous cochains, apply Lη only using its proved comparison criterion, and descend across overlaps of two framed charts. For each scalar specialization compute the derived tensor before taking cohomology; expose the adjacent-degree Tor term and the Bockstein differential.

### Producer–consumer contract

Export the actual multiplicative AΩ complex, semilinear Frobenius and the four maps of BMS1 Theorem 1.8. A degreewise lattice export must name the torsion assumptions in both relevant degrees. AI.1's Bockstein comparison and completeness theorem remain usable independently of AΩ.

### Acceptance and source route

Use a two-term complex [A --f→ A] to detect torsion killed by Lη, a torus with two frames, and a proper example with torsion. Check that theta and tilde-theta give different specified specializations.

**Source route:** BMS1 §§6–9, Theorems 1.8/1.10; BS22 §17. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
