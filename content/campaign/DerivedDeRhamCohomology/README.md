# Derived de Rham cohomology and its algebraic foundations

## Purpose, ownership and conventions

Construct the cotangent, completion and filtered derived de Rham machinery shared
by crystalline, prismatic, Habiro, deformation and trace theory. This is an
independent foundational branch, not a consequence of any p-adic comparison
theorem. EnhancedDerivedSheaves E0–E3 and E5's **animation prefix** supply the
single enhanced category, simplicial commutative rings, polynomial resolutions,
coherent colimits and modules. DD.0 and DD.1 now own the generic cotangent and
completion constructions formerly specified in E5/E4; those stages retain named
import interfaces and their sheaf/coefficient-system applications.

Use cohomological grading: the cotangent complex of an ordinary lci map has
amplitude [-1,0]; Hodge grade i is derived exterior power i shifted by [-i].
Record separately the ordinary de Rham complex, derived de Rham complex, its
Hodge completion, and its p-completion. Completion in the Hodge filtration is not
a synonym for derived p-completion. In positive characteristic neither replacing
simplicial commutative rings by strictly commutative dg algebras nor discarding
derived divided powers is allowed without an actual comparison theorem.

The ordinary algebraic differential forms/de Rham complex use existing
Mathlib KaehlerDifferential, Derivation, exterior algebra and scheme sheaf
carriers; existing algebraic de Rham and Jacobian roadmaps retain their classical
geometric applications. CrystallineCohomology owns PD envelopes and crystals.
PrismaticCohomology owns delta-rings/prisms and their cohomology. The global
q-deformed construction is HabiroCohomologyFoundations, not a renamed instance
of this ordinary theory.

<a id="dd-0"></a>

## DD.0. Cotangent complexes and derived exterior powers

Construct L_(B/A) by the common simplicial polynomial resolution and independently
characterize it by square-zero extensions/derived derivations. Prove agreement,
resolution independence and coherent naturality. Identify H^0 with the existing
Kaehler differential module for ordinary rings. Prove the transitivity triangle,
derived base change, localization, filtered-colimit compatibility and the
smooth/regular-quotient computations; use derived tensor products in the general
statements. A pushout of ordinary rings without Tor independence is not a derived
pushout.

Construct derived symmetric/divided/exterior power functors and the filtrations
on the exterior powers of a triangle needed below. Prove the lci amplitude
criterion in its finite-presentation/flatness range. For a regular quotient
P→P/J compare L with J/J²[1] and with the standard two-term presentation over
the base; for a nonregular quotient exhibit the extra homology rather than
silently truncating it. Define quasisyntomic maps by p-complete flatness, bounded
p-power torsion on objects and the required mod-p cotangent amplitude; prove
the compatibility with the alternative formulations in BMS2 §4.

Apply Illusie's complete author errata when transcribing the simplicial and
derived-power arguments: Volume I corrects the normalization comparison and
requires derived scalar extension in the affected formulas. Volume II removes
the claimed general dg extension and the erroneous crystalline formulas in
§§2.1.4/2.2.9. The later Bhatt/BLM constructions are not licenses to reuse
those deleted assertions. Both errata are recorded with the source versions.

Acceptance: polynomial algebra, localization, a regular hypersurface, a
square-zero extension, a non-lci quotient, and a Tor-dependent base change.
Sources: Bhatt derived de Rham §§2–3; BMS2 §§2–4; Bhatt–Lurie Appendix A/C.
No prismatic or finite-flat classification theorem is an input.

<a id="dd-1"></a>

## DD.1. Derived completion and complete filtered algebra

For finitely generated I⊂A, construct derived I-completeness by vanishing of
derived Hom from A[1/f] for f in a finite generating set, and construct its
reflective localization by the Koszul model. Prove independence of generators,
adjunction, idempotence and conservativity of reduction on derived complete
objects. Produce the p-complete and (p,d)-complete module and animated-ring
functors with the correct relation between underlying modules and rings.

