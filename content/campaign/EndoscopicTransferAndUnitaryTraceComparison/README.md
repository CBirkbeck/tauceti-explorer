# Endoscopic transfer and unitary trace comparison

## Scope and ownership

Build the transfer and stabilized trace machinery actually needed for Shin's
Igusa calculations and Caraiani–Scholze's noncompact unitary argument. The reusable
foundations include general characteristic-zero endoscopic data, transfer factors,
orbital integrals, the ordinary fundamental lemma and its geometric proof inputs.
The global endpoint is the specified simple stable/twisted unitary comparison,
not a claim of general Langlands functoriality or a classification of every packet.

AutomorphicSpectralTheory AS.0–6 owns analytic truncation and the invariant trace
formula. This Part II supplies the genuinely additional stabilization/transfer
arguments. The distinction is material: an invariant distribution need not be
stable. ReductiveGroupsPartII supplies dual groups, buildings and parahorics;
AdelicAlgebraicGroups supplies Haar/Tamagawa measures; SmoothRepresentationsOfLocalGroups
supplies the abelian category, induction and Bernstein center. No duplicate
convolution algebra, L-group or arithmetic quotient is introduced here.

ET.2a is now the historical **scheme** import interface for the expanded
[EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md)
(EDC) and [LefschetzPencilsAndVanishingCycles](../LefschetzPencilsAndVanishingCycles/README.md)
(LPV) roadmaps. They construct the generic duality, perverse, nearby-cycle and
decomposition foundations formerly grouped here; all original ET.2a obligations
remain, with their new owners explicit. The existing point-counting family
still supplies its finite-level cohomology/compact-support operations, not
exceptional pullback or Verdier duality by assumption.
GeometricSatakeAndFusion owns
the additional relative/diamond Satake perversity and comparison, not a second
construction of the scheme foundation. ET.2b constructs the Hitchin-specific
geometry, consuming AlgebraicModuliForArithmeticGeometry and the ordinary
finite-field algebraic curve/group-bundle theory, not the Fargues–Fontaine curve.

All harmonic analysis here uses characteristic-zero coefficients (complex, or
Q_ell after a chosen comparison). Integral/mod-ell consequences are separately
proved by the Igusa owner from lattices; stabilization is not asserted over every
torsion coefficient ring. Hyperspecial fundamental-lemma statements retain the
unramified and residue-characteristic conditions of their proof. Local groups
in ET.0–1 are reductive over characteristic-zero local fields; ET.2–3 explicitly
introduces equal-characteristic geometry and then the comparison to mixed
characteristic. The global CS specialization assumes its CM field F=F^+F_0,
[F^+:Q]>1, splitting at the auxiliary p, and small bad-place levels.

## ET.0. Stable conjugacy and endoscopic data

Construct rational, geometric and stable semisimple conjugacy, their transport
under inner twists, and the cohomological parameterization of rational classes
inside a stable class. For disconnected centralizers retain the neutral component,
component factors and the source's admissibility condition. Prove finiteness of
the relevant local cohomological kernels before forming sums.

Construct local/global Tate–Nakayama pairings for tori and the two-term torus
complexes used by Kottwitz–Shelstad, importing common continuous cochains and
duality from ArithmeticGaloisDuality. Construct the required abelianized reductive
cohomology, localization, Kottwitz invariants and global product formula. This is
the group-specific application, not a second Poitou–Tate implementation.

Define endoscopic triples and equivalence, ellipticity, relevant embeddings,
z-extensions and endoscopic groups of Levi subgroups. Construct ordinary and
twisted matching of strongly regular classes with its domain, including cases
where no rational matching class exists. For the groups G_(n_i) of CSnc §5.2
compute the finite list of elliptic endoscopic data and their explicit L-morphisms.
Acceptance: split torus, GL_n, a nonsplit unitary group and a proper Levi with
different rational conjugacy classes in one stable class. Sources: Langlands–
Shelstad §§1–2, Kottwitz–Shelstad Chapters 1–3, Shin stable Igusa §§2–4.

