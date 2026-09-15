# Roadmap: Automorphic Galois Representations PartII

## Campaign ownership and interface discipline

The milestones below are the mathematical targets. Stable source identifiers such as
R12.3, A2 or V8 identify their exact construction stage; an import of that stage does
not import every later theorem of its roadmap. Existing Mathlib and Tau Ceti carriers
are reused. The canonical owner table and original-to-canonical map are in
the consolidation audit.



## Scope and source separation

This is the substantial dimension-general continuation of AutomorphicGaloisRepresentations R19, whose original construction is rank two. Construct characteristic-zero Galois representations from regular algebraic automorphic representations of GL_n over CM or totally real fields, with polarized and nonpolarized branches kept distinct. General automorphic, local Langlands and trace-formula carriers are imported; this owner proves their global Galois realization. No final potential-automorphy theorem is a target here.

The initial compact-unitary construction can consume only IgusaVarietiesAndTorsionConcentration IG.0–IG.1. Its raw AG2.1a input precedes ET.6. AG2.1b then uses ET.5/ET.6/ET.7b's characteristic-zero counting and local comparison; AG2.2 uses ET.4/ET.7a's pure automorphic comparison. None consumes the torsion concentration theorem IG.7, Scholze torsion interpolation, or the final potential-automorphy output. This enumerated fence includes ET.7b but not its late IG.5 consumer. Folder-level arrows would conceal this essential staged order.

<a id="ag2-0"></a>

## AG2.0. Algebraic weights, fields of rationality and normalization

Use AutomorphicFormsOnReductiveGroups AF.1/AF.4 for cohomological infinitesimal characters and algebraic coefficient representations, and ArithmeticGaloisRepresentations for continuous representations on finite-dimensional coefficient spaces. Define regular algebraic, conjugate self-dual, essentially conjugate self-dual and polarized cases separately, retaining the multiplier character and embeddings of the coefficient field. Prove rationality of Hecke eigenvalues and finite fields of definition in the proven cohomological cases; do not identify the field of rationality with a field of realization without descent.

For the early raw-cohomology input, construct only the normalization dictionary among algebraic weights, geometric/arithmetic Frobenius, cyclotomic twists, normalized Satake and the integral Hecke polynomial of IntegralHeckeAndGaloisDeterminants IHG.3. This does not use an established local Langlands correspondence. After ET.6, prove its agreement with rec(π_v ⊗ |det|^((1−n)/2)) in AG2.5; that later comparison is not an input to AG2.1a. Track embeddings at every complex and p-adic place. Acceptance examples are n=1 algebraic Hecke characters, n=2 classical modular forms and a unitary similitude coefficient with nontrivial central character.

## AG2.1. Characteristic-zero geometric Galois realization

This is the aggregate completion of AG2.1a and AG2.1b below, with both named producer inputs. It exports their composed geometric-to-automorphic realization, not an independent construction or an early prerequisite. In particular, ET.6 imports only AG2.1a; it does not consume this aggregate or AG2.1b, which require the local comparison already proved in ET.6.

<a id="ag2-1a"></a>

### AG2.1a. Raw cohomology before local Langlands

For the compact PEL unitary/similitude Shimura varieties of the construction, build the finite-level étale cohomology with the algebraic local system from the universal abelian scheme and its Kuga–Sato powers. Use actual algebraic correspondences/projectors, proving the selected Schur functor, Tate twist, parity, cohomological degree and field of definition. Define commuting Galois and Hecke actions on these same cohomology groups, prove finite-dimensionality and continuity, and form isotypic summands over an adequate coefficient extension.

Prove the raw geometric fixed-point/nearby-cycle trace identities needed for the simple auxiliary Shimura test functions. These statements refer to actual Weil and Hecke actions and do not assume an already established local Langlands correspondence. Export this geometric input to ET.6, which constructs local GL_n and inner-form correspondences independently of AG2.1b's completed global automorphic realization.

<a id="ag2-1b"></a>

### AG2.1b. Automorphic constituents after local comparison

Relate their virtual characters to the geometric trace formula, then separate actual representations from alternating classes. In the Shin route, import only the basic central-leaf/Igusa geometry IG.0–IG.1 and the characteristic-zero counting/trace identity ET.5/ET.7b; prove the required purity, weight separation, multiplicity and cancellation arguments rather than assume a torsion concentration theorem. Export the exact semisimple Galois constituent with its dimension and Frobenius polynomials. No arbitrary unpolarized GL_n representation is asserted to occur directly in Shimura cohomology.

<a id="ag2-2"></a>

## AG2.2. Polarized cuspidal and discrete automorphic systems

