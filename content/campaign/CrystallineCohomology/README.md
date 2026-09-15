# Crystalline cohomology, de Rham–Witt and logarithmic foundations

## Scope and canonical owners

Construct crystalline cohomology as a theory of actual PD thickenings, crystals
and derived global sections, including its integral, relative and semistable-log
forms needed throughout the campaign. The basic scope is schemes over nilpotent
PD bases, and compatible p-adic systems over p-complete bases with the stated
finiteness/completion hypotheses. Smooth proper schemes over a perfect field
and semistable models over a complete mixed-characteristic DVR are principal
acceptance classes, not hypotheses silently imposed on the definition of the site.

Reuse Mathlib's DividedPowers, PD morphisms, PD subideals, Witt vectors,
KaehlerDifferential, exterior algebra and scheme/sheaf objects. Do not introduce
a second structure because the existing one expresses operations on the ambient
ring rather than directly on its ideal. DerivedDeRhamCohomology DD.0/1 supplies
cotangent complexes and completion; EnhancedDerivedSheaves supplies derived
sheaves, descent, tensor products and coherent comparisons.

PadicHodgeTheory owns the rational period rings and representation functors.
AInfCohomology owns BKF modules and the integral AΩ construction.
FiniteFlatGroupsAndIntegralPadicHodgeTheory owns actual Dieudonne functors,
finite-flat/p-divisible classification and Grothendieck–Messing deformation
theory, importing CR.0/1/5 rather than rebuilding crystals. PrismaticCohomology
owns prisms, not all divided-power thickenings. Habiro's q-Witt theory imports
CR.4's ordinary specialization and is a different construction.

<a id="cr-0"></a>

## CR.0. Divided powers and universal thickenings

Extend the existing PD API with base-compatible PD polynomial algebras and
envelopes for an ideal J in an A-algebra over a fixed PD base (A,I,gamma).
Construct the initial object and its functorial morphisms; prove universality,
base-change maps, localization and transitivity under their actual hypotheses.
Nilpotent ordinary ideals, PD nilpotence, p-adic completeness and PD filtrations
are different conditions. The formula gamma_n(x)=x^n/n! is a proof tool over
torsionfree rational envelopes, not a definition in an arbitrary torsion ring.

Prove explicit envelopes for polynomial regular immersions and comparison with
the derived PD construction in the lci range. Construct p-completed PD
envelopes using DD.1 and verify boundedness/torsion conditions before replacing
derived completion by ordinary completion. Treat p=2 explicitly for the
canonical divided powers on p and any source nilpotence condition.

Export the common envelope of ker(theta:A_inf→O_C), its p-completion A_cris,
and the maps induced by Witt reduction and theta. AI.0/PadicHodgeTheory identify
their Fontaine presentations by this universal property; no duplicate A_cris
ring is selected. Sources: Stacks Divided Power Algebra and Crystalline
Cohomology §§2–4; Berthelot–Ogus §§3–4; Bhatt derived de Rham §3.3.

Acceptance: zero ideal, canonical p-PD ideal, regular principal ideal, a PD
morphism under base change, and a torsion ring where division by n! is invalid.

<a id="cr-1"></a>

## CR.1. Crystalline sites, structure sheaves and crystals

Define small/big crystalline sites with objects (U,T,delta), PD closed
immersions U→T over the PD base in the exact chosen source convention, compatibility with base divided powers and
the specified Zariski/étale covering topology. Construct morphisms to the
underlying scheme site, structure and PD-ideal sheaves, and the comparison
between the chosen site variants. Keep site variance and pullback of a
crystal as an O_T-linear base-change isomorphism explicit. For the Stacks p-nilpotent crystalline convention, require p locally nilpotent on T and the specified PD thickening; do not add a uniform ordinary-nilpotence requirement on its entire PD ideal. If using a nilpotent-thickening subsite of another source, construct the comparison under its hypotheses before identifying the two cohomology theories. Ordinary ideal nilpotence, PD nilpotence and nilpotence of p are separate predicates.

Construct crystals in quasi-coherent modules, finite locally free crystals,
isocrystals and F-crystals, with tensor/duality and their valid exact-category
structures. Construct evaluation on a lift, PD stratifications and the
equivalence with integrable quasi-nilpotent connections over an appropriate
smooth/formally smooth lift. Prove the Taylor expansion and cocycle identities.
Arbitrary integrable connections are not automatically crystals; topological
quasi-nilpotence and the relevant nilpotent-base hypotheses must be checked.

Acceptance: the structure crystal, a rank-one constant crystal, a nontrivial
connection satisfying the stated nilpotence condition, and a connection outside
it. Source: Stacks crystalline site/crystals/connections sections;
Berthelot–Ogus §§5–6. These are the generic suppliers for R07, not the
Dieudonne classification itself.

<a id="cr-2"></a>

## CR.2. The PD Poincare lemma and de Rham computations