## ET.1. Transfer factors and orbital-integral analysis

Construct the factors from a-data, chi-data, splittings and the cohomological
pairings, including discriminants and the absolute normalization. Prove transport
under a change of auxiliary data, conjugacy invariance, descent to centralizers,
compatibility with central extensions and the global product formula. Record
which Frobenius/reciprocity normalization and Whittaker normalization is used;
the product formula does not identify two conventions without a calculation.

Construct quotient measures on centralizer quotients, convergence of regular
semisimple orbital integrals, stable and kappa-weighted sums, and the relevant
singular extensions by descent/germ analysis. Reuse AS's basic measure theory;
prove the additional Shalika-germ and Fourier-transform identities for Lie
algebras needed by the transfer proof. Define matching test functions by their
actual stable orbital-integral identities and show that their ambiguity lies in
the kernel of all those integrals. Do not make transfer a canonically chosen
function where only its quotient class is canonical.

Prove real transfer and explicit discrete-series/Euler–Poincaré pseudocoefficient
formulas in the unitary cases used below, including component groups, sign and
measure constants. These require the real character/Paley–Wiener and
Clozel–Delorme/Labesse pseudocoefficient arguments beyond mere existence of
(g,K)-modules. Construct them here from AF.1's real representation foundation.
Sources: Langlands–Shelstad §§3–6; Kottwitz–Shelstad transfer-factor chapters;
Shin stable Igusa §5 and Shin 2011 §§3–4; Labesse's pseudocoefficient and stable
base-change results.

## ET.2. Perverse sheaves, Hitchin geometry and support

ET.2 is the aggregate completion of ET.2a and ET.2b; early clients import the
qualified prefix they need, not this complete bundle.

### ET.2a. Reexport of the general scheme perverse foundation

The full ET.2a bundle consists of ET.2a:duality-perversity and the later
ET.2a:pure-decomposition. The first does not consume the second.

The existing machine-stage names `ET.2a:basic` and `ET.2a:decomposition`
are retained as aliases of `ET.2a:duality-perversity` and
`ET.2a:pure-decomposition`, respectively. They do not name duplicate constructions.

<a id="stage-ET.2a:duality-perversity"></a>