Prove the comparison with Rlim of **derived Koszul quotients**. Identify it with
Rlim(M tensor^L_A A/I^n) only under the appropriate regularity/weak-proregularity
hypotheses proved for that model; no unqualified ordinary-completion formula
over arbitrary nonnoetherian rings. Prove the bounded-torsion criteria used for
bounded prisms, complete flatness and complete faithful-flat descent. Track
lim-one and Tor terms explicitly. Ordinary completion of an underived complex
does not preserve all quasi-isomorphisms.

Construct filtered enhanced modules, Rees descriptions where applicable,
completed filtered tensor products, graded pieces, Hodge completion and
completed colimits. Prove which exchanges of completion, base change,
totalization and filtered colimit are valid. EDS E4 applies these constructions
to sheaves and regular-ideal compatible coefficient systems; it does not build
a second generic completion functor.

Acceptance: Z_p, a torsion module, the (p,d) completion of a polynomial algebra,
and a tower whose derived limit is not its degreewise naive limit. Apply the
Berthelot–Ogus Appendix B corrigendum: the claimed projective replacement is
an isomorphism in the derived category; a termwise surjective replacement map
requires the stated surjectivity hypotheses on the original tower.

<a id="dd-2"></a>

## DD.2. Derived de Rham and the Hodge filtration

Apply the ordinary de Rham functor to polynomial resolutions and form the
coherent realization to construct dR_(B/A), multiplicatively and functorially.
Construct its decreasing Hodge filtration before completion. Prove
gr_H^i dR_(B/A) ≃ wedge^i L_(B/A)[-i], with the appropriate B-module structure.
Prove the universal differential, Leibniz rule, and comparison with the ordinary
de Rham complex for smooth maps. The derived differential is not defined only
on the homology groups of the resolution.

Construct the Hodge-completed object and its universal map. Establish filtered
base change, transitivity filtrations, and descent by actual polynomial/flat
resolution arguments. Distinguish the multiplicative structure in the enhanced
category from a chosen strict dg model. Construct sheaves on schemes and formal
schemes by descent from the same affine functor.

Acceptance: a polynomial algebra has the expected differential; a singular
hypersurface retains derived divided-power terms. Hodge specialization used by
Habiro HQ.2 must refer to this filtered object, not merely its unfiltered
cohomology groups. Sources: Bhatt §§2–3 and Bhatt–Lurie Appendix E.

<a id="dd-3"></a>

## DD.3. Derived Cartier theory and conjugate filtration

Over F_p construct the increasing exhaustive conjugate filtration of derived
de Rham cohomology and prove the derived Cartier identification with exterior
powers of the Frobenius-twisted cotangent complex. Define the Frobenius twist as
a derived base change and preserve its structure map. Compare with classical
Cartier on smooth algebras by a coordinate calculation, followed by coherent
descent. Hodge and conjugate filtrations have different directions and are not
identified by forgetting Frobenius.

Build the resulting spectral sequence with a precise convergence statement
for each bounded, completed or hypercohomological use. Derive the regular
quotient/divided-power calculations used in DD.4. Do not claim Hodge-to-de Rham
degeneration for arbitrary characteristic-p smooth proper schemes. Any
Deligne–Illusie degeneration application must retain the liftability and
dimension/characteristic bounds and is not needed to define these filtrations.
Sources: Bhatt Proposition 3.5 and §§3.1–3.3.

<a id="dd-4"></a>

## DD.4. The crystalline and p-adic comparison construction

Using CrystallineCohomology CR.0–2, construct the natural map from derived
de Rham to crystalline cohomology by polynomial resolutions, PD envelopes and
the PD Poincare lemma. Prove Bhatt Theorem 3.27 for lci maps of flat Z/p^n
algebras/schemes, preserving flatness and finiteness conventions. Do not
extend the displayed theorem to arbitrary singular or nonflat maps; distinguish
classical crystalline cohomology of pi_0 from a separately derived extension.