Define RΓ_crys and relative Ru_* on the common enhanced sheaf category.
Construct the linearization functor and prove its acyclicity for the affine
calculations used by the PD Poincare lemma. Compute crystalline cohomology
from a smooth embedding into a lift by the de Rham complex of its PD envelope,
including coefficients in an eligible crystal.

Prove independence of the embedding through products, Cech–Alexander
totalizations and explicit homotopies/refinement maps. A local choice of
coordinates is not a globally functorial complex. For a smooth lift identify
crystalline cohomology with its de Rham cohomology and compare filtrations.
DD.4 owns the additional derived-de-Rham-to-crystalline comparison for flat
lci Z/p^n maps; it consumes this Poincare theorem, not conversely.

Supply formal p-adic versions by derived inverse limit and prove compatibility
with the finite-level theory. This stage needs only DD.0/1, not completed
prismatic comparisons or rational p-adic Hodge theory.
Acceptance: affine space, a smooth hypersurface through two embeddings, a
constant crystal and a finite-level reduction diagram.

<a id="cr-3"></a>

## CR.3. Descent, finiteness, base change and Frobenius

Prove crystalline descent for the chosen topology using actual site comparisons.
For proper smooth X over a perfect field k, construct a perfect W(k)-complex,
finite cohomology and compatible reductions; do not infer that each H^i is
torsionfree. Build derived base-change maps for crystalline families with
flat/perfect coefficient hypotheses, and record when they are equivalences.
Prove Kunneth and cup products in the proper smooth scope. The trace/duality
statement is the separate later CR.3:duality successor below, not an input to
this early finiteness/base-change stage.

<a id="stage-CR.3:Frobenius-isogeny"></a>

Construct Frobenius from the special-fiber morphism and its Witt/PD lift;
separate semilinear maps from their linearizations. Its rational-isogeny
conclusion is a later substage, proved through CR.4's de Rham–Witt/Cartier
control or the corresponding classical crystalline argument, not a field of
the definition of cohomology. Finite-free F-crystals and torsion cohomology
modules have different categories. Do not equate convergent and overconvergent
F-isocrystals or infer either from a bare semilinear vector space.

The inverse-limit/finiteness proof uses the complete two-page
Berthelot–Ogus Appendix B corrigendum. Termwise surjectivity cannot be added
to the original tower without constructing its allowed derived replacement.
Acceptance: projective space, smooth proper curves, an elliptic curve in each
ordinary/supersingular case, and a torsion cohomology example from BMS1 §2.
Sources: Berthelot–Ogus §§7–8, Stacks crystalline applications/base change,
BMS1 §14.

<a id="stage-CR.3:duality"></a>

### CR.3:duality. Trace and Poincaré duality — source-qualified successor

Own the proper smooth crystalline trace, its normalization in top degree, cup-product perfect pairing in the derived sense, compatibility with reduction and the Gysin formalism. Construct the diagonal class and identify evaluation/coevaluation; verify projective-space normalization, functoriality and base-change before CP.6 imports them. Torsion in individual cohomology groups requires a derived dual, not a perfect ordinary pairing on every group. The classical proof source is **Berthelot, LNM 407, Chapters VI–VII**, especially VII for duality: its complete volume remains source-pending (the user’s partial download is not a usable copy). Berthelot–Ogus §§7–8 and BMS1 §14 do not supply this proof. Ekedahl I, duality for de Rham–Witt, is a complementary acquired route through CR.4; its comparison to the precise crystalline trace still requires a source-level proof audit. This gate is an explicit remaining reference limitation, not a conjectural relabeling of the classical theorem.

<a id="cr-4"></a>

## CR.4. Ordinary and relative de Rham–Witt complexes

Construct Witt complexes W_nΩ, restriction, Frobenius, Verschiebung,
Teichmuller lifts and dlog, using the existing Witt-vector carrier. Prove
the full relations and universal property, including the distinction between
the graded Frobenius and the degree-scaled crystalline Frobenius.
Compute polynomial basic Witt differentials, localization and étale descent;
ghost coordinates can be inverted only under the proved torsion hypotheses.

For smooth algebras over a perfect F_p-field prove agreement with the
classical de Rham–Witt complex. Give the BLM construction via strict saturated
Dieudonne complexes as a compared model: construct saturation, V-adic
completion and its universal property; prove the fixed-point characterization
for Lη_p. AI.1 supplies the generic Lη construction, independently of AΩ.
Do not claim a saturated replacement equals every classical singular
de Rham–Witt complex without a comparison theorem.

Construct the relative Langer–Zink theory for smooth algebras over a base on
which p is nilpotent, with its relative crystalline comparison. This relative
version, not just perfect-field de Rham–Witt, supplies BMS1 §§10–12.
Prove finite-level and inverse-limit comparisons with CR.2, slope/degree
filtrations and convergence of the spectral sequences used in applications.
Habiro HQ.4 owns the q-deformation and specialization maps into these objects;
RefinedTraceMethods owns the THH/TR realization.