The retained prefix **ET.2a:duality-perversity** imports
[EDC.0–5](../EtaleDualityAndPerverseSheaves/README.md#edc-0): actual scheme f^!,
dualizing complexes, smooth purity/biduality, middle perverse truncations,
recollement, intermediate extension/IC and smooth/finite/affine bounds. Import
[EDC.6](../EtaleDualityAndPerverseSheaves/README.md#edc-6) for the applicable
adic/diamond comparison, and [LPV.6](../LefschetzPencilsAndVanishingCycles/README.md#lpv-6)
for nearby-cycle t-exactness and the precise IG.4 filtered-colimit support
extension. These are the same source coefficient categories and operators,
not independently constructed aliases. The prefix has no Weil II or Hitchin
input; LPV.6 only requires early EDC perversity.

<a id="stage-ET.2a:pure-decomposition"></a>

The retained suffix **ET.2a:pure-decomposition** imports
[EDC.7](../EtaleDualityAndPerverseSheaves/README.md#edc-7), whose DWP.7–9
dependencies now give the full purity proof route: pure IC, geometric
semisimplicity, decomposition after geometric base change and relative hard
Lefschetz for projective maps with an ample class. Verify the Hitchin map,
support, coefficient, purity and projectivity hypotheses in each ET.2b use.
Integral/mod-ell decomposition and arithmetic Frobenius semisimplicity are
not consequences. Sources remain BBD Chapters 1–5 and Illusie's nearby-cycle
theorem; this transfer preserves the old construction obligations while putting
their expanded proofs in reusable non-endoscopic owners. Only this suffix
depends on weights; no ET.2b/IG concentration theorem enters its construction.

### ET.2b. The geometric fundamental-lemma proof machinery

For a smooth proper curve over a finite field and a reductive group scheme in
the source's good-characteristic range, construct the Chevalley quotient,
Kostant section and regular-centralizer group scheme with descent under outer
twists. Construct the stack of G-bundles, Higgs fields twisted by a chosen
sufficiently positive divisor, the Hitchin base/map, cameral/spectral covers and
the Picard stack acting on Hitchin fibers. Prove algebraicity, finite-type bounds,
the required proper anisotropic quotient, and exact component-group actions.

Construct equal-characteristic affine Grassmannians and affine Springer fibers,
their Picard actions, component lattices and finite-type quotients. These are
algebraic loop objects, not silently identified with Witt-vector or diamond
Grassmannians. Prove the local/global product formula connecting Hitchin fibers
and local affine Springer fibers, including stabilizer weights.

Construct weak abelian fibrations and the delta-invariant stratification; prove
the support/amplitude inequalities and the exact delta-regularity estimates
required by Ngo's support theorem. Prove the anisotropic support theorem and
endoscopic comparison of the relevant kappa-isotypic perverse direct images,
first on the transverse/good locus and then via the support theorem. The source's
stronger support conjectures outside the established locus are not targets by
assertion. Acceptance: a torus, a rank-one degenerating spectral curve, a nontrivial
component character and an endoscopic Hitchin fiber. Sources: Ngo, published
§§2–8, especially affine Springer fibers, product formula and support theorem.

## ET.3. Fundamental lemma and existence of local transfer

Derive the equal-characteristic Lie-algebra fundamental lemma from ET.2b using
the trace formula for the actual stacks/quotients, stabilizer factors and a
globalization of prescribed local data. Track discriminant square roots and
measure normalizations. Prove both the ordinary and the nonstandard variant
actually needed in Waldspurger's reduction, with their root-data isogeny conditions.

Prove comparison of sufficiently close local fields and the orbital-integral
identities under change of characteristic, then the group-versus-Lie-algebra
and descent steps used for hyperspecial unit functions. Preserve the explicit
good-residue-characteristic bound: Ngo's published initial Lie statement requires
p greater than twice the Coxeter number (hence in particular p does not divide
the Weyl-group order), whereas Waldspurger's change-of-characteristic
argument additionally requires p sufficiently large relative to the group.
Retain the latter as a separate bound; p not dividing the Weyl order alone does
not discharge it. No bad-prime case follows by replacing the field
name in an equal-characteristic theorem. The global application may enlarge S
and choose the generic split prime outside this finite set, by a proved
Chebotarev argument.

Prove characteristic-zero local smooth transfer through Waldspurger's
fundamental-lemma-implies-transfer argument, including the global auxiliary
place and local germ/Fourier reductions that remove the auxiliary good-place
restriction from the final local transfer theorem. State exactly which standard
unramified Hecke functions match. For cyclic base change use the separate
norm-map/unit-function and Hecke-transfer proof needed by ET.4; a general
twisted or weighted fundamental lemma is not smuggled into the ordinary theorem.
Sources: Ngo's published Theorems 1–2 and §§1,8; Waldspurger 1997 and 2006;
Labesse's stable cyclic base-change argument. The full weighted fundamental lemma
is not required for the selected simple trace comparison and is not claimed here.

## ET.4. Simple stable and twisted unitary trace formulas

AS.6's original invariant-source corpus is now archived, including Arthur's 1988 local and global papers used by the selected trace comparison. Those invariant identities are inputs, not already the stable/twisted conclusion.

Starting from AS.6, construct the stable elliptic distributions, Tamagawa/kernel
coefficients and endoscopic regrouping of rational conjugacy classes. Prove the
restricted stabilization used by the source, with actual matching test functions.
Construct the cyclic-restriction-of-scalars twisted space and its invariant
twisted trace identity from the same kernel/truncation machinery; the untwisted
formula is a template, not already this theorem.

For CSnc's G_(n_i), build the finite-place transfer maps and infinity
pseudocoefficients and prove all commuting diagrams of L-morphisms, spherical
Hecke transfers and traces in CSnc §§5.4–5.5. Prove existence of the small bad-place
level N_0 whose supported test functions satisfy the required transfer condition.
Construct the character extending the quadratic character of F_0/Q and retain
its ramified places in S.

Prove that [F^+:Q]>1 rules out the proper cuspidal twisted subsets in the source
argument; this is why the simple spectral/geometric identity applies. Deduce the
specific equality of stable elliptic terms with the discrete twisted trace and
its factors of two/signs. Prove every discarded parabolic term vanishes under
these test-function hypotheses. This stage does not require IG.4–7 or a torsion
concentration result. Sources: CSnc §§5.2–5.5, Shin 2011 §§3–4,
Kottwitz–Shelstad's elliptic stabilization and Labesse's cyclic comparison.

## ET.5. Counting and stabilizing Igusa correspondences

Consume only IG.0–IG.1's finite-level Igusa varieties and their Hecke/quasi-isogeny
actions. Construct acceptable elements/functions in J_b(Q_p), Frobenius-Hecke
correspondences and their fixed points. Import EDC.8's general cohomological
correspondence/duality maps, then prove the required contracting-boundary
Lefschetz–Verdier/Fujiwara trace theorem for correspondences, extending the
existing point-count trace formula: a general correspondence is not an ordinary
endomorphism point count. Prove isolation, properness and sufficiently large
Frobenius-power hypotheses before evaluating a trace.

Classify fixed points by effective Kottwitz triples, prove effectivity, calculate
automorphism groups, volume and cohomological-kernel multiplicities, and obtain
Shin's unstabilized Igusa trace formula. Use his erratum: the corrected
H^1(F,G(A_F))→A(G) map is functorial; G(A_F)/Z(G)(F) is not functorial under
arbitrary group homomorphisms.

Stabilize away from p by ET.1/3 and at infinity by the explicit pseudocoefficients.
At p construct the relation between endoscopy of J_b and endoscopy of G via its
Levi data; prove Shin's Kottwitz-invariant/transfer-factor identity and construct
the matching p-test function. Sum the local calculations with the global product
formula to prove the stable Igusa identity, including ker^1 and iota(G,H) factors.
Prove the acceptable-function shift/density argument extending precisely the
linear trace identity to the source's full test-function class.

Sources: Shin 2009 §§6–13 and erratum; Shin 2010 §§4–8; CSnc §§5.3,5.6. The
ordinary Igusa stabilization route explicitly avoids an unproved general twisted
fundamental lemma. The source's point-counting range, PEL datum and good model
hypotheses remain attached to each theorem.

## ET.6. Classical local GL_m and inner-form comparison

Construct the characteristic-zero local correspondence for GL_m(E), E a finite
extension of Q_p, with full Frobenius-semisimple Weil–Deligne parameters and
monodromy, not only semisimplified Weil parameters. Use the existing smooth
representation category and ArithmeticGaloisRepresentations' Weil–Deligne types.
Develop the needed supercuspidal/type and segment/Langlands-quotient theory;
prove the classification and induction compatibilities instead of importing them
as data fields. Scholze 1010.1540 explicitly discards monodromy in its initial
parameter convention: its semisimple character identities alone do not supply N.
For each essentially square-integrable segment reconstruct the Weil–Deligne
factor sigma tensor Sp_r with its explicit single Jordan-block nilpotent N;
prove the covariance r(w) N r(w)^(-1)=|w| N, and use the multisegment/Langlands
classification to assemble the full Frobenius-semisimple parameter. Verify
compatibility with the Weil semisimplification produced by the geometric proof,
Steinberg twists, direct sums, and L/epsilon factors. This generic segment theory
does not import the downstream GL2 specialization roadmap. Only the completed
construction exports a full WD correspondence. Equal-characteristic local fields require a separately checked
extension and are not included by pretending p-divisible deformation spaces
exist in that proof with unchanged hypotheses.

Follow Scholze's local construction: build the relevant p-divisible-group
deformation spaces and their level structures, nearby-cycle test functions
phi_(tau,h), norm maps, geometric and harmonic descent, and the character
identity that characterizes the parameter. Prove independence, integrality/
rationality properties required of the test functions, Lubin–Tate tower
comparison, irreducibility/bijectivity, and L/epsilon-factor compatibility.
Construct local constants on both Weil–Deligne and analytic sides and prove the
normalization dictionary; AL supplies the analytic integral constructions.

For the global step in that local proof import only
AutomorphicGaloisRepresentationsPartII's **early raw compact-unitary cohomology
with Weil/Hecke action and geometric trace formula**, not its later local-global
compatibility theorem. Return the local correspondence to that later theorem.
The auxiliary simple Shimura test-function calculation is proved on those shared
raw objects; no torsion-concentration or noncompact Igusa theorem enters.

Construct local Jacquet–Langlands on essentially square-integrable representations
of GL_r(D), including its regular-elliptic character identity and sign. Prove the
Grothendieck-group extension and compatibility with Jacquet/induction operations
used for J_b; this extension may vanish or carry signs and is not a bijection of
all irreducible representations. Derive the source's nontransfer obstruction for
generic principal-series parameters to a nontrivial inner form. Sources:
Scholze's *Local Langlands for GL_n* §§2–14; *Deformation spaces* §§2–7;
Harris–Taylor and Deligne–Kazhdan–Vignéras for the local character comparison;
Badulescu's extended Jacquet–Langlands. The later FS agreement theorem is owned by
ExcursionOperatorsAndSpectralAction ES7:GLn-comparison; it consumes, and cannot
replace, these independent classical inputs.

<a id="et-6a"></a>
### ET.6a. Two-tower cohomological realization (mixed characteristic)

This is a substantial successor to the ET.6 classical construction, not an implicit
consequence of knowing an abstract bijection. Let E/Q_p be finite, n≥1, ℓ≠p and
coefficients Qbar_ell. Starting with the existing formal-module/p-divisible-group
deformation owners, construct the Lubin–Tate tower with its GL_n(E), D× and W_E
actions, D/E the division algebra of invariant 1/n. Construct the Drinfeld tower
and its level maps, period morphisms, compact-support complexes and commuting
actions on the same smooth representation carrier. Prove the infinite-level
moduli description and duality isomorphism, descent to finite level and equivariant
cohomology comparison. The new source Scholze–Weinstein
§§6–7 supplies the moduli/duality proof route; this geometric result is not by itself
the cohomological local-Langlands realization.

Prove the supercuspidal isotypic realization: for irreducible supercuspidal π and
σ=JL(π), the corresponding normalized tower cohomology identifies with π⊗ρ_π
and σ⊗ρ_π^∨ on the two sides, with the residual smooth group and Weil actions
specified. State the exact Hom/isotypic convention, central-character quotient,
degree n−1, dual and Tate/half-Tate shifts before writing either identity. Prove
concentration in the required isotypic degree and scalar normalization, not only
an equality in a Grothendieck group.

The proof expands Harris–Taylor's independent global realization through their
compact unitary moduli, nearby-cycle decomposition, automorphic trace comparison
and extraction of the local supercuspidal factor. Reuse AG2.1a's raw cohomology,
ET.4's independent trace formula and ET.6's parameter normalization; do not use
AG2's later local-global compatibility to prove its own local input. Prove transfer
to the other tower via the geometric duality and equivariant cohomology theorem.
Dat §§3.1–3.4 and §4 records the exact
derived/cohomological realization interface and **uses** Harris–Taylor's input;
it is not a substitute proof of that missing input. The full Harris–Taylor book
remains a source-access request until registered. Only the supercuspidal realization
needed by FS IX.7.4 is the required endpoint here; Dat's stronger elliptic/monodromy
package may be added separately without being silently assumed.

Export this completed two-tower package to HS3's Hecke-fibre comparison and
ES7:GLn-comparison. The ES consumer proves FS agreement by its two-leg trace
calculation; ET.6a never imports that agreement, excursion operators, full Satake
or the spectral action. Equal-characteristic formal O_E-modules and D-elliptic
globalization are a separate ES7:equal-characteristic construction, not an
extension obtained by relabeling the p-divisible-group spaces.

## ET.7. Coherent comparison exports

ET.7 is the joint export of ET.7a and ET.7b below. A client using only the pure
automorphic branch imports ET.7a explicitly, without the Igusa branch.

<a id="stage-ET.7a"></a>

**ET.7a, pure automorphic branch.** Using ET.4/6 and the appropriate complex
spectral decomposition, construct the unitary-to-GL_m cohomological base-change
character identities at the stated split/unramified places and infinity. Develop
the required GL_m residual-spectrum/Speh classification and cyclic automorphic-
induction/base-change steps from the Arthur–Clozel and Moeglin–Waldspurger proofs,
with central characters and cuspidality hypotheses. Export these identities to
AutomorphicGaloisRepresentationsPartII before requiring any Igusa concentration.
Do not infer all local packet members from a weak almost-everywhere transfer.

<a id="stage-ET.7b"></a>

**ET.7b, Igusa branch.** Combine ET.5 with ET.4 and the explicit CSnc §5.6 test
functions to express the rational alternating Igusa representation by the
specified automorphic representations, Jacquet functors and inner-form transfer.
Prove the finite local factorization and separation of Hecke eigencharacters
with virtual multiplicities retained. This is the precise supplier of IG.5's
rational trace comparison. Global Galois representations themselves remain
AutomorphicGaloisRepresentationsPartII; IG.5 proves their residual application.

Acceptance: one torus transfer with all measures; the unramified GL_2 Satake
calculation; a proper unitary endoscopic datum; a nontrivial division-algebra
inner form; and a source-level Igusa trace identity including a boundary case.
Reconcile arithmetic/geometric Frobenius, q-half twists, dual Hecke action,
Kottwitz signs and stable multiplicities by explicit conversion theorems.

## References and limits

The source register records validated
PDFs, exact versions, sections and access gaps. Organizing primary papers are
CSnc §5,
Shin's stabilization,
Ngo's published proof,
Langlands–Shelstad,
and Scholze's local correspondence.
The two displayed Scholze–Shin transfer conjectures in the ramified-split paper
are imported only in their **proved EL/split cases**, not as general theorems.

These are substantial constructive targets. A formalization cannot finish this
roadmap by supplying the fundamental lemma, decomposition theorem, transfer or
LLC as opaque axioms. Suggested.lean records only representative
finite-sum algebra on available types; it does not purport to encode those missing
geometric/analytic constructions.

## Implementation handoff: Transfer factors, monodromy and virtual traces

**Stages:** ET.0, ET.1, ET.2a, ET.2b, ET.3, ET.4, ET.5, ET.6, ET.6a, ET.7. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Record a single measure/reciprocity/transfer-factor normalization through orbital integrals, Hitchin support, local transfer and the simple stable unitary formula. ET.2a imports the common scheme perverse foundation; rational pure decomposition is a later theorem. ET.6 constructs the monodromy block/segment correspondence in addition to its semisimple Weil parameter.

**Acceptance and consumer contract.** Compare an unramified test function and a Steinberg segment, with their conductor and epsilon factors. ET.5 fixed-point counts use only basic Igusa geometry and cannot import the late concentration theorem. ET.7 distinguishes virtual trace identities from actual multiplicities; the latter require separation and positivity arguments. General Arthur classification, arbitrary functoriality and categorical local Langlands do not follow from the simple unitary formula.