Construct p-completed derived de Rham by DD.1 and prove the comparison under
the limit hypotheses. Give explicit maps to the PD period rings supplied by
CR.0/AI.0 and identify the p-completed derived de Rham description of A_cris
in Bhatt §9. The Hodge-completed rational period construction is a separate
base-change/completion operation. CohomologyComparisons assembles these maps
with the rational B_dR/B_cris objects of PadicHodgeTheory; it does not construct
another map with no compatibility proof.

Acceptance: smooth lift, regular immersion and a counterexample outside the
lci/flat comparison range. Sources: Bhatt §§3.3,8–9 and the crystalline
Poincare/base-change construction.

<a id="dd-5"></a>

## DD.5. Quasisyntomic descent and reusable cohomological control

Construct the quasisyntomic site using DD.0's actual morphism condition and
prove existence/refinement of the semiperfectoid covers used by BMS2. The
elementary compatible-root cover construction is the independent BMS2 §4
argument; the stronger absolutely-integrally-closed perfectoid extension
theorem belongs to PerfectoidQuotients Q3 and is not an input here. Prove descent for completed cotangent
exterior powers, derived de Rham and its specified filtration/completion.

Separate descent of each bounded filtered quotient from convergence of the
entire tower. Supply relative Tor-amplitude estimates, proper smooth
perfectness through coherent cohomology, completed base change, and functorial
cup products. A merely quasisyntomic affine algebra does not have finite
projective global cohomology. RefinedTraceMethods RT.1/6 uses these objects in
HKR/negative-cyclic filtrations and proves its own trace-theoretic comparison.

<a id="dd-6"></a>

## DD.6. Logarithmic extension and acceptance boundary

Import integral/fine/saturated prelog and log geometry from
CrystallineCohomology CR.5's early algebraic prefix. Construct Gabber-style
log cotangent complexes by free prelog resolutions, associated-log invariance
where proved, transitivity and the flat/log-flat base-change statements needed
by Koshikawa–Yao §§2–3. Explain comparisons with other log cotangent conventions;
do not identify them by notation. Develop log derived de Rham, log Hodge and
conjugate filtrations on those same objects.

Construct the log-crystalline comparison map using exactification before
forming a strict PD envelope. Prove the specific G-lci/Cartier-type statement
of Bhatt Definition 7.20 and Theorem 7.22, using the source's factorization
condition and mod-p Cartier hypothesis; its Example 7.23 is a required failure
test. For the later log-prismatic branch use its separate integral log-smooth
and Cartier hypotheses, not an assertion about all fs morphisms.

Required end-to-end examples are the log point and the semistable chart
O_K[x_1,…,x_d]/(x_1…x_r−pi), with its actual monoid map. Every exported result
carries its base, completion, coefficient, filtration and Frobenius twist.
Suggested.lean only tests available differential algebra;
the missing derived constructions are the substantive proof targets above.
The source register records versions
and access requests.

## Completion contracts added on 2026-09-15

**Applies to:** `DD.0`, `DD.1`, `DD.2`, `DD.3`, `DD.4`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Compute derived exterior powers of a two-term cotangent complex using the divided-power terms, with cohomological signs, before generalizing the Hodge graded formula. Separate the finite Hodge quotients, their inverse limit and p-completion, and prove each interchange with descent. For base change retain the derived pushout; an ordinary nonflat tensor square must display its extra Tor rather than be silently replaced by a smooth model.

### Producer–consumer contract

Export filtered multiplicative complexes and their graded maps with the actual comparison to ordinary differentials on smooth algebras. An associated-graded identification alone does not identify completed filtered objects without a convergence/completeness proof.

### Acceptance and source route

Polynomial algebra, a regular hypersurface, a square-zero non-lci algebra and a nonflat base change; verify different Hodge and p-completion behavior and the Frobenius twist in Cartier.

**Source route:** Bhatt derived de Rham §§2–3, 3.27; BMS1 §6; BS22 §7. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