Acceptance: k, k[t], a torus with dlog[t], a smooth relative lift over Z/p^n,
and a singular input where saturation changes the theory.
Sources: BLM §§2–5,8–10; Langer–Zink §§1–3; BMS1 §§10–11.

<a id="cr-5"></a>

<a id="stage-CR.5:log-algebra"></a>

## CR.5. Logarithmic geometry and log-crystalline cohomology

The early prefix constructs prelog rings, associated log structures on the
étale site, charts, groupification, integral/fine/saturated monoids, strict,
exact, Kummer and log-smooth morphisms, and their base changes. Extend existing
toroidal boundary data to these shared objects rather than using a fresh
boundary-divisor predicate. Give the chart criteria with torsion-order
invertibility conditions and distinguish integrality from saturation.

Construct exactification and the log PD envelope, followed by the log
crystalline site and crystals with log connections. Prove the log PD Poincare
lemma and its descent. The source's Cartier-type condition is essential for
the Cartier comparison and later log-prismatic crystalline/de Rham results.
DD.6 imports the elementary log prefix to construct log cotangent/derived
de Rham; its later comparison is not a prerequisite of this elementary prefix.

Prove the explicit log differential module and residue maps for the standard
semistable chart O_K[x_1,…,x_d]/(x_1…x_r−pi), with the map of monoids recording
pi. Carry along the actual log structure under reduction and completion.
Sources: Kato, Logarithmic structures of Fontaine–Illusie §§1–6;
Hyodo–Kato §§1–3; Koshikawa I Appendix A and §§2–4.

<a id="cr-6"></a>

## CR.6. Hyodo–Kato complexes and semistable structure

For proper semistable models over a complete mixed-characteristic DVR with
perfect residue field, form log-crystalline cohomology of the special fiber
over the standard log Witt base (N→W(k),1↦0), and its rational Hyodo–Kato
complex. Construct Frobenius and monodromy N, prove nilpotence in the
finite-dimensional range and the relation N phi=p phi N in the chosen
convention.

Construct the Hyodo–Kato-to-log-de-Rham map after the required field extension
and choice of uniformizer. Prove its comparison theorem and compute the
change-of-uniformizer transformation, with the logarithm/exponential and sign
normalization derived explicitly. Do not declare this map choice-free before
the corrected descent/period comparison. CohomologyComparisons CP.4 owns its
assembly with B_st and the étale comparison.

Develop the log de Rham–Witt or embedding-system model needed for this proof,
with integral descent and the rational steps marked. No integral B_st
comparison in arbitrary weights follows. Acceptance: good reduction gives
N=0; a Tate-type nodal curve has the expected nonzero monodromy; products and
change of uniformizer preserve the proved comparison diagram.
Sources: Hyodo–Kato §§3–5; Cesnavicius–Koshikawa §§5,9.

<a id="cr-7"></a>

## CR.7. Coefficient and arithmetic interfaces

Export PD bases, crystals, connections, filtrations, Frobenius and log
monodromy to R07's Dieudonne crystal and Grothendieck–Messing construction.
Verify its covariance/contravariance and Tate twists on the constant and
multiplicative p-divisible groups; do not take its classification as the
definition of a general crystal. Shimura/Igusa and abelian-scheme roadmaps
then consume the same object.

Build the finite-projective crystalline-coefficient and relative
Gauss–Manin interfaces actually needed for those applications, proving
base-change/horizontality rather than assuming every higher direct image of
a crystal is a locally free crystal. More general singular/nonproper or
stacky theories require separate source-qualified extensions and are not
hidden inside this acceptance criterion.

Every theorem exports an actual map and a complete list of base, PD,
completion, log, torsion and finiteness hypotheses.
Suggested.lean exercises the existing PD API.
See the reference register for
downloaded articles, the Berthelot–Ogus correction, and book/chapter requests.

## Completion contracts added on 2026-09-15

**Applies to:** `CR.0`, `CR.2`, `CR.3`, `CR.3:duality`, `CR.4`, `CR.6`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For an embedding system construct its multiple intersections and explicit PD de Rham totalization; show refinement induces the same crystalline comparison. Track crystalline Frobenius on forms separately from graded Witt Frobenius. The duality branch must construct the trace and its diagonal-class adjunction; if the primary duality source is still missing, keep that leaf source-pending while giving the exact Ekedahl comparison task instead of treating proper perfectness as duality.

### Producer–consumer contract

Export the perfect W(k)-complex with semilinear Frobenius and its rational-isogeny theorem as distinct results. The Hyodo–Kato output includes the chosen log base, N and the change-of-uniformizer law. RD supplies overconvergent extensions; no convergent/overconvergent equivalence is inferred.

### Acceptance and source route

Use a singular PD thickening, a smooth affine torus with dlog Witt class, ordinary/supersingular elliptic curves, and a semistable node. Verify trace on projective space once the source gate is discharged.

**Source route:** Stacks crystalline chapters; BMS1 Theorem 1.8; Ekedahl de Rham–Witt duality; Berthelot LNM407 VII source gate. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