Apply stable unitary base change and endoscopic character identities from ET.4/ET.7a to identify the GL_n parameter realized by AG2.1. Prove the rank and multiplicity formulas, retain the parity and Shin-regularity restrictions of the geometric construction, and keep cuspidal parameters distinct from discrete isobaric parameters. Construct the representation for each discrete constituent with its explicit algebraic twists; identify the direct sum attached to a cohomological unitary automorphic representation with the required degree-2n Hecke polynomial.

For essentially conjugate self-dual forms, carry the algebraic twisting character through descent and recover the specified polarization. Prove compatibility of dual, conjugate, tensor-by-character and solvable restriction operations. This stage supplies the characteristic-zero unitary system interface used in ACC+ §2.3.3 without assuming its later torsion-valued Hecke representation.

<a id="ag2-3"></a>

## AG2.3. Removing auxiliary geometric hypotheses

Construct definite-unitary finite-slope eigenvarieties from generic locally analytic distribution/Fredholm machinery, with explicit algebraic coefficient lattices, compact operators, classicality regions and dense classical points. This is the definite-unitary instance of the generic PadicFamilies and LocallyAnalyticDistributions APIs, not a duplicate analytic eigenvariety engine. Prove density of the strongly regular geometric points needed to interpolate the Galois determinants from AG2.2. Use IntegralHeckeAndGaloisDeterminants for the common determinant carrier and its specialization/reconstruction theorem.

**Dependencies:** AG2.2; PadicFamilies L2a (generic eigenvariety gluing); LocallyAnalyticDistributions L4 (Fredholm/slope machinery); IntegralHeckeAndGaloisDeterminants IHG.1. Do not import a later modular Galois-family theorem to construct this family.

Implement the Chenevier–Harris deformation and solvable-descent arguments: interpolate Frobenius polynomials, reconstruct semisimple continuous representations at the target point, compare all auxiliary extensions on intersections, and prove effectivity of descent. Eliminate the extra geometric regularity and finite-slope restrictions only by these constructions. Separate this Galois descent/approximation from Taylor–Wiles patching. Its output is the arbitrary regular polarized branch, not an unproved motivic realization for every member.

<a id="ag2-4"></a>

## AG2.4. Nonselfdual systems by rigid cohomology and approximation

Construct the HLTT unitary-similitude boundary/Levi realization of a regular algebraic GL_n cuspidal representation inside a GL_2n construction. Import the PEL, mixed/Kuga–Sato varieties, toroidal/minimal compactifications and canonical/subcanonical extensions from their owners. Extend those owners' examples to the exact signatures and boundary charts used here, proving the common generic-fibre and group-action comparisons. AdicSpacesPartII F1 supplies the ordinary-locus dagger geometry.

Build the overconvergent logarithmic de Rham complex with the appropriate compact-support boundary ideal on these dagger spaces, its hypercohomology and the comparison with finite-slope overconvergent cuspidal sections. Prove finite-dimensional slope pieces, independence of admissible neighborhoods/refinements, functorial Hecke action and the boundary/Levi inclusion. Establish the weight-changing congruences modulo arbitrarily high powers of p to classical cusp forms, with integrality and normalization of U_p explicit. This coefficient theorem precedes and does not use Scholze's torsion Hecke interpolation.

Attach degree-2n Galois determinants to those classical forms through AG2.3, prove compatibility of the congruences and take the justified p-adic limit. Prove the algebraic separation argument extracting the two degree-n constituents while varying the twist, including uniqueness by Frobenius polynomials and descent from auxiliary CM extensions. Deliver the characteristic-zero semisimple system of HLTT Theorem 7.13/Corollary 7.14; do not promote its good-prime conclusion to full local–global compatibility.

<a id="ag2-5"></a>

## AG2.5. Good-prime and ramified local–global comparison

Prove good-prime unramifiedness and the full characteristic-polynomial identity for each branch, with the finite excluded set and all coefficient primes stated. Compare restrictions to Weil groups through the actual arbitrary-rank local Langlands construction ET.6. Implement the partial order on nilpotent monodromy types and distinguish equality of semisimplifications, Frobenius-semisimplified Weil–Deligne equality retaining N, and a bound on monodromy.

For the polarized branch, construct the required nearby-cycle/weight spectral sequences and monodromy-purity comparison using WeightsInEtaleCohomology. Prove the Caraiani/Taylor–Yoshida upgrades under their stated assumptions, rather than infer N from a dense set of unramified traces. For the nonselfdual branch implement Varma's interpolation of local Hecke actions and nilpotent-orbit bounds; its semisimplified comparison plus monodromy bound is not advertised as full monodromy equality. A stronger result is admitted only through a separately sourced, hypothesis-complete theorem.

