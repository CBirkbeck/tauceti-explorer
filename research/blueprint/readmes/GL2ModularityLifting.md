# GL₂ Modularity Lifting

## Purpose and scope

A modularity lifting theorem turns a representation lifting a supplied residual representation into an automorphic representation. The classical branch constructs the deformation-to-Hecke map, controls actual quaternionic Hecke modules at Taylor–Wiles levels, patches them and proves the support needed to conclude modularity. The modern branch proves regular de Rham lifting over ℚ, with separate odd-prime, dyadic, residually reducible and small-prime ordinary statements. It ends with the transfer lemmas that congruence arguments in ClassicalSerreModularity consume.

In the classical branch, the residual modularity input is actual eigenform or Hecke data with the stated weight, determinant and local conditions. Minimal-level data record this witness; the assertion R = T is a later theorem. Component coverage also needs a theorem: Cohen–Macaulayness of a patched module alone does not make every component modular. Each lifting application must exhibit its residual witness, local types, chosen components, determinant, framing variables and the module detecting support.

This document assembles the two part packets into twelve layers. It is a blueprint, with the remaining mathematical and signature obligations listed at the end. A proposed statement or an elaborating prototype is not a formalisation or a certification of source independence. The node identifiers, API names, mathematical statements and gap records remain those of the part packets.

## Boundaries and suppliers

The classical R22 branch precedes potential modularity and global finiteness. It imports specific field-construction, local component and automorphic interfaces; it never imports the modern R32 endpoint as a classical input. R32 may consume R22. The following ownership boundaries govern the plan and its supplier requests.

| Owner | Interface used here |
| --- | --- |
| ArithmeticGaloisRepresentations, ArithmeticGaloisDuality | Residual images, oddness, lattices, finite coefficient fields, Galois cohomology and dimension inputs. |
| DeformationAndDerivedPatchingAlgebra R03 | Abstract patching, presentations, commutative algebra and support descent. R22 verifies these hypotheses for arithmetic modules. General dimension-n support belongs to this algebra owner, with arithmetic assembly in PotentialAutomorphyInfrastructure. |
| GlobalGaloisDeformations R04 | Global deformation rings, determinant-fixed pseudodeformations, Taylor–Wiles primes and deformation data. |
| LocalGaloisDeformationRings R08 | Local deformation conditions, potentially Barsotti–Tate components, dyadic geometry and ordinary/reducibility quotients. |
| PadicHodgeTheory R06; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07 | De Rham, crystalline and semistable predicates, monodromy and the weight-{0,1} Barsotti–Tate comparison. |
| GL2AutomorphicRepresentationsAndTransfer R17 | Solvable base change and descent. |
| HilbertModularVarietiesAndShimuraCurves R18.3, exported through R18.6 | Definite quaternionic forms, Hecke algebras, Galois-free freeness, the Ihara-type lemma and the dyadic twist of forms. R22.2 adds Galois-dependent rank and coinvariant control. |
| AutomorphicGaloisRepresentations R19 | Eigenform Galois representations, descent over Hecke algebras, local–global compatibility and comparison of coefficient primes. |
| SerreWeightAndLevelOptimisation R20 | Weight and level changes for Kisin/Gee applications. KW II Theorems 8.2 and 8.4 are owned here in R22.1. |
| OrdinaryAutomorphicFormsAndModularityLifting R21 | The exact ordinary overlap and the distinguished Skinner–Wiles interface at three; Pan's p≥5 theorem does not replace them. |
| PotentialModularityAndCompatibleSystems R23–R24 | The early soluble-extension interface, separate from potential modularity; system carriers and specialisation. KW I Theorem 4.1 is an output of R22.5/R22.6. The modern ramified reducible transfer is owned by R32.6. |
| PadicLocalLanglandsForGL2Qp R30; CompletedCohomologyAndLocalGlobalCompatibility R31 | Local block results, Breuil–Mézard cycles, completed Hecke quotients, typed support, classicality and the specified auxiliary globalisations. |
| IntegralHeckeAndGaloisDeterminants | Determinant-fixed pseudodeformations and the trace comparison with nonsplit extensions. |
| ClassicalSerreModularity R26–R27, R33 | Consumer of the classical lifting exports and modern congruence transfers. The general Serre endpoint cannot be a prerequisite of an independence-certified route to itself. |

The link maps in `research/blueprint/links/` contain no link or overlap entry with a GL2ModularityLifting endpoint in the input snapshot. The boundaries above therefore come from the roadmap and the part packets' prerequisites, uses and ownership proposals. They do not assert new accepted cross-roadmap links. The handoff collects the exact requests, including requested interfaces that suppliers have not yet delivered.

## Conventions

Write p for the coefficient prime, 𝒪 for a finite coefficient valuation ring, 𝔽 for its residue field and ρ̄ for a two-dimensional residual representation. A choice of lattice and coefficient extension must be tracked whenever a reduction is used. The totally real base field F in R22 is distinct from the base ℚ of the modern statement table. G_F denotes its absolute Galois group. Soluble and solvable refer to the same group-theoretic condition; an allowable extension is defined by the tower and image-preservation conditions below, not by a choice of terminology.

Write χ_p or ε for the p-adic cyclotomic character, and ω_p (or χ̄_p) for its residual character. In the classical lifting data the determinant is ψχ_p; in a normalized weight-k modern statement it is a finite-order character times ε^{k−1}. The two uses of ψ have different contracts and are not identified. The signed prime is p* = (−1)^((p−1)/2)p, with its own definition node. Hodge–Tate weights are normalized to {0,k−1}, k>1, only after tracking the twist and recovery of the modular weight.

The residual hypotheses (α) and (β) mean existence of actual Hilbert cuspidal witnesses of the specified weight and level. Their stable identifiers retain the prefix `R22.5/kw-residual-modularity`, but their owning layer is R22.1; they appear there before the allowable-base-change and §8 constructions. Strong residual modularity is a separate Kisin condition. At p=2 the determinant condition on a characteristic-zero lift retains oddness: oddness of a residual determinant alone cannot distinguish −1 from 1.

Barsotti–Tate, potentially Barsotti–Tate and regular de Rham lifting are separate contracts. R22.6's classical weight-two theorems cannot stand in for R32.3's arbitrary distinct Hodge–Tate weights. A reducible residual semisimplification does not permit a reducible characteristic-zero lift in Pan's theorem. At three, ordinarity and the normalized quotient-character and finite-order determinant hypotheses must be supplied on each lift; congruence does not supply them.

For Pan, component means an irreducible component of the specified determinant-fixed pseudodeformation spectrum. The seed for goodness is a potentially nice point in the closure of ordinary arithmetic points. A length-one chain still needs that seed. In the Lean prototype the argument named `nice` of `panGoodComponent` is the *potentially* nice set; it is distinct from Pan's nice Hecke primes. The symbol R_B^{red} in the extension-geometry statement is the reduced closed reducible locus, not R_B modulo its nilradical.

A KW historical almost strictly compatible system and the Dieulefait–Pacetti Definition 1.10 carrier have different contracts. The modern application explicitly needs all-member de Rham data and common regular Hodge–Tate weights, even at a ramified coefficient prime. The lack of the Weil–Deligne comparison there is precisely what the de Rham lifting statement can avoid; it does not remove the de Rham hypothesis.

## Sources and versions

The source register below preserves the versions and locator conventions of the input packets. Per-node citations identify the precise source and passage for the planned statement and proof. These are inherited source records, rather than a new paper extraction. In particular, Kisin's DVI numbering and the journal numbering are not interchangeable; the source qualifications and corrections following the layers remain in force.

Dieulefait–Pacetti is recorded under `DIEULEFAIT-PACETTI` for arXiv v2. The published PDF has aliases `DIEULEFAIT-PACETTI-PUBLISHED` in part R22.1 and `DP-PUBLISHED` in part R32.3; both describe the same publisher file. The PDF and publisher HTML section numbering differ, so node locators retain their PDF convention.

- **`KW2-2009`:** Chandrashekhar Khare and Jean-Pierre Wintenberger — [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Authors' final version (PDF dated 30 May 2009), 98 pages, on Khare's UCLA page; published as Invent. Math. 178 (2009), 505–586. Printed page = PDF page. Its numbering is the published one.
- **`GEE-MLT-2022`:** Toby Gee — [Modularity lifting theorems](https://arxiv.org/pdf/2202.05818v2). Essential Number Theory 1 (2022), no. 1, 73–126; arXiv:2202.05818v2, 45 pages. The arXiv version was read; printed page = PDF page.
- **`KW1-2009`:** Chandrashekhar Khare and Jean-Pierre Wintenberger — [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Authors' version on Khare's UCLA page (23 pages); published as Invent. Math. 178 (2009), 485–504. Printed page = PDF page (the file's own numbering).
- **`KISIN-2ADIC-2009`:** Mark Kisin — [Modularity of 2-adic Barsotti–Tate representations](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi). Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page (the preprint's own numbering). Published as Invent. Math. 178 (2009), 587–634.
- **`KISIN-FFLAT-2009`:** Mark Kisin — [Moduli of finite flat group schemes, and modularity](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi). Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page (the preprint's own numbering). Published as Ann. of Math. 170 (2009), 1085–1180.
- **`DIEULEFAIT-PACETTI`:** Luis Victor Dieulefait and Ariel Martín Pacetti — [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2 (3 May 2022); printed page = PDF page. The same file as ClassicalSerreModularity, OrdinaryAutomorphicFormsAndModularityLifting and GL2ModularityLifting part R32.3.
- **`KISIN-FM-2009`:** Mark Kisin — [The Fontaine–Mazur conjecture for GL₂](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi). Author's preprint as a DVI file on Kisin's Harvard page (fmc.dvi), read through a text extraction of the DVI; printed page = DVI page. Published as J. Amer. Math. Soc. 22 (2009), no. 3, 641–690, which was not read. In §2.2 the DVI's (2.2.9), Lemma (2.2.10), Proposition (2.2.14), Corollary (2.2.16) and Theorem (2.2.17) are cited by Gee–Kisin, Hu–Tan and Tung as (2.2.10), (2.2.11), (2.2.15), (2.2.17) and (2.2.18).
- **`TUNG-2021-P3`:** Shen-Ning Tung — [On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_{Q_p}](https://arxiv.org/pdf/1803.07451v4). Algebra Number Theory 15 (2021), no. 9, 2173–2194; arXiv:1803.07451v4 (21 March 2021, the latest version). The arXiv version was read; printed page = PDF page.
- **`HU-TAN-2015`:** Yongquan Hu and Fucheng Tan — [The Breuil–Mézard conjecture for non-scalar split residual representations](https://arxiv.org/pdf/1309.1658v2). Ann. Sci. Éc. Norm. Supér. (4) 48 (2015), no. 6, 1383–1421; arXiv:1309.1658v2 (13 November 2014). The arXiv version was read; printed page = PDF page.
- **`PASKUNAS-BM-2015`:** Vytautas Paškūnas — [On the Breuil–Mézard conjecture](https://arxiv.org/pdf/1209.5205v3). Duke Math. J. 164 (2015), no. 2, 297–359; arXiv:1209.5205v3 (20 March 2014). The arXiv version was read; printed page = PDF page.
- **`EMERTON-LGC-2011`:** Matthew Emerton — [Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf). Preprint, draft of 23 March 2011, 119 pages, on Emerton's University of Chicago page; not published in a journal. Printed page = PDF page.
- **`GEE-KISIN-2014`:** Toby Gee and Mark Kisin — [The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/pdf/1208.3179v5). Forum Math. Pi 2 (2014), e1; arXiv:1208.3179v5 (12 June 2026). Only Appendix B, 'Errata for [Kis09a]', was read; printed page = PDF page.
- **`DIEULEFAIT-PACETTI-PUBLISHED`:** Luis Victor Dieulefait and Ariel Martín Pacetti — [A simplified proof of Serre's conjecture](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf). Rev. Real Acad. Cienc. Exactas Fis. Nat. Ser. A-Mat.117 (2023), article153; version of record
- **`CHT-2008`:** Laurent Clozel, Michael Harris and Richard Taylor — [Automorphy for some l-adic lifts of automorphic mod l Galois representations](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf). Publ. Math. Inst. Hautes Études Sci. 108 (2008), 1–181, published version from Numdam. Printed page = PDF page.
- **`SKINNER-WILES-1999`:** C. M. Skinner and A. J. Wiles — [Residually reducible representations and modular forms](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126; Numdam scan (OCR text layer poor; the main theorem was read on the page image; printed page = PDF page + 3). The same file as OrdinaryAutomorphicFormsAndModularityLifting and AutomorphicGaloisRepresentations.
- **`PAN-2022`:** Lue Pan — [The Fontaine–Mazur conjecture in the residually reducible case](https://arxiv.org/pdf/1901.07166v2). J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2. The arXiv version was read; locators give its PDF pages.
- **`PASKUNAS-2016`:** Vytautas Paškūnas — [On 2-dimensional 2-adic Galois representations of local and global fields](https://arxiv.org/pdf/1509.00332v2). Algebra Number Theory 10 (2016), no. 6, 1301–1358; arXiv:1509.00332v2, dated 25 April 2016 on its first page and version record. The arXiv version was read; printed page = PDF page.
- **`TUNG-2021-DYADIC`:** Shen-Ning Tung — [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/pdf/1908.06174v3). Math. Z. 298 (2021), 107–159; arXiv:1908.06174v3. The arXiv version was read.
- **`DP-PUBLISHED`:** Luis Victor Dieulefait and Ariel Martín Pacetti — [A simplified proof of Serre’s conjecture](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf). Rev. R. Acad. Cienc. Exactas Fís. Nat. Ser. A Mat. 117, article 153 (2023); publisher PDF, 17 pages. Locators use the PDF section numbering, which agrees with arXiv v2 (the publisher HTML increments the section numbers).

## Existing library interfaces

The pinned baselines are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The coverage audit has no reviewed GL2ModularityLifting layer entry in this snapshot. Its absence supplies no arithmetic implementation. The following limited Mathlib interfaces are the packets' existing building blocks; their statements were checked against the pinned source during assembly.

| Declaration | Module | What is supplied |
| --- | --- | --- |
| `mathlib:IsReduced` | `Mathlib/Algebra/GroupWithZero/Basic.lean` | Reduced rings (no nonzero nilpotents). |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Group algebras 𝒪[Δ]. |
| `mathlib:Polynomial.Splits` | `Mathlib/Algebra/Polynomial/Splits.lean` | The predicate that a polynomial splits into constant and monic linear factors; it does not lift roots and is not Hensel's lemma. |
| `mathlib:Group.IsSolvable` | `Mathlib/GroupTheory/Solvable.lean` | Solvable groups. |
| `mathlib:Group.isSolvable_of_ker_le_range` | `Mathlib/GroupTheory/Solvable.lean` | For homomorphisms f : G′ → G and g : G → G″ with ker g contained in range f, solvability of G′ and G″ implies solvability of G. The Borel-solvability bridge is separate. |
| `mathlib:Group.isSolvable_of_isSolvable_injective` | `Mathlib/GroupTheory/Solvable.lean` | A subgroup (injective image) of a solvable group is solvable. |
| `mathlib:ZMod.neg_one_ne_one` | `Mathlib/Data/ZMod/Basic.lean` | −1 ≠ 1 in ZMod n for n > 2. |
| `mathlib:HenselianRing` | `Mathlib/RingTheory/Henselian.lean` | For a commutative ring R and ideal I, includes simple-root lifting for monic f: f(a₀) ∈ I and the derivative a unit modulo I imply a root a congruent to a₀ modulo I. |
| `mathlib:Relation.ReflTransGen` | `Mathlib.Logic.Relation` | Reflexive transitive closure with refl and tail constructors; used for the finite seeded component chain. |
| `mathlib:Relation.ReflTransGen.trans` | `Mathlib.Logic.Relation` | Compose two ReflTransGen chains, hence append a one-edge chain. |
| `mathlib:Relation.reflTransGen_iff_eq` | `Mathlib.Logic.Relation` | If there is no outgoing r-edge from a, ReflTransGen r a b iff b=a. |
| `mathlib:PrimeSpectrum.comap` | `Mathlib.RingTheory.Spectrum.Prime.RingHom` | A ring homomorphism R→S induces Spec S→Spec R by inverse image of the prime ideal. |
| `mathlib:minimalPrimes` | `Mathlib.RingTheory.Ideal.MinimalPrime.Basic` | The set of prime ideals minimal over the zero ideal. |
| `mathlib:minimalPrimes.equivIrreducibleComponents` | `Mathlib.RingTheory.Spectrum.Prime.Topology` | Order equivalence between minimal primes of R and the order dual of the irreducible components of Spec R. |

In particular, `Polynomial.Splits` does not supply Hensel lifting. The simple-root contract is `HenselianRing`, and maximal-ideal-adic completeness supplies the pinned `IsAdicComplete.henselianRing` instance. Prime-spectrum incidence and reflexive transitive closure supply the generic Pan prototypes; they do not supply nice-prime arithmetic or modularity.

## Layer overview

The classical construction runs from residual witnesses and the minimal map through auxiliary levels, arithmetic patching and component support to the odd-prime and dyadic lifting outputs. The modern statement table then separates four theorem contracts before proving their odd, dyadic, reducible and ordinary branches. The last layer packages precisely those contracts for congruence consumers. Inside each layer, definitions and supplier-dependent constructions precede their applications according to the exact internal prerequisite graph.

| Layer | Goal | Nodes | Packet coverage |
| --- | --- | --- | --- |
| [`GL2ModularityLifting:R22.1`](#r22-1) | Minimal deformation-to-Hecke maps | 17 | partial |
| [`GL2ModularityLifting:R22.2`](#r22-2) | Auxiliary levels and freeness | 6 | partial |
| [`GL2ModularityLifting:R22.3`](#r22-3) | Arithmetic patching | 5 | partial |
| [`GL2ModularityLifting:R22.4`](#r22-4) | Component arguments and nonminimal levels | 4 | partial |
| [`GL2ModularityLifting:R22.5`](#r22-5) | Odd-prime modularity lifting | 11 | partial |
| [`GL2ModularityLifting:R22.6`](#r22-6) | Dyadic lifting and Kisin's completion | 12 | partial |
| [`GL2ModularityLifting:R32.1`](#r32-1) | Exact statement table | 12 | partial |
| [`GL2ModularityLifting:R32.2`](#r32-2) | Residually modular odd-prime lifting | 6 | partial |
| [`GL2ModularityLifting:R32.3`](#r32-3) | Dyadic de Rham lifting | 3 | planned |
| [`GL2ModularityLifting:R32.4`](#r32-4) | Pan's residually reducible theorem | 15 | planned |
| [`GL2ModularityLifting:R32.5`](#r32-5) | Small-prime ordinary completion | 3 | planned |
| [`GL2ModularityLifting:R32.6`](#r32-6) | Modularity-transfer statements for congruence arguments | 7 | planned |

The labels describe the input packets' planning coverage, not Lean implementation. In particular, planned layers may still carry the explicit source-independence and carrier gaps below.

<a id="r22-1"></a>

## R22.1. Minimal deformation-to-Hecke maps

Begin with the residual (α)/(β) witnesses, allowable field changes and the determinant alternatives. KW II §8 constructs actual modular lifts with the prescribed local data before minimal-level data are formed. Once the Hecke eigensystems satisfy those local conditions, the universal deformation property gives the map and Hecke generators give its surjectivity. The framed tensor and module require the stated finite-presentation bridge.

<a id="r22-5-kw-residual-modularity"></a>

### Residual modularity of minimal weight and unramified level

**Definition** · `GL2ModularityLifting:R22.5/kw-residual-modularity`.

Stable R22.5 identifier retained, but parent R22.1 owns the early α/β definition. R22.5 and R22.6 only consume it. This prevents §8 from depending on its own prescribed-witness conclusion.

For F totally real and the residual representation ρ̄ of KW lifting data, ResidualModularAlpha(ρ̄) means there exists a cuspidal π of GL₂(𝔸_F) with ρ̄_π≅ρ̄, parallel weight k(ρ̄), and π_v unramified at every v|p. This is a predicate on witnesses, not an assertion that every modular witness has minimal weight.

**Hypotheses and conventions.**

- F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).

**Proof plan.**

1. Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from R19.2. It precedes construction of minimal-level-data; no residual-modularity theorem or optimized witness is part of the definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.ResidualModularAlpha` | constructor | (α): ρ̄ ≅ ρ̄_π with π unramified above p, of weight k(ρ̄). |
| `TauCeti.ModularityLifting.residualModularAlpha_iff` | characterisation | The predicate holds iff a cuspidal witness of weight k(ρ̄), unramified at all v\|p, with residual representation ρ̄ exists. |
| `TauCeti.ModularityLifting.residualModularAlpha_of_witness` | constructor | A witness with the stated residual representation, weight and level gives ResidualModularAlpha(ρ̄). |

**Unit tests.**

- `alpha_of_goodReduction` (example): A modular elliptic curve with good reduction at p and k(ρ̄)=2 supplies an α-witness.
- `alpha_weight_must_match` (non-example): An unramified weight k(ρ̄)+p−1 eigenform is not itself an α-witness, since its weight differs from k(ρ̄).
- `steinberg_not_alpha` (non-example): A Steinberg eigenform at p is not an α-witness, while its conductor-p component is allowed in a β-witness. This concerns that witness, not nonexistence of every α-witness for ρ̄.

**Prerequisites.** `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `AutomorphicGaloisRepresentations:R19.2`.

**Consumers.**

- [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting): the residual input for p > 2.
- [`GL2ModularityLifting:R22.6/kw-dyadic-lifting`](#r22-6-kw-dyadic-lifting): the residual input for p = 2.
- [`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`](#r22-5-alpha-beta-from-modularity-over-q): KW I Theorem 4.1, where 'ρ̄ modular' over ℚ is converted into (α) and (β) over an allowable F.
- [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change): Transport of the witnesses along allowable base changes.
- [`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`](#r22-1-theorem-8-2-minimal-modular-lifts): The hypotheses of Theorem 8.2 and Theorem 8.4.

**Acceptance checks.**

- ρ̄ = ρ̄_E for an elliptic curve E/ℚ with good reduction at p: E's newform is unramified at p of weight 2, so (α) holds when k(ρ̄) = 2 and (β) holds.
- At weight two an α-witness also witnesses β. A Steinberg witness has conductor p, so that particular witness satisfies β's local condition but not α's; another unramified witness for the same residual representation is not ruled out.
- A residual witness of weight k(ρ̄) + p − 1, unramified at p, witnesses neither (α) nor (β): the weight at infinity must be k(ρ̄), resp. 2.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8.2, p. 70. Hypothesis (α); (β) follows it.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kw-residual-modularity-beta"></a>

### Residual modularity of weight two and conductor at most one

**Definition** · `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`.

Stable R22.5 identifier retained, but parent R22.1 owns the early α/β definition. R22.5 and R22.6 only consume it. This prevents §8 from depending on its own prescribed-witness conclusion.

For F totally real and the residual representation ρ̄ of KW lifting data, ResidualModularBeta(ρ̄) means there exists a cuspidal π of GL₂(𝔸_F) with ρ̄_π≅ρ̄, parallel weight two, and conductor exponent at most one at every v|p.

**Hypotheses and conventions.**

- F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).

**Proof plan.**

1. Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from R19.2. It precedes construction of minimal-level-data; no residual-modularity theorem or optimized witness is part of the definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.ResidualModularBeta` | constructor | The existential predicate with the stated weight-two and conductor conditions. |
| `TauCeti.ModularityLifting.residualModularBeta_iff` | characterisation | ResidualModularBeta(ρ̄) iff a cuspidal π with residual representation ρ̄, weight two and local conductor exponent ≤1 exists. |
| `TauCeti.ModularityLifting.residualModularBeta_of_witness` | constructor | A π satisfying those three conditions gives ResidualModularBeta(ρ̄). |

**Unit tests.**

- `beta_of_unramified_weight_two` (example): A weight-two unramified local witness has conductor exponent zero and hence satisfies the β local bound.
- `beta_allows_steinberg_witness` (characterisation): A weight-two Steinberg component of conductor exponent one is allowed in a β-witness.
- `conductor_two_not_beta_witness` (non-example): A weight-two eigenform with conductor exponent two at a place above p is not itself a β-witness; this does not preclude another witness.

**Prerequisites.** `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `AutomorphicGaloisRepresentations:R19.2`.

**Consumers.**

- [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting): the residual input for p > 2.
- [`GL2ModularityLifting:R22.6/kw-dyadic-lifting`](#r22-6-kw-dyadic-lifting): the residual input for p = 2.
- [`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`](#r22-5-alpha-beta-from-modularity-over-q): KW I Theorem 4.1, where 'ρ̄ modular' over ℚ is converted into (α) and (β) over an allowable F.
- [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change): Transport of the witnesses along allowable base changes.
- [`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`](#r22-1-theorem-8-2-minimal-modular-lifts): The hypotheses of Theorem 8.2 and Theorem 8.4.

**Acceptance checks.**

- ρ̄ = ρ̄_E for an elliptic curve E/ℚ with good reduction at p: E's newform is unramified at p of weight 2, so (α) holds when k(ρ̄) = 2 and (β) holds.
- At weight two an α-witness also witnesses β. A Steinberg witness has conductor p, so that particular witness satisfies β's local condition but not α's; another unramified witness for the same residual representation is not ruled out.
- A residual witness of weight k(ρ̄) + p − 1, unramified at p, witnesses neither (α) nor (β): the weight at infinity must be k(ρ̄), resp. 2.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8.2, p. 70. Hypothesis (β), p.70: the cuspidal residual witness has conductor exponent at most one above p and parallel weight two. This is not the preceding hypothesis (α).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-1-allowable-base-change"></a>

### Allowable base change for the KW residual problem

**Definition** · `GL2ModularityLifting:R22.1/allowable-base-change`.

Let ρ̄ : G_ℚ → GL₂(𝔽) be continuous, absolutely irreducible and totally odd, and F a totally real number field, unramified at p and split at p if ρ̄|_{D_p} is irreducible, with ρ̄|_{G_F} of non-solvable image if p = 2 and ρ̄|_{G_{F(μ_p)}} absolutely irreducible if p > 2 (KW II §7.6.2). An allowable base change is a finite extension F′/F that is (1) totally real; (2) soluble, in the sense that there is a tower F = F₀ ⊂ F₁ ⊂ … ⊂ F_n = F′ with every F_{i+1}/F_i Galois with soluble group; (3) of even degree; (4) unramified at the places above p, and split at them if ρ̄|_{D_p} is irreducible; (5) such that im ρ̄|_{G_{F′}} = im ρ̄|_{G_F} and ρ̄|_{G_{F′(μ_p)}} is absolutely irreducible. It is a property of an actual extension and of the restricted representation. That such extensions exist with prescribed completions is R22.1/allowable-base-change-existence, and extra splitting conditions in an application are stated there, not here.

**Hypotheses and conventions.**

- F is unramified at p, and split at p if the local residual representation is irreducible; p = 2 uses non-solvable residual image, p > 2 cyclotomic absolute irreducibility.
- KW II do not define 'solvable extension'. The tower form is what their uses need and what their constructions give: Langlands' base change and descent are applied one cyclic step at a time, and the field F_r of the proof of Theorem 8.4 is a tower of quadratic extensions that need not be Galois over F. A Galois extension with soluble group is the case n = 1.
- For p = 2 condition (5) keeps the image non-solvable; the absolute irreducibility over F′(μ₂) = F′ is then automatic.
- 'ρ̄|_{D_p} is irreducible' means absolutely irreducible, as everywhere in KW II §§7–8. An unramified ρ̄|_{D_p} has cyclic image and is reducible over 𝔽̄_p, although it can be irreducible over 𝔽; read over 𝔽, Lemma 8.1 would ask for a field both split at p and making ρ̄ trivial there.
- Definition 7.9 prints im(ρ̄) = im(ρ̄|_{F′}). Condition (5) is the relative form ρ̄(G_{F′}) = ρ̄(G_F), which is what the paragraph after the definition proves (linear disjointness from the fixed field of the kernel of ρ̄|_F) and what composition needs; for the fields KW II construct the two agree, since ρ̄(G_F) = ρ̄(G_ℚ).

**Proof plan.**

1. KW II Definition 7.9, with the restriction maps G_{F′} ⊂ G_F ⊂ G_ℚ and the tower form of solubility.
2. Composition: if F′/F is allowable for ρ̄ and F″/F′ is allowable for ρ̄ (over the base F′, which again satisfies the conditions of §7.6.2), then F″/F is allowable: the towers concatenate, degrees multiply, and conditions (1), (4), (5) are transitive.
3. Additional splitting requirements of an application are separate from the definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.toExtension` | projection | The extension F′/F, as an intermediate field of a fixed algebraic closure of F, with the inclusion G_{F′} ⊂ G_F. |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.degree_even` | characterisation | [F′ : F] is even. |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.image_eq` | compatibility | ρ̄(G_{F′}) = ρ̄(G_F), and ρ̄\|_{G_{F′(μ_p)}} is absolutely irreducible. |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.comp` | functoriality | If F′/F is allowable and F″/F′ is allowable (over the base F′), then F″/F is allowable. |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.solubleTower` | projection | A tower F = F₀ ⊂ … ⊂ F_n = F′ in which every step is Galois with soluble group; for F′/F Galois with soluble group the tower has one step. |
| `TauCeti.ModularityLifting.KW.AllowableBaseChange.totallyReal` | projection | F′ is totally real. |

**Unit tests.**

- `allowable_odd_degree` (non-example): If [F′ : F] = 3 then F′/F is not an allowable base change, whatever ρ̄ is.
- `allowable_image_loss` (non-example): If ρ̄(G_{F′}) is a proper subgroup of ρ̄(G_F), then F′/F is not allowable, even if F′/F is totally real and quadratic.
- `allowable_comp_degree` (example): If F′/F and F″/F′ are allowable then F″/F is allowable; for two quadratic steps [F″ : F] = 4.
- `allowable_trivial_extension` (degenerate): The trivial extension F′ = F is not allowable: its degree 1 is odd.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.3`; `ArithmeticGaloisRepresentations:R01.4`.

**Consumers.**

- [`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`](#r22-1-theorem-8-2-minimal-modular-lifts): The field change in the minimal-lift conclusion.
- [`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`](#r22-1-theorem-8-4-prescribed-modular-lifts): The field change allowed in the prescribed-lift construction.
- [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence): The existence theorem produces extensions satisfying this definition, with prescribed completions.
- [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change): The residual hypotheses (α) and (β) are transported along such extensions.

**Acceptance checks.**

- An extension of odd degree is not allowable.
- A soluble totally real extension of even degree on which the residual image shrinks is not allowable.
- A non-normal cubic extension is not allowable even if its Galois closure has group S₃: it has odd degree, and it is not the top of a tower of Galois steps.
- For p > 2, Theorem 8.2 asks in addition that the allowable base change be split at all places above p.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Definition 7.9, p. 68. Even degree, unramified/split-at-p and residual image/irreducibility conditions.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.6.2, after Definition 7.9, p. 68. Why allowable base changes are harmless: base change transports the automorphic witnesses.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-allowable-base-change-existence"></a>

### Existence of allowable base changes with prescribed completions

**Lemma** · `GL2ModularityLifting:R22.1/allowable-base-change-existence`.

Let F and ρ̄ be as in KW II §7.6.2 (F totally real, unramified at p, split at p if ρ̄|_{D_p} is irreducible; ρ̄|_{G_F} of non-solvable image if p = 2, and ρ̄|_{G_{F(μ_p)}} absolutely irreducible if p > 2). Let S₀ be a finite set of finite places of F containing the places above p, and for v ∈ S₀ let E_v/F_v be a finite Galois extension, unramified if v | p and equal to F_v if v | p and ρ̄|_{D_p} is irreducible. Let L/F be a finite extension. Then there is a finite Galois extension F′/F with soluble Galois group such that: (1) F′ is totally real; (2) [F′ : F] is even; (3) F′_w ≅ E_v over F_v for every v ∈ S₀ and every place w | v of F′, so that F′/F is unramified above p, split at each v with E_v = F_v, and split above p when ρ̄|_{D_p} is irreducible; (4) F′ is linearly disjoint over F from L, from the fixed field K of ker ρ̄|_{G_F} and from K(μ_p), so that ρ̄(G_{F′}) = ρ̄(G_F) and ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)}). (5) If every E_v, v ∈ S₀, has degree at most 2 over F_v, then F′ can be taken quadratic over F. In particular F′/F is an allowable base change (R22.1/allowable-base-change) with the prescribed completions at S₀. The base F′ again satisfies the conditions of §7.6.2, so the statement can be applied repeatedly, and the resulting towers are allowable over F.

**Hypotheses and conventions.**

- At a place above p only an unramified E_v may be prescribed, and only the trivial one when ρ̄|_{D_p} is irreducible. A nontrivial unramified E_v above p occurs in Lemma 8.1 (to make ρ̄ trivial above p when it is unramified there), in the dyadic branch with k(ρ̄) = 4 and in type (C) with k(ρ̄) = 2, the two cases in which Theorem 8.4 does not promise splitting at p.
- Evenness comes from one auxiliary place with the unramified quadratic extension prescribed, not from the places of S₀; without it F′ = F would satisfy (1), (3) and (4).
- KW II's second criterion, for dihedral projective image (a prime split in the field cut out by the projective image and inert in F(μ_p)), is not needed: disjointness from K(μ_p) preserves the image over the cyclotomic field.
- KW II cite Lemma 2.2 of Taylor's 'On icosahedral Artin representations II' for this; that paper was not read. The statement is derived here from Clozel–Harris–Taylor's Lemma 4.1.2, which was read and is requested from PotentialModularityAndCompatibleSystems R23.1.
- No automorphic input is used: this is existence of a field, not GL2AutomorphicRepresentationsAndTransfer R17.4's base change.
- 'ρ̄|_{D_p} is irreducible' means absolutely irreducible (see R22.1/allowable-base-change).
- Clause (5) matters: Lemma 4.1.2 controls the completions but not the global degree, and the proof of Theorem 8.4 needs extensions of degree exactly 2 (KW II p. 77: each F_i/F_{i−1} is quadratic, with one place above v_i's neighbours and two above v_i). For exponent 2 no class field theory is needed, only weak approximation.

**Proof plan.**

1. Auxiliary place. Choose a finite place u of F outside S₀, not above p, and let E_u be the unramified quadratic extension of F_u.
2. Apply Clozel–Harris–Taylor's Lemma 4.1.2 (requested from PotentialModularityAndCompatibleSystems R23.1) to F, to D the Galois closure over F of L·K(μ_p), and to the set S = S₀ ∪ {u} ∪ {real places of F}, with the given E_v at S₀, E_u at u and E_v = F_v = ℝ at the real places. It gives a finite soluble Galois F′/F, linearly disjoint from D, with F′_w ≅ E_v for all w | v ∈ S.
3. Totally real: every real place of F splits completely in F′. Even degree: F′/F is Galois, so the local degree [F′_w : F_u] = 2 divides [F′ : F]. The conditions at p are read off (3).
4. Images. F′ is linearly disjoint from K(μ_p) over F, so restriction is an isomorphism Gal(F′K(μ_p)/F′) ≅ Gal(K(μ_p)/F) carrying the subgroup that fixes μ_p to the subgroup that fixes μ_p. Hence ρ̄(G_{F′}) = ρ̄(G_F) and ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)}); absolute irreducibility over F′(μ_p), and non-solvability at p = 2, are properties of these images (ArithmeticGaloisRepresentations R01.4).
5. Quadratic case (5). Write E_v = F_v(√d_v) with d_v ∈ F_v^× (d_v = 1 if E_v = F_v). Choose a finite place z of F outside S₀, not above 2, that splits completely in D (Chebotarev for the trivial class; Tau Ceti Chebotarev, Layer 10), and a non-square unit d_z of F_z. The squares are open in each F_v^×, so by weak approximation there is d ∈ F^× that is totally positive, lies in d_v·(F_v^×)² for v ∈ S₀ and in d_z·(F_z^×)². Put F′ = F(√d). It is totally real, quadratic (z is inert), with completions E_v at S₀; and F′ is not contained in D, because z is inert in F′ and splits completely in D, so F′ ∩ D = F. No auxiliary place u is needed, since the degree is 2.
6. Iteration. F′ is totally real, unramified at p and split at p when required, with the same residual images, so §7.6.2 holds over F′; a tower of such steps is allowable over F by the composition property of R22.1/allowable-base-change.

**Prerequisites.** [`GL2ModularityLifting:R22.1/allowable-base-change`](#r22-1-allowable-base-change); `PotentialModularityAndCompatibleSystems:R23.1`; `ArithmeticGaloisRepresentations:R01.4`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Acceptance checks.**

- F = ℚ, p = 5, S₀ = {5} with E₅ = ℚ₅, u = 3: ℚ(√11) is real quadratic, 5 splits in it (11 ≡ 1 mod 5) and 3 is inert (11 ≡ 2 mod 3). Disjointness from K is a further condition, which is why D enters the construction.
- With S₀ = {v | p} and every E_v = F_v the lemma gives the allowable base changes 'split at p' of Theorem 8.2.
- Prescribing the unramified extension of degree m at the places of a finite set makes the p-part of the residue-field unit groups there as large as required; this is the use in the proof of Theorem 8.2 (order divisible by the p-part of 2p(4N_w)).
- Over the field F_{i−1} of the proof of Theorem 8.4, clause (5) with the trivial extension at the places above v_i and the unramified quadratic extension at the places above the other v_j gives a quadratic F_i, with v_j inert for j ≠ i and split for j = i. Without clause (5) the degree of F_i could be a larger even number, and the count of places above v_1, …, v_i in the proof would be wrong.
- Without the real places in S the extension could be totally complex, and the Hilbert modular setting would be lost.

**Sources.**

- [`CHT-2008`](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Lemma 4.1.2, p. 116. The existence theorem applied; S may contain real places.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.6.2, paragraph after Definition 7.9, p. 68. KW II's sufficient condition for the image conditions; the node proves it and strengthens it to disjointness from the field cut out with the p-th roots of unity.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.6.2, p. 68. The existence statement is left to the reader in the source (the spelling is the source's).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-alpha-beta-under-allowable-base-change"></a>

### The residual hypotheses (α) and (β) persist under allowable base change

**Lemma** · `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`.

Let F and ρ̄ be as in KW II §7.6.2 and F′/F an allowable base change. If ρ̄|_{G_F} satisfies (α) with witness π, then ρ̄|_{G_{F′}} satisfies (α) with witness the base change π_{F′}; likewise for (β). More precisely π_{F′} is cuspidal, it is discrete series of the same parallel weight at every infinite place of F′, ρ̄_{π_{F′}} ≅ ρ̄_π|_{G_{F′}}, and for places w | v | p: π_{F′,w} is unramified if π_v is, and its conductor exponent is at most 1 if that of π_v is.

**Hypotheses and conventions.**

- The tower form of solubility in R22.1/allowable-base-change is what is used: base change is applied along each cyclic step of prime degree.
- Cuspidality of each base change uses that the restriction of ρ̄ stays absolutely irreducible (condition (5) of the definition): a cuspidal π whose base change along a cyclic extension is not cuspidal is automorphically induced from that extension, and then ρ_π restricted to it is reducible.
- F′/F is unramified above p, and for an unramified local extension the conductor exponent of the local base change equals that of π_v.
- The definitions of (α) and (β) do not contain this transport; KW II use it without comment whenever they 'reinitialise' the base field.

**Proof plan.**

1. Refine the tower of R22.1/allowable-base-change to cyclic steps of prime degree, each Galois over the previous field and totally real.
2. For one cyclic step apply Langlands' base change (GL2AutomorphicRepresentationsAndTransfer R17.4): it exists, is compatible with local base change at every place, and is cuspidal by the irreducibility remark above.
3. Local behaviour. At infinite places the extension of completions is ℝ/ℝ and the weight is unchanged. At w | v | p the extension F′_w/F_v is unramified: an unramified principal series stays unramified, and the conductor exponent is unchanged in general.
4. Galois side. ρ_{π_{F′}} ≅ ρ_π|_{G_{F′}} by comparison of Frobenius traces at the unramified places (AutomorphicGaloisRepresentations R19.2), hence the same for the residual representations.

**Prerequisites.** [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); [`GL2ModularityLifting:R22.1/allowable-base-change`](#r22-1-allowable-base-change); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicGaloisRepresentations:R19.2`.

**Acceptance checks.**

- F′/F quadratic, π unramified at v | p inert in F′: π_{F′,w} is unramified, so an (α)-witness base-changes to an (α)-witness.
- A Steinberg component at v | p (conductor exponent 1) base-changes along an unramified extension to a Steinberg component: a (β)-witness stays a (β)-witness and does not become an (α)-witness.
- If the residual image shrank over F′ so that ρ̄|_{G_{F′}} were reducible, π_{F′} could fail to be cuspidal; this is excluded by the definition of allowable.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.6.2, after Definition 7.9, p. 68. Why allowable base changes are harmless: base change transports the automorphic witnesses.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-lemma-8-1-residual-field-choice"></a>

### Lemma 8.1: the initial totally real field

**Theorem** · `GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`.

For S-type ρ̄ : G_ℚ → GL₂(𝔽), with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2, cyclotomic irreducibility for p > 2 and non-solvable image for p = 2, there exists F/ℚ solvable, totally real of even degree, unramified at p, split at p if ρ̄|D_p is irreducible or k(ρ̄) = p + 1, preserving the relevant residual image hypotheses. The restriction is unramified away from p, and is trivial at places above p if ρ̄|D_p is unramified. The following paragraph SUPPOSES a suitable determinant character ψ given; its existence is not part of Lemma 8.1.

**Hypotheses and conventions.**

- The representation and residual image hypotheses are those of the opening of KW II §8, p. 69.

**Proof plan.**

1. Local prescriptions over ℚ. At each prime q ≠ p where ρ̄ is ramified let E_q be the extension of ℚ_q cut out by ρ̄|_{D_q}, a finite Galois extension over which ρ̄ becomes trivial. At p let E_p be the unramified extension of degree the order of ρ̄(Frob_p) if ρ̄|_{D_p} is unramified, and E_p = ℚ_p otherwise; in particular E_p = ℚ_p when ρ̄|_{D_p} is absolutely irreducible or k(ρ̄) = p + 1, since ρ̄|_{D_p} is then ramified.
2. Apply R22.1/allowable-base-change-existence over the base ℚ, with S₀ the set of these primes. The base ℚ satisfies §7.6.2 by the residual hypotheses at the opening of §8. The output F/ℚ is soluble and Galois, totally real, of even degree, unramified at p and split at p in the two cases required, with the prescribed completions.
3. Unramified away from p: at a place above q the completion of F contains E_q, over which ρ̄ is trivial. Trivial above p when ρ̄|_{D_p} is unramified: the completion is E_p, which the Frobenius of order the order of ρ̄(Frob_p) cuts out.
4. The image hypotheses over F and F(μ_p) are conclusion (4) of the existence lemma. KW II omit the proof of Lemma 8.1; this is the construction it leaves to the reader.

**Prerequisites.** [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); `ArithmeticGaloisRepresentations:R01.3`; `ArithmeticGaloisRepresentations:R01.4`.

**Acceptance checks.**

- Distinguish unramified at p from split at p.
- Check residual triviality at p only under the source’s unramified hypothesis.
- Do not promote the subsequent assumed ψ to a conclusion of this lemma.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8 opening and Lemma 8.1, pp. 69–70. The field lemma is stated without a proof; the following determinant paragraph is an additional assumption.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-determinant-character-kinds"></a>

### The determinant characters of KW II §8.1

**Definition** · `GL2ModularityLifting:R22.1/determinant-character-kinds`.

Fix the field of Lemma 8.1 and an arithmetic idele class character ψ unramified outside p such that χ_pρ_ψ lifts det ρ̄ and is totally odd. The local alternatives on 𝒪*_{F_p} are (i) N(u)^(2−k(ρ̄)), (ii) ω_p^(k(ρ̄)−2), and (iii) N(u)^(1−p) when k(ρ̄) = 2. These are predicates on the given ψ, not disjoint tags or a character-existence assertion. For p = 2 only (ii) is used.

**Hypotheses and conventions.**

- The norm exponents are integers; ψ is on the finite ideles modulo F* in KW’s convention.

**Proof plan.**

1. Specify the given character and its Galois/class-field-theory comparison.
2. Allow simultaneous satisfaction of (i) and (ii) at weight 2.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.KW.kindIExponent` | data | The integer 2 − k. |
| `TauCeti.ModularityLifting.KW.kindIIExponent` | data | The integer k − 2 for the Teichmüller character. |
| `TauCeti.ModularityLifting.KW.kindIIIExponent` | data | The integer 1 − p, admissible only at residual weight 2. |
| `TauCeti.ModularityLifting.KW.kindsI_II_at_two` | compatibility | At k(ρ̄) = 2 kinds (i) and (ii) are the same condition on ψ: trivial on the units above p. |
| `TauCeti.ModularityLifting.KW.IsKindI` | characterisation | ψ is of kind (i): its restriction to the units above p is u ↦ N(u)^{2−k(ρ̄)}, N the product of the local norms to ℤ_p^×. |
| `TauCeti.ModularityLifting.KW.IsKindII` | characterisation | ψ is of kind (ii): its restriction to the units above p is u ↦ τ(N(u))^{k(ρ̄)−2}, τ the Teichmüller character of ℤ_p^×; this is the character corresponding to ω_p^{k(ρ̄)−2}. |
| `TauCeti.ModularityLifting.KW.IsKindIII` | characterisation | ψ is of kind (iii): k(ρ̄) = 2 and the restriction of ψ to the units above p is u ↦ N(u)^{1−p}. |

**Unit tests.**

- `determinant_overlap_weight_two` (example): At k = 2 the exponents of kinds (i) and (ii) are both 0, and ψ is of kind (i) if and only if it is of kind (ii).
- `determinant_negative_exponent` (example): Kind (iii) at p = 3 has exponent −2, so the norm character is inverted.
- `determinant_third_needs_weight_two` (non-example): At residual weight 4 no ψ is of kind (iii): the predicate contains k(ρ̄) = 2.

**Prerequisites.** [`GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`](#r22-1-lemma-8-1-residual-field-choice); `GlobalGaloisDeformations:R04.6/kw-deformation-data`.

**Consumers.**

- [`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`](#r22-1-theorem-8-2-minimal-modular-lifts): Select the central character and minimal-lift alternative.
- [`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`](#r22-1-theorem-8-4-prescribed-modular-lifts): Match determinant ψχ_p to local types A/B/C.

**Acceptance checks.**

- At k = 2 the exponents 2−k and k−2 are both zero, so kinds (i) and (ii) coincide locally.
- At p = 3, kind (iii) has exponent −2, not truncated natural subtraction.
- At p = 2 do not use the kind-(i)/(iii) branches in the lifting theorem.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8.1, paragraph after Lemma 8.1 and Remark, p. 70. ψ is assumed; kinds (i), (ii), (iii) and their overlap are stated in this paragraph.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-lemma-7-10-determinant-adjustment"></a>

### Lemma 7.10: adjustment of determinant characters

**Lemma** · `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`.

Let ψ, ψ′ be arithmetic characters with the same reduction and equal restrictions to an open subgroup of 𝒪*_{F_p}; assume their restrictions to 𝒪*_{F_v} agree for a finite set V of finite places. After enlarging coefficients, there is a finite-order p-power character ζ, unramified at V, and a totally real solvable extension F′/F, disjoint from any prescribed finite extension and split at V, such that ζ²|_{F′} ψ_{F′} = ψ′_{F′}. For odd p take the unique square root of ψ′/ψ in its p-primary finite-order character group and F′ = F. The dyadic branch needs a local-character extension theorem followed by a split extension; it is not an unrestricted global square-root assertion.

**Hypotheses and conventions.**

- The ratio ψ′/ψ is of finite order, p-primary and totally even. Both local compatibility hypotheses are essential.
- KW II's convention: characters of F*\(𝔸_F^∞)*, that is, idele class characters trivial at the infinite places.
- KW II appeal to the Grunwald–Wang theorem (Artin–Tate, Chapter 10, Theorem 5) for p = 2. What the argument uses is the extension of finitely many local characters of 2-power order to a global character of 2-power order; no global character of prescribed exact order is needed, so the special case of Grunwald–Wang does not arise. It is supplied by Clozel–Harris–Taylor's Lemma 4.1.1 with the 2-primary projection.

**Proof plan.**

1. For odd p, squaring is an automorphism of the finite p-group of characters generated by ψ′/ψ; take ζ its square root there and F′ = F.
2. For p = 2, fix a finite Galois L/F from which F′ is to be disjoint and a finite set W of places, unramified in L and for ψ, ψ′, whose Frobenius elements meet every conjugacy class of Gal(L/F). At v ∈ V ∪ W the character (ψ′/ψ)_v is unramified of 2-power order (the restrictions to the local units agree), so after enlarging 𝒪 it has an unramified square root ζ_v of 2-power order.
3. Extend. By Clozel–Harris–Taylor's Lemma 4.1.1 (requested from PotentialModularityAndCompatibleSystems R23.1) applied to S = V ∪ W ∪ {real places}, with ζ_v at V ∪ W and the trivial character at the real places, there is a finite-order idele class character with these local components; its 2-primary component ζ has 2-power order and the same local components, because they have 2-power order. ζ is unramified at V and trivial at the infinite places.
4. The field. ζ²ψ/ψ′ is a finite-order character of 2-power order, trivial at the real places and on F_v* for v ∈ V ∪ W. By global class field theory (Tau Ceti ClassFieldTheory, Layer 12) its kernel cuts out a cyclic extension F′/F, totally real and split at V ∪ W, over which ζ²ψ and ψ′ agree. F′ ∩ L is Galois over F and split at W, so every Frobenius class of Gal(F′ ∩ L/F) is trivial and F′ ∩ L = F: F′ is linearly disjoint from L.

**Prerequisites.** [`GL2ModularityLifting:R22.1/determinant-character-kinds`](#r22-1-determinant-character-kinds); `PotentialModularityAndCompatibleSystems:R23.1`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `ArithmeticGaloisRepresentations:R01.3`.

**Acceptance checks.**

- For p = 2 a quadratic character has no square root in the group it generates; this is why a field extension is needed.
- Prescribed splitting at V is retained, and ζ is unramified at V.
- F′ = F in the odd-p argument is allowed here; this lemma does not assert that F′/F has the even degree of Definition 7.9. In its uses it is followed by an allowable base change (R22.1/allowable-base-change-existence).
- The global character produced by Lemma 4.1.1 may have order divisible by odd primes; only its 2-primary component is used.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 7.10 and proof, p. 69. Finite-order determinant adjustment, extra splitting and disjointness.
- [`CHT-2008`](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Lemma 4.1.1, p. 116. The character-extension lemma: a finite-order character of the product of the local multiplicative groups at S extends to a continuous idele class character.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-lemma-8-3-weight-two-to-p-plus-one"></a>

### Lemma 8.3: weight two to weight p + 1

**Lemma** · `GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`.

Let D/F″ be definite and unramified at finite places outside Σ, with Σ disjoint from p, U_v = GL₂(𝒪_{F″_v}) above p, and continuous residual ψ trivial on U ∩ (𝔸^∞_{F″})*. If the absolutely irreducible residual representation arises from a non-Eisenstein maximal ideal of the away-p Hecke algebra acting on S_{2,ψ}(U,𝔽), then it arises from one acting on S_{p+1,ψ}(U,𝔽).

**Hypotheses and conventions.**

- This supplies the unused extra case of Theorem 8.2(a); no inertness assumption on p in F″ is made.

**Proof plan.**

1. Order the places above p and successively replace their trivial coefficient factors by tensor products of Sym^(p−1) over the embeddings at that place.
2. At each place use the decomposition of the permutation module 𝔽[ℙ¹(k_v)] and the non-Eisenstein injective degeneracy map of KW Lemma 7.1, imported from R18.3. This is the iterated Edixhoven–Khare §4 Proposition 1 argument stated on pp. 73–74.
3. Iterate the injective maps on localized nonzero spaces to reach parallel weight p + 1.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.6`; `ArithmeticGaloisRepresentations:R01.3`.

**Acceptance checks.**

- For two places above p, perform two coefficient replacements.
- Σ containing a p-adic place fails the hypothesis.
- A characteristic-p weight witness alone is not the integral lifting surjection; Theorem 8.2 separately requests that surjection.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 8.3 and its iterated proof, pp. 73–74. Iterate the group-cohomological weight-raising argument over all places above p.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-theorem-8-2-minimal-modular-lifts"></a>

### Theorem 8.2: minimal modular lifts in all source cases

**Theorem** · `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`.

**Planet:** Minimal modular lifts.

Let ρ̄, F, ψ satisfy §8.1. For p > 2 assume both α and β; for p = 2 assume β and α when k(ρ̄) = 2. Choose π as α in case (a) (β is also allowed when k = 2), β in cases (b)/(c), and α when p = k = 2 or β in the dyadic branch. Let Σ be a subset of the Steinberg places of π; if π is a β witness and k = 2, include its Steinberg places above p. After an allowable F″/F, split above p if p > 2, there is a cuspidal π″ lifting ρ̄_{F″}, unramified outside Σ ∪ {p}, Steinberg above Σ, with central character ψ_{F″}. For p > 2: (a) ψ kind (i), parallel weight k, unramified at p outside Σ; additionally at k = 2 and Σ disjoint from p, weight p + 1 and kind (iii) are possible. (b) ψ kind (ii), k < p + 1, parallel weight 2, U₁(v) invariants above p with associated residue character factoring through norm to 𝔽_p*. (c) k = p + 1, ψ kind (ii), parallel weight 2 and U₀(v) invariants above p. For p = 2 use kind (ii), weight 2, unramified above 2 outside Σ when k = 2, and Steinberg at every place above 2 when k = 4. In the latter branch, for each unramified square root ψ′_v of ψ_v, U_{v′} has eigenvalue ψ′_v(N_{F″_{v′}/F_v}(π_{v′})) after further base change.

**Hypotheses and conventions.**

- The α and β inputs are eigenform witnesses; no theorem of residual modularity is assumed proved at R22.1.
- The three odd-p and the dyadic conclusions are proved simultaneously by KW; retain their distinct hypotheses.
- The extra weight-p+1 branch at residual weight 2, and Lemma 8.3, are not used later in KW II (Remark, p. 71).

**Proof plan.**

1. Choose even-degree allowable extensions split at Σ, at the places above p and at an auxiliary w, in which the p-parts of the residue-field unit groups at the unwanted ramified places are large relative to the isotropy exponent of §7.2. They exist by R22.1/allowable-base-change-existence, prescribing unramified extensions of suitable degree at those places, and the witnesses for (α), (β) follow the base change by R22.1/alpha-beta-under-allowable-base-change.
2. Transfer to the definite quaternion algebra by Jacquet–Langlands. Apply R18.3’s Lemmas 7.3/7.4 to choose nontrivial p-power characters at unwanted places, of order divisible by 4 at p = 2; compare mod-p coefficient modules, obtain a ramified principal-series lift and kill its tame character by further base change.
3. Import KW Lemma 7.7 from R19.5 for the precise behavior above p. Use lemma-8-3-weight-two-to-p-plus-one only for the unused extra branch, with the integral weight-module surjection supplied by R18.3.
4. Use lemma-7-10-determinant-adjustment to arrange central character ψ. At p = 2 and k = 4 use further split field choice to arrange the specified U-eigenvalue.

**Prerequisites.** [`GL2ModularityLifting:R22.1/allowable-base-change`](#r22-1-allowable-base-change); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change); [`GL2ModularityLifting:R22.1/determinant-character-kinds`](#r22-1-determinant-character-kinds); [`GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`](#r22-1-lemma-7-10-determinant-adjustment); [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `HilbertModularVarietiesAndShimuraCurves:R18.6`; `AutomorphicGaloisRepresentations:R19.5`; [`GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`](#r22-1-lemma-8-3-weight-two-to-p-plus-one).

**Acceptance checks.**

- At k = p + 1 use (c), not (b).
- For a β witness with k = 2, Σ must contain its p-adic Steinberg places.
- An arbitrary modular residual representation without α/β witnesses does not satisfy this theorem’s input.
- Kind (iii) and weight p + 1 at k = 2 are recorded but not fed into Theorem 8.4’s crystalline boundary case.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Theorem 8.2, statement p. 71, simultaneous proof pp. 72–73. All odd-p and dyadic cases with fixed central character; the proof uses common quaternionic level lowering.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-prescribed-level-raising-step"></a>

### The quaternionic level-raising step for Theorem 8.4

**Lemma** · `GL2ModularityLifting:R22.1/prescribed-level-raising-step`.

In the tower F₀ ⊂ ⋯ ⊂ F_r used on p. 77 of KW II, at the i-th step take the definite algebra ramified at infinity and the already treated places above v₁,…,v_i, and a non-Eisenstein modular witness with maximal compact level at the next place w_{i+1}. The mod-p kernel of the two degeneracy maps to U₀(w_{i+1}) is Eisenstein. Ribet’s level-raising argument supplies a congruent cuspidal π_i Steinberg at the old and new ramified places; base change to F_{i+1} and Jacquet–Langlands give the next definite-quaternion witness. The conclusion retains residual representation, prescribed central character and p-adic coefficient type.

**Hypotheses and conventions.**

- When w_{i+1} lies above p in type (C) with residual weight 2, the weight is 2, precisely the p-adic hypothesis of KW Lemma 7.1.
- The field tower F = F₀ ⊂ … ⊂ F_r is quadratic at each step: every place of F_{i−1} above v_i splits in F_i, and every place above v_j, j ≠ i, is inert, with the residual image and cyclotomic irreducibility preserved. Each step exists by the quadratic clause (5) of R22.1/allowable-base-change-existence over F_{i−1}, prescribing the trivial extension at the places above v_i and the unramified quadratic extension at the places above the other v_j; F_r need not be Galois over F, and it is allowable in the tower sense of R22.1/allowable-base-change.

**Proof plan.**

1. Apply the R18.3 Ihara-type degeneracy lemma after non-Eisenstein localization; its integral cokernel has no p-torsion at this ideal.
2. Use the R18.3 algebraic level-raising input cited as Kisin Corollary 3.1.11 and Lemma 3.5.3, together with R19.4 local–global compatibility, to obtain Steinberg π_i.
3. Apply R17.4 base change and R17.3 Jacquet–Langlands to transfer to F_{i+1} and retain the central character and local conditions.

**Prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.6`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; [`GL2ModularityLifting:R22.1/allowable-base-change`](#r22-1-allowable-base-change); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence).

**Acceptance checks.**

- A p-adic raising place in weight greater than 2 does not meet this use of Lemma 7.1.
- Field choice and automorphic base change are different inputs.
- The statement requires an actual non-Eisenstein modular witness, not an R = T assertion.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proof of Theorem 8.4, pp. 76–78, induction on p. 77. The single-place level-raising induction, with Ihara, Jacquet–Langlands and local–global compatibility.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-theorem-8-4-prescribed-modular-lifts"></a>

### Theorem 8.4: modular lifts fitting the lifting data

**Theorem** · `GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`.

**Planet:** Modular lifts with prescribed local data.

Assume the residual hypotheses, field F and given ψ of §8.1, and α and β for p > 2 (β and α when k = 2 for p = 2). Fix actual compatible local lifts as in §8.3, with determinant ψχ_p: away from p either unramified or (γ_vχ_p *;0 γ_v), γ_v unramified and γ_v² = ψ_v; at all p-adic places simultaneously type (A), (B) or (C), with the exact KW restrictions. There exists an allowable F′/F and a cuspidal π′, discrete series of parallel weight at infinity, whose Galois representation lifts ρ̄_{F′}, fits the restricted local lifting data, is unramified at the specified unramified places and has determinant ψ_{F′}χ_p. For p > 2: (A) crystalline weight 2 ≤ k ≤ p + 1, with k = p + 1 only when F′ is split at p and k(ρ̄) = p + 1, and π′ unramified above p; (B) weight 2 crystalline over ℚ_p^nr(μ_p), WD inertia (ω_p^(k−2) ⊕ 1,0), U₁ invariants; (C) semistable non-crystalline weight 2 with prescribed γ_v and U₀ invariants. For p = 2 only crystalline weight 2 at residual weight 2, or prescribed semistable non-crystalline weight 2 at residual weight 4; π′ is respectively unramified or Steinberg above 2. Splitting at p may fail in the dyadic weight-4 branch and odd-p type (C) with residual weight 2; otherwise it can be arranged.

**Hypotheses and conventions.**

- The local lifts are inputs, not an assertion that the prescribed global modular lift already exists.
- The determinant alternatives match A to kind (i), B/C to kind (ii); p = 2 uses only kind (ii).

**Proof plan.**

1. Use theorem-8-2-minimal-modular-lifts with cases (a)/(b)/(c) matching A/B/C; its unused extra weight-p+1 branch at residual weight 2 is excluded here.
2. Apply prescribed-level-raising-step successively at the ramified lifting places, using the exact split/inert quadratic tower. Reapply Theorem 8.2 to remove the auxiliary neatness place.
3. Use R19.5 Lemma 7.7 for compatibility at p. Remove the residual unramified quadratic sign discrepancies in the prescribed γ_v by further allowable base change, with the precise split-at-p exceptions retained. Every base change in the proof is supplied by R22.1/allowable-base-change-existence; the quadratic tower uses its clause (5).

**Prerequisites.** [`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`](#r22-1-theorem-8-2-minimal-modular-lifts); [`GL2ModularityLifting:R22.1/prescribed-level-raising-step`](#r22-1-prescribed-level-raising-step); [`GL2ModularityLifting:R22.1/allowable-base-change`](#r22-1-allowable-base-change); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); [`GL2ModularityLifting:R22.1/determinant-character-kinds`](#r22-1-determinant-character-kinds); `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `AutomorphicGaloisRepresentations:R19.5`.

**Acceptance checks.**

- Type B is not arbitrary potentially Barsotti–Tate type.
- Do not promise split at p in the two stated exceptions.
- The p + 1 crystalline case requires both residual weight p + 1 and splitting at p.
- Apply this theorem to construct the π field of minimal-level-data; never ask R20.6 to own this theorem.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8.3, Theorem 8.4 and proof, pp. 74–78. The prescribed modular lift and its determinant, local-type, ramification and splitting qualifications.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/ModularLifts`, namespace `TauCeti.ModularityLifting.KW`.

<a id="r22-1-minimal-level-data"></a>

### Minimal-level data for a modular residual representation

**Definition** · `GL2ModularityLifting:R22.1/minimal-level-data`.

Let ρ̄ : G_F → GL_2(𝔽) satisfy KW II's hypotheses with lifting data and ψ (GlobalGaloisDeformations R04.6/kw-deformation-data), and suppose, after an allowable base change, that F is totally real of even degree with [F : ℚ] + |Σ| even. Minimal-level data consist of: the definite quaternion algebra D/F ramified exactly at Σ and the infinite places; the level U = ∏_v U_v, maximal compact outside S, (𝒪_D)_v^× at v ∈ Σ (D_v^× when p = 2), and at v | p maximal compact or U_1(v) according to type (A) or (B); the weight module W_k (k = 2 if p = 2, with W_2 extended to U(𝔸_F^∞)^× when U is not compact); and a non-Eisenstein maximal ideal 𝔪 ⊂ 𝕋_ψ(U) such that ρ̄_𝔪 ≅ ρ̄ and 𝔪 comes from a cuspidal π that fits the lifting data. The data record a residual modularity witness (actual eigenform data), not an R = T statement.

**Hypotheses and conventions.**

- The spaces S_{k,ψ}(U, 𝒪), the Hecke algebra 𝕋_ψ(U) and non-Eisenstein ideals are HilbertModularVarietiesAndShimuraCurves R18.3, exported by R18.6 (requested).
- The existence of the cuspidal π fitting KW lifting data is theorem-8-4-prescribed-modular-lifts in this packet, conditional on its exact α/β and supplier inputs.
- The roadmap convention: 'a residual modularity witness is actual eigenform/Hecke data.'

**Proof plan.**

1. A definite D ramified exactly at Σ ∪ {∞} exists because [F : ℚ] + |Σ| is even (Hasse's parity condition).
2. π transfers to D^× by Jacquet–Langlands (π is discrete series at Σ), and its Hecke eigenvalues cut out 𝔪.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.MinimalLevelData` | structure | (D, U, W_k, ψ, 𝔪) with ρ̄_𝔪 ≅ ρ̄ and 𝔪 from π fitting the lifting data. |
| `TauCeti.ModularityLifting.MinimalLevelData.heckeAlgebra` | constructor | 𝕋 = 𝕋_ψ(U)_𝔪. |
| `TauCeti.ModularityLifting.MinimalLevelData.heckeModule` | constructor | M = S_{k,ψ}(U, 𝒪)_𝔪. |
| `TauCeti.ModularityLifting.MinimalLevelData.residual_iso` | characterisation | ρ̄_𝔪 ≅ ρ̄. |

**Unit tests.**

- `minimalLevel_p2_noncompact` (example): p = 2: U_v = D_v^× at v ∈ Σ and U is not compact.
- `minimalLevel_residual` (characterisation): The residual representation attached to 𝔪 is ρ̄.
- `minimalLevel_no_RT_field` (non-example): No field of the structure states R̄^ψ_S ≅ 𝕋_ψ(U)_𝔪.

**Prerequisites.** `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `HilbertModularVarietiesAndShimuraCurves:R18.6`; [`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`](#r22-1-theorem-8-4-prescribed-modular-lifts).

**Consumers.**

- [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map): the target algebra.
- [`GL2ModularityLifting:R22.2/auxiliary-level-groups`](#r22-2-auxiliary-level-groups): the level modified at the Taylor–Wiles places.
- [`GL2ModularityLifting:R22.3`](#r22-3): the finite-level module patched.

**Acceptance checks.**

- p = 2: U_v = D_v^× at v ∈ Σ, so U is not compact, and W_2 is extended in one of 2^{|Σ|} ways (KW II §7).
- Gee's setting (p ≥ 5): Σ = ∅ after base change, and U_v = GL_2(𝒪_{F_v}) outside T.
- A datum whose fields assert R ≅ 𝕋 is not minimal-level data: only π and 𝔪 are recorded.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.1.1, pp. 78–79. The data.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, p. 35. Gee's levels.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

<a id="r22-1-hecke-points-local-conditions"></a>

### Hecke eigen-systems satisfy the lifting data at every place of S

**Theorem** · `GL2ModularityLifting:R22.1/hecke-points-local-conditions`.

For every 𝒪-algebra map x : 𝕋_ψ(U)_𝔪 → 𝒪′ (𝒪′ the integers of a finite extension of E), the specialisation ρ_x of ρ_𝔪 has determinant ψχ_p, is unramified outside S, and satisfies the local condition of the lifting data at each v ∈ S. At v ∈ Σ not above p it is semistable of the form (χ_pγ_v ∗; 0 γ_v) with a fixed unramified γ_v (KW II Lemma 7.2). At the infinite places it is odd. At v | p it is of type (A) (crystalline of low weight), (B) (weight two) or (C) (weight-two semistable), according to U_v. This identifies the local deformation problem represented at each place.

**Hypotheses and conventions.**

- ρ_𝔪 over 𝕋_ψ(U)_𝔪, and the compatibility of π ↦ ρ_π with the local Langlands correspondence away from p (Carayol, Taylor) and at p (Kisin, Saito, Skinner; KW II Lemma 7.7 and Corollary 7.8), are requested from AutomorphicGaloisRepresentations R19.6.
- The local conditions and their rings are LocalGaloisDeformationRings R08.6 (requested).

**Proof plan.**

1. 𝒪′-points of 𝕋_ψ(U)_𝔪 correspond to the Hecke eigenforms in S_{k,ψ}(U, 𝒪)_𝔪, hence to cuspidal π with ρ̄_π ≅ ρ̄ (Jacquet–Langlands, R18.3).
2. At v ∈ Σ: π_v is a twist of Steinberg by an unramified character, fixed independently of the eigenform (KW II Lemma 7.2, p = 2 via U_v = D_v^×).
3. At v | p: U_v maximal compact means π_v unramified, so ρ_x|D_v is crystalline of weight k; U_1(v) gives weight two with the tame inertial type; v ∈ Σ above p gives semistable weight two (Corollary 7.8).
4. At ∞: ρ_π is totally odd.

**Prerequisites.** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `AutomorphicGaloisRepresentations:R19.6`; `LocalGaloisDeformationRings:R08.6`; `AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic`.

**Acceptance checks.**

- For type (A) at v | p with k = 2 and π_v unramified, the specialisation is crystalline with Hodge–Tate weights {0, 1}.
- γ_v does not depend on the eigenform, which is what makes a single local ring R̄^{□,ψ}_v work for all points.
- Without local–global compatibility at p, the points would satisfy the condition only on inertia at almost all places, which does not identify the local problem.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.1.1 and the proof of Lemma 9.1, pp. 79–80. The identification at each place.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 7.2, pp. 60–61. The places of Σ.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

<a id="r22-1-deformation-to-hecke-map"></a>

### The deformation-to-Hecke map

**Construction** · `GL2ModularityLifting:R22.1/deformation-to-hecke-map`.

**Planet:** Deformation-to-Hecke map.

There is a unique map of complete local 𝒪-algebras π : R̄^ψ_S → 𝕋_ψ(U)_𝔪 carrying the universal representation ρ̄^univ_S to ρ_𝔪, up to strict equivalence. It is characterised by π(tr ρ̄^univ_S(Frob_v)) = T_v for v ∉ S. Tensoring with the framed ring gives π^□ : R̄^{□,ψ}_S → 𝕋^□_𝔪 := 𝕋_ψ(U)_𝔪 ⊗_{R̄^ψ_S} R̄^{□,ψ}_S.

**Hypotheses and conventions.**

- The factorisation through the local-condition quotient is GlobalGaloisDeformations R04.6/factorization-through-local-conditions, applied to A = 𝕋_ψ(U)_𝔪, which is reduced, 𝒪-flat and finite (R18.3).
- The universal property of R^ψ_S is GlobalGaloisDeformations R04.2.

**Proof plan.**

1. ρ_𝔪 is a lift of ρ̄ with determinant ψχ_p, unramified outside S, so the universal property gives π′ : R^ψ_S → 𝕋_ψ(U)_𝔪.
2. Its points satisfy the local conditions (hecke-points-local-conditions), so π′ factors through R̄^ψ_S (R04.6/factorization-through-local-conditions).
3. Traces: π(tr ρ̄^univ(Frob_v)) = tr ρ_𝔪(Frob_v) = T_v, by the Eichler–Shimura relation.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.defToHecke` | constructor | π : R̄^ψ_S →ₐ[𝒪] 𝕋_ψ(U)_𝔪. |
| `TauCeti.ModularityLifting.defToHecke_trace` | characterisation | π(tr ρ̄^univ(Frob_v)) = T_v for v ∉ S. |
| `TauCeti.ModularityLifting.defToHecke_unique` | universal-property | Unique with π ∘ ρ̄^univ ≅ ρ_𝔪. |
| `TauCeti.ModularityLifting.defToHeckeFramed` | constructor | π^□ : R̄^{□,ψ}_S → 𝕋^□_𝔪. |

**Unit tests.**

- `defToHecke_trace_Frob` (characterisation): Traces of Frobenius map to T_v.
- `defToHecke_point` (example): Composing with the point of π gives the lift ρ_π.
- `defToHecke_not_injective_claim` (non-example): No injectivity is part of the construction.

**Prerequisites.** [`GL2ModularityLifting:R22.1/hecke-points-local-conditions`](#r22-1-hecke-points-local-conditions); `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; `GlobalGaloisDeformations:R04.2/universal-deformation-ring`; `AutomorphicGaloisRepresentations:R19.6`; `AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic`.

**Consumers.**

- [`GL2ModularityLifting:R22.1/deformation-to-hecke-surjective`](#r22-1-deformation-to-hecke-surjective): surjectivity.
- [`GL2ModularityLifting:R22.3`](#r22-3): the map whose kernel patching controls.
- `DeformationAndDerivedPatchingAlgebra:R03.6`: R = T conclusions for R → T with a faithful module.

**Acceptance checks.**

- Composing with an 𝒪′-point x of 𝕋 gives the point of R̄^ψ_S classifying ρ_x.
- The map is not asserted injective: R = T is the conclusion of R22.3 and R22.4.
- Without the local-condition factorisation one only gets R^ψ_S → 𝕋, whose kernel need not contain the local-condition ideal.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.1, p. 80. The map.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, p. 35. Gee's version.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

<a id="r22-1-deformation-to-hecke-surjective"></a>

### Surjectivity of the deformation-to-Hecke map

**Theorem** · `GL2ModularityLifting:R22.1/deformation-to-hecke-surjective`.

**Planet:** Surjectivity from Frobenius traces.

π : R̄^ψ_S → 𝕋_ψ(U)_𝔪 and π^□ : R̄^{□,ψ}_S → 𝕋^□_𝔪 are surjective.

**Hypotheses and conventions.**

- 𝕋_ψ(U) is generated over 𝒪 by T_v and S_v for v ∉ S, and S_v acts by the scalar ψ(π_v) ∈ 𝒪^× (R18.3).

**Proof plan.**

1. The image of π contains T_v = π(tr ρ̄^univ(Frob_v)) for all v ∉ S, and 𝒪.
2. 𝕋_ψ(U)_𝔪 is finite over 𝒪 and the image of a complete local ring is closed, so the image is all of 𝕋_ψ(U)_𝔪.
3. π^□ is the base change of π along the flat map R̄^ψ_S → R̄^{□,ψ}_S, so it is surjective as well.

**Prerequisites.** [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map).

**Acceptance checks.**

- Gee's form: surjective 'because local-global compatibility shows that the Hecke operators generating T∅ are in the image'.
- At Taylor–Wiles level the same argument gives R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪 (auxiliary-hecke-algebra).
- If 𝕋 included U_v at a place of S outside the image of the traces, surjectivity could fail; KW II's 𝕋_ψ(U) uses only v ∉ S.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), proof of Lemma 9.1, p. 81. The argument.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

<a id="r22-1-framed-hecke-module"></a>

### The framed Hecke algebra and module

**Construction** · `GL2ModularityLifting:R22.1/framed-hecke-module`.

𝕋^□_𝔪 = 𝕋_ψ(U)_𝔪 ⊗_{R̄^ψ_S} R̄^{□,ψ}_S is a power series ring over 𝕋_ψ(U)_𝔪 in 4|S| − 1 variables, 𝒪-flat and reduced. The module M^□ := S_{k,ψ}(U, 𝒪)_𝔪 ⊗_{R̄^ψ_S} R̄^{□,ψ}_S is a faithful 𝕋^□_𝔪-module, finite free over 𝒪⟦y_{h+1}, …, y_{h+j}⟧ (j = 4|S| − 1, the framing variables). These are the ring and module patched in R22.3.

**Hypotheses and conventions.**

- R̄^{□,ψ}_S ≅ R̄^ψ_S⟦4|S| − 1⟧ is GlobalGaloisDeformations R04.6/trace-subring-universal-representation.

**Proof plan.**

1. Base change of a power series presentation: 𝕋 ⊗_{R̄} R̄⟦y⟧ ≅ 𝕋⟦y⟧, which is 𝒪-flat and reduced when 𝕋 is.
2. Faithfulness passes along the faithfully flat extension 𝕋 → 𝕋⟦y⟧, and freeness over 𝒪⟦y⟧ holds because S_{k,ψ}(U, 𝒪)_𝔪 is 𝒪-free.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.framedHecke` | constructor | 𝕋^□_𝔪 = 𝕋 ⊗_{R̄^ψ_S} R̄^{□,ψ}_S. |
| `TauCeti.ModularityLifting.framedHeckeModule` | constructor | M^□ = S(U)_𝔪 ⊗ R̄^{□,ψ}_S. |
| `TauCeti.ModularityLifting.framedHecke_isReduced` | characterisation | 𝕋^□_𝔪 is reduced and 𝒪-flat. |
| `TauCeti.ModularityLifting.framedHeckeModule_faithful` | characterisation | M^□ is faithful over 𝕋^□_𝔪. |

**Unit tests.**

- `framedHecke_vars` (example): |S| = 1 gives 𝕋⟦y_1, y_2, y_3⟧.
- `framedHeckeModule_quot` (characterisation): Killing the framing variables recovers S(U)_𝔪.
- `framedHecke_not_finite` (non-example): 𝕋^□_𝔪 is not finite over 𝒪.

**Prerequisites.** [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map); `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`; `mathlib:IsReduced`; `mathlib:Module.Free`.

**Consumers.**

- [`GL2ModularityLifting:R22.3`](#r22-3): the module M and ring R of KW II's patching data.
- [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system): the level-Q analogue.

**Acceptance checks.**

- |S| = 1: three framing variables.
- M^□/(y_{h+1}, …, y_{h+j}) = S_{k,ψ}(U, 𝒪)_𝔪.
- 𝕋^□_𝔪 is not finite over 𝒪: the framing variables are free.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.1 and §9.1.1, p. 80. The framed Hecke algebra.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2"></a>

## R22.2. Auxiliary levels and freeness

Modify the actual minimal levels at the R04.5 Taylor–Wiles primes and choose the relevant Hecke roots. The diamond action must coincide with the Galois action. Apply the R18.3 freeness input under its exact isotropy hypotheses, then prove the Galois-dependent coinvariant control and form the compatible finite-level module system. Dyadic twists must preserve the required character and level contracts.

<a id="r22-2-auxiliary-level-groups"></a>

### Auxiliary levels at Taylor–Wiles places

**Definition** · `GL2ModularityLifting:R22.2/auxiliary-level-groups`.

Let Q be a Taylor–Wiles datum (GlobalGaloisDeformations R04.5), disjoint from S. Let N be the least common multiple of the exponents of the Sylow p-subgroups of the finite isotropy groups (U(𝔸_F^∞)^× ∩ t^{−1}D^×t)/F^× over t ∈ (D ⊗ 𝔸_F^∞)^×. For v ∈ Q let Δ′_v be the maximal p-quotient of k(v)^× and Δ_v := Δ′_v/(N-torsion). Put (U^0_Q)_v = U_0(v) and (U_Q)_v = {(a b; c d) ∈ U_0(v) : ad^{−1} ↦ 1 ∈ Δ_v}, with U_Q, U^0_Q equal to U outside Q. Then U^0_Q/U_Q ≅ Δ_Q := ∏_{v∈Q}Δ_v, and characters of Δ_Q are N-th powers of characters of Δ′_Q.

**Hypotheses and conventions.**

- The finiteness of the isotropy groups and the bound on the exponent of their Sylow p-subgroups are KW II §7.2 (R18.3, via R18.6). For p ≥ 5 unramified in F they have order prime to p (Gee §5.3), so N is prime to p and Δ_v = Δ′_v.
- Quotienting by the N-torsion is what makes characters of Δ_Q kill the isotropy groups; the congruence N(v) ≡ 1 mod p^n alone does not.

**Proof plan.**

1. U_Q is normal in U^0_Q, and a ↦ ad^{−1} induces U^0_Q/U_Q ≅ ∏_v Δ_v.
2. Every character of Δ_v, viewed on Δ′_v, kills the N-torsion, so it is an N-th power.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.auxLevel` | constructor | U_Q ⊆ U^0_Q ⊆ U for a Taylor–Wiles datum Q. |
| `TauCeti.ModularityLifting.auxDelta` | constructor | Δ_Q = ∏_v Δ′_v/(N-torsion). |
| `TauCeti.ModularityLifting.auxLevel_quotient` | equivalence | U^0_Q/U_Q ≃ Δ_Q. |
| `TauCeti.ModularityLifting.auxDelta_char_pow` | characterisation | Characters of Δ_Q are N-th powers on Δ′_Q. |

**Unit tests.**

- `auxLevel_empty` (example): Q = ∅ gives U.
- `auxLevel_quotient` (characterisation): U^0_Q/U_Q ≅ Δ_Q.
- `auxDelta_needs_quotient` (non-example): With Δ′_v in place of Δ_v, characters need not kill p-torsion isotropy.

**Prerequisites.** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `GlobalGaloisDeformations:R04.5/taylor-wiles-datum`; `HilbertModularVarietiesAndShimuraCurves:R18.6`.

**Consumers.**

- [`GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`](#r22-2-delta-freeness-at-taylor-wiles-level): the group over which S(U_Q) is free.
- [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra): the diamond operators ⟨h⟩, h ∈ Δ_Q.

**Acceptance checks.**

- Q = ∅: U_Q = U^0_Q = U and Δ_∅ = 1.
- For p ≥ 5 unramified (Gee), N is prime to p and Δ_v is the full p-part of k(v)^×.
- Using Δ′_v when the isotropy groups have p-torsion (possible for p = 2, 3) breaks the freeness of Lemma 7.4: a character of Δ′_v need not kill the isotropy.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4, p. 63. The definition of Δ_v and U_Q.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, p. 35. Gee's U_Q with Δ_v the full p-part.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2-auxiliary-hecke-algebra"></a>

### Hecke algebras at Taylor–Wiles level and the map from deformations

**Construction** · `GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`.

𝕋_{ψ,Q}(U_Q) is generated over 𝒪 by T_v, S_v (v ∉ S ∪ Q), U_v = [U_Q(π_v 0; 0 1)U_Q] (v ∈ Q) and the diamond operators ⟨h⟩ (h ∈ Δ_Q). By Hensel, X² − T_vX + N(v)ψ(π_v) = (X − A_v)(X − B_v) in 𝕋_ψ(U)_𝔪 with A_v ≡ α_v and B_v ≡ β_v, and 𝔪 pulls back to 𝔪_Q ∋ U_v − α̃_v for v ∈ Q. There is a surjection R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪, with tr ρ^univ(Frob_v) ↦ T_v and γ_{α_v}(π_v) ↦ U_v, compatible with the 𝒪[Δ′_Q]-structures and, for p = 2, with the twisting actions. The natural map 𝕋_ψ(U_Q)_𝔪 → 𝕋_{ψ,Q}(U_Q)_𝔪 is bijective.

**Hypotheses and conventions.**

- U_v depends on the uniformiser π_v; so does γ_{α_v}(π_v) on the deformation side.
- The residual choice α_v, not its arbitrary representative α̃_v, determines the maximal ideal. Replacing α̃_v by another lift changes U_v − α̃_v by an element of the coefficient maximal ideal and leaves the ideal unchanged; swapping distinct α_v and β_v selects the other ideal.

**Proof plan.**

1. The local Hecke algebra must be complete for its maximal ideal. Apply IsAdicComplete.henselianRing and HenselianRing's simple-root lifting to the monic Hecke polynomial: modulo the maximal ideal its derivative at α_v is α_v − β_v, a unit since the roots are distinct. Polynomial.Splits alone does not provide this argument.
2. The map exists and is surjective as in deformation-to-hecke-surjective, with the local–global compatibility at v ∈ Q sending γ_{α_v}(π_v) to U_v (KW II proof of Lemma 9.1).
3. Bijectivity of 𝕋_ψ(U_Q)_𝔪 → 𝕋_{ψ,Q}(U_Q)_𝔪: the traces of ρ over 𝕋_{ψ,Q}(U_Q)_𝔪 lie in the image of 𝕋_ψ(U_Q), so ρ is defined over it (Carayol; KW II Remark after Lemma 9.1).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.auxHecke` | constructor | 𝕋_{ψ,Q}(U_Q) with T_v, S_v, U_v, ⟨h⟩. |
| `TauCeti.ModularityLifting.auxMaxIdeal` | constructor | 𝔪_Q from 𝔪 and the chosen α̃_v. |
| `TauCeti.ModularityLifting.defToAuxHecke` | constructor | R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪. |
| `TauCeti.ModularityLifting.defToAuxHecke_Uv` | characterisation | γ_{α_v}(π_v) ↦ U_v. |
| `TauCeti.ModularityLifting.auxMaxIdeal_lift_independent` | compatibility | Two representatives of the same residual α_v define the same maximal ideal 𝔪_Q. |

**Unit tests.**

- `auxHecke_empty` (example): Q = ∅ gives 𝕋_ψ(U).
- `hensel_split` (characterisation): X² − T_vX + N(v)ψ(π_v) splits with roots lifting α_v, β_v.
- `auxMaxIdeal_needs_distinct` (non-example): For a double residual root the derivative vanishes, so the simple-root hypotheses used to distinguish and lift the two roots are not satisfied.
- `auxMaxIdeal_lift_independent` (compatibility): Changing each α̃_v by an element of the coefficient maximal ideal leaves 𝔪_Q unchanged.

**Prerequisites.** [`GL2ModularityLifting:R22.2/auxiliary-level-groups`](#r22-2-auxiliary-level-groups); [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map); `GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action`; `mathlib:Polynomial.Splits`; `AutomorphicGaloisRepresentations:R19.6`; `mathlib:HenselianRing`; `AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic`.

**Consumers.**

- [`GL2ModularityLifting:R22.2/delta-actions-agree`](#r22-2-delta-actions-agree): the two Δ_Q-actions.
- [`GL2ModularityLifting:R22.3`](#r22-3): the maps patched.

**Acceptance checks.**

- Q = ∅ recovers 𝕋_ψ(U)_𝔪 and deformation-to-hecke-map.
- U_v ↦ A_v under the map to level U (delta-freeness-at-taylor-wiles-level), not U_v ↦ B_v.
- With equal residual eigenvalues the simple-root Hensel argument and separation into two residual eigenlines fail; this does not assert that a maximal ideal cannot exist.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4 before Corollary 7.5, p. 65; §9.1.1, p. 80. The maximal ideal at level U_Q.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Remark after Lemma 9.1, p. 81. Surjectivity at level Q.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2-delta-actions-agree"></a>

### The diamond and Galois actions of Δ_Q agree

**Theorem** · `GL2ModularityLifting:R22.2/delta-actions-agree`.

On S_Q := S_{k,ψ}(U_Q, 𝒪)_{𝔪_Q} the two actions of Δ_Q agree: the diamond action h ↦ ⟨h⟩ = (h̃ 0; 0 1), and the action through Δ_Q → (R̄^ψ_{S∪Q})^× → 𝕋_{ψ,Q}(U_Q)_𝔪 given by ∏_v γ_{α_v} (the character χ_α ∘ Art). Equivalently, ⟨h⟩ acts on the U_v-eigenline whose actual characteristic-zero eigenvalue reduces to α_v through the character of π_v lifting α_v.

**Hypotheses and conventions.**

- The needed local–global compatibility at v ∈ Q (π_v ≅ χ₁ × χ₂ tamely ramified principal series, with eigenvalues of ρ_π(Frob_v) equal to #k(v)^{1/2}χ_i(ϖ_v)) is AutomorphicGaloisRepresentations R19.6.
- The lift α̃_v defining 𝔪_Q is arbitrary and is not asserted to equal the actual U_v-eigenvalue (KW II p. 65; Gee Proposition 5.8, p. 36).

**Proof plan.**

1. A point θ of 𝕋_Q gives π with π_v^{U_{Q,v}} ≠ 0, so π_v is a subquotient of χ₁ × χ₂ with χ_i tamely ramified.
2. (χ₁ × χ₂)^{U_{Q,v}} = ℂφ₁ ⊕ ℂφ_w, with U_ϖ φ_w = #k(v)^{1/2}χ₂(ϖ)φ_w and U_ϖ φ₁ = #k(v)^{1/2}χ₁(ϖ)φ₁ + Xφ_w.
3. αv ≠ βv forces χ₁/χ₂ ≠ |·|^{±1}, so π_v = χ₁ × χ₂ is irreducible and one may take χ₂(ϖ) ↔ α_v. The U_v-eigenline with eigenvalue #k(v)^{1/2}χ₂(π_v) reducing to α_v is ℂφ_w, on which (δ 0; 0 1) acts by χ₂(δ) = χ_α ∘ Art (Gee Proposition 5.8(1)).

**Prerequisites.** [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra); `GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action`; `AutomorphicGaloisRepresentations:R19.6`.

**Acceptance checks.**

- Q = ∅: nothing to check.
- If one used the β_v-eigenvalue, the diamond action would match γ_{β_v} = γ_{α_v}^{−1} on inertia instead.
- The agreement is what lets the patched Hecke module be a module over the patched deformation ring compatibly with 𝒪⟦y_1, …, y_h⟧.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), Proposition 5.8(1) and its proof, p. 36. The statement and the principal-series computation.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.1 (compatibility with 𝒪[Δ′_{Q_n}]), p. 80. KW II's form.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2-delta-freeness-at-taylor-wiles-level"></a>

### Freeness over 𝒪[Δ_Q] and control back to level U

**Theorem** · `GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`.

**Planet:** Freeness over Δ_Q.

S_{k,ψ}(U_Q, 𝒪)_𝔪 is a free 𝒪[Δ_Q]-module, whose rank is the 𝒪-rank of S_{k,ψ}(U, 𝒪)_𝔪. Its Δ_Q-coinvariants are isomorphic to S_{k,ψ}(U, 𝒪)_𝔪, compatibly with 𝕋_{ψ,Q}(U_Q)_𝔪 → 𝕋_ψ(U)_𝔪, T_v ↦ T_v (v ∉ S ∪ Q), ⟨h⟩ ↦ 1, U_v ↦ A_v.

**Hypotheses and conventions.**

- Import R18.3’s Lemmas 7.1/7.4 and the Galois-free localized freeness of Corollary 7.5 through R18.6. This node applies them at the actual R04.5 Taylor–Wiles primes and proves the Galois-dependent rank/coinvariant control.
- The congruence N(v) ≡ 1 mod p^n alone does not give freeness: the isotropy hypothesis of auxiliary-level-groups is used.

**Proof plan.**

1. Verify the §7.2 isotropy exponent and chosen distinct roots at the R04.5 auxiliary primes, then apply the R18.3 exported localized freeness theorem. Do not reconstruct the full-space or localized freeness proof here.
2. The maps ξ_v(f) = A_v f − (1 0; 0 π_v)f give S(U)_𝔪 → S(U^0_Q)_𝔪. This is an isomorphism after inverting p, because no π that is Steinberg (up to twist) at v ∈ Q gives ρ̄ (N(v) ≡ 1 mod p, with distinct Frobenius eigenvalues; local–global compatibility). It is injective mod λ because the degeneracy maps have Eisenstein kernel (Lemma 7.1). So it is an isomorphism, which gives the coinvariants (Corollary 7.5).

**Prerequisites.** [`GL2ModularityLifting:R22.2/auxiliary-level-groups`](#r22-2-auxiliary-level-groups); [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra); `HilbertModularVarietiesAndShimuraCurves:R18.6`; `AutomorphicGaloisRepresentations:R19.6`; `mathlib:Module.Free`; `mathlib:MonoidAlgebra`.

**Acceptance checks.**

- Q = ∅: the statement is the tautology S(U)_𝔪 = S(U)_𝔪.
- The rank over 𝒪[Δ_Q] does not depend on Q or n, which is what patching needs.
- Gee Proposition 5.9 is the same control statement, ∏_{v∈Q}(U_ϖ_v − B_v) : S_∅ ≅ S(U_{Q,0}, 𝒪)_{𝔪_Q}, with the other eigenvalue B_v.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Corollary 7.5 and its proof, pp. 65–66. The statement and proof.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), Proposition 5.8(2) and Proposition 5.9, pp. 36–37. Gee's form.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2-taylor-wiles-module-system"></a>

### The system of Hecke modules at Taylor–Wiles levels

**Construction** · `GL2ModularityLifting:R22.2/taylor-wiles-module-system`.

**Planet:** Taylor–Wiles module system.

For the Taylor–Wiles data Q_n of GlobalGaloisDeformations R04.6/taylor-wiles-deformation-system, M_n := S_{k,ψ}(U_{Q_n}, 𝒪)_𝔪 ⊗_{R̄^ψ_{S∪Q_n}} R̄^{□,ψ}_{S∪Q_n} is an 𝒪[Δ_{Q_n}]⟦y_{h+1}, …, y_{h+j}⟧-module. It is finite free, of rank equal to the 𝒪-rank s of S_{k,ψ}(U, 𝒪)_𝔪, independent of n. Its (Δ_{Q_n}, y)-coinvariants are S_{k,ψ}(U, 𝒪)_𝔪, and the R̄^{□,ψ}_{S∪Q_n}-action is compatible with R04.6's 𝒪⟦y_1, …, y_{h+j}⟧-structure. This is the finite-level module input to arithmetic patching.

**Hypotheses and conventions.**

- The patching of the system (M_∞, R_∞) is R22.3, with DeformationAndDerivedPatchingAlgebra R03.5 and R03.6.

**Proof plan.**

1. Freeness over 𝒪[Δ_{Q_n}] with the right rank and coinvariants is delta-freeness-at-taylor-wiles-level; tensoring with the framing variables keeps it free.
2. Compatibility of the two 𝒪[Δ]-actions is delta-actions-agree; the y-structure on the ring side is R04.6.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.twModule` | constructor | M_n = S(U_{Q_n})_𝔪 ⊗ R̄^{□,ψ}_{S∪Q_n}. |
| `TauCeti.ModularityLifting.twModule_free` | characterisation | Finite free over 𝒪[Δ_{Q_n}]⟦y⟧ of rank s. |
| `TauCeti.ModularityLifting.twModule_coinv` | compatibility | Coinvariants ≅ S(U)_𝔪. |

**Unit tests.**

- `twModule_empty` (example): Q = ∅ gives the framed module at level U.
- `twModule_rank_const` (characterisation): The rank does not depend on n.
- `twModule_not_free_without_isotropy` (non-example): With Δ′ instead of Δ and p-torsion isotropy, freeness can fail.

**Prerequisites.** [`GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`](#r22-2-delta-freeness-at-taylor-wiles-level); [`GL2ModularityLifting:R22.2/delta-actions-agree`](#r22-2-delta-actions-agree); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); `GlobalGaloisDeformations:R04.6/taylor-wiles-deformation-system`.

**Consumers.**

- [`GL2ModularityLifting:R22.3`](#r22-3): the modules patched into M_∞.

**Acceptance checks.**

- Q_n = ∅: the system is the framed module of framed-hecke-module.
- The annihilator 𝔟_n of M_n in 𝒪⟦y⟧ lies in ((1 + y_i)^{p^{n−a}} − 1)_{i≤h} (KW II §9.1.3, with 2^a > N for p = 2).
- Without freeness over 𝒪[Δ], the patched module would not be finite free over 𝒪⟦y⟧, and the depth argument of R22.3 fails.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), proof of Proposition 9.2, p. 82. The system.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-2-dyadic-twists-of-forms"></a>

### Compatibility of the dyadic twists with Galois deformation data

**Construction** · `GL2ModularityLifting:R22.2/dyadic-twists-of-forms`.

Let p = 2, n with 2^n > N, and χ : G_{n,2} = Gal(F^S_{Q_n}/F)/2 → 𝒪^× a character of order 2, viewed also on (𝔸_F^∞)^× and on Δ_{Q_n}. Then f ↦ f_χ(g) := f(g)χ(Nm g) preserves S_{2,ψ}(U_{Q_n}, 𝒪). It satisfies f_χ|T_v = χ(π_v)(f|T_v)_χ (v ∉ Q), f_χ|U_v = χ(π_v)(f|U_v)_χ (v ∈ Q) and (f|⟨h⟩)_χ = χ^{−1}(h)f_χ|⟨h⟩. So Hom(G_{n,2}, 𝒪^×) acts on 𝕋_{ψ,Q_n}(U_{Q_n})_𝔪 (T_v ↦ χ(π_v)T_v, U_v ↦ χ(π_v)U_v, h ↦ χ(h)h, S_v fixed) and on S_{2,ψ}(U_{Q_n}, 𝒪)_𝔪, compatibly with the twisting action on R̄^ψ_{S∪Q_n} (GlobalGaloisDeformations R04.4/twisting-action, KW II Lemma 5.12). With the choice U_v = D_v^× at v ∈ Σ and the extended W_2 (the p = 2 modifications of minimal-level-data), these are the Hecke-side inputs to 2-adic patching (R22.6).

**Hypotheses and conventions.**

- The twist f ↦ f_χ and Proposition 7.6 on quaternionic forms are R18.3's 'actual dyadic twisting input' (RS-23), requested through R18.6. This node is the compatibility with the deformation side used in KW II §9.
- χ is split at the infinite places, so it defines a character of (𝔸_F^∞)^×.

**Proof plan.**

1. Apply R18.3’s exported order-two idele-character twist and Hecke formulas (Proposition 7.6), after identifying the R04.5 class-field-theory characters with the finite-idelic characters trivial at infinity and unramified outside Q. Their invariance/formula proof stays with R18.3.
2. Since χ ≡ 1 mod 𝔪, the action preserves 𝔪. Compatibility with the R-side twists holds because both sides multiply Frobenius traces by χ(π_v) and act on Δ by χ (Lemma 5.12).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.twistForm` | constructor | f ↦ f_χ on S_{2,ψ}(U_{Q_n}, 𝒪). |
| `TauCeti.ModularityLifting.twistForm_Tv` | compatibility | f_χ\|T_v = χ(π_v)(f\|T_v)_χ. |
| `TauCeti.ModularityLifting.twistForm_diamond` | compatibility | (f\|⟨h⟩)_χ = χ^{−1}(h)f_χ\|⟨h⟩. |
| `TauCeti.ModularityLifting.twistAction_compat` | compatibility | Compatible with the twisting action on R̄^ψ_{S∪Q_n}. |

**Unit tests.**

- `twistForm_one` (example): The trivial character acts trivially.
- `twistForm_diamond` (characterisation): The diamond operators are twisted by χ^{−1}.
- `twistForm_p_odd` (non-example): For p odd there is no residually trivial character of order 2.

**Prerequisites.** [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra); `GlobalGaloisDeformations:R04.4/twisting-action`; `GlobalGaloisDeformations:R04.5/taylor-wiles-inertia-action`; `GlobalGaloisDeformations:R04.6/dyadic-patching-data`; `HilbertModularVarietiesAndShimuraCurves:R18.6`.

**Consumers.**

- [`GL2ModularityLifting:R22.6`](#r22-6): 2-adic patching with the torus action.

**Acceptance checks.**

- χ trivial: the identity action.
- (f|⟨h⟩)_χ = χ^{−1}(h)f_χ|⟨h⟩: the diamond operators are twisted by χ^{−1}, matching a_χ ∘ δ = χ(δ)(δ ∘ a_χ).
- For p odd, order-2 characters are not residually trivial, so there is no such action on the localisation.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.5, Proposition 7.6 and the following paragraph, pp. 66–67. The twist and its Hecke compatibility.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), proof of Lemma 9.1, p. 81. Compatibility with the deformation side.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`, namespace `TauCeti.ModularityLifting`.

<a id="r22-3"></a>

## R22.3. Arithmetic patching

Arithmetic patching applies the R03 algebra to the concrete R22.2 module system. Record finite-level maps, uniform bounds, framing and presentations before taking the limit. The depth and dimension calculation proves the specified support conclusion, which yields finiteness and generic-fibre R = T. The missing constants and presentation leaves remain obligations, rather than implicit consequences of naming a patched module.

<a id="r22-3-arithmetic-patching-data"></a>

### Patching data of level m from the Taylor–Wiles systems

**Construction** · `GL2ModularityLifting:R22.3/arithmetic-patching-data`.

Let p > 2, B = R̄^{□,loc,ψ}_S, and let (R_n = R̄^{□,ψ}_{S∪Q_n}, M_n) be the deformation and module systems of GlobalGaloisDeformations R04.6/taylor-wiles-deformation-system and taylor-wiles-module-system (R22.2), over 𝒪⟦y_1, …, y_{h+j}⟧. For m ≥ 1 put c_m = (π^m, (1 + y_i)^{p^m} − 1 (i ≤ h), y_{h+i}^{p^m} (i ≤ j)). A patching datum of level m is (D_m, L_m): a quotient D_m of B⟦x_1, …, x_{h+j−d}⟧ of bounded length, finite over 𝒪⟦y⟧/c_m, with D_m/(y_1, …, y_h) ≅ R̄^{□,ψ}_S/(c_m + 𝔪^{(r_m)}), together with a D_m-module L_m finite free over 𝒪⟦y⟧/c_m of rank s = rank_𝒪 S_{k,ψ}(U, 𝒪)_𝔪, and L_m/(y_1, …, y_h) ≅ M^□/c_m. The level-n data (R_{n+a}/(c_m + 𝔪^{(r_m)}), M_{n+a}/c_m) are patching data of level m for n ≥ m, and there are only finitely many isomorphism classes at each level.

**Hypotheses and conventions.**

- The abstract construction (inverse limits along a diagonal subsequence, finite generation and the power-series action) is DeformationAndDerivedPatchingAlgebra R03.5 (requested). This node verifies its hypotheses for the actual systems: presentations, the annihilator bound 𝔟_n ⊆ ((1 + y_i)^{p^{n}} − 1) and the specialisation.
- For p = 2 the data also carry a torus action (KW II §9.1.3); that is R22.6.
- The constants r_m, r′_m, the power-generated ideal 𝔪^{(r_m)}, the shift a, and transition maps must be specified from Kisin (3.3.1) and KW II §9.1.3; the declaration-level specification is recorded as a gap.

**Proof plan.**

1. The ring side is an algebra over 𝒪[Δ′_{Q_n}], but the free module uses the quotient Δ_{Q_n} after killing bounded isotropy. Choose a fixed a with p^a greater than the stabiliser exponent N; the annihilator 𝔟_n is contained in ((1+y_i)^{p^{n−a}}−1) for n>a. Apply the construction to index n+a, so that m≤n implies 𝔟_{n+a}⊆c_m and M_{n+a}/c_m is finite free over 𝒪⟦y⟧/c_m. Do not replace Δ by Δ′ or use p^n divisibility for Δ without the shift.
2. Finiteness of isomorphism classes: B⟦x⟧^{[r′_m]} is finite, and so is the set of such (D_m, L_m).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.PatchingDatum` | structure | (D_m, L_m) of level m. |
| `TauCeti.ModularityLifting.PatchingDatum.ofLevel` | constructor | The datum of level m obtained from (R_{n+a}, M_{n+a}). |
| `TauCeti.ModularityLifting.PatchingDatum.finite_iso_classes` | characterisation | Finitely many isomorphism classes at each level. |

**Unit tests.**

- `patchingDatum_h_zero` (example): For h = 0, choosing Q_n empty and fixed framings makes the chosen finite-level system constant.
- `patchingDatum_rank` (characterisation): L_m has rank s over 𝒪⟦y⟧/c_m.
- `patchingDatum_needs_bound` (non-example): If the annihilator bound is omitted, freeness modulo c_m is not guaranteed; no converse claiming nonfreeness for every such system is asserted.

**Prerequisites.** [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system); `GlobalGaloisDeformations:R04.6/taylor-wiles-deformation-system`; `GlobalGaloisDeformations:R04.6/patching-numerology`; `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Consumers.**

- [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module): the inverse limit over a diagonal subsequence.
- [`GL2ModularityLifting:R22.6`](#r22-6): the p = 2 version with the torus action.

**Acceptance checks.**

- For h = 0, choosing Q_n empty and fixed framings makes the chosen finite-level system constant.
- The rank s of L_m over 𝒪⟦y⟧/c_m does not depend on m or n.
- Without the bound 𝔟_n ⊆ ((1 + y_i)^{p^n} − 1), L_m would not be free over 𝒪⟦y⟧/c_m.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), proof of Proposition 9.2 (I), pp. 81–83; the level-m data in the proof of Proposition 9.3, pp. 84–86. The patching data.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, pp. 39–40. Gee's version with c_N and d_N.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Patching`, namespace `TauCeti.ModularityLifting`.

<a id="r22-3-patched-ring-and-module"></a>

### The patched ring and module

**Theorem** · `GL2ModularityLifting:R22.3/patched-ring-and-module`.

**Planet:** Patched ring and module.

There are surjections of B-algebras B⟦x_1, …, x_{h+j−d}⟧ ↠ R_∞ ↠ R̄^{□,ψ}_S, with R_∞ an 𝒪⟦y_1, …, y_{h+j}⟧-algebra and R_∞/(y_1, …, y_h) ≅ R̄^{□,ψ}_S. There is an R_∞-module M_∞, finite free over 𝒪⟦y_1, …, y_{h+j}⟧, with M_∞/(y_1, …, y_h) ≅ M^□ (R22.1/framed-hecke-module) as modules over the specialised deformation ring, with M^□ faithful over 𝕋^□_𝔪, and with R_∞ → End(M_∞) compatible with 𝒪⟦y⟧. Moreover R_∞/(y_1, …, y_{h+j}) ≅ R̄^ψ_S.

**Hypotheses and conventions.**

- The inverse-limit construction is R03.5 (requested), applied to arithmetic-patching-data.

**Proof plan.**

1. Take a subsequence along which the level-m data stabilise, and pass to the limit: R_∞ = lim D_m, M_∞ = lim L_m (R03.5).
2. The specialisations hold at each level, hence in the limit: killing y_1, …, y_h recovers level U, and the framing variables give R̄^ψ_S.

**Prerequisites.** [`GL2ModularityLifting:R22.3/arithmetic-patching-data`](#r22-3-arithmetic-patching-data); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Acceptance checks.**

- With h = 0, R_∞ = R̄^{□,ψ}_S and M_∞ = M^□.
- M_∞/(y_1, …, y_{h+j}) ≅ S_{k,ψ}(U, 𝒪)_𝔪.
- Integral and inverted-π assertions are kept separate: M_∞ is free over 𝒪⟦y⟧ integrally.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition 9.2 (I), p. 81. The statement.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, p. 40. Gee's diagram.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Patching`, namespace `TauCeti.ModularityLifting`.

<a id="r22-3-patched-support"></a>

### Support of the patched module

**Theorem** · `GL2ModularityLifting:R22.3/patched-support`.

**Planet:** Support of the patched module.

dim R_∞ ≤ 1 + h + j and depth_{R_∞}(M_∞) ≥ 1 + h + j, so every minimal prime of Supp_{R_∞}(M_∞) is a minimal prime of R_∞ of maximal dimension. Supp M_∞ is a union of irreducible components of Spec R_∞. If B is a domain (KW II: semistable conditions at the finite places of S not above p), then B⟦x⟧ → R_∞ → End(M_∞) is injective, R_∞ ≅ B⟦x_1, …, x_{h+j−d}⟧, and Supp M_∞ = Spec R_∞.

**Hypotheses and conventions.**

- The dimension count is GlobalGaloisDeformations R04.6/patching-numerology; the depth-to-support implication is DeformationAndDerivedPatchingAlgebra R03.6 (maximal-cm-support-top-components, maximal-cm-nearly-faithful-irreducible).

**Proof plan.**

1. depth_{𝒪⟦y⟧}(M_∞) = 1 + h + j because M_∞ is free, and the 𝒪⟦y⟧-action factors through R_∞, so depth_{R_∞} M_∞ ≥ 1 + h + j ≥ dim R_∞.
2. A module of maximal depth is supported on top-dimensional components (R03.6).
3. If B is a domain, B⟦x⟧ is a domain of dimension 1 + h + j. The image in End(M_∞) has dimension ≥ 1 + h + j because it is a finite faithful 𝒪⟦y⟧-module, so the composite is injective and R_∞ ≅ B⟦x⟧.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); `GlobalGaloisDeformations:R04.6/patching-numerology`; `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-support-top-components`; `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-nearly-faithful-irreducible`.

**Acceptance checks.**

- Gee's setting: dim R_∞ = dim J_∞ = 4#T + r, and R′_∞ has a unique minimal prime, so Supp S′_∞ = Spec R′_∞.
- If B has several components (for example with an inertia-rigid place), the support is only known to be a union of components; component matching is R22.4.
- Maximal depth alone does not give full support: R03.6's example k⟦x, y⟧/(xy) with M = A/(x).

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), proof of Proposition 9.2 (II), p. 83. The domain case.
- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, pp. 40–41. The depth argument.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Patching`, namespace `TauCeti.ModularityLifting`.

<a id="r22-3-minimal-ring-finite"></a>

### Finiteness of the minimal deformation ring

**Theorem** · `GL2ModularityLifting:R22.3/minimal-ring-finite`.

In the situation of patched-support with B a domain, R̄^{□,ψ}_S is finite over 𝒪⟦y_{h+1}, …, y_{h+j}⟧ and R̄^ψ_S is finite over 𝒪.

**Hypotheses and conventions.**

- This is finiteness at the minimal level of a modular ρ̄, as a consequence of patching. The global finiteness used for arbitrary ρ̄ (KW II Theorem 10.1, by base change) is PotentialModularityAndCompatibleSystems R24.1, not this node.

**Proof plan.**

1. R_∞ ≅ B⟦x⟧ embeds in End_{𝒪⟦y⟧}(M_∞), which is finite over 𝒪⟦y⟧, so R_∞ is finite over 𝒪⟦y⟧.
2. Killing y_1, …, y_h gives R̄^{□,ψ}_S finite over 𝒪⟦y_{h+1}, …, y_{h+j}⟧; killing the framing variables gives R̄^ψ_S finite over 𝒪.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support).

**Acceptance checks.**

- R̄^{□,ψ}_S itself is never finite over 𝒪 (it has j = 4|S| − 1 framing variables).
- With finiteness and dim ≥ 1 (GlobalGaloisDeformations R04.3), R̄^ψ_S has characteristic-zero points.
- The statement is for the minimal-level ring of a modular ρ̄ only.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition 9.2 (II), p. 81. The statement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Patching`, namespace `TauCeti.ModularityLifting`.

<a id="r22-3-generic-fibre-r-equals-t"></a>

### R = T after inverting p

**Theorem** · `GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`.

**Planet:** Generic-fibre R = T.

If B is a domain, the surjection π^□ : R̄^{□,ψ}_S → 𝕋^□_𝔪 of R22.1 has p-power torsion kernel. Equivalently, R̄^{□,ψ}_S[1/p] ≅ 𝕋^□_𝔪[1/p], and likewise R̄^ψ_S[1/p] ≅ 𝕋_ψ(U)_𝔪[1/p].

**Hypotheses and conventions.**

- Auslander–Buchsbaum over the regular ring R_∞[1/p] (Kisin, Moduli, Lemma 3.3.4), requested from DeformationAndDerivedPatchingAlgebra R03.3; the R = T bookkeeping is R03.6 (torsion-in-kernel, r-equals-t-torsion-free-quotient).

**Proof plan.**

1. R_∞[1/p] ≅ B⟦x⟧[1/p] is a regular Noetherian domain (B[1/p] is regular, KW II Theorem 3.1).
2. M_∞ ⊗ E is finite free over 𝒪⟦y⟧[1/p], so by Auslander–Buchsbaum it is a finite projective faithful R_∞[1/p]-module.
3. Hence M_∞ ⊗ E/(y_1, …, y_h) is faithful over R̄^{□,ψ}_S[1/p], and the action factors through 𝕋^□_𝔪. So the kernel of π^□ is killed by a power of p.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); [`GL2ModularityLifting:R22.1/deformation-to-hecke-surjective`](#r22-1-deformation-to-hecke-surjective); `DeformationAndDerivedPatchingAlgebra:R03.6/torsion-in-kernel`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-torsion-free-quotient`; `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Acceptance checks.**

- When 𝕋 is 𝒪-flat and reduced, this gives (R̄^ψ_S)^{tf} ≅ 𝕋 (R03.6/r-equals-t-torsion-free-quotient).
- The integral isomorphism needs more: see integral-r-equals-t-when-smooth (R22.4).
- If B is not a domain, one gets only a component-by-component statement (R22.4).

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition 9.2 (III) and its proof, pp. 81 and 83. The statement and proof.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Patching`, namespace `TauCeti.ModularityLifting`.

<a id="r22-4"></a>

## R22.4. Component arguments and nonminimal levels

Compare the two local deformation problems used by Ihara avoidance, transfer support across the special fibre and recover modularity on the asserted components. Integral R = T has additional smoothness or Cohen–Macaulay and numerical presentation requirements; the generic-fibre statement does not itself supply an integral isomorphism.

<a id="r22-4-ihara-avoidance-comparison"></a>

### Two deformation problems that agree modulo λ

**Construction** · `GL2ModularityLifting:R22.4/ihara-avoidance-comparison`.

Let T_r be the places v ∤ p where ρ̄ or the lift is ramified, with ρ̄|_{G_{F_v}} trivial and #k(v) ≡ 1 mod p. Let ζ ≠ 1 be a p-th root of unity. The problems 𝒮_Q (lifts with char ρ(σ_v) = (X − 1)² at v ∈ T_r) and 𝒮′_Q (char ρ(σ_v) = (X − ζ)(X − ζ^{−1})) have local rings with R^loc/λ = R^{loc,′}/λ and global rings with R_Q/λ = R′_Q/λ. The corresponding level structures (the trivial character ψ versus ψ′ through ζ at T_r) give S(U_∅, 𝒪)/λ = S(U′_∅, 𝒪)/λ. The two patchings can be carried out compatibly modulo λ, giving (R_∞, S_∞) and (R′_∞, S′_∞) with R_∞/λ = R′_∞/λ and S_∞/λ = S′_∞/λ.

**Hypotheses and conventions.**

- The local geometry used is LocalGaloisDeformationRings R08.2/ihara-avoidance-components (Taylor II Proposition 3.1): (R^{loc,′})^red is irreducible, O-flat of Krull dimension 1 + 3#T + [F : ℚ], and the components of R^loc biject with those of R^loc/λ.
- This is Taylor's Ihara avoidance, which replaces Ihara's lemma in passing to nonminimal levels.

**Proof plan.**

1. ζ ≡ 1 mod λ, so the two local conditions agree modulo λ, and so do the characters ψ ≡ ψ′.
2. Choose the patching data for both problems simultaneously, with the same auxiliary primes and compatible choices mod λ (Gee §5.6).

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.avoidancePair` | constructor | The problems 𝒮_Q and 𝒮′_Q with their local rings and levels. |
| `TauCeti.ModularityLifting.avoidancePair_mod_lambda` | compatibility | R^loc/λ = R^{loc,′}/λ and S/λ = S′/λ. |
| `TauCeti.ModularityLifting.avoidancePair_irreducible` | characterisation | (R^{loc,′})^red is irreducible. |

**Unit tests.**

- `avoidancePair_Tr_empty` (example): T_r = ∅ gives equal problems.
- `avoidancePair_mod_lambda` (characterisation): The local conditions agree modulo λ.
- `avoidancePair_types_differ` (non-example): The generic fibres carry different inertial types.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`.

**Consumers.**

- [`GL2ModularityLifting:R22.4/support-transfer-mod-lambda`](#r22-4-support-transfer-mod-lambda): the comparison.

**Acceptance checks.**

- T_r = ∅: the two problems coincide.
- Each ring's generic fibre sees a different inertial type (unipotent versus (ζ, ζ^{−1})), although the special fibres coincide.
- Without #k(v) ≡ 1 mod p there is no nontrivial ζ-type at v.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, pp. 33–35. The two problems.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Components`, namespace `TauCeti.ModularityLifting`.

<a id="r22-4-support-transfer-mod-lambda"></a>

### Transfer of full support across the special fibre

**Theorem** · `GL2ModularityLifting:R22.4/support-transfer-mod-lambda`.

**Planet:** Ihara avoidance.

In the setting of ihara-avoidance-comparison, Supp_{R′_∞}(S′_∞) = Spec R′_∞. Hence Supp_{R_∞/λ}(S_∞/λ) = Spec R_∞/λ, and since the irreducible components of Spec R_∞ biject with those of Spec R_∞/λ, Supp_{R_∞}(S_∞) = Spec R_∞. Specialising along 𝔞_∞, Supp_{R^univ_∅}(S_∅) = Spec R^univ_∅.

**Hypotheses and conventions.**

- The components of Spec R_∞ versus Spec R_∞/λ come from R^loc (R08.2/ihara-avoidance-components, Gee Theorem 3.38). The lift of near faithfulness from the special fibre and its descent along the patching ideal are DeformationAndDerivedPatchingAlgebra R03.6.

**Proof plan.**

1. R′_∞ has a unique minimal prime and S′_∞ has maximal depth, so its support is all of Spec R′_∞ (patched-support, R03.6/maximal-cm-nearly-faithful-irreducible).
2. Reduce mod λ: S′_∞/λ = S_∞/λ and R′_∞/λ = R_∞/λ, so S_∞/λ has full support.
3. Supp S_∞ is a union of components (maximal depth) containing all of Spec R_∞/λ, and the components biject, so Supp S_∞ = Spec R_∞ (R03.6/nearly-faithful-lift-from-special-fibre).
4. Descend along 𝔞_∞ = (𝔞, y_1, …, y_r) (R03.6/patching-nearly-faithful-descends).

**Prerequisites.** [`GL2ModularityLifting:R22.4/ihara-avoidance-comparison`](#r22-4-ihara-avoidance-comparison); [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-lift-from-special-fibre`; `DeformationAndDerivedPatchingAlgebra:R03.6/patching-nearly-faithful-descends`; `DeformationAndDerivedPatchingAlgebra:R03.6/maximal-cm-nearly-faithful-irreducible`.

**Acceptance checks.**

- T_r = ∅: the primed and unprimed problems agree, and the argument is patched-support.
- The unprimed R^loc may have several components (unipotent types); the primed one is irreducible, which is the point of the comparison.
- The conclusion is support, that is near faithfulness, not an integral R = T.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), §5.6, p. 41. The transfer.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Components`, namespace `TauCeti.ModularityLifting`.

<a id="r22-4-modularity-from-full-support"></a>

### Modularity from full support

**Theorem** · `GL2ModularityLifting:R22.4/modularity-from-full-support`.

**Planet:** Modularity from full support.

If Supp_{R^univ_∅}(S_∅) = Spec R^univ_∅, then ker(R^univ_∅ → 𝕋_∅) is nilpotent, (R^univ_∅)^red ≅ 𝕋_∅, and every lift ρ of type 𝒮_∅ over 𝒪 is modular: it corresponds to a homomorphism 𝕋_∅ → 𝒪, hence to a cuspidal π of weight (k, η) with ρ ≅ ρ_{π,ı}.

**Hypotheses and conventions.**

- 𝕋_∅ acts faithfully on S_∅ by definition; the ring-theoretic step is DeformationAndDerivedPatchingAlgebra R03.6 (r-to-t-kernel-nil, r-red-equals-t-red).

**Proof plan.**

1. Full support means S_∅ is nearly faithful over R^univ_∅, so the kernel of R^univ_∅ → 𝕋_∅ ⊆ End(S_∅) is nil (R03.6/r-to-t-kernel-nil).
2. An 𝒪-point of R^univ_∅ factors through the reduced quotient, which is 𝕋_∅, and 𝒪-points of 𝕋_∅ are eigenforms (R18.3 via R18.6, Jacquet–Langlands).

**Prerequisites.** [`GL2ModularityLifting:R22.4/support-transfer-mod-lambda`](#r22-4-support-transfer-mod-lambda); `DeformationAndDerivedPatchingAlgebra:R03.6/r-to-t-kernel-nil`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-red-equals-t-red`; `HilbertModularVarietiesAndShimuraCurves:R18.6`.

**Acceptance checks.**

- This is Gee Lemma 5.7.
- Only the reduced quotient is identified: nilpotents in R^univ_∅ are not excluded.
- The conclusion is modularity of points of the given type, not of arbitrary lifts.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), Lemma 5.7, p. 35. The statement and proof.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Components`, namespace `TauCeti.ModularityLifting`.

<a id="r22-4-integral-r-equals-t-when-smooth"></a>

### When the R = T statement is integral

**Theorem** · `GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`.

**Planet:** Integral R = T.

Suppose B = R̄^{□,loc,ψ}_S is formally smooth over 𝒪, as when every local condition is formally smooth (Fontaine–Laffaille, ordinary with ρ̄_v ramified, odd archimedean for p ≠ 2). Then R_∞ ≅ B⟦x⟧ is a power series ring over 𝒪, M_∞ is free over R_∞, R̄^ψ_S ≅ 𝕋_ψ(U)_𝔪 integrally, S_{k,ψ}(U, 𝒪)_𝔪 is free over 𝕋_ψ(U)_𝔪, and R̄^ψ_S is a complete intersection. More generally, in the KW II Proposition 4.5/Lemma 4.6 presentation with its numerical relation bound and dimension comparison, if each R̄^{□,ψ}_v is Cohen–Macaulay (resp. Gorenstein, resp. a complete intersection), so is R̄^ψ_S provided it is finite over 𝒪. The presentation bound, not finiteness alone, makes the displayed relations and framing variables part of a system of parameters.

**Hypotheses and conventions.**

- Maximal depth over a regular local ring gives freeness (DeformationAndDerivedPatchingAlgebra R03.3/free-of-maximal-depth-regular-local); integral R = T from a free module is R03.6/r-equals-t-of-free and patched-module-r-equals-t.
- The Cohen–Macaulay/Gorenstein/complete-intersection clause is in the KW II global deformation presentation with its generator–relation dimension bound, not an arbitrary finite quotient of B⟦x⟧.

**Proof plan.**

1. R_∞ ≅ B⟦x⟧ is regular, and M_∞ has maximal depth, so M_∞ is free over R_∞ (R03.3).
2. M_∞ is free over R_∞, and y_1, …, y_{h+j} is regular on it, so S(U)_𝔪 = M_∞/(y) is free over R_∞/(y) = R̄^ψ_S. Hence R̄^ψ_S → 𝕋 is an isomorphism (R03.6/r-equals-t-of-free).
3. Cohen–Macaulay version: with R̄^{□,ψ}_S ≅ B⟦x_1, …, x_g⟧/J (GlobalGaloisDeformations R04.3) and R̄^ψ_S finite over 𝒪, the framing variables, generators r_1, …, r_{r(J)} of J, and p form a system of parameters of B⟦x⟧ (KW II remark after Lemma 4.6). It is a regular sequence when B is Cohen–Macaulay. Finiteness alone does not make an arbitrary list of relations part of a system of parameters: the KW II Proposition 4.5/Lemma 4.6 numerical presentation bound and dimension comparison are indispensable (recorded as a closure gap).
4. Complete intersection: a regular ring modulo a regular sequence.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-of-free`; `DeformationAndDerivedPatchingAlgebra:R03.6/patched-module-r-equals-t`; `LocalGaloisDeformationRings:R08.6`.

**Acceptance checks.**

- Wiles and Taylor–Wiles minimal case: R ≅ 𝕋 is a complete intersection.
- With a non-smooth local factor (for example Savitt's 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p)), only the generic-fibre statement generic-fibre-r-equals-t is obtained without further input.
- Faithfulness of S(U)_𝔪 over R̄ is exactly equivalent to integral R = T (R03.6/r-equals-t-free); freeness is stronger.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.2, remarks after Lemma 4.6, p. 45. The statement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Components`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5"></a>

## R22.5. Odd-prime modularity lifting

Apply classical support with the precise KW type A/B/C and determinant data, or Kisin's strongly residually modular chosen-component input, or Gee's Fontaine–Laffaille input. The ordinary overlap imports R21 rather than rebuilding its theorem. The passage from residual modularity over ℚ to (α)/(β), followed by these lifting results, exports KW I Theorem 4.1(2) here. Its unread nonordinary boundary case remains recorded below.

<a id="r22-5-solvable-base-change-reduction"></a>

### Reduction to a solvable totally real extension

**Lemma** · `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.

Let ρ : G_F → GL_2(𝒪) be continuous with F totally real, S a finite set of places of F, and L_v/F_v finite Galois for v ∈ S (real L_v at the infinite places). There is a finite solvable Galois totally real extension F′/F with F′_w ≅ L_v for every w | v ∈ S; it can be chosen linearly disjoint from any given finite extension, so that ρ̄|G_{F′} keeps a non-solvable image, and ρ̄|G_{F′(ζ_p)} stays absolutely irreducible when ρ̄|G_{F(ζ_p)} is. Then ρ is modular if and only if ρ|G_{F′} is modular. In particular one may assume: [F′ : ℚ] even, ρ|G_{F′} semistable with unipotent inertia at every place away from p where it ramifies, ρ̄|G_{F′} unramified away from p, and the prescribed splitting at p.

**Hypotheses and conventions.**

- Existence of the field is not an automorphic statement: it is Clozel–Harris–Taylor's Lemma 4.1.2 (requested from PotentialModularityAndCompatibleSystems R23.1; Gee quotes it as Fact 4.27), and in the allowable case R22.1/allowable-base-change-existence. The descent of modularity along soluble extensions (Gee Proposition 4.25, from Langlands' cyclic base change and strong multiplicity one) is requested from GL2AutomorphicRepresentationsAndTransfer R17.4.
- KW II call such extensions allowable base changes; Kisin calls them admissible extensions.
- For the modularity equivalence impose that ρ|G_{F′} is irreducible, as in Gee Proposition 4.25 (automatic under the retained residual-image hypotheses used here). Local prescription and preservation of the residual image require separate finite splitting conditions.

**Proof plan.**

1. Existence: Clozel–Harris–Taylor's Lemma 4.1.2 with the real places of F in the prescribed set (E_v = ℝ) gives a totally real soluble Galois F′/F with F′_w ≅ L_v, linearly disjoint from a given finite Galois extension; taking that extension to contain the field cut out by ρ̄ and μ_p keeps the residual image and cyclotomic irreducibility, as in R22.1/allowable-base-change-existence, which adds evenness and the conditions at p.
2. Modularity descends: for a cyclic step E/F, if ρ|G_E ≅ ρ_π then π ∘ σ ≅ π by strong multiplicity one, so π is a base change from F, and ρ ≅ ρ_{π′} ⊗ χ for a character χ by Schur's lemma; induct along the solvable tower.
3. Unipotent inertia: by Grothendieck's monodromy theorem ρ|I_v acts unipotently on an open subgroup of I_v, which a finite L_v cuts out.

**Prerequisites.** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); `PotentialModularityAndCompatibleSystems:R23.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- F = ℚ, L_3 = ℚ_3(√−3): F′ = ℚ(√6) works, since 6/(−3) = −2 is a square in ℚ_3; ℚ(√−3) itself is not allowed, as F′ must be totally real.
- Modularity of ρ|G_{F′} descends to ρ only because F′/F is solvable: for a non-solvable F′/F descent is not available.
- Without linear disjointness the image hypothesis can fail over F′: if ρ̄ is induced from a real quadratic K/F with K ≠ F(√p*), then ρ̄|G_{F(ζ_p)} can be irreducible while ρ̄|G_{F′} is reducible for F′ ⊇ K.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), Proposition 4.25 and Fact 4.27, p. 29. Descent of modularity along a solvable extension; Taylor's Lemma 2.2 follows it.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kw-odd-prime-lifting"></a>

### The Khare–Wintenberger lifting theorem for odd p

**Theorem** · `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`.

**Planet:** Khare–Wintenberger lifting theorem for odd p.

Let p > 2, F totally real and unramified at p, split at p if ρ̄|_{D_p} is irreducible or k(ρ̄) = p + 1, with ρ̄_F = ρ̄|G_F such that ρ̄|G_{F(μ_p)} is absolutely irreducible and ρ̄_F satisfies (α) and (β). Let ρ_F : G_F → GL_2(𝒪) lift ρ̄_F, be ramified at finitely many places, totally odd, and at every place above p of one of the types (A) crystalline of weight k with 2 ≤ k ≤ p + 1 (when k = p + 1, with k(ρ̄) = p + 1), (B) of weight 2 and crystalline over ℚ_p^{nr}(μ_p), or (C) semistable non-crystalline of weight 2 of the form (γ_vχ_p ∗; 0 γ_v) with γ_v unramified. Then ρ_F is modular. This formulation uses no finiteness of deformation rings from KW II §10 and no potential modularity.

**Hypotheses and conventions.**

- F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).
- The residual input is (α) and (β) of kw-residual-modularity, not 'ρ̄ is modular'. KW I Theorem 4.1(2), stated with 'ρ̄ modular', is the output R22.5/kw-i-theorem-4-1-odd-prime of this layer, derived from this theorem, the weight part of Serre's conjecture and the cited cases as in KW II §10.2.
- Case (B) of weight two is only the part of the potentially Barsotti–Tate case that becomes semistable over ℚ_p(μ_p) (KW II §10.2, remark). The general potentially Barsotti–Tate case is kisin-potentially-bt-lifting.

**Proof plan.**

1. After a solvable base change (solvable-base-change-reduction; Taylor's Lemma 2.2), ρ_F is totally odd, uniform above p of type (A), (B) or (C), of the form (γ_vχ_p ∗; 0 γ_v) at the ramified places away from p, and ρ̄ is trivial above p when ρ̄ is unramified at p. Then ρ_F and det ρ_F prescribe lifting data and ψ, so ρ_F is an 𝒪-point of R̄^{□,ψ}_S.
2. After a further base change, R22.1/theorem-8-4-prescribed-modular-lifts (KW II Theorem 8.4) gives a cuspidal π′ of parallel weight fitting the same lifting data and ψ.
3. R̄^{□,loc,ψ}_S is a domain (semistable conditions away from p; LocalGaloisDeformationRings R08.6/export-completed-tensor-product), so R22.3/generic-fibre-r-equals-t gives R̄^{□,ψ}_S[1/p] ≅ 𝕋^□_𝔪[1/p]; the point ρ_F factors through 𝕋 and is modular.
4. Solvable base change descends modularity to F.

**Prerequisites.** [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`](#r22-3-generic-fibre-r-equals-t); [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.5/image-hypotheses`; `LocalGaloisDeformationRings:R08.6/kw-local-conditions`; `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`; [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); [`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`](#r22-1-theorem-8-4-prescribed-modular-lifts).

**Acceptance checks.**

- F = ℚ, p = 3, ρ = the 3-adic Tate module of 11a1: crystalline of weight 2 (case (A)), the mod-3 image is GL_2(𝔽_3), so ρ̄|G_{ℚ(ζ_3)} (image SL_2(𝔽_3)) is absolutely irreducible, and (α), (β) hold with 11a1's own form; the theorem recovers its modularity.
- Weight p + 2 is outside (A): the theorem says nothing about crystalline lifts of weight > p + 1.
- If ρ̄|G_{F(μ_p)} is reducible (for example ρ̄ induced from ℚ(√−3) at p = 3), Taylor–Wiles primes are unavailable (GlobalGaloisDeformations R04.5/image-hypotheses) and the theorem does not apply.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.2, Theorem 9.7 and its proof, pp. 89–90. Theorem 9.7, odd p.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. What KW II's own argument covers, and what it leaves to Kisin.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-alpha-beta-from-modularity-over-q"></a>

### From 'ρ̄ modular' over ℚ to the residual hypotheses (α) and (β)

**Lemma** · `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`.

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, normalised by a twist so that 2 ≤ k(ρ̄) ≤ p + 1 when p > 2. (1) For p > 2, ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) for some N prime to p, and from S₂(Γ₁(Np)). For p = 2, ρ̄ arises from S₂(Γ₁(N)) with N odd when k(ρ̄) = 2, and from a weight-two form whose level has 2-adic valuation at most 1 in both cases k(ρ̄) = 2, 4. (2) Let F be a totally real field with a soluble tower over ℚ, unramified at p, with ρ̄|_{G_F} absolutely irreducible. Then ρ̄|_{G_F} satisfies (α) and (β) of KW II §8.2 if p > 2; if p = 2 it satisfies (β), and (α) when k(ρ̄) = 2.

**Hypotheses and conventions.**

- 'Modular' is in the sense of KW I §1: ρ̄ arises from a newform of some weight k ≥ 2 and some level.
- The optimal prime-to-p level N(ρ̄) is not needed, only some level prime to p; this is why Gross's hypothesis N > 4 is harmless (KW II §10.2).
- This is the weight part of Serre's conjecture, imported from SerreWeightAndLevelOptimisation: Edixhoven's theorem (weight k(ρ̄) at a level prime to p, from Gross's Theorem 13.10 and Coleman–Voloch), removal of the p-part of the level, and the passage to weight 2 at level Np (Gross's Propositions 8.13 and 8.18; Ribet). The supplier nodes for p = 2 and p = 3 have restrictions (ℓ ≥ 3 for the level step, ℓ > 3 or N > 3 for weight two); the cases they leave are requested from R20.6.
- No potential modularity (KW II Theorem 6.1) and no finiteness of deformation rings (Theorem 10.1) enter.
- Edixhoven's theorem produces a Katz form in characteristic p, while (α) and (β) ask for automorphic representations; the lift to characteristic zero in weight ≥ 2 is a step of the proof, not part of the weight theorem.

**Proof plan.**

1. Level prime to p: ρ̄ arises from Γ₁(Np^a) for some a ≥ 0, hence from Γ₁(N) in some weight (SerreWeightAndLevelOptimisation R20.4/strip-ell-power-from-level, for p ≥ 3; R20.6 for p = 2).
2. Weight k(ρ̄) at level N: Edixhoven's theorem (R20.3/edixhoven-weight-theorem), with the normalisation 2 ≤ k(ρ̄) ≤ p + 1, gives a Katz eigenform over 𝔽̄_p of type (N, k(ρ̄), ε). Lift it to characteristic zero: after enlarging N to a multiple N ≥ 5 prime to p, the reduction map on cusp forms of weight k(ρ̄) ≥ 2 is onto (AlgebraicModularFormsAndSerreWeights R15.2/integral-lattice-and-reduction-image; the cusp-sheaf H¹ has no torsion in weight ≥ 2), and the Deligne–Serre lemma gives a characteristic-zero eigenform with the same eigenvalues modulo p, hence a newform of weight k(ρ̄) and level dividing N from which ρ̄ arises (R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform). This is where the hypothesis N > 4 of KW II §10.2 enters.
3. Weight 2 at level Np: R20.4/weight-two-at-level-n-ell (p > 3 or N > 3; enlarge N by an auxiliary prime if N ≤ 3). The p-component of the resulting newform has conductor exponent at most 1.
4. Over F: take the cuspidal automorphic representations of GL₂(𝔸_ℚ) of these newforms and base-change them along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4); they stay cuspidal because ρ̄|_{G_F} is irreducible, their weights are parallel k(ρ̄), resp. 2, and above p they are unramified, resp. of conductor exponent at most 1, because F is unramified at p. These are witnesses for (α) and (β).

**Prerequisites.** [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); `SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem`; `SerreWeightAndLevelOptimisation:R20.4/strip-ell-power-from-level`; `SerreWeightAndLevelOptimisation:R20.4/weight-two-at-level-n-ell`; `SerreWeightAndLevelOptimisation:R20.6`; `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`; `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`; `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- ρ̄ = E[p] for an elliptic curve E/ℚ of conductor prime to p, p ≥ 5, with E[p] irreducible: k(ρ̄) = 2, and the newform of E is at once the (α)- and the (β)-witness over ℚ.
- k(ρ̄) = p + 1 (très ramifiée): the (α)-witness has weight p + 1 and level prime to p, the (β)-witness has weight 2 and is Steinberg at p.
- For p = 2 and k(ρ̄) = 4 no (α) is asserted, as in KW II.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. From 'ρ̄ modular' to (α) and (β); [27] is Gross, [12] Coleman–Voloch.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proof of Theorem 6.1, solvable-image paragraph, p. 54. The classical form of (α) and (β) over ℚ.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-component-patching"></a>

### Patching on a chosen local component

**Lemma** · `GL2ModularityLifting:R22.5/component-patching`.

Let B = ⊗̂_{v∈S} B_v, where each B_v is a quotient of the framed local lifting ring R^{□,ψ}_v that is 𝒪-flat with B_v[1/p] geometrically integral and formally smooth over E. Then B is 𝒪-flat and B[1/p] is geometrically integral and formally smooth. Let R_B = R^{□,ψ}_S ⊗̂_{R^{□,loc,ψ}_S} B, and suppose a Hecke eigensystem 𝔪 of level U (R22.1) whose framed module M is an R_B-module, with the Taylor–Wiles systems of R22.2. Then R_B → 𝕋^□ has p-power torsion kernel, M ⊗ E is finite projective and faithful over R_B[1/p], and every 𝒪′-point of R_B is modular. So a lift is modular as soon as, at every v ∈ S, it lies on the same irreducible component B_v of Spec R^{□,ψ}_v[1/p] as a modular point.

**Hypotheses and conventions.**

- For KW II's rings B_v is the whole ring R̄^{□,ψ}_v (R22.3). Kisin's refinement chooses B_v to be one irreducible component: the potentially Barsotti–Tate lifts of a fixed type, ordinary or not ordinary, whose geometry is requested from LocalGaloisDeformationRings R08.4 (and at p = 2 from R08.5).

**Proof plan.**

1. Kisin Lemma (3.4.12): a completed tensor product of flat 𝒪-algebras with geometrically integral (resp. formally smooth) generic fibres has the same property; S₁ for flatness plus generic reducedness give integrality.
2. Kisin Proposition (3.3.1) with this B: patching (R22.3/patched-ring-and-module, with R^{□,loc} replaced by B) gives B⟦x⟧ ↠ R_∞ and M_∞ finite free over 𝒪⟦y⟧ of equal dimension; Kisin Lemma (3.3.4) (Auslander–Buchsbaum, requested from DeformationAndDerivedPatchingAlgebra R03.3 as in R22.3) makes M_∞ ⊗ E projective and faithful over B⟦x⟧[1/p], and B⟦x⟧ ≅ R_∞.
3. Reduce modulo (y_1, …, y_h) to obtain the faithfulness of M ⊗ E over R_B[1/p] (Kisin Theorem (3.4.11)); modular points are then all of Spec R_B[1/p].

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); [`GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`](#r22-3-generic-fibre-r-equals-t); [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system); `LocalGaloisDeformationRings:R08.4`; `DeformationAndDerivedPatchingAlgebra:R03.3`; `LocalGaloisDeformationRings:R08.4/rank-two-bt-components`.

**Acceptance checks.**

- B_v = R̄^{□,ψ}_v for KW II's conditions recovers R22.3/generic-fibre-r-equals-t.
- If the modular point and ρ lie on different components (one ordinary, the other not), the lemma says nothing: this is why Kisin matches ordinarity.
- Geometric integrality matters: an integral but not geometrically integral B[1/p] can split into several components after enlarging E.

**Sources.**

- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), Proposition (3.3.1), p. 62; Theorem (3.4.11) and Lemma (3.4.12), pp. 69–70. The patching criterion on a chosen domain B.
- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), Lemma (3.4.12), p. 69. Completed tensor products (the hat is lost in the text extraction).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-fontaine-laffaille-lifting"></a>

### Modularity lifting in the Fontaine–Laffaille range

**Theorem** · `GL2ModularityLifting:R22.5/fontaine-laffaille-lifting`.

**Planet:** Fontaine–Laffaille modularity lifting.

Let p > 3, F a totally real number field with p unramified in F, and ρ, ρ₀ : G_F → GL_2(𝒪) with ρ̄ = ρ̄₀, ρ₀ modular and ρ geometric. Suppose that for every σ : F ↪ L, HT_σ(ρ) = HT_σ(ρ₀) consists of two distinct integers differing by at most p − 2; that ρ and ρ₀ are crystalline at every v | p; and that ρ̄(G_F) ⊇ SL_2(𝔽_p). Then ρ is modular.

**Hypotheses and conventions.**

- The residual hypothesis is Gee's big image, GlobalGaloisDeformations R04.5/image-hypotheses (2), which is different from KW II's cyclotomic irreducibility.
- The local rings are the Fontaine–Laffaille rings, formally smooth: R08.6/export-fontaine-laffaille-irreducible covers F_v = ℚ_p with ρ̄_v irreducible, and the general unramified case is requested from LocalGaloisDeformationRings R08.6.

**Proof plan.**

1. Base change as in Gee §5.5, preserving the residual image and remaining unramified above p, to arrange even [F:ℚ], residual unramifiedness away from p, unipotent inertia for ρ and ρ₀ away from p, equal determinants, and ρ̄|G_{F_v} trivial with #k(v)≡1 mod p at the ramified auxiliary places v∈T_r. These are not the Taylor–Wiles places Q: Q is disjoint from T and ρ̄(Frob_v) has distinct eigenvalues there (Gee §5.6, p. 33).
2. Patch with Ihara avoidance: the pair of problems of R22.4/ihara-avoidance-comparison, full support in the unipotent problem transferred from the irreducible 𝒮′ problem (R22.4/support-transfer-mod-lambda).
3. R22.4/modularity-from-full-support.

**Prerequisites.** [`GL2ModularityLifting:R22.4/ihara-avoidance-comparison`](#r22-4-ihara-avoidance-comparison); [`GL2ModularityLifting:R22.4/support-transfer-mod-lambda`](#r22-4-support-transfer-mod-lambda); [`GL2ModularityLifting:R22.4/modularity-from-full-support`](#r22-4-modularity-from-full-support); [`GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`](#r22-4-integral-r-equals-t-when-smooth); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); `GlobalGaloisDeformations:R04.5/image-hypotheses`; `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`; `LocalGaloisDeformationRings:R08.6`.

**Acceptance checks.**

- The p-adic Tate module of an elliptic curve over F with good reduction above p ≥ 5, p unramified in F and ρ̄(G_F) ⊇ SL_2(𝔽_p), once some crystalline weight-two modular ρ₀ lifts ρ̄: the Hodge–Tate weights {0, 1} differ by 1 ≤ p − 2.
- Weights differing by p − 1 are outside the range: Fontaine–Laffaille theory stops at p − 2.
- p = 3 is excluded even when the image is GL_2(𝔽_3): the theorem needs p > 3.

**Sources.**

- [`GEE-MLT-2022`](https://arxiv.org/pdf/2202.05818v2), Theorem 5.2, p. 29. Theorem 5.2, with the crystalline and big-image conditions (1)–(3) that follow.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-ordinary-overlap"></a>

### The exact overlap with ordinary modularity lifting

**Comparison** · `GL2ModularityLifting:R22.5/ordinary-overlap`.

Lifting data of type (C) at every v | p, and crystalline lifts of weight p + 1 with k(ρ̄) = p + 1 (which are ordinary, LocalGaloisDeformationRings R08.6/export-endpoint-weight), are ordinary at every v | p: ρ|D_v ≅ (χ₁γ₁ ∗; 0 γ₂) with γ_i unramified. For these cases the π of KW II Theorem 8.4 fitting the lifting data is ordinary at v | p (Steinberg, resp. ordinary crystalline). So the cases lie in the scope of the ordinary lifting theorem of OrdinaryAutomorphicFormsAndModularityLifting R21.4 (requested), and its conclusion agrees with kw-odd-prime-lifting there. Outside these cases (types (A) with k ≤ p non-ordinary, (B), and Kisin's non-ordinary potentially Barsotti–Tate lifts) R21.4 does not apply, and they are kept in this layer.

**Hypotheses and conventions.**

- The transport checks R21.4's individual hypotheses on the classical data: the ordinary shape at v | p with the stable line and its character, the determinant ψχ_p, ramification away from p of the form (γ_vχ_p ∗; 0 γ_v), residual cyclotomic irreducibility, and an ordinary residually modular form (from Theorem 8.4).

**Proof plan.**

1. Type (C) is by definition (γ_vχ_p ∗; 0 γ_v): ordinary with sub-character γ_vχ_p.
2. Weight p + 1 crystalline lifts with k(ρ̄) = p + 1 are ordinary (R08.6/export-endpoint-weight), and Theorem 8.4's π fitting these data is ordinary at v | p.
3. A π Steinberg at v | p has ρ_π|D_v of type (C) by local–global compatibility at p (requested from AutomorphicGaloisRepresentations R19.6), hence ordinary.

**Prerequisites.** [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting); `LocalGaloisDeformationRings:R08.6/export-endpoint-weight`; `LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `AutomorphicGaloisRepresentations:R19.6`.

**Acceptance checks.**

- 11a1 at p = 11 (split multiplicative reduction, a Tate curve): its 11-adic representation is (γχ_11 ∗; 0 γ) at 11 with γ unramified, of type (C), inside the overlap.
- A non-ordinary crystalline weight-2 lift (a_p divisible by p) is of type (A) but outside the overlap.
- A crystalline lift of weight p + 1 with k(ρ̄) = 2 is not treated by KW II's argument (their §10.2 remark) and is not in the overlap either.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. The ordinary endpoint case, which KW II cite rather than reprove.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-strong-residual-modularity"></a>

### Strong residual modularity

**Definition** · `GL2ModularityLifting:R22.5/strong-residual-modularity`.

For p>2, F totally real and ρ:G_{F,S}→GL₂(E), StronglyResiduallyModular(ρ) means: ρ is potentially Barsotti–Tate at every v|p, its determinant is cyclotomic times a finite-order character, and there exists a parallel-weight-two Hilbert eigenform f with ρ̄_f≅ρ̄, not special at any v|p, and potentially ordinary at v exactly when ρ is.

**Hypotheses and conventions.**

- The potentially Barsotti–Tate and potentially ordinary predicates, and determinant convention, are those of Kisin (3.5.4).

**Proof plan.**

1. Use actual Hilbert eigenform and local representation data; the predicate remembers existence of a witness, not a choice of component. Component matching requires the further character conditions in component-patching.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.StronglyResiduallyModular` | constructor | The existential predicate with all the stated local and determinant conditions. |
| `TauCeti.ModularityLifting.strongResidual_witness` | projection | A proof supplies a weight-two residual modularity witness not special above p, with the specified ordinarity equivalence. |
| `TauCeti.ModularityLifting.strongResidual_of_witness` | constructor | The pBT conditions, finite-order determinant factor and such an f yield the predicate. |

**Unit tests.**

- `strongResidual_self_witness` (example): A weight-two Hilbert eigenform not special above p, whose representation is pBT with the required determinant, witnesses strong residual modularity of its own representation.
- `strongResidual_mismatched_ordinary_witness` (non-example): A witness ordinary at v cannot witness strong residual modularity of a nonordinary ρ there.
- `strongResidual_special_not_witness` (non-example): A form special at a place above p is excluded even if its residual representation matches.

**Prerequisites.** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `LocalGaloisDeformationRings:R08.4/rank-two-bt-components`.

**Consumers.**

- [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting): The residual hypothesis of Kisin (3.5.5).

**Acceptance checks.**

- The witness must match ordinarity at every v|p, not merely somewhere above p.
- This definition alone does not choose between two ordinary components for split distinct residual characters.

**Sources.**

- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), (3.5.4)–Theorem (3.5.5), pp. 72–73. Part (1).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kisin-potentially-bt-lifting"></a>

### Kisin's potentially Barsotti–Tate lifting theorem

**Theorem** · `GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`.

**Planet:** Kisin's potentially Barsotti–Tate lifting theorem.

Let p>2, F totally real and ρ:G_{F,S}→GL₂(E) continuous with absolutely irreducible residual representation. If ρ is strongly residually modular, every v|p where ρ is not potentially ordinary has residue field 𝔽_p, and ρ̄|G_{F(ζ_p)} is absolutely irreducible, then ρ is modular, subject when p=5 and proj ρ̄ has image PGL₂(𝔽₅) to the extra condition that its kernel does not fix F(ζ₅).

**Hypotheses and conventions.**

- The residue-field condition in (1) comes from the connectedness result Kisin (2.5.6); Kisin notes that Gee removed it, which was not read here, so it is kept.

**Proof plan.**

1. Base change (solvable-base-change-reduction; Kisin (3.5.2), (3.5.3)): arrange [F : ℚ] even, f and ρ with matching types at 𝔭 | p, unipotent ramification away from p on both sides with the same characters, and f unramified outside Σ.
2. After the base changes in Kisin (3.5.5), arrange that an ordinary residual local representation is indecomposable or trivial (condition (iii), DVI p. 73). Then the ordinary component is unique in that setup. In general, matching ordinarity alone is insufficient: for split distinct unramified residual characters also match the ordinary quotient character (equivalently, with fixed determinant, the cyclotomic line). Choose each B_v by this refined condition and verify both ρ and ρ_f lie on it.
3. component-patching gives modularity of ρ over the base-changed field; descend.

**Prerequisites.** [`GL2ModularityLifting:R22.5/component-patching`](#r22-5-component-patching); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `GlobalGaloisDeformations:R04.5/image-hypotheses`; `LocalGaloisDeformationRings:R08.4`; `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`; `SerreWeightAndLevelOptimisation:R20.6`; `AutomorphicGaloisRepresentations:R19.6`; `LocalGaloisDeformationRings:R08.4/rank-two-bt-components`; [`GL2ModularityLifting:R22.5/strong-residual-modularity`](#r22-5-strong-residual-modularity).

**Acceptance checks.**

- An elliptic curve over ℚ that acquires good reduction over a wildly ramified extension of ℚ_3: its 3-adic Tate module is potentially Barsotti–Tate at 3, the case Kisin's abstract singles out.
- Matching ordinary components requires the residual-character refinement or the source's indecomposable/trivial condition.
- Potentially semistable non-crystalline lifts of weight two with an ordinary Steinberg component at p are outside the potentially Barsotti–Tate hypothesis; KW II's case (C) covers them (kw-odd-prime-lifting).

**Sources.**

- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), (3.5.4)–Theorem (3.5.5), pp. 72–73. Part (1).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kisin-nonordinary-pbt-lifting"></a>

### Kisin's nonordinary potentially Barsotti–Tate theorem

**Theorem** · `GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`.

Let p>2 and F be totally real. Let ρ:G_{F,S}→GL₂(E) be continuous, potentially Barsotti–Tate and not potentially ordinary at every v|p, each such v having residue field 𝔽_p. Suppose det ρ is cyclotomic times finite order, ρ̄ is the residual representation of a parallel-weight-two Hilbert eigenform, and ρ̄|G_{F(ζ_p)} is absolutely irreducible with the same p=5 projective-image condition as kisin-potentially-bt-lifting. Then ρ is modular.

**Hypotheses and conventions.**

- (2) uses local–global compatibility at p for the level-changed form ([Sa] in Kisin), requested from AutomorphicGaloisRepresentations R19.6.
- Part (2) replaces 'strongly residually modular' by residual modularity in parallel weight 2, using a level change to a form cuspidal at p (Kisin (3.1.6)) and the fact that an irreducible Weil–Deligne type at p forces non-ordinarity.

**Proof plan.**

1. (2): after base change f may be taken unramified or special of conductor 1 at 𝔭 | p; Jacquet–Langlands and (3.1.6) give f′ cuspidal at every 𝔭 | p, whose ρ_{f′}|G_{F_𝔭} is not potentially ordinary, so ρ is strongly residually modular.
2. Apply kisin-potentially-bt-lifting to the resulting strongly residually modular representation and descend.

**Prerequisites.** [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); `SerreWeightAndLevelOptimisation:R20.6`; `AutomorphicGaloisRepresentations:R19.6`.

**Acceptance checks.**

- Every place above p must be nonordinary; one ordinary place is outside this statement.
- The residue-field condition 𝔽_p remains imposed at every v|p.
- The modular witness need not initially have matching local types; the level-change input must construct one.

**Sources.**

- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75. Part (3), Corollary (3.5.8).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kisin-pbt-lifting-over-q"></a>

### Kisin's potentially Barsotti–Tate theorem over ℚ

**Theorem** · `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`.

Let p>2 and ρ:G_{ℚ,S}→GL₂(E) be continuous, potentially Barsotti–Tate at p, with determinant cyclotomic times finite order. If ρ̄ is modular and its restriction to G_{ℚ(√p*)} is absolutely irreducible, then ρ is modular.

**Hypotheses and conventions.**

- Part (3) uses Diamond's potentially ordinary modular lift in the potentially ordinary case ([Di 1, 6.4] in Kisin), which is requested with the level and type changes from SerreWeightAndLevelOptimisation R20.6.

**Proof plan.**

1. (3): if ρ|G_{ℚ_p} is irreducible use (2); otherwise ρ is potentially ordinary and Diamond's lift makes ρ strongly residually modular.
2. The nonordinary case uses kisin-nonordinary-pbt-lifting; the ordinary case uses Diamond's lift and kisin-potentially-bt-lifting.

**Prerequisites.** [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting); [`GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`](#r22-5-kisin-nonordinary-pbt-lifting); `SerreWeightAndLevelOptimisation:R20.6`.

**Acceptance checks.**

- At p=3 the quadratic field in the irreducibility condition is ℚ(√−3).
- A weight-two potentially semistable noncrystalline Steinberg lift is not potentially Barsotti–Tate.
- The residue-field condition is automatic over ℚ; the ordinary and nonordinary proof branches are distinct.

**Sources.**

- [`KISIN-FFLAT-2009`](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75. Part (3), Corollary (3.5.8).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-5-kw-i-theorem-4-1-odd-prime"></a>

### KW I Theorem 4.1(2): modularity lifting over ℚ for odd p

**Theorem** · `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`.

**Planet:** KW I Theorem 4.1 for odd p.

Let p > 2 and ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a finite field of characteristic p, with ρ̄|_{ℚ(μ_p)} absolutely irreducible, and assume that ρ̄ is modular. Let ρ be a lift of ρ̄ to a p-adic representation, unramified outside a finite set of primes, that is either (i) crystalline of weight k at p with 2 ≤ k ≤ p + 1, or (ii) potentially semistable at p of weight 2. Then ρ is modular. This is an output of R22.5. Its proof, KW II §10.2, uses Theorem 9.7 (R22.5/kw-odd-prime-lifting), the weight part of Serre's conjecture and, for the cases outside Theorem 9.7, lifting theorems from the literature; it uses neither potential modularity (KW II Theorem 6.1) nor finiteness of deformation rings (KW II Theorem 10.1).

**Hypotheses and conventions.**

- Weight k means Hodge–Tate weights (k − 1, 0). The lift is odd because ρ̄ is and p is odd.
- Cases given by Theorem 9.7 (KW II §10.2, Remark): (i) for 2 ≤ k ≤ p, and for k = p + 1 when k(ρ̄) = p + 1 (type (A)); (ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2, that is, crystalline over ℚ_p^{nr}(μ_p) (type (B)) or semistable non-crystalline (type (C)).
- Cases KW II take from the literature: (i) with k = p + 1 and k(ρ̄) = 2 (Kisin's Durham paper when the lift is non-ordinary at p, Diamond's Annals paper when it is ordinary); (ii) potentially Barsotti–Tate (Kisin, R22.5/kisin-pbt-lifting-over-q); and the semistable weight-two case 'goes back to' Wiles, Taylor–Wiles and Diamond. For k ≤ p − 1 they also cite Diamond–Flach–Guo, which Theorem 9.7 covers again.
- Case (ii) is covered completely. A potentially semistable lift of weight 2 is either potentially crystalline, hence potentially Barsotti–Tate (Kisin's theorem), or its Weil–Deligne representation has N ≠ 0; then ρ|_{D_p} is the twist of a semistable non-crystalline representation by a character η of finite order on inertia, η|_{I_p} is the restriction of a Dirichlet character of p-power conductor, and twisting ρ and ρ̄ by its inverse preserves the hypotheses and the conclusion and gives type (C). KW II do not print this reduction.
- Not planned in this packet and recorded as a gap: case (i) with k = p + 1 and k(ρ̄) = 2 for a lift non-ordinary at p (Kisin's Durham paper).
- PotentialModularityAndCompatibleSystems R24.4 is a consumer layer for this theorem: its nodes R24.4/kw-theorem-4-1 and R24.4/alpha-beta-from-residual-modularity bind the exports of R22.5 and R22.6 to KW I's hypotheses, and that packet requests the full Theorem 4.1(2) from R22.5. This node is that export. The request includes k = p + 1 with residual weight 2; for a lift non-ordinary at p that case is the gap recorded here.

**Proof plan.**

1. Residual input. ρ̄ modular gives (α) and (β) over every soluble totally real F unramified at p on which ρ̄ stays absolutely irreducible (R22.5/alpha-beta-from-modularity-over-q).
2. Base change. Choose an allowable F/ℚ (R22.1/allowable-base-change-existence), split at p when ρ̄|_{D_p} is irreducible or k(ρ̄) = p + 1, over which ρ|_{G_F} has the uniform shape that the proof of Theorem 9.7 starts from (R22.5/solvable-base-change-reduction).
3. Theorem 9.7 (R22.5/kw-odd-prime-lifting) makes ρ|_{G_F} modular in the cases of types (A), (B), (C).
4. Descent along the soluble tower returns to ℚ (GL2AutomorphicRepresentationsAndTransfer R17.4, through R22.5/solvable-base-change-reduction).
5. Remaining cases: potentially crystalline lifts of weight 2 are potentially Barsotti–Tate and are R22.5/kisin-pbt-lifting-over-q; potentially semistable lifts with N ≠ 0 are reduced to type (C) by a twist by a Dirichlet character of p-power conductor; ordinary crystalline lifts of weight p + 1 with k(ρ̄) = 2 are covered by the ordinary lifting theorem (OrdinaryAutomorphicFormsAndModularityLifting R21.4, requested; KW II cite Diamond for this case); the non-ordinary lifts of weight p + 1 with k(ρ̄) = 2 are the gap.

**Prerequisites.** [`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`](#r22-5-alpha-beta-from-modularity-over-q); [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change); [`GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`](#r22-5-kisin-pbt-lifting-over-q); `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- p = 3, ρ the 3-adic Tate module of 11a1: crystalline of weight 2, residual image GL₂(𝔽₃), absolutely irreducible over ℚ(μ₃); the theorem recovers its modularity through type (A).
- Crystalline of weight p + 2 is outside (i).
- The Tate module of an elliptic curve with additive, potentially multiplicative reduction at p ≥ 5: potentially semistable with N ≠ 0, and its quadratic twist has multiplicative reduction, type (C).

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. The proof of KW I Theorem 4.1 ends with Theorem 9.7; neither Theorem 6.1 nor Theorem 10.1 is used.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. The cases taken from the literature and the cases proved in KW II.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, Remark, p. 92. Exactly which cases Theorem 9.7 gives.
- [`KW1-2009`](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 4.1, p. 7. The residual hypothesis of KW I Theorem 4.1; part 2 is the statement for p > 2.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Lifting`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6"></a>

## R22.6. Dyadic lifting and Kisin's completion

Keep oddness on the lift, then construct the torus action, its 2-torsion torsor, the power-series presentation, regular generic fibre and faithful patched module. These are separate steps before generic-fibre R = T and the dyadic KW lifting theorem. Kisin's potentially Barsotti–Tate component criterion has its own hypotheses and supplies Hypothesis (H); it does not prove general regular de Rham lifting. KW I Theorem 4.1(1) is an export of this layer.

<a id="r22-6-dyadic-oddness"></a>

### Oddness in residue characteristic two

**Lemma** · `GL2ModularityLifting:R22.6/dyadic-oddness`.

Let p = 2, c a complex conjugation and ρ : G_F → GL_2(𝒪) a lift of ρ̄. Residual oddness det ρ̄(c) = −1 = 1 carries no information. The lift is odd at c, in the sense of KW II (ρ(c) has characteristic polynomial X² − 1), if and only if det ρ(c) = −1. If ρ̄(c) ≠ 1 then every lift is odd at c, but an odd lift can have ρ̄(c) = 1 (for example ρ(c) = diag(1, −1)). So oddness at p = 2 is a condition on the lift, imposed by the archimedean local ring, and not a property of ρ̄(c).

**Hypotheses and conventions.**

- The archimedean ring of odd lifts is LocalGaloisDeformationRings R08.6/export-archimedean: formally smooth when ρ̄(c) ≠ 1, and 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁) when p = 2 and ρ̄(c) = 1.

**Proof plan.**

1. ρ(c)² = 1 in characteristic 0 gives eigenvalues in {±1}. det ρ(c) = −1 forces {1, −1}, hence characteristic polynomial X² − 1; conversely X² − 1 has determinant −1.
2. If ρ̄(c) ≠ 1 then ρ(c) ≠ ±1 (both reduce to 1), so its eigenvalues are 1 and −1 and det ρ(c) = −1.
3. diag(1, −1) and 1 both reduce to the identity mod 2, so ρ̄(c) = 1 does not decide oddness.

**Prerequisites.** `LocalGaloisDeformationRings:R08.6/export-archimedean`; `GlobalGaloisDeformations:R04.6/kw-deformation-data`.

**Acceptance checks.**

- ρ(c) = (1 1; 0 −1): odd, with ρ̄(c) = (1 1; 0 1) ≠ 1.
- ρ(c) = diag(1, −1): odd, with ρ̄(c) = 1.
- ρ(c) = −1: even (det = 1), with ρ̄(c) = 1; so 'ρ̄(c) = 1' does not distinguish odd from even lifts.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §3.1, Proposition 3.3, pp. 19–20. The ring of odd lifts when ρ̄(c) is trivial.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-patched-ring"></a>

### The dyadic patched rings with torus action

**Construction** · `GL2ModularityLifting:R22.6/dyadic-patched-ring`.

**Planet:** Dyadic patching.

Let p = 2, d = 3|S|, h = |Q_n|, j = 4|S| − 1 and t the rank of GlobalGaloisDeformations R04.6/dyadic-patching-data. Patching the data (D_m, L_m, D′_m) gives B-algebra surjections B⟦x_1, …, x_{h+j+t−d}⟧ ↠ R′_∞ ↠ R_∞ ↠ R̄^{□,ψ}_S (B = R̄^{□,loc,ψ}_S), with R_∞ an 𝒪⟦y_1, …, y_{h+j}⟧-algebra and R_∞/(y_1, …, y_h) ≅ R̄^{□,ψ}_S; an R_∞-module M_∞ finite free over 𝒪⟦y_1, …, y_{h+j}⟧ with M_∞/(y_1, …, y_h) ≅ M^□ faithful over 𝕋^□_𝔪; a free action of the torus T = Hom(ℤ^t, Ĝ_m) on X′_∞ = Sp R′_∞; and d : X′_∞ → T with d(λx) = λ²d(x) and X_∞ = Sp R_∞ = d^{−1}(1).

**Hypotheses and conventions.**

- The level-n inputs (R′_n, R_n, d_n, the free twisting action of G*_n and the Δ′_{Q_n}-structure) are GlobalGaloisDeformations R04.6/dyadic-patching-data; the Hecke side and its twist action are R22.2/dyadic-twists-of-forms.
- The patching is the diagonal-subsequence argument of R22.3/arithmetic-patching-data (requested from DeformationAndDerivedPatchingAlgebra R03.5), carried out with the extra data D′_m and the determinant maps.

**Proof plan.**

1. Level-m data: D′_m with determinant morphism d_m, its determinant-one quotient D″_m, a surjection D″_m ↠ D_m with kernel contained in 𝔪_{D″_m}^m, and the D_m-module L_m. The action chunks on Sp D′_m come from the finite twisting groups. Do not identify D_m with D″_m at finite level (KW II pp. 85–86).
2. Finitely many isomorphism classes at each level; a compatible subsequence gives a projective system with limits R′_∞, R_∞, M_∞.
3. The action chunks assemble to a free T-action (GlobalGaloisDeformations R04.4/truncated-actions), and the d_m to d. The identification X_∞ = d^{−1}(1) holds because D′′_m ↠ D_m has kernel in 𝔪^m.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.dyadicPatchedRing` | constructor | R′_∞ ↠ R_∞ with 𝒪⟦y⟧-structure. |
| `TauCeti.ModularityLifting.dyadicPatchedModule` | constructor | M_∞, finite free over 𝒪⟦y_1, …, y_{h+j}⟧. |
| `TauCeti.ModularityLifting.dyadicTorusAction` | constructor | The free action of T on Sp R′_∞. |
| `TauCeti.ModularityLifting.dyadicDet_smul` | characterisation | d(λ • x) = λ² • d(x), and Sp R_∞ = d⁻¹(1). |

**Unit tests.**

- `dyadicPatched_trivial_torus` (example): For t = 0 the torus and determinant constraint are trivial in the limiting construction. This recovers the shape of ordinary module patching, not an identification between rings in characteristics 2 and p > 2.
- `dyadicDet_smul` (characterisation): d(λx) = λ²d(x).
- `dyadicTorusAction_not_free_solvable` (non-example): With solvable residual image the twisting action need not be free.

**Prerequisites.** `GlobalGaloisDeformations:R04.6/dyadic-patching-data`; `GlobalGaloisDeformations:R04.4/truncated-actions`; `GlobalGaloisDeformations:R04.4/twist-action-free`; [`GL2ModularityLifting:R22.2/dyadic-twists-of-forms`](#r22-2-dyadic-twists-of-forms); [`GL2ModularityLifting:R22.3/arithmetic-patching-data`](#r22-3-arithmetic-patching-data); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); `DeformationAndDerivedPatchingAlgebra:R03.5`.

**Consumers.**

- [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor): the torsor and regularity statements.
- [`GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`](#r22-6-kisin-dyadic-component-criterion): Kisin's version with Barsotti–Tate local rings.

**Acceptance checks.**

- For t = 0 the torus and determinant constraint are trivial in the limiting construction. This recovers the shape of ordinary module patching, not an identification between rings in characteristics 2 and p > 2.
- d(λx) = λ²d(x): twisting by a character multiplies the determinant by its square.
- The torus action is not free on the unframed rings without the non-solvable image hypothesis (GlobalGaloisDeformations R04.4/twist-action-free).

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.1.3, Proposition 9.3 (I) and its proof, pp. 83–87. Proposition 9.3 (I)(3).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-patched-torsor"></a>

### The torsor structure of the dyadic patched ring

**Lemma** · `GL2ModularityLifting:R22.6/dyadic-patched-torsor`.

In dyadic-patched-ring, let R^inv_∞ represent the orbits of the free formal torus T-action on X′_∞. The natural map R^inv_∞→R_∞ makes Sp R_∞ a T[2]-torsor over Sp R^inv_∞.

**Hypotheses and conventions.**

- The free T-action and determinant-squaring map are the data of dyadic-patched-ring; X∞ is its determinant-one fibre.

**Proof plan.**

1. Lemma 9.4: the fibre product X′_∞ ×_T T of pairs (x, λ) with d(x) = λ² is a T × T[2]-torsor over Sp R^inv_∞; (x, λ) ↦ (λ^{−1}x, λ) identifies it with X_∞ × T, and quotienting by T gives the free T[2]-action on X_∞ with quotient Sp R^inv_∞ (GlobalGaloisDeformations R04.4/determinant-twist-torsor).

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring); `GlobalGaloisDeformations:R04.4/determinant-twist-torsor`; `GlobalGaloisDeformations:R04.4/free-action-quotient`.

**Acceptance checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.1.3, Lemmas 9.4–9.6, pp. 87–88. Lemma 9.4.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-kisin-dyadic-component-criterion"></a>

### Kisin's dyadic component criterion

**Lemma** · `GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`.

Let p = 2, ρ̄ with non-solvable image, and for each v | 2 either ρ̄|G_{F_v} trivial or κ(v) = 𝔽_2. Let f be an eigenform of parallel weight 2 on the definite quaternion algebra D (unramified above 2, ramified at Σ) at level U maximal above 2, with ρ̄_f ≅ ρ̄. Suppose ρ : G_F → GL_2(𝒪) lifts ρ̄ with det ρ = χψ, is Barsotti–Tate at every v | 2, and: (1) at v ∈ Σ, ρ_f|G_{F_v} is an extension of γ_v by γ_v(1); (2) at v ∈ S ∖ Σ with v ∤ 2, π_f is unramified; (3) at v | 2, ρ_f is ordinary if and only if ρ is. Then ρ ≅ ρ_g for a Hecke eigenform g of the same level.

**Hypotheses and conventions.**

- The Barsotti–Tate local rings at v | 2 and their components (ordinary and non-ordinary, flat with the connectedness of Kisin's §§2.3–2.4) are requested from LocalGaloisDeformationRings R08.4 (p = 2) and R08.5; the rings away from 2 are R08.6/export-away-from-p.

**Proof plan.**

1. Patch as in dyadic-patched-ring with B the completed tensor product of the chosen components; component-patching and dyadic-patched-torsor apply unchanged, with T[2] acting transitively on the components of Spec R_∞[1/2].
2. The conditions (1)–(3) put ρ and ρ_f on the same component of each local ring (Kisin (2.3.13), (2.4.6), (2.5.2)–(2.5.6)); the point of ρ_f is in the support, so the point of ρ is, by the transitivity of T[2].

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor); [`GL2ModularityLifting:R22.5/component-patching`](#r22-5-component-patching); `LocalGaloisDeformationRings:R08.4`; `LocalGaloisDeformationRings:R08.6/export-away-from-p`; `LocalGaloisDeformationRings:R08.4/rank-two-bt-components`; `LocalGaloisDeformationRings:R08.5/rank-two-connected-components`; `LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2`; `LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison`.

**Acceptance checks.**

- ρ and f both non-ordinary at every v | 2 with κ(v) = 𝔽_2: covered.
- ρ ordinary and f non-ordinary at some v | 2: condition (3) fails, and the two points lie on different components.
- κ(v) = 𝔽_4 with ρ̄|G_{F_v} non-trivial is excluded (the connectedness input needs 𝔽_2 or trivial ρ̄|G_{F_v}).

**Sources.**

- [`KISIN-2ADIC-2009`](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), Proposition (3.2.9) and its proof, pp. 40–42. Proposition (3.2.9).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-kisin-dyadic-bt-lifting"></a>

### Kisin's 2-adic Barsotti–Tate lifting theorem

**Theorem** · `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`.

**Planet:** Kisin's 2-adic Barsotti–Tate theorem.

Let F be totally real and ρ : G_{F,S} → GL_2(𝒪), 𝒪 2-adic, continuous with: (1) ρ̄ modular with non-solvable image; (2) ρ|G_{F_v} potentially Barsotti–Tate for every v | 2, and det ρ = χψ with ψ a totally even character of finite order; (3) F_v = ℚ_2 at every v | 2 where ρ is potentially ordinary. Then ρ ≅ ρ_g for a Hilbert modular eigenform g of parallel weight 2 over F. For F = ℚ: if ρ is potentially Barsotti–Tate at 2, det ρ is the cyclotomic character times an even character of finite order, and ρ̄ is modular with non-solvable image, then ρ arises from a holomorphic eigenform of weight 2.

**Hypotheses and conventions.**

- The version read prints hypothesis (2) of Theorem (0.9) and Theorem (3.3.5) as 'Barsotti-Tate'; the proof treats potentially Barsotti–Tate ρ, and Theorem (0.1) over ℚ says 'potentially Barsotti–Tate' (sourceIssues GL2ModularityLifting/E1). The statement here is the potentially Barsotti–Tate one.
- The type and level changes of quaternionic eigenforms (Kisin Lemmas (3.3.1)–(3.3.4)) are requested from SerreWeightAndLevelOptimisation R20.6.

**Proof plan.**

1. Admissible extension F′/F (solvable-base-change-reduction) and a definite quaternion algebra D over F′, unramified above 2, with: unipotent inertia away from 2, nontrivial exactly at Σ; potentially ordinary places v | 2 split completely; and an eigenform f on D with ρ̄_f ≅ ρ̄|G_{F′}.
2. Lemma (3.3.2): make the types of f cuspidal at the non-potentially-ordinary v | 2; Lemma (3.3.1): at the potentially ordinary v (where F_v = ℚ_2) make f potentially ordinary of type Ind θ. After a further admissible extension the types are trivial, and ρ_f is ordinary at v | 2 exactly when ρ is; also ρ̄|G_{F′_v} is trivial for v | 2.
3. At v ∈ Σ, the unramified characters of ρ_f and ρ agree after a composite of quadratic extensions. Lemma (3.3.4): make π_f unramified outside Σ; match ψ.
4. kisin-dyadic-component-criterion gives modularity over F′; descend. The case F = ℚ is Theorem (0.1).

**Prerequisites.** [`GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`](#r22-6-kisin-dyadic-component-criterion); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.6/dyadic-oddness`](#r22-6-dyadic-oddness); `SerreWeightAndLevelOptimisation:R20.6`.

**Acceptance checks.**

- The 2-adic Tate module of an elliptic curve E/ℚ with ρ̄_{E,2} of image S_3 is excluded: the image is solvable.
- An elliptic curve over a totally real F with potentially good ordinary reduction at a prime v | 2 with F_v ≠ ℚ_2 is excluded by (3).
- ψ must be totally even: det ρ = χψ with ψ odd at some real place would make ρ even there.

**Sources.**

- [`KISIN-2ADIC-2009`](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), Theorem (0.1), p. 2. The theorem over ℚ.
- [`KISIN-2ADIC-2009`](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), Theorem (3.3.5) and its proof, pp. 45–46. Theorem (3.3.5) = (0.9) over totally real F.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-hypothesis-h"></a>

### Hypothesis (H) of Khare–Wintenberger

**Theorem** · `GL2ModularityLifting:R22.6/hypothesis-h`.

**Planet:** Hypothesis (H).

Hypothesis (H) holds for p = 2: let ρ : G_ℚ → GL_2(𝒪), 𝒪 2-adic, be continuous, odd (det ρ(c) = −1), irreducible, unramified outside a finite set, of weight 2 and potentially crystalline at 2, with ρ̄ modular of non-solvable image. Then ρ is modular. This is the only prime at which KW I §9 invokes (H): in the proof of Theorem 9.1 it is applied to 2-adic members of compatible systems.

**Hypotheses and conventions.**

- Potentially crystalline of weight 2 (Hodge–Tate weights {0, 1}) is the same as potentially Barsotti–Tate: a crystalline representation of G_K with Hodge–Tate weights {0, 1} arises from a p-divisible group (Breuil for p > 2, Kisin for all p). This is requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.
- Oddness here is det ρ(c) = −1 (dyadic-oddness); irreducibility of ρ is implied by the non-solvable residual image and is not used.

**Proof plan.**

1. det ρ = χ_2·ψ with ψ of finite order: det ρ·χ_2^{−1} is a character of G_ℚ, unramified outside a finite set and of Hodge–Tate weight 0 and potentially crystalline at 2, hence finite on an open subgroup of every inertia group; since G_ℚ^{ab} ≅ ℤ̂^× is generated by the inertia groups, ψ has finite order.
2. ψ is even: χ_2(c) = −1 and det ρ(c) = −1.
3. Potentially crystalline of weight 2 gives potentially Barsotti–Tate (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4).
4. kisin-dyadic-bt-lifting over ℚ applies.

**Prerequisites.** [`GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`](#r22-6-kisin-dyadic-bt-lifting); [`GL2ModularityLifting:R22.6/dyadic-oddness`](#r22-6-dyadic-oddness); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt`.

**Acceptance checks.**

- The 2-adic Tate module of an elliptic curve E/ℚ whose mod-2 image is GL_2(𝔽_2) ≅ S_3 is outside (H): the image is solvable (the mod-2 image of any elliptic curve over ℚ lies in GL_2(𝔽_2) ≅ S_3), so KW apply (H) to 2-adic members of compatible systems with non-solvable residual image.
- An even ρ (det ρ(c) = 1) is excluded, even though its residual det ρ̄(c) = 1 = −1 looks odd.
- Weight 3 potentially crystalline ρ is outside (H): Hodge–Tate weights {0, 2} are not Barsotti–Tate.

**Sources.**

- [`KW1-2009`](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §9, Hypothesis (H) and the proof of Theorem 9.1, pp. 18–19. Hypothesis (H); the proof of Theorem 9.1 applies it to ρ′₂ and ρ₂.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-power-series-isomorphism"></a>

### The dyadic patched power-series presentation

**Lemma** · `GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`.

The surjection B[[x₁,…,x_{h+j+t−d}]]→R′∞ of dyadic-patched-ring is an isomorphism. Hence R′∞ and R^inv_∞ are 𝒪-flat domains and M∞ is faithful over R^inv_∞.

**Hypotheses and conventions.**

- B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product).
- Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (R22.2/dyadic-twists-of-forms), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

**Proof plan.**

1. Lemma 9.5: if B⟦x⟧ → R′_∞ were not injective, dim R′_∞ < h + j + t + 1, so dim R^inv_∞ < h + j + 1 (free-action-quotient), and dim R_∞ < h + j + 1 since R_∞ is finite over R^inv_∞. This contradicts the faithful action of 𝒪⟦y_1, …, y_{h+j}⟧, of dimension h + j + 1, on the finite module M_∞ through R_∞.
2. If the action of the domain R^inv_∞ on M∞ factored through a proper quotient, its dimension would fall, contradicting faithful action of 𝒪[[y₁,…,y_{h+j}]] on a finite module. Retain all dimension and finiteness hypotheses of KW II Lemma 9.5.

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring); [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor); `GlobalGaloisDeformations:R04.4/free-action-quotient`; `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`.

**Acceptance checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.5 and following paragraph, p.87. Power-series presentation and its immediate consequences.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-generic-fibre-regular"></a>

### Regularity of the dyadic patched generic fibres

**Lemma** · `GL2ModularityLifting:R22.6/dyadic-generic-fibre-regular`.

In the dyadic patching setup R∞[1/2] and R^inv_∞[1/2] are regular.

**Hypotheses and conventions.**

- B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product).
- Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (R22.2/dyadic-twists-of-forms), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

**Proof plan.**

1. Lemma 9.6(a): R^inv_∞ → R′_∞ ≅ B⟦x⟧ is formally smooth, so R^inv_∞[1/2] is regular, and R^inv_∞[1/2] → R_∞[1/2] is étale.

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`](#r22-6-dyadic-power-series-isomorphism); [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor); `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`.

**Acceptance checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.6, p. 88. Lemma9.6(a).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-patched-module-faithful"></a>

### Faithfulness of the dyadic patched module

**Lemma** · `GL2ModularityLifting:R22.6/dyadic-patched-module-faithful`.

In the dyadic patching setup, with the compatible quadratic-twist actions on the finite-level modular forms, M∞ is a faithful R∞-module.

**Hypotheses and conventions.**

- B is a domain of dimension d + 1 with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings R08.6/export-completed-tensor-product).
- Faithfulness over R_∞ uses the action of T[2](𝒪) ≅ (±1)^t by twists on the modular forms at every level (R22.2/dyadic-twists-of-forms), compatible with its action on 𝒪⟦y⟧ by χ·y_i = χ(δ_i)(1 + y_i) − 1 (KW II Lemma 5.12).

**Proof plan.**

1. Lemma 9.6(b): Supp M_∞[1/2] contains a component of Spec R_∞[1/2]; T[2](𝒪) acts transitively on these components (R^inv_∞[1/2] is a regular domain) and preserves the support (the twist compatibility at each level), so the support is everything (DeformationAndDerivedPatchingAlgebra R03.6/support-group-transitive).
2. Since R∞ and M∞ are 𝒪-flat, generic-fibre faithfulness gives integral faithfulness. Formalise that R∞ is finite flat over R^inv_∞ through the T[2]-torsor and that its generic-fibre components are permuted transitively.

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor); [`GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`](#r22-6-dyadic-power-series-isomorphism); [`GL2ModularityLifting:R22.6/dyadic-generic-fibre-regular`](#r22-6-dyadic-generic-fibre-regular); [`GL2ModularityLifting:R22.2/dyadic-twists-of-forms`](#r22-2-dyadic-twists-of-forms); `DeformationAndDerivedPatchingAlgebra:R03.6/support-group-transitive`.

**Acceptance checks.**

- t = 0: the torsor is trivial and R_∞ = R^inv_∞.
- t = 1: R_∞ is finite flat of degree 2 over R^inv_∞, and Spec R_∞[1/2] has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 9.6, p. 88. Lemma9.6(b), p.88.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-dyadic-r-equals-t"></a>

### R = T after inverting 2

**Theorem** · `GL2ModularityLifting:R22.6/dyadic-r-equals-t`.

In the situation of dyadic-patched-ring (p = 2, ρ̄ with non-solvable image), R̄^{□,ψ}_S is finite over 𝒪⟦y_{h+1}, …, y_{h+j}⟧, R̄^ψ_S is finite over 𝒪, and the surjection π : R̄^{□,ψ}_S → 𝕋^□_ψ(U)_𝔪 has 2-power torsion kernel.

**Hypotheses and conventions.**

- The Auslander–Buchsbaum step (Kisin's Lemma 3.3.4) is requested from DeformationAndDerivedPatchingAlgebra R03.3, as for R22.3.

**Proof plan.**

1. R_∞ injects into End_{𝒪⟦y⟧}(M_∞), which is finite over 𝒪⟦y⟧; so R_∞ is finite over 𝒪⟦y⟧ and its quotients R̄^{□,ψ}_S = R_∞/(y_1, …, y_h) and R̄^ψ_S = R_∞/(y_1, …, y_{h+j}) are finite over 𝒪⟦y_{h+1}, …⟧ and 𝒪.
2. On each connected component of Spec R_∞[1/2] (regular, dyadic-patched-torsor) the corresponding summand of M_∞[1/2] is finite projective, nonzero by faithfulness; so M_∞[1/2] is faithful and projective over R_∞[1/2], and its reduction mod (y_1, …, y_h) is faithful over R̄^{□,ψ}_S[1/2].
3. Generic-fibre faithfulness makes the map to 𝕋^□ injective after inverting 2, so the integral kernel is contained in the 2-power torsion ideal. Conversely, torsion-in-kernel puts that ideal in the kernel since the Hecke module is 𝒪-torsion-free. Apply r-equals-t-torsion-free-quotient. The lemma torsion-in-kernel alone proves only the converse containment.

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-patched-torsor`](#r22-6-dyadic-patched-torsor); [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); `DeformationAndDerivedPatchingAlgebra:R03.6/torsion-in-kernel`; `DeformationAndDerivedPatchingAlgebra:R03.3`; `DeformationAndDerivedPatchingAlgebra:R03.6/r-equals-t-torsion-free-quotient`; [`GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`](#r22-6-dyadic-power-series-isomorphism); [`GL2ModularityLifting:R22.6/dyadic-generic-fibre-regular`](#r22-6-dyadic-generic-fibre-regular); [`GL2ModularityLifting:R22.6/dyadic-patched-module-faithful`](#r22-6-dyadic-patched-module-faithful).

**Acceptance checks.**

- If R̄^{□,ψ}_S is 𝒪-flat the kernel vanishes and R̄^{□,ψ}_S ≅ 𝕋^□; in general DeformationAndDerivedPatchingAlgebra R03.6/r-equals-t-torsion-free-quotient gives the torsion-free quotient version.
- The kernel may be nonzero integrally, but every element in it is killed by a power of 2; non-torsion kernel elements are excluded.
- The finiteness of R̄^ψ_S here is at the level of KW II's lifting data; the finiteness for arbitrary local rings (KW II Theorem 10.1) is later, in PotentialModularityAndCompatibleSystems.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition 9.3 (II)–(III) and the end of its proof, pp. 84 and 88–89. Proposition 9.3 (III).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-kw-dyadic-lifting"></a>

### The Khare–Wintenberger 2-adic lifting theorem

**Theorem** · `GL2ModularityLifting:R22.6/kw-dyadic-lifting`.

**Planet:** Khare–Wintenberger 2-adic lifting theorem.

Let p = 2 and F totally real, unramified at 2 and split at 2 if ρ̄|D_2 is irreducible, with ρ̄_F = ρ̄|G_F of non-solvable image, satisfying (α) if k(ρ̄) = 2, and (β). Let ρ_F : G_F → GL_2(𝒪) lift ρ̄_F, be ramified at finitely many places and totally odd, and at every place above 2 be either crystalline of weight 2, or semistable non-crystalline of weight 2 (the latter only when ρ̄ is not finite at the places above 2). Then ρ_F is modular. This is the 2-adic lifting result KW I Theorem 4.1(1) needs, with residual input (α), (β) in place of 'ρ̄ modular'; Theorem 4.1(1) itself is R22.6/kw-i-theorem-4-1-dyadic.

**Hypotheses and conventions.**

- F is totally real and ρ̄ : G_F → GL_2(𝔽) is as in KW II §8, with lifting data and determinant character ψ (GlobalGaloisDeformations R04.6/kw-deformation-data; the local conditions are LocalGaloisDeformationRings R08.6/kw-local-conditions).
- Oddness is imposed on the lift, through the archimedean rings of odd lifts (dyadic-oddness); it cannot be read off ρ̄(c).
- The local rings at 2 and the twisting calculations are LocalGaloisDeformationRings R08.6 (export-semistable-weight-two-at-p, export-fontaine-laffaille-irreducible at p = 2) and R08.5 (requested).

**Proof plan.**

1. Allowable base change (solvable-base-change-reduction), as for odd p, so that ρ_F prescribes lifting data and ψ and is an 𝒪-point of R̄^{□,ψ}_S; the non-solvable image survives by linear disjointness.
2. R22.1/theorem-8-4-prescribed-modular-lifts (KW II Theorem 8.4) gives π′ fitting the same lifting data.
3. dyadic-r-equals-t: R̄^{□,ψ}_S[1/2] ≅ 𝕋^□[1/2], so ρ_F is modular; descend along the solvable extension.

**Prerequisites.** [`GL2ModularityLifting:R22.6/dyadic-r-equals-t`](#r22-6-dyadic-r-equals-t); [`GL2ModularityLifting:R22.6/dyadic-oddness`](#r22-6-dyadic-oddness); [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); `LocalGaloisDeformationRings:R08.6/export-semistable-weight-two-at-p`; `LocalGaloisDeformationRings:R08.5/rank-two-connected-components`; `LocalGaloisDeformationRings:R08.5/ordinary-deformations-p2`; `LocalGaloisDeformationRings:R08.5/kisin-local-rings-p2-comparison`; [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); [`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts`](#r22-1-theorem-8-4-prescribed-modular-lifts).

**Acceptance checks.**

- ρ̄ with image SL_2(𝔽_4) ≅ A_5 satisfying (α) and (β), and a crystalline weight-two odd lift: covered.
- A lift with ρ(c) = −1 at some real place is excluded: it is even, whatever ρ̄(c) is.
- Semistable non-crystalline lifts when ρ̄ is finite at 2 are excluded by the theorem's hypothesis.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §9.2, Theorem 9.7 and its proof, pp. 89–90. Theorem 9.7, p = 2.
- [`KW1-2009`](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 4.1(1), p. 7. The form KW I states (with 'ρ̄ modular'), which is the output R22.6/kw-i-theorem-4-1-dyadic of this layer.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r22-6-kw-i-theorem-4-1-dyadic"></a>

### KW I Theorem 4.1(1): 2-adic modularity lifting over ℚ

**Theorem** · `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic`.

**Planet:** KW I Theorem 4.1 at p = 2.

Let ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a finite field of characteristic 2, have non-solvable image, and assume that ρ̄ is modular. Let ρ be an odd lift of ρ̄ to a 2-adic representation, unramified outside a finite set of primes, that is either crystalline of weight 2 at 2, or semistable of weight 2 at 2, the latter case being considered only when k(ρ̄) = 4. Then ρ is modular. This is an output of R22.6, proved as in KW II §10.2 from Theorem 9.7 at p = 2 (R22.6/kw-dyadic-lifting) and the weight part of Serre's conjecture, with no use of potential modularity or of finiteness of deformation rings.

**Hypotheses and conventions.**

- Oddness is a hypothesis on the lift: det ρ(c) = −1. It cannot be read off ρ̄ in characteristic 2 (R22.6/dyadic-oddness).
- k(ρ̄) = 4 exactly when ρ̄ is not finite at 2; this matches the condition of Theorem 9.7 that the semistable non-crystalline case is considered only when the residual representation is not finite at the places above 2.
- The residual input over ℚ is 'ρ̄ modular'; it gives (β), and (α) when k(ρ̄) = 2, by R22.5/alpha-beta-from-modularity-over-q.
- KW II remark that some results towards this statement are due to Dickinson; they are not used.

**Proof plan.**

1. (β), and (α) if k(ρ̄) = 2, over every soluble totally real F unramified at 2 on which the image stays non-solvable (R22.5/alpha-beta-from-modularity-over-q).
2. An allowable F/ℚ (R22.1/allowable-base-change-existence) over which ρ|_{G_F} has the shape required at the start of the proof of Theorem 9.7 (R22.5/solvable-base-change-reduction); the non-solvable image is preserved.
3. Theorem 9.7 at p = 2 (R22.6/kw-dyadic-lifting): ρ|_{G_F} is modular.
4. Descent to ℚ along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4).

**Prerequisites.** [`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`](#r22-5-alpha-beta-from-modularity-over-q); [`GL2ModularityLifting:R22.6/kw-dyadic-lifting`](#r22-6-kw-dyadic-lifting); [`GL2ModularityLifting:R22.6/dyadic-oddness`](#r22-6-dyadic-oddness); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.1/allowable-base-change-existence`](#r22-1-allowable-base-change-existence); [`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`](#r22-1-alpha-beta-under-allowable-base-change); `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- ρ̄ with image SL₂(𝔽₄) ≅ A₅, modular, and an odd crystalline lift of weight 2: covered.
- A semistable non-crystalline lift when ρ̄ is finite at 2 (k(ρ̄) = 2) is not covered.
- An even lift is not covered, whatever ρ̄(c) is.

**Sources.**

- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. The proof of KW I Theorem 4.1 ends with Theorem 9.7; neither Theorem 6.1 nor Theorem 10.1 is used.
- [`KW2-2009`](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §10.2, p. 92. From 'ρ̄ modular' to (α) and (β); [27] is Gross, [12] Coleman–Voloch.
- [`KW1-2009`](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Theorem 4.1, p. 7. The image hypothesis of KW I Theorem 4.1 at p = 2; part 1 is the statement.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/Dyadic`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1"></a>

## R32.1. Exact statement table

Separate the signed prime, weight normalization and the four proposition contracts: odd-prime residually modular, dyadic nonsolvable, residually reducible, and ordinary at three. The stable node named lifting-statement-table defines the odd-prime proposition only; the other three propositions have separate definition nodes. Compare quadratic and cyclotomic irreducibility with the actual image hypotheses, and retain all exceptional local cases for later proofs.

<a id="r32-1-hodge-tate-and-oddness-normalisation"></a>

### Normalisation of distinct Hodge–Tate weights

**Lemma** · `GL2ModularityLifting:R32.1/hodge-tate-and-oddness-normalisation`.

Use the convention HT(ε)=1. If ρ|G_{ℚ_p} is de Rham with distinct Hodge–Tate weights a<b, then ρ⊗ε^(−a) is de Rham with weights {0,k−1}, where k=b−a+1≥2.

**Hypotheses and conventions.**

- The tensor-product and cyclotomic-twist formula for de Rham Hodge–Tate weights must be supplied; the definition of Hodge type alone is not that formula.

**Proof plan.**

1. (i) Hodge–Tate weights shift by −a under ⊗ ε^{−a}.

**Prerequisites.** `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`.

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): converts the 'up to twist' conclusion into weight k

**Acceptance checks.**

- Hodge–Tate weights {3, 7} normalise to {0, 4}, so k = 5.

**Sources.**

- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Introduction, the main theorem, p. 2 (DVI). The 'distinct weights' form, normalised by (i).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-weight-of-modular-twist"></a>

### The weight of a normalised modular twist

**Lemma** · `GL2ModularityLifting:R32.1/weight-of-modular-twist`.

Suppose k,k′≥2, ρ has Hodge–Tate weights {0,k−1}, g is a cuspidal eigenform of weight k′, χ=ε^m μ with μ finite order, and ρ≅ρ_g⊗χ. Then m=0, k′=k, and ρ≅ρ_{g⊗μ}, where g⊗μ is an eigenform of weight k.

**Hypotheses and conventions.**

- ρ_g ⊗ ε^m μ has Hodge–Tate weights {m, m + k′ − 1} (AutomorphicGaloisRepresentations R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime).
- Twisting an eigenform by a Dirichlet character gives an eigenform of the same weight.
- The global finite-order Galois character corresponds to a Dirichlet character; k,k′≥2 fix the order of the two weights.

**Proof plan.**

1. (ii) Compare {m, m + k′ − 1} with {0, k − 1}: then m = 0 and k′ = k.
2. Twisting g by the Dirichlet character corresponding to μ gives the representation ρ_g⊗μ; this compatibility is an explicit outstanding input.

**Prerequisites.** [`GL2ModularityLifting:R32.1/hodge-tate-and-oddness-normalisation`](#r32-1-hodge-tate-and-oddness-normalisation); `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`.

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): converts the 'up to twist' conclusion into weight k

**Acceptance checks.**

- Weights {0,4} of a twist of a weight-five form force cyclotomic exponent zero.
- Distinct weights exclude a weight-one witness.
- A general character twist is not automatically finite order times cyclotomic without a character-classification input.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Remark 2, p. 5 (arXiv v2). DP's convention on twists.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-oddness-of-odd-residual-lift"></a>

### Oddness of a lift at odd residue characteristic

**Lemma** · `GL2ModularityLifting:R32.1/oddness-of-odd-residual-lift`.

Let ρ:G_ℚ→GL₂(𝒪) and c be complex conjugation, where 𝒪 has characteristic zero and residue characteristic p>2. If the reduction ρ̄ is odd then ρ is odd.

**Hypotheses and conventions.**

- ρ takes values in GL₂ over a valuation ring with residue characteristic p>2; determinant commutes with reduction.

**Proof plan.**

1. (iii) c² = 1 gives det ρ(c) ∈ {±1}, and its reduction det ρ̄(c) = −1 ≠ 1 when p is odd.

**Prerequisites.** `mathlib:ZMod.neg_one_ne_one`; [`GL2ModularityLifting:R22.6/dyadic-oddness`](#r22-6-dyadic-oddness).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): converts the 'up to twist' conclusion into weight k

**Acceptance checks.**

- p = 3: −1 ≠ 1 in 𝔽₃.
- p = 2: diag(1, −1) is odd and reduces to the identity (R22.6/dyadic-oddness).

**Sources.**

- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Theorem 4.7 (1), p. 15 (arXiv v4). (iii), as Tung uses it.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-p-star"></a>

### The signed prime p*

**Definition** · `GL2ModularityLifting:R32.1/p-star`.

For a natural number p define the integer p*=(-1)^((p−1)/2)·p, with natural-number subtraction and division in the exponent. For the cyclotomic applications assume p is an odd prime; identification of the quadratic subfield is a separate arithmetic theorem.

**Proof plan.**

1. Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.pStar` | constructor | The integer (-1)^((p−1)/2)·p. |
| `TauCeti.ModularityLifting.pStar_eq` | simp | pStar(p)=(-1)^((p−1)/2)·p. |
| `TauCeti.ModularityLifting.pStar_natAbs` | characterisation | The natural absolute value of pStar(p) is p, for every natural p; only the sign depends on p modulo four. |

**Unit tests.**

- `pStar_three` (example): pStar(3)=−3.
- `pStar_two_boundary` (degenerate): The arithmetic definition gives pStar(2)=2; the odd-prime quadratic-subfield assertion is not asserted at p=2.
- `pStar_five` (example): pStar(5)=5.
- `pStar_not_always_positive` (non-example): pStar(7)=−7, so replacing the signed prime by p would be wrong.

**Prerequisites.** No explicit prerequisite in the packet..

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): proves OddPrimeLifting p for every odd p
- `ClassicalSerreModularity:R33.1`: the modern proof cites (a)–(d) through Dieulefait–Pacetti Theorems 1.4–1.7

**Acceptance checks.**

- pStar(3)=−3.
- The arithmetic definition gives pStar(2)=2; the odd-prime quadratic-subfield assertion is not asserted at p=2.
- pStar(5)=5.
- pStar(7)=−7, so replacing the signed prime by p would be wrong.

**Sources.**

- [`DIEULEFAIT-PACETTI-PUBLISHED`](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), §1.2, definition immediately before Theorem1.4, published p.4. The Legendre-symbol sign equals (-1)^((p−1)/2); the arithmetic definition also has an explicitly non-theorem boundary value at p=2.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-lifting-statement-table"></a>

### The odd-prime modularity-lifting proposition

**Definition** · `GL2ModularityLifting:R32.1/lifting-statement-table`.

For an odd prime p, OddPrimeLifting(p) is the following proposition: every continuous odd ρ:G_ℚ→GL₂(ℚ̄_p), ramified at finitely many primes, whose residual representation restricted to G_{ℚ(√p*)} is absolutely irreducible, whose restriction at p is de Rham with weights {0,k−1} for k>1, and whose residual representation is that of a cuspidal newform, is the representation of a weight-k cuspidal eigenform.

**Hypotheses and conventions.**

- Only the forms that assume ρ̄ modular are declared (R32.1/residual-modularity-forms); (c) and (d) need no residual modularity.
- 'de Rham', Hodge–Tate weights and p-adic Hodge types are LocalGaloisDeformationRings R08.3/hodge-and-galois-types; ρ_g is de Rham at p with Hodge–Tate weights {0, k − 1} by AutomorphicGaloisRepresentations R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime.
- A residual modularity witness is actual eigenform data, as in R22.1/minimal-level-data.

**Proof plan.**

1. Define this proposition; its proof is odd-prime-statement-over-q, not an assumption inside the proposition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.OddPrimeLifting` | structure | For an odd prime p, OddPrimeLifting(p) is the following proposition: every continuous odd ρ:G_ℚ→GL₂(ℚ̄_p), ramified at finitely many primes, whose residual representation restricted to G_{ℚ(√p*)} is absolutely irreducible, whose restriction at p is de Rham with weights {0,k−1} for k>1, and whose residual representation is that of a cuspidal newform, is the representation of a weight-k cuspidal eigenform. |
| `TauCeti.ModularityLifting.oddPrimeLifting_apply` | projection | A proof of OddPrimeLifting(p) applied to a representation, k and every listed hypothesis produces a weight-k modularity witness. |
| `TauCeti.ModularityLifting.oddPrimeLifting_iff` | characterisation | The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained. |

**Unit tests.**

- `oddPrimeLifting_includes_three` (degenerate): The proposition at p=3 uses ℚ(√−3)=ℚ(ζ₃) and has no p≥5 restriction.
- `oddPrimeLifting_requires_residual_witness` (non-example): Residual oddness alone is not a witness for the residual modularity hypothesis.
- `oddPrimeLifting_weight_two` (example): At k=2 the Hodge–Tate hypothesis is exactly the weight multiset {0,1}.

**Prerequisites.** `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); [`GL2ModularityLifting:R32.1/p-star`](#r32-1-p-star).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): proves OddPrimeLifting p for every odd p
- `ClassicalSerreModularity:R33.1`: the modern proof cites (a)–(d) through Dieulefait–Pacetti Theorems 1.4–1.7

**Acceptance checks.**

- (a) is stated at p = 3: none of its hypotheses restricts p ≥ 5.
- (c) is stated only for p ≥ 5. At p = 3 the case ρ̄^{ss} ≅ 1 ⊕ χ̄₃ is (d); Pan's Theorem 1.0.2 excludes it (R32.5).
- A statement that assumes only that ρ̄ is odd, and takes its modularity from Khare–Wintenberger, is not in the table.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.4, p. 4 (arXiv v2). Statement (a).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-quadratic-cyclotomic-irreducibility"></a>

### Irreducibility over ℚ(√p*) is irreducibility over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13)

**Lemma** · `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`.

Let p be an odd prime and ρ̄ : G_ℚ → GL₂(𝔽̄_p) continuous and odd. Then ρ̄|G_{ℚ(√p*)} is irreducible if and only if ρ̄|G_{ℚ(ζ_p)} is irreducible. The coefficients are algebraically closed, so irreducible means absolutely irreducible. Statement (a) of the table therefore agrees with the hypothesis 'ρ̄|G_{ℚ(ζ_p)} absolutely irreducible' used by Kisin, Hu–Tan and Tung.

**Hypotheses and conventions.**

- Dickson's classification of the finite subgroups of PGL₂(𝔽̄_p) is cited from its owner, ArithmeticGaloisRepresentations R01.4/dickson-classification-and-the-dyadic-refinement. The mixed KW I §6 node of ClassicalSerreModularity R27.1 is not a prerequisite, so this layer of the modern route does not rest on R27.1.
- For p = 3, ℚ(√−3) = ℚ(ζ₃) and there is nothing to prove.

**Proof plan.**

1. (2) ⇒ (1): ℚ(√p*) ⊂ ℚ(ζ_p).
2. Converse, for p ≥ 5 and ρ̄ irreducible (otherwise both conditions fail). If H = ρ̄(G_{ℚ(ζ_p)}) is reducible, then H lies in a Borel subgroup and G/H is cyclic, where G = Im ρ̄. So G is solvable: it lies in a Borel subgroup (excluded), in the normaliser N of a split torus T, or its projective image is A₄ or S₄.
3. Case N. Since the finite image in the torus normaliser has order prime to p, Maschke's theorem makes reducible H a sum of characters. If H were scalar, G/H cyclic would make G generated by scalars and one matrix and hence reducible. Otherwise H has two distinct character lines. Normality makes G permute this pair. In this H-eigenbasis, H lies in the diagonal torus T_H. The permutation character G→S₂ factors through the cyclic cyclotomic quotient, so its kernel contains the square subgroup; hence the image of G_{ℚ(√p*)} lies in T_H and is reducible. The originally chosen torus need not contain H; see source issue E9.
4. Case A₄ or S₄. Since p ∤ 24, the reducible H is a sum of two characters, so its projective image is an abelian normal subgroup with cyclic quotient. S₄ has no such subgroup. For A₄ it would be the Klein group, but the image of T in PGL₂(𝔽̄_p) has only one element of order 2.

**Prerequisites.** [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`; [`GL2ModularityLifting:R32.1/p-star`](#r32-1-p-star).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): converts DP's hypothesis into the one Kisin, Hu–Tan and Tung assume

**Acceptance checks.**

- p = 3: trivial.
- Bad dihedral: ρ̄ = Ind_{ℚ(√p*)}^{ℚ} θ is reducible on both fields.
- The case A₄/S₄ uses p ∤ 24, that is p ≥ 5.
- For A=diag(1,−1) and W=(0 1;1 0) in characteristic >2, G=⟨A,W⟩ has order 8 and H=⟨−I,W⟩ is normal with cyclic quotient, although H is not in the original diagonal torus. The H-eigenbasis is essential.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Lemma 1.13, p. 8 (arXiv v2). The statement.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 1.13, p. 8 (arXiv v2). The easy implication is literal. The converse is repaired using H's character lines, not the false normal-subgroup assertion (E9); its representation-theoretic ingredients remain a closure gap.
- [`DIEULEFAIT-PACETTI-PUBLISHED`](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), Lemma1.13 and proof, p.8. Version-of-record collation of E9; this sentence is corrected, not adopted.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-non-solvable-residual-image"></a>

### Consequences of non-solvable residual image

**Lemma** · `GL2ModularityLifting:R32.1/non-solvable-residual-image`.

Let ρ̄ : G_ℚ → GL₂(𝔽̄_p) be continuous with non-solvable image, for any prime p, including p = 2. Then: (i) ρ̄ is absolutely irreducible; (ii) for every finite Galois extension K/ℚ with solvable Galois group, ρ̄|G_K has non-solvable image and is absolutely irreducible; (iii) in particular ρ̄|G_{ℚ(ζ_{p^n})} is absolutely irreducible for every n, and for odd p the residual hypothesis of statement (a) holds. So the dyadic hypothesis of statement (b) survives the solvable base changes of Kisin's and Paškūnas' proofs.

**Hypotheses and conventions.**

- Solvability is Mathlib's Group.IsSolvable. Subgroups and extensions: Group.isSolvable_of_isSolvable_injective and Group.isSolvable_of_ker_le_range.

**Proof plan.**

1. A reducible subgroup of GL₂(𝔽̄_p) lies in a Borel subgroup, which is solvable; this gives (i).
2. Im(ρ̄|G_K) is normal in Im ρ̄, with quotient a quotient of Gal(K/ℚ). If it were solvable, Im ρ̄ would be solvable. Then apply (i) to ρ̄|G_K; this gives (ii).
3. ℚ(ζ_{p^n})/ℚ is abelian, and ℚ(√p*) ⊂ ℚ(ζ_p); this gives (iii).

**Prerequisites.** [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); `mathlib:Group.IsSolvable`; `mathlib:Group.isSolvable_of_ker_le_range`; `mathlib:Group.isSolvable_of_isSolvable_injective`.

**Consumers.**

- [`GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`](#r32-3-dyadic-de-rham-modularity-lifting): the dyadic hypothesis after solvable base change
- [`GL2ModularityLifting:R32.2/application-requirements`](#r32-2-application-requirements): DP Lemma 2.3 applies Theorem 1.4 at 3 to a ρ̄₃ with non-solvable image

**Acceptance checks.**

- p = 2: GL₂(𝔽₂) ≅ S₃ is solvable, so statement (b) excludes it, while SL₂(𝔽₄) ≅ A₅ is not solvable.
- The converse fails: an absolutely irreducible dihedral ρ̄ has solvable image.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.5, p. 4 (arXiv v2). The hypothesis whose consequences are recorded.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.5, p. 4 (arXiv v2). The proofs that base-change it.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-dyadic-lifting-proposition"></a>

### The dyadic modularity-lifting proposition

**Definition** · `GL2ModularityLifting:R32.1/dyadic-lifting-proposition`.

DyadicLifting is the proposition that every continuous odd ρ:G_ℚ→GL₂(ℚ̄₂), ramified at finitely many primes, de Rham at 2 with weights {0,k−1}, k>1, and with a modular residual representation of nonsolvable image, is the representation of a weight-k cuspidal eigenform.

**Proof plan.**

1. Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.DyadicLifting` | structure | The stated dyadic proposition with oddness of the lift separate from its residual image. |
| `TauCeti.ModularityLifting.dyadicLifting_apply` | projection | A proof applied to the listed representation data gives a weight-k eigenform. |
| `TauCeti.ModularityLifting.dyadicLifting_iff` | characterisation | The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained. |

**Unit tests.**

- `dyadicLifting_weight_two` (example): For k=2 the weights are {0,1}.
- `dyadicLifting_oddness_not_residual` (non-example): Determinant −1 reduces to +1 in characteristic two; residual oddness cannot replace oddness of the lift.
- `dyadicLifting_rejects_solvable_image` (non-example): A modular residual representation with dihedral image does not meet the nonsolvable-image hypothesis.

**Prerequisites.** `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): proves OddPrimeLifting p for every odd p
- `ClassicalSerreModularity:R33.1`: the modern proof cites (a)–(d) through Dieulefait–Pacetti Theorems 1.4–1.7

**Acceptance checks.**

- For k=2 the weights are {0,1}.
- Determinant −1 reduces to +1 in characteristic two; residual oddness cannot replace oddness of the lift.
- A modular residual representation with dihedral image does not meet the nonsolvable-image hypothesis.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.5, p. 4 (arXiv v2). Statement (b).

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-residually-reducible-lifting-proposition"></a>

### The residually reducible lifting proposition

**Definition** · `GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`.

For a prime p≥5, ResiduallyReducibleLifting(p) asserts: every continuous irreducible odd ρ:G_ℚ→GL₂(ℚ̄_p), ramified at finitely many primes, de Rham at p with weights {0,k−1}, k>1, and residual semisimplification χ₁⊕χ₂, is the representation of a weight-k cuspidal eigenform. No cuspidal residual modularity witness is assumed.

**Proof plan.**

1. Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.ResiduallyReducibleLifting` | structure | The stated proposition for prime p≥5. |
| `TauCeti.ModularityLifting.residuallyReducibleLifting_apply` | projection | A proof applied to all listed data yields a weight-k eigenform without a residual cuspidal modularity hypothesis. |
| `TauCeti.ModularityLifting.residuallyReducibleLifting_iff` | characterisation | The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained. |

**Unit tests.**

- `residuallyReducible_not_at_three` (non-example): The proposition's range excludes p=3.
- `residuallyReducible_at_five` (degenerate): The endpoint p=5 is included.
- `residuallyReducible_not_reducible_lift` (non-example): A reducible characteristic-zero ρ cannot be substituted for the required irreducible lift merely because its residual semisimplification is χ₁⊕χ₂.

**Prerequisites.** `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): proves OddPrimeLifting p for every odd p
- `ClassicalSerreModularity:R33.1`: the modern proof cites (a)–(d) through Dieulefait–Pacetti Theorems 1.4–1.7

**Acceptance checks.**

- The proposition's range excludes p=3.
- The endpoint p=5 is included.
- A reducible characteristic-zero ρ cannot be substituted for the required irreducible lift merely because its residual semisimplification is χ₁⊕χ₂.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.6, p. 4 (arXiv v2). Statement (c), for p ≥ 5.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-ordinary-three-lifting-proposition"></a>

### The ordinary residually reducible 3-adic proposition

**Definition** · `GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`.

OrdinaryThreeLifting asserts: a continuous irreducible odd ρ:G_ℚ→GL₂(ℚ̄₃), ramified at finitely many primes, with residual semisimplification 1⊕χ̄₃, inertia restriction at 3 of upper-triangular shape (∗ ∗;0 1), and determinant ψχ₃^(k−1) for finite-order ψ and k≥2, is the representation of a weight-k eigenform. The nontriviality of χ̄₃ on D₃ is automatic. The finite-order meaning of ψ must be retained from the cited ordinary theorem, not replaced by an unrestricted character.

**Proof plan.**

1. Define the stated predicate or arithmetic function with these precise parameters; no theorem asserting the predicate is built into its definition.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.ModularityLifting.OrdinaryThreeLifting` | structure | The stated ordinary 3-adic proposition with finite-order ψ. |
| `TauCeti.ModularityLifting.ordinaryThreeLifting_apply` | projection | A proof applied to the inertia, determinant, irreducibility and residual data gives a weight-k eigenform. |
| `TauCeti.ModularityLifting.ordinaryThreeLifting_iff` | characterisation | The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained. |

**Unit tests.**

- `ordinaryThree_cyclotomic_nontrivial` (characterisation): χ̄₃ has image containing −1≠1 on the local decomposition group at 3.
- `ordinaryThree_weight_two` (degenerate): At k=2 the determinant has form ψχ₃.
- `ordinaryThree_nonordinary_not_input` (non-example): Residual semisimplification 1⊕χ̄₃ alone does not imply the required ordinary inertia condition for the characteristic-zero lift.

**Prerequisites.** `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`; `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): proves OddPrimeLifting p for every odd p
- `ClassicalSerreModularity:R33.1`: the modern proof cites (a)–(d) through Dieulefait–Pacetti Theorems 1.4–1.7

**Acceptance checks.**

- χ̄₃ has image containing −1≠1 on the local decomposition group at 3.
- At k=2 the determinant has form ψχ₃.
- Residual semisimplification 1⊕χ̄₃ alone does not imply the required ordinary inertia condition for the characteristic-zero lift.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.7, p. 4 (arXiv v2). The statement as read with the finite-order determinant convention of the supplier; transport of the ordinary theorem is explicitly outstanding.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-residual-modularity-forms"></a>

### Which forms of the lifting theorems assume residual modularity

**Comparison** · `GL2ModularityLifting:R32.1/residual-modularity-forms`.

Each modern odd-prime lifting theorem is printed in two forms. (i) Forms that assume ρ̄ modular: Kisin's Theorem (2.2.17) (published (2.2.18)), Hu–Tan's Theorem 6.3, Tung's Theorem 4.7 and Dieulefait–Pacetti's Theorem 1.4. (ii) Forms that assume only ρ̄ odd, and take its modularity from Khare–Wintenberger's proof of Serre's conjecture: Kisin's introduction theorem, Hu–Tan's Theorem 1.4, Tung's introduction theorem, and Emerton's Theorem 1.2.4. Emerton's Theorem 1.2.4 gets promodularity from his Theorem 1.2.3, whose proof (§7.3) invokes Serre's conjecture. Only form (i) can serve in a proof of Serre's conjecture, so the statement table declares only form (i). Dieulefait–Pacetti cite the form-(ii) theorems (source issue GL2ModularityLifting/E8), but their Theorem 1.4 assumes ρ̄ modular, and its proof runs through form (i).

**Hypotheses and conventions.**

- R32.6/globalisation-dependency-audit carries the audit of the proofs. This node fixes which statements are admissible.

**Proof plan.**

1. For each paper, locate the theorem that assumes ρ̄ modular, and the step that deduces the introduction theorem from it by Khare–Wintenberger.
2. Kisin: (2.2.17) and the sentence of the introduction on Khare–Wintenberger. Hu–Tan: Theorem 6.3 and the last line of its proof. Tung: Theorem 4.7, obtained by the method of Kisin and Hu–Tan. Emerton: Theorem 1.2.3 and §7.3.

**Prerequisites.** [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); [`GL2ModularityLifting:R32.1/dyadic-lifting-proposition`](#r32-1-dyadic-lifting-proposition); [`GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`](#r32-1-residually-reducible-lifting-proposition); [`GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`](#r32-1-ordinary-three-lifting-proposition).

**Consumers.**

- [`GL2ModularityLifting:R32.6/globalisation-dependency-audit`](#r32-6-globalisation-dependency-audit): the list of admissible statements the audit checks

**Acceptance checks.**

- Hu–Tan's Theorem 1.4 is their Theorem 6.3 plus Khare–Wintenberger.
- Emerton's Corollary 1.2.2 assumes V promodular, and his route to promodularity uses Serre's conjecture, so his Fontaine–Mazur route is not used.
- Tung's Theorem 4.7 covers p = 3.

**Sources.**

- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Introduction, p. 2 (DVI). Kisin's introduction theorem takes residual modularity from Khare–Wintenberger.
- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Theorem (2.2.17) (2), p. 45 (DVI). The form that assumes ρ̄ modular.
- [`HU-TAN-2015`](https://arxiv.org/pdf/1309.1658v2), Proof of Theorem 6.3, p. 35 (arXiv v2). Theorem 1.4 is Theorem 6.3 plus Khare–Wintenberger.
- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Theorem 4.7, p. 15 (arXiv v4). Tung's form that assumes ρ̄ modular.
- [`EMERTON-LGC-2011`](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §7.3, proof of Theorem 1.2.3, p. 96. Emerton's promodularity uses Serre's conjecture.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-1-exceptional-local-cases"></a>

### The local exclusions at p in the odd-prime sources, and how they are removed

**Comparison** · `GL2ModularityLifting:R32.1/exceptional-local-cases`.

For odd p, write ρ̄_p = ρ̄|G_{ℚ_p}. The sources exclude, as printed: (i) Kisin, in the introduction theorem and in (2.2.17)(3): ρ̄_p ≅ (ωχ ∗; 0 χ) for some character χ, where ∗ may be zero; and, in the introduction theorem and (2.2.17)(1), any ρ that is not semistable over an abelian extension of ℚ_p. The latter is where his Hypothesis (1.2.6) is known (Theorem (1.2.8), from Colmez and Berger–Breuil). (ii) Kisin (1.2.7): the lattice Π of (1.2.6) is constructed for every V except, at p = 3, ρ̄_p ≅ (ω ∗; 0 1) ⊗ χ or Ind ω₂² ⊗ χ. (iii) Emerton, Theorem 1.2.1 and Corollary 1.2.2: ρ̄_p ≅ χ ⊗ (1 ∗; 0 ω), where ∗ may be zero. (iv) Paškūnas (Duke 2015): p ≥ 5 and End(ρ̄_p) scalar; his result is new only for ρ̄_p ≅ (ω ∗; 0 1) ⊗ χ. (v) Hu–Tan: p ≥ 5; new only for ρ̄_p ≅ χ ⊗ (1 ⊕ ω). (vi) Tung: p > 2 and every ρ̄_p; new for p = 3 and ρ̄_p a twist of an extension of 1 by ω. Emerton's Theorem 3.3.22 gives the locally algebraic vectors of every de Rham V with distinct weights, which removes the abelian condition in (i). Tung's Theorem 1.2, the Breuil–Mézard conjecture for every ρ̄_p and every p > 2, removes the exclusions of (i) and (ii). Pan's p = 3 exclusion, χ̄₁χ̄₂^{−1}|G_{ℚ₃} = ω, is of another kind: it is a residually reducible global case, covered by R32.5.

**Hypotheses and conventions.**

- The local theorems (Breuil–Mézard in cycle form, Colmez's functor, locally algebraic vectors) are requested from PadicLocalLanglandsForGL2Qp R30.6.

**Proof plan.**

1. Tabulate each source's exclusion with its locator.
2. For each ρ̄_p, name a source that covers it: p ≥ 5 by Kisin, Paškūnas and Hu–Tan; p = 3 by Tung.

**Prerequisites.** [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); `PadicLocalLanglandsForGL2Qp:R30.6`; [`GL2ModularityLifting:R32.1/dyadic-lifting-proposition`](#r32-1-dyadic-lifting-proposition); [`GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`](#r32-1-residually-reducible-lifting-proposition); [`GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`](#r32-1-ordinary-three-lifting-proposition).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting): why the combined theorem has no local restriction at p

**Acceptance checks.**

- p = 3, ρ̄_p = 1 ⊕ ω: excluded by (i) and (iii), covered only by (vi).
- p ≥ 5, ρ̄_p = 1 ⊕ ω: excluded by (i) and (iii), covered by (v) and (vi).
- p ≥ 5, ρ̄_p absolutely irreducible: covered by Kisin together with Emerton's Theorem 3.3.22.

**Sources.**

- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Introduction, the main theorem (2)–(4), p. 2 (DVI). Exclusion (i).
- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), (1.2.7), p. 9 (DVI). Exclusion (ii).
- [`PASKUNAS-BM-2015`](https://arxiv.org/pdf/1209.5205v3), Abstract, p. 1 (arXiv v3). Range (iv).
- [`HU-TAN-2015`](https://arxiv.org/pdf/1309.1658v2), Introduction, after Theorem 1.4, p. 5 (arXiv v2). Range (v).
- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Remark 4.8, p. 15 (arXiv v4). Range (vi).
- [`EMERTON-LGC-2011`](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), Theorem 3.3.22, p. 28. Removes the abelian condition.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/StatementTable`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2"></a>

## R32.2. Residually modular odd-prime lifting

Start with the corrected multiplicity criterion and the normalized graded-piece lower bound. Kisin's totally-split theorem is restricted by its local hypotheses. The modern odd-prime theorem uses the stated Paškūnas, Hu–Tan and Tung support inputs to address the excluded blocks, including at three. Descend to ℚ, undo the normalization and audit each application's image, local and residual-modularity requirements. The globalisation independence claim is conditional on its supplier proof leaves.

<a id="r32-2-kisin-multiplicity-criterion"></a>

### Kisin's multiplicity criterion for faithfulness of the patched module, as corrected by Gee–Kisin

**Theorem** · `GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`.

**Planet:** Kisin's multiplicity criterion.

Let p be odd and F totally real with p split completely. Let D/F be a totally definite quaternion algebra ramified at a set Σ of finite places prime to p, with N(v) ≢ −1 (mod p) for v ∈ Σ. Let M∞ be the patched module over R̄∞ = R̄^{□,ψ}_{Σ_p}[[x₁, …, x_g]], built from S_{σ,ψ}(U, 𝒪)_𝔪 with σ = ⊗_{v|p} σ(k_v, τ_v) ⊗ det^{w_v}. Here R̄_v is the ring of extensions of γ_v by γ_v(1) for v ∈ Σ, and the potentially semistable ring of type (k_v, τ_v, ψ) for v | p. Let R be the set of v ∈ S ∖ Σ_p at which ρ̄(Frob_v) has equal eigenvalues. Then M∞ is faithful over R̄∞ ⟺ e(R̄∞/π) = 2^{−|R|} e(M∞/π, R̄∞/π) ⟺ e(R̄∞/π) ≤ 2^{−|R|} e(M∞/π, R̄∞/π). When these hold, every deformation ρ of ρ̄ of the given local types (ρ|I_v an extension of γ_v by γ_v(1) at v ∈ Σ, potentially semistable of type (k_v, τ_v, ψ) at v | p) is modular.

**Hypotheses and conventions.**

- Kisin's statements are used as Gee–Kisin Appendix B corrects them: N(v) ≢ −1 (mod p) at v ∈ Σ (B.3, source issue E4); R̄_v/π irreducible and generically reduced at v ∈ Σ (B.4, E5); and the rank 2^{|R|} in place of rank one, with Lemma (2.2.1) withdrawn (B.5, E6).
- The Breuil–Mézard multiplicities, and the Hilbert–Samuel and cycle formalism, are requested from PadicLocalLanglandsForGL2Qp R30.6.
- The patching itself is R22.3 and R22.5/component-patching, with the local rings of LocalGaloisDeformationRings R08.3.
- Use the corrected Kisin §2.2 setup in Gee–Kisin B.5: for v∈S∖Σ_p, 1−N(v) is a unit and the eigenvalue ratio is not N(v)^{±1}; equal eigenvalues are allowed. Retain absolute residual irreducibility on G_{F(ζ_p)}, nonzero modular Hecke localization, the isotropy condition and the full finite-level/filtration data.

**Proof plan.**

1. Patch the modules at level U_{Q_n} as in R22.3, with the local rings R̄_v (Kisin (2.2.5)–(2.2.8)).
2. M∞ is finite flat over 𝒪[[Δ∞]], so its support is a union of components of R̄∞, each surjecting onto Spec 𝒪[[Δ∞]]. At minimal primes M∞ has rank 2^{|R|} (Gee–Kisin Lemma B.5.1, by local–global compatibility at v ∤ p and the monodromy–weight conjecture at Steinberg places).
3. Faithful ⟺ Spec 𝕋∞ = Spec R̄∞ ⟺ equality of multiplicities, since 𝕋∞ is a union of components of R̄∞.

**Prerequisites.** [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); [`GL2ModularityLifting:R22.5/component-patching`](#r22-5-component-patching); `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`; `LocalGaloisDeformationRings:R08.3/pst-generic-fibre`; `PadicLocalLanglandsForGL2Qp:R30.6`.

**Consumers.**

- [`GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`](#r32-2-kisin-fontaine-mazur-totally-split): faithfulness of M∞
- [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting): the global half of the argument Hu–Tan and Tung reuse

**Acceptance checks.**

- With R = ∅ this is Kisin's printed Lemma (2.2.10), with rank one.
- A place v ∈ Σ with N(v) ≡ −1 (mod p) is excluded (B.3). Base change reduces to N(v) ≡ 1.
- The global argument alone gives only e(𝕋∞/π) ≤ e(R̄∞/π); the reverse inequality is the local input.

**Sources.**

- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), §2.2, before Lemma (2.2.10), p. 42 (DVI). The criterion.
- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Corollary (2.2.16), p. 45 (DVI). Faithfulness from the local multiplicities.
- [`GEE-KISIN-2014`](https://arxiv.org/pdf/1208.3179v5), Appendix B, B.5, p. 39 (arXiv v5). The correction behind the 2^{|R|} version.
- [`GEE-KISIN-2014`](https://arxiv.org/pdf/1208.3179v5), Appendix B, B.3, p. 38 (arXiv v5). The condition at v ∈ Σ.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2-patched-graded-piece-bound"></a>

### The corrected multiplicity bound for patched graded pieces

**Theorem** · `GL2ModularityLifting:R32.2/patched-graded-piece-bound`.

Use the corrected Kisin §2.2 patching setup of kisin-multiplicity-criterion, and its patched weight filtration M∞^i. Write N_i=M∞^i/M∞^{i−1}. Then N_i≠0 iff μ_{n_{i,v},m_{i,v}}(ρ̄_v)≠0 for all v|p. If nonzero, every fibre on its support has dimension at least 2^{|R|}. If, in addition, no ρ̄_v is a twist of (ω ∗;0 1), then 2^(−|R|)e(N_i,R̄∞/π)≥e_Σ∏_{v|p}μ_{n_{i,v},m_{i,v}}(ρ̄_v), where e_Σ=∏_{v∈Σ}e(R̄_v/π).

**Hypotheses and conventions.**

- Kisin's statements are used as Gee–Kisin Appendix B corrects them: N(v) ≢ −1 (mod p) at v ∈ Σ (B.3, source issue E4); R̄_v/π irreducible and generically reduced at v ∈ Σ (B.4, E5); and the rank 2^{|R|} in place of rank one, with Lemma (2.2.1) withdrawn (B.5, E6).
- The Breuil–Mézard multiplicities, and the Hilbert–Samuel and cycle formalism, are requested from PadicLocalLanglandsForGL2Qp R30.6.
- The patching itself is R22.3 and R22.5/component-patching, with the local rings of LocalGaloisDeformationRings R08.3.
- Use the corrected Kisin §2.2 setup in Gee–Kisin B.5: for v∈S∖Σ_p, 1−N(v) is a unit and the eigenvalue ratio is not N(v)^{±1}; equal eigenvalues are allowed. Retain absolute residual irreducibility on G_{F(ζ_p)}, nonzero modular Hecke localization, the isotropy condition and the full finite-level/filtration data. The stronger exclusion at v|p is needed for the displayed graded-piece bound.

**Proof plan.**

1. Use Gee–Kisin Lemma B.5.2, not the uncorrected equality of Kisin Proposition (2.2.14): obtain the 2^{−|R|}-normalised lower bound under the local exclusion. B.4 supplies generic reducedness at v∈Σ. The filtration/support proof requires separate declarations, recorded as a gap.
2. The nonvanishing and support statement uses Kisin (2.2.15); the fibre bound uses an auxiliary smooth lift of the Serre weight and B.5.1; the inequality follows using generic reducedness at Σ. These named inputs are not routine and remain in the closure gap.

**Prerequisites.** [`GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`](#r32-2-kisin-multiplicity-criterion); `PadicLocalLanglandsForGL2Qp:R30.6`; `SerreWeightAndLevelOptimisation:R20.6`.

**Consumers.**

- [`GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`](#r32-2-kisin-fontaine-mazur-totally-split): faithfulness of M∞
- [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting): the global half of the argument Hu–Tan and Tung reuse

**Acceptance checks.**

- The formula is an inequality, not equality.
- The bound carries the factor 2^(−|R|).
- The local excluded extension shape is needed for the multiplicity inequality, not for the two preceding statements.

**Sources.**

- [`GEE-KISIN-2014`](https://arxiv.org/pdf/1208.3179v5), Appendix B, Lemma B.5.2 and final correction paragraph, pp. 40–41 (arXiv v5). Normalised graded-piece inequality, fibre-rank bound and local exclusion; replaces the unqualified equality.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2-kisin-fontaine-mazur-totally-split"></a>

### Kisin's Fontaine–Mazur theorem over totally split fields (Theorem (2.2.17))

**Theorem** · `GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`.

**Planet:** Kisin's Fontaine–Mazur theorem.

Let p > 2, F totally real with p totally split, and ρ : G_{F,S} → GL₂(𝒪) continuous with: (1) for every v | p, ρ|G_{F_v} becomes semistable over an abelian extension of F_v and has distinct Hodge–Tate weights; (2) ρ̄ is modular and ρ̄|G_{F(ζ_p)} is absolutely irreducible; (3) for every v | p, ρ̄|G_{F_v} ≇ (ωχ ∗; 0 χ) for all characters χ. Then ρ is modular. This is Theorem (2.2.17) of the preprint, (2.2.18) in print. The abelian condition in (1) is where Kisin's Hypothesis (1.2.6) is known (Theorem (1.2.8)). Emerton's Theorem 3.3.22 establishes (1.2.6) for every de Rham type, which removes the condition (Emerton, Remark 1.2.5).

**Hypotheses and conventions.**

- Gee's Theorem 4.4.12 of 'Automorphic lifts of prescribed types' makes ρ̄ modular of weight σ once μ_Aut ≠ 0. It is requested from SerreWeightAndLevelOptimisation R20.6.
- The choice of U and of the auxiliary primes follows Gee–Kisin B.5 (source issue E6), not Kisin's Lemma (2.2.1).
- The local inequality e(R̄_v/π) ≤ μ_Aut (Kisin §§1.6–1.7, through Colmez's functor and (1.2.6)) is requested from PadicLocalLanglandsForGL2Qp R30.6.

**Proof plan.**

1. Make a quadratic base change so that [F : ℚ] is even, and let D be the definite quaternion algebra split at all finite places.
2. The existence of ρ gives μ_Aut(k_v, τ_v, ρ̄ ⊗ ω^{−w_v}) ≠ 0 (Kisin (1.7.2), (1.7.8), (1.7.9)). Gee's theorem then makes ρ̄ modular of weight σ.
3. Kisin's local inequality e(R̄_v/π) ≤ μ_Aut and R32.2/kisin-multiplicity-criterion give faithfulness, so ρ is modular at the auxiliary level (Corollary (2.2.16)).
4. Level raising and lowering at v ∤ p, and descent by the base change arguments of Kisin's Annals §3.5 (R22.5/solvable-base-change-reduction).

**Prerequisites.** [`GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`](#r32-2-kisin-multiplicity-criterion); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R32.1/exceptional-local-cases`](#r32-1-exceptional-local-cases); `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`; `PadicLocalLanglandsForGL2Qp:R30.6`; `SerreWeightAndLevelOptimisation:R20.6`; [`GL2ModularityLifting:R32.2/patched-graded-piece-bound`](#r32-2-patched-graded-piece-bound).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting): the base change and descent that Hu–Tan's and Tung's proofs follow

**Acceptance checks.**

- F = ℚ with ρ̄ modular: this is the introduction theorem without its appeal to Khare–Wintenberger.
- Excluded: ρ̄|G_{ℚ_p} ≅ 1 ⊕ ω (χ = 1, ∗ = 0). Hu–Tan (p ≥ 5) and Tung (p = 3) cover it.
- Numbering: the published version is (2.2.18), the DVI's is (2.2.17).

**Sources.**

- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Theorem (2.2.17), p. 45 (DVI). The statement.
- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Proof of Theorem (2.2.17), p. 46 (DVI). Gee's weight result in the proof.
- [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Hypothesis (1.2.6), p. 9 (DVI). The hypothesis the abelian condition supplies.
- [`EMERTON-LGC-2011`](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), Theorem 3.3.22, p. 28. Removes the abelian condition.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2-odd-prime-de-rham-lifting"></a>

### Modularity lifting for de Rham representations at odd p (Kisin, Emerton, Paškūnas, Hu–Tan, Tung)

**Theorem** · `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`.

**Planet:** de Rham modularity lifting at odd primes.

Let p be an odd prime, F a totally real field in which p splits completely, and ρ : G_{F,S} → GL₂(𝒪) continuous with: (1) ρ̄ modular, so that ρ and ρ̄ are odd; (2) ρ̄|G_{F(ζ_p)} absolutely irreducible; (3) ρ|G_{F_v} potentially semistable with distinct Hodge–Tate weights for every v | p. Then, up to twist, ρ comes from a Hilbert modular eigenform. This is Tung's Theorem 4.7, and for p ≥ 5 Hu–Tan's Theorem 6.3. It has no local restriction at p, and it includes p = 3.

**Hypotheses and conventions.**

- The local input is the Breuil–Mézard conjecture in cycle form for every ρ̄_v and every p-adic Hodge type, for p > 2. This is Tung's Theorem 1.2; for p ≥ 5 it also follows from Kisin, Paškūnas' Theorem 1.1 and Hu–Tan. It is requested from PadicLocalLanglandsForGL2Qp R30.6, which is charged with exactly these statements.
- Tung's proof of Theorem 1.2 uses: the patched modules M∞ of [CEG+16] on definite unitary groups; Emerton–Paškūnas' faithfulness of R∞ on M∞; and, on the reducible locus, Barnet-Lamb–Gee–Geraghty's Theorem A.4.1. They are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5. Whether their globalisations avoid Serre's conjecture is not checked here (R31.6; R32.6/globalisation-dependency-audit).

**Proof plan.**

1. Breuil–Mézard for every ρ̄_v, v | p (Tung Theorem 1.2).
2. For exceptional ρ̄_v one cannot apply the nonexceptional bound in kisin-multiplicity-criterion. Hu–Tan §6 uses different local factors including semistable noncrystalline components, and proves full support in Lemma 6.1 before Proposition 6.2. The all-odd-prime conclusion is Tung Theorem 4.7 using his Breuil–Mézard/component results. These support/globalisation inputs require separate supplier contracts (recorded as a gap).
3. The general case follows by the base change arguments of Kisin's Theorem (2.2.18) (R32.2/kisin-fontaine-mazur-totally-split).

**Prerequisites.** [`GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`](#r32-2-kisin-multiplicity-criterion); [`GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`](#r32-2-kisin-fontaine-mazur-totally-split); [`GL2ModularityLifting:R32.1/exceptional-local-cases`](#r32-1-exceptional-local-cases); [`GL2ModularityLifting:R32.1/residual-modularity-forms`](#r32-1-residual-modularity-forms); `PadicLocalLanglandsForGL2Qp:R30.6`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`; [`GL2ModularityLifting:R32.2/patched-graded-piece-bound`](#r32-2-patched-graded-piece-bound).

**Consumers.**

- [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q): the case F = ℚ
- [`GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`](#r32-6-transfer-residually-irreducible-odd): the transfer along congruences at odd primes

**Acceptance checks.**

- p = 3, ρ̄|G_{ℚ₃} ≅ (ω ∗; 0 1) ⊗ χ: covered (Tung, Remark 4.8).
- p ≥ 5, ρ̄|G_{ℚ_p} ≅ χ ⊗ (1 ⊕ ω): covered (Hu–Tan).
- Non-example: ρ̄|G_{F(ζ_p)} reducible (bad dihedral) is not covered.

**Sources.**

- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Theorem 4.7, p. 15 (arXiv v4). The statement, for every odd p.
- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Theorem 1.2, p. 4 (arXiv v4). The local input.
- [`HU-TAN-2015`](https://arxiv.org/pdf/1309.1658v2), Theorem 6.3, p. 35 (arXiv v2). The p ≥ 5 statement.
- [`HU-TAN-2015`](https://arxiv.org/pdf/1309.1658v2), §6, p. 33 (arXiv v2). Kisin's §2 as corrected by Gee–Kisin.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2-odd-prime-statement-over-q"></a>

### Dieulefait–Pacetti's Theorem 1.4 holds at every odd prime, including 3

**Theorem** · `GL2ModularityLifting:R32.2/odd-prime-statement-over-q`.

OddPrimeLifting p (R32.1/lifting-statement-table (a)) holds for every odd prime p. Let ρ : G_ℚ → GL₂(ℚ̄_p) be continuous, odd and finitely ramified, with ρ̄|G_{ℚ(√p*)} absolutely irreducible, ρ|G_{ℚ_p} de Rham with Hodge–Tate weights {0, k − 1}, k > 1, and ρ̄ ≅ ρ̄_f. Then ρ ≅ ρ_g for an eigenform g of weight k. The case p = 3 is proved, not assumed.

**Hypotheses and conventions.**

- de Rham representations are potentially semistable (PadicHodgeTheory R06.3/p-adic-monodromy-theorem).

**Proof plan.**

1. ρ̄|G_{ℚ(ζ_p)} is absolutely irreducible (R32.1/quadratic-cyclotomic-irreducibility).
2. Use the finite-coefficient-field theorem for continuous representations of a profinite group into GL₂(ℚ̄_p), then existence of a stable lattice, to conjugate ρ into GL₂(𝒪) for a finite extension. This is not a consequence of compactness for arbitrary subsets of ℚ̄_p (see the closure gap). The listed p-adic monodromy theorem converts de Rham to potentially semistable.
3. Apply R32.2/odd-prime-de-rham-lifting with F = ℚ: ρ ≅ ρ_g ⊗ χ.
4. Normalise the twist (R32.1/hodge-tate-and-oddness-normalisation (ii)): ρ ≅ ρ_{g′} with g′ of weight k.

**Prerequisites.** [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting); [`GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`](#r32-1-quadratic-cyclotomic-irreducibility); [`GL2ModularityLifting:R32.1/hodge-tate-and-oddness-normalisation`](#r32-1-hodge-tate-and-oddness-normalisation); [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`; [`GL2ModularityLifting:R32.1/weight-of-modular-twist`](#r32-1-weight-of-modular-twist); [`GL2ModularityLifting:R32.1/oddness-of-odd-residual-lift`](#r32-1-oddness-of-odd-residual-lift).

**Consumers.**

- `ClassicalSerreModularity:R33.1`: every application of Dieulefait–Pacetti's Theorem 1.4
- [`GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`](#r32-6-transfer-residually-irreducible-odd): the transfer statement it rereads

**Acceptance checks.**

- p = 3: the hypothesis is over ℚ(√−3) = ℚ(ζ₃).
- k = 2 with ρ|G_{ℚ_p} semistable and not crystalline, such as the p-adic Tate module of an elliptic curve with multiplicative reduction at p: covered. This is not a potentially Barsotti–Tate case, so Kisin's Annals theorem (R22.5/kisin-potentially-bt-lifting) does not reach it.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.4 and its proof, p. 4 (arXiv v2). DP's attributions, corrected in E7 and E8.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.4, p. 4 (arXiv v2). The p = 3 case, from Tung.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-2-application-requirements"></a>

### What an application of Theorem 1.4 must verify, and where Dieulefait–Pacetti's proof applies it

**Application** · `GL2ModularityLifting:R32.2/application-requirements`.

An application of Theorem 1.4 (R32.2/odd-prime-statement-over-q) to a pair of congruent p-adic representations ρ, ρ′ of G_ℚ, p odd, has to verify the following, and nothing else. (i) Residual image: ρ̄|_{G_{ℚ(√p*)}} is absolutely irreducible; R32.1/quadratic-cyclotomic-irreducibility turns this into the ℚ(ζ_p) form, and non-solvable image implies it (R32.1/non-solvable-residual-image). (ii) Weights: both are de Rham at p with Hodge–Tate weights {0, k − 1}, k ≥ 2 (possibly different k); they need not be crystalline, and no bound on k in terms of p is required. (iii) Determinant: only oddness is needed; for det ρ = ψε^{k−1} this is ψ(c) = (−1)^k at complex conjugation c, and finite order of ψ alone does not give that parity. (iv) Ordinarity: no requirement, because the odd-prime theorem has no local restriction at p. (v) Residual modularity: one of the two is modular, or ρ̄ has solvable image and Langlands–Tunnell applies (Theorem 1.3). Dieulefait–Pacetti apply Theorem 1.4 at w in Paso 1; at q in Paso 2; at each odd p_i of the ramification set in Paso 3, which may be 3; at 3 in Lemma 2.3; at N in Paso 5; at 5 in Paso 6; and in odd characteristic in the final step. For (i) the source supplies: in Paso 1, w > 2k and Lemma 1.14 (a bad dihedral ρ̄_w needs w ∈ {2k(ρ̄) − 3, 2k(ρ̄) − 1}); in Pasos 2–3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1); in Pasos 5–6, the case split 'irreducible and not bad dihedral'. In the residually reducible case at w, Theorem 1.6 applies, since w > 2k ≥ 4 gives w ≥ 5. At p = 3 (Paso 3, Lemma 2.3) the de Rham weight-two lifts need not be potentially Barsotti–Tate and ρ̄|_{G_{ℚ₃}} may be a twist of an extension of 1 by ω; this is where Tung's p = 3 theorem is needed. The verification at each use belongs to the nodes of ClassicalSerreModularity R33.1–R33.5 that apply the theorem; they cite this node, and this node cites none of them.

**Hypotheses and conventions.**

- The compatible systems and their local behaviour at the coefficient prime are PotentialModularityAndCompatibleSystems R24.5–R24.6; the uses themselves are planned in ClassicalSerreModularity R33.1–R33.5.
- The list of uses is read from Dieulefait–Pacetti §2 and serves as a table of locators. It is not a prerequisite on the nodes of R33: the dependency runs from this layer to R33 (ClassicalSerreModularity R33.1/dp-modularity-lifting-inputs cites this node).

**Proof plan.**

1. (i)–(v) are the hypotheses of R32.2/odd-prime-statement-over-q, with the reformulations of R32.1 (quadratic versus cyclotomic irreducibility, non-solvable image, the dyadic, residually reducible and ordinary-three propositions for the neighbouring Theorems 1.5–1.7).
2. List every appeal to Theorem 1.4 in §2 (pp. 10–15) with the lemma or case split the source cites for (i).

**Prerequisites.** [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q); [`GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`](#r32-1-quadratic-cyclotomic-irreducibility); [`GL2ModularityLifting:R32.1/non-solvable-residual-image`](#r32-1-non-solvable-residual-image); [`GL2ModularityLifting:R32.1/dyadic-lifting-proposition`](#r32-1-dyadic-lifting-proposition); [`GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`](#r32-1-residually-reducible-lifting-proposition); [`GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`](#r32-1-ordinary-three-lifting-proposition).

**Consumers.**

- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`: the contract each application of Theorem 1.4 in the modern proof verifies

**Acceptance checks.**

- k = 3, w = 7: 7 ∉ {3, 5}, so ρ̄₇ is not bad dihedral.
- w > 2k ≥ 4 gives w ≥ 5, the range of Theorem 1.6.
- Lemma 2.3 is an application of Theorem 1.4 at p = 3, so the p ≥ 5 results alone would not suffice.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §2, Paso 1, p. 10 (arXiv v2). The residual-image check in Paso 1.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §2, Paso 1, p. 10 (arXiv v2). The transfer along a congruence.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Lemma 2.3, p. 13 (arXiv v2). The use at p = 3.

**Proposed library placement:** `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`, namespace `TauCeti.ModularityLifting`.

<a id="r32-3"></a>

## R32.3. Dyadic de Rham lifting

Typed local component support, separately for ordinary and nonordinary cases, is specialized to a totally real dyadic lifting theorem and then to the ℚ theorem. The nonsolvable residual image and regular Hodge–Tate weights stay in the contract. This uses the modern R30/R31 support inputs, rather than substituting the classical potentially Barsotti–Tate theorem.

<a id="r32-3-typed-component-specialisation"></a>

### Automorphy from typed dyadic component support

**Theorem** · `GL2ModularityLifting:R32.3/typed-component-specialisation`.

In Tung §§4–5, with a modular totally odd nonsolvable residual representation over a totally real F in which 2 splits completely, fixed determinant ψε, the specified Steinberg conditions away from 2, auxiliary place v₁, and a product σ of locally algebraic types, suppose the imported Theorem 8.0.1 gives support meeting every component of R∞(σ)[1/2]. Then Rˢ_ψ(σ) is finite over 𝒪 and M(σ)[1/2] is faithful over Rˢ_ψ(σ)[1/2]. Every characteristic-zero point of this global deformation problem, including the point of a prescribed lift of type σ, therefore occurs in algebraic quaternionic forms and is automorphic after Jacquet–Langlands.

**Proof plan.**

1. Use R31.5 for Tung Theorem 8.0.1, including both Theorem 6.3.7 (nonordinary components) and Theorem 7.3.1 (ordinary components); no finiteness assertion about the raw completed module is substituted.
2. Apply Tung Lemma 5.3.2 (1)–(3), with its local–global type comparison and patching/augmentation comparison. The finite module, reduced generic fibre and faithful action imply nonzero fibre at every characteristic-zero point by localization and Nakayama.
3. Identify that fibre with the finite-level algebraic σ-space using R31.2. Transfer the definite quaternionic eigenform to GL₂/F using R17.3.

**Prerequisites.** `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.2`; `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ`; `DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Acceptance checks.**

- Faithfulness of a nonfinite completed module alone is insufficient to justify nonzero fibres; the imported type-specialized finite-module argument must be used.
- Both ordinary and nonordinary components occur, including residual self-extensions at 2.

**Sources.**

- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), §5.3, Lemma 5.3.2, pp.28–29; §8, Theorem 8.0.1 p.38 and Theorem 8.0.3 with proof pp.38–39 (arXiv v3). The cited passage supplies this statement and the indicated proof route.

<a id="r32-3-totally-real-dyadic-lifting"></a>

### Tung’s totally real dyadic lifting theorem

**Theorem** · `GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`.

**Planet:** Dyadic Hilbert modularity lifting.

Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, finitely ramified, with modular totally odd residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

**Proof plan.**

1. Choose a totally real solvable extension F′/F, disjoint from the residual fixed field with ζ₂, of even degree, split at 2, killing residual ramification away from 2 and making the remaining lift inertia unipotent. Preserve nonsolvable residual image using the general-field restriction export requested from R04.4.
2. Choose the definite quaternion algebra ramified at the real places and the even set Σ of remaining ramified finite places, an auxiliary v₁ with distinct residual Frobenius eigenvalues, and the level of Tung §8. The determinant, types and Steinberg local conditions put ρ|G_F′ in the situation of typed-component-specialisation.
3. Apply that theorem and descend using solvable base change, with irreducibility guaranteed by nonsolvable residual image.

**Prerequisites.** [`GL2ModularityLifting:R32.3/typed-component-specialisation`](#r32-3-typed-component-specialisation); `GlobalGaloisDeformations:R04.4`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, finitely ramified, with modular totally odd residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

**Sources.**

- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), §8, Theorem 8.0.3 and proof, pp.38–39 (arXiv v3). The cited passage supplies this statement and the indicated proof route.

<a id="r32-3-dyadic-de-rham-modularity-lifting"></a>

### The 2-adic de Rham modularity lifting theorem (Kisin, Paškūnas, Tung)

**Theorem** · `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`.

**Planet:** 2-adic de Rham modularity lifting.

Let p = 2, E/ℚ₂ finite with ring 𝒪 and residue field k, and ρ : G_ℚ → GL₂(𝒪) continuous, irreducible, odd, unramified outside finitely many primes, with ρ|_{G_{ℚ₂}} de Rham of distinct Hodge–Tate weights. If ρ̄ is modular and has non-solvable image, then ρ is modular: up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for ρ|_{G_{F_v}} potentially semistable with distinct Hodge–Tate weights and det ρ totally odd, under the extra local hypothesis (iv) ρ̄|_{G_{F_v}} ≇ (χ ∗; 0 χ) for every v | 2 (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at p = 2 (ω = 1 there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

**Hypotheses and conventions.**

- this is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting), and a regular de Rham representation is not Barsotti–Tate after renaming its weights
- residual modularity is a hypothesis; Tung notes that over ℚ it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see R32.6/globalisation-dependency-audit)
- non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p
- The dyadic statement is specified here; the current R32.1/lifting-statement-table defines only the odd-prime statement. The totally-real theorem uses the requested general-field nonsolvable-image preservation, rather than the Q-only R32.1 lemma.
- Tung Theorem 8.0.1 combines an ordinary and a nonordinary component argument; Colmez finiteness and near faithfulness alone do not replace the ordinary input.

**Proof plan.**

1. Apply p-adic monodromy to the de Rham regular local representation, preserving the Hodge–Tate weights.
2. Apply totally-real-dyadic-lifting with F=ℚ. Its residual modularity remains an explicit hypothesis, not a use of the general Serre endpoint.
3. For normalized weights {0,k−1}, translate the classical form’s weight through the imported global-character twist and algebraic-vector convention; do not identify this theorem with the weight-two potentially Barsotti–Tate theorem.

**Prerequisites.** [`GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`](#r32-3-totally-real-dyadic-lifting); `PadicHodgeTheory:R06.3`; `ArithmeticGaloisRepresentations:R01.2`.

**Consumers.**

- [`GL2ModularityLifting:R32.6/transfer-dyadic`](#r32-6-transfer-dyadic): the p = 2 modularity transfer
- `ClassicalSerreModularity R33.1`: Dieulefait–Pacetti Theorem 1.5

**Acceptance checks.**

- A ρ with ρ̄|_{G_{ℚ₂}} ≅ (χ ∗; 0 χ) (for instance ρ̄ unipotent at 2) is covered by Tung's Theorem A but not by Paškūnas' Theorem 1.1.
- A potentially Barsotti–Tate ρ is the case already covered by Kisin's (0.1), used in the classical proof through Hypothesis (H).

**Sources.**

- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), Introduction, Theorem A, p. 2 (arXiv v3). The 2-adic theorem with no local restriction.
- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), Introduction, p. 3 (arXiv v3). The removal of the local restriction at 2.
- [`PASKUNAS-2016`](https://arxiv.org/pdf/1509.00332v2), §1, Theorem 1.1, pp.1–2 (arXiv v2; hypothesis (iv) and conclusion on p.2). The earlier theorem with hypothesis (iv).

<a id="r32-4"></a>

## R32.4. Pan's residually reducible theorem

The reducible-residual proof has three distinct local branches: generic noncyclotomic ratios, the scalar ordinary cover with a chosen character, and the cyclotomic ratio with extension-component geometry. Define nice and potentially nice points, prove the nice-prime component bridge, obtain the large component and ordinary intersection, and find the nice point after the stated solvable enlargement. Goodness propagates from an ordinary seed through potentially nice intersections. Nonsplit extension deformation rings supply the cyclotomic connectedness argument. The resulting Hilbert theorem descends to the irreducible ℚ lift. The residually irreducible theorem remains a separate, residual-modularity-dependent route, not an unconditional Serre input.

<a id="r32-4-pan-residually-irreducible-fontaine-mazur"></a>

### Pan’s residually irreducible lifting theorem with residual modularity

**Theorem** · `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

The usable lifting form is Pan Theorem 8.0.1 at F=ℚ: p odd, ρ continuous irreducible odd finitely ramified, ρ̄|G_ℚ(ζ_p) absolutely irreducible and modular, and ρ|G_ℚp absolutely irreducible regular de Rham. At p=3 exclude residual local extensions η by ηω in either orientation. Then ρ is modular. Pan Theorem 1.0.4 is a broader source consequence, combining earlier ordinary and residually dihedral cases and invoking full Serre modularity over ℚ through Remark 8.0.4; that unconditional consequence is not an input to the independent R33 proof.

**Hypotheses and conventions.**

- Residual modularity is kept in the lifting statement.
- This comparison node is outside the dependency cone of the modern residually reducible transfer; the source’s unconditional Theorem 1.0.4 is not exported as an independent Serre input.

**Proof plan.**

1. Apply the exact completed-homology patching theorem of Pan §8 with its specified residual-modularity hypothesis and local exclusions; this is requested from R31.5.
2. Use the local block compatibility and nonordinary classicality from R31.4.
3. Record Remark 8.0.4 separately: replacing residual modularity by the already proved full Serre theorem proves the unconditional source consequence, but would be circular in an independent proof of Serre.

**Prerequisites.** `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`.

**Consumers.**

- [`GL2ModularityLifting:R32.6/globalisation-dependency-audit`](#r32-6-globalisation-dependency-audit): the one read result whose proof invokes the general Serre theorem

**Acceptance checks.**

- A merely residually irreducible representation is not admitted unless its cyclotomic restriction and residual modularity satisfy the theorem.
- R33 uses the source-faithful residually reducible theorem, never the unconditional Theorem 1.0.4.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §8, Theorem 8.0.1 and Remark 8.0.4, pp.124–125. The exact conditional theorem and the stated full-Serre dependence of its unconditional specialization.

<a id="r32-4-nice-prime"></a>

### Pan’s nice Hecke prime

**Definition** · `GL2ModularityLifting:R32.4/nice-prime`.

**Planet:** Nice primes.

Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

**Hypotheses and conventions.**

- Retain Pan §4.1.2 Assumption 1: the ideal generated by ϖ and T_v−1−χ(Frob_v), v∉S, is an actual maximal ideal m of the completed Hecke algebra. Its central character is ψ=χε and the quaternion algebra is ramified exactly at the infinite places.

**Proof plan.**

1. Use R04.1–R04.2 for the determinant-fixed pseudodeformation problem and R31.3 for the Hecke quotient; use IHG.1/R01.1 for reconstruction and lattices.
2. Define the predicate by the existence of the lattice with these four properties, keeping the characteristic-p dimension-one condition and the cyclotomic intersection condition. Record the contraction separately from a prime satisfying only the Galois properties.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.GL2Lifting.PanNicePrime.char_p_dimension` | projection | A nice Hecke prime contains p and has quotient dimension one. |
| `TauCeti.GL2Lifting.PanNicePrime.lattice` | data | Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions. |
| `TauCeti.GL2Lifting.PanNicePrime.is_proModular` | compatibility | The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient from R31.3, equivalently its prime contains the kernel of that quotient. |
| `TauCeti.GL2Lifting.PanNicePrime.dihedral_disjoint` | projection | If the associated representation is induced from a quadratic L, then L∩F(ζ_p)=F. |
| `TauCeti.GL2Lifting.PanNicePrime.mk` | constructor | In the stated setup, p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality. |
| `TauCeti.GL2Lifting.PanNicePrime.iff` | characterisation | The predicate is equivalent to p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness. |

**Unit tests.**

- `nice_prime_characteristic_zero_rejected` (non-example): A prime not containing p is not nice, even if it is a classical automorphic point.
- `nice_prime_split_lattice_rejected` (non-example): A proposed witness lattice with split residual reduction does not satisfy PanNicePrime.lattice; irreducible generic fibre alone does not validate that witness.
- `nice_prime_constant_away_p` (characterisation): With all other clauses satisfied, the away-p clause is equivalent to equality of ρ(q)°|G_Fv with the constant residual lift for every v∈S\Σ_p; finite image alone does not suffice.

**Prerequisites.** `GlobalGaloisDeformations:R04.1`; `GlobalGaloisDeformations:R04.2`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`; `ArithmeticGaloisRepresentations:R01.1`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

**Consumers.**

- `Pan Theorem 4.1.7`: Specifies the primes at which localized pseudodeformation patching has nilpotent kernel.
- `Pan §7.2.5 and Lemma 7.4.2`: Identifies the primes produced after solvable base change; the definition differs from Skinner–Wiles nice primes.

**Acceptance checks.**

- Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §4.1, Definition 4.1.4 and Remarks 4.1.5–4.1.6, p.39. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-potentially-nice-prime"></a>

### Potentially nice pseudodeformation primes

**Definition** · `GL2ModularityLifting:R32.4/potentially-nice-prime`.

For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

**Proof plan.**

1. Import the pseudodeformation ring and pointwise semisimple representation from R04.2 and IHG.1.
2. Conjoin the four stated properties; keep the passage from potentially nice to nice as the separate arithmetic theorem potentially-nice-base-change.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.char_p_dimension` | projection | Extract p∈q and dim R^{ps}/q=1. |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.finite_away` | projection | Each away-p local restriction has finite image. |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.of_nice` | compatibility | A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice. |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.coefficient_extension` | functoriality | For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible. |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.mk` | constructor | In the stated setup, p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate. |
| `TauCeti.GL2Lifting.PanPotentiallyNicePrime.iff` | characterisation | The predicate is equivalent to p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added. |

**Unit tests.**

- `potentially_nice_reducible_rejected` (non-example): A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.
- `potentially_nice_no_away_places` (degenerate): When S=Σ_p, the finite-away-p clause is vacuous; the other three clauses remain necessary.
- `potentially_nice_not_proModular_by_definition` (characterisation): For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

**Prerequisites.** `GlobalGaloisDeformations:R04.2`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `ArithmeticGaloisRepresentations:R01.1`.

**Consumers.**

- `Pan §7.2.4–7.2.5`: Supplies a characteristic-p intersection point whose away-p finite images can be killed.
- `Pan Definition 7.4.1`: Labels intersection points in chains of components.

**Acceptance checks.**

- For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.2.4, p.114. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-nice-prime-component-bridge"></a>

### Modularity along a component through a nice prime

**Theorem** · `GL2ModularityLifting:R32.4/nice-prime-component-bridge`.

**Planet:** Modularity through nice primes.

In Pan §4.1’s setup, let x be a maximal ideal of R^{ps,{ξ_v}}[1/p] such that ρ(x)|G_Fv is irreducible and de Rham with distinct Hodge–Tate weights for every v|p. If an irreducible component contains x and a nice prime q, and if p=3 the local residual ratio is not ω^{±1}, then ρ(x) is regular algebraic cuspidal automorphic over F (Corollary 4.1.8).

**Proof plan.**

1. Import Theorem 4.1.7’s surjection (R^{ps,{ξ_v}})_q→T_q with nilpotent kernel from R31.5. A minimal prime on a component through q contains the kernel, so the component is in the closed Hecke image.
2. The point x is therefore pro-modular. Over F_v=Q_p, an irreducible two-dimensional de Rham representation with distinct Hodge–Tate weights is absolutely irreducible: otherwise its character constituents after finite coefficient extension are conjugate and have equal integer weights. Use the requested R06.2 coefficient/weight comparison, then R31.4’s Pan Corollary 3.5.12 with its absolutely irreducible local hypothesis and Jacquet–Langlands.

**Prerequisites.** [`GL2ModularityLifting:R32.4/nice-prime`](#r32-4-nice-prime); `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`; `PadicHodgeTheory:R06.2`.

**Acceptance checks.**

- The conclusion uses a common component, not just arbitrary connectedness of Spec R.
- Nilpotent kernel is sufficient; a literal global integral R=T assertion is not assumed.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §4.1, Corollary 4.1.8, pp.39–40. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-large-component-at-regular-point"></a>

### The large component through the geometric point

**Theorem** · `GL2ModularityLifting:R32.4/large-component-at-regular-point`.

In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

**Hypotheses and conventions.**

- For the component used in this proof, retain Pan §7.1.1–7.1.2: χ is de Rham at the p-places, the odd residual ratio χ̄ extends to G_Q, and the solvable field/coefficient enlargement has been performed with d=[F:Q]>|S\Σ_p|+2. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

**Proof plan.**

1. Use the characteristic-zero trace/deformation comparison of Pan Corollary 2.2.3, requested from R04.2, to present the completed local ring by h¹ variables and h² relations.
2. Apply the global Euler characteristic formula to ad⁰ρ: irreducibility gives h⁰=0 and total oddness gives one real-place invariant, hence h¹−h²=2[F:ℚ]. Use the dimension comparison to the integral component.
3. Use Pan Lemma 5.7.3’s finite inertia characters at the generic point, supplied by R04.3’s away-p deformation analysis.

**Prerequisites.** `GlobalGaloisDeformations:R04.2`; `GlobalGaloisDeformations:R04.3`; `ArithmeticGaloisDuality:R02.6`.

**Acceptance checks.**

- In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.1, Lemma 7.1.3 and §7.1.4, p.112. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-generic-ordinary-intersection"></a>

### The generic ordinary intersection

**Theorem** · `GL2ModularityLifting:R32.4/generic-ordinary-intersection`.

With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

**Hypotheses and conventions.**

- The degree enlargement of §7.1.2 ensures [F:ℚ]>|S\Σ_p|+2.
- The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

**Proof plan.**

1. The generic local reducibility ideal is principal (Paškūnas Appendix B, Corollary B.20; request R08.6), so imposing ordinarity loses at most [F:ℚ] dimensions.
2. Pan Theorem 5.1.2, requested from R21.4–R21.5, gives finiteness over Λ_F. Equal dimension and the domain property give surjectivity on a chosen component.
3. Leopoldt for the abelian F bounds the global reducible locus by dimension two; since [F:ℚ]>2 after the stated base change, it does not fill the component. Arithmetic weights with the appropriate local character ordering give the dense regular de Rham subset, and Theorem 5.1.2 makes it modular.

**Prerequisites.** [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); `LocalGaloisDeformationRings:R08.6`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`.

**Acceptance checks.**

- With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.2, Lemma 7.2.1, Corollary 7.2.3 and proof, pp.113–114. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-scalar-ordinary-intersection"></a>

### The scalar local ordinary cover

**Theorem** · `GL2ModularityLifting:R32.4/scalar-ordinary-intersection`.

With the same global C, if χ̄|G_Fv=1 at every v|p, use R₁^{ps,ord}, which remembers a chosen lifting ψ_{v,1} of the trivial local character with T|G_Fv=ψ_{v,1}+χψ_{v,1}^{−1} and ψ_{v,1}-ordinarity. Its pullback C^{ord,1} has dimension at least 1+[F:ℚ], and a component finite surjective over Λ_F with dense modular regular de Rham points, as in Pan Lemma 7.3.1 and Corollary 7.3.2.

**Proof plan.**

1. Import the chosen-character ordinary cover from R21.3, including Pan §6.1.1 and its distinction from the unordered reducible pseudodeformation locus.
2. The local pseudo ring is 𝒪[[t₁,t₂,t₃]], the chosen-character ring 𝒪[[x₁,x₂]], and the comparison after adjoining the latter has a three-generator kernel. Thus the dimension estimate is 1+2d+2d−3d=1+d, not the generic principal-ideal estimate.
3. Use Pan Theorem 6.1.2’s finiteness and modularity, requested from R21.4–R21.5, to obtain the dense arithmetic points on the cover; project to the global component.

**Prerequisites.** [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`; `LocalGaloisDeformationRings:R08.6`.

**Acceptance checks.**

- The scalar local case is covered although the original Skinner–Wiles distinguished-character theorem does not cover it.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.3, Lemma 7.3.1 and Corollary 7.3.2, pp.115–116. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-potentially-nice-base-change"></a>

### Producing a nice prime after solvable base change

**Theorem** · `GL2ModularityLifting:R32.4/potentially-nice-base-change`.

In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

**Proof plan.**

1. Impose p and the away-p Frobenius trace conditions on C₁. The dimension bound and Leopoldt exclude the reducible locus and leave a dimension-one irreducible prime. The local away-p deformation analysis proves finite local images, giving potentially-nice-prime.
2. Apply Taylor’s solvable field selection (Pan cites Taylor 2003 Lemma 2.2) to kill these finite images, force N(w)≡1 mod p and trivialize the generic inertia characters; request the exact deformation-problem restriction from R04.4.
3. Use the dense ordinary modular points and solvable automorphic base change to produce the Hecke maximal ideal and make the image of C₁ pro-modular. The nonsplit-lattice and dihedral-disjointness checks are Pan §5.7.9’s argument, included in the R04.4 request.
4. Contract along R^{ps,1}_{F₁}→R^{ps}/P. Since x and q lie on C, their images lie on one component; q′ satisfies all clauses of nice-prime.

**Prerequisites.** [`GL2ModularityLifting:R32.4/potentially-nice-prime`](#r32-4-potentially-nice-prime); [`GL2ModularityLifting:R32.4/nice-prime`](#r32-4-nice-prime); [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); `GlobalGaloisDeformations:R04.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `CompletedCohomologyAndLocalGlobalCompatibility:R31.3`; `GlobalGaloisDeformations:R04.3`.

**Acceptance checks.**

- In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.2.4–7.2.5, pp.114–115; §7.3 after Corollary 7.3.2, p.116. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-good-component"></a>

### Good components of the pseudodeformation space

**Definition** · `GL2ModularityLifting:R32.4/good-component`.

**Planet:** Good components.

Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

**Proof plan.**

1. Import potentially-nice-prime and the ordinary arithmetic locus from R21.4; goodness is an incidence predicate, with modularity of that locus used in the separate good-component-to-automorphy argument.
2. Use Mathlib Relation.ReflTransGen for finite reachability. A starting component contains a point in the intersection of the potentially-nice and seed sets; adjacency requires a potentially nice point in both components. The reflexive case encodes t=1, not an empty unseeded chain.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.GL2Lifting.panGoodComponent_iff` | characterisation | Goodness is equivalent to a seeded component followed by Relation.ReflTransGen of potentially-nice-point adjacency. |
| `TauCeti.GL2Lifting.panGoodComponent_seed` | constructor | A component containing a potentially nice seed point is good by a length-one chain. |
| `TauCeti.GL2Lifting.panGoodComponent_step` | relation | If C is good and C,C′ contain a common potentially nice point, then C′ is good. |
| `TauCeti.GL2Lifting.panGoodComponent_mono` | functoriality | Enlarging the potentially-nice point set and the seed-point set preserves goodness. |
| `TauCeti.GL2Lifting.panGoodComponent_congr` | extensionality | Pointwise equality of component subsets and equality of the nice and seed sets give equivalent goodness predicates. |

**Unit tests.**

- `good_component_single_seed` (degenerate): For a one-component, one-point incidence system with the point in both sets, the component is good.
- `good_component_empty_seed` (non-example): With empty seed-point set, no component is good, even when every pair is adjacent.
- `good_component_two_step_chain` (computation): For components {0}, {0,1}, {1,2}, nice points {0,1}, and seed points {0}, all three are good; the third is reached through the middle component.
- `good_component_non_nice_intersection` (non-example): For components {0,1} and {1,2}, nice points {0}, seed points {0}, only the first is good: the common point 1 is not potentially nice.

**Prerequisites.** [`GL2ModularityLifting:R32.4/potentially-nice-prime`](#r32-4-potentially-nice-prime); `mathlib:Relation.ReflTransGen`; `mathlib:Relation.ReflTransGen.trans`; `mathlib:Relation.reflTransGen_iff_eq`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`.

**Consumers.**

- `Pan Lemma 7.4.2`: Propagates pro-modularity through finitely many components after one solvable extension.
- `Pan Proposition 7.4.3 and Corollary 7.4.22`: Expresses the component connectivity required in the cyclotomic local branch.

**Acceptance checks.**

- Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.4, Definition 7.4.1, p.116. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-extension-components"></a>

### Components detected by an extension deformation

**Construction** · `GL2ModularityLifting:R32.4/extension-components`.

Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

**Proof plan.**

1. Use the imported characteristic-zero deformation ring and trace map, not a new representation deformation functor.
2. Identify components with minimal prime ideals using the pinned Mathlib order equivalence. Intersect those generic points with the image of PrimeSpectrum.comap f_B.

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.GL2Lifting.panExtensionComponents_mem_iff` | characterisation | P lies in the set iff P is a minimal prime point of A and P=comap f Q for some Q in Spec B. |
| `TauCeti.GL2Lifting.panExtensionComponents_minimal` | projection | Every member indexes an actual irreducible component of Spec A. |
| `TauCeti.GL2Lifting.panExtensionComponents_id` | compatibility | For the identity map, this set is exactly the minimal-prime points of A. |
| `TauCeti.GL2Lifting.panExtensionComponents_kernel_le` | projection | The kernel of f is contained in every member P.asIdeal. |
| `TauCeti.GL2Lifting.panExtensionComponents_comp_subset` | functoriality | For ring maps f:A→B and g:B→C, panExtensionComponents (g.comp f) is a subset of panExtensionComponents f, by composition of spectrum comaps. |

**Unit tests.**

- `extension_components_identity` (compatibility): For f=id_A the result equals {P∈Spec A | P.asIdeal∈minimalPrimes A}, via Mathlib’s component correspondence.
- `extension_components_zero_target` (degenerate): If B is the zero ring, Spec B is empty and the component set is empty.
- `extension_components_kernel_obstruction` (non-example): If ker f is not contained in a minimal P, then P is not detected, so using all minimal primes instead of the image intersection fails.

**Prerequisites.** `GlobalGaloisDeformations:R04.2`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `mathlib:PrimeSpectrum.comap`; `mathlib:minimalPrimes`; `mathlib:minimalPrimes.equivIrreducibleComponents`.

**Consumers.**

- `Pan Corollary 7.4.22`: Collects the components between which extension-ring connectedness propagates goodness.
- `Proof of Proposition 7.4.3, non-generic reducible case`: Connects Z_B₀ and Z_B₁ through a common potentially nice point.

**Acceptance checks.**

- Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.4, Definition 7.4.21, p.121. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-extension-component-control"></a>

### Geometry of nonsplit extension deformations

**Theorem** · `GL2ModularityLifting:R32.4/extension-component-control`.

In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

**Proof plan.**

1. Request from R02.6 the exact cohomological calculation of Pan Lemma 7.4.15: restriction H¹(G_F,S,E(ψ₂/ψ₁))→⊕_{v|p}H¹(G_Fv,E(ψ₂/ψ₁)) is an isomorphism of dimension d, using Poitou–Tate and the stated Lichtenbaum vanishing with extra S-places accounted for.
2. Use R04.2–R04.3 for Pan Lemmas 7.4.17–7.4.19: reducible-locus dimension, comparison of R_B with the completed integral deformation ring of a nonsplit residual lattice, and its Euler-characteristic presentation.
3. Apply the requested connectedness-dimension algebra and Pan Corollary 2.3.7’s trace comparison to obtain all four conclusions of Corollary 7.4.20.

**Prerequisites.** [`GL2ModularityLifting:R32.4/extension-components`](#r32-4-extension-components); `GlobalGaloisDeformations:R04.2`; `GlobalGaloisDeformations:R04.3`; `ArithmeticGaloisDuality:R02.6`; `DeformationAndDerivedPatchingAlgebra:R03.6`.

**Acceptance checks.**

- In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.4, Lemmas 7.4.15–7.4.19 and Corollary 7.4.20, pp.119–121. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-extension-component-propagation"></a>

### Goodness within the extension component set

**Theorem** · `GL2ModularityLifting:R32.4/extension-component-propagation`.

Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

**Hypotheses and conventions.**

- The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for d=1.

**Proof plan.**

1. Partition the union of components in Z_B into nonempty unions Z₁,Z₂ and pull the partition back to Spec R_B. Connectedness dimension ≥2d−1 gives an intersection point Q of that dimension.
2. Since 2d−1>d+1 in the degree-enlarged setting, Q is outside the reducible locus. The trace-map dimension gain gives an intersection in the pseudodeformation space of dimension at least 2d.
3. Use the R04.3 trace-cut prime-selection export on this intersection, with the |S\Σ_p| equations, reducible-locus bound and finite-away-p-image check, to obtain a potentially nice common point. The step API of good-component propagates across the partition, ruling out a good/bad partition.

**Prerequisites.** [`GL2ModularityLifting:R32.4/extension-component-control`](#r32-4-extension-component-control); [`GL2ModularityLifting:R32.4/good-component`](#r32-4-good-component); [`GL2ModularityLifting:R32.4/potentially-nice-prime`](#r32-4-potentially-nice-prime); [`GL2ModularityLifting:R32.4/potentially-nice-base-change`](#r32-4-potentially-nice-base-change); `GlobalGaloisDeformations:R04.3`.

**Acceptance checks.**

- Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.4, Corollary 7.4.22 and proof, p.121. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-cyclotomic-component-connectedness"></a>

### Goodness in the cyclotomic residual branch

**Theorem** · `GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`.

**Planet:** Cyclotomic component connectedness.

In Pan §7.4, p≥5 and after the coefficient, twist and degree enlargement of §7.1.2, suppose χ̄|G_Fv=ω at every v|p, with C the large component through the given irreducible regular de Rham point. Then C is good (Proposition 7.4.3). The inverse-cyclotomic orientation is obtained by relabelling and twisting; the p=3 cyclotomic case is excluded.

**Proof plan.**

1. Use the local ring R_v^{ps}≅𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀), with ordinary quotient by (x₀,x₁), from R08.6. This initially gives only dim C^{ord}≥1. Choose a dimension-one ordinary q.
2. If ρ(q) is irreducible, Pan Lemmas 7.4.8–7.4.10 use a deformation presentation to bound connectedness by 2d−1; the correctly oriented ordinary deformation component supplies a seed. A hypothetical good/bad partition then contains a potentially nice intersection point.
3. If ρ(q)=ψ₁⊕ψ₂ with ratio not ε^{±1} times finite order, Lemma 7.4.12 makes the local ordinary ideal principal after localization away from the singular cyclotomic point. The dimension and ordinary-density argument gives a seed component.
4. In the remaining ratio ψ₁/ψ₂=εθ case, use extension-component-control and extension-component-propagation. Choose B₀ supported at one p-place via the cohomological restriction isomorphism, find a good component in Z_B₀, and realize C in Z_B₁ via a normalized one-dimensional deformation lattice.
5. Pan Lemma 7.4.23’s height-at-most-one off-diagonal ideal yields an intersection of a component of Z_B₀ with one of Z_B₁ of dimension at least d+2. Choose a potentially nice point there and propagate goodness. The GMA and height calculation are precise IHG.1/R04.2 requests.

**Prerequisites.** [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); [`GL2ModularityLifting:R32.4/good-component`](#r32-4-good-component); [`GL2ModularityLifting:R32.4/generic-ordinary-intersection`](#r32-4-generic-ordinary-intersection); [`GL2ModularityLifting:R32.4/potentially-nice-base-change`](#r32-4-potentially-nice-base-change); [`GL2ModularityLifting:R32.4/extension-components`](#r32-4-extension-components); [`GL2ModularityLifting:R32.4/extension-component-control`](#r32-4-extension-component-control); [`GL2ModularityLifting:R32.4/extension-component-propagation`](#r32-4-extension-component-propagation); `LocalGaloisDeformationRings:R08.6`; `GlobalGaloisDeformations:R04.2`; `GlobalGaloisDeformations:R04.3`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`; `DeformationAndDerivedPatchingAlgebra:R03.6`.

**Acceptance checks.**

- The local ordinary ideal has two generators globally in this branch; treating it as principal globally fails.
- The exceptional p=3 branch is not included.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.4, Proposition 7.4.3 and proof, Lemmas 7.4.4–7.4.23, pp.117–124. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-nonordinary-hilbert-modularity"></a>

### Pan’s nonordinary Hilbert modularity theorem

**Theorem** · `GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`.

**Planet:** Nonordinary Hilbert modularity.

Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

**Proof plan.**

1. Normalize χ̄₁=1 by its finite-order lift. Use the solvable field and coefficient enlargements of §7.1.2, keeping total reality, p splitting and characteristic-zero irreducibility, then find the large component at ρ. The residual representation remains reducible.
2. In the generic ratio branch use generic-ordinary-intersection; in the scalar branch use scalar-ordinary-intersection. Produce a nice prime after base change and apply nice-prime-component-bridge.
3. For the cyclotomic branch at p≥5 use cyclotomic-component-connectedness. Lemma 7.4.2 chooses one solvable extension simultaneously for the finite component chain, starts from the ordinary modular seed, and repeatedly applies the nilpotent-kernel bridge.
4. Apply nonordinary classicality and Jacquet–Langlands over the auxiliary field, then descend by solvable base change and untwist. No global residual modularity assumption is introduced.

**Prerequisites.** [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); [`GL2ModularityLifting:R32.4/generic-ordinary-intersection`](#r32-4-generic-ordinary-intersection); [`GL2ModularityLifting:R32.4/scalar-ordinary-intersection`](#r32-4-scalar-ordinary-intersection); [`GL2ModularityLifting:R32.4/potentially-nice-base-change`](#r32-4-potentially-nice-base-change); [`GL2ModularityLifting:R32.4/good-component`](#r32-4-good-component); [`GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`](#r32-4-cyclotomic-component-connectedness); [`GL2ModularityLifting:R32.4/nice-prime-component-bridge`](#r32-4-nice-prime-component-bridge); `ArithmeticGaloisRepresentations:R01.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GlobalGaloisDeformations:R04.4`.

**Acceptance checks.**

- Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), §7.1, Theorem 7.1.1; §7.4, Lemma 7.4.2, pp.111–116. The cited passage supplies this statement and the indicated proof route.

<a id="r32-4-pan-residually-reducible-fontaine-mazur"></a>

### Pan's theorem: the Fontaine–Mazur conjecture in the residually reducible case

**Theorem** · `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`.

**Planet:** Pan's residually reducible Fontaine–Mazur theorem.

Let p be odd and ρ : G_ℚ → GL₂(E), E/ℚ_p finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights. Suppose ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂ is a sum of two characters, and if p = 3 that χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω (the mod-3 cyclotomic character). Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When ρ|_{G_{ℚ_p}} is reducible (ordinary) and χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1 this is Skinner–Wiles; Pan supplies the missing ordinary case χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1 (his §6) and the non-ordinary case (his Theorem 7.1.1).

**Hypotheses and conventions.**

- irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters
- no residual modularity is assumed: residually reducible representations are handled with pseudo-representations
- at p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5
- For p≥5 this is the residually reducible lifting form used by transfer-residually-reducible; it does not need the current odd-only R32.1 statement table.

**Proof plan.**

1. Split by whether the local characteristic-zero representation at p is reducible.
2. In the reducible local case apply the exact ordinary theorems of Pan 5.1.2 (distinguished) or 6.1.2 (scalar residual local ratio), supplied by R21.5. These include their finite Λ-algebra inputs from R21.4.
3. In the irreducible local case apply nonordinary-hilbert-modularity with F=ℚ; the generic, scalar and cyclotomic components have separate proof paths.
4. Untwist using the global geometric-character convention. At p=3, ω=ω^{−1}, so swapping residual characters leaves the excluded case unchanged.

**Prerequisites.** [`GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`](#r32-4-nonordinary-hilbert-modularity); `OrdinaryAutomorphicFormsAndModularityLifting:R21.5`; `ArithmeticGaloisRepresentations:R01.2`; `PadicHodgeTheory:R06.3`.

**Consumers.**

- [`GL2ModularityLifting:R32.6/transfer-residually-reducible`](#r32-6-transfer-residually-reducible): residually reducible modularity without a residual modularity hypothesis
- `ClassicalSerreModularity R33.1`: Dieulefait–Pacetti Theorem 1.6 (p ≥ 5)

**Acceptance checks.**

- ρ̄^{ss} ≅ 1 ⊕ χ̄₅ at p = 5 with ρ|_{G_{ℚ₅}} irreducible and de Rham of distinct weights: covered (non-ordinary case).
- p = 3 with ρ̄^{ss} ≅ 1 ⊕ χ̄₃: excluded (χ̄₃|_{G_{ℚ₃}} = ω); this is Dieulefait–Pacetti's p = 3 branch, R32.5/p-three-residually-reducible-branch.

**Sources.**

- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), Introduction, Theorem 1.0.2, p. 3 (arXiv v2). The residually reducible theorem, with the p = 3 exclusion.
- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), Introduction, after Theorem 1.0.2, p. 3 (arXiv v2). Why p = 3 with χ̄₁χ̄₂^{−1} = ω is excluded.

<a id="r32-5"></a>

## R32.5. Small-prime ordinary completion

Normalize using the designated ordinary quotient character, tracking its global Teichmüller lift, determinant and Hodge–Tate weights. Apply the exact distinguished Skinner–Wiles input at three. The weight-two/four crystalline completion uses the imported local ordinarity calculation. Pan's p≥5 endpoint does not cover the exceptional cyclotomic branch at three.

<a id="r32-5-ordinary-character-normalisation"></a>

### Normalization by the ordinary quotient character

**Theorem** · `GL2ModularityLifting:R32.5/ordinary-character-normalisation`.

Let ρ be a continuous irreducible odd finitely ramified 3-adic representation with an ordinary local quotient β unramified at 3, residual characters ᾱ,β̄ globally with β̄ restricting to the reduction of that quotient, and determinant ψε^{k−1} with ψ finite order and integer k≥2. Let η be the Teichmüller lift of the global character β̄ and twist by η^{−1}. Then the residual characters become ᾱβ̄^{−1},1, the local quotient remains unramified (hence trivial on inertia), det(ρ⊗η^{−1})=(ψη^{−2})ε^{k−1}, and the Hodge–Tate weights and oddness are unchanged. If ᾱβ̄^{−1}=ω₃ globally, this is exactly the imported Skinner–Wiles p=3 interface; otherwise a nontrivial local ratio is sufficient for its more general distinguished theorem.

**Proof plan.**

1. Import finite-order character lifts, twists, determinant and weight formulas from R01.1–R01.2.
2. Choose β̄ by the actual local ordinary quotient, rather than an arbitrary labelling of the two residual characters. Since β is unramified at 3, its reduction and Teichmüller lift are trivial on inertia; this preserves the quotient condition.
3. Apply the imported distinguished Skinner–Wiles theorem. The source residual 1⊕ω₃ specialization requires the ratio globally, while the theorem over ℚ needs only its nontrivial local restriction.

**Prerequisites.** `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`.

**Acceptance checks.**

- A finite-order twist preserves weight k; an inverse cyclotomic twist generally shifts both weights and cannot be silently substituted.
- After twisting an arbitrarily chosen residual character, the inertia quotient need not be trivial.

**Sources.**

- [`SKINNER-WILES-1999`](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, Theorem, printed p.6 (Numdam page image). The cited passage supplies this statement and the indicated proof route.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §1.2, Theorem 1.7, arXiv p.4; publisher PDF p.5. The p=3 specialization; retain the finite-order determinant hypothesis from the cited Skinner–Wiles theorem.

<a id="r32-5-p-three-residually-reducible-branch"></a>

### The p = 3 residually reducible branch: Skinner–Wiles, and why Pan's theorem does not cover it

**Theorem** · `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`.

**Planet:** The p = 3 ordinary branch.

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified with ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k (Dieulefait–Pacetti Theorem 1.7 = Skinner–Wiles at p = 3, OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three). This branch is not a consequence of Pan's theorem: Dieulefait–Pacetti quote Pan only for p ≥ 5, and Pan's Theorem 1.0.2 at p = 3 excludes exactly the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, which is this one (χ̄₃|_{G_{ℚ₃}} = ω). Normalisation after twisting: if ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂, choose β̄ among χ̄₁,χ̄₂ by the actual unramified ordinary quotient and twist ρ by its inverse Teichmüller lift so that ρ̄^{ss} ≅ 1 ⊕ χ with the trivial character on the unramified quotient; hypothesis (ii) is then read for the twisted ρ.

**Hypotheses and conventions.**

- Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9)
- The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion.
- Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately.
- ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; source issue E1 records it.
- The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

**Proof plan.**

1. Import R21.5/theorem-a-at-three, proved from Skinner–Wiles’ introduction theorem with finite-order ψ and nontrivial residual ratio on the decomposition group.
2. The ratio of 1 and ω₃ is ω₃ in either order because it has order two. Thus Pan Theorem 1.0.2’s p=3 exclusion applies exactly here, even though Skinner–Wiles covers the ordinary lift.
3. Use ordinary-character-normalisation only for the explicit extension to other globally labelled character pairs; its finite-order twist preserves the inertia quotient and the weight.

**Prerequisites.** `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`; [`GL2ModularityLifting:R32.5/ordinary-character-normalisation`](#r32-5-ordinary-character-normalisation).

**Consumers.**

- `ClassicalSerreModularity R33.4`: Paso 6, the terminal case at p = 3
- [`GL2ModularityLifting:R32.6/globalisation-dependency-audit`](#r32-6-globalisation-dependency-audit): the Skinner–Wiles branch uses no residual modularity

**Acceptance checks.**

- ρ̄^{ss} ≅ 1 ⊕ χ̄₃ with ρ crystalline of Hodge–Tate weights {0, 1} at 3: ordinary by the local calculation, hence modular by this branch; Pan's theorem does not apply.
- The same residual sum written χ̄₃⊕1 is covered by relabelling its two summands. Relabelling does not twist the characteristic-zero representation; an inverse 3-adic cyclotomic twist would change the weights and can destroy the trivial inertia quotient.

**Sources.**

- [`SKINNER-WILES-1999`](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Introduction, the Theorem, printed p. 6 (on the page image). The theorem with hypotheses (i)–(iii).
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.7 and its proof, pp. 4–5 (arXiv v2). Dieulefait–Pacetti's statement of the p = 3 branch.

<a id="r32-5-crystalline-weights-two-four-completion"></a>

### The crystalline p=3 completion in weights two and four

**Theorem** · `GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`.

**Planet:** Crystalline ordinary completion at three.

Let ρ:G_ℚ→GL₂(E), E/ℚ₃ finite, be irreducible, odd, continuous, finitely ramified and crystalline at 3 with Hodge–Tate weights {0,k−1}, k∈{2,4}. If its residual semisimplification is a sum of two global characters, then ρ is modular of weight k. In the level-one branch of DP, normalization has residual characters 1,ω₃; without level one the general distinguished Skinner–Wiles theorem still applies after quotient-character normalization.

**Proof plan.**

1. Use the existing R21.5/crystalline-reducible-reduction-is-ordinary calculation in the precise interval 2≤k≤p+1. Its two local characters are unramified times ε^{k−1} and an unramified quotient.
2. At p=3 and k=2 or 4, k−1 is odd, so the residual ratio on inertia is ω₃≠1. Thus this is the distinguished ordinary case. The determinant of a global geometric character is finite order times ε^{k−1}, supplied by R01.2.
3. Apply ordinary-character-normalisation and the general Skinner–Wiles theorem. In DP’s level-one specialization, the normalized residual global ratio is ω₃, so apply p-three-residually-reducible-branch.

**Prerequisites.** [`GL2ModularityLifting:R32.5/ordinary-character-normalisation`](#r32-5-ordinary-character-normalisation); `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `ArithmeticGaloisRepresentations:R01.2`; [`GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`](#r32-5-p-three-residually-reducible-branch).

**Acceptance checks.**

- Weights 2 and 4 at 3 are covered even though they lie in Pan’s excluded local ω branch.
- The statement does not cover arbitrary crystalline weights, nor arbitrary noncrystalline de Rham representations with residual 1⊕ω₃.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §2, Paso 6, arXiv p.14 / publisher PDF p.14; §1.2, Theorem 1.7, arXiv p.4 / publisher PDF p.5. The cited passage supplies this statement and the indicated proof route.

<a id="r32-6"></a>

## R32.6. Modularity-transfer statements for congruence arguments

Package transfers by residual branch. In the irreducible odd-prime route, modularity of one lift supplies the common residual witness, and the exact R32.2 theorem applies to the other. The dyadic route retains nonsolvable image. The reducible route proves modularity of each irreducible lift with its own geometric hypotheses; at three the ordinary or nonexceptional hypotheses are explicit. For a ramified coefficient prime, DP-style all-member de Rham data replace the unavailable Weil–Deligne comparison. Frobenius data identify the modular system after the member theorem. The final audit keeps the required restricted auxiliary globalisations distinct from unconditional general Serre modularity.

<a id="r32-6-transfer-residually-irreducible-odd"></a>

### Modularity transfer along a congruence at an odd prime with cyclotomically irreducible residual representation

**Theorem** · `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.

**Planet:** Modularity transfer along congruences.

Let p be odd and ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) continuous, odd, finitely ramified, with ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible, and ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}} de Rham with Hodge–Tate weights {0, k − 1}, {0, k′ − 1} (k, k′ > 1). Then ρ is modular if and only if ρ′ is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if ρ is modular then ρ̄ = ρ̄′ is modular and Theorem 1.4 applies to ρ′. Its proof is R32.2/odd-prime-statement-over-q, for every odd p, 3 included: Kisin's Theorem (2.2.17), with Emerton's Theorem 3.3.22 removing his abelian hypothesis, and the Breuil–Mézard results of Paškūnas, Hu–Tan (p ≥ 5) and Tung (every p > 2) removing the local exclusion.

**Hypotheses and conventions.**

- absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13, R32.1/quadratic-cyclotomic-irreducibility); it is the hypothesis in the combined theorem as Tung states it
- residual modularity is the only global modularity input; no Serre conjecture is used (R32.6/globalisation-dependency-audit)
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

**Proof plan.**

1. Theorem 1.4 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung) applied to ρ′, whose residual representation is that of the modular ρ.

**Prerequisites.** [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q); [`GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`](#r32-1-quadratic-cyclotomic-irreducibility); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`; `PadicHodgeTheory:R06.3`.

**Consumers.**

- `ClassicalSerreModularity R33.1–R33.3`: Dieulefait–Pacetti Theorem 1.4 at every congruence at an odd prime

**Acceptance checks.**

- A newform f and a congruent de Rham lift ρ′ of ρ̄_f of a different Hodge–Tate weight: ρ′ is modular.
- Non-example: ρ̄ bad dihedral (ρ̄|_{G_{ℚ(√p*)}} reducible) is excluded; Dieulefait–Pacetti avoid it by the Fontaine–Laffaille lemma (ClassicalSerreModularity R33.1).
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.4 and its proof, p. 4 (arXiv v2). The statement and its attributions.
- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), Introduction, the theorem of Kisin, Paškūnas, Hu–Tan and Tung, pp. 1–2 (arXiv v3). The combined theorem and its hypotheses.
- [`TUNG-2021-P3`](https://arxiv.org/pdf/1803.07451v4), Theorem 4.7, p. 15 (arXiv v4). The combined theorem with ρ̄ modular as a hypothesis, for every odd p.

<a id="r32-6-transfer-dyadic"></a>

### Modularity transfer along a congruence at 2 with non-solvable residual image

**Theorem** · `GL2ModularityLifting:R32.6/transfer-dyadic`.

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂) be continuous, odd, finitely ramified, de Rham at 2 with distinct Hodge–Tate weights, with ρ̄ ≅ ρ̄′ of non-solvable image. Then ρ is modular if and only if ρ′ is (Dieulefait–Pacetti Theorem 1.5, from R32.3/dyadic-de-rham-modularity-lifting).

**Hypotheses and conventions.**

- non-solvable residual image is needed at p = 2
- irreducibility of ρ, ρ′ follows from that of ρ̄
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

**Proof plan.**

1. R32.3/dyadic-de-rham-modularity-lifting applied to ρ′ with ρ̄′ = ρ̄ modular.

**Prerequisites.** [`GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`](#r32-3-dyadic-de-rham-modularity-lifting); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`; `PadicHodgeTheory:R06.3`.

**Consumers.**

- `ClassicalSerreModularity R33.5`: the characteristic-two closure

**Acceptance checks.**

- Dieulefait–Pacetti §3: a weight-2 system through a dyadic lift of a non-solvable ρ̄ transfers modularity from an odd member back to the 2-adic one.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.5 and its proof, p. 4 (arXiv v2). The 2-adic transfer and its sources.

<a id="r32-6-transfer-residually-reducible"></a>

### Modularity of residually reducible representations at a ramified coefficient prime

**Theorem** · `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

Let p ≥ 5 (or p = 3 outside Pan's exclusion) and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights, with ρ̄^{ss} a sum of two characters. Then ρ is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and R32.4/pan-residually-reducible-fontaine-mazur). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

**Hypotheses and conventions.**

- Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is R32.5/p-three-residually-reducible-branch
- Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

**Proof plan.**

1. Ordinary case: Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q) and Pan §6; non-ordinary case: Pan's Theorem 7.1.1.

**Prerequisites.** [`GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`](#r32-4-pan-residually-reducible-fontaine-mazur); `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`; `PadicHodgeTheory:R06.3`.

**Consumers.**

- `ClassicalSerreModularity R33.1`: the reducible branch of every congruence in Pasos 1–6

**Acceptance checks.**

- A member ρ_ℓ of a compatible system with ρ̄_ℓ reducible at a prime ℓ ≥ 5 of the ramification set: modular without any local comparison at ℓ.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Theorem 1.6 and its proof, p. 4 (arXiv v2). The residually reducible modularity theorem.

<a id="r32-6-globalisation-dependency-audit"></a>

### Dependency audit: which globalisations in the lifting theorems use the general Serre theorem

**Comparison** · `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

Source-independence comparison for the transfer dependency cone: use the Q lifting forms with residual modularity explicitly retained, and Pan’s residually reducible theorem with no residual modularity. Do not use Pan 1.0.4’s unconditional residually irreducible consequence (Remark 8.0.4 invokes full Serre), or Emerton §7.3’s unconditional promodularity argument. Tung’s local Breuil–Mézard proof does additionally use suitable auxiliary globalizations: §4.3 Lemma 4.3.3 cites Calegari 3.2, Snowden 8.2.1, and the dyadic HBAV construction in KW II Theorem 6.1; Lemma 4.3.4 cites Paškūnas 3.29 and KW II Lemma 3.5. These have distinct roles from the global lift’s assumed residual modularity. The exact independent supplier proofs, including part 1’s Emerton–Paškūnas/BLGG and Gee inputs, remain the named requests and gap; this comparison is not a certificate that those uninspected proofs are independent.

**Hypotheses and conventions.**

- not audited here: the global inputs of Tung's Breuil–Mézard theorem (the patched modules of [CEG+16], Emerton–Paškūnas' faithfulness and Barnet-Lamb–Gee–Geraghty's Theorem A.4.1), and Gee's Theorem 4.4.12 of 'Automorphic lifts of prescribed types', which Kisin's proof of (2.2.17) uses. These are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5–R31.6 and SerreWeightAndLevelOptimisation R20.6
- The exact KW II local and patching inputs are named in the R31.6 request. Their independence from the full Serre endpoint remains an audit obligation in the first gap; this packet does not certify their uninspected proofs.

**Proof plan.**

1. Classify each assertion in the dependency cone as a theorem with assumed residual modularity, a residually reducible theorem, or an auxiliary globalisation/weight-change input.
2. Read Tung §4.3’s exact references and separate local BM globalisation from Theorem 8.0.3’s given modular residual representation. The suitable-globalisation existence is required even when the final lifting theorem starts with a modular residual representation.
3. Retain the restricted CM-induced construction of Emerton Theorem 3.3.22 and its weight-part proof as the R31.6/R20.6 request; exclude the full-Serre promodularity corollary.
4. Attach unresolved source-independence obligations to the exact requested inputs, rather than infer independence merely from a theorem’s displayed residual-modularity assumption.

**Prerequisites.** `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`; `SerreWeightAndLevelOptimisation:R20.6`.

**Consumers.**

- `ClassicalSerreModularity:R33.5/globalisation-dependency-check`: the independence audit that node requests from R32.6

**Acceptance checks.**

- An unresolved source-independence request prevents certification of an independent Serre proof, while leaving the target-level lifting plan usable conditionally.
- No R33 stage is made an ancestor of the transfer lemmas.

**Sources.**

- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), Introduction, p. 2 (arXiv v3). Residual modularity is a hypothesis of the lifting theorem.
- [`PASKUNAS-2016`](https://arxiv.org/pdf/1509.00332v2), §1.1.2 'Global part', p. 5 (arXiv v2). Khare–Wintenberger and Kisin's Barsotti–Tate theorems as inputs.
- [`PAN-2022`](https://arxiv.org/pdf/1901.07166v2), Remark 8.0.4, p. 125 (arXiv v2). The appeal to Serre's conjecture, in the residually irreducible part only.
- [`EMERTON-LGC-2011`](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §7.3, proof of Theorem 1.2.3, p. 96. Emerton's promodularity uses Serre's conjecture.
- [`EMERTON-LGC-2011`](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §7.4, completion of the proof of Theorem 3.3.22, p. 97. Theorem 3.3.22 uses only an auxiliary modular ρ̄ and the weight part for it.
- [`HU-TAN-2015`](https://arxiv.org/pdf/1309.1658v2), Proof of Theorem 6.3, p. 35 (arXiv v2). Hu–Tan's Theorem 1.4 is Theorem 6.3 plus Khare–Wintenberger.
- [`TUNG-2021-DYADIC`](https://arxiv.org/pdf/1908.06174v3), §4.3, Lemmas 4.3.3–4.3.4, pp.20–21. Names the suitable-globalization and weight-change inputs actually used.

<a id="r32-6-ramified-reducible-coefficient-prime"></a>

### Transfer at a ramified reducible coefficient prime

**Theorem** · `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`.

**Planet:** Ramified reducible coefficient-prime transfer.

Let R be a rank-two system over ℚ in the DP Definition 1.10 sense, weight k>1, whose members are odd, semisimple and finitely ramified. Let λ|p with p in the ramification set S, p≥5, and suppose ρ_λ is irreducible in characteristic zero while ρ̄_λ^{ss} is a sum of two characters. Then ρ_λ is modular by Pan, without any comparison of WD(ρ_λ|G_ℚp) with the system parameter at p, and its good Frobenius polynomials identify the system with the modular system of that eigenform. The same conclusion at p=3 requires the nonexceptional Pan ratio, or the explicitly normalized ordinary hypotheses of R32.5. Irreducibility and oddness are checked hypotheses, not consequences of bare weak compatibility.

**Hypotheses and conventions.**

- The all-member de Rham and common regular Hodge–Tate-weight clauses of DP Definition 1.10 are explicit extra data on the R24.5 compatible-system carrier. The historical KW almost-strict definition alone does not contain them.

**Proof plan.**

1. Use the explicit DP all-member de Rham and fixed-weight clauses (4)–(5), through the requested R24.5 comparison/extension of its compatible-system carrier. They are extra premises, not projections of the historical KW almost-strict definition. The weakened clause (6) need not impose coefficient-prime WD compatibility in this residually reducible ramified case.
2. Use PadicHodgeTheory R06.3 to pass from de Rham to potentially semistable where Pan’s stated hypothesis uses that word. Apply transfer-residually-reducible at p≥5, or the exact p=3 branch under its extra hypotheses.
3. Use the modular-form compatible system from R19.3 and good-prime characteristic-polynomial recognition from R01.5 to identify every semisimple member after common coefficient extension. This step uses only good primes, not the missing local WD comparison.

**Prerequisites.** `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`; [`GL2ModularityLifting:R32.6/transfer-residually-reducible`](#r32-6-transfer-residually-reducible); [`GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`](#r32-5-p-three-residually-reducible-branch); `PadicHodgeTheory:R06.3`; `ArithmeticGaloisRepresentations:R01.5`; `AutomorphicGaloisRepresentations:R19.3`; `PotentialModularityAndCompatibleSystems:R24.5`.

**Acceptance checks.**

- A p∈S member with reducible residual representation is covered at p≥5 without assuming it is crystalline.
- For a historical KW almost-strict carrier lacking an all-member de Rham assertion, this application requires an explicit additional de Rham hypothesis.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §1.4, Definition 1.10 and Remark 4, arXiv pp.6–7 / publisher PDF p.7. The cited passage supplies this statement and the indicated proof route.

<a id="r32-6-transfer-ordinary-three"></a>

### Ordinary congruence transfer at three

**Theorem** · `GL2ModularityLifting:R32.6/transfer-ordinary-three`.

Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

**Proof plan.**

1. Apply ordinary-character-normalisation to each lift with its own designated quotient.
2. Apply p-three-residually-reducible-branch to each normalized lift and untwist; both conclusions give the equivalence.

**Prerequisites.** [`GL2ModularityLifting:R32.5/ordinary-character-normalisation`](#r32-5-ordinary-character-normalisation); [`GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`](#r32-5-p-three-residually-reducible-branch); `ArithmeticGaloisRepresentations:R01.1`.

**Acceptance checks.**

- Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §1.2, Theorem 1.7, arXiv pp.4–5 / published p.5. The cited passage supplies this statement and the indicated proof route.

<a id="r32-6-de-rham-lifting-and-almost-strict-systems"></a>

### Why de Rham lifting suffices when an almost strictly compatible system lacks the Weil–Deligne comparison at the coefficient prime

**Theorem** · `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`.

For a DP-style rank-two almost strictly compatible system, with odd irreducible characteristic-zero members, all-member de Rham behavior and common weights {0,k−1}, k>1 explicitly supplied, the characteristic-p lifting step can use the modern de Rham transfer statements even when the system’s coefficient-prime WD comparison is absent. Select the branch by residual data: nonsolvable at p=2; absolutely irreducible cyclotomic restriction plus a known modular congruent lift at odd p; reducible at p≥5 (or nonexceptional Pan p=3); normalized ordinary p=3 under its exact extra conditions. Once a member is modular, good Frobenius polynomials identify all semisimple members with the modular-form system. A plain or historical KW almost-strict system alone does not supply the all-member de Rham premise.

**Hypotheses and conventions.**

- DP Definition 1.10 clauses (4)–(5), not the bare historical KW almost-strict label, supply de Rham behavior at every coefficient prime.
- The coefficient-change theorem consumes a system; it does not prove existence of a system through every regular de Rham lift. The supplier has recorded a gap in DP Theorem 1.11’s claimed general existence.

**Proof plan.**

1. Use the R24.5/compatible-system carrier for common good Frobenius polynomials and finite ramification. Retain the separate DP all-member de Rham and common regular weight hypotheses via the requested R24.5 extension; they are not projections of the historical KW almost-strict carrier. Check oddness and characteristic-zero irreducibility separately; R24.5/rank-two-reducibility-independent-of-lambda transports irreducibility from an irreducible member.
2. Apply the branch-appropriate transfer lemma, using ramified-reducible-coefficient-prime for that exceptional compatibility situation.
3. Build the eigenform system with R19.3 and use R01.5’s characteristic-polynomial recognition on the common good Frobenius set. This does not import R24.6/linked-systems-modularity-transfer, which already consumes our transfer nodes and would create a cycle.

**Prerequisites.** `PotentialModularityAndCompatibleSystems:R24.5/compatible-system`; `PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`; [`GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`](#r32-6-transfer-residually-irreducible-odd); [`GL2ModularityLifting:R32.6/transfer-dyadic`](#r32-6-transfer-dyadic); [`GL2ModularityLifting:R32.6/transfer-residually-reducible`](#r32-6-transfer-residually-reducible); [`GL2ModularityLifting:R32.6/transfer-ordinary-three`](#r32-6-transfer-ordinary-three); [`GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`](#r32-6-ramified-reducible-coefficient-prime); `ArithmeticGaloisRepresentations:R01.5`; `AutomorphicGaloisRepresentations:R19.3`; `PotentialModularityAndCompatibleSystems:R24.5`.

**Consumers.**

- `ClassicalSerreModularity R33`: every change of coefficient prime in Pasos 1–6

**Acceptance checks.**

- At ramified p≥5 and reducible residual representation, use de Rham plus Pan, without a WD equality.
- A KW almost-strict system missing de Rham at that member fails the premise.
- Good-prime recognition compares characteristic polynomials after common coefficient extension and semisimplification.

**Sources.**

- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), §1.4, Definition 1.10 and the definition of almost strictly compatible systems, pp. 6–7 (arXiv v2). The exception at residually reducible members.
- [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Remark 4, p. 7 (arXiv v2). Propagation of modularity along the system.

## Source qualifications

These records belong to the part packets and keep their scope. Source-issue IDs are local to a part: both packets have an `E1`, describing different findings. The part qualifier below disambiguates them without renaming either record. The recorded review outcome is inherited; assembly changes no source-issue or blueprint review verdict.

### Part R22.1: GL2ModularityLifting/E1 — misprint

**Source:** [`KISIN-2ADIC-2009`](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), Theorem (0.9)(2), p. 4, and Theorem (3.3.5)(2), p. 45, in the author's preprint (DVI of 21 October 2008); the published version (Invent. Math. 178 (2009)) was not accessible.

(2) For each v | p, ρ|G_{F_v} is potentially Barsotti–Tate, …

Theorem (0.9) is announced as the version of Theorem (0.1) over totally real fields, and (0.1) assumes ρ potentially Barsotti–Tate at 2; with 'Barsotti-Tate', (0.9) for F = ℚ would not contain (0.1). Condition (3) and the proof of (3.3.5) treat potentially ordinary places and types Ind θ (Lemmas (3.3.1)–(3.3.2)), which only arise for potentially Barsotti–Tate ρ: a Barsotti–Tate, potentially ordinary representation is already ordinary.

The version of record may already read 'potentially Barsotti–Tate'.

**Recorded source-issue review:** confirmed. Confirmed as a preprint-scoped omission of 'potentially': DVI (0.1), (0.9) and (3.3.5), including the proof on pp.45–46, were read. The proof changes field to make both potentially Barsotti–Tate representations Barsotti–Tate and handles potentially ordinary types via (3.3.1). No claim about the inaccessible Inventiones theorem text.

### Part R22.1: GL2ModularityLifting/E2 — error

**Source:** [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Lemma (1.7.5), last paragraph of the proof, p. 31, and Corollary (1.7.14), last sentence, p. 34, in the author's preprint (DVI).

(1.7.6) is only a homeomorphism onto its image, an isomorphism over the generic points, and it may have non-reduced fibres. Delete the claim of Lemma (1.7.5) that the reduced ring of R^ord is formally smooth. In (1.7.14), replace 'unless ρ̄ ∼ (μλ 0; 0 μλ′) ⊗ ω^m' by 'unless ρ̄ ∼ (μλ ∗; 0 μλ′) ⊗ ω^m and either the class of ∗ is trivial, or λ = λ′'. The multiplicity μ_{n,m}(ρ̄) of (1.1.6) with n = p − 2 and λ = λ′ is 1, 2 or 4, as ∗ is non-trivial and ramified, non-trivial and unramified, or trivial (Sander).

The argument before the sentence shows that (1.7.6) is surjective and an isomorphism at the minimal primes, not that it is a closed immersion. Gee–Kisin B.1 locate the mistake at this sentence.

**Recorded source-issue review:** confirmed. Confirmed: the DVI pp.31,34 contains the closed-immersion/formal-smoothness claims, and Gee–Kisin B.1 explicitly replaces them and corrects the exceptional multiplicities. The issue remains scoped to the author DVI, not an uninspected JAMS PDF.

### Part R22.1: GL2ModularityLifting/E3 — gap

**Source:** [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Proof of Lemma (1.7.4), p. 30, in the author's preprint (DVI).

Add the condition that G_{ℚ_p} acts on L_A ⊗_A 𝔽 via ω₁.

The hypothesis ω₁ω₂^{−1} ∉ {1, ω, ω^{−1}} allows ω₁ω₂^{−1} to be a non-trivial unramified character. Then ω₁|I = ω₂|I, and a line with inertia acting by ω₁|I need not be unique; the added condition restores uniqueness.

**Recorded source-issue review:** confirmed. Confirmed: DVI (1.7.4), p.30 fixes only the inertia character of the line, which does not distinguish distinct unramified residual characters. Gee–Kisin B.2 adds the residual Galois-character condition exactly as recorded.

### Part R22.1: GL2ModularityLifting/E4 — gap

**Source:** [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), §2.2, the conditions (1)–(4) (p. 38) and the character γ_v of (2.2.9) (p. 41), in the author's preprint (DVI); published (2.2.10).

Add to (2.2) the condition N(v) ≢ −1 (mod p) for v ∈ Σ; in the applications one can reach N(v) ≡ 1 (mod p) by base change.

If ρ̄|G_{F_v} ≅ γ̄ ⊕ γ̄ω and N(v) ≡ −1 (mod p), then ω(Frob_v)² = 1. So γ̄′ = γ̄ω also presents ρ̄|G_{F_v} as an extension of γ̄′ by γ̄′(1), and γ_v is not determined by the printed conditions.

**Recorded source-issue review:** confirmed. Confirmed: DVI p.41 asserts uniqueness of γ_v without the norm restriction in its §2.2 setup. Gee–Kisin B.3 supplies N(v) not congruent to −1; the swapped unramified characters explain the ambiguity.

### Part R22.1: GL2ModularityLifting/E5 — gap

**Source:** [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Proof of Proposition (2.2.14), p. 45, in the author's preprint (DVI); published (2.2.15).

Also prove that for v ∈ Σ the rings R̄^{□,ψ}_v/π are irreducible and generically reduced. The proof is that of Lemma (1.7.5), using the formal smoothness of Kisin's Annals Lemma 2.6.3 and the fact that the representation at a generic point of Spec R̄^{□,ψ}_v/π is not scalar.

R̄^i_∞ is a completed tensor product that includes the factors R̄_v for v ∈ Σ, and (1.7.14) concerns only the factors at v | p.

**Recorded source-issue review:** confirmed. Confirmed: the DVI p.45 tensor-product argument cites only the p-adic factors. Gee–Kisin B.4 supplies irreducibility and generic reducedness at v∈Σ, using Kisin Annals Lemma2.6.3.

### Part R22.1: GL2ModularityLifting/E6 — error

**Source:** [`KISIN-FM-2009`](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), Lemma (2.2.1) and its proof, pp. 38–39, in the author's preprint (DVI).

Lemma (2.2.1) is false for some ρ̄ with small image. Either (p > 3) require that p split completely in F, drop (2.1.2), and take U_v maximal compact at every v, so that (2.2)(4) is vacuous; or (any p) keep (2.1.2), weaken (2.2)(4) to '1 − N(v) ∈ 𝔽^× and the eigenvalue ratio is not N(v)^{±1}', and count ranks 2^{|R|} (Gee–Kisin Lemmas B.5.1–B.5.2). The printed 'ρ̄(g)' in the quoted sentence should be ρ̄(g′).

ρ̄(g) = z is central, so tr ρ̄(gg′)²/det ρ̄(gg′) = tr ρ̄(g′)²/det ρ̄(g′). The left side of (2.2.2) is unchanged, but the right side (1 + ω(gg′))²/ω(gg′) changes with ω(g). So (2.2.2) for g′ does not give it for gg′.

**Recorded source-issue review:** confirmed. Confirmed: the DVI pp.38–39 contains the invalid scalar-multiplication inference; Gee–Kisin B.5 gives both repairs. Crucially B.5.2 changes the graded-piece equality into a normalised inequality with a local exclusion, now corrected in this packet.

### Part R22.1: GL2ModularityLifting/E7 — misprint

**Source:** [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.4, p. 4, arXiv:2108.07577v2; independently collated with the published article, RACSAM117 (2023), article153, p.4 (numeric references [9], [13], [11], [38]).

Emerton's result that removes Kisin's Hypothesis (1.2.6) is his Theorem 3.3.22 (the locally algebraic vectors of B(V) for de Rham V with distinct weights), used through Kisin's argument, as Emerton's Remark 1.2.5 explains. Theorem 1.2.1 is his local–global compatibility for promodular V, and is not needed.

Emerton's Remark 1.2.5 says that Kisin's theorem follows from the p-adic local Langlands correspondence with the compatibility of (1.2.6), and that Theorem 3.3.22 supplies the missing potentially crystalline, non-crystabelline case. Theorem 1.2.1 has hypotheses (V promodular, V̄|G_{ℚ_p} ≇ χ ⊗ (1 ∗; 0 ε)) that Kisin's theorem does not.

**Recorded source-issue review:** confirmed. Confirmed and collated with the version of record: DP published p.4 retains the reference to Emerton Theorem1.2.1. Emerton Remark1.2.5 and Theorem3.3.22 supply the missing local compatibility; Theorem1.2.1 has additional promodularity/residual-local assumptions. This is a citation correction, not a refutation of DP Theorem1.4.

### Part R22.1: GL2ModularityLifting/E8 — misprint

**Source:** [`DIEULEFAIT-PACETTI`](https://arxiv.org/pdf/2108.07577v2), Proof of Theorem 1.4, p. 4, arXiv:2108.07577v2; independently collated with the published article, RACSAM117 (2023), article153, p.4 (numeric references [9], [13], [11], [38]).

Cite the forms that assume ρ̄ modular: Kisin's Theorem (2.2.18) (the DVI's (2.2.17)), Hu–Tan's Theorem 6.3 and Tung's Theorem 4.7. The cited introduction theorems assume only that ρ̄ is odd, and take its modularity from Khare–Wintenberger.

Kisin's introduction says that by Khare–Wintenberger the hypothesis that ρ̄ is odd implies that it is modular. Hu–Tan's proof of Theorem 1.4 says that for it one needs only that ρ̄ is modular, which is the main result of Khare–Wintenberger. A proof of Serre's conjecture can use only the forms that assume ρ̄ modular, and Theorem 1.4 as stated assumes it, so the conclusion stands.

**Recorded source-issue review:** confirmed. Confirmed and collated with DP published p.4. Kisin DVI2.2.17, Hu–Tan6.3 and Tung4.7 have explicit residual modularity; the introductory absolute statements invoke Serre. Emerton p.96 also explicitly invokes Serre for promodularity. DP's conditional lifting conclusion survives with the corrected references.

### Part R22.1: GL2ModularityLifting/E9 — error

**Source:** [`DIEULEFAIT-PACETTI-PUBLISHED`](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), Lemma 1.13, torus-normaliser case in its proof, published p. 8; also arXiv 2108.07577v2, p.8.

Diagonalise H itself. A nonscalar abelian H has two character lines; normality of H makes G permute them. The permutation character factors through the cyclic cyclotomic quotient and kills its square subgroup. The original torus need not contain H.

In characteristic greater than 2 let A=diag(1,−1), W=(0 1;1 0), G=⟨A,W⟩ and H=⟨−I,W⟩. Then |G|=8, |H|=4 and H is normal: AWA⁻¹=−W∈H. The quotient G/H is cyclic of order 2, but W is not diagonal. Thus the claimed group-theoretic assertion is false, even under reducible H and cyclic G/H. This refutes the proof step, not the Galois lemma.

**Recorded source-issue review:** confirmed. The matrices give the asserted normal subgroup explicitly. The H-eigenline argument repairs the torus-normaliser case without changing the lemma's conclusion.

### Part R32.3: GL2ModularityLifting/E1 — gap

**Source:** [`DP-PUBLISHED`](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf), Theorem 1.7, fourth hypothesis, published p.5; arXiv v2 p.4.

Require ψ to be a finite-order character in det ρ=ψε^{k−1}, as in the Skinner–Wiles theorem cited in its proof. The lifting and transfer nodes in this packet retain this qualification.

Skinner–Wiles, printed p.6, explicitly assumes finite-order ψ. Without it, det ρ=ψε^{k−1} is satisfied tautologically by defining ψ from any ordinary representation and does not force a classical integral weight. The cited theorem therefore does not prove the unrestricted wording. The surrounding geometric use has finite-order ψ, so the DP application is unchanged.

**Recorded source-issue review:** confirmed. Independently read the publisher PDF p.5 and arXiv v2 p.4: Theorem 1.7 writes det ρ=ψχ₃^{k−1} but places no finite-order restriction on ψ. The cited Skinner–Wiles theorem on the Numdam image, printed p.6, explicitly requires ψ finite order. An arbitrary choice ψ=det ρ·χ₃^{1−k} makes the unrestricted determinant condition vacuous, so the cited theorem proves only the qualified statement retained by this packet. This confirms a gap in the citation, rather than claiming a counterexample to the full printed theorem.

## Remaining mathematical and signature obligations

The following are the packets' retained gaps. An assembly does not discharge them or promote a layer to closed. Named upstream interfaces remain requests until the exact supplying statements and their hypotheses are available; the complete request and ownership registers are in the assembly handoff.

### Part R22.1, obligation 1: Typed suggested signatures and tests are incomplete

Typed in the suggested file, over stand-ins for the suppliers' objects (an 'Imported interfaces' section of definitions built from Mathlib and of data types and functions without a body): R22.1/allowable-base-change, R22.1/determinant-character-kinds, R22.5/kw-residual-modularity and R22.5/kw-residual-modularity-beta, each with every API item and unit test of the packet under its packet name, and R32.1/p-star. Still comment sketches with undeclared supplier types: the definitions and constructions listed in neededBy. Supply the actual types from the owners and explicit signatures; do not use arbitrary Prop-valued fields, vacuous tests or placeholder predicates to make the file compile. Among the theorems, KW II Theorems 8.2 and 8.4, the dyadic branch of Lemma 7.10 and KW I Theorem 4.1 are sketches too, because their local conditions at p (crystalline, semistable, Weil–Deligne types) have no statable form at the pinned libraries.

**Needed by:** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); [`GL2ModularityLifting:R22.2/auxiliary-level-groups`](#r22-2-auxiliary-level-groups); [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra); [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system); [`GL2ModularityLifting:R22.2/dyadic-twists-of-forms`](#r22-2-dyadic-twists-of-forms); [`GL2ModularityLifting:R22.3/arithmetic-patching-data`](#r22-3-arithmetic-patching-data); [`GL2ModularityLifting:R22.4/ihara-avoidance-comparison`](#r22-4-ihara-avoidance-comparison); [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring); [`GL2ModularityLifting:R32.1/lifting-statement-table`](#r32-1-lifting-statement-table); [`GL2ModularityLifting:R22.5/strong-residual-modularity`](#r22-5-strong-residual-modularity); [`GL2ModularityLifting:R32.1/p-star`](#r32-1-p-star); [`GL2ModularityLifting:R32.1/dyadic-lifting-proposition`](#r32-1-dyadic-lifting-proposition); [`GL2ModularityLifting:R32.1/residually-reducible-lifting-proposition`](#r32-1-residually-reducible-lifting-proposition); [`GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`](#r32-1-ordinary-three-lifting-proposition).

### Part R22.1, obligation 2: Declaration granularity and API promotion still required

Fourteen declarations have been separated in this review, but the finite-level constructors still combine independent data/lemmas. In particular auxiliary-hecke-algebra combines an algebra, maximal ideal, comparison map, surjectivity and bijectivity; framed-hecke-module combines ring/module constructions and their properties; delta-freeness combines freeness and coinvariant control. Fix the suppliers' actual types, split those statements, give each definition ≥3 genuine tests, and promote any API used by another node to its own prerequisite node. An outline name is not a proof dependency.

**Needed by:** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); [`GL2ModularityLifting:R22.1/deformation-to-hecke-map`](#r22-1-deformation-to-hecke-map); [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); [`GL2ModularityLifting:R22.2/auxiliary-level-groups`](#r22-2-auxiliary-level-groups); [`GL2ModularityLifting:R22.2/auxiliary-hecke-algebra`](#r22-2-auxiliary-hecke-algebra); [`GL2ModularityLifting:R22.2/delta-freeness-at-taylor-wiles-level`](#r22-2-delta-freeness-at-taylor-wiles-level); [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system); [`GL2ModularityLifting:R22.2/dyadic-twists-of-forms`](#r22-2-dyadic-twists-of-forms); [`GL2ModularityLifting:R22.3/arithmetic-patching-data`](#r22-3-arithmetic-patching-data); [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); [`GL2ModularityLifting:R22.4/ihara-avoidance-comparison`](#r22-4-ihara-avoidance-comparison); [`GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`](#r22-4-integral-r-equals-t-when-smooth); [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring).

### Part R22.1, obligation 3: Arithmetic patching constants and finite-level maps

Define r_m, r′_m, the power ideal 𝔪^(r_m), all structural maps and their compatibilities, bounded lengths and the finite-isomorphism-class relation in KW II pp.81–87. Distinguish Δ′ on the ring from Δ on the free module; after killing isotropy use p^(n−a), index n+a, and a fixed a with p^a>N. The dyadic determinant-one finite quotient D″_m only surjects onto D_m with kernel inside its mth maximal-ideal power; equality holds in the inverse limit, not at finite level. R03.5 must supply the exact inverse-limit and quotient-exactness contracts.

**Needed by:** [`GL2ModularityLifting:R22.3/arithmetic-patching-data`](#r22-3-arithmetic-patching-data); [`GL2ModularityLifting:R22.3/patched-ring-and-module`](#r22-3-patched-ring-and-module); [`GL2ModularityLifting:R22.6/dyadic-patched-ring`](#r22-6-dyadic-patched-ring).

### Part R22.1, obligation 4: Finite presentation needed for framed tensor and support descent

State the finite-presentation hypotheses allowing ordinary base change along R[[y]] to identify the relevant finite modules with formal power series; arbitrary tensor products do not commute with infinite products. Verify noetherian/finiteness for annihilator and support specialisation, catenarity/equidimensionality and the unique special-fibre minimal-prime lifting hypotheses in R03.6/nearly-faithful-lift-from-special-fibre. Generic-fibre projectivity and faithful specialisation need the precise R03.3 input, not an appeal to depth alone.

**Needed by:** [`GL2ModularityLifting:R22.1/framed-hecke-module`](#r22-1-framed-hecke-module); [`GL2ModularityLifting:R22.2/taylor-wiles-module-system`](#r22-2-taylor-wiles-module-system); [`GL2ModularityLifting:R22.3/patched-support`](#r22-3-patched-support); [`GL2ModularityLifting:R22.3/generic-fibre-r-equals-t`](#r22-3-generic-fibre-r-equals-t); [`GL2ModularityLifting:R22.4/support-transfer-mod-lambda`](#r22-4-support-transfer-mod-lambda); [`GL2ModularityLifting:R22.4/modularity-from-full-support`](#r22-4-modularity-from-full-support).

### Part R22.1, obligation 5: Integral R=T and numerical presentation bound

Import or split KW II Proposition4.5, Lemma4.6 and the following remark: the relation count and local/global dimensions make framing variables, relations and p a system of parameters of B[[x]]. Only then does Cohen–Macaulayness make the relevant sequence regular and transmit Cohen–Macaulay/Gorenstein/complete-intersection properties. Identify the exact GlobalGaloisDeformations and R03 declarations for that bound and descent.

**Needed by:** [`GL2ModularityLifting:R22.4/integral-r-equals-t-when-smooth`](#r22-4-integral-r-equals-t-when-smooth).

### Part R22.1, obligation 6: Solvable base change and image-preserving local prescription

Existence of the field is now planned: R22.1/allowable-base-change-existence derives the extension with every prescribed completion, even degree, the conditions at p and linear disjointness from Clozel–Harris–Taylor's Lemma 4.1.2 (requested from PotentialModularityAndCompatibleSystems R23.1), and R22.1/alpha-beta-under-allowable-base-change transports the residual witnesses. Still open: Gee Proposition 4.25 requires irreducibility after restriction and is requested from GL2AutomorphicRepresentationsAndTransfer R17.4, which supplies automorphic base change and descent only; Taylor's Lemma 2.2 ('On icosahedral Artin representations II'), which KW II cite for the field, was not read; and each lifting theorem of R22.5–R22.6 must state the local extensions it prescribes at the places of ramification of the given lift.

**Needed by:** [`GL2ModularityLifting:R22.5/kw-residual-modularity`](#r22-5-kw-residual-modularity); [`GL2ModularityLifting:R22.5/solvable-base-change-reduction`](#r22-5-solvable-base-change-reduction); [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting); [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting); [`GL2ModularityLifting:R22.5/fontaine-laffaille-lifting`](#r22-5-fontaine-laffaille-lifting); [`GL2ModularityLifting:R22.6/kw-dyadic-lifting`](#r22-6-kw-dyadic-lifting); [`GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`](#r22-6-kisin-dyadic-component-criterion); [`GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`](#r22-6-kisin-dyadic-bt-lifting); [`GL2ModularityLifting:R22.5/kw-residual-modularity-beta`](#r22-5-kw-residual-modularity-beta); [`GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`](#r22-5-kisin-nonordinary-pbt-lifting); [`GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`](#r22-5-kisin-pbt-lifting-over-q).

### Part R22.1, obligation 7: Type and determinant transport of Barsotti–Tate components

The existing R08.4/rank-two-bt-components and R08.5 component/dyadic nodes are now used. Supply the fixed-determinant/fixed-type and base-change comparison to the actual modular and target points. For split distinct unramified residual characters there are two ordinary components (Kisin Annals3.4.7); match the residual quotient character or impose the source's indecomposable/trivial residual condition before replacing component equality by ordinarity equality.

**Needed by:** [`GL2ModularityLifting:R22.5/component-patching`](#r22-5-component-patching); [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting); [`GL2ModularityLifting:R22.6/kisin-dyadic-component-criterion`](#r22-6-kisin-dyadic-component-criterion); [`GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`](#r22-6-kisin-dyadic-bt-lifting); [`GL2ModularityLifting:R22.5/strong-residual-modularity`](#r22-5-strong-residual-modularity); [`GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`](#r22-5-kisin-nonordinary-pbt-lifting); [`GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`](#r22-5-kisin-pbt-lifting-over-q).

### Part R22.1, obligation 8: Image-theoretic bridges in the quadratic irreducibility proof

Source issue E9 repairs the torus-normaliser proof: diagonalise the normal subgroup itself and use the induced permutation of its two character lines. Formalise the scalar-subgroup alternative, semisimplicity in the prime-to-p case, the cyclic cyclotomic quotient and its square subgroup, and solvability of triangular/dihedral groups. The cited Mathlib solvability closure lemmas and a Dickson classification stage do not by themselves supply these representation-theoretic arguments or the quadratic-subfield identification.

**Needed by:** [`GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`](#r32-1-quadratic-cyclotomic-irreducibility); [`GL2ModularityLifting:R32.1/non-solvable-residual-image`](#r32-1-non-solvable-residual-image).

### Part R22.1, obligation 9: Hodge–Tate twists and weight-preserving modular twists

Supply the de Rham tensor/twist weight formula, classification of the global de Rham character as ε^m times finite order under the needed ramification hypotheses, the Dirichlet-character correspondence and Galois compatibility of twisting a cuspidal eigenform. The split weight-of-modular-twist lemma explicitly assumes k,k′≥2. LocalGaloisDeformationRings/R08.3 defines Hodge types; that definition does not prove these facts.

**Needed by:** [`GL2ModularityLifting:R32.1/hodge-tate-and-oddness-normalisation`](#r32-1-hodge-tate-and-oddness-normalisation); [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q); [`GL2ModularityLifting:R32.1/weight-of-modular-twist`](#r32-1-weight-of-modular-twist).

### Part R22.1, obligation 10: Finite coefficient field and stable integral lattice

Replace the original 'by compactness' explanation with a precise theorem that this continuous finite-dimensional representation into GL₂(ℚ̄_p) is defined over a finite extension E/ℚ_p, and that its compact image preserves an 𝒪_E-lattice. Compactness of an arbitrary subset of ℚ̄_p does not imply containment in a finite extension. Record the coefficient-extension and residual-semisimplification comparison as inputs before applying Tung's finite-E theorem.

**Needed by:** [`GL2ModularityLifting:R32.2/odd-prime-statement-over-q`](#r32-2-odd-prime-statement-over-q).

### Part R22.1, obligation 11: Multiplicity criterion and graded-piece proof inputs

Gee–Kisin B.5.1 uses smoothness of the automorphic points of local rings (including the local–global/monodromy-weight input) to obtain generic rank 2^|R|. B.5.2 needs the filtration, auxiliary smooth type lifts and their reduction surjections, weight nonvanishing, support of each factor, and generic reducedness at Σ. Its last assertion is a 2^(−|R|)-normalised lower bound with the nonexceptional local exclusion, not an unconditional equality. State these separate declarations and their suppliers; the criterion alone does not prove the bound.

**Needed by:** [`GL2ModularityLifting:R32.2/kisin-multiplicity-criterion`](#r32-2-kisin-multiplicity-criterion); [`GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`](#r32-2-kisin-fontaine-mazur-totally-split); [`GL2ModularityLifting:R32.2/patched-graded-piece-bound`](#r32-2-patched-graded-piece-bound).

### Part R22.1, obligation 12: Exceptional local support and independence audit

To cover all p>2, including p=3, combine the appropriate local Breuil–Mézard statements with Hu–Tan Lemma6.1/Proposition6.2 and Tung's automorphy-of-components argument, stating their distinct hypotheses. Local multiplicities alone do not remove the exclusion in Gee–Kisin B.5.2. The R31.5 request and R31.6 independence audit for all auxiliary globalisations remain open. Emerton §7.4's CM-induced example was checked directly but is not a proof of independence for the whole chain. R32.2/application-requirements no longer imports a node of ClassicalSerreModularity R33: it is the contract that R33.1/dp-modularity-lifting-inputs cites, so the dependency between the two roadmaps runs from R32.2 to R33 only. No claim of independence of the whole modern route is made here.

**Needed by:** [`GL2ModularityLifting:R32.1/exceptional-local-cases`](#r32-1-exceptional-local-cases); [`GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`](#r32-2-odd-prime-de-rham-lifting).

### Part R22.1, obligation 13: Prescribed-type modular witnesses not established by the existing Q-only exports

The KW II §8 witness is now planned by the new R22.1 nodes, with the field existence of R22.1/allowable-base-change-existence and explicit R18/R19 supplier inputs; it no longer lands at R20.6. This does not close the distinct Kisin quaternionic type/level-change, Gee prescribed-weight and Gee §4.6 contracts. The original Gee prescribed-types paper is still not newly read in this fix.

**Needed by:** [`GL2ModularityLifting:R22.1/minimal-level-data`](#r22-1-minimal-level-data); [`GL2ModularityLifting:R22.5/kw-odd-prime-lifting`](#r22-5-kw-odd-prime-lifting); [`GL2ModularityLifting:R22.5/kisin-potentially-bt-lifting`](#r22-5-kisin-potentially-bt-lifting); [`GL2ModularityLifting:R22.6/kw-dyadic-lifting`](#r22-6-kw-dyadic-lifting); [`GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`](#r22-6-kisin-dyadic-bt-lifting); [`GL2ModularityLifting:R32.2/kisin-fontaine-mazur-totally-split`](#r32-2-kisin-fontaine-mazur-totally-split); [`GL2ModularityLifting:R22.5/kisin-nonordinary-pbt-lifting`](#r22-5-kisin-nonordinary-pbt-lifting); [`GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`](#r22-5-kisin-pbt-lifting-over-q); [`GL2ModularityLifting:R32.2/patched-graded-piece-bound`](#r32-2-patched-graded-piece-bound).

### Part R22.1, obligation 14: Ordinary-three predicate transport and external references after splits

The ordinary-3 predicate now states that ψ is finite order; source Theorem1.7's shorthand must be checked against the exact ordinary supplier, together with its nontrivial local character condition. Splitting lifting-statement-table into four propositions preserves the odd-prime identifier but external consumers of the former bundle need their prerequisites sharpened to the relevant new proposition nodes. Those other packets are outside this review's writable files.

**Needed by:** [`GL2ModularityLifting:R22.5/ordinary-overlap`](#r22-5-ordinary-overlap); [`GL2ModularityLifting:R32.1/residual-modularity-forms`](#r32-1-residual-modularity-forms); [`GL2ModularityLifting:R32.2/application-requirements`](#r32-2-application-requirements); [`GL2ModularityLifting:R32.1/ordinary-three-lifting-proposition`](#r32-1-ordinary-three-lifting-proposition).

### Part R22.1, obligation 15: Dyadic dimension, regularity and integral faithfulness bridges

KW II Lemmas9.5 and9.6 are now separate declarations. Supply the precise formal-torus quotient dimension theorem, regularity descent along the formally smooth torsor, transitivity of T[2] on generic-fibre components, and extension of compatible finite-level twist actions to the inverse limit. The 𝒪-flatness argument is essential for integral faithfulness, not only support after inverting2.

**Needed by:** [`GL2ModularityLifting:R22.6/dyadic-power-series-isomorphism`](#r22-6-dyadic-power-series-isomorphism); [`GL2ModularityLifting:R22.6/dyadic-generic-fibre-regular`](#r22-6-dyadic-generic-fibre-regular); [`GL2ModularityLifting:R22.6/dyadic-patched-module-faithful`](#r22-6-dyadic-patched-module-faithful).

### Part R22.1, obligation 16: One case of KW I Theorem 4.1(2) is taken from an unread paper

Verified: KW II §10.2 (p. 92) with its Remark, which says that Theorem 9.7 treats every case of Theorem 4.1(2)(i) except k = p + 1 with k(ρ̄) = 2, and case (2)(ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2. Planned or requested: potentially Barsotti–Tate lifts (R22.5/kisin-pbt-lifting-over-q); the reduction of the remaining lifts of case (ii) to type (C) by a twist; and the ordinary crystalline lift of weight p + 1 with k(ρ̄) = 2 through the atlas's ordinary lifting theorem (OrdinaryAutomorphicFormsAndModularityLifting R21.4, requested), where KW II cite Diamond, On deformation rings and Hecke rings; whether R21.4's hypotheses cover that case is for its blueprint to confirm. Not planned and not read: Kisin, Modularity of some geometric Galois representations (Durham 2004), cited for k = p + 1 with k(ρ̄) = 2 and a lift non-ordinary at p. Next source action: read it for the exact statement used and plan it in R22.5.

**Needed by:** [`GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`](#r22-5-kw-i-theorem-4-1-odd-prime).

### Part R32.3, obligation 1: Source-independence certification of the auxiliary globalisations

The read theorem statements and Tung §4.3 identify the exact potential-modularity/globalisation and weight-change leaves. Their independent proofs (Calegari 3.2, Snowden 8.2.1, KW II 6.1, Paškūnas 3.29, CEG+16/Emerton–Paškūnas/BLGG13, and Gee 4.4.12) have not all been read here. The R31.6 and R20.6 requests must supply a restricted independent construction or explicitly expose any full-Serre dependence. This plan does not certify the independent R33 proof until those exports are established.

**Needed by:** [`GL2ModularityLifting:R32.6/globalisation-dependency-audit`](#r32-6-globalisation-dependency-audit); [`GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`](#r32-3-totally-real-dyadic-lifting).

### Part R32.3, obligation 2: Absent arithmetic carriers prevent full suggested signatures

At the pinned baseline the exact global/local Galois representations, determinant-fixed pseudodeformation rings, Hecke-point reconstruction, local Hodge predicates and modular-form attachment interfaces required by the named lifting theorems are not available together. The suggested file gives actual spectrum/finite-chain definitions, their full APIs/tests, and a complete indexed omission manifest for the remaining signatures, rather than arbitrary proposition parameters. Implement the listed R01/R04/IHG/R06/R21/R30/R31 exports to elaborate those arithmetic signatures. The indexed omission manifest covers every arithmetic node/API/test; the two geometric definitions elaborate only as incidence prototypes and still need the named arithmetic sets/maps for their source specialization. This gap applies to the full named consumer list, not just the five examples previously listed.

**Needed by:** [`GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`](#r32-3-dyadic-de-rham-modularity-lifting); [`GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`](#r32-4-pan-residually-reducible-fontaine-mazur); [`GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`](#r32-4-pan-residually-irreducible-fontaine-mazur); [`GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`](#r32-5-p-three-residually-reducible-branch); [`GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`](#r32-6-transfer-residually-irreducible-odd); [`GL2ModularityLifting:R32.6/transfer-dyadic`](#r32-6-transfer-dyadic); [`GL2ModularityLifting:R32.6/transfer-residually-reducible`](#r32-6-transfer-residually-reducible); [`GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`](#r32-6-de-rham-lifting-and-almost-strict-systems); [`GL2ModularityLifting:R32.6/globalisation-dependency-audit`](#r32-6-globalisation-dependency-audit); [`GL2ModularityLifting:R32.3/typed-component-specialisation`](#r32-3-typed-component-specialisation); [`GL2ModularityLifting:R32.3/totally-real-dyadic-lifting`](#r32-3-totally-real-dyadic-lifting); [`GL2ModularityLifting:R32.4/nice-prime`](#r32-4-nice-prime); [`GL2ModularityLifting:R32.4/potentially-nice-prime`](#r32-4-potentially-nice-prime); [`GL2ModularityLifting:R32.4/nice-prime-component-bridge`](#r32-4-nice-prime-component-bridge); [`GL2ModularityLifting:R32.4/large-component-at-regular-point`](#r32-4-large-component-at-regular-point); [`GL2ModularityLifting:R32.4/generic-ordinary-intersection`](#r32-4-generic-ordinary-intersection); [`GL2ModularityLifting:R32.4/scalar-ordinary-intersection`](#r32-4-scalar-ordinary-intersection); [`GL2ModularityLifting:R32.4/potentially-nice-base-change`](#r32-4-potentially-nice-base-change); [`GL2ModularityLifting:R32.4/good-component`](#r32-4-good-component); [`GL2ModularityLifting:R32.4/extension-components`](#r32-4-extension-components); [`GL2ModularityLifting:R32.4/extension-component-control`](#r32-4-extension-component-control); [`GL2ModularityLifting:R32.4/extension-component-propagation`](#r32-4-extension-component-propagation); [`GL2ModularityLifting:R32.4/cyclotomic-component-connectedness`](#r32-4-cyclotomic-component-connectedness); [`GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity`](#r32-4-nonordinary-hilbert-modularity); [`GL2ModularityLifting:R32.5/ordinary-character-normalisation`](#r32-5-ordinary-character-normalisation); [`GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion`](#r32-5-crystalline-weights-two-four-completion); [`GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`](#r32-6-ramified-reducible-coefficient-prime); [`GL2ModularityLifting:R32.6/transfer-ordinary-three`](#r32-6-transfer-ordinary-three).

## Suggested Lean forms

[`GL2ModularityLifting.lean`](../suggested/GL2ModularityLifting.lean) joins the classical prototype in `TauCeti.ModularityLifting` with the modern component prototype in `TauCeti.GL2Lifting`. The former types residual (α)/(β), allowable extensions, determinant kinds and selected arithmetic/group regressions against supplier stand-ins; its docstrings identify omitted source hypotheses. The latter types seeded component reachability and minimal-prime incidence for actual sets and ring maps, with their planning APIs and unit tests. The arithmetic meaning of those sets and maps still needs the stated suppliers.

The file also retains comment-only sketches and the modern indexed omission manifest. Those comments are not Lean declarations. Compilation does not establish the carrier, signature or source-independence obligations listed above. The full node statements, APIs and tests in this document remain the contracts for completing them.