<a id="ag2-6"></a>

## AG2.6. Coefficient-prime comparison and compatible systems

For the polarized systems, apply the actual crystalline/semistable/log-crystalline comparison of PadicHodgeTheory to the geometric construction and prove its passage through deformation and descent. Calculate the labelled Hodge–Tate multiset from the algebraic highest weight, respecting the dual convention. Prove de Rham, crystalline at the stated unramified places and semistable/Iwahori variants; use the generalized log-crystalline weight spectral sequence for the full monodromy comparison where the source proves it. The required spectral-sequence and monodromy lemmas are reusable p-adic Hodge targets, not assumptions on the representation.

Build a weakly compatible-system object from one coefficient number field, a common finite ramification set, characteristic polynomials at all good places and the constructed representations at each coefficient prime. Prove independence of coefficient embeddings and semisimple uniqueness. Add purity, polarization and coefficient-prime admissibility as separately proved properties of the appropriate branch. In particular, the basic nonselfdual HLTT construction does not by itself supply de Rham/crystalline or full local–global compatibility at every coefficient-prime place; the later Fontaine–Laffaille/ordinary arithmetic comparisons in PotentialAutomorphyInfrastructure remain separate consumers with their hypotheses.

<a id="ag2-7"></a>

## AG2.7. Integral, residual and reusable arithmetic exports

Choose continuous invariant lattices only after proving a finite coefficient field of realization; compare different choices by residual semisimplification, not by pretending there is a canonical integral lattice. Prove the reduction of each good-prime polynomial and independence of the associated maximal Hecke ideal. At a completely split auxiliary prime p different from the coefficient prime ell, preserve precisely the residual condition α_i,v ≠ p α_j,v for all i≠j and every v|p, with residual unramifiedness stated separately. Pairwise distinctness alone does not imply this noncyclotomic-ratio condition, and repeated eigenvalues are allowed when the ratio condition allows them. Compare a stronger decomposed-generic API only as a separate specialization. Do not deduce global residual irreducibility or adequacy from local genericity.

Export separate typed packages: good-prime characteristic-zero GL_n systems; polarized systems with Hodge and Weil–Deligne comparison; unitary discrete-parameter sums; and lattice/residual polynomial comparison. PotentialAutomorphyInfrastructure and TorsionCohomologyInfrastructure consume these packages, and IntegralHeckeAndGaloisDeterminants owns their interpolation over nonreduced Hecke algebras. The GL₂ special case is compared with R19 by uniqueness; its older explicit modular geometry remains useful and is not deleted.

## Source and acceptance register

Sources in the paper archive: Shin, Galois representations arising from some compact Shimura varieties, §§5–7; Chenevier–Harris, Construction of automorphic Galois representations II, introduction and §§1–4; Harris–Lan–Taylor–Thorne, On the rigid cohomology of certain Shimura varieties, §§3–7, especially Theorem 7.13 and Corollary 7.14; Caraiani's two monodromy/local–global papers; Varma's local–global comparison. The exact downloaded editions and inspected statements are in references/shimura_serre.json and the diamonds register. Test both odd n and even n without Shin-regular weight; a ramified principal-series example with nonzero monodromy; a discrete noncuspidal unitary parameter; and a nonselfdual input for which only the weaker source compatibility is exported.


## Implementation handoff: Noncircular realization and branch strength

**Stages:** AG2.0, AG2.1a, AG2.1b, AG2.3, AG2.4, AG2.5, AG2.6, AG2.7. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

AG2.1a supplies raw cohomology and trace data to ET.6 without using an existing local correspondence. AG2.1b separates genuine constituents after that comparison. For polarized and nonselfdual branches keep separate existence, good-prime, ramified and coefficient-prime output tables; a stronger comparison in one branch is not inherited by another.

**Acceptance and consumer contract.** In eigenvariety specialization prove continuity and reconstruction from all Frobenius polynomial coefficients, not traces at classical points alone. The nonselfdual factor-extraction argument returns actual degree-n systems with its stated local bounds. Test rank one and rank two against existing owners, and record the lattice choice before residual semisimplification. No canonical integral lattice or unrestricted weight-monodromy theorem is assumed.

## Source anchors and prototype coverage



The mathematical scope is preserved at the named milestones, with transfers and additions
recorded above and in the audit. Suggested.lean gives concrete low-level
interfaces and precise construction contracts; it does not claim the advanced theory
is already implemented or that these signatures exhaust the roadmap. Source statements
and theorem-specific hypothesis checks are tracked in the reference register.
