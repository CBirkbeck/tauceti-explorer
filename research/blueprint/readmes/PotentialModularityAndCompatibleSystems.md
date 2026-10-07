# Potential modularity and compatible systems

*Roadmap `PotentialModularityAndCompatibleSystems`: the complete blueprint, assembled from its two parts.*

This document is definitive. Its machine form is two part packets, and it is generated from them as their independent reviews left them, so that document and packets agree node for node:

- `research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json`: layers R23.1–R23.6, R24.1 and R24.2, 49 nodes. Written by BP-PotentialModularityAndCompatibleSystems--R23.1 and corrected in place by REV-PotentialModularityAndCompatibleSystems--R23.1.
- `research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json`: layers R24.3, R24.4, R24.5 with its sub-layer R24.5:operations, and R24.6, 43 nodes. Written by BP-PotentialModularityAndCompatibleSystems--R24.3 and corrected in place by REV-PotentialModularityAndCompatibleSystems--R24.3.

The document replaces the two part documents `research/blueprint/readmes/PotentialModularityAndCompatibleSystems--R23.1.md` and `--R24.3.md`, which describe their packets as they stood before the corrections. None of their node text is reused here; their layer prose is rewritten against the corrected packets. The suggested Lean file `research/blueprint/suggested/PotentialModularityAndCompatibleSystems.lean` joins the two parts' files. It proposes names and signatures; it is not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Purpose and scope

This roadmap proves the potential-modularity theorems on which the Khare–Wintenberger proof of Serre's conjecture rests, and the global-lift and compatible-system theorems built from them. It also owns the general carrier for compatible systems of ℓ-adic representations that the rest of the atlas uses. The proof is staged so that no step uses its own conclusion:

1. a geometric field-selection theorem (Moret–Bailly);
2. potential modularity of a *residual* representation, by finding an auxiliary abelian variety whose other torsion representation is known to be modular;
3. potential modularity of a characteristic-zero lift that is *given as data*, by an independent modularity-lifting theorem;
4. finiteness of the unframed global deformation ring, and from it the *existence* of characteristic-zero lifts of prescribed local type;
5. compatible systems through such lifts, and the change of residual characteristic.

The layers, with what each plans:

- **R23.1, Moret–Bailly's theorem.**
  - Skolem data and integral points; Moret-Bailly's Théorème 1.3, with the curve case through the rigidified Picard functor, Bertini reductions, local density and strong approximation.
  - Taylor's Theorem G and its deduction; forcing linear disjointness by extra split places; generation by Frobenius primes.
  - The forms the potential-modularity papers use: three kinds of local condition (Qian, Proposition 4.2); a preliminary field (BLGHT, Proposition 6.2; Snowden, Proposition 8.2.2); soluble extensions with prescribed completions and the character extension behind them (Clozel–Harris–Taylor, Lemmas 4.1.1–4.1.2); disjointness through a tower; surjective specialisation of a finite quotient (Bianchi, Proposition 4.5.1); the function-field versions of Böckle–Harris–Khare–Thorne §9; potential realisation of local Galois data.
- **R23.2, the auxiliary moduli problem.** Taylor's auxiliary prime, CM field, character and coefficient fields; Taylor's Lemma 1.1; and the application of Moret–Bailly to the twisted Hilbert moduli scheme that HilbertModularVarietiesAndShimuraCurves H6 supplies, directly and after restriction of scalars.
- **R23.3, potential residual modularity.** Taylor 2002 (Theorem 1.6, Corollary 1.7) with its ordinary local shape and modularity transfer; Taylor 2006 (Proposition 4.1, the quaternionic Lemma 1.3, the local shape of Lemma 1.4, the weight and level changes of §5, Theorem 5.7); Khare–Wintenberger's Theorem 6.1 (i)–(ii) and its Annals precursor; Snowden's totally real form and the controlled form of Boxer–Calegari–Gee–Pilloni.
- **R23.4, potential modularity of a given lift**, under the local hypotheses of the lifting theorems.
- **R23.5, control of the extension.** Khare–Wintenberger's Theorem 6.1 (iii): splitting, local containment, disjointness and preserved residual image; and the corrected local Galois data of Boxer–Calegari–Gee–Pilloni, Proposition 9.1.12.
- **R23.6, exports and noncircularity.** The residual and given-lift exports of R23.3 and R23.4 and the table of their permitted uses.
- **R24.1, finiteness over the coefficient ring.** The auxiliary totally real field and Khare–Wintenberger's Theorem 10.1 for the unframed ring; Thorne's ordinary finiteness in its GL₂ totally real form; the Calegari–Geraghty ring.
- **R24.2, existence of characteristic-zero points.** Dimension plus finiteness gives a point; the Khare–Wintenberger lifts of required type; Newton–Thorne's extraction on prescribed components.
- **R24.3, prescribed local lifts.** Böckle's presentation, his Lemma 2 and his minimal R = T theorem; Khare–Wintenberger's minimal lifts (Annals, Theorem 3.3); the four lift types of KW I Theorem 5.1, each theorem, and where each is used; weight-two lifts of prescribed type (Snowden, Gee).
- **R24.4, the KW lifting interface.** The residual hypotheses (α), (β) and KW I Theorem 4.1, imported from GL2ModularityLifting.
- **R24.5:operations, general systems before existence theorems.** The rank-n weakly compatible system and its very weak and extremely weak variants; the two-dimensional strict, almost strict and plain systems; predicates; linear-algebra operations, twists, restriction and induction; L-, Γ- and ε-factors; the Grothendieck ring of ℓ-adic representations; monodromy groups, Larsen's good primes and density-one residual irreducibility; polarized systems and their operations; character and Artin systems and their purity.
- **R24.5, compatible systems from potential modularity.** The Brauer-induction system through a potentially modular lift, its almost strict and strict compatibility, KW I Theorem 5.1's systems, and Dieulefait's families in the scope R23.4 reaches.
- **R24.6, changing residual characteristic.** Residual members, what an almost strict system says at its own coefficient prime, and linked systems.

The blueprint has 92 nodes: 8 definitions, 11 constructions, 18 lemmas, 45 theorems, 4 comparisons and 6 applications, with 121 API items, 83 unit tests and 29 planets, citing 221 source passages from 29 sources and 30 pinned library declarations. Every layer is planned at target level; none is closed. The 29 recorded gaps and the 59 requests to other roadmaps are listed at the end, with every layer's open items.

**What is not here.**

- Hilbert modular varieties, their twisted torsion and polarisation moduli, components, real and finite local points: HilbertModularVarietiesAndShimuraCurves H6. R23.2 chooses arithmetic data and applies them.
- Restriction of scalars of varieties and abelian schemes: AbelianSchemesAndArithmeticModuli A6.
- Modularity-lifting theorems: OrdinaryAutomorphicFormsAndModularityLifting R21, GL2ModularityLifting R22 and R32. R24.4 imports KW I Theorem 4.1 from R22.5–R22.6; it is not proved twice.
- Galois representations of Hilbert modular forms, their local–global compatibility and the eigenform families: AutomorphicGaloisRepresentations R19. R19.3 instantiates the carrier of R24.5:operations.
- Soluble base change and descent, Jacquet–Langlands, Langlands–Tunnell: GL2AutomorphicRepresentationsAndTransfer R17.
- Local and global deformation rings and their commutative algebra: LocalGaloisDeformationRings, GlobalGaloisDeformations R04, DeformationAndDerivedPatchingAlgebra R03.
- Serre weights and level and weight optimisation: AlgebraicModularFormsAndSerreWeights R15, SerreWeightAndLevelOptimisation R20.
- Serre's conjecture itself, its classical and modern routes: ClassicalSerreModularity and SmallRamificationAndAbelianVarietyBaseCases, which consume R23.4 and R24.3–R24.6.
- Potential automorphy for GL_n and the assembly of potential-automorphy endpoints: ModularityAndLanglandsExtensions ML.2 and PotentialAutomorphyInfrastructure PA.5. ML.2 cites R23.1's Moret–Bailly theorem and the systems of R24.5:operations.
- The modularity of abelian surfaces (Boxer–Calegari–Gee–Pilloni) and the automorphy of Ĝ-local systems over function fields (Böckle–Harris–Khare–Thorne) consume R23.1–R23.5; their main theorems are not targets here.

## Boundaries

The roadmap sits between the automorphic and deformation-theoretic roadmaps it imports and the Serre-conjecture and potential-automorphy roadmaps that consume it. A one-line test decides whether something is in scope: it is here if it chooses a field, proves potential modularity of a residual representation or of a given lift, proves finiteness of a global deformation ring or extracts a characteristic-zero point from it, constructs a prescribed lift, or defines, operates on or constructs a compatible system. Everything such a statement uses about Hilbert modular forms, moduli spaces, deformation rings or modularity lifting is imported.

**Restructuring decisions that fix the boundary.** Four accepted proposals settle ownership here.

- **RS-06.** R24.3 owns the application of the global presentation and the auxiliary R = T theorem to prescribed lifts (Böckle's appendix and Khare–Wintenberger), formerly planned in ClassicalSerreModularity R26.1–R26.2. The ClassicalSerreModularity layers R26.1, R26.2, R27.1, R27.5, R33.1 and R33.2 and SmallRamificationAndAbelianVarietyBaseCases R25.5 keep only their proof-specific applications and import R24.3, R24.4, R24.5 and R24.6.
- **RS-08.** LocalGaloisDeformationRings R08.4 and R08.5 are forwarded to R23.4 and R24.1 after the narrowing of GL2ModularityLifting R22.6; this adds no new path.
- **RS-12.** R24.5:operations owns the generic compatible-system carrier, with actual representations at the coefficient places and separate weak, almost strict and strict local predicates, and the general operations on systems. These were formerly planned in AutomorphicGaloisRepresentations R19.3 and AutomorphicGaloisRepresentationsPartII AG2.2 and AG2.6. R24.5:operations therefore precedes R19.3, R19.4, AG2.2, AG2.6, AG2.7 and ComplexMultiplicationAndExplicitReciprocity CM.4. It depends on no layer of this roadmap: none of its 22 nodes uses an eigenform, potential-modularity or potential-automorphy theorem.
- **RS-21.** The projective representations of upstream InductionRestriction Layer 7 are imported by R23.3 directly, rather than through GL2AutomorphicRepresentationsAndTransfer R17.5.

**Dependency discipline.** Within the roadmap the edges run: field selection and an independent auxiliary lifting theorem → residual modularity (R23.3) → finiteness (R24.1) → characteristic-zero points (R24.2) → prescribed lifts (R24.3) → compatible systems (R24.5) → change of characteristic (R24.6). Potential modularity of a given lift (R23.4) branches off residual modularity and is used by the compatible-system construction; it never produces a lift. Nothing in R24.2 or later feeds the proof of R23.3. The atlas orders R24.4 after R24.3, but R24.4's two nodes use no node of R24.1–R24.3: KW I Theorem 4.1 rests on the lifting theorems of R22 and the Serre-weight inputs of R20, and R24.5 takes its lifts from R24.3 directly. The note for the maintainer at the end records this edge.

### What this roadmap imports

Every layer or node of another roadmap that a node here cites, or that a request here is filed with, with the nodes that use it. A layer cited without a node id is either a request, listed under [Requests to other roadmaps](#requests-to-other-roadmaps) with the exact statement needed, or an import of that layer's stated scope. Pinned Mathlib and Tau Ceti declarations are listed separately under [What the pinned libraries have](#what-the-pinned-libraries-have).

| Supplier | Layer or node cited | Consumers here |
|---|---|---|
| Abelian Schemes And Arithmetic Moduli | `A6` | [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent) |
|  | `A6/weil-restriction-functor` | [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent) |
|  | `A6/weil-restriction-of-quasi-projective-schemes` | [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent) |
|  | `A6/weil-restriction-over-a-separable-extension-splits` | [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent) |
| Algebraic modular forms, reduction and Serre weights | `R15.4` | [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems), [`R24.6/residual-members`](#n-r24-6-residual-members) |
|  | `R15.6` | [`R24.3/required-lift-types`](#n-r24-3-required-lift-types) |
| Algebraic moduli and representability for arithmetic geometry | `R09.3` | [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration) |
| Arithmetic Galois representations and conductors | `G7` | [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/polarized-operations`](#n-r24-5-polarized-operations), [`R24.5/polarized-system`](#n-r24-5-polarized-system), [`R24.5/system-operations`](#n-r24-5-system-operations) |
|  | `R01.1` | [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.6/residual-members`](#n-r24-6-residual-members) |
|  | `R01.2` | [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/system-operations`](#n-r24-5-system-operations) |
|  | `R01.3` | [`R24.6/residual-members`](#n-r24-6-residual-members) |
|  | `R01.4` | [`R24.6/residual-members`](#n-r24-6-residual-members) |
|  | `R01.5` | [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer), [`R24.6/residual-members`](#n-r24-6-residual-members) |
| Galois representations attached to modular and Hilbert modular forms | `R19.2` | [`R23.3/bcgp-controlled-residual-modularity`](#n-r23-3-bcgp-controlled-residual-modularity), [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations), [`R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction`](#n-r23-3-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction) |
|  | `R19.3` | [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) |
|  | `R19.4` | [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system) |
|  | `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` | [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t) |
|  | `R19.5` | [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system), [`R24.6/local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime) |
|  | `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime` | [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility) |
|  | `R19.6` | [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring) |
| Commutative algebra for deformation theory and patching | `R03.3` | [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection) |
|  | `R03.3/regular-local-cohen-macaulay` | [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection) |
|  | `R03.4` | [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring) |
|  | `R03.4/characteristic-zero-points-from-finiteness-and-dimension` | [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction) |
| Endoscopic transfer and unitary trace comparison | `ET.6` | [`R24.5/system-l-functions`](#n-r24-5-system-l-functions) |
| GL₂ Automorphic Representations And Transfer | `R17.3` | [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations) |
|  | `R17.4` | [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l), [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension), [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system) |
|  | `R17.5` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`](#n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l) |
|  | `R17.6` | [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system) |
| GL₂ Modularity Lifting | `R22.3` | [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t) |
|  | `R22.3/minimal-ring-finite` | [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring), [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t), [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts) |
|  | `R22.4` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument) |
|  | `R22.5` | [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1) |
|  | `R22.5/kw-odd-prime-lifting` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift), [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1) |
|  | `R22.5/kw-residual-modularity` | [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift), [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity) |
|  | `R22.5/solvable-base-change-reduction` | [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift), [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension), [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1) |
|  | `R22.6/kw-dyadic-lifting` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift), [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1) |
|  | `R32.6/transfer-dyadic` | [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) |
|  | `R32.6/transfer-residually-irreducible-odd` | [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) |
|  | `R32.6/transfer-residually-reducible` | [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) |
| Global Galois deformation rings | `R04.2/carayol-trace-theorem` | [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations) |
|  | `R04.3/global-dimension-lower-bound` | [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) |
|  | `R04.3/local-to-global-presentation` | [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation) |
|  | `R04.3/relative-tangent-space` | [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation) |
|  | `R04.6` | [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction) |
|  | `R04.6/factorization-through-local-conditions` | [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) |
|  | `R04.6/kw-deformation-data` | [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring), [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types) |
|  | `R04.6/trace-subring-universal-representation` | [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring), [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type) |
| Hilbert Modular Varieties And Shimura Curves | `H6` | [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l) |
|  | `R18.3` | [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f) |
| Local Galois deformation rings and their components | `L8` | [`R24.1/cg-ordinary-ring-finiteness`](#n-r24-1-cg-ordinary-ring-finiteness), [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness) |
|  | `R08.2` | [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument) |
|  | `R08.6` | [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction), [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types) |
|  | `R08.6/export-away-from-p` | [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) |
|  | `R08.6/export-completed-tensor-product` | [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type) |
|  | `R08.6/export-endpoint-weight` | [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts) |
|  | `R08.6/kw-local-conditions` | [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types) |
|  | `R08.6/local-nonemptiness` | [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) |
| Ordinary automorphic forms and ordinary modularity lifting | `R21.4` | [`R24.1/cg-ordinary-ring-finiteness`](#n-r24-1-cg-ordinary-ring-finiteness), [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness) |
|  | `R21.5` | [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l) |
|  | `R21.5/nearly-ordinary-irreducible-lifting` | [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l) |
|  | `R21.6` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f) |
| Hida and Coleman families, period modules, and family L-functions | `L5` | [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction) |
|  | `L5/hida-control-nearly-ordinary` | [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction) |
| P-adic Hodge theory and geometric comparison | `R06.2` | [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n) |
|  | `R06.3/weil-deligne-descent` | [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system), [`R24.6/local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime) |
|  | `R06.3/weil-deligne-parameter` | [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/system-l-functions`](#n-r24-5-system-l-functions), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n) |
|  | `R06.4` | [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l) |
|  | `R06.4/fontaine-laffaille-crystalline-comparison` | [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l) |
|  | `R06.4/fontaine-laffaille-rational-consequences` | [`R24.6/residual-members`](#n-r24-6-residual-members) |
| Scheme, stack, cohomology and intersection foundations | `SF.1` | [`R23.1/function-field-isomorphism-torsor`](#n-r23-1-function-field-isomorphism-torsor), [`R23.1/potential-global-galois-local-data`](#n-r23-1-potential-global-galois-local-data) |
|  | `SF.2` | [`R23.1/function-field-isomorphism-torsor`](#n-r23-1-function-field-isomorphism-torsor), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent) |
|  | `SF.3` | [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration), [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient) |
|  | `SF.4` | [`R23.1/elementary-reductions-of-skolem-data`](#n-r23-1-elementary-reductions-of-skolem-data), [`R23.1/reduction-to-relative-dimension-one`](#n-r23-1-reduction-to-relative-dimension-one), [`R23.1/theorem-g-from-moret-bailly`](#n-r23-1-theorem-g-from-moret-bailly) |
| Weight and level optimisation of residual modular representations | `R20.3` | [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f) |
|  | `R20.6` | [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity) |
| Weights and purity in étale cohomology | `R34.6` | [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system) |
| The Chebotarev density theorem | `layer-10-dirichlet-density-chebotarev` | [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate) |
| Class field theory | `layer-11-the-global-class-formation-and-global-artin-reciprocity` | [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity) |
|  | `layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence` | [`R23.1/cht-character-extension`](#n-r23-1-cht-character-extension), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions) |
|  | `layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` | [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions) |
| Global number fields, ray classes, adeles, and Hecke characters | `layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic` | [`R24.5/character-system`](#n-r24-5-character-system) |
|  | `layer-9-hecke-and-ray-class-characters` | [`R24.5/character-system`](#n-r24-5-character-system) |
| Induction, restriction, and Mackey theory for finite groups | `layer-6-the-virtual-character-ring-artin-and-brauer-induction` | [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system) |

### Roadmaps that cite this one

Nodes of other roadmaps' packets that cite a node or a layer of this roadmap. Where a consumer cites a layer, the table of requests below gives the node ids that answer it.

| Consumer | Cites | Consuming nodes |
|---|---|---|
| AutomorphicGaloisRepresentations | [layer R24.5:operations](#layer-r24-5-operations) | `R19.3/fixed-eigenform-compatible-family` |
| AutomorphicGaloisRepresentationsPartII | [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates) | `AG2.6/extremely-weakly-compatible-system`, `AG2.6/polarized-compatible-system-strictly-pure` |
| AutomorphicGaloisRepresentationsPartII | [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n) | `AG2.6/extremely-weakly-compatible-system` |
| ClassicalSerreModularity | [layer R24.3](#layer-r24-3) | `R27.1/good-dihedral-prime-insertion`, `R33.1/paso-1-weight-two-system`, `R33.2/dp-lift-existence-and-good-dihedral-insertion`, `R33.2/paso-3-killing-the-odd-level`, `R33.3/dp-dyadic-transition-and-the-order-three-type`, `R33.3/paso-4-removing-two`, `R33.3/paso-5-killing-the-good-dihedral-prime`, `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case` |
| ClassicalSerreModularity | [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t) | `R26.1/bockle-appendix-minimal-deformation-ring-presentation` |
| ClassicalSerreModularity | [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation) | `R26.1/bockle-appendix-minimal-deformation-ring-presentation` |
| ClassicalSerreModularity | [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection) | `R26.1/bockle-appendix-minimal-deformation-ring-presentation`, `R26.2/lifting-method-flatness` |
| ClassicalSerreModularity | [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts) | `R26.2/lifting-method-flatness`, `R26.4/level-one-lifting-lemma` |
| ClassicalSerreModularity | [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts) | `R33.3/dp-dyadic-transition-and-the-order-three-type` |
| ClassicalSerreModularity | [`R24.3/required-lift-types`](#n-r24-3-required-lift-types) | `R26.2/compatible-system-lifts`, `R26.2/lifting-method-flatness`, `R26.2/minimal-weight-two-lift`, `R26.2/nebentype-lift-at-q` |
| ClassicalSerreModularity | [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline) | `R33.5/auxiliary-odd-prime-for-the-dyadic-system`, `R33.5/globalisation-dependency-check` |
| ClassicalSerreModularity | [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two) | `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`, `R33.5/auxiliary-odd-prime-for-the-dyadic-system`, `R33.5/globalisation-dependency-check` |
| ClassicalSerreModularity | [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) | `R33.3/dp-dyadic-transition-and-the-order-three-type` |
| ClassicalSerreModularity | [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1) | `R26.6/corollary-8-1-ii-and-the-statement-W1`, `R27.2/theorem-3-2-weight-reduction` |
| ClassicalSerreModularity | [layer R24.5](#layer-r24-5) | `R26.2/lifting-method-flatness` |
| ClassicalSerreModularity | [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility) | `R26.2/compatible-system-lifts` |
| ClassicalSerreModularity | [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system) | `R26.2/compatible-system-lifts` |
| ClassicalSerreModularity | [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families) | `R33.5/globalisation-dependency-check` |
| ClassicalSerreModularity | [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems) | `R26.4/level-one-lifting-lemma`, `R26.6/corollary-1-2-proof`, `R26.6/corollary-8-1-ii-and-the-statement-W1`, `R27.2/theorem-3-2-weight-reduction`, `R33.5/auxiliary-odd-prime-for-the-dyadic-system`, `R33.5/globalisation-dependency-check` |
| ClassicalSerreModularity | [layer R24.6](#layer-r24-6) | `R27.1/good-dihedral-prime-insertion`, `R27.3/theorem-3-1-killing-ramification`, `R27.4/auxiliary-characteristic-choice`, `R27.4/strong-form-by-minimal-lifts`, `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`, `R27.5/d1-by-the-prime-three`, `R27.5/dr-for-r-at-least-two`, `R27.5/dyadic-weight-two-claim`, `R27.6/scope-of-the-final-statement-and-the-compatible-system-export`, `R33.1/dp-modularity-lifting-inputs`, `R33.1/paso-1-weight-two-system`, `R33.2/dp-lift-existence-and-good-dihedral-insertion`, `R33.2/paso-3-killing-the-odd-level`, `R33.3/dp-dyadic-transition-and-the-order-three-type`, `R33.3/paso-4-removing-two`, `R33.3/paso-5-killing-the-good-dihedral-prime`, `R33.3/remark-6-weight-two-after-type-change`, `R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case` |
| ClassicalSerreModularity | [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) | `R26.4/degenerate-branches`, `R26.4/level-one-lifting-lemma`, `R26.5/terminal-row-branch-contract`, `R26.6/corollary-1-2-proof`, `R26.6/level-one-proof-assembly`, `R27.2/theorem-3-2-weight-reduction`, `R33.5/dp-characteristic-two-closure`, `R33.5/globalisation-dependency-check` |
| ClassicalSerreModularity | [`R24.6/residual-members`](#n-r24-6-residual-members) | `R26.2/compatible-system-lifts`, `R26.4/level-one-lifting-lemma`, `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`, `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`, `R33.6/elliptic-curve-export-via-either-route` |
| GL2ModularityLifting | [layer R23.1](#layer-r23-1) | `R22.1/allowable-base-change-existence`, `R22.1/lemma-7-10-determinant-adjustment`, `R22.5/solvable-base-change-reduction` |
| GL2ModularityLifting | [`R24.5/compatible-system`](#n-r24-5-compatible-system) | `R32.6/de-rham-lifting-and-almost-strict-systems`, `R32.6/ramified-reducible-coefficient-prime` |
| GL2ModularityLifting | [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda) | `R32.6/de-rham-lifting-and-almost-strict-systems` |
| GL2ModularityLifting | [layer R24.5](#layer-r24-5) | `R32.6/de-rham-lifting-and-almost-strict-systems`, `R32.6/ramified-reducible-coefficient-prime` |
| ModularityAndLanglandsExtensions | [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points) | `ML.2/moret-bailly-galois-control` |
| ModularityAndLanglandsExtensions | [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates) | `ML.2/compatible-systems-potentially-automorphic`, `ML.2/polarized-galois-representation` |
| ModularityAndLanglandsExtensions | [`R24.5/constituents-essentially-self-dual`](#n-r24-5-constituents-essentially-self-dual) | `ML.2/constituents-potentially-automorphic` |
| ModularityAndLanglandsExtensions | [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring) | `ML.2/compatible-system-l-function-continuation`, `ML.2/irreducibility-density-one`, `ML.2/part-of-compatible-system` |
| ModularityAndLanglandsExtensions | [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems) | `ML.2/multiple-product-l-functions` |
| ModularityAndLanglandsExtensions | [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda) | `ML.2/compatible-systems-potentially-automorphic`, `ML.2/part-of-compatible-system` |
| ModularityAndLanglandsExtensions | [`R24.5/residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one) | `ML.2/compatible-systems-potentially-automorphic`, `ML.2/constituents-potentially-automorphic`, `ML.2/decomposition-into-irreducible-systems` |
| ModularityAndLanglandsExtensions | [`R24.5/system-l-functions`](#n-r24-5-system-l-functions) | `ML.2/compatible-system-l-function-continuation` |
| ModularityAndLanglandsExtensions | [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n) | `ML.2/compatible-systems-potentially-automorphic` |
| SmallRamificationAndAbelianVarietyBaseCases | [layer R23.4](#layer-r23-4) | `R25.5/snowden-realisation` |
| SmallRamificationAndAbelianVarietyBaseCases | [layer R24.3](#layer-r24-3) | `R25.5/paso-six-terminal-cases`, `R25.5/small-weight-level-one-exclusion`, `R25.5/weight-p-plus-one-excluded-at-schoof-primes`, `R25.5/weight-two-level-one-excluded` |
| SmallRamificationAndAbelianVarietyBaseCases | [layer R24.5](#layer-r24-5) | `R25.5/paso-six-terminal-cases`, `R25.5/small-weight-level-one-exclusion` |
| WeightsInEtaleCohomology | [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates) | `R34.6/fixed-eigenform-good-prime-compatibility`, `R34.6/hilbert-local-monodromy-weight-export` |
| WeightsInEtaleCohomology | [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n) | `R34.6/fixed-eigenform-good-prime-compatibility`, `R34.6/hilbert-local-monodromy-weight-export` |

**Requests other roadmaps have filed with this one.** Ten requests in other packets name a layer of this roadmap as supplier. The nodes that answer each are below; a consumer can replace its layer citation by these node ids. Where a node answers only part of a request, the rest is said.

| Filed by (packet) | With | Asks for | Answered by |
|---|---|---|---|
| AutomorphicGaloisRepresentations (R19.3/strict-compatibility-and-the-monodromy-weight-purity, R19.3/fixed-eigenform-compatible-family) | R24.5:operations | The generic compatible-system carrier with weak, almost strict and strict local predicates, with coefficient extension, dual and twist, before any potential-modularity existence theorem | Carriers and predicates: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/compatible-system`](#n-r24-5-compatible-system) (with `CompatibleSystem.enlargeCoefficients`), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data). Operations: [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems) (duals) and [`R24.5/system-operations`](#n-r24-5-system-operations) (twists). All are in R24.5:operations, which depends on no potential-modularity theorem. |
| ClassicalSerreModularity--R26.1 (R26.2/lifting-method-flatness, R26.6/corollary-1-2-proof) | R24.5 | Taylor's potential modularity over totally real Galois fields of even degree with ordinary or crystalline π of the prescribed type; the resulting compatible systems; KW Annals Theorem 4.2(ii) | Potential modularity: [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity) and [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f). Systems: [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems). KW Annals Theorem 4.2 has no node of its own; the consumer should check whether types (1) and (2) of `R24.5/kw-theorem-5-1-systems` give the statement it uses. |
| ClassicalSerreModularity--R26.1 (R26.4/level-one-lifting-lemma) | R24.5 | The minimal crystalline lift of KW Annals Theorem 3.3 and the type-(1) system; a crystalline member at a new odd prime with its residual weight | [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems) (type (1)), and [`R24.6/residual-members`](#n-r24-6-residual-members) (v) for the member at the new prime. The residual weight is AlgebraicModularFormsAndSerreWeights R15.4. The consuming node already cites the first, third and fourth. |
| ClassicalSerreModularity--R27.3 (eight nodes of R27.1 and R33.1–R33.4) | R24.3 | The prescribed lifts of Dieulefait–Pacetti Theorem 1.9 (1)–(4), minimal in KW I's sense | [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two) for (1)–(3); [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts) for (4); the correspondence is [`R24.3/theorem-5-1-application-table`](#n-r24-3-theorem-5-1-application-table). For (4) the passage from an inertial type compatible with ρ̄ to a local lift of that type is not argued by Dieulefait–Pacetti; it rests on the local nonemptiness request to LocalGaloisDeformationRings R08.6. |
| ClassicalSerreModularity--R27.3 (eighteen nodes of R27.1–R27.6 and R33.1–R33.4) | R24.6 | Almost strict systems, KW I Theorem 5.1 (1)–(4), Dieulefait's families (DP Theorem 1.11), change of residual characteristic, DP Remark 4 | [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems), [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families), [`R24.6/residual-members`](#n-r24-6-residual-members), [`R24.6/local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime), and [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer) for DP Remark 4. `R24.5/dieulefait-families` plans DP Theorem 1.11 only for the lifts in the scope of R23.4; the rest is a gap (source issue E5 of the R24.3 part). |
| GL2ModularityLifting--R22.1 (three nodes of R22.1 and R22.5) | R23.1 | Clozel–Harris–Taylor, Lemmas 4.1.1 and 4.1.2, with three refinements: (a) a p-primary component of p-power order, (b) a totally real E, (c) weak approximation for squares | [`R23.1/cht-character-extension`](#n-r23-1-cht-character-extension) and [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions); the latter includes (b). Refinements (a) and (c) are not stated by any node here. |
| GL2ModularityLifting--R32.3 (R32.6/de-rham-lifting-and-almost-strict-systems, R32.6/ramified-reducible-coefficient-prime) | R24.5 | The Khare–Wintenberger carrier extended by Dieulefait–Pacetti's clauses (4)–(5), with clause (6) kept weak, as separate predicates | [`R24.5/compatible-system`](#n-r24-5-compatible-system) states the comparison with DP Definition 1.10, including clause (4); its API has no separate predicate for DP's clauses. The consuming nodes already cite it. |
| SmallRamificationAndAbelianVarietyBaseCases (R25.5/snowden-realisation) | R23.4 | Potential modularity of a given weight-two lift in Snowden's form (Theorem 5.1.2), crystalline or Steinberg, over a totally real Galois F″ disjoint from a given field | [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift) for lifts satisfying KW I Theorem 5.1's hypotheses, with [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension) (d) for the disjointness. Snowden's Theorem 5.1.2 itself, for odd p over a totally real base, has no node. |
| SmallRamificationAndAbelianVarietyBaseCases (four nodes of R25.5) | R24.3 | The minimal crystalline lift with Hodge–Tate weights {0, k(ρ̄) − 1} and, for k(ρ̄) = p + 1, the weight-two Steinberg lift unramified outside p | [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two) (inertial parameter (id, N ≠ 0) at k(ρ̄) = p + 1), [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts) |
| SmallRamificationAndAbelianVarietyBaseCases (two nodes of R25.5) | R24.5 | The compatible system through such a lift, crystalline at odd residue characteristics in the level-one case, every member irreducible and odd | [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems) (irreducible, odd systems of type (1)), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system) (crystalline where r_q is unramified), [`R24.6/residual-members`](#n-r24-6-residual-members) (i) |

## Conventions

**Fields and places.** For a global field F, G_F is its absolute Galois group, `Field.absoluteGaloisGroup F` in Mathlib; F_v is the completion at a place v, F_v^nr its maximal unramified extension and F̄_v an algebraic closure; q_v is the cardinality of the residue field at a finite v. Finite extensions and local embeddings are taken over the stated base. Two splitting conditions are kept apart throughout R23:

- *v splits completely in K′* means that every completion of K′ above v equals K_v;
- *K′ is split over L_v*, for a finite Galois L_v/K_v, means that K′ ⊗_K L_v is isomorphic, as an L_v-algebra, to a product of copies of L_v. It does not ask the completions of K′ to equal L_v; they may be proper subfields. With L_v = K_v the two agree. The trivial extension K′ = K with a nontrivial L_v separates them (`skolem_trivial_X`).

Linear disjointness is Mathlib's `IntermediateField.LinearDisjoint`, defined by injectivity of the tensor multiplication map. Trivial intersection follows from it, and implies it only under the finite Galois hypotheses of `IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

**Which prime is which.** The sources name their primes differently, and the nodes keep each source's letters:

| Nodes | Residual characteristic | Other primes |
|---|---|---|
| Taylor 2002 and 2006 (R23.2, the Taylor nodes of R23.3) | l | p is the auxiliary prime; λ \| l and ℘ \| p are places of the coefficient fields M and N |
| Khare–Wintenberger (R23.3–R23.5, R24.1–R24.4) | p | ℓ for other primes; q for the auxiliary prime of the lift types (3) and (4) |
| Snowden | p, odd | — |
| Boxer–Calegari–Gee–Pilloni | q | p is a second prime, split completely like q |
| Compatible systems (R24.5:operations, R24.5, R24.6) | ℓ (or l in the BLGGT nodes) is the residue characteristic of the coefficient place λ, or of the embedding ι | q or v for places of the base field; p for the residual characteristic of the starting ρ̄ in KW I Theorem 5.1 |

**Frobenius, Hodge–Tate weights and determinants.** Two normalisations occur and must be transported, never identified by a change of sign:

- BLGGT and the cohomological examples use geometric Frobenius, and the cyclotomic character ε has Hodge–Tate number −1, Q_p(X) = X − p⁻¹ and weight −2. The member of the Δ family has H = {0, 11}, weight 11 and Q_p(X) = X² − τ(p)X + p¹¹.
- Khare–Wintenberger, Taylor and Snowden use arithmetic Frobenius, give ε Hodge–Tate number +1, and work with the cyclotomic determinant: ρ̄ of S-type (odd and absolutely irreducible), Serre weight k(ρ̄) and conductor N(ρ̄), determinant ψχ_p for the global deformation problem. A newform of weight k gives Hodge–Tate numbers (a, b) = (k − 1, 0). Their arithmetic family is the contragredient of the cohomological one.
- Boxer–Calegari–Gee–Pilloni use the dual torsion representation, with determinant ε̄_q⁻¹ and the automorphic weight-zero convention; λ_α is the unramified character sending arithmetic Frobenius to α.
- Unramified characters are prescribed on arithmetic Frobenius.

**Local deformation conditions and lift types.** The Khare–Wintenberger types (A), (B), (C) at p are the local deformation conditions of LocalGaloisDeformationRings R08.6, with their dyadic exceptions. The four lift types (1)–(4) of KW I Theorem 5.1 are the definition `R24.3/required-lift-types`. Snowden's type function takes the values A, B, C at places above p; compatibility of a type with ρ̄ at a place that must stay split is a hypothesis, not a consequence. The global ring R̄_S^ψ is the unframed fixed-determinant ring of GlobalGaloisDeformations R04.6. Its framed version is formally smooth over it of relative dimension 4|S| − 1 (KW II, Proposition 4.1), so it is never finite over the coefficient ring.

**Compatible systems.** A system stores representations at the coefficient places, not only a table of traces. Two members are equal when they are isomorphic after a common extension of coefficients; good Frobenius polynomials lie in one number field. The compatibility contracts differ and are separate predicates:

| Contract | Away from ℓ | At places above ℓ |
|---|---|---|
| BLGGT weak | unramified outside S, common Q_v | de Rham at every λ; crystalline outside S; common labelled Hodge–Tate multisets H_τ |
| BLGGT strict (on a weak system) | a common Frobenius-semisimple Weil–Deligne parameter WD_v at every finite v, for λ not above v | nothing beyond weak |
| KW plain | common Weil–Deligne parameters r_q | crystalline with the fixed weights (a, b) for ℓ ≫ 0 |
| KW almost strict | as plain | full Weil–Deligne comparison if the residual member is irreducible; crystalline of weights (a, b) if ℓ ≠ 2 and r_q is unramified |
| KW strict | as plain | every member geometric of weights (a, b), with full Weil–Deligne comparison at every q |

A plain or almost strict family satisfies BLGGT's de Rham condition at every member only with an extra hypothesis; Dieulefait–Pacetti's almost strict systems impose it (their Definition 1.10 (4)). The Brauer-induction systems constructed in R24.5 are strictly compatible by Skinner's theorem, including at residually reducible members and ℓ = 2; the almost strict statement is kept as the Khare–Wintenberger variant.

**Spellings in this document.** The R23.1 part writes much of its node prose in ASCII and the R24.3 part in Unicode. In the node sections below, the R23.1 part's prose uses the R24.3 part's spellings: ρ̄, ψ̄, χ̃, F̃, ε, λ, α, β, ζ, π, Σ, Ω, ω, φ, ℘ (for Taylor's `wp`), X̄ (for `X-bar`), √, →, ≤, ≥, ⊗, ℚ, ℤ_p, ℚ_p, 𝔽_l, 𝔽_q, ℤ[…]. Statements are otherwise as in the packets. Literal source excerpts, locators, node ids, declaration names and code spans are unchanged. Each part numbers its mistakes in the sources from E1 or E2, so the same number can denote two different findings; this document always says which part's E-number it means.

## Sources

Every source a node cites, with the version read and the passages read, merged from the two parts. Three sources are cited by both parts under the same id; Snowden's paper has two ids, `snowden` (R23.1 part) and `snowden-2009` (R24.3 part), for the same file, arXiv:0905.4266v1, with the same SHA-256. Böckle–Harris–Khare–Thorne is cited as `bhkt` (arXiv v2) and `bhkt-published` (Acta), and `bhkt-correction` is the paper of Beuzart-Plessis, Harris and Thorne whose p. 28 corrects BHKT's Lemma 9.1. The parts' `sourceVersions` records, with the SHA-256 of each file read, are in the packets.

| Id | Work | Version read | Passages read |
|---|---|---|---|
| <a id="src-moret-bailly-1989-II"></a>`moret-bailly-1989-II` (R23.1) | Laurent Moret-Bailly, *Groupes de Picard et problèmes de Skolem II* ([pdf](https://www.numdam.org/item/10.24033/asens.1582.pdf)) | Ann. Sci. École Norm. Sup. (4) 22 (1989), no. 2, 181-194; Numdam scan with OCR text layer. The OCR drops or mangles Sigma, Omega, script S and inequality signs; every displayed condition used below was re-read on page images. Locators are printed journal pages. SHA-256 `fcd52552f0d04f06…`. | §1 (1.1–1.10) re-read against the Numdam text layer; the draft EXT-12's decomposition of §§2–3 re-verified at its excerpts; p. 192 (Lemme 3.30.2). §1 statement/remarks and §§2–3 reductions and curve proof, OCR text compared with inherited transcriptions; Rem. 1.5 and Lemme 3.6 displays rechecked separately. Corrected the inherited tensor-factor and inverted-prime errors. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-moret-bailly-1989-I"></a>`moret-bailly-1989-I` (R23.1) | Laurent Moret-Bailly, *Groupes de Picard et problèmes de Skolem I* ([pdf](https://www.numdam.org/item/10.24033/asens.1581.pdf)) | Ann. Sci. École Norm. Sup. (4) 22 (1989), no. 2, 161-179; Numdam scan with OCR text layer. Printed page numbers. SHA-256 `b1bec60bc061ae9c…`. | The passages quoted by the carried nodes, re-verified. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-taylor-2002-fontaine-mazur"></a>`taylor-2002-fontaine-mazur` (R23.1) | Richard Taylor, *Remarks on a conjecture of Fontaine and Mazur* ([pdf](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf)) | Author's preprint dated May 23, 2000 (22-page PDF) of the paper published in J. Inst. Math. Jussieu 1 (2002), 125-143. The published numbering was NOT compared; KW II and KW Annals cite results of the published paper by numbers (Theorem G, Lemmas 1.2 and 1.5, Theorem 1.6) that agree with this preprint where checked. The text layer loses the fi/fl ligatures and all Greek letters, so every formula below was read on page images; locators are the preprint's printed page numbers (PDF page = printed page + 1). SHA-256 `e00ebd580b4bdb59…`. | Introduction, Theorem G (pp. 4–5), whose text layer is damaged; the quotations are transcribed and match the words of the text layer. §1, printed pp. 6–16 (standing hypotheses, the auxiliary choices, Lemmas 1.1–1.5, the moduli space X, the Moret-Bailly application, Theorem 1.6 and Corollary 1.7), on the page images. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-kw-serre-modularity-II"></a>`kw-serre-modularity-II` (R23.1, R24.3) | Chandrashekhar Khare, Jean-Pierre Wintenberger, *Serre's modularity conjecture (II)* ([pdf](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf)) | Author's preprint (proofs.pdf, 98 pages, own pagination) of the paper published in Invent. Math. 178 (2009), 505-586. Locators are the preprint's printed page numbers; the Inventiones pagination was not compared. / Author's preprint (proofs.pdf) of the paper published as Invent. Math. 178 (2009), 505–586. Locators give the preprint's page numbers (1–98), which are not the Inventiones pages SHA-256 `53f45f8be3b3c7de…`. | §2 (Proposition 2.2, Definition 2.4), §4 (Propositions 4.1, 4.5, Corollary 4.7), §6 (Theorem 6.1 and proof), §8 (Theorem 8.2), §§10.1 and 10.3. Theorem 6.1 and complete proof pp. 53–57; §10.1 and §10.3.1–2 pp. 90–94. Earlier Taylor-specific page-image readings retain their previous attribution. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. Contents; §6 (Theorem 6.1 and proof, pp. 53–57); §8 (Lemma 8.1, §8.2 with Theorem 8.2, §8.3 lifting data, Theorem 8.4 and proof, pp. 69–78); §9.2 (Theorem 9.7, pp. 89–90); §10 (Theorem 10.1, §§10.2–10.3, pp. 90–94); the bibliography. §8.1–8.2 pp. 69–72, §9.2 pp. 89–90, §10 pp. 90–94, bibliography; statements and excerpts checked against the text layer. |
| <a id="src-kw-annals-2009"></a>`kw-annals-2009` (R23.1, R24.3) | Chandrashekhar Khare, Jean-Pierre Wintenberger, *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)* ([pdf](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf)) | Published version, Annals of Mathematics 169 (2009), 229-253 (received December 3, 2004; revised August 31, 2007). Printed Annals pages. / Annals of Mathematics 169 (2009), 229–253, published version. Locators give printed pages SHA-256 `154c0c2a2245e50c…`. | §2 (Theorem 2.1 and proof, pp. 234–237) and the bibliography. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. §1 (pp. 229–233), §2 (Theorem 2.1, pp. 234–237), §3.1–3.2 (Definition 3.1, Theorem 3.3, Propositions 3.4–3.5, Lemma 3.6, Theorem 3.7, pp. 237–241). Introduction p. 231, §3.1–3.2 pp. 239–242; statements and excerpts checked against the text layer. |
| <a id="src-taylor-2006-meromorphic-continuation"></a>`taylor-2006-meromorphic-continuation` (R23.1, R24.3) | Richard Taylor, *On the meromorphic continuation of degree two L-functions* ([pdf](https://ems.press/content/book-chapter-files/27484)) | Documenta Mathematica, Extra Volume: John H. Coates' Sixtieth Birthday (2006), 729–779 (received January 9, 2005; revised June 28, 2006); EMS Press open-access chapter file (52-page PDF regenerated by the publisher from the original dvi). Locators give the printed Documenta pages (printed page = PDF page + 728). / Documenta Mathematica, Extra Volume: John H. Coates' Sixtieth Birthday (2006), 729–779; EMS Press open-access chapter file. Locators give the printed Documenta pages (printed page = PDF page + 728). SHA-256 `6ec26bfc12e1cf38…`. | Theorems 3.2–3.3 and §4 in full, pp. 755–763 (Proposition 4.1, Lemmas 4.2–4.5 with proofs, the moduli space X, the twists X_{R,ψ}, X_ρ̄ and X_Dih, Corollary 4.6); Lemma 5.6 and Theorem 5.7 with its proof, pp. 770–771; Corrections to [Tay4], pp. 776–777; all on the page images. Lemmas 5.1–5.5 not read. §1, Lemmas 1.3–1.4 and Corollary 1.5 with the Hecke algebras and ρ_𝔪 (pp. 740–743); §5 in full (pp. 763–771: the set-up with η̄^i, 𝐔 and 𝐕, the pairing, I^i, Lemma 5.1, Corollary 5.2, Lemmas 5.3–5.6, Corollary 5.5, Theorem 5.7); the bibliography entries [SW1], [SW2], [W1], [Bu], [CDT]; all on the page images. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. §6, pp. 771–775 (Theorem 6.1, Corollaries 6.2–6.4, rank d weakly compatible systems, Lemma 6.5, Theorem 6.6 with proof), on the page images. §6 pp. 771–775; statements and excerpts checked against the text layer. |
| <a id="src-qian"></a>`qian` (R23.1) | Lie Qian, *Potential automorphy for GL_n* ([pdf](https://par.nsf.gov/servlets/purl/10388233)) | Invent. Math. 231 (2023), author/publisher online-first PDF (37 pages). Printed section/proposition locators. SHA-256 `77969caa063c5202…`. | §2 opening disjointness facts and §4 Proposition 4.2 with its application (S1={∞}, S3={l,l′}); Lemma 2.1 is only a consumer, owned by Dwork Part II. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-cht"></a>`cht` (R23.1) | Laurent Clozel, Michael Harris, Richard Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations* ([pdf](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf)) | Published, Publ. Math. IHES 108 (2008), 1–181. SHA-256 `9d3b7079440d8cd3…`. | §4.1, Lemmas 4.1.1–4.1.2, statements and complete proofs, printed pp. 116–117. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-blght"></a>`blght` (R23.1) | Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II* ([pdf](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf)) | Final author copy, 2010, of Publ. RIMS 47 (2011), 29–98; author pagination. SHA-256 `225cab84210837ca…`. | Proposition 6.2 and its full proof, pp. 40–41 (the three classes of local conditions and descent from M). Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-bhkt"></a>`bhkt` (R23.1) | Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne, *G-hat-local systems on smooth projective curves are potentially automorphic* ([pdf](https://arxiv.org/pdf/1609.03491v2)) | Author version v2 of Acta Math. 223 (2019); author pagination. SHA-256 `ec54cf92ce04146c…`. | §9 through Theorem 9.3, including Lemma 9.1 and Proposition 9.2 and proofs, pp. 50–52. §9.5 only as consumer; not the whole automorphy proof. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-bianchi"></a>`bianchi` (R23.1) | George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms* ([pdf](https://arxiv.org/pdf/2309.15880v3)) | Final author version v3 of Forum Math. Pi (2025); author pagination. SHA-256 `0ad015dfe35d4048…`. | §4.5 Proposition 4.5.1 and full proof, pp. 48–49, including the finite fundamental-group quotient refinement. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-bcgp-published"></a>`bcgp-published` (R23.1) | George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular* ([pdf](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf)) | Published, Publ. Math. IHES 134 (2021), 153–501. SHA-256 `b4cc8b016615bcaf…`. | Propositions 9.1.11–9.1.12 and proofs, pp. 458–459; comparison with arXiv version, and Lemma 9.2.7 use of K and L′/K′ (pp. 462–463). Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-snowden"></a>`snowden` (R23.1) | Andrew Snowden, *On two dimensional weight two odd representations of totally real fields* ([pdf](https://arxiv.org/pdf/0905.4266)) | Author preprint v1 (arXiv:0905.4266v1, 26 May 2009); author pagination. Proposition 8.2.1, called Theorem in some routing notes. SHA-256 `b0c0008a55489b00…`. | §3 hypotheses (A1),(A2); §§5.1–5.5 potential residual modularity statements, Skolem datum, auxiliary moduli application, induced modular representation and transfer proof; §§8.1–8.2 statements and proofs. §§4.4 and 7.6 are identified imported statements, not claimed decomposed here. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-calegari"></a>`calegari` (R23.1) | Frank Calegari, *Even Galois representations and the Fontaine–Mazur conjecture II* ([pdf](https://arxiv.org/pdf/1012.4819)) | Author preprint of JAMS 25 (2012), 533–554; author pp. 5–6. SHA-256 `8c95a021afd8fb5b…`. | Theorem 3.1 and Proposition 3.2, complete statements and proofs; inverse-Galois construction and Jordan argument. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-thorne"></a>`thorne` (R23.1) | Jack Thorne, *On the automorphy of l-adic Galois representations with small residual image* ([pdf](https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf)) | Author copy of JIMJ 11 (2012), 855–920, author pp. 56–58; current author server fetched with certificate verification disabled after certificate failure. SHA-256 `5e9d15afa98ca38e…`. | §10 ordinary finiteness setup, Theorem 10.2 and full proof. No claim to have read/decomposed §§6–9 patching or the adequate-image appendix. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-cg"></a>`cg` (R23.1) | Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles method* ([pdf](https://math.uchicago.edu/~fcale/papers/CG.pdf)) | Published Invent. Math. 211 (2018), 297–433, DOI 10.1007/s00222-017-0749-x; the PDF numbers the multiplicity theorem 4.8. SHA-256 `c0ba8de04d5ee92f…`. | Theorem 4.8 and its proof, PDF pp. 65–68; ring R_φ and the paragraph citing Thorne Theorem 10.2 on PDF p. 68. Published PDF headers omit pagination in this section; use PDF pages. Only its finiteness input is in scope. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-newton-thorne"></a>`newton-thorne` (R23.1) | James Newton, Jack Thorne, *Symmetric power functoriality for Hilbert modular forms* ([pdf](https://arxiv.org/pdf/2212.03595v2)) | Author version v2 of Ann. Math. 203 (2026), no. 1; author pagination. SHA-256 `6a156f7a5567226e…`. | §3 characteristic-zero extraction paragraph, p. 14, with the preceding component choices and dimension input BG19 Prop. 4.2.6. Symmetric-power lifting itself is outside this part. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-bhkt-published"></a>`bhkt-published` (R23.1) | Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne, *Ĝ-local systems on smooth projective curves are potentially automorphic* ([pdf](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf)) | Published Acta Math. 223 (2019), 1–111; printed pagination. §9 collated against author version v2. SHA-256 `15c4b9668e335f75…`. | §9 setup, Lemma 9.1 and Proposition 9.2 with complete proofs, Theorem 9.3 and Remark 9.4, printed pp. 76–79. The finite-etale base misprint of Lemma 9.1(i) persists in print. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-bhkt-correction"></a>`bhkt-correction` (R23.1) | Raphaël Beuzart-Plessis, Michael Harris, Jack Thorne, *Inductive construction of supercuspidal L-packets* ([pdf](https://arxiv.org/pdf/2502.20611v1)) | arXiv:2502.20611v1 (2025), author p. 28; only the explicit correction to BHKT Lemma 9.1 is used. SHA-256 `0735ecd6e5b41679…`. | P. 28, paragraph beginning with the Isom scheme and explicitly correcting the base of the finite-etale map in BHKT Lemma 9.1. No other results are marked read. Passages cited by the checked-node ledger and sourceIssues independently read from this exact public PDF; SHA-256 matched. The review report distinguishes proof inputs left as gaps. |
| <a id="src-kw-serre-modularity-I"></a>`kw-serre-modularity-I` (R24.3) | Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)* ([pdf](https://www.math.ucla.edu/~shekhar/papers/results.pdf)) | Author's preprint (results.pdf) of the paper published as Invent. Math. 178 (2009), 485–504. Locators give the preprint's page numbers SHA-256 `3c389dc33e09fe84…`. | §§4–5 (Theorems 4.1 and 5.1, the definitions of compatible systems and minimal lifts, the Remarks, pp. 6–10), §8.2 (p. 15), §10.1 (p. 20). §§4–5 pp. 6–10, §6 Lemma 6.2 p. 11, §8 pp. 12–18, §9 pp. 18–19, §10.1 p. 20; statements and excerpts checked against the text layer. |
| <a id="src-bockle-appendix-2003"></a>`bockle-appendix-2003` (R24.3) | Gebhard Böckle, *Appendix 1: On the isomorphism R_∅ → T_∅* ([pdf](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf)) | Appendix to Chandrashekhar Khare, 'On isomorphisms between deformation rings and Hecke rings', Invent. Math. 154 (2003); the author's file. Locators give its own page numbers 1–6 SHA-256 `67de08f6a1958d6c…`. | The whole appendix (Theorem 1, Proposition 1, Lemma 1, Corollaries 1–2, Lemma 2, the proof of Theorem 1). The whole appendix; statements and excerpts checked against the text layer. |
| <a id="src-dieulefait-pacetti"></a>`dieulefait-pacetti` (R24.3) | Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture* ([pdf](https://arxiv.org/pdf/2108.07577v2)) | arXiv:2108.07577v2, 3 May 2022. Locators give the arXiv version's page numbers SHA-256 `0c6850dafda032f7…`. | §1.3–1.4 (Theorem 1.9, Definition 1.10, Theorem 1.11, Remark 4, pp. 5–7) and Paso 5 (p. 14). §1.3–1.4 pp. 5–7, §2 Pasos 1–6 pp. 10–14 (arXiv v2 and the authors' copy); statements and excerpts checked against the text layer. |
| <a id="src-snowden-2009"></a>`snowden-2009` (R24.3) | Andrew Snowden, *On two dimensional weight two odd representations of totally real fields* ([pdf](https://arxiv.org/pdf/0905.4266v1)) | arXiv:0905.4266v1 (2009). Locators give the arXiv page numbers SHA-256 `b0c0008a55489b00…`. | §7 (lifting problems, Theorems 7.2.1 and 7.6.1, Proposition 7.7.1, pp. 20–23) and the conditions (A1), (A2) of §3. §1.4 notation, §3.1 (A1)–(A7), §7 pp. 20–23; statements and excerpts checked against the text layer. |
| <a id="src-blggt-2014"></a>`blggt-2014` (R24.3) | Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential automorphy and change of weight* ([pdf](https://arxiv.org/pdf/1010.2561v1)) | arXiv:1010.2561v1 (2010), 68 pages; published in Ann. of Math. (2) 179 (2014), 501–609. Page numbers are those of the arXiv v1 PDF (printed page = PDF page). SHA-256 `697e2d318887d8eb…`. | §5.1 in full and §5.2 through Lemma 5.2.1 and Proposition 5.2.2, pp. 51–55. §5.1 pp. 52–54, §5.2 (Lemmas 5.2.1, 5.2.3, Proposition 5.2.2) pp. 54–59, §5.3 pp. 59–61 and §5.4 pp. 61–66, read in full. §5.1 pp. 51–53, Corollary 5.3.2 p. 60, Lemma 5.2.3 pp. 58–59, §5.4 items (1)–(9) pp. 61–63; statements and excerpts checked against the text layer. |
| <a id="src-blggt-2014-v4"></a>`blggt-2014-v4` (R24.3) | Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential automorphy and change of weight* ([pdf](https://arxiv.org/pdf/1010.2561v4)) | arXiv:1010.2561v4 (9 December 2013), 93 pages, the last arXiv version before Ann. of Math. (2) 179 (2014), 501–609. Printed page = PDF page. SHA-256 `c953df6229ba8d8b…`. | §5.1 pp. 62–65, §5.2 pp. 65–70 and §5.3 statements pp. 70–71, on the text layer, compared with arXiv v1 §§5.1–5.2. §2.1 polarization definition and §§5.1–5.4 statements/proof outlines, including Lemma 5.3.1 and Lemma 5.4.5; Appendix A.2 character interface. External citations named in gaps are not claimed as read. §2.1 Theorem 2.1.1 pp.33–34 and Appendix A.2 p.87 read as purity/character imports. These are supplied by their owners, rather than re-proved here. §2.1 pp. 31–34, §§5.1–5.3 pp. 62–74, Lemma 5.4.5 pp. 76–77, Lemma A.1.5 p. 85, Appendix A.2 p. 87; statements and excerpts checked against the text layer. |
| <a id="src-skinner-2009"></a>`skinner-2009` (R24.3) | Christopher Skinner, *A note on the p-adic Galois representations attached to Hilbert modular forms* ([pdf](https://ems.press/content/serial-article-files/26055?nt=1)) | Documenta Mathematica 14 (2009), 241–258 SHA-256 `4a2a489aa1401431…`. | Introduction and Theorem 1 with conventions and proof synopsis, printed pp.241–243; §2 opening pp.244–245. The full proof is not claimed as independently verified. Introduction and Theorem 1, pp. 241–243; statements and excerpts checked against the text layer. |
| <a id="src-acc-2023"></a>`acc-2023` (R24.3) | Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, *Potential automorphy over CM fields* ([pdf](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf)) | Annals of Mathematics 197 (2023), 897–1113; published journal-layout copy hosted by Frank Calegari SHA-256 `c5429e4f38438404…`. | Author version §7.1 pp.188–190 and 196–197, then collated against the published journal-layout text §7.1 pp.1084–1086 and 1092. Read the weak/very weak/extremely weak definitions, Lemma 7.1.1 and Artin-up-to-twist definition, and the purity paragraph. The higher-rank automorphy applications are outside this packet. Published §7.1 pp. 1084–1086, 1092–1096; statements and excerpts checked against the text layer. |
| <a id="src-khare-level-one"></a>`khare-level-one` (R24.3) | Chandrashekhar Khare, *Serre’s modularity conjecture: the level one case* ([pdf](https://arxiv.org/pdf/math/0504080)) | Duke Math. J. 134 (2006), no. 3, 557–589; read as arXiv:math/0504080v1 (5 April 2005), where the Brauer construction is §3, Proposition 3.1. KW II cite it as Theorem 5.1 of the Duke version SHA-256 `3012a51759ad1069…`. | The Brauer construction and its inner-product criterion, pp.16–18 (recorded as '§5 Theorem 5.1'; in the arXiv v1 read it is §3, Proposition 3.1 and its proof). §3, pp. 16–18, rechecked; section numbering corrected. |
| <a id="src-dieulefait-2004"></a>`dieulefait-2004` (R24.3) | Luis V. Dieulefait, *Existence of families of Galois representations and new cases of the Fontaine-Mazur conjecture* ([pdf](https://arxiv.org/pdf/math/0304433)) | arXiv:math/0304433v1 (27 April 2003); published in J. reine angew. Math. 577 (2004), 147–151 (not obtained) SHA-256 `164b3f5d51ad3317…`. | §1, Theorem 1.1 and its remark, pp. 1–2. |

## What the pinned libraries have

The 30 declarations the parts cite, each read at the pinned commits. They are the primitives the plan builds on: schemes and their module sheaves, field disjointness, Galois groups and representations, characteristic polynomials, power series, regular sequences, flatness, Krull dimension, Deligne's Γ-factors, and Tau Ceti's invertible sheaves and line-bundle classes. What they do not provide is as important:

- `NumberField.Chebotarev.frobeniusPrimeSet` defines a set of primes; it proves neither density nor existence, which come from upstream Chebotarev Layer 10.
- `TauCeti.AlgebraicGeometry.LineBundleClass` is a commutative monoid of isomorphism classes; equality there forgets the boundary trivialisation that the rigidified Picard functor of R23.1 keeps, and the relative Picard functor with its representability is requested from AlgebraicModuliForArithmeticGeometry R09.3 and SchemeAndStackFoundations SF.3.
- `IntermediateField.LinearDisjoint.iff_inf_eq_bot` needs its finite-dimensionality and Galois hypotheses.
- No compatible-system carrier, Weil–Deligne parameter, labelled Hodge–Tate multiset, deformation ring or Hilbert eigenform exists at either pin.

The reviewed library audit has no rows keyed by this roadmap; the rows of its suppliers (H6, SF.3) record what they leave unbuilt.

| Declaration | Module | What it provides | Used by |
|---|---|---|---|
| `mathlib:IntermediateField.LinearDisjoint` (R23.1) | `Mathlib/FieldTheory/LinearDisjoint.lean` | Linearly disjoint field extensions, via the injective tensor multiplication map; no mere-intersection shortcut. | `R23.1/tower-linear-disjointness` |
| `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot` (R23.1) | `Mathlib/FieldTheory/LinearDisjoint.lean` | Linearly disjoint intermediate fields have intersection equal to the base field. | `R23.1/tower-linear-disjointness` |
| `mathlib:IntermediateField.LinearDisjoint.iff_inf_eq_bot` (R23.1) | `Mathlib/FieldTheory/LinearDisjoint.lean` | Equivalence with trivial intersection for finite extensions when the left one is Galois. | `R23.1/forcing-linear-disjointness-by-extra-split-places` |
| `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` (R23.1) | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` | The set of unramified height-one primes with a given Artin conjugacy class. This is not a density or prime-existence theorem. | `R23.1/frobenius-primes-generate` |
| `mathlib:AlgebraicGeometry.Spec` (R23.1) | `Mathlib/AlgebraicGeometry/Scheme.lean` | Spectrum as a scheme; rational points can be scheme morphisms from a field spectrum. | `R23.1/skolem-datum-and-integral-point` |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pullback` (R23.1) | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Pullback functor on module sheaves, allowing a rigidification along a boundary morphism. | `R23.1/generalized-picard-functor-and-effective-divisor-fibration` |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` (R23.1) | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | Full category of invertible structure-module sheaves; do not replan line bundles. | `R23.1/generalized-picard-functor-and-effective-divisor-fibration` |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` (R23.1) | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | The trivial rank-one sheaf, as the target of a boundary rigidification. | `R23.1/generalized-picard-functor-and-effective-divisor-fibration` |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff` (R23.1) | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean` | Equality of unrigidified line-bundle classes iff there is an isomorphism; the rigidified relation additionally respects the boundary trivialization. | `R23.1/generalized-picard-functor-and-effective-divisor-fibration` |
| `mathlib:RingTheory.Sequence.IsRegular` (R24.3) | `Mathlib/RingTheory/Regular/RegularSequence` | regular sequences on a module (Böckle's Lemma 2 uses a regular system of parameters) | `R24.3/finite-presentation-complete-intersection` |
| `mathlib:IsLocalRing` (R24.3) | `Mathlib/RingTheory/LocalRing/Defs` | local rings (complete noetherian local 𝒪-algebras) | `R24.3/finite-presentation-complete-intersection` |
| `mathlib:ringKrullDim` (R24.3) | `Mathlib/RingTheory/KrullDimension/Basic` | Krull dimension, for the height count in Lemma 2 | `R24.3/finite-presentation-complete-intersection` |
| `mathlib:Module.Flat` (R24.3) | `Mathlib/RingTheory/Flat/Basic` | flatness over 𝒪 (torsion-freeness over a DVR) | `R24.3/finite-presentation-complete-intersection` |
| `mathlib:Complex.Gammaℝ` (R24.3) | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne` | Deligne's real archimedean Gamma factor Γ_ℝ(s) = π^{−s/2}Γ(s/2) (BLGGT's Γ_ℝ) | `R24.5/system-l-functions` |
| `mathlib:Complex.Gammaℂ` (R24.3) | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne` | Deligne's complex archimedean Gamma factor Γ_ℂ(s) = 2(2π)^{−s}Γ(s) (BLGGT's Γ_ℂ) | `R24.5/system-l-functions` |
| `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one` (R24.3) | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne` | Γ_ℝ(s)Γ_ℝ(s + 1) = Γ_ℂ(s), the identity BLGGT use in §5.1 | `R24.5/system-l-functions` |
| `mathlib:Field.absoluteGaloisGroup` (R24.3) | `Mathlib/FieldTheory/AbsoluteGaloisGroup` | Automorphisms of AlgebraicClosure F over F, with Group and Krull topology; use this actual group. | `R24.5/compatible-system`, `R24.5/weakly-compatible-system-rank-n` |
| `mathlib:Representation` (R24.3) | `Mathlib/RepresentationTheory/Basic` | A monoid homomorphism G →* Module.End k V; continuity of the group action is a separate condition. | `R24.5/compatible-system`, `R24.5/weakly-compatible-system-rank-n`, `R24.5/artin-system` |
| `mathlib:Representation.IsSemisimpleRepresentation` (R24.3) | `Mathlib/RepresentationTheory/Semisimple` | ComplementedLattice (Subrepresentation ρ); it does not assert arithmetic continuity or finite ramification. | (baseline audit; cited in prose) |
| `mathlib:Representation.IsIrreducible` (R24.3) | `Mathlib/RepresentationTheory/Irreducible` | IsSimpleOrder (Subrepresentation ρ), equivalent to simplicity of the group-algebra module. | (baseline audit; cited in prose) |
| `mathlib:Representation.dual` (R24.3) | `Mathlib/RepresentationTheory/Basic` | The contragredient action on Module.Dual k V, using inverse group elements. | `R24.5/system-operations` |
| `mathlib:NumberField.FinitePlace` (R24.3) | `Mathlib/NumberTheory/NumberField/Completion/FinitePlace` | Finite places as adic absolute values; equivHeightOneSpectrum identifies them with nonzero prime ideals of 𝓞 F. | `R24.5/weakly-compatible-system-rank-n` |
| `mathlib:NumberField.FinitePlace.embedding` (R24.3) | `Mathlib/NumberTheory/NumberField/Completion/FinitePlace` | Embedding K into v.adicCompletion K for a height-one prime v of a Dedekind coefficient ring. | `R24.5/weakly-compatible-system-rank-n` |
| `mathlib:LinearMap.charpoly` (R24.3) | `Mathlib/LinearAlgebra/Charpoly/Basic` | Characteristic polynomial of an endomorphism of a finite-dimensional vector space. | `R24.5/weakly-compatible-system-rank-n`, `R24.5/artin-system` |
| `mathlib:Representation.ind` (R24.3) | `Mathlib/RepresentationTheory/Induced` | Algebraic induction along a monoid homomorphism via coinvariants; arithmetic topology/finiteness are imported from R01.1/G7. | `R24.5/system-operations` |
| `mathlib:Rep.indResAdjunction` (R24.3) | `Mathlib/RepresentationTheory/Induced` | Categorical Frobenius reciprocity Ind ⊣ Res; not the arithmetic Brauer genuineness argument. | `R24.5/galois-grothendieck-ring` |
| `mathlib:MvPowerSeries` (R24.3) | `Mathlib/RingTheory/MvPowerSeries/Basic` | Multivariate formal power series, with coefficients indexed by finitely supported exponent vectors. | (baseline audit; cited in prose) |
| `mathlib:IsDiscreteValuationRing` (R24.3) | `Mathlib/RingTheory/DiscreteValuationRing/Basic` | A local principal ideal domain with nonzero maximal ideal; it is not a field. | (baseline audit; cited in prose) |
| `mathlib:IsAdicComplete` (R24.3) | `Mathlib/RingTheory/AdicCompletion/Basic` | Ideal-adic Hausdorffness and precompleteness of a module. | (baseline audit; cited in prose) |
| `mathlib:Finsupp` (R24.3) | `Mathlib/Data/Finsupp/Defs` | Finite-support coefficient functions; only the additive irreducible multiplicity lattice is used, not pointwise multiplication as tensor product. | (baseline audit; cited in prose) |

## Layer overview

The layers in the order of this document. R24.5:operations is a sub-layer of R24.5 but depends on no other layer of this roadmap; it is placed before R24.5 because R24.5's constructions use its carrier.

| Layer | Title | Part | Nodes | Planets | Coverage |
|---|---|---|---:|---:|---|
| [R23.1](#layer-r23-1) | Moret–Bailly's theorem | R23.1 | 22 | 6 | planned |
| [R23.2](#layer-r23-2) | The auxiliary moduli problem | R23.1 | 4 | 0 | planned |
| [R23.3](#layer-r23-3) | Potential residual modularity | R23.1 | 14 | 6 | planned |
| [R23.4](#layer-r23-4) | Potential modularity of a given lift | R23.1 | 1 | 1 | planned |
| [R23.5](#layer-r23-5) | Control of the extension and descent data | R23.1 | 2 | 0 | planned |
| [R23.6](#layer-r23-6) | Exports and noncircularity | R23.1 | 0 | 0 | planned |
| [R24.1](#layer-r24-1) | Finiteness over the coefficient ring | R23.1 | 4 | 2 | planned |
| [R24.2](#layer-r24-2) | Existence of characteristic-zero points | R23.1 | 2 | 2 | planned |
| [R24.3](#layer-r24-3) | Prescribed local lifts | R24.3 | 11 | 2 | planned |
| [R24.4](#layer-r24-4) | The full KW modularity-lifting interface | R24.3 | 2 | 0 | planned |
| [R24.5:operations](#layer-r24-5-operations) | general systems before existence theorems | R24.3 | 22 | 6 | planned |
| [R24.5](#layer-r24-5) | Compatible systems from potential modularity | R24.3 | 5 | 3 | planned |
| [R24.6](#layer-r24-6) | Changing residual characteristic | R24.3 | 3 | 1 | planned |

**Planets.**

| Layer | Planets |
|---|---|
| R23.1 | Skolem data and integral points ([`skolem-datum-and-integral-point`](#n-r23-1-skolem-datum-and-integral-point)); Moret-Bailly's theorem ([`moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points)); Prescribed soluble extensions ([`cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions)); Moret–Bailly approximation ([`moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions)); Surjective specialisation ([`surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient)); Fixed-constant-field approximation ([`function-field-point-with-fixed-constants`](#n-r23-1-function-field-point-with-fixed-constants)) |
| R23.2 | none |
| R23.3 | Taylor's potential modularity theorem ([`taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`](#n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l)); Potential modularity with l split (Taylor 2006) ([`taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l)); Potential modularity in Serre's weight (Taylor 2006) ([`taylor-2006-theorem-5-7-serre-weight-at-level-one`](#n-r23-3-taylor-2006-theorem-5-7-serre-weight-at-level-one)); Potential modularity (KW II Theorem 6.1) ([`kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f)); Potential residual modularity ([`snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity)); Controlled residual modularity ([`bcgp-controlled-residual-modularity`](#n-r23-3-bcgp-controlled-residual-modularity)) |
| R23.4 | Potential modularity of a given lift ([`potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift)) |
| R23.5 | none |
| R23.6 | none |
| R24.1 | Finiteness of global deformation rings ([`kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring)); Ordinary global ring finiteness ([`ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness)) |
| R24.2 | Characteristic-zero points of deformation rings ([`characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type)); Characteristic-zero deformation points ([`newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction)) |
| R24.3 | Minimal lifts ([`kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts)); Lifts of required type ([`required-lift-types`](#n-r24-3-required-lift-types)) |
| R24.4 | none |
| R24.5:operations | Weakly compatible systems ([`weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n)); Common monodromy component field ([`monodromy-component-field`](#n-r24-5-monodromy-component-field)); Polarized compatible systems ([`polarized-system`](#n-r24-5-polarized-system)); Galois representation ring ([`galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring)); Residual irreducibility ([`residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one)); Purity of rank-one systems ([`rank-one-purity`](#n-r24-5-rank-one-purity)) |
| R24.5 | Compatible systems by Brauer induction ([`brauer-induction-system`](#n-r24-5-brauer-induction-system)); Strict compatible systems ([`strict-brauer-system`](#n-r24-5-strict-brauer-system)); Prescribed compatible systems ([`kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems)) |
| R24.6 | Local compatibility at the coefficient prime ([`local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime)) |

R23.1, R23.3 and R24.5:operations carry six planets each, the most a layer may show. R23.6 has no nodes: its targets are realised by nodes of R23.3 and R23.4 (see its section).

<a id="layer-r23-1"></a>
## R23.1 — Moret–Bailly's theorem

*Coverage in the R23.1 part: planned. 22 nodes, 6 planets.*

The layer plans the field-selection theorem every later layer uses, in the generality and the variants the sources need.

- **Moret-Bailly's theorem.** A Skolem datum over a Dedekind ring R of arithmetic or function-field origin is a separated finite-type surjection X → Spec R with X irreducible and X_K geometrically irreducible, a finite set Σ of places outside the closed points, finite Galois L_v/K_v and nonempty Galois-stable v-adic opens Ω_v of smooth points. It is *incomplete* when some place is neither in Σ nor a closed point. Théorème 1.3: every incomplete datum has an integral point, a finite extension K′/K split over every L_v with an R′-point whose images under all embeddings K′ → L_v lie in Ω_v. Incompleteness cannot be dropped: G_m over ℤ with Σ = {∞} and Ω = {0 < |z| < 1} has none.
- **Its proof.** Local density of separable and algebraic points; Chow's lemma, shrinking X_K and enlarging Σ; Bertini sections through a curve meeting every Ω_v, down to relative dimension one. In the curve case the generalised Picard functor PG(X̄, Z) of line bundles with a trivialisation on the boundary Z maps effective divisors of degree d ≥ 2g + z − 1 onto an affine-space fibration; local open sets in PG, quasi-compactness of P_0(K_Σ)/Γ(Z, O_Z^×) and strong approximation off an omitted place produce a section whose divisor is the integral point. The scheme foundations (Chow, Bertini, the relative Picard functor) are requested from SchemeAndStackFoundations SF.3–SF.4 and AlgebraicModuliForArithmeticGeometry R09.3; the rigidified quotient refines Tau Ceti's line-bundle classes.
- **Taylor's Theorem G and disjointness.** Spreading out over 𝒪_K[1/N] with an inverted place w ∉ S dividing N makes the datum incomplete; the integral point lies over a field split completely at S. Frobenius elements at places outside any finite set generate Gal(D/K) (upstream Chebotarev Layer 10); a finite *Galois* K′ split at extra places whose Frobenii generate is linearly disjoint from D.
- **The variants the potential-modularity papers use.** Three kinds of local condition, over K_v, K_v^nr and K̄_v (Qian, Proposition 4.2), with total reality from real places in the first class. A preliminary field M, through restriction of scalars from AbelianSchemesAndArithmeticModuli A6 (BLGHT, Proposition 6.2; Snowden, Proposition 8.2.2, whose F2 is split over L_v, not equal to it in completions). Characters with prescribed finite-order local restrictions and soluble extensions with prescribed completions (Clozel–Harris–Taylor, Lemmas 4.1.1–4.1.2, through global class field theory, with extra ramification allowed and no cyclic Grunwald–Wang statement). Disjointness through a tower. Surjective specialisation of a finite quotient of the étale fundamental group (Bianchi, Proposition 4.5.1, over a CM field Galois over ℚ). Over a function field 𝔽_q(X): the Isom torsor over Y_K and a point with unchanged constant field (BHKT, Lemma 9.1 corrected and Proposition 9.2), and potential realisation of local Galois data (BHKT, Theorem 9.3; Calegari, Proposition 3.2, in the number-field case).

The six planets are the definition of Skolem data, Moret-Bailly's theorem, and the four forms consumers cite most: the three local conditions, prescribed soluble extensions, surjective specialisation and the fixed constant field.

**Still open in this layer.**

- Imported foundations of Moret-Bailly's proof
- Local points outside finitely many places and function-field Chebotarev
- Strong approximation and S-unit compact quotient
- Exact local-completion refinement and Jordan
- Moret–Bailly 1990 potential inverse-Galois theorem
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.
- Weil restriction of varieties: property and analytic-open adapter
- Local analytic density used in the approximation arguments
- Suggested APIs and tests: missing full object interfaces

<a id="n-r23-1-skolem-datum-and-integral-point"></a>
### Skolem data, completeness, and integral points (Moret-Bailly II 1.1-1.2, 1.5, 1.8)

`R23.1/skolem-datum-and-integral-point` · definition · planet “Skolem data and integral points” · part R23.1

Let R be a Dedekind ring which is either the ring of S-integers of a number field (arithmetic case) or the ring of a smooth connected affine curve over a finite field (geometric case); K = Frac(R), B = Spec R. Let f: X → B be separated of finite type with f surjective, X_K geometrically irreducible over K, and X irreducible. Let Σ be a finite set of places of K (archimedean or not) disjoint from Max(R), the closed points of B viewed as places. For v in Σ fix a finite Galois extension L_v of the completion K_v and a nonempty open subset Ω_v of X(L_v) for the v-topology, consisting of smooth points and stable under Gal(L_v/K_v). The sequence S = (f: X → B, Σ, {L_v}, {Ω_v}) is a Skolem datum; it is complete if every place of K lies in Σ or in Max(R), and incomplete otherwise. An integral point of S is an irreducible closed subscheme Y of X, finite and surjective over B, such that for every v in Σ the scheme Y ⊗_R L_v is L_v-split (made of L_v-rational points) and contained in Ω_v. Equivalently (Remarque 1.5): Y_K = Spec K' for a finite extension K'/K, the inclusion gives x in X(R') with R' the normalisation of R in K', K' ⊗_K L_v is a product of copies of L_v, and every embedding K' → L_v maps x into Ω_v.

**Hypotheses and conventions.**

- R is the ring of S-integers of a number field or the ring of a smooth connected affine curve over a finite field (Remarque 1.7 extends Théorème 1.3 to any localisation of the ring of integers of a number field or of the ring of a curve over a finite field, by spreading X out)
- f separated of finite type and surjective; X irreducible; X_K geometrically irreducible over K
- Σ finite and disjoint from Max(R); each L_v/K_v finite Galois; each Ω_v nonempty, v-adically open, made of smooth points and Gal(L_v/K_v)-stable
- incompleteness (some place of K outside Σ and outside Max(R)) is essential: Remarque 1.8 gives a complete datum without integral point

**Construction.**

1. 1.1 and Définition 1.2 fix the data and the notion of integral point; the displayed local conditions (Σ, Ω_v, L_v-split) were read on the page image of p. 181 because the OCR drops Σ and Ω.
2. Remarque 1.5 reads an integral point as a finite extension K'/K which becomes split after base change to each L_v, together with an R'-integral point of X lying in Ω_v at every embedding K' → L_v; it notes that this generalises the Cantor-Roquette density theorem (essentially X_K unirational and L_v = K_v).
3. Remarque 1.8: R = Z, X = G_m over Z, Σ = {ordinary absolute value}, L = C, Ω = {|z| < 1} is a complete Skolem datum without integral point; the source only says this is immediate.

**API.**

- `TauCeti.PotentialModularity.SkolemDatum` (structure): (f : X → B, Σ, (L_v), (Ω_v)) with the conditions of 1.1
- `TauCeti.PotentialModularity.SkolemDatum.IsComplete` (data): every place of K lies in Σ or Max(R)
- `TauCeti.PotentialModularity.SkolemDatum.IntegralPoint` (structure): an irreducible closed Y ⊆ X, finite surjective over B, L_v-split and inside Ω_v for v ∈ Σ
- `TauCeti.PotentialModularity.SkolemDatum.integralPoint_iff` (equivalence): Integral points correspond to finite extensions K′/K with K′ ⊗_K L_v a product of copies of L_v, and an integral point all of whose K-embeddings into L_v land in Ω_v. Completions can be proper subfields of L_v.
- `TauCeti.PotentialModularity.SkolemDatum.enlargeSigma` (constructor): After removing a finite set of closed places from B, prescribe nonempty integral local opens over finite Galois L_v; closure of an integral point for the enlarged datum is an integral point for the original datum (II 1.10).
- `TauCeti.PotentialModularity.SkolemDatum.split_iff_algEquiv` (compatibility): The generic splitting condition means that the multiplication/base-change algebra K′⊗_K L_v is isomorphic as an L_v-algebra to a finite product of L_v, not that K′⊗_K K_v has prescribed factors L_v.
- `TauCeti.PotentialModularity.SkolemDatum.fieldPoint_split` (projection): An integral field point is split after scalar extension to every L_v in Σ; expose this without unfolding FieldPoint.
- `TauCeti.PotentialModularity.SkolemDatum.fieldPoint_local` (projection): For each v∈Σ and each K-embedding K′→L_v, the induced local point belongs to Ω_v.
- `TauCeti.PotentialModularity.SkolemDatum.isComplete_congr` (extensionality): Completeness depends only on Σ and Max(R): two data with equal sets have equivalent completeness predicates.
- `TauCeti.PotentialModularity.SkolemDatum.mapPoint` (functoriality): For an R-morphism X→Y sending each Ω_v into the target Ω_v and preserving the place data, map normalized field integral points to target field points. This concerns the field-point presentation; geometric image/normalization comparison is separately required. Identity and composition of R-morphisms give the identity and composite maps on the normalized field-point presentation.

**Unit tests.**

- `skolem_complete_Z` (non-example): R = Z, Σ = {∞} is complete; X = G_m, L_∞ = C and Ω_∞ = {0 < |z| < 1} has no integral point, since the norm of an algebraic unit has absolute value 1.
- `skolem_incomplete_Z_half` (characterisation): R = ℤ[1/2], Σ = {∞}: the place 2 lies neither in Σ nor in Max(R), so the datum is incomplete
- `skolem_trivial_X` (degenerate): X = B and Ω_v the unique local point: K′ = K gives an integral point for every finite Galois L_v/K_v, including a nontrivial L_v. This distinguishes splitting over L_v from requiring completions equal L_v.
- `skolem_open_required` (non-example): a single point {x} ⊂ X(ℚ_p) of a curve is not v-adically open, so it cannot serve as Ω_v
- `skolem_fieldPoint_local` (characterisation): For an integral field point, every K-embedding of its generic field into every L_v with v∈Σ gives a local point in Ω_v; a definition checking only one embedding fails this test.

**Acceptance.**

- For K = ℚ, R = ℤ[1/N] and Σ = {infinity} with L_infinity = R and Ω_infinity = X(R): check that an integral point is exactly a totally real field K' with an R'-point, as used to produce totally real fields
- Check that the datum of Remarque 1.8 satisfies every condition of 1.1, is complete, and has no integral point

**Used by.**

- [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points): the statement is about Skolem data
- [`R23.1/taylor-theorem-g-split-completely-points-are-dense`](#n-r23-1-taylor-theorem-g-split-completely-points-are-dense): L_v = K_v and Ω_v a Zariski-open set of local points
- [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f): Ω_v = points of Taylor's moduli space reducing to a chosen integral point x_v

**Depends on.** libraries: `mathlib:AlgebraicGeometry.Spec`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), 1.1 and Définition 1.2, p. 181 (read on page image): “un fermé irréductible Y de X, fini et surjectif sur B” — Definition of integral point: irreducible closed, finite and surjective over B, with the local L_v-splitting and Ω_v conditions displayed in the same sentence.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Définition 1.2, p. 181: “vérifiant les conditions ci-dessus. Elle est dite complète si” — Complete versus incomplete Skolem data.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Remarque 1.8, p. 184: “est une donnée de Skolem complète sans point entier” — The counterexample showing incompleteness cannot be dropped.

<a id="n-r23-1-density-of-algebraic-and-separable-local-points"></a>
### Density of separable and algebraic points in local point sets (Lemme 1.6.1, Corollaire 1.6.2, Lemme 2.1)

`R23.1/density-of-algebraic-and-separable-local-points` · lemma · part R23.1

(Lemme 1.6.1) Let F be a local field, F̄ an algebraic closure, F^s the separable closure of F in F̄, and X an F-scheme of finite type which is generically smooth over F. Then X(F^s) is dense in X(F̄) for the valuation topology. (Corollaire 1.6.2) Let F be a non-archimedean local field with ring of integers A and let 𝔛 be an A-scheme of finite type, flat and surjective over A, whose generic fibre is generically smooth over F. Then there is a finite separable extension F'/F with ring of integers A' such that 𝔛(A') is nonempty. (Lemme 2.1) Let F be a field with a discrete valuation v, F-hat its completion and F' the algebraic closure of F in F-hat, and assume F-hat is separable over F (i.e. the valuation ring is excellent). Then for every F-scheme Z of finite type, Z(F') is dense in Z(F-hat) for the v-topology.

**Hypotheses and conventions.**

- Lemme 1.6.1: F a local field; X of finite type and generically smooth over F; in characteristic 0 the statement is empty
- Corollaire 1.6.2: F non-archimedean; 𝔛 flat and surjective over A; generic fibre generically smooth
- Lemme 2.1: F-hat separable over F (excellent valuation ring); the author states he does not know whether this hypothesis is superfluous

**Proof outline.**

1. 1.6.1(a), X = affine line, char F = p > 0: for x in F̄ with v(x) ≥ 0 pick k with x^(p^k) = a in F^s; for n ≥ 1 let y_n be a root of y^(p^k) - t^n y - a = 0 with t a uniformiser of F; then y_n is in F^s, v(y_n) ≥ 0 and v(y_n - x) = p^(-k) v(y_n^(p^k) - a) = p^(-k) v(t^n y_n) ≥ n p^(-k) (display read on the page image of p. 183).
2. 1.6.1(b), general case: reduce to X smooth; near the closed point P under x choose a Zariski open U and an F-morphism U → A^n (n = dim X) finite étale over a neighbourhood of the image of P; it induces a homeomorphism of a neighbourhood of x onto an open of F̄^n, and a point is F^s-rational iff its image is, because the map is étale; conclude by (a).
3. 1.6.2: with A^s, Ā the integers of F^s, F̄, one has 𝔛(A^s) = 𝔛(Ā) ∩ 𝔛(F^s), and 𝔛(Ā) is a nonempty open of 𝔛(F̄) because 𝔛 is flat and surjective over A; apply 1.6.1.
4. 2.1: clear for affine space; in general stratify Z into regular locally closed pieces, note that an F-hat-point factors through the smooth locus, shrink to an étale map Z → U with U open in affine space, take an F'-point of the (open) image of a given open set and use that fibres of the quasi-finite map consist of points algebraic over F.

**Acceptance.**

- Instantiate 1.6.2 for the Néron-type model of an abelian variety with good reduction and F'/F unramified, and check that 𝔛(A') is nonempty with F' = F
- Check on F = 𝔽_p((t)) and X = affine line that the roots y_n of y^(p^k) - t^n y - a are separable and converge to x = a^(1/p^k)

**Depends on.** nothing beyond its statement.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 1.6.1 and proof, p. 183 (display read on page image): “En caractéristique 0 il n'y a rien à démontrer.” — Start of the proof of Lemme 1.6.1, whose characteristic-p step is transcribed from the page image.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 2.1, p. 185: “si cette condition est superflue” — The separability/excellence hypothesis of Lemme 2.1 and the author's remark that he does not know whether it can be removed.

<a id="n-r23-1-elementary-reductions-of-skolem-data"></a>
### Elementary reductions: quasi-projective, shrinking X_K, enlarging Σ (Remarques 1.4, 1.9, 1.10, Exemple 1.10.1)

`R23.1/elementary-reductions-of-skolem-data` · lemma · part R23.1

To prove Théorème 1.3 one may assume: (1.4) f quasi-projective, by Chow's lemma (EGA II 5.6); (1.9) X_K smooth: if F_K is a strict closed subset of X_K with closure F in X, then F contains no fibre of f (the closed fibres of f are purely of codimension 1), X - F → B is still surjective, F(L_v) does not contain Ω_v (the latter is an L_v-analytic manifold of dimension dim X_K > dim F_K), and (X - F → B, {L_v}, {Ω_v - F(L_v)}) is again a Skolem datum; (1.10) Σ may be enlarged by a finite set S of closed points of B: B_1 = B - S is affine because Pic(B) = Cl(R) is finite, for v in S Corollaire 1.6.2 gives a finite Galois L_v/K_v with integers R'_v such that Ω_v := X(R'_v) is a nonempty Galois-stable open of X(L_v), the datum S_1 = (X_1 = X x_B B_1 → B_1, Σ ∪ S, {L_v}, {Ω_v}) is a Skolem datum, and the closure in X of an integral point of S_1 is an integral point of S. (1.10.1) Consequently X may be replaced by any nonempty open subscheme, e.g. X smooth over B.

**Hypotheses and conventions.**

- 1.9 and 1.10 are applied inside the proof of Théorème 1.3; 1.10 is stated under X_K smooth over K
- 1.10 uses finiteness of Cl(R), which holds in both cases of 1.1
- Chow's lemma is imported (EGA II 5.6); the source notes a version for algebraic spaces (Knutson)

**Proof outline.**

1. Remarque 1.4: Chow's lemma reduces to f quasi-projective.
2. Remarque 1.9: dimension comparison of the analytic manifolds Ω_v and F(L_v) shows Ω_v - F(L_v) is nonempty; purity of codimension of fibres shows surjectivity is kept.
3. Remarque 1.10: choose x in R with Supp(div x) = S, so B_1 = Spec R[1/x]; the local integral structures R'_v supplied by 1.6.2 make the closure of an integral point finite over B.
4. Exemple 1.10.1 combines 1.9 and 1.10.

**Acceptance.**

- Check that the closure of an integral point of S_1 is finite over the removed points precisely because Ω_v = X(R'_v) for v in S
- Check that shrinking X_K to its smooth locus preserves the geometric irreducibility of X_K

**Depends on.** this roadmap: [`R23.1/density-of-algebraic-and-separable-local-points`](#n-r23-1-density-of-algebraic-and-separable-local-points); other roadmaps' layers: `SchemeAndStackFoundations:SF.4`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Remarque 1.4, p. 182: “ceci en vertu du lemme de Chow (EGA II, 5.6)” — Reduction to quasi-projective f.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Remarque 1.10, p. 184: “Pic(B)=Cl(R) est fini” — Finiteness of the class group used to make B - S affine when enlarging Σ.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Exemple 1.10.1, p. 184: “Par exemple, on peut toujours supposer X lisse sur B.” — Consequence: X may be replaced by a smooth open.

<a id="n-r23-1-reduction-to-relative-dimension-one"></a>
### Reduction to relative dimension one by Bertini hypersurface sections (Lemmes 2.2-2.3, 2.4)

`R23.1/reduction-to-relative-dimension-one` · lemma · part R23.1

Assume f quasi-projective and X_K smooth. (Lemme 2.2) There is a closed subset T of X of dimension 1, quasi-finite and surjective over B, meeting every Ω_v in the sense that T(L_v) ∩ Ω_v is nonempty for all v in Σ. (Lemme 2.3) If dim X_K = n ≥ 2, there is a hypersurface X'_K of X_K, geometrically irreducible, containing T_K and regular at the points of T_K. (2.4) With X' the closure of X'_K in X and Ω'_v = {smooth points of X'_K(L_v)} ∩ Ω_v, the datum S' = (X' → B, Σ, {L_v}, {Ω'_v}) is a Skolem datum, incomplete if S is, with dim X'_K = dim X_K - 1, and the image in X of an integral point of S' is an integral point of S. By induction one reduces Théorème 1.3 to dim X_K = 1.

**Hypotheses and conventions.**

- f quasi-projective (Remarque 1.4) and X_K smooth over K (Remarque 1.9)
- incompleteness is not needed for this reduction (the source says so explicitly before Lemme 2.2)
- Bertini's theorem is imported: Jouanolou, Théorèmes de Bertini et applications, chapter I, theorem 6.3

**Proof outline.**

1. Lemme 2.2: by Lemme 2.1 each Ω_v contains a point algebraic over K, i.e. lying over a closed point P_v of X_K; the closure T_v of P_v is quasi-finite over B; the union of the T_v maps onto B minus a finite set S of closed points; for each v in S add a closed T_v quasi-finite over B whose image contains v.
2. Lemme 2.3: embed X_K in P^N, let L_d be the linear system of degree-d hypersurface sections containing T_K; for d large L_d embeds the blow-up of X̄_K along T_K, so Bertini gives a dense open U_d of geometrically irreducible members; for d large H^1(X̄_K, I.I_x(d)) = 0 for x in T_K gives a dense open V_d of members regular at T_K; choose s in (U_d ∩ V_d)(K).
3. 2.4: X' is irreducible with geometrically irreducible generic fibre and contains T, hence is surjective over B; for v in Σ a point t_v in T_K(L_v) ∩ Ω_v has residue field inside L_v, hence separable over K, so X'_K is smooth there and Ω'_v is a nonempty open; induct on dim X_K (if dim X_K = 0 then f is an isomorphism).

**Acceptance.**

- For X = affine plane over ℤ[1/N] with Σ = {infinity}, exhibit T and a hypersurface section X' through T_K satisfying 2.3, and check Ω'_infinity is nonempty
- Check that the regularity of X'_K at T_K (not only irreducibility) is what makes Ω'_v nonempty

**Depends on.** this roadmap: [`R23.1/density-of-algebraic-and-separable-local-points`](#n-r23-1-density-of-algebraic-and-separable-local-points), [`R23.1/elementary-reductions-of-skolem-data`](#n-r23-1-elementary-reductions-of-skolem-data); other roadmaps' layers: `SchemeAndStackFoundations:SF.4`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 2.2, p. 185: “de dimension 1, quasi-fini et surjectif sur B” — The auxiliary one-dimensional closed subset T meeting every Ω_v.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Proof of Lemme 2.3, p. 185: “le théorème de Bertini ([J], chapitre 1, théorème 6.3) implique qu'il existe un ouvert de Zariski non vide” — The imported Bertini theorem giving geometrically irreducible sections.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), 2.4, p. 186: “nous sommes ainsi ramenés, par récurrence sur” — The induction on dim X_K down to relative dimension one.

<a id="n-r23-1-generalized-picard-functor-and-effective-divisor-fibration"></a>
### Curve case set-up: generalized Picard functor PG(X̄, Z) and the affine-space fibration of effective divisors (3.1-3.6)

`R23.1/generalized-picard-functor-and-effective-divisor-fibration` · construction · part R23.1

Let S = (f: X → B, Σ, {L_v}, {Ω_v}) be a Skolem datum with dim X_K = 1 and f quasi-projective and smooth. Choose a compactification j: X → X̄ over B with f̄ projective and X̄ normal; Z = X̄ - X with its reduced structure; g = h^1(X̄_K, O) and z = deg_K(Z_K), with z > 0 after enlarging Z. After shrinking B and enlarging Σ (1.10): (3.1.2) X̄ is regular, the fibres of f̄ are geometrically integral, and Z is regular and finite, flat and surjective over B (so a Cartier divisor). For d in N the symmetric power X^(d) = X^d/S_d (fibre product over B) represents effective Cartier divisors of X̄_S finite flat of degree d over S and disjoint from Z; U_d ⊂ X^(d) is the open of étale divisors; Ω_v^[d] ⊂ U_d(K_v) is the set of effective étale divisors of degree d on X ⊗ K_v which are L_v-split and contained in Ω_v. PG(X̄, Z)(S) (resp. PG_d) is the group of isomorphism classes of pairs (line bundle L on X̄_S, trivialisation of L on Z_S) (resp. with L of degree d); there is an exact sequence of sheaves 1 → G_m,B → (π_Z)_* G_m,Z → PG(X̄, Z) → Pic_{X̄/B} → 1, and PG(X̄, Z) is represented by a smooth separated group scheme locally of finite presentation (only the representability of its generic fibre, from Murre's theorem, SGA 6 XII 1.5, is used). The map φ_d: X^(d) → PG_d, D → cl^Z(D) = class of (O(D), s_D restricted to Z), has fibres described by (3.5.4). Lemme 3.3: Ω_v^[d] is open in U_d(K_v) for all d ≥ 0, and nonempty if [L_v : K_v] divides d. Lemme 3.6: if d ≥ 2g + z - 1, φ_d is a locally trivial fibration in affine spaces of dimension d + 1 - g - z.

**Hypotheses and conventions.**

- dim X_K = 1, f quasi-projective and smooth (reached by 1.4, 1.9, 1.10 and section 2)
- normalisation of X̄ keeps X unchanged because X is regular (f smooth)
- (3.1.2) is achieved only after replacing B by an open subscheme and enlarging Σ; it cites EGA IV 12.2.1 for geometric integrality of fibres
- the inequality in Lemme 3.6 is d ≥ 2g + z - 1 (checked on page image p. 189; the OCR prints it garbled)
- the duality argument of 3.6 uses that X̄ is regular hence Gorenstein and that each fibre X̄_b is geometrically reduced

**Construction.**

1. 3.2: the projection X^d → X^(d) is étale off the diagonals; (3.2.3) identifies X^(d)(S) with effective Cartier divisors finite flat of degree d over S and disjoint from Z (X smooth over B).
2. Lemme 3.3(i): Ω_v^[d] = Ω' ∩ U_d(K_v) where Ω' is the image of Ω_v^d minus diagonals under an étale projection, hence open. (ii): with δ = [L_v : K_v] and d = r δ, the union of the proper intermediate analytic submanifolds Ω_v ∩ X(M) has empty interior, so there are r points of degree δ over K_v, pairwise non-conjugate, whose conjugates form a K_v-rational divisor in Ω_v^[d].
3. 3.4: rigidity of the categories of pairs (from 3.1.2(ii) and surjectivity of Z → B) makes PG sheaves; (3.4.2) exhibits PG(X̄, Z) as an extension of Pic by the smooth affine group (π_Z)_* G_m,Z / G_m,B.
4. 3.5: a section s of L with s|Z = α is regular, and div(s) is in X^(d)(S); this gives the bijection (3.5.4) between X^(d)(S) and triples (L, α, s).
5. Lemme 3.6: for d ≥ 2g + z - 1, R^1 pr_2* of the universal bundle and of its twist by -Z vanish by duality; so the direct images E_d, N_d commute with base change and the restriction r_d: E_d → F_d is a surjection of locally free sheaves with kernel N_d; the subscheme r_d^(-1)(Im σ_d) of V(E_d-dual) is U^(d)... identified with X^(d) over P_d, a torsor under the vector bundle V(N_d-dual) of rank d + 1 - g - z.

**API.**

- `TauCeti.PotentialModularity.generalizedPicard` (constructor): PG(X̄, Z): line bundles on X̄_S with a trivialisation on Z_S, up to isomorphism
- `TauCeti.PotentialModularity.generalizedPicard_exact` (characterisation): 1 → G_m → (π_Z)_*G_{m,Z} → PG(X̄, Z) → Pic_{X̄/B} → 1
- `TauCeti.PotentialModularity.divisorClassMap` (constructor): φ_d : X^{(d)} → PG_d, D ↦ (𝒪(D), s_D|_Z)
- `TauCeti.PotentialModularity.divisorClassMap_affineFibration` (characterisation): Lemme 3.6: for d ≥ 2g + z − 1, φ_d is a locally trivial fibration in affine spaces of dimension d + 1 − g − z
- `TauCeti.PotentialModularity.omegaDivisors_open` (characterisation): Lemme 3.3: Ω_v^{[d]} is open in U_d(K_v), and nonempty when [L_v : K_v] divides d
- `TauCeti.PotentialModularity.generalizedPicard_forget` (compatibility): Forget the boundary trivialisation to obtain the pinned TauCeti line-bundle isomorphism class. For empty Z this is bijective; equality of rigidified classes requires an isomorphism respecting the trivialisation, not only mk_eq_mk_iff.
- `TauCeti.PotentialModularity.generalizedPicard_mk_eq_iff` (extensionality): Two rigidified line bundles represent the same class exactly when a line-bundle isomorphism intertwines the boundary trivializations.
- `TauCeti.PotentialModularity.generalizedPicard_lift` (universal-property): A function on rigidified line bundles invariant under compatible isomorphism descends uniquely to their quotient, with evaluation on a representative.
- `TauCeti.PotentialModularity.generalizedPicard_lift_mk` (simp): Evaluation of the descended function on a rigidified representative equals the original function on that representative.
- `TauCeti.PotentialModularity.generalizedPicard_group` (structure): In the relative curve setting PG is a commutative group sheaf: tensor product of rigidified line bundles, trivial rigidified unit and dual inverse. This extends the pinned line-bundle monoid and does not identify it with a general-scheme Picard group.
- `TauCeti.PotentialModularity.generalizedPicard_pullback` (functoriality): For a Cartesian base change of (X̄,Z)/B, pull back the line bundle and its boundary trivialization; preserve unit, product and inverse, satisfy identity/composition, and commute with forgetting to the relative Picard functor and with the divisor class map.

**Unit tests.**

- `pg_affine_line` (computation): X = 𝔸¹ ⊂ ℙ¹, Z = {∞}: g = 0, z = 1, and the fibre dimension d + 1 − g − z = d is that of monic polynomials of degree d
- `pg_multiplicative` (computation): X = G_m ⊂ ℙ¹, Z = {0, ∞}: g = 0, z = 2, the degree-0 part is G_m (the generalized Jacobian of modulus 0 + ∞), fibres of dimension d − 1
- `pg_small_degree` (non-example): g = 1, z = 1, d = 1 < 2g + z − 1 = 2: Lemme 3.6 does not apply
- `pg_trivial_Z` (degenerate): Z = ∅ recovers Pic, which is why z > 0 is arranged by enlarging Z
- `pg_rigidified_iso` (compatibility): Two rigidified representatives with a line-bundle isomorphism respecting the boundary trivializations give equal PG classes. Equality of literal representatives is not required.
- `pg_boundary_matters` (non-example): If no line-bundle isomorphism intertwines two boundary trivializations, their PG classes differ. Equality of the unrigidified line-bundle class alone cannot be used.
- `pg_forget_representative` (compatibility): For a representative (L,α), forgetting its PG class is exactly the pinned TauCeti LineBundleClass.mk L.

**Acceptance.**

- For X = P^1 minus two sections over ℤ[1/N] (g = 0, z = 2) compute φ_d for d ≥ 1 and check fibres are affine spaces of dimension d - 1
- Check that Ω_v^[d] is empty when [L_v : K_v] does not divide d in an example with L_v quadratic and X(K_v) ∩ Ω_v empty

**Used by.**

- [`R23.1/local-picard-open-sets-and-strong-approximation`](#n-r23-1-local-picard-open-sets-and-strong-approximation): strong approximation on the generalized Jacobian
- [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient): compactness of the quotient of the degree-0 part
- [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points): the curve case of the proof

**Depends on.** this roadmap: [`R23.1/elementary-reductions-of-skolem-data`](#n-r23-1-elementary-reductions-of-skolem-data); other roadmaps' layers: `SchemeAndStackFoundations:SF.3`, `AlgebraicModuliForArithmeticGeometry:R09.3`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), 3.1, p. 187: “Pour unifier la démonstration nous supposerons z>0 (on peut toujours agrandir Z!).” — The curve-case set-up with boundary degree z > 0.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), 3.2.4 and Lemme 3.3, p. 187: “qui sont effectifs de degré d, étales” — Definition of the local divisor sets Ω_v^[d] used in Lemme 3.3.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), 3.4, p. 188: “foncteur de Picard généralisé” — Definition of PG(X̄, Z) as pairs of a line bundle and a trivialisation along Z.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 3.6, p. 189 (inequality read on page image): “localement triviale en espaces affines de dimension” — The affine-space fibration φ_d for d ≥ 2g + z - 1, of dimension d + 1 - g - z.

<a id="n-r23-1-local-picard-open-sets-and-strong-approximation"></a>
### Local open sets W_v^[d] in the generalized Jacobian and the strong approximation step (Lemmes 3.7.2 and 3.8)

`R23.1/local-picard-open-sets-and-strong-approximation` · lemma · part R23.1

Keep the curve set-up (3.1.2), P_d = PG_d(X̄, Z), and put W_v^[d] = φ_d(Ω_v^[d]) ⊂ P_d(K_v) for v in Σ. (Lemme 3.7.2) (i) For d ≥ 2g + z - 1, W_v^[d] is open in P_d(K_v), and nonempty if d is a multiple of [L_v : K_v]. (ii) For d, d' ≥ 0 with d ≥ 2g + z, W_v^[d] · W_v^[d'] ⊂ W_v^[d+d'] in the group PG(X̄, Z). (Lemme 3.8) Let M be an invertible sheaf on X̄ of degree d ≥ 2g + z - 1 and α a trivialisation of M|Z, giving (M, α) in P_d(R). If (M, α)_v lies in W_v^[d] for every v in Σ and S is incomplete, then there is s in Γ(X̄, M, α) = {s in H^0(X̄, M) : s|Z = α} with div(s)_v in Ω_v^[d] for all v in Σ, and every irreducible component of div(s) is an integral point of S.

**Hypotheses and conventions.**

- inequalities checked on page images pp. 190-191: 3.7.2(i) and 3.8 need d ≥ 2g + z - 1; 3.7.2(ii) needs d ≥ 2g + z
- Lemme 3.8 needs S incomplete: this is exactly the hypothesis of the strong approximation theorem
- strong approximation is imported: Cassels-Fröhlich, Algebraic Number Theory, chapter II, section 15, stated there for an affine space isomorphic to R and extended 'immédiatement' by the source to a principal homogeneous space under a finitely generated projective R-module

**Proof outline.**

1. 3.7.2(i): openness from Lemme 3.3(i) and smoothness of φ_d (Lemme 3.6); nonemptiness from 3.3(ii).
2. 3.7.2(ii): given (L, α) in W_v^[d] and (L', α') = cl^Z(D') with D' in Ω_v^[d'], let A = Γ(X̄_{K_v}, L, α) and U ⊂ A the Zariski open of s with div(s) ∩ D' empty; U(L_v) is nonempty because otherwise H^0(L(-Z-P_i)) = H^0(L(-Z)) for some point P_i of D', forcing H^1(L(-Z-P_i)) nonzero, excluded by d ≥ 2g + z; so U(K_v) is v-dense in A; the v-open set V = {s : div(s) in Ω_v^[d]} is nonempty, pick D in V ∩ U(K_v); then D + D' is in Ω_v^[d+d'].
3. 3.8: by the degree bound A := Γ(X̄, M, α) is an R-affine space, a principal homogeneous space under the finitely generated projective R-module H^0(X̄, M(-Z)); for each v in Σ the set U_v of s with div(s) in Ω_v^[d] is open (3.3(i)) and nonempty (hypothesis); strong approximation (S incomplete) gives A dense in the product over v in Σ of A ⊗_R K_v, hence s; components of div(s) are finite over B and satisfy the local conditions.

**Acceptance.**

- Check in the case B = Spec ℤ[1/N], Σ = {infinity} that density of A in A ⊗ R fails for the complete datum of Remarque 1.8, locating where incompleteness enters
- Verify on page image that 3.7.2(ii) uses d ≥ 2g + z and not d ≥ 2g + z - 1

**Depends on.** this roadmap: [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 3.7.2(ii), p. 190 (inequalities read on page image): “le groupe PG(X, Z) étant noté multiplicative- ment” — The multiplicativity W^[d] W^[d'] ⊂ W^[d+d'] in the generalized Picard group.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Proof of Lemme 3.8, p. 191: “Le lemme résulte donc du théorème d'approxima- tion forte qui affirme que” — Where strong approximation, and hence incompleteness, is used.

<a id="n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient"></a>
### Quasi-compactness of P_0(K_Σ)/Γ(Z, O_Z^×) and the choice of (M, α) (Lemmes 3.9, 3.9.2, 3.10.2-3.10.4)

`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient` · lemma · part R23.1

(Lemme 3.9) Let M_0 be an ample invertible sheaf on X̄ (deg(M_0)_K > 0). If S is incomplete there are n ≥ 1 and a trivialisation α of M_0^{⊗n}|Z such that (M_0^{⊗n}, α) satisfies the hypotheses of Lemme 3.8. It rests on (Lemme 3.9.2) the quasi-compactness of G = P_0(K_Σ)/im Γ(Z, O_Z^×), where K_Σ = product of K_v over v in Σ and P_0 = PG_0(X̄, Z) with the product topology; consequently every g in G has the identity as an accumulation point of (g^n). The proof of 3.9.2 uses (Lemme 3.10.2, printed 3.30.2) for F locally compact and C a proper regular geometrically integral curve over F, J(F) is compact for J = Pic^0_{C/F}; (Lemme 3.10.3) H = (R' ⊗_R K_Σ)^×/(R'^× · K_Σ^×) is quasi-compact, R' the ring of Z; (Lemme 3.10.4) if S is incomplete, K_Σ^×/R^× is quasi-compact.

**Hypotheses and conventions.**

- S incomplete (used in 3.10.4 through the existence of a place v_0 of K' outside Σ' and Max(R'))
- the normalisations of 3.9's proof: after replacing M_0 by a power, (i) d = deg(M_0)_K ≥ 2g + z, (ii) [L_v : K_v] divides d for all v in Σ, (iii) M_0|Z is trivial (Pic(Z) finite by 1.1 and 3.1.2(iii)) (inequality read on page image p. 191)
- Lemme 3.10.2's proof is attributed to M. Raynaud and imports Altman-Kleiman's compactified Picard scheme (torsion-free rank one sheaves of degree 0 form a proper scheme containing J as an open)
- Lemme 3.10.4 imports the Dirichlet unit theorem in the form: the log embedding of S-units is a lattice in the trace-zero hyperplane (Cassels-Fröhlich II section 18)

**Proof outline.**

1. 3.9.3 (3.9.2 implies 3.9): W_Σ^[nd] = product of W_v^[nd] is a nonempty open of P_nd(K_Σ) with W^[md] W^[nd] ⊂ W^[(m+n)d] (3.7.2); fix q_0 in W_Σ^[d] and p_0 = class of (M_0, α_0); W'_Σ = W_Σ^[d] q_0^(-1) is a neighbourhood of 1 in P_0(K_Σ); by 3.9.2 some n ≥ 1 has (p_0 q_0^(-1))^n in Γ(Z, O_Z^×) · W'_Σ, i.e. λ^(-1) p_0^n lies in q_0^(n-1) W_Σ^[d] ⊂ W_Σ^[nd].
2. 3.10: from (3.4.2) the sequence 1 → ((π_Z)_* G_m,Z / G_m,B)(K_Σ) → P_0(K_Σ) → Pic^0_{X̄_K/K}(K_Σ) is a strict exact sequence of topological groups (the map c is smooth, hence open), so G is an extension of an open subgroup of the product of Pic^0(K_v) by H.
3. 3.10.2: after a finite separable extension C has a rational point; J(F) is the group of degree-0 line bundle classes, an open of the proper Altman-Kleiman scheme Y of torsion-free rank-one degree-0 sheaves, and every such sheaf is locally free on a regular curve, so J(F) = Y(F) is compact.
4. 3.10.3: R' is a finite product of normal domains; reduce to R' the normalisation of R in a finite extension K'; incompleteness gives a place v_0 of K' outside Σ' and Max(R'); apply 3.10.4 to R'.
5. 3.10.4: local unit groups are compact, so it suffices that the cokernel of the log map R^× → R^Σ is quasi-compact; with the set S̄ of all places not in Max(R), the image of the S̄ log map is a lattice in the trace-zero hyperplane, giving 0 → T → Coker → R → 0 with T compact; since Σ ⊊ S̄ (incompleteness) the composite R^(S̄ - Σ) → R is surjective, so Coker(λ_Σ) is a quotient of T.

**Acceptance.**

- For K = ℚ, R = ℤ[1/p], Σ = {infinity}: check K_Σ^×/R^× = R^×/{±p^n} is compact, and that it is not for R = Z with Σ = {infinity} (complete datum)
- Check that 3.9's normalisation (ii) is compatible with the nonemptiness criterion of 3.7.2(i)

**Depends on.** this roadmap: [`R23.1/local-picard-open-sets-and-strong-approximation`](#n-r23-1-local-picard-open-sets-and-strong-approximation); other roadmaps' layers: `SchemeAndStackFoundations:SF.3`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 3.9, proof, p. 191 (normalisations read on page image): “Pour (iii), remarquer que les hypothèses 1.1 sur R et 3.1.2 (iii) sur Z impliquent que Pic(Z) est fini” — The normalisation of M_0 in the proof of Lemme 3.9.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 3.9.2, p. 192: “Le groupe topologique G de (3.9.1) est quasi-compact.” — The compactness statement driving the choice of (M, α).
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Lemme 3.10.2 (printed 3.30.2), p. 192: “Alors le groupe J(F) est compact (pour la topologie déduite de celle de F).” — Compactness of local points of the Jacobian.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Proof of Lemme 3.10.4, p. 193: “est un réseau dans l'hyperplan” — The Dirichlet unit theorem input to the quasi-compactness of K_Σ^×/R^×.

<a id="n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points"></a>
### Moret-Bailly II, Théorème 1.3: every incomplete Skolem datum has an integral point

`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points` · theorem · planet “Moret-Bailly's theorem” · part R23.1

Every incomplete Skolem datum S = (f: X → B, Σ, {L_v}, {Ω_v}) (in the sense of 1.1-1.2) admits an integral point: an irreducible closed Y ⊂ X, finite and surjective over B, with Y ⊗_R L_v L_v-split and contained in Ω_v for every v in Σ. Equivalently there are a finite extension K'/K, with R' the normalisation of R in K', and x in X(R') such that for every v in Σ, K' ⊗_K L_v is a product of copies of L_v as an L_v-algebra and every embedding K' → L_v sends x into Ω_v.

**Hypotheses and conventions.**

- all hypotheses of 1.1: R Dedekind of arithmetic or geometric type, f separated of finite type and surjective, X irreducible, X_K geometrically irreducible, Σ finite disjoint from Max(R), L_v/K_v finite Galois, Ω_v nonempty open Gal-stable made of smooth points
- S incomplete
- the proof assumes Σ nonempty (so that X_K is generically smooth); the case Σ empty is Rumely's local-global principle, proved in part I, and the source says the present proof adapts to it with some modifications
- Moret-Bailly II states that it is independent of part I

**Proof outline.**

1. Replace X by X_red (then f is flat), f by a quasi-projective model (1.4), X_K by its smooth locus (1.9), enlarging Σ as needed (1.10).
2. Section 2 (Lemmes 2.2-2.3, 2.4): cut down by geometrically irreducible hypersurface sections through a curve T meeting every Ω_v, to dim X_K = 1.
3. Section 3: compactify, normalise to (3.1.2); pick an ample M_0; Lemme 3.9 (via the quasi-compactness 3.9.2) gives n and α with (M_0^n, α)_v in W_v^[nd] for all v; Lemme 3.8 (strong approximation) gives s with div(s)_v in Ω_v^[nd]; any irreducible component of div(s) is an integral point.

**Acceptance.**

- Derive from the theorem, for K a number field, R = O_K[1/N] with a place v_0 not in Σ ∪ Max(R), L_v = K_v and Ω_v = X(K_v) ∩ U for a Zariski-dense open U: a finite extension K' in which every v in Σ splits completely with X(K') ∩ U nonempty
- Check the theorem against Remarque 1.8 (complete datum, no integral point) to confirm incompleteness is used exactly in Lemmes 3.8 and 3.10.4

**Depends on.** this roadmap: [`R23.1/skolem-datum-and-integral-point`](#n-r23-1-skolem-datum-and-integral-point), [`R23.1/reduction-to-relative-dimension-one`](#n-r23-1-reduction-to-relative-dimension-one), [`R23.1/local-picard-open-sets-and-strong-approximation`](#n-r23-1-local-picard-open-sets-and-strong-approximation), [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [moret-bailly-1989-II](#src-moret-bailly-1989-II), Théorème 1.3, p. 182: “Toute donnée de Skolem incomplète admet un point entier.” — Literal statement of the theorem.
- [moret-bailly-1989-II](#src-moret-bailly-1989-II), p. 182, after Théorème 1.3: “Le présent article est toutefois indépendant de” — Part II does not depend on part I; part I (Σ empty, Rumely) is not an input.
- [moret-bailly-1989-I](#src-moret-bailly-1989-I), Théorème 1.7 (Rumely) and 1.11, pp. 162-163: “On suppose que X est irréductible” — Part I proves the Σ-empty integral-point theorem (Rumely), confirming the division of labour stated in part II.

<a id="n-r23-1-theorem-g-from-moret-bailly"></a>
### Deducing Taylor's Theorem G from Moret-Bailly's Théorème 1.3

`R23.1/theorem-g-from-moret-bailly` · lemma · part R23.1

Let K be a number field, S a finite set of places and X/K geometrically irreducible, smooth and quasi-projective with X(K_v) ≠ ∅ for v ∈ S. For every nonempty Zariski open U ⊆ X there is a finite K′/K inside K_S with U(K′) ≠ ∅; hence X(K_S) is Zariski dense. Deduction: spread U out to an irreducible, surjective, separated finite-type model 𝒰 over R = 𝒪_K[1/N], with N chosen so that some finite place w ∉ S divides N and is omitted from Σ = S; take L_v = K_v and Ω_v = U(K_v)^{sm} ≠ ∅ (U is dense in the smooth X and X(K_v) ≠ ∅); the Skolem datum is incomplete (w ∉ Σ ∪ Max(R)); Théorème 1.3 gives an integral point, i.e. a point of U over K′ split completely at every v ∈ S (Remarque 1.5), so K′ ⊆ K_S.

**Hypotheses and conventions.**

- the sources do not write this deduction; it is the standard spreading-out argument (EGA IV §8) and closes the draft's gap
- the omitted place w is what makes the datum incomplete; with Σ ∪ Max(R) all places the theorem does not apply
- U(K_v) ≠ ∅ for v ∈ S because a nonempty Zariski open subset of a smooth variety with a K_v-point has K_v-points (implicit function theorem)

**Proof outline.**

1. Spread out U over O_K[1/N], invert every finite place of S and one additional finite place w outside S. The extra inverted place w is absent from both Σ=S and Max(R), so the datum is incomplete.
2. Local data: L_v = K_v, Ω_v = U(K_v)^{sm}, open and nonempty.
3. Apply Théorème 1.3 and Remarque 1.5.

**Acceptance.**

- Check that Ω_v is Gal(L_v/K_v)-stable (trivially, L_v = K_v)
- Check that the deduction gives density, not only a point: every nonempty open U has a point

**Depends on.** this roadmap: [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points), [`R23.1/skolem-datum-and-integral-point`](#n-r23-1-skolem-datum-and-integral-point); other roadmaps' layers: `SchemeAndStackFoundations:SF.4`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Introduction, Theorem G, p. 5 (printed; page image): “Then X(K_S) is Zariski dense in X” — The statement deduced.

<a id="n-r23-1-taylor-theorem-g-split-completely-points-are-dense"></a>
### Taylor's Theorem G: points over the maximal extension split at S are Zariski dense

`R23.1/taylor-theorem-g-split-completely-points-are-dense` · application · part R23.1

(Taylor, Theorem G, attributed to Moret-Bailly [M] = part II) Let K be a number field and S a finite set of places of K; let K_S be the unique maximal extension of K inside a fixed algebraic closure in which all places of S split completely (for K = ℚ and S = {infinity}, K_S is the maximal totally real field). If X/Spec K is a geometrically irreducible smooth quasi-projective scheme with X(K_v) nonempty for all v in S, then X(K_S) is Zariski dense in X. KW II (proof of Theorem 6.1) uses the stronger form with open sets: applying Théorème 1.3 with prescribed v-adic open subsets Ω_v of local points (for example the points of X(ℚ_p) reducing to a given integral point x_v) yields a point over a field split at the given places whose local images lie in Ω_v.

**Hypotheses and conventions.**

- K a number field; S finite; X geometrically irreducible, smooth and quasi-projective over K; X(K_v) nonempty for every v in S
- the conclusion concerns K_S, an infinite extension; a single point lies over a finite subextension K' ⊂ K_S, which need not be Galois over K

**Proof outline.**

1. Taylor recalls Theorem G in the introduction and applies it in section 1 with S = places above l, p and infinity; no proof is given in Taylor.
2. Intended deduction (not written in the sources read): let S' be a finite set of places of K containing S, the archimedean places, one finite place v_0 not in S and the places of bad behaviour of a chosen model; let R be the ring of S'-integers and spread X out to an irreducible separated finite-type R-scheme, surjective over Spec R after enlarging S'; put Σ = S, which is disjoint from Max(R) and leaves v_0 outside Σ ∪ Max(R) (incomplete datum); take L_v = K_v and Ω_v = X(K_v) ∩ U(K_v) for a nonempty Zariski open U of X_K (nonempty by the analytic-dimension argument of Remarque 1.9, since X is smooth and X(K_v) is nonempty); Théorème 1.3 and Remarque 1.5 give K' with K' ⊗_K K_v a product of copies of K_v for v in S, i.e. K' ⊂ K_S, and a point of U(K').
3. Real places: for v real in S and L_v = R, splitting completely means every embedding of K' extending v is real; this is how Taylor obtains totally real fields.

**Acceptance.**

- Carry out the deduction for X = a smooth conic over ℚ with real points and S = {infinity}: produce a totally real quadratic field over which X has a point
- Check that for S containing a finite place v, L_v = K_v forces v to split completely in K', not merely to have a place of degree one

**Depends on.** this roadmap: [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points), [`R23.1/theorem-g-from-moret-bailly`](#n-r23-1-theorem-g-from-moret-bailly).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Proof of Theorem 6.1, ordinary case, p. 56: “applying Moret-Bailly theorem 1.3. of part 2 of [47] with this” — KW II invoke Théorème 1.3 of part II with prescribed open sets Ω_v, not only Theorem G.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Introduction, Theorem G, pp. 4-5 (printed; read on the page image): “There is a unique maximal extension K_S/K (inside a given algebraic closure of K) in which all places of S split completely” — The field K_S.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Introduction, Theorem G, p. 5 (printed; read on the page image): “Suppose that X/Spec K is a geometrically irreducible smooth quasi-projective scheme” — The hypotheses.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Introduction, Theorem G, p. 5 (printed; read on the page image): “Then X(K_S) is Zariski dense in X” — The conclusion.

<a id="n-r23-1-frobenius-primes-generate"></a>
### Generating Frobenius primes

`R23.1/frobenius-primes-generate` · lemma · part R23.1

Let D/K be finite Galois over a global field and B a finite set of places. There is a finite set T of unramified places outside B and choices of primes of D above them whose Frobenius elements generate Gal(D/K). In particular, for every nontrivial simple Galois intermediate D_i/K one can choose a place outside B not split in D_i. For a function field one uses its arithmetic Chebotarev theorem, including the restrictions imposed by the constant field.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Apply Chebotarev to each conjugacy class of a finite generating set, excluding B; conjugate the chosen prime above v to obtain the desired representative.
2. Alternatively choose a nonsplit prime for each simple Galois subextension. Every nontrivial normal quotient of Gal(D/K) has a simple quotient.

**Acceptance.**

- For D=ℚ(i), an odd prime 3 mod 4 has nontrivial Frobenius; excluding finitely many primes still leaves one. Do not infer existence from the baseline Frobenius-prime-set definition.

**Depends on.** other roadmaps' layers: `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; libraries: `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [snowden](#src-snowden), §5.2, proof of Proposition 5.2.2, p. 16: “generates Gal(M” — Generating Frobenius primes

<a id="n-r23-1-forcing-linear-disjointness-by-extra-split-places"></a>
### Forcing linear disjointness from a given finite extension by extra split places

`R23.1/forcing-linear-disjointness-by-extra-split-places` · application · part R23.1

Let D/K be finite Galois over a global field. Choose extra unramified places outside a finite forbidden set where the smooth geometrically connected variety has local points, with Frobenii generating Gal(D/K), or one nonsplit place for each simple Galois subextension D_i/K. Every finite Galois K′/K split at these places is linearly disjoint from D/K. The Galois hypothesis on K′ is used: K′∩D is a normal intermediate field. Its Frobenii are trivial at all the chosen split places, hence it equals K. For a non-Galois avoidance extension use its normal closure.

**Hypotheses and conventions.**

- the added primes must be unramified in L and distinct from p and from the auxiliary primes of the moduli problem
- their Frobenius elements must generate Gal(L̃/ℚ), L̃ the Galois closure of L/ℚ (Chebotarev supplies such primes; not stated in the source)
- the deduction 'F split at primes whose Frobenii generate Gal(L̃/ℚ) implies F ∩ L̃ = ℚ, hence F and L̃ (so F and L) linearly disjoint' is not written in KW II; it is the standard argument that every generator lies in Gal(L̃/(F ∩ L̃)) because each such prime splits completely in F ∩ L̃

**Proof outline.**

1. Spread out and use finite-field point bounds and smooth Hensel lifting to get local points outside a finite set.
2. Use generating Frobenius primes outside that set, add split local conditions to Moret–Bailly, and take a normal closure.
3. The intersection is Galois; the Frobenius images generate its Galois group and are all trivial. Use the pinned finite-Galois intersection criterion for linear disjointness.

**Acceptance.**

- Test with L = the splitting field of x^3 - 2 and a totally real F split at two primes whose Frobenii generate S_3: check F ∩ L = ℚ
- Record for the moduli application that X(Q_q) must be nonempty at the added primes q; identify where the source's construction guarantees it

**Depends on.** this roadmap: [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate), [`R23.1/taylor-theorem-g-split-completely-points-are-dense`](#n-r23-1-taylor-theorem-g-split-completely-points-are-dense); libraries: `mathlib:IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Proof of Theorem 6.1, last paragraph, p. 57: “we furthermore impose that F is split at a chosen ﬁnite set of primes that are unramiﬁed in L, and whose Frobenii generate the Galois group of the Galois closure of L/Q” — The source's mechanism for forcing linear disjointness.
- [kw-annals-2009](#src-kw-annals-2009), Proof of Theorem 2.1, p. 234: “The property that im(¯ρ) = im(¯ρ|GF ) is ensured if F is linearly disjoint from the ﬁxed ﬁeld of kernel of ¯ρ” — The use of linear disjointness to keep the residual image.
- [kw-annals-2009](#src-kw-annals-2009), Proof of Theorem 2.1, p. 234: “We use the reﬁnement of Moret-Bailly’s theorem (see Theorem G of [51]) given in Proposition 2.1 of [23” — KW Annals attribute the disjointness refinement to [23] = Harris-Shepherd-Barron-Taylor, Prop. 2.1 (not in the library).

<a id="n-r23-1-cht-character-extension"></a>
### Extending finite local characters

`R23.1/cht-character-extension` · lemma · part R23.1

For a number field F, a finite set S of places and a continuous finite-order character χ_S: product_{v in S} F_v^× → ℚ̄^×, there exists a continuous character χ: A_F^×/F^× → ℚ̄^× restricting to χ_S. In the cyclic-extension application choose an extension with finite image; this requires the finite ray-class quotient and divisibility of roots of unity, rather than extending into a fixed cyclic group of the same order.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Choose an open compact subgroup away from S whose intersection with F^× has χ_S=1, using the congruence-subgroup lemma for finitely generated S-units.
2. Extend the resulting character from its subgroup in the finite ray-class quotient using divisibility of ℚ̄^×; finite image follows by using the finite quotient.
3. Apply global reciprocity to obtain a cyclic extension realising the local characters; its degree may exceed the local character orders, which avoids the naive Grunwald–Wang obstruction.

**Acceptance.**

- For the trivial local characters choose the trivial global character. Verify that p=2 is included and an added auxiliary place is allowed to ramify, avoiding the unrestricted Grunwald–Wang assertion.

**Depends on.** other roadmaps' layers: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [cht](#src-cht), Lemma 4.1.1 and proof, pp. 116–117: “extends to a continuous character” — Extending finite local characters

<a id="n-r23-1-cht-soluble-prescribed-completions"></a>
### Soluble extensions with prescribed completions

`R23.1/cht-soluble-prescribed-completions` · theorem · planet “Prescribed soluble extensions” · part R23.1

Let F be a number field, D/F finite Galois, S a finite set of places, and E_v/F_v finite Galois for each v in S (at real places either R or C). There is a finite soluble Galois E/F linearly disjoint from D/F such that for every w above v in S, E_w is isomorphic to E_v as an F_v-algebra. Taking E_v=R at every real place makes E totally real when F is totally real. No assertion of cyclic E of a prescribed degree is made.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Add split conditions at a nonsplit prime for each simple Galois subextension of D, by Chebotarev.
2. Induct on the maximum of the local extension degrees. Finite Galois groups of nonarchimedean local fields are soluble, so choose a nontrivial cyclic quotient at each nonsplit place.
3. Use the character-extension lemma and global/local reciprocity to realise the cyclic local first steps; apply induction to the remaining local extensions.
4. Take the normal closure of the composite over F; local normality ensures the completions remain E_v, solvability is preserved, and the added split conditions force disjointness.

**Acceptance.**

- For all L_v=K_v check complete splitting, and for a real place prescribed R check that all resulting real completions remain R. The avoidance field must be included at each cyclic tower step.

**Depends on.** this roadmap: [`R23.1/cht-character-extension`](#n-r23-1-cht-character-extension), [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate); other roadmaps' layers: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [cht](#src-cht), Lemma 4.1.2 and proof, p. 117: “a soluble Galois extension” — Soluble extensions with prescribed completions

<a id="n-r23-1-tower-linear-disjointness"></a>
### Disjointness through a field tower

`R23.1/tower-linear-disjointness` · lemma · part R23.1

Inside a common overfield, if C⊆B⊆A and D⊇C with A and D linearly disjoint over C, then A and BD are linearly disjoint over B, and A∩BD=B. No converse from intersection alone is asserted without a finite Galois hypothesis.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Base change the injective tensor multiplication map from C to B.
2. Use linear independence, or the tensor isomorphism A⊗_B(B⊗_C D)=A⊗_C D, to prove disjointness.
3. Apply disjointness ⇒ trivial intersection.

**Acceptance.**

- Take B=C to recover the original disjointness statement; take D=C to obtain A∩B=B. Do not replace tensor injectivity by trivial intersection without Galois hypotheses.

**Depends on.** libraries: `mathlib:IntermediateField.LinearDisjoint`, `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [qian](#src-qian), §2 opening facts, preceding Lemma 2.1: “In particular” — Disjointness through a field tower

<a id="n-r23-1-moret-bailly-three-local-conditions"></a>
### Moret–Bailly with three local conditions

`R23.1/moret-bailly-three-local-conditions` · theorem · planet “Moret–Bailly approximation” · part R23.1

Let K be a number field, T/K a smooth geometrically connected variety, H/K finite Galois, and S=S1⊔S2⊔S3 finite, with S2 nonarchimedean. For v∈S1 give a nonempty open Ω_v⊆T(K_v); for v∈S2 give a nonempty open Ω_v⊆T(K_v^nr), invariant under Gal(K_v^nr/K_v); for v∈S3 give a nonempty open Ω_v⊆T(K̄_v), invariant under Gal(K̄_v/K_v). There exist finite Galois K′/K disjoint from H/K and P∈T(K′), such that every v∈S1 splits completely, every v∈S2 is unramified, and for every w|v the image P_w lies in Ω_v∩T(K′_w) in the specified local ambient field. If K is totally real and every real place is in S1, K′ is totally real.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Choose local points of finite definition inside each open. At S2 their fields are finite unramified; at S3 they are finite separable.
2. Use CHT prescribed completions to choose a finite Galois preliminary extension realising these finite local fields, split at S1 and unramified at S2.
3. Over this preliminary extension apply the incomplete Skolem theorem with split local conditions inside the pulled-back opens; omit an extra inverted place to ensure incompleteness.
4. Take the normal closure over K. Galois invariance of the original opens ensures all conjugates obey the conditions; normal closures preserve split and unramified local conditions.
5. Force disjointness using added large split places chosen with local points and nonsplit Frobenii in each simple quotient of H.

**Acceptance.**

- Test S1={infinity}, S3={l,l′} and S2 empty, as in Qian. A nontrivial ramified L_v at S3 is permitted; it must not accidentally be forced split or unramified.

**Depends on.** this roadmap: [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.1/forcing-linear-disjointness-by-extra-split-places`](#n-r23-1-forcing-linear-disjointness-by-extra-split-places), [`R23.1/density-of-algebraic-and-separable-local-points`](#n-r23-1-density-of-algebraic-and-separable-local-points).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [qian](#src-qian), Proposition 4.2, statement and application, §4: “every element of S2 is non-archimedean” — Moret–Bailly with three local conditions

<a id="n-r23-1-moret-bailly-over-a-preliminary-extension"></a>
### Moret–Bailly above a preliminary field

`R23.1/moret-bailly-over-a-preliminary-extension` · theorem · part R23.1

In the preceding theorem let M/K be finite Galois, split at S1 and unramified at S2, take T/M smooth geometrically connected, and prescribe the three kinds of nonempty Galois-invariant local opens at every place of M over S. For a finite Galois L/K disjoint from M/K, obtain finite Galois K′/K containing M, linearly disjoint from L/K, with P∈T(K′) satisfying all local conditions. The invariance is over the local base M_v; no extra equivariance of opens under Gal(M/K) is required.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. First restrict to a nonempty affine open meeting every specified analytic open, using density on the smooth variety; retain the finite-cover quotient after restriction. This supplies the affine/quasi-projective hypothesis for scheme Weil restriction. The analytic density/property adapter is recorded as a gap.
2. Pass to Res_{M/K}T. Its local points are products indexed by places above v; its geometric base change is a product of conjugate varieties.
3. Apply the three-condition theorem with avoidance field the Galois closure of LM, choose E/K disjoint from LM, then put K′=EM.
4. Use the tower lemma to check K′∩L=K and translate the product local conditions.

**Acceptance.**

- If the preliminary extension is K, recover the ordinary three-condition theorem. If it is nontrivial, check opens at every place above v, not one chosen embedding.

**Depends on.** this roadmap: [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions), [`R23.1/tower-linear-disjointness`](#n-r23-1-tower-linear-disjointness); other roadmaps' nodes: `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; other roadmaps' layers: `AbelianSchemesAndArithmeticModuli:A6`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [blght](#src-blght), Proposition 6.2, pp. 40–41: “Suppose that M/F is a finite Galois extension” — Moret–Bailly above a preliminary field

<a id="n-r23-1-surjective-specialisation-finite-quotient"></a>
### Surjective specialisation of a finite quotient

`R23.1/surjective-specialisation-finite-quotient` · theorem · planet “Surjective specialisation” · part R23.1

Let F be imaginary CM and Galois over ℚ, and T/F smooth geometrically irreducible. Let Favoid/F be finite, S0 a finite set of rational primes, and for each v|l, l∈S0, let L_v/F_v be finite Galois with σ(L_v)=L_{σ(v)} for σ∈G_Ql, and Ω_v⊆T(L_v) nonempty open and Gal(L_v/F_v)-invariant. There is a CM extension F′/F, Galois over ℚ and disjoint from Favoid/F, and P∈T(F′) with F′_w≅L_v and P_w∈Ω_v at every w|v. If f:π1_et(T)→G is a surjection to a finite group, P can additionally be chosen so f∘P_*:G_F′→G is surjective.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. First restrict to a nonempty affine open meeting every specified analytic open, using density on the smooth variety; retain the finite-cover quotient after restriction. This supplies the affine/quasi-projective hypothesis for scheme Weil restriction. The analytic density/property adapter is recorded as a gap.
2. Apply the Calegari/BLGGT local-completion refinement of Moret–Bailly; restriction of scalars to ℚ gives F′=FE with E/ℚ totally real Galois. Exact completions need this refinement, not just splitting after tensoring with L_v.
3. Spread T and its finite étale cover out smoothly over O_F. Scheme Chebotarev supplies, for each conjugacy class C of G, a sufficiently large closed point x_C in T(k(v_C)) with Frobenius in C.
4. Choose distinct underlying rational primes, and the Hensel tube of x_C as Ω_{v_C}. At other places of F over that rational prime use T(F_v), nonempty for large norm.
5. Every specialisation subgroup meets every conjugacy class. Jordan’s finite-group theorem forces it to be G.

**Acceptance.**

- With trivial finite quotient recover the point-selection theorem; for nontrivial quotient prove every conjugacy class is met, then use Jordan, rather than counting generating elements only.

**Depends on.** this roadmap: [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions); other roadmaps' nodes: `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; other roadmaps' layers: `AbelianSchemesAndArithmeticModuli:A6`, `SchemeAndStackFoundations:SF.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bianchi](#src-bianchi), Proposition 4.5.1 and proof, pp. 48–49: “Then we can further choose P so that the image” — Surjective specialisation of a finite quotient

<a id="n-r23-1-function-field-isomorphism-torsor"></a>
### The function-field isomorphism torsor

`R23.1/function-field-isomorphism-torsor` · lemma · part R23.1

Let X,Y/𝔽_q be smooth geometrically connected curves, K=𝔽_q(X), F=𝔽_q(Y), H finite, and φ:π1(X)→H, ψ:π1(Y)→H. On Y_K form Z=Isom_{Y_K,H}(X_φ,X_ψ), finite étale over Y_K. If ψ remains surjective on the geometric fundamental group, Z is geometrically connected as a curve over K. For finite separable K′/K and z∈Z(K′) whose image in Y(K′) is not in the image of Y(𝔽̄_q∩K′), z gives an 𝔽_q-embedding β:F→K′ and β*ψ conjugate to φ|G_K′. Z is not a finite K-scheme; it has relative dimension one over K.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.
- Use the corrected finite-etale base in source issue E8; for a K′-point require that its image is not in Y(𝔽̄_q∩K′).

**Proof outline.**

1. Construct the Isom scheme of the two H-torsors using the finite étale torsor supplier.
2. Use SGA1 V.6.9: surjectivity on fundamental groups iff every connected finite étale cover stays connected; compare Y_K̄ with Y_𝔽̄_q.
3. Over K̄ the φ-torsor is trivial, so Z becomes the geometrically connected ψ-cover.
4. A nonconstant point maps to the generic point of Y and hence embeds its function field; the torsor isomorphism gives conjugacy of monodromy.

**Acceptance.**

- For H trivial the Isom scheme is the base curve. For nontrivial H, dropping geometric surjectivity can make the Isom cover disconnected.

**Depends on.** other roadmaps' layers: `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bhkt-published](#src-bhkt-published), Lemma 9.1 and diagram (9.1), published pp. 76–77: “geometrically connected finite étale K-scheme” — The printed base K is corrected to Y_K by E8; the geometric connectedness is confirmed by the proof and the independent 2025 correction.
- [bhkt-correction](#src-bhkt-correction), p. 28, Isom-scheme paragraph: “not finite étale over” — The corrected finite-etale base of BHKT Lemma 9.1 is already recorded by Beuzart-Plessis–Harris–Thorne (2025).

<a id="n-r23-1-function-field-point-with-fixed-constants"></a>
### Moret–Bailly with unchanged constant field

`R23.1/function-field-point-with-fixed-constants` · theorem · planet “Fixed-constant-field approximation” · part R23.1

With the preceding torsor data and D/K finite Galois, there exist finite Galois K′/K and β:F→K′ over 𝔽_q such that K′ is disjoint from D/K, K′∩𝔽̄_q=𝔽_q, and β*ψ is H-conjugate to φ|G_K′. More generally the same field choice works for a smooth geometrically connected K-curve with a specified proper closed subset to avoid.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Spread the curve out; Weil bounds and smooth Hensel lifting give local points at almost all places.
2. Choose large nonsplit places for each simple Galois subextension of D, where local points exist; require K′ split there.
3. Add two further split places whose residue degrees are coprime. A constant extension inside K′ has degree dividing each of those degrees, hence degree one.
4. Apply MB89 II Theorem 1.3 to the complement of the finitely many constant-image points of the torsor curve. Take a normal closure and use the nonconstant-point lemma.

**Acceptance.**

- Splitting at places of residue degrees m,n with gcd(m,n)=1 forces the constant-field extension degree to divide both and hence equal one. One degree-two split place alone does not suffice.

**Depends on.** this roadmap: [`R23.1/function-field-isomorphism-torsor`](#n-r23-1-function-field-isomorphism-torsor), [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points), [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bhkt-published](#src-bhkt-published), Proposition 9.2 and proof, published p. 78: “two further places” — Moret–Bailly with unchanged constant field

<a id="n-r23-1-potential-global-galois-local-data"></a>
### Potential realisation of local Galois data

`R23.1/potential-global-galois-local-data` · theorem · part R23.1

For a global field K, finite S, finite group H, and finite Galois M_v/K_v with specified embeddings Gal(M_v/K_v)→H, obtain a finite K′/K split at S and a Galois M/K′ with Gal(M/K′)≅H realising each local extension and decomposition-group embedding up to conjugacy; at real places prescribe an element of order dividing two. In the number-field refinement of Calegari Proposition 3.2, K′/K is totally real and Galois when K is totally real, and the Galois extension M/K′ is linearly disjoint over K from a given finite avoidance field. For function fields only the conclusion of BHKT Theorem 9.3 is asserted: no Galois, avoidance or fixed-constant-field refinement of K′ is included without an additional argument. Its MB90 source remains an explicit gap.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. For number fields use a faithful permutation representation, the smooth free-action locus in affine space, and its finite-group quotient.
2. Realise each local permutation orbit using primitive elements of the fixed subfields of M_v; Krasner’s lemma makes this locus open. Add unramified local conditions for every conjugacy class and use Jordan to force the full group.
3. To make the full splitting field avoid D, add nonsplit Frobenius places of the normal closure of D with trivial prescribed H-torsor. The normal closure of the resulting splitting field splits there, so the Frobenius disjointness criterion applies to that field, not merely to the point field.
4. Apply Moret–Bailly and translate the specialised torsor. For function fields, request the complete proof of MB90 Theorem 1.2; BHKT states it without proof.

**Acceptance.**

- With H trivial and trivial local fields recover split point selection. For nontrivial H verify the specified injections as well as the abstract completion isomorphisms.

**Depends on.** this roadmap: [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions); other roadmaps' layers: `SchemeAndStackFoundations:SF.1`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bhkt-published](#src-bhkt-published), Theorem 9.3, published pp. 78–79: “a Galois extension” — Potential realisation of local Galois data
- [calegari](#src-calegari), Proposition 3.2 and proof, author pp. 5–6: “linearly disjoint” — Totally real number-field local-Galois realization, with avoidance of the full resulting field.

<a id="n-r23-1-snowden-soluble-preliminary-field"></a>
### Split fields after a soluble preliminary extension

`R23.1/snowden-soluble-preliminary-field` · lemma · part R23.1

For a number-field Skolem datum (X,Σ,{L_v},{Ω_v}) with smooth geometrically connected X and finite S, there are finite soluble Galois F1/F and finite Galois F2/F disjoint from F1 and a prescribed avoidance field, with F1⊗F L_v split, F2 split at S and over L_v, and x∈X(F1F2) whose images lie in Ω_v for every F-embedding F1F2→L_v. This means F2 splits after tensoring with L_v, not that F2’s completions equal L_v.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Enlarge S to include Σ. Use CHT to choose F1 with completions L_v at Σ and local points at S minus Σ, obtaining the latter over some finite separable local extension.
2. Apply the split Moret–Bailly theorem to Res_{F1/F} X_F1 with product opens and avoidance F1 times the given field.
3. Identify its F2-points with X(F1F2); total reality follows if real local conditions are real.

**Acceptance.**

- For F1=F this is split point selection at S. Check that F1F2 can embed in L_v even though F2 itself splits at v, and that prescribed S splitting belongs to F2, not to the composite.

**Depends on.** this roadmap: [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions); other roadmaps' nodes: `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; other roadmaps' layers: `AbelianSchemesAndArithmeticModuli:A6`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/MoretBailly`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [snowden](#src-snowden), Proposition 8.2.2 and proof, p. 26: “a finite solvable extension” — Split fields after a soluble preliminary extension

<a id="layer-r23-2"></a>
## R23.2 — The auxiliary moduli problem

*Coverage in the R23.1 part: planned. 4 nodes, 0 planets.*

HilbertModularVarietiesAndShimuraCurves H6 owns the moduli of abelian varieties with real multiplication by M, the simultaneous torsion and polarisation twists, their components, and every real and finite local point. This layer chooses the arithmetic data those moduli are twisted by and applies R23.1 to them; it reconstructs nothing of H6.

- **Taylor's auxiliary data.** For ρ̄ : G_F → GL₂(k) with insoluble image, ordinary of the shape (εχ_v⁻¹, ∗; 0, χ_v) above l and det ρ̄ = ε (the hypothesis as corrected in Taylor 2006; without it the alternating pairing on the l-torsion cannot be chosen): the field N₀ = ℚ(ζ, √(1 − 4l)), the lifts β_v of χ_v(Frob) and the characters χ̃_v; an auxiliary prime p ≠ l chosen by Chebotarev; a CM quadratic L/F; a character ψ of G_L with det Ind ψ = ε_p; and coefficient fields N ⊇ N₀ and its real subfield M. Two corrections are part of the construction. The norm β_vβ_v^c is q_v = l^{[k(v):𝔽_l]}, not p (source issue E9 of the R23.1 part). When χ_v² = 1 the prescribed character is the Teichmüller lift, so p must also avoid the divisors of q_v − 1. The element α_w of norm p is an algebraic number, not the value of the p-adic cyclotomic character on a Frobenius lift.
- **Taylor's Lemma 1.1** produces ψ with prescribed local reductions and prescribed determinant of the induction, from global class field theory; it assumes the CM field L, it does not construct it.
- **Applying Moret–Bailly.** At l, at p and at the real places, H6 exports nonempty open sets of local points of the twisted moduli scheme (ordinary tubes at ordinary places). Moret–Bailly gives a totally real Galois E/F, split where required and disjoint from a prescribed field, and an abelian variety A/E with A[λ] ≅ ρ̄|G_E and A[℘] ≅ (Ind ψ̄)|G_E. For Snowden and Boxer–Calegari–Gee–Pilloni the scheme lives over F1 and is restricted to F; its local points are products over the places of F1, and the output field avoids F1Favoid.

**Still open in this layer.**

- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.
- Taylor Lemma 1.1 algebraic characters and S-unit congruence input
- Weil restriction of varieties: property and analytic-open adapter
- Taylor auxiliary prime, quadratic and coefficient field choices
- Suggested APIs and tests: missing full object interfaces

<a id="n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions"></a>
### Taylor Lemma 1.1: a character of a CM quadratic extension with prescribed local reductions and prescribed determinant of its induction

`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions` · lemma · part R23.1

Let p be a rational prime, O the integers of a finite extension of ℚ_p with residue field F. Let K be totally real and L/K a totally imaginary quadratic extension in which every place of K above p splits. Let S be a finite set of finite places of K which split in L and contain all places above p, and S_L a set of places of L containing exactly one place above each element of S. Let φ: G_K → O^× be continuous, sending every complex conjugation to -1 and of the form ε_p^n times a finite-order character for some n in Z. For each x in S_L let ψ̄_x: G_{L_x} → F^× be continuous. Then there are a finite extension of Frac(O), with integers O' and residue field k', and a continuous character ψ: G_L → (O')^× such that for all x in S_L, ψ|G_{L_x} is finitely ramified and reduces to ψ̄_x, and det Ind_{G_L}^{G_K} ψ = φ.

**Hypotheses and conventions.**

- every place of K above p splits in L; every place of S splits in L; S contains the places above p
- φ odd (every complex conjugation to -1) and a power of ε_p times a finite-order character
- the final step imports 'lemma 2.1 of [Ta2]' (Taylor, On icosahedral Artin representations II, Amer. J. Math. 125 (2003)), which the source calls presumably well known; [Ta2] was not read
- the proof's second displayed condition reads 'coincides with ψ_x on L_y^× for y ∈ S_L'; ψ_y is meant (source issue PotentialModularityAndCompatibleSystems/E5)

**Proof outline.**

1. Choose ψ_0 with ε_p^{-1} det Ind ψ_0 of finite order and ψ_0|I_x of finite order for x in S_L; seeking ψ = ψ_0^n ψ' reduces to n = 0; one may assume S_L generates the class group of L.
2. By class field theory, let ψ_x: L_x^× → O^× correspond to the Teichmüller lift of ψ̄_x and φ' the idele character of K attached to φ times the quadratic character of L/K; one must find ψ: A_L^×/L^× → (O')^× restricting to φ' on A_K^× and to ψ_x on L_x^× for x in S_L.
3. With T the finite places outside S where φ' ramifies and chosen extensions ψ_x of φ'|O_{K,x}^× to O_{L,x}^× for x in T, define ψ_0 on (prod_{x in S} L_x^× × prod_{x in T} O_{L,x}^×)/K_S^×; it suffices to extend to a character of the product with prod_{y not in S∪T} (O_{L,y}^×/O_{K,y}^×) modulo L_S^×, i.e. to find a continuous character on that last product agreeing with ψ_0 on L_S^×/K_S^×.
4. As ψ_0 has finite order it suffices that every finite-index subgroup of L_S^×/K_S^× contains the preimage of an open subgroup of prod_{y not in S∪T} O_{L,y}^×/O_{K,y}^×; the commutative diagram with the map c-1 and finite generation of L_S^× reduce this to: for every n, (L_S^×)^n contains the preimage of an open subgroup of prod O_{L,y}^× -- the imported statement from [Ta2], Lemma 2.1.

**Acceptance.**

- Check the case K = ℚ, L imaginary quadratic, S = {p}: the conclusion is an algebraic Hecke character of L with prescribed reduction at one place above p
- Identify where the oddness of φ is needed (det Ind ψ is odd for any ψ, so φ must be odd)

**Depends on.** other roadmaps' layers: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorAuxiliary`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Lemma 1.1 and proof, printed pp. 7-9 (page images): “This is presumably well known, see for instance lemma 2.1 of [Ta2].” — The last step of the proof is imported from [Ta2]; the statement is read on the page image of p. 7-8.

<a id="n-r23-2-taylor-auxiliary-data-p-l-psi-n-m"></a>
### Taylor's auxiliary data for the ordinary-at-l case: the prime p, the CM extension L/F, the character ψ, and the fields N and M

`R23.2/taylor-auxiliary-data-p-L-psi-N-M` · construction · part R23.1

Standing hypotheses of Taylor 2002 section 1 as corrected in Taylor 2006 (pp. 776-777): l an odd prime, k/𝔽_l finite, F totally real, ρ̄: G_F → GL_2(k) continuous with insoluble image, ρ̄|G_v ~ (ε χ_v^{-1}, *; 0, χ_v) for every place v of F above l, and det ρ̄ = ε (the corrected third bullet; ε the l-adic cyclotomic character mod l). For v | l let F̃_v be the smallest totally tamely ramified extension of F_v over which χ_v becomes unramified. Let ζ be a primitive #k^× root of unity and N_0 = ℚ(ζ, √(1-4l)); l is unramified in N_0 and every prime of N_0 above l has residue field isomorphic to k; fix λ_0 | l at which a=(1+√(1-4l))/2 is a unit, and O_{N_0}/λ_0 ≅ k (choose the root reducing to 1 rather than 0). For v | l put β_v = ζ^{b_v} ((1+√(1-4l))/2)^{[k(v):𝔽_l]} with β_v ≡ χ_v(φ_v) mod λ_0 for a Frobenius lift φ_v in G_{F̃_v}, and let χ̃_v: W_{F_v} → N_0^× be the unique character which, if χ_v^2 ≠ 1, sends φ_v to β_v and is the Teichmüller lift of χ_v on inertia, and, if χ_v^2 = 1, is the Teichmüller lift of χ_v. Choose an odd prime p ≠ l such that: ρ̄ is unramified at all w | p with ρ̄(Frob_w) having distinct eigenvalues; p splits completely in the Hilbert class field of N_0; p splits completely in the fixed field of ker(ε^{-1} det ρ̄); p is coprime to β_v - β_v^c for all v | l; and, as an explicit strengthening of the printed choice, p does not divide q_v - 1 whenever χ_v^2 = 1, where q_v = l^[k(v):𝔽_l]. Choose ℘_0 | p in N_0, and for w | p choose α'_w in ℤ[(1+√(1-4l))/2] of norm p, taking the ℘_0-unit conjugate and α_w = ζ^{a_w} α'_w congruent to an eigenvalue of ρ̄(Frob_w). Choose a quadratic L/F with the stated real, splitting and noncyclotomic properties (a separate field-choice input, not the conclusion of Lemma 1.1), and use Lemma 1.1 to obtain ψ: G_L → (N̄_{0,℘_0})^× with: L totally imaginary and not contained in F(ζ_p); each v | l splits as v_1 v_1^c in L with ψ̄|W_{L_{v_1}} equal to the reduction of χ̃_v in (O_{N_0}/℘_0)^ac; each w | p splits as w_1 w_1^c with ψ|G_{w_1} unramified sending arithmetic Frobenius to a lift of α_w; det Ind_{G_L}^{G_F} ψ = ε_p. Then ψ̄|G_{v_1} ≠ ψ̄^c|G_{v_1} for v | l. Finally choose a Galois CM extension N/N_0 in which primes above l split, primes above p are unramified, and some ℘ | ℘_0 has ψ̄ valued in O_N/℘; choose λ | λ_0 in O_N and let M be the maximal totally real subfield of N.

**Hypotheses and conventions.**

- l odd; ρ̄ insoluble image; ρ̄|G_v reducible of the displayed shape at every v | l
- det ρ̄ = ε: printed in the preprint as 'det ρ̄(c) = -1' and corrected in Taylor 2006 p. 776, which explains that without it the alternating isomorphism a_λ needed for the moduli problem cannot be chosen
- Taylor 2006 p. 776 prints β_vβ_v^c = ψ(φ_v)ψ^c(φ_v) = p. This equality is erroneous: β_vβ_v^c = q_v = l^[k(v):𝔽_l], and the determinant gives ψ(φ_v)ψ^c(φ_v) = q_v at v | l, where v is away from p (source issue E9). When χ_v² = 1, the prescribed ψ is the Teichmüller character, so distinctness additionally requires q_v ≠ 1 mod p. The reviewed construction adds this finite exclusion to the choice of p.
- existence of p satisfying the four conditions is asserted without argument (a Chebotarev density argument over the compositum of the relevant fields is implicit)
- α_w is printed as congruent to an eigenvalue of ρ̄(Frob_w) 'modulo λ' before λ is chosen (printed p. 7); λ₀ is meant (source issue PotentialModularityAndCompatibleSystems/E6)

**Construction.**

1. Form N₀ and choose λ₀ above l with a=(1+√(1−4l))/2 reducing to 1 (the conjugate reduces to 0); this makes β_v nonzero modulo λ₀. Form the local lifts β_v, χ̃_v from the residue character data. Choose the auxiliary prime p by Chebotarev in the compositum of the residual cutout, the relevant class fields and the finitely many exclusion fields; exclude the prime divisors of β_v−β_v^c. Also exclude prime divisors of q_v−1 in the χ_v²=1 branch; these are finitely many additional primes and do not change the Chebotarev existence argument.
2. α'_w exists because p splits completely in the Hilbert class field of ℚ((1+√(1-4l))/2), a subfield of N_0 (the source's parenthesis). Take the conjugate that is a unit at ℘_0 so that its reduction is a valid nonzero character value.
3. First choose L with the CM/split/noncyclotomic properties; this field-choice input is a recorded gap. Then Apply Lemma 1.1 with K = F, O = the completion of N_0 at ℘_0 (or a finite extension), φ = ε_p, S = places above l and p, S_L = {v_1, w_1}, and prescribed residual characters χ̃_v (at v_1) and unramified characters with Frobenius α_w (at w_1).
4. At v | l, det Ind ψ gives ψ(φ_v)ψ^c(φ_v)=q_v. If χ_v²≠1, the reduction ψ̄(φ_v) equals β̄_v, so ψ̄^c(φ_v)=β̄_v^c and their values differ by the β_v−β_v^c exclusion. If χ_v²=1, ψ̄(φ_v)=±1, so the two reductions differ precisely when q_v≠1 mod p; use the added exclusion. Lemma 1.1 prescribes reductions, not an equality of arbitrary p-adic lifts with β_v. This is distinction on the full local Galois group, not necessarily on inertia.

**API.**

- `TauCeti.PotentialModularity.TaylorAuxiliaryData` (structure): The data (p, ℘₀, α_w, L, ψ, N, ℘, λ, M) with the stated properties, for a ρ̄ satisfying Taylor's standing hypotheses.
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.exists` (constructor): Such data exist (Chebotarev for p, then Lemma 1.1 for ψ, then a CM extension N/N₀).
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.det_ind` (characterisation): det Ind_{G_L}^{G_F} ψ = ε_p.
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.psi_ne_conj` (characterisation): ψ̄|G_{v₁} ≠ ψ̄^c|G_{v₁} for v | l: β_vβ_v^c=q_v when χ_v²≠1, with p∤β_v−β_v^c; when χ_v²=1 use the additional exclusion p∤q_v−1. The full decomposition group is required; the inertia characters may agree.
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.split` (characterisation): Every place of F above l and above p splits in L; L is totally imaginary and not contained in F(ζ_p).
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.prime_ne_l` (projection): The chosen auxiliary prime p is different from the original residual prime l.
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.conj_conj` (relation): Conjugating the auxiliary character twice gives the original character; the involution is the nontrivial element of Gal(L/F).
- `TauCeti.PotentialModularity.TaylorAuxiliaryData.det_ind_apply` (simp): For g∈G_F, det(Ind ψ(g))=ε_p(g); this is a pointwise evaluation of the determinant identity.

**Unit tests.**

- `taylorAux_N0_l5` (computation): For l = 5 and k = 𝔽_5: ζ has order 4 and N₀ = ℚ(ζ₄, √−19); 5 does not divide 1 − 4·5 = −19, so 5 is unramified in N₀.
- `taylorAux_det_needed` (computation): Without det ρ̄ = ε (for instance det ρ̄ = εω²) no alternating isomorphism a_λ of V_λ with its Cartier dual exists: the Taylor 2006 correction. In the reduced prototype, an AuxiliaryData object together with det(A.induced)≠ε leads to contradiction; existence of the alternating group-scheme pairing still requires H6.
- `taylorAux_alpha_norm` (computation): For α_w of algebraic norm p, the determinant of diag(α_w,α_w^c) is p. This tests the algebraic norm only: at w | p it is not the p-adic cyclotomic value on a Frobenius lift.
- `taylorAux_not_in_cyclotomic` (computation): L ⊄ F(ζ_p) is part of the data; a quadratic subfield of F(ζ_p) is not allowed.
- `taylorAux_local_decomposition` (characterisation): The auxiliary object has a full local decomposition-group element on which ψ̄ and ψ̄^c differ; distinction need not hold on inertia.
- `taylorAux_beta_norm` (computation): For l=5, f_v=1 and a satisfying a²−a+5=0, with a^c=1−a, the norm aa^c is 5 and differs from every auxiliary prime p≠5. This rejects E9’s printed p norm.

**Acceptance.**

- For F = ℚ, l = 5 and an explicit ρ̄ with k = 𝔽_5, list admissible p and compute β_5 and N_0 = ℚ(ζ_4, √(-19))
- Check the algebraic norm α_wα_w^c=p independently of the p-adic cyclotomic character. At w | p, ε_p is ramified and its value on a Frobenius lift is a p-adic unit, so it cannot be identified with p. Choose the conjugate of α′_w that is a unit at ℘₀ when specifying an unramified O′×-valued character.

**Used by.**

- `HilbertModularVarietiesAndShimuraCurves:H6`: β_v, χ̃_v and the splitting v = v₁v₁^c in L give the local M-HBAV above l.
- `HilbertModularVarietiesAndShimuraCurves:H6`: α_w and the splitting w = w₁w₁^c give the local M-HBAV above p.
- [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e): V_λ and V_℘ are the group schemes of ρ̄ and Ind ψ̄, with alternating pairings because det ρ̄ = ε and det Ind ψ = ε_p.
- [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar): ψ̄|_{G_{w₁}} ≠ ψ̄^c|_{G_{w₁}} makes (Ind ψ̄)|_{G_E} absolutely irreducible.

**Depends on.** this roadmap: [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions), [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorAuxiliary`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), section 1, standing hypotheses, printed p. 6 (page image): “is a continuous representation such that ρ̄ has insoluble image” — The insoluble-image hypothesis of the section (ρ̄ lost in the text layer); the local shape at l is read on the page image.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), Corrections to [Tay4], first bullet, p. 776 (page image): “(Without this change the choice of aλ at the top of page 136 becomes impossible.)” — Correction replacing det ρ̄(c) = -1 by det ρ̄ = ε, with its reason.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), choice of p, printed p. 7 (page image): “p splits completely in the Hilbert class” — One of the four conditions defining the auxiliary prime p.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), choice of L, psi, N, M, printed p. 9 (page image): “not contained in F adjoin a primitive” — The first condition on the CM extension L/F.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), choice of N, printed p. 9: “primes above l split in N/N_0” — Conditions on the CM field N whose maximal totally real subfield is M.

<a id="n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e"></a>
### Applying Moret–Bailly to the supplied twisted Hilbert moduli scheme

`R23.2/local-points-at-l-p-infinity-and-the-point-over-E` · application · part R23.1

For Taylor’s auxiliary data, take the chosen smooth quasi-projective geometrically irreducible component X/F and compatible torsion/polarisation data supplied by H6. Choose at l, the auxiliary prime p and the real places the nonempty open subsets exported by H6 (at ordinary places use the tube of the specified integral reduction). Apply Moret–Bailly to obtain a finite totally real Galois E/F, split at the places where the opens are F_v-valued, and disjoint from a prescribed avoidance extension. The universal H6 object at the point gives an M-HBAV A/E with A[λ] identified with the original residual module and A[℘] with the auxiliary induced module. Constructing X, its pairings, components, real points and finite local points is exclusively H6’s responsibility.

**Hypotheses and conventions.**

- H6 must export local opens for the actual simultaneous twist and the chosen component, including the dyadic real-point alternatives of KW II §6; untwisted nonemptiness does not suffice.
- The determinant compatibility uses Taylor 2006’s correction det(ρ̄)=ε.
- Only places with F_v-valued opens are required to split. If local points require an unramified extension, use S2; if they require ramification, use S3.

**Proof outline.**

1. Choose the auxiliary prime/modules and pass the determinant/pairing compatibility to H6. Read H6’s output on the specified twist and component.
2. Choose the prescribed nonempty local opens, and use R23.1’s three-condition theorem with real places in S1.
3. Evaluate H6’s universal family at the resulting point; normal closure is allowed because local opens are Galois invariant.

**Acceptance.**

- Check the local-point claim at an infinite place x: the Gal(C/R)-module V_λ ⊗ R is (1) ⊕ (-1) because det ρ̄(c) = -1 and l is odd, and matches A[λ](C) for the corrected real A
- Confirm that splitting completely at infinity forces E totally real

**Depends on.** this roadmap: [`R23.2/taylor-auxiliary-data-p-L-psi-N-M`](#n-r23-2-taylor-auxiliary-data-p-l-psi-n-m), [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions); other roadmaps' layers: `HilbertModularVarietiesAndShimuraCurves:H6`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorAuxiliary`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), printed p. 13 (page image): “It follows from lemmas 1.2, 1.3 and 1.4 that for any place x of F above l, p” — Local nonemptiness of X at l, p and infinity.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), printed p. 13: “are equivalent.) Applying a theorem of Moret-Bailly [M]” — The Moret-Bailly application producing E and A.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), printed p. 13: “every place above l and p split completely and a M-HBAV (A, i, j)/E such that” — Output of the application.

<a id="n-r23-2-restriction-of-scalars-moduli-application"></a>
### The restricted auxiliary moduli application

`R23.2/restriction-of-scalars-moduli-application` · application · part R23.1

For finite totally real F1/F take Snowden’s supplied smooth geometrically connected auxiliary scheme X/F1 from H6. Res_{F1/F}X is smooth geometrically connected; at F_v its points are the product of X(F1_w), w|v. Apply Moret–Bailly over F to these product opens, with avoidance field enlarged by F1, obtaining F′/F Galois totally real and disjoint from F1Favoid, and an auxiliary H6 object over F1F′. Geometric connectedness, representability and the local torsion/polarisation objects are supplied, not reproved here.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Import Weil restriction and its product description from A6.
2. Use H6’s totally real local objects to specify product opens; choose the finite soluble preliminary extension as in Snowden Proposition 8.2.2 when needed.
3. Apply the split local theorem over F and evaluate the universal H6 family over F1F′.

**Acceptance.**

- For F1=F recover the original H6 application; for degree two verify the two geometric factors and the local product over both places.

**Depends on.** this roadmap: [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions); other roadmaps' nodes: `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; other roadmaps' layers: `HilbertModularVarietiesAndShimuraCurves:H6`, `AbelianSchemesAndArithmeticModuli:A6`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bcgp-published](#src-bcgp-published), Proof of Proposition 9.1.11, p. 458: “restriction of scalars” — The restricted auxiliary moduli application

<a id="layer-r23-3"></a>
## R23.3 — Potential residual modularity

*Coverage in the R23.1 part: planned. 14 nodes, 6 planets.*

The export of this layer is a *modular witness* for a residual representation over a controlled totally real field: a cuspidal automorphic representation whose residual Galois representation is ρ̄ restricted to that field. It is obtained by modularity lifting applied to the auxiliary abelian variety of R23.2, never to a lift of ρ̄ itself, and no node here uses a characteristic-zero lift from R24.

- **Taylor 2002.** The λ-adic Tate module of A is ordinary at unramified places above l (Lemma 1.5, with the inverse character of source issue E4 of the R23.1 part). Since (Ind ψ̄)|G_E is modular and absolutely irreducible, A is semistable and its ℘-adic Tate module ordinary above p, the nearly ordinary lifting theorem of Skinner and Wiles (OrdinaryAutomorphicFormsAndModularityLifting R21.5) makes T_℘A modular, hence T_λA, hence ρ̄|G_E. This gives Theorem 1.6 and Corollary 1.7. The residually dihedral nearly ordinary case meets the exception recorded as OrdinaryAutomorphicFormsAndModularityLifting/E11, and Taylor 2002's Lemma 1.3 and Corollary 1.7 have no printed proofs; both are gaps.
- **Taylor 2006.** Proposition 4.1 and Corollary 4.6 give potential modularity with l split completely when ρ̄|G_l is irreducible. The weight is then moved through definite quaternionic forms of even-degree fields (Lemma 1.3, using Jacquet–Langlands from R17.3 and the Galois representations of R19.2), their Fontaine–Laffaille shape at split places above l (Lemma 1.4 and Corollary 1.5, with torsion Fontaine–Laffaille theory requested from PadicHodgeTheory R06.4), the reduction from level U₀(𝔫, l) with a character to weight i + 2 (Lemma 5.1 and Corollary 5.2, with the exponent corrected as E10 of the R23.1 part), the shift by l + 1 (Lemma 5.3) and the level and weight steps of Lemmas 5.4–5.6, to Theorem 5.7: potential modularity in Serre's weight, unramified everywhere.
- **Khare–Wintenberger.** KW II Theorem 6.1 (i)–(ii) combines these routes: for ρ̄ of S-type with the stated image and weight hypotheses there is a totally real Galois F of even degree, unramified at p and split above p when ρ̄|D_p is irreducible, preserving the image of ρ̄ and its irreducibility over F(μ_p), over which ρ̄ is modular in weight k(ρ̄) and in weight 2 with conductor dividing v above p. Part (iii) is R23.5. KW Annals Theorem 2.1 is the odd-characteristic precursor, with ordinary π_v and k(ρ̄) ≠ p. The solvable-image branch uses Langlands–Tunnell (R17.5) and the Serre-weight results of SerreWeightAndLevelOptimisation R20.3; the case p = 3 with ρ̄|D_p irreducible uses Khare's Lemma 2.2, requested from HilbertModularVarietiesAndShimuraCurves R18.3.
- **General totally real forms.** Snowden's theorem for any continuous odd ρ̄ over a totally real field, with a definite type function at p and stable avoidance; and the controlled form of Boxer–Calegari–Gee–Pilloni, Proposition 9.1.11, which produces a q-ordinary weight-zero cuspidal representation over F1F′ with residual representation r. Snowden's hypotheses (A1), (A2) concern the auxiliary representation and his given-lift and descent theorems, not the residual representation of the theorem. His odd auxiliary lifting input is requested from GL2ModularityLifting R22.5.

The six planets are Taylor's theorem, the two Taylor 2006 theorems, KW II Theorem 6.1, and the Snowden and Boxer–Calegari–Gee–Pilloni forms.

**Still open in this layer.**

- Khare's Lemma 2.2 (p = 3) and Conrad–Diamond–Taylor Lemmas 3.1.1 and 4.2.4 (used by Taylor 2006 §5) are unread
- KW II Theorem 8.2 and the Gross/Coleman-Voloch weight results are imported into Theorem 6.1
- Taylor's use of Skinner–Wiles 2001 falls in the case of OrdinaryAutomorphicFormsAndModularityLifting/E11
- Taylor 2002 Lemma 1.3 and Corollary 1.7 have no printed proofs
- Skinner–Wiles, Base change and a problem of Serre (Duke 2001), used by Taylor 2006 Corollary 5.5, remains an unread supplier input
- Snowden auxiliary and residual soluble descent inputs
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.
- Odd auxiliary modularity lifting with Snowden type data
- Torsion Fontaine–Laffaille and full Hilbert crystallinity input

<a id="n-r23-3-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l"></a>
### Taylor Lemma 1.5: the λ-adic Tate module of the auxiliary abelian variety is ordinary at unramified places above l

`R23.3/taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l` · lemma · part R23.1

Let v be an unramified place of F above l and x a place of E above v. Suppose χ_v^2|I_v = ε^n|I_v for some integer n with 0 ≤ n < l - 1, and suppose that n ≠ 1 if ρ̄|G_v is semisimple. Then G_x acts on T_λ A ⊗ ℚ_l by a representation of the form (ε (χ'_v)^{-1}, *; 0, χ'_v) with χ'_v a tamely ramified lift of χ_v.

**Hypotheses and conventions.**

- A/E is the M-HBAV produced by the Moret-Bailly application, with A[λ] ≅ ρ̄|G_E and A[℘] ≅ Ind ψ̄|G_E
- v unramified over ℚ_l; 0 ≤ n < l - 1; n ≠ 1 when ρ̄|G_v is semisimple (inequalities read on the page image of printed p. 14)
- imports: Edixhoven, The weight in Serre's conjectures, section 5 (action of inertia on the Lie algebra of a finite flat group scheme); Conrad-Diamond-Taylor, JAMS 12 (1999), appendix B
- the proof ends 'Hence χ₁|_{I_x} = ω'; with χ₁|_{I_x} ∼ ε^{−n} and ψ₁|_{I_x} = ω^{−n}, an action by ω^{−1} on a subquotient of A[℘] forces n = 1 and χ₁|_{I_x} = ω^{−1}, the case the hypothesis n ≠ 1 excludes (source issue PotentialModularityAndCompatibleSystems/E4)

**Proof outline.**

1. Replace A by A ⊗_{O_M} O_N and twist so that G_x acts on A[λ] as (ε χ_1, *; 0, χ_2) with χ_2 unramified and χ_1|I_x ~ ε^{-n}, and on A[℘] as ψ_1 ⊕ ψ_2 with ψ_2 unramified and ψ_1|I_x = ω^{-n}; it suffices to show T_λ A ⊗ ℚ_l ~ (ε χ'_1, *; 0, χ'_2) with χ'_2 an unramified lift of χ_2.
2. From the action on T_℘ A, either A has multiplicative reduction over E_x (then χ_1 is unramified and the result is clear) or good reduction over E_x(ζ_l).
3. In the good reduction case, over W(k(x)^ac)[ζ_l] the only simple subquotients of the finite flat group scheme A[λ] are Z/lZ and μ_l, and there are no nontrivial extensions of Z/lZ by Z/lZ nor of μ_l by μ_l; with the connected-étale sequence and dim Lie(A[λ] × 𝔽_l^ac) = [O_N/λ : 𝔽_l] this gives 0 → μ_l^[O_N/λ:𝔽_l] → A[λ] → (Z/lZ)^[O_N/λ:𝔽_l] → 0, so A has ordinary reduction; done if ρ̄|G_v is not semisimple.
4. If ρ̄|G_v is semisimple, I_x acts on Lie(A[λ] × 𝔽_l^ac) by ε^{-n} or ε^{-1} according as A[λ]^0 ~ ε χ_1 or χ_2 (Edixhoven section 5); if by ε^{-1}, it would act by ω^{-1} on a subquotient of A[℘] (CDT appendix B), forcing χ_1|I_x = ω^{-1}, hence n = 1, excluded when A[λ] is semisimple (n ≠ 1).

**Acceptance.**

- Check the boundary n = l - 2 and the excluded case n = 1 with ρ̄|G_v semisimple on an explicit example
- Confirm that the conclusion gives the 'Moreover' clause of Theorem 1.6 after base change to the fields where the ramified twist is removed

**Depends on.** this roadmap: [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Lemma 1.5 and proof, printed pp. 14-15 (page images): “we see that either A has multiplicative reduction over” — The reduction-type dichotomy at the start of the proof.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), proof of Lemma 1.5, printed p. 14: “no non-trivial extensions of” — The extension-group input giving the connected-étale filtration of A[λ].
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), proof of Lemma 1.5, printed p. 15: “(see appendix B of [CDT])” — Import of CDT appendix B in the semisimple case.

<a id="n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar"></a>
### Modularity of the auxiliary abelian variety via its ℘-adic Tate module, and transfer to ρ̄|G_E

`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar` · theorem · part R23.1

For the M-HBAV A/E of the Moret-Bailly application: (a) (Ind_{G_L}^{G_F} ψ̄)|G_E is absolutely irreducible, since for every place x of E above p the restrictions of ψ̄ to the two places of LE above x are different; (b) A has semistable reduction at every prime x of E above p, because A[λ] is unramified at x and ker(GL_2(O_{M,λ}) → GL_2(O_M/λ)) has no nontrivial element of finite order; (c) T_℘ A is ordinary at every x above p, because A is semistable at x, E_x ≅ ℚ_p and the I_x-coinvariants of A[℘] are nontrivial; (d) since (Ind ψ)|G_E is modular, Theorem 5.1 of Skinner-Wiles [SW3] (nearly ordinary deformations of irreducible residual representations) shows that T_℘ A is modular, hence T_λ A is modular; consequently ρ̄|G_E ≅ A[λ] is the reduction of a modular λ-adic representation.

**Hypotheses and conventions.**

- E/F totally real with all places above l and p split completely (so E_x ≅ F_w ≅ ℚ_p for x | p when F_w = ℚ_p; the source writes E_x ≅ ℚ_p)
- modularity of (Ind_{G_L}^{G_F} ψ)|G_E is used without argument: it comes from automorphic induction of the algebraic Hecke character of LE attached to ψ restricted to G_{LE} (not written in the source)
- 'T_℘ A modular implies T_λ A modular' uses that the λ-adic and ℘-adic Tate modules of A come from the same automorphic representation (compatible system of A); not spelled out in the source
- [SW3] = Skinner–Wiles, Nearly ordinary deformations of irreducible residual representations (Ann. Fac. Sci. Toulouse 10 (2001)); its Theorem 5.1 is OrdinaryAutomorphicFormsAndModularityLifting R21.5/nearly-ordinary-irreducible-lifting, which excludes the case needed here
- the residual representation (Ind_{G_L}^{G_F} ψ̄)|_{G_E} is induced from the CM field LE, in which every place above p splits: the case of source issue OrdinaryAutomorphicFormsAndModularityLifting/E11, where the printed proof of Skinner–Wiles 2001 has a gap (a gap here too)

**Proof outline.**

1. (a)-(c) are the three 'note that' remarks after the Moret-Bailly application (printed p. 13).
2. (d) is the sentence before Theorem 1.6 (printed p. 15): apply SW3 Theorem 5.1 to T_℘ A with residual representation (Ind ψ̄)|G_E, which is absolutely irreducible by (a), modular, and with T_℘ A ordinary at p by (c).
3. The automorphic representation π of GL_2(A_E) attached to T_℘ A has ρ_{π,λ'} ~ T_λ A ⊗ ℚ_l for a place λ' of its coefficient field above l, whose reduction is ρ̄|G_E.

**Acceptance.**

- Check that (Ind ψ̄)|G_E remains absolutely irreducible over E(ζ_p) or record which form of residual irreducibility SW3 Theorem 5.1 needs
- Check the semistability argument (b) against Grothendieck's criterion: unipotent inertia after the level-λ torsion is unramified and the congruence kernel is torsion-free
- Before relying on [SW3] here, settle OrdinaryAutomorphicFormsAndModularityLifting/E11 or replace [SW3] by a lifting theorem that assumes residual irreducibility over E(ζ_p) (Taylor chose L ⊄ F(ζ_p)); not checked

**Depends on.** this roadmap: [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e), [`R23.2/taylor-auxiliary-data-p-L-psi-N-M`](#n-r23-2-taylor-auxiliary-data-p-l-psi-n-m); other roadmaps' nodes: `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`; other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), remarks after the Moret-Bailly application, printed p. 13: “is absolutely irreducible, because for any place x of E above p the restriction of” — Absolute irreducibility of the ℘-torsion over E.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), same paragraph, printed p. 13: “Also note that A has semi-stable reduction at any prime x of E above p, because” — Semistability above p.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), same paragraph, printed p. 13: “is ordinary at any prime x of E above p, because A is semistable at x” — Ordinarity of T_℘ A above p.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), paragraph before Theorem 1.6, printed p. 15: “we may apply theorem 5.1 of [SW3] to deduce that” — Skinner-Wiles modularity lifting applied to T_℘ A.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), same sentence, printed p. 15: “to deduce that T A is modular” — Transfer from T_℘ A to T_λ A (the Greek λ is lost in the text layer; read on page image).

<a id="n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l"></a>
### Taylor Theorem 1.6 (with the 2006 corrected proof) and Corollary 1.7: potential modularity of residual representations

`R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l` · theorem · planet “Taylor's potential modularity theorem” · part R23.1

(Theorem 1.6) Let l be an odd prime, k/𝔽_l finite, F totally real and ρ̄: G_F → GL_2(k) continuous irreducible with ρ̄|G_v ~ (ε χ_v^{-1}, *; 0, χ_v) for every v | l and det ρ̄(c) = -1 for every complex conjugation c. Then there are a finite Galois totally real extension E/F in which every prime of F above l splits completely, a regular algebraic cuspidal automorphic representation π of GL_2(A_E) and a place λ' of its field of coefficients above l with ρ̄_{π,λ'} ~ ρ̄|G_E. Moreover E, π, λ' may be chosen so that for every unramified prime x of E above l with χ_x^2|I_x = ε^n|I_x and ρ̄(I_x) not consisting of scalar matrices, ρ_{π,λ'}|G_x ~ (ε (χ'_x)^{-1}, *; 0, χ'_x) with χ'_x a tamely ramified lift of χ_x. (Corollary 1.7) Without the local hypothesis at l: if ρ̄ is continuous irreducible and odd, there are a finite Galois totally real E/F in which every prime of F above l is unramified with inertial degree at most 2, π and λ' with ρ̄_{π,λ'} ~ ρ̄|G_E, with a corresponding ordinarity refinement at the set T of unramified v | l where ρ̄(I_v) is not scalar and ρ̄|G_v is reducible of the displayed shape.

**Hypotheses and conventions.**

- Theorem 1.6: l odd; ρ̄ irreducible; locally reducible of the displayed shape at all v | l; totally odd
- Corollary 1.7 is stated in the preprint with no proof (gap)
- the 'Moreover' clause uses Lemma 1.5, whose hypothesis 0 ≤ n < l - 1 is not repeated in the printed statement of Theorem 1.6 (read on page image p. 15)

**Proof outline.**

1. Soluble image: 'follows from known cases of the strong Artin conjecture' (Tunnell, with Rogawski-Tunnell for using congruences to make π regular); not further detailed.
2. Insoluble image and det ρ̄ = ε (the case actually treated in section 1 after the Taylor 2006 correction): auxiliary data, moduli space X, local points, Moret-Bailly point A/E, and modularity of T_λ A (previous nodes); Lemma 1.5 gives the local shape.
3. General determinant (Taylor 2006, p. 777): choose a totally real quadratic F'/F in which all primes above l split, a finite k'/k and ξ: G_{F'} → (k')^× with det ρ̄|G_{F'} = ε ξ^2 (possible since the obstruction to square roots of a character lies in the 2-part of the Brauer group); run the construction for ρ̄' = ρ̄ ⊗ ξ^{-1} over F' to get E'/F' and A'; let E be the normal closure of E'/F, so l and p split completely in E/F; take A = A' ×_{E'} E and argue as before.
4. Theorem 1.6 is then the conclusion over the Galois E; twisting back by ξ is implicit.

**Acceptance.**

- Check that a Galois closure of an extension in which all places above l and p split completely still has that property, which is what makes E Galois
- Test the twist step: for ρ̄ with det ρ̄ = ε ω^2 over F = ℚ, exhibit ξ over a real quadratic F' split at l

**Depends on.** this roadmap: [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l`](#n-r23-3-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Theorem 1.6, printed p. 15 (page image): “totally real extension E/F in which every prime of F above l splits completely, a regular algebraic cuspidal automorphic representation” — Conclusion of Theorem 1.6.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Theorem 1.6, 'Moreover' clause, printed p. 15: “may be chosen so that the following holds” — The local refinement at unramified places above l.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), paragraph before Theorem 1.6, printed p. 15: “has soluble image follows from known cases of the strong Artin conjecture” — The soluble case is referred to Tunnell and Rogawski-Tunnell.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), Corrections to [Tay4], last bullet, p. 777 (page image): “theorem 1.6 requires some further proof. The following will suffice:” — The corrected proof via a quadratic twist and normal closure.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), same bullet, p. 777: “Let E be the normal closure of E′/F. Then l and p split completely in E/F.” — How E is made Galois while keeping the splitting.
- [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur), Corollary 1.7, printed p. 16 (page image): “degree at most 2, a regular algebraic cuspidal automorphic representation” — Statement of Corollary 1.7; no proof follows in the preprint.

<a id="n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l"></a>
### Taylor 2006 Proposition 4.1 and Corollary 4.6: potential modularity with l split completely when ρ̄|G_l is irreducible

`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l` · theorem · planet “Potential modularity with l split (Taylor 2006)” · part R23.1

(Proposition 4.1) Let l > 2 and ρ̄: G_Q → GL_2(𝔽̄_l) continuous odd with ρ̄|I_l ~ ω_2^{k-1} ⊕ ω_2^{l(k-1)} for some 2 ≤ k ≤ l. Then there are a Galois totally real field F of even degree in which l splits completely, a regular algebraic cuspidal π of GL_2(A_F) and λ: M_π → ℚ̄_l with ρ̄|G_F ~ ρ̄_{π,λ}, π_∞ of weight 2, and for each x | l, WD_λ(π_x) tamely ramified with WD_λ(π_x)|I_x = ω_2^{k-(l+1)} ⊕ ω_2^{lk-(l+1)}. (Corollary 4.6) One may moreover make the central character of π^{∞,l} unramified (Langlands base change). Theorem 5.7 is R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one.

**Hypotheses and conventions.**

- Proposition 4.1: l > 2, 2 ≤ k ≤ l, niveau-2 irreducible restriction to G_l
- the proof of Proposition 4.1 imports Skinner-Wiles [SW2] Theorem 5.1 (or [SW1] + Theorem 3.3 + descent) and the theory of complex multiplication
- Proposition 4.1 applies [SW2] Theorem 5.1 (Skinner–Wiles 2001) to T_{℘₁}B, whose residual representation Ind_{G_{FM}}^{G_F}(χ_{℘₁} mod ℘₁) is induced from the CM field FM with p₁ split (p₁ splits in the Hilbert class field of M): again the case of OrdinaryAutomorphicFormsAndModularityLifting/E11; Taylor gives an alternative, 'the main theorem of [SW1], theorem 3.3 of this paper and a standard descent argument', where [SW1] is Skinner–Wiles, Base change and a problem of Serre (Duke 2001) and Theorem 3.3 is his crystalline R = T theorem for residual representations irreducible over F(√((−1)^{(l−1)/2}l))

**Proof outline.**

1. Proposition 4.1: auxiliary choices (M imaginary quadratic with l inert, p_1, p_2, E, χ of Lemma 4.3), moduli space X and its twists X_ρ, X_Dih; Lemmas 4.4-4.5 and Moret-Bailly give F Galois totally real of even degree split at l, p_1, p_2 and B/F with B[λ] realising ρ̄ and B[℘_i] realising Ind_{G_M}^{G_Q}(χ_{℘_i} mod ℘_i).
2. T_λ B is unramified above p_1 (inertia has both l-power and p_2-power order), so B is semistable above p_1; T_℘1 B is ordinary above p_1; inertia above l acts on T_℘1 B by ω̃_2^{k-(l+1)} ⊕ ω̃_2^{lk-(l+1)}; since Ind (χ_{℘_1}) is modular, [SW2] Theorem 5.1 gives π of weight 2 with ρ_{π,℘_1} ~ T_℘1 B, hence ρ_{π,λ} ~ T_λ B.
3. Corollary 4.6 by Langlands base change.

**Acceptance.**

- Confirm that 'l splits completely in F' is what KW II need to take F split above p when ρ̄|D_p is irreducible

**Depends on.** other roadmaps' nodes: `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting`; other roadmaps' layers: `HilbertModularVarietiesAndShimuraCurves:H6`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), Proposition 4.1 and following remark, pp. 755-756: “We remark that the key improvement of this over results in [Tay4] is the condition that l split completely in F.” — The improvement over Taylor 2002 used by KW II when ρ̄|D_p is irreducible.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), end of proof of Proposition 4.1, pp. 762-763: “of [SW2] tells us that there is a algebraic, cuspidal automorphic representation” — Skinner-Wiles lifting applied to T_℘1 B.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), Corollary 4.6, p. 763: “Using Langlands base change [Langl] we immediately obtain the following corollary.” — Corollary 4.6 via base change.

<a id="n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations"></a>
### Taylor 2006 Lemma 1.3: definite quaternionic forms, cuspidal representations and their Galois representations

`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations` · theorem · part R23.1

Let F be totally real of even degree, D the quaternion algebra over F ramified exactly at the infinite places, (k⃗, w⃗) a weight with k_σ ≥ 2 and w = k_σ − 1 + 2w_σ independent of σ, and ψ : 𝔸_F^×/F^× → (ℚ̄_l)^× continuous with ψ(a) = (Na)^{1−w} on an open subgroup of 𝔽_l^×. (Lemma 1.3.) (1) S_{(k⃗,w⃗),ℚ̄_l,ψ}(U_l) is a semisimple admissible representation of GL₂(𝔸_F^{∞,l}) with U^l-invariants S_{(k⃗,w⃗),ℚ̄_l,ψ}(U_l × U^l); (2) after ⊗_{ℚ̄_l,i} ℂ its quotient by the 'triv' subspace (functions factoring through the reduced norm, nonzero only in parallel weight 2) is ⊕_π π^{∞,l} ⊗ π_l^{U_l} over regular algebraic cuspidal π of GL₂(𝔸_F) of weight (k⃗, w⃗) and central character ψ_i; (3)–(4) the same at weight 2 over all U, with the one-dimensional characters χ, χ² = ψ, added. Consequently (p. 742) the Hecke algebra h_{(k⃗,w⃗),ψ}(U_H(𝔫)) carries a continuous ρ : G_F → GL₂(h ⊗ ℚ̄_l) unramified at x ∤ 𝔫l with tr ρ(Frob_x) = T_x and det ρ = ε(ψ ∘ Art^{−1}); for a non-Eisenstein maximal ideal 𝔪 it descends to ρ_𝔪 : G_F → GL₂(h_𝔪) (pseudo-representations, or Carayol), and h_𝔪 is generated by the 𝐔_{ϖ_x} for x | 𝔫, x ∤ l, and the T_x for almost all x ∤ 𝔫l.

**Hypotheses and conventions.**

- the proof is 'everything now follows from the Jacquet–Langlands theorem' (requested from GL2AutomorphicRepresentationsAndTransfer R17.3); the Galois representations are Taylor's [Tay1] (Invent. Math. 98, 1989), requested from AutomorphicGaloisRepresentations R19.2
- used in Theorem 5.7 to pass from π to a mod-l Hecke eigensystem φ with non-Eisenstein kernel

**Proof outline.**

1. Write S_{(k⃗,w⃗)}(U_l) ≅ Hom_{D_∞^×}(W_{τ_∞}^∨, C^∞(D^×\(D ⊗ 𝔸)^×/U_l, ψ_∞)) (p. 741) and apply Jacquet–Langlands.
2. Galois representation: Lemma 1.3 and [Tay1] give ρ with the stated traces and determinant; ρ_𝔪 by pseudo-representations or Carayol (GlobalGaloisDeformations R04.2/carayol-trace-theorem) for non-Eisenstein 𝔪; generation by Chebotarev.

**Acceptance.**

- Check that the 'triv' part is exactly the one-dimensional representations, present only in parallel weight 2.

**Depends on.** other roadmaps' nodes: `GlobalGaloisDeformations:R04.2/carayol-trace-theorem`; other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `AutomorphicGaloisRepresentations:R19.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §1, Lemma 1.3, p. 740 (PDF page 12): “Then we have the following assertions.” — Lemma 1.3 (1)–(2); (3)–(4) on p. 741.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §1, proof of Lemma 1.3, p. 741 (PDF page 13): “Everything now follows from the Jacquet-Langlands theorem.” — The proof.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §1, the representations ρ and ρ_𝔪, p. 742 (PDF page 14): “From the theory of pseudo-representations (or otherwise, see [Ca2]) we deduce” — ρ_𝔪 over the non-Eisenstein localisation.

<a id="n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l"></a>
### Taylor 2006 Lemma 1.4 and Corollary 1.5: Fontaine–Laffaille shape at split places above l

`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l` · theorem · part R23.1

(Lemma 1.4.) Let x ∤ 𝔫 be a split place of F above l with 2 ≤ k_x ≤ l − 1, 𝔪 a non-Eisenstein maximal ideal of h_{(k⃗,w⃗),ψ}(U_H(𝔫)) and I an open ideal of h_𝔪. Then ((ρ_𝔪 ⊗ ε^{−w_x}) mod I)|_{G_x} is 𝕄(D) for an object D of 𝓜𝓕_{F_x,𝒪,k_x} with D ≠ D⁰ ≠ (0). (Corollary 1.5.) Hence ρ̄_𝔪|_{I_x} ∼ ω₂^{k_x−1+(l+1)w_x} ⊕ ω₂^{l(k_x−1)+(l+1)w_x} or ρ̄_𝔪|_{G_x} ∼ (ω^{k_x+w_x−1} *; 0 ω^{w_x}) on inertia.

**Hypotheses and conventions.**

- 2 ≤ k_x ≤ l − 1 and x split: the Fontaine–Laffaille range
- for π discrete series at some finite place the crystallinity is attributed to Carayol's construction and Faltings, 'presumably', with Harris–Taylor Theorem VII.1.9 as a definite reference

**Proof outline.**

1. Reduce to a cuspidal π with π_x unramified: ρ_{π,λ} is crystalline at x with Hodge–Tate numbers −w_τ, 1 − k_τ − w_τ (AutomorphicGaloisRepresentations R19.5), so Fontaine–Laffaille gives 𝕄(D).
2. Corollary 1.5 from Fontaine–Laffaille Theorem 5.3, Proposition 7.8 and Theorem 8.4 (PadicHodgeTheory R06.4).

**Acceptance.**

- Check the two shapes at k_x = 2, w_x = 0: ω₂ ⊕ ω₂^l, or (ω *; 0 1).

**Depends on.** this roadmap: [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); other roadmaps' nodes: `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; other roadmaps' layers: `PadicHodgeTheory:R06.4`, `AutomorphicGaloisRepresentations:R19.5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §1, proof of Corollary 1.5, p. 743 (PDF page 15): “This follows easilly from the above lemma together with theorem 5.3, proposition 7.8 and theorem 8.4 of [FL].” — Corollary 1.5 from Fontaine–Laffaille (the source prints "easilly").

<a id="n-r23-3-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction"></a>
### Taylor 2006 Lemma 5.1 and Corollary 5.2: from level U₀(𝔫, l) with character η̄^i to weight i + 2

`R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction` · theorem · part R23.1

Let l > 3 split completely in F (even degree), 0 ≤ i ≤ l − 2, η̄^i the character of U₀(𝔫, l)/U₁(𝔫, l) sending u to (Nd mod l)^i, and S_{η̄^i,ψ}(U₀(𝔫, l)) the definite quaternionic forms with that character. Filtering the induced representation I^i = ⊗_{x|l} I^i_x by 0 → Symm^i → I^i_x → Symm^{l−1−i} ⊗ det^i → 0 gives subspaces S_{η̄^i,ψ,T} for sets T of places above l, with S_{η̄^i,ψ,∅} ≅ S_{i+2,F̄_l,ψ}(U_H(𝔫)). (Lemma 5.1, a variant of an unpublished result of Buzzard.) For x ∉ T there is an injection κ_x : S_{T∪{x}}/S_T ↪ S_{T∪{x}}, equivariant for T_y, S_y (y ∤ l𝔫) and 𝐔_{ϖ_x} (x | 𝔫), whose composite with the projection is 𝐕_{ϖ_x}. (Corollary 5.2.) There is a natural surjection h_{η̄^i,F̄_l,ψ}(U₀(𝔫, l)) ↠ h_{i+2,F̄_l,ψ}(U_H(𝔫)) on the T_y, S_y and 𝐔_{ϖ_x}; if 𝔪 is a maximal ideal such that for every x | l, 𝐕_{ϖ_x} lies in every maximal ideal of h″ above 𝔪, then h_{i+2,F̄_l,ψ}(U_H(𝔫))_𝔪 ≠ 0. This holds when 𝔪 is non-Eisenstein and ρ̄_φ|_{G_x} ≁ (εχ₁ *; 0 ω^iχ₂) with χ₁, χ₂ unramified, for all x | l.

**Hypotheses and conventions.**

- if φ(𝐔_{ϖ_x}) ≠ 0 then ρ̄_φ|_{G_x} ∼ (χ₁ *; 0 χ₂) with χ₂ unramified and χ₂(Frob_x) = φ(𝐔_{ϖ_x}) (Wiles 1988, cited as [W1]; AutomorphicGaloisRepresentations R19.2); by the perfect pairing and adjoints, φ(𝐕_{ϖ_x}) ≠ 0 gives the dual shape (εχ₁ *; 0 ω^iχ₂)
- Buzzard's thesis (The levels of modular representations, Cambridge 1995) is cited for the unpublished original; the variant is proved in full here
- Use Symm^i in the τ_T coefficient factors; the printed Symm^{i+2} on p. 766 is the source misprint E10.

**Proof outline.**

1. Identify the exact sequence 0 → S_T → S_{T∪{x}} → S_{T∪{x}}/S_T → 0 with 0 → S_{τ_T}(U₀(T)) → S_{τ_{T∪{x}}}(U₀(T ∪ {x})) → S_{τ_{T,x}}(U₀(T)) → 0 (maps α, β); define κ(f)(g) = f(gγ)(1, 0)_x with γ = diag(1, ϖ_x); it is well defined, injective and equivariant, and κ ∘ β = 𝐕_{ϖ_x} by the computation with u(s, 1).
2. Corollary 5.2: take T minimal with S_T(U₀(𝔫, l))_𝔪 ≠ 0; if T ≠ ∅, minimality makes 𝐕_{ϖ_x} an isomorphism on S_T,𝔪, contradicting 𝐕_{ϖ_x} ∈ every maximal ideal above 𝔪; so T = ∅ and S_{i+2}(U_H(𝔫))_𝔪 ≠ 0.

**Acceptance.**

- The source's condition is '𝐕_{ϖ_x} ∈ 𝔪″_x' for every 𝔪″_x above 𝔪 (so 𝐕_{ϖ_x} is not invertible); do not read it as ∉.

**Depends on.** this roadmap: [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, the pairing and the operators 𝐔, 𝐕, p. 764 (PDF page 36): “This is easily seen to be a perfect pairing.” — The duality used for 𝐕_{ϖ_x}.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, Lemma 5.1, p. 765 (PDF page 37): “The following lemma is a variant of an unpublished result of Buzzard (see [Bu]).” — Lemma 5.1.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, Corollary 5.2, p. 767 (PDF page 39): “There is a natural surjection” — Corollary 5.2.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, Corollary 5.2, p. 767 (PDF page 39): “This assumption will be veriﬁed if” — The sufficient condition (non-Eisenstein, not of the dual ordinary shape).

<a id="n-r23-3-taylor-2006-lemma-5-3-weight-shift"></a>
### Taylor 2006 Lemma 5.3: raising the weight by l + 1 with a cyclotomic twist

`R23.3/taylor-2006-lemma-5-3-weight-shift` · lemma · part R23.1

(Lemma 5.3.) Let l split completely in F. If k ≥ 2 and φ : h_{k,F̄_l,ψ}(U₀) → F̄_l is a homomorphism, there is Dφ : h_{k+l+1,F̄_l,ψ(ε∘Art^{−1})}(U₀) → F̄_l with (Dφ)(T_y) = φ(T_y)(Ny) and (Dφ)(S_y) = φ(S_y)(Ny)² for all y ∤ l.

**Hypotheses and conventions.**

- l splits completely in F, so each k(x) = 𝔽_l for x | l

**Proof outline.**

1. Twist by g ↦ ||N det g||(N det g_l)^{−1}: S_{k,ψ}(U₀) → S_{τ_k ⊗ (N det), ψ(ε∘Art^{−1})}(U₀), which multiplies T_y by Ny and S_y by (Ny)².
2. By Taylor's Lemma 1.1 it suffices to embed Symm^{k−2}(k(x)²) ⊗ det into Symm^{k+l−1}(k(x)²) GL₂(𝒪_{F,x})-equivariantly; multiplication by X^lY − XY^l does it, since (aX + cY)^l(bX + dY) − (aX + cY)(bX + dY)^l = (ad − bc)(X^lY − XY^l) over 𝔽_l.

**Acceptance.**

- Check the identity (aX + cY)^l(bX + dY) − (aX + cY)(bX + dY)^l = (ad − bc)(X^lY − XY^l) over 𝔽_l: it uses a^l = a for a ∈ 𝔽_l; the reduced suggested file does not contain this calculation.

**Depends on.** this roadmap: [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, proof of Lemma 5.3, p. 768 (PDF page 40): “Because l splits completely in F such an embedding simply results from multiplication by” — The embedding by X^lY − XY^l.

<a id="n-r23-3-taylor-2006-lemmas-5-4-5-6-weight-and-level"></a>
### Taylor 2006 Lemma 5.4, Corollary 5.5 and Lemma 5.6: potential modularity in weight k, unramified everywhere

`R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level` · theorem · part R23.1

Let l > 3 and ρ̄ : G_ℚ → GL₂(F̄_l) continuous and odd with ρ̄|_{I_l} ∼ ω₂^{k−1} ⊕ ω₂^{l(k−1)} for some 2 ≤ k ≤ l. (Lemma 5.4.) There are a Galois totally real F in which l splits completely, and a regular algebraic cuspidal π with ρ̄|_{G_F} ∼ ρ̄_{π,λ}, π_∞ of weight 2 and the conductor of π_x dividing x for x | l. (Corollary 5.5.) Moreover π_x can be taken unramified at every finite x ∤ l. (Lemma 5.6.) Then F (of even degree) and π can be chosen with π_∞ of weight k and π_x unramified at every finite place.

**Hypotheses and conventions.**

- Lemma 5.4 imports Conrad–Diamond–Taylor, JAMS 12 (1999), Lemmas 3.1.1 and 4.2.4 (the types Θ(χ_k) and their Jordan–Hölder factors), which were not read (a gap)
- Corollary 5.5 combines Lemma 5.4 with 'the main theorem of [SW1]', which in Taylor 2006 is Skinner–Wiles, Base change and a problem of Serre (Duke Math. J. 107 (2001)), not read (a gap)

**Proof outline.**

1. Lemma 5.4: from Corollary 4.6 (the existing node), Lemma 1.3 and Conrad–Diamond–Taylor 4.2.4 get φ₁ : h_{Θ_k,𝒪,ψ₀}(U_{H₀}(𝔫₀)) → F̄_l, non-Eisenstein, with ρ̄_{φ₁} ∼ ρ̄|_{G_F}; the Jordan–Hölder factors R_T of Θ_k (CDT 3.1.1) and Corollary 1.5 force T = ∅, so φ₁ factors through weight k; the first part of Corollary 5.2 gives φ₀ at level U_{H₀}(𝔫₀) with character η̄^{k−2}.
2. Corollary 5.5: the main theorem of [SW1] (Skinner–Wiles' base change) removes the ramification away from l.
3. Lemma 5.6: from Corollary 5.5, ψ₀ with ε(ψ₀ ∘ Art^{−1}) = det ρ_{π,λ}, a φ₀ : h_{η̄^{k−2},F̄_l,ψ₀}(U₀(𝒪_F, l)) → F̄_l non-Eisenstein with ρ̄_{φ₀} ∼ ρ̄|_{G_F}; Corollary 5.2 factors it through h_{k,F̄_l,ψ₀}(U₀).

**Acceptance.**

- Check the weight range 2 ≤ k ≤ l against Corollary 1.5's 2 ≤ k_x ≤ l − 1 (k = l gives only T = ∅).

**Depends on.** this roadmap: [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l), [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l), [`R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction`](#n-r23-3-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction), [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, Corollary 5.5, p. 769 (PDF page 41): “Combining the lemma 5.4 with the main theorem of [SW1]” — Corollary 5.5 uses [SW1] = Skinner–Wiles, Base change and a problem of Serre.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, proof of Lemma 5.6, p. 770 (PDF page 42): “By corollary 5.2 this factors through” — Lemma 5.6 from Corollary 5.2.

<a id="n-r23-3-taylor-2006-theorem-5-7-serre-weight-at-level-one"></a>
### Taylor 2006 Theorem 5.7: potential modularity in Serre's weight, unramified everywhere

`R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one` · theorem · planet “Potential modularity in Serre's weight (Taylor 2006)” · part R23.1

(Theorem 5.7.) Let l > 3 and ρ̄ : G_ℚ → GL₂(F̄_l) continuous, irreducible and odd with ρ̄|_{G_l} irreducible. There are a Galois totally real F of even degree in which l splits completely and a regular algebraic cuspidal π of GL₂(𝔸_F) with ρ̄|_{G_F} ∼ ρ̄_{π,λ}, π_∞ of weight k_ρ̄ (Serre's weight) and π_x unramified at every finite place.

**Hypotheses and conventions.**

- l > 3; KW II note that p = 3 is excluded in §5 and lift the restriction via Lemma 2.2 of Khare's level-one paper (unread, a gap)

**Proof outline.**

1. Choose 0 ≤ c < l − 1 with 2 ≤ k_ρ̄ − c(l + 1) ≤ l and (ρ̄ ⊗ ε^{−c})|_{I_l} ∼ ω₂^{k_ρ̄−1−c(l+1)} ⊕ ω₂^{l(k_ρ̄−1)−c(l+1)}.
2. Lemma 5.6 gives F and π of weight k_ρ̄ − c(l + 1), unramified at all finite places, for ρ̄ ⊗ ε^{−c}.
3. Lemma 1.3 gives φ : h_{k_ρ̄−c(l+1),F̄_l,ψ}(U₀) → F̄_l with non-Eisenstein kernel and ρ̄_φ ≅ (ρ̄ ⊗ ε^{−c})|_{G_F}.
4. Apply Lemma 5.3 c times to reach weight k_ρ̄ − c(l + 1) + c(l + 1) = k_ρ̄ and untwist.

**Acceptance.**

- Check the weight bookkeeping: k_ρ̄ − c(l + 1) ∈ [2, l] and c applications of D restore k_ρ̄; this acceptance calculation remains to be added to the suggested file.

**Depends on.** this roadmap: [`R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level`](#n-r23-3-taylor-2006-lemmas-5-4-5-6-weight-and-level), [`R23.3/taylor-2006-lemma-5-3-weight-shift`](#n-r23-3-taylor-2006-lemma-5-3-weight-shift), [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/TaylorWeights`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, Theorem 5.7, p. 770 (PDF page 42): “Finally we have the following version of our potential version of” — Theorem 5.7.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §5, proof of Theorem 5.7, p. 771 (PDF page 43): “The theorem now follows from lemma 5.3.” — The last step of the proof.

<a id="n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f"></a>
### KW II Theorem 6.1 (i)-(ii): potential modularity of ρ̄ of S-type over a totally real Galois F of even degree, in weight k(ρ̄) and in weight 2

`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F` · theorem · planet “Potential modularity (KW II Theorem 6.1)” · also realises R23.6 · part R23.1

Let ρ̄: G_Q → GL_2(F) be of S-type (odd, absolutely irreducible) with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2; assume ρ̄ has non-solvable image if p = 2, and ρ̄|ℚ(μ_p) absolutely irreducible if p > 2. Then there is a totally real field F, Galois over ℚ of even degree, unramified at p, and even split above p if ρ̄|D_p is irreducible, with im(ρ̄) = im(ρ̄|G_F) and ρ̄|F(μ_p) absolutely irreducible, such that: (i) assuming k(ρ̄) = 2 if p = 2, ρ̄|G_F arises from a cuspidal automorphic representation π of GL_2(A_F) that is discrete series of weight k(ρ̄) at the infinite places and unramified at all places above p; (ii) ρ̄|G_F also arises from a cuspidal π with π_v of conductor dividing v at all v | p (and unramified if ρ̄ is finite flat at v) and of weight 2 at the infinite places. Part (iii) (control of F) is recorded under R23.5.

**Hypotheses and conventions.**

- S-type; 2 ≤ k(ρ̄) ≤ p + 1 for p > 2; non-solvable image for p = 2; ρ̄|ℚ(μ_p) absolutely irreducible for p > 2
- part (i) at p = 2 is only claimed for k(ρ̄) = 2
- the proof supplements Taylor 2002 [58], Taylor 2006 [59] and Theorem 2.1 of Khare [33] (level-one paper; the library copy is arXiv v1 whose numbering differs) with the arguments printed in italics; it does not use any characteristic-zero lift of ρ̄
- imports: Langlands-Tunnell [40], [65]; Gross [27] Theorem 13.10 and Propositions 8.13, 8.18; Coleman-Voloch [12]; KW II Theorem 8.2; CDT appendix B; Hida [30] section 8; Lemma 2.2 of [33]; Grunwald-Wang
- Snowden’s general totally real theorem is a separate weight-two export; the precise Serre weight, even degree and dyadic assertions here still require the original KW/Taylor refinements and cannot be obtained by simply setting F=ℚ in Snowden.

**Proof outline.**

1. Apply modularity lifting first to the auxiliary Tate representation of the H6 abelian variety, not to a lift of the original residual representation. Use R19.2 to state modularity, R22.5/R22.6 or the corrected totally real ordinary input, R20.3 for the solvable-image weights, R22.4 for KW II Theorem 8.2 and L5 for the ordinary weight adjustment; Khare Lemma 2.2 comes from R18.3.
2. Dihedral projective image: choose all auxiliary fields linearly disjoint from the field cut out by ρ̄ and split at a prime split in the projective kernel field but inert in the quadratic subfield of ℚ(μ_p); this keeps ρ̄|G_F(μ_p) irreducible.
3. Solvable image: Langlands-Tunnell give ρ̄ from S_k(Γ_1(N)) with k ≥ 2; Gross Theorem 13.10, Coleman-Voloch and Gross Propositions 8.13, 8.18 give weight k(ρ̄) with N prime to p and also S_2(Γ_1(Np)); so (α), (β) of 8.2 hold and Theorem 8.2 gives (i), (ii).
4. Non-solvable image: Taylor's moduli problem X for HBAVs (field M, embedding i, polarisation datum j, level structure α at λ | p and at auxiliary primes p_0 ([58]) or p_1, p_2 ([59])); a point of X over F from Moret-Bailly using local points at infinity, p and the auxiliary primes; modularity of V_℘(A) (or of B from Lemma 4.4 of [59]) gives modularity of ρ̄|G_F.
5. p = 2 real points: construction from Taylor's erratum ([59] p. 776), with the modified lattice L' when ρ̄(c) is non-trivial (see the R23.2 local-points node).
6. p = 2, k(ρ̄) = 4: choose A with completely toric reduction above 2 (first case of Lemma 1.2 of [58]) to get π of weight 2 and level v above 2.
7. k(ρ̄) = 2: if ρ̄|D_p irreducible, impose χ unramified at p in Lemma 4.3 of [59], so Proposition 4.1(3) of [59] gives an unramified Weil-Deligne parameter; if ρ̄ is ordinary, twist so det(ρ̄) χ_p^{-1}|D_p is trivial, use Taylor's lifting χ̃_v with Frobenius β_v and F̃_v = ℚ_p, lift the extension class x to x_λ in H^1(D_v, O_{M,λ}(χ_p χ̃_v^{-2})) (the obstruction in H^2 vanishes: no obstruction if χ_v^2 ≠ 1; if χ_v^2 = 1 compare with the Kummer obstruction o_0 = 0 and identify o with the cup product of an unramified η with the finite class x), obtaining A_v with good ordinary reduction and an integral point x_v in X(ℤ_p) (normalised integral model), then apply Moret-Bailly Théorème 1.3 of part II with Ω_v = points of X(ℚ_p) reducing to x_v.
8. p = 3 with ρ̄|D_p irreducible: section 5 of [59] excludes p = 3; Lemma 2.2 of [33] lifts this (unread).
9. p ≠ 2, ρ̄|D_p reducible, k(ρ̄) > 2: the proof of Lemma 1.5 of [58] shows A ordinary at v with inertial Weil-Deligne parameter (ω^{k(ρ̄)-2} ⊕ 1, 0) if k ≠ p+1 and (1 ⊕ 1, N), N ≠ 0 nilpotent, if k = p+1 (for k = p with ρ̄|D_p semisimple it gives (ω^{-1} ⊕ 1, 0) without saying which line lifts the cyclotomic line); with CDT appendix B this gives π of parallel weight 2 ordinary with the same inertial parameter, and Hida theory ([30] section 8, with Lemma 2.2 of [33] for neatness) gives π unramified above p of parallel weight k(ρ̄).

**Acceptance.**

- Tabulate, for each branch (solvable; p = 2 with k = 2, 4; p odd with ρ̄|D_p irreducible, p = 3; p odd reducible with k = 2, 2 < k < p, k = p, k = p + 1), which source result supplies (i) and which supplies (ii)
- Check that no branch uses a characteristic-zero lift of ρ̄ over ℚ (noncircularity required by R23.3 and R24)

**Depends on.** this roadmap: [`R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`](#n-r23-1-moret-bailly-theorem-incomplete-skolem-data-have-integral-points), [`R23.1/forcing-linear-disjointness-by-extra-split-places`](#n-r23-1-forcing-linear-disjointness-by-extra-split-places), [`R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`](#n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l), [`R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one`](#n-r23-3-taylor-2006-theorem-5-7-serre-weight-at-level-one), [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e); other roadmaps' nodes: `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `PadicFamilies:L5/hida-control-nearly-ordinary`; other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`, `AutomorphicGaloisRepresentations:R19.2`, `GL2ModularityLifting:R22.4`, `PadicFamilies:L5`, `SerreWeightAndLevelOptimisation:R20.3`, `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), section 6, Theorem 6.1, pp. 53-54: “Then there is a totally real ﬁeld F that is Galois over Q of even degree, F is unramiﬁed at p, and even split above” — Statement of Theorem 6.1.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Theorem 6.1(ii), p. 54: “and is unramiﬁed if ¯ρ is ﬁnite ﬂat at v), and is of weight 2 at the inﬁnite places” — Part (ii) in weight 2.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, solvable case, p. 54: “After this the theorem follows from Theorem 8.2 below.” — The solvable-image branch goes through Theorem 8.2.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, non-solvable case, p. 54: “In the proof of Taylor, one has a moduli problem X for Hilbert-Blumenthal abelian va- rieties A with polarisation and level structures” — The non-solvable branch uses Taylor's moduli problem.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, p = 2 and k(rho-bar) = 4, pp. 55-56: “The abelian variety A is chosen to have completely toric reduction at primes above 2” — The dyadic weight-4 branch.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, ordinary k(rho-bar) = 2 branch, p. 56: “This proves that we can ﬁnd Av which has good ordinary reduction” — The obstruction computation producing a good ordinary local point.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, p = 3 branch, p. 56: “Although p = 3 is excluded in (Section 5 of) [59], as explained in Section 2 of [33], Lemma 2.2 of [33] allow one to lift this restriction.” — The p = 3 import.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, weight adjustment, p. 57: “using Hida theory (see Section 8 of [30], using also Lemma 2.2 of [33] to avoid the neatness hypothesis there)” — Hida theory used to move from parallel weight 2 to weight k(ρ̄).

<a id="n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity"></a>
### KW Annals Theorem 2.1 (Taylor): the odd-characteristic precursor with ordinary π_v, excluding k(ρ̄) = p

`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity` · theorem · part R23.1

Assume ρ̄ is of S-type in odd residue characteristic p, ρ̄|ℚ(μ_p) irreducible, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p. Then there is a totally real field F, Galois over ℚ of even degree, unramified above p and split above p if ρ̄|D_p is irreducible, with im(ρ̄) = im(ρ̄|G_F) and ρ̄|G_F(μ_p) absolutely irreducible, such that (i) ρ̄|G_F arises from a cuspidal π unramified at all finite places and discrete series of weight k(ρ̄) at infinity, with π_v ordinary for all v | p if ρ̄ is ordinary at p; (ii) ρ̄|G_F arises from a cuspidal π unramified at finite places not above p, with π_v of conductor dividing v (unramified if ρ̄ is finite flat at v) and weight 2 at infinity, and π_v ordinary at all v | p when ρ̄ is ordinary.

**Hypotheses and conventions.**

- p odd and k(ρ̄) ≠ p (the n ≠ 1 hypothesis of Taylor's Lemma 1.5)
- the supersingular case is referred to Theorem 5.7 of Taylor 2006 for p > 3 and to Khare [25] for p = 3
- linear disjointness is obtained from the refinement of Moret-Bailly's theorem in Proposition 2.1 of Harris-Shepherd-Barron-Taylor [23] (not in the library)
- the final solvable base change step cites 'the main theorem of [45]' (Skinner-Wiles, Residually reducible representations, IHES 89); the described statement (a solvable totally real F/E over which ρ̄ arises from π unramified outside p) is the main theorem of Skinner-Wiles, Base change and a problem of Serre ([44]); the citation number was not verified
- part (i) in the ordinary case uses Corollary 3.5 of Hida [24]

**Proof outline.**

1. Supersingular case: Taylor 2006 Theorem 5.7 (p > 3) and Khare [25] (p = 3).
2. Ordinary case, in Taylor's notation (residue characteristic l): choose a real quadratic F'' disjoint from the kernel field, l inert, over which χ ⊗ ρ̄|D has the shape (χ|D χ_l^{-1}, *; 0, χ|D) with χ^{-2}|I = χ_l^{k-2}|I; the Moret-Bailly application gives A/E of HB type with multiplication by M, ρ̄|G_E ≅ A[λ] and the compatible system of A modular of parallel weight 2.
3. With n = l - k + 1 (k ≠ 2) or n = 0 (k = 2), 0 ≤ n < l - 1 and n ≠ 1 because k ≠ l, Lemma 1.5 of [51] applies: multiplicative reduction or good reduction over E_x(ζ_l); for n = 0 semistability, Steinberg if k = l + 1, and good ordinary reduction if k = 2 (using a good ordinary local A_v also when χ_v^2 = 1, since ρ̄|G_v is finite flat and the class comes from units); for n ≠ 0 the Dieudonné module splitting and CDT appendix B give an ordinary Weil-Deligne parameter η_1 ⊕ η_2.
4. Skinner-Wiles base change ('main theorem of [45]') gives a solvable totally real F/E, Galois over ℚ and unramified above p, over which ρ̄ arises from π as in (ii); Hida's Corollary 3.5 gives (i).

**Acceptance.**

- Compare with KW II Theorem 6.1 and list the differences: p = 2 allowed, k(ρ̄) = p allowed, ordinarity of π_v not asserted in KW II
- Check the computation n = l - k(ρ̄) + 1 against Lemma 1.5's hypothesis n ≠ 1 when ρ̄|G_v is semisimple

**Depends on.** this roadmap: [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l), [`R23.3/taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l`](#n-r23-3-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l), [`R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one`](#n-r23-3-taylor-2006-theorem-5-7-serre-weight-at-level-one), [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e); other roadmaps' nodes: `PadicFamilies:L5/hida-control-nearly-ordinary`; other roadmaps' layers: `HilbertModularVarietiesAndShimuraCurves:H6`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `PadicFamilies:L5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-annals-2009](#src-kw-annals-2009), Theorem 2.1, p. 234: “Assume ¯ρ is of S-type in odd residue character- istic, such that ¯ρ|Q(µp) is irreducible” — Hypotheses of Theorem 2.1 (the exclusion k ≠ p is read in the same sentence).
- [kw-annals-2009](#src-kw-annals-2009), proof of Theorem 2.1, p. 234: “The supersingular case is covered in [50] explicitly (see Theorem 5.7 of [50]) for p > 3 and it is explained in [25] how to extend this to the case p = 3.” — Supersingular branch imported from Taylor 2006 and Khare.
- [kw-annals-2009](#src-kw-annals-2009), proof of Theorem 2.1, p. 234: “The ordinary case may be deduced from the arguments of [51] although not explicitly there.” — The ordinary branch is a reworking of Taylor 2002.
- [kw-annals-2009](#src-kw-annals-2009), proof of Theorem 2.1, p. 237: “Now using the main theorem of [45], we construct a totally real, solvable extension F/E that is unramiﬁed at places above p, Galois over Q” — The solvable base change step with its citation.
- [kw-annals-2009](#src-kw-annals-2009), proof of Theorem 2.1, p. 237: “Part (i) in the ordinary case follows from this using Corollary 3.5 of [24].” — Hida's result gives part (i).
- [kw-annals-2009](#src-kw-annals-2009), proof of Theorem 2.1, printed p. 235: “Note that as we are assuming k(¯ρ)̸ = ℓ, we have n̸ = 1 and Lemma 1.5 applies.” — Where k(ρ̄) ≠ p is used.

<a id="n-r23-3-snowden-totally-real-potential-residual-modularity"></a>
### Potential residual modularity over totally real fields

`R23.3/snowden-totally-real-potential-residual-modularity` · theorem · planet “Potential residual modularity” · part R23.1

Let F be totally real, p odd, ρ̄:G_F→GL2(𝔽̄_p) any continuous odd representation, ψ a finite-order characteristic-zero character with det(ρ̄)=ψ̄ χ̄_p, M/F finite, and t a definite A/B/C type function at p. There exist finite Galois M′/F containing M and finite totally real Galois F′/F disjoint from M′, such that over every finite totally real F′′/F′ still disjoint from M′ there is a cuspidal parallel-weight-two Hilbert eigenform f with detρ_f=ψχ_p, ρ̄_f≅ρ̄|G_F′′ and t_f=t|F′′. F′ may split at any prescribed finite S, provided t(v) is compatible with ρ̄_v at v∈S above p. Ordinary type A is allowed under this compatibility. The original residual representation need not satisfy Snowden’s (A1),(A2); those hypotheses apply to the auxiliary representation and to his given-lift and descent theorems.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Choose an auxiliary residual representation with known modularity and the (A1),(A2) image conditions using Snowden §5.4; request the exact existence statement.
2. Use H6’s simultaneous torsion scheme and the restricted moduli application. Replace ordinary Moret–Bailly by the soluble-preliminary-field lemma to obtain the requested split F2.
3. Apply the independent GL2 modularity lifting theorem to the auxiliary Tate representation. Hilbert Galois representations and compatible systems of the abelian variety transfer modularity to the original residual module.
4. Use residual soluble descent (Snowden 8.1.1) over F1F2/F2 with its (A1),(A2) checks. This descent is not a bare consequence of automorphic base change; its source proof first uses a global weight-two lift and matching-type lifting. Request those independent inputs from their owners.
5. Include the image-cutout fields and cyclotomic exceptions in M′, giving persistence over all avoidance-disjoint extensions. No original global lift from R24 is used in the auxiliary modularity step.

**Acceptance.**

- For F=ℚ compare the overlap with KW II 6.1, keeping KW’s stronger weight and dyadic conclusions separate. A prescribed incompatible type at a split p-adic place is excluded.

**Depends on.** this roadmap: [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field); other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.2`, `AutomorphicGaloisRepresentations:R19.6`, `GL2AutomorphicRepresentationsAndTransfer:R17.6`, `GL2ModularityLifting:R22.5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [snowden](#src-snowden), Theorem 5.1.1 and Proposition 8.2.1, pp. 15, 26: “any odd representation” — Potential residual modularity over totally real fields

<a id="n-r23-3-bcgp-controlled-residual-modularity"></a>
### Controlled residual modularity after restriction of scalars

`R23.3/bcgp-controlled-residual-modularity` · theorem · planet “Controlled residual modularity” · part R23.1

Let F1/F be finite totally real, p,q>2 distinct primes split completely in F1, and r:G_F1→GL2(𝔽̄_q) with det r=ε̄_q^{-1}. Suppose at every v|q, r_v=diag(λ_{α_v},ε̄_q^{-1}λ_{α_v}^{-1}), with λ_α the unramified character of arithmetic Frobenius α, and r unramified above p. For Favoid/F finite, there exist finite Galois totally real F′/F, split above p and q and disjoint from F1Favoid/F, and a q-ordinary weight-zero cuspidal π of GL2(A_F1F′) with trivial central character, unramified above pq, and residual representation r̄_{π,q}≅r|G_F1F′.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Apply the Snowden theorem to r∨, ψ=1, types A at q and AB at p; the diagonal shape and unramified p-restrictions make these types compatible.
2. For F1≠F use R23.2’s Weil-restricted scheme with avoidance F1Favoid.
3. Dualise the Galois representation to the BCGP convention (det ε^{-1}, weight zero). Track ordinary quotient, central character and unramified pq throughout.

**Acceptance.**

- For F1=F the restriction-of-scalars step disappears. Check determinant ε_q^{-1}, weight zero in BCGP’s convention, and unramifiedness at both p and q.

**Depends on.** this roadmap: [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application); other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bcgp-published](#src-bcgp-published), Proposition 9.1.11 and proof, p. 458: “q-ordinary” — Controlled residual modularity after restriction of scalars

<a id="layer-r23-4"></a>
## R23.4 — Potential modularity of a given lift

*Coverage in the R23.1 part: planned. 1 node, 1 planet.*

The single node takes a characteristic-zero lift ρ of ρ̄ *as data*: odd, finitely ramified, of Khare–Wintenberger type (A), (B) or (C) at p, minimal away from p as the lifting data require. Over the field of KW II Theorem 6.1, followed by an allowable base change (Theorem 8.2), ρ̄ satisfies the strengthened residual hypotheses (α), (β), and the lifting theorems of GL2ModularityLifting R22.5 (p > 2) and R22.6 (p = 2) make ρ|G_F modular. The theorem proves modularity of a given lift; it never produces one. R24.5 uses it to build compatible systems through lifts that R24.3 constructs, and consumers use it for lifts they construct themselves.

**Still open in this layer.**

- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.

<a id="n-r23-4-potential-modularity-of-a-given-lift"></a>
### Potential modularity of a given lift

`R23.4/potential-modularity-of-a-given-lift` · theorem · planet “Potential modularity of a given lift” · also realises R23.6 · part R23.1

Let ρ̄ satisfy KW I Theorem 5.1's hypotheses and let ρ : G_ℚ → GL₂(𝒪) be a given lift, odd, unramified outside a finite set, of type (A), (B) or (C) at p (for p = 2: crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2), minimal away from p as required by the lifting data. There is a totally real field F, Galois over ℚ (from Theorem 6.1, R23.3, followed by the allowable base change of Theorem 8.2), over which ρ̄|_{G_F} satisfies the strengthened (α), (β), and then ρ|_{G_F} is modular: ρ|_{G_F} ≅ ρ_{π,ι_p} for a holomorphic cuspidal π of GL₂(𝔸_F), by Theorem 9.7 (GL2ModularityLifting R22.5/R22.6). KW II use the field of the proof of Theorem 10.1 (R24.1), which is one such F. This is a theorem about a lift supplied as data, not an existence proof of the lift.

**Hypotheses and conventions.**

- the extension must keep ρ̄|_{G_{F(µ_p)}} absolutely irreducible (non-solvable image at p = 2) — part of the choice of F
- Theorem 9.7 needs F unramified at p and split at p when ρ̄|_{D_p} is irreducible or k(ρ̄) = p + 1
- for a general de Rham lift (Dieulefait–Pacetti Theorem 1.11) the same argument needs the general potential modularity lifting theorems of the modern route in place of Theorem 9.7

**Proof outline.**

1. Take F from Theorem 6.1 and the base change of Theorem 8.2, made Galois over ℚ.
2. Residual modularity over F in the forms (α), (β) (R23.3, GL2ModularityLifting R22.5).
3. Theorem 9.7 for ρ|_{G_F}.

**Acceptance.**

- Check that the local type of ρ at p is one Theorem 9.7 allows over F
- Check that F keeps the residual image hypotheses

**Depends on.** this roadmap: [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); other roadmaps' nodes: `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93: “Consider the number ﬁeld F and the cuspidal automorphic representation π′ of the proof of Theorem 10.1. We may assume that F/Q is Galois which we do. Then Theorem 9.7 yields that ρF := ρ|GF arises from a holomor- phic, cuspidal automorphic representation π of GL2(AF ) with respect to the embedding ιp.” — The given lift becomes modular over F.

<a id="layer-r23-5"></a>
## R23.5 — Control of the extension and descent data

*Coverage in the R23.1 part: planned. 2 nodes, 0 planets.*

The layer strengthens the field of R23.3 to the conditions later layers need, and keeps every descent statement conditional on its hypotheses.

- **Control of the extension** (KW II Theorem 6.1 (iii)). The field F can moreover be chosen so that ρ̄|D_𝔭 is trivial above p when k(ρ̄) = p and ρ̄|I_p is trivial; its completions above finitely many primes ℓ_i ≠ p contain prescribed local fields; it is split at p when p > 2 and k(ρ̄) = p + 1; and it is linearly disjoint from any given finite extension. The choices use the soluble prescribed completions and the disjointness lemmas of R23.1. In the dihedral branch an extra split prime keeps ρ̄|G_{F(μ_p)} irreducible; being unramified at p is weaker than being split there. Soluble base change and descent come from GL2AutomorphicRepresentationsAndTransfer R17.4 and R17.6, applied only under their invariance and cuspidality hypotheses: an arbitrary intermediate field does not inherit modularity.
- **Local Galois data over a composite field** (Boxer–Calegari–Gee–Pilloni, Proposition 9.1.12, corrected). The output is K/E disjoint from E′Favoid, the composite K′ = KE′ split at the given places, and a Galois L′/K′ with prescribed group, local completions and complex conjugations. No descent of L′ to K and no disjointness of L′/E from E′ is asserted: the printed statement asks for both, and the second contradicts E′ ⊆ L′ (source issue E7 of the R23.1 part). Lemma 9.2.7, the consumer in that paper, uses exactly the corrected outputs.

**Still open in this layer.**

- Exact local-completion refinement and Jordan
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.
- Weil restriction of varieties: property and analytic-open adapter

<a id="n-r23-5-control-of-the-extension"></a>
### Control of the extension (KW II Theorem 6.1 (iii))

`R23.5/control-of-the-extension` · theorem · part R23.1

In Theorem 6.1 the field F may moreover be chosen so that: (a) if k(ρ̄) = p and ρ̄|_{I_p} is trivial, then ρ̄|_{D_𝔭} is trivial at every 𝔭 | p; (b) for finitely many primes ℓ_i ≠ p and finite extensions F_{ℓ_i}/ℚ_{ℓ_i}, every completion of F at a prime above ℓ_i contains F_{ℓ_i}; (c) if p > 2 and k(ρ̄) = p + 1, F is split at p; (d) F is linearly disjoint from any given finite L/ℚ. Construct these choices with the CHT local-completion theorem and Moret–Bailly, preserving avoidance of the residual and cyclotomic cutout fields. In the dihedral branch add the split-prime condition of KW II p. 54 that prevents loss of irreducibility over F(μ_p). Soluble base change/descent is imported from R17.4/R17.6 and applied only when its invariance, cuspidality and descent hypotheses hold. No arbitrary intermediate field automatically inherits modularity.

**Hypotheses and conventions.**

- determinant and weight are unchanged by these choices
- KW II §10.1 refers to (b) as "part (c) of Theorem 6.1" (source issue PotentialModularityAndCompatibleSystems/E2)
- a modularity statement over a large field is not by itself a compatible system over ℚ; that is R24.5

**Proof outline.**

1. For (a), prescribe the finite unramified local extension killing the residual Frobenius; keep the distinction between unramified and completely split at p.
2. For (b), first take finite Galois local closures of the prescribed extensions, then apply CHT with real completions R and the avoidance field.
3. For (c), impose the weight-p+1 split condition in the original field choice, using the source’s twisting argument; record the twist and undo it on the modular form.
4. For (d) add the Chebotarev split places. In the dihedral branch enlarge avoidance by the normal closure of the residual cutout and ℚ(μ_p), or use the source’s prime splitting in the projective cutout and inert in the cyclotomic quadratic subfield.
5. Apply only the base-change/descent interface supplied by R17.4/R17.6; determinant, weights and specified local types must be transported and checked.

**Acceptance.**

- Check (d) through R23.1/forcing-linear-disjointness-by-extra-split-places
- Check that (b) is the clause used in the proof of Theorem 10.1

**Depends on.** this roadmap: [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.1/forcing-linear-disjointness-by-extra-split-places`](#n-r23-1-forcing-linear-disjointness-by-extra-split-places), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.1/tower-linear-disjointness`](#n-r23-1-tower-linear-disjointness); other roadmaps' nodes: `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.6`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Theorem 6.1 (iii), p. 54: “b) Given ﬁnitely many primes ℓi̸ = p and extensions Fℓi/Qℓi, then we may choose F so that for every embedding F ,→Qℓi, the closure of F contains Fℓi.” — (iii)(b).
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 6.1, p. 57: “- one can impose that closures of F contain locally given extensions Fℓi, ℓi̸ = 2, p, by successive applications of Grunwald-Wang theorem.” — Mechanism for (b).

<a id="n-r23-5-bcgp-local-galois-data-without-descent"></a>
### Local Galois data over a composite field

`R23.5/bcgp-local-galois-data-without-descent` · theorem · part R23.1

Let E be a number field, E′/E finite, Favoid/E finite disjoint from E′, S finite and S′ the places of E′ over S. Give a finite group G, for each finite v∈S′ a finite Galois H_v/E′_v and embedding into G, and at real v an element c_v of order dividing two. There exist finite Galois K/E disjoint from E′Favoid/E, K′=KE′ with every v∈S′ split completely in K′/E′, and a Galois L′/K′ with group G, prescribed local completions and decomposition-group inclusions up to conjugacy, and prescribed complex conjugations. No descent L/K or disjointness L′/E from E′ is asserted.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Use the smooth free-action locus of Calegari’s quotient X_G over E′, with local opens encoding the given local permutation actions; restrict scalars from E′ to E.
2. Use scheme Chebotarev/Jordan to force the specialised G-cover to have group G over K′.
3. Apply Moret–Bailly over E with avoidance the normal closure of E′Favoid. Read the point of the Weil restriction as an E′-scheme point over KE′.
4. There is no descent datum on this cover from K′ to K. Only K/E and L′/K′ are retained; this is precisely what the BCGP Lemma 9.2.7 consumer needs.

**Acceptance.**

- For nontrivial E′/E, check K/E avoidance but L′ only over K′=KE′; L′ contains E′ and thus cannot be disjoint from E′ over E.

**Depends on.** this roadmap: [`R23.1/potential-global-galois-local-data`](#n-r23-1-potential-global-galois-local-data), [`R23.1/moret-bailly-three-local-conditions`](#n-r23-1-moret-bailly-three-local-conditions); other roadmaps' nodes: `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-functor`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-of-quasi-projective-schemes`, `AbelianSchemesAndArithmeticModuli:A6/weil-restriction-over-a-separable-extension-splits`; other roadmaps' layers: `AbelianSchemesAndArithmeticModuli:A6`, `SchemeAndStackFoundations:SF.2`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Residual`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [bcgp-published](#src-bcgp-published), Proposition 9.1.12 and proof, pp. 458–459 (corrected statement; source issue E7): “The general case may be proved in exactly the same way” — Local Galois data over a composite field

<a id="layer-r23-6"></a>
## R23.6 — Exports and noncircularity

*Coverage in the R23.1 part: planned. 0 nodes, 0 planets.*

This layer has no nodes of its own. Its targets, separate residual and characteristic-zero exports with all hypotheses visible and the table of their uses, are realised by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f) and [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift), whose `realises` lists include R23.6, together with the field control of R23.5. The R23.1 part proposes folding this layer into the roadmap's introduction (see [Structural proposals](#structural-proposals)); the table is the content it would move.

| Input | Export | Permitted downstream use |
|---|---|---|
| A residual representation, and an auxiliary lifting theorem independent of it | A residual modular witness over a controlled totally real field (R23.3) | Finiteness of the global ring (R24.1); the residual hypothesis of a lifting theorem for a separately given lift (R23.4) |
| A lift supplied as data, with its local type | Modularity of that lift after restriction to a controlled field (R23.4) | The compatible-system construction (R24.5) |
| Splitting, local-containment and avoidance data | A controlled extension and admissible descent data (R23.5) | Preserving the residual image and transporting the specified local conditions |
| The dimension bound and finiteness of the unframed ring | A characteristic-zero point with prescribed local components (R24.2) | Existence of a lift, whose automorphy is a separate lifting application |

The admissible direction is: field selection and an independent auxiliary lifting theorem → residual modularity → finiteness → characteristic-zero points. KW II §6 and §10 and Taylor's papers follow it: Theorem 10.1 uses Theorem 6.1, and the lifts of §10.3 use Theorem 10.1, never the reverse.

**Still open in this layer.**

- Khare's Lemma 2.2 (p = 3) and Conrad–Diamond–Taylor Lemmas 3.1.1 and 4.2.4 (used by Taylor 2006 §5) are unread
- KW II Theorem 8.2 and the Gross/Coleman-Voloch weight results are imported into Theorem 6.1
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.

<a id="layer-r24-1"></a>
## R24.1 — Finiteness over the coefficient ring

*Coverage in the R23.1 part: planned. 4 nodes, 2 planets.*

Finiteness is proved for the *unframed* global deformation ring with fixed determinant and the stated local conditions; its framed enlargement is never finite over the coefficient ring, and tests inspect the unframed object.

- **The auxiliary field.** KW II Theorem 6.1 with all four conditions of (iii), followed by an allowable base change (Theorem 8.2, requested from GL2ModularityLifting R22.4), gives a totally real F over which ρ̄ is modular in the two forms the lift types need (type (A) in weight k(ρ̄); types (B), (C) in weight 2 with conductor dividing v above p), with central character ψ_F, and over which the reduction τ of the universal representation is unramified away from p (Khare's Lemma 4.2, requested from LocalGaloisDeformationRings R08.2).
- **KW II Theorem 10.1.** Over F the ring is finite by R = T (KW II Propositions 9.2–9.3, from GL2ModularityLifting R22). Restriction to G_F maps the universal residual representation over the ring for ℚ to one with finite image on G_F, hence on G_ℚ, and the finite-image criterion (KW Annals Lemma 3.6, DeformationAndDerivedPatchingAlgebra R03.4) gives finiteness over ℤ_p. The last step is the finite-image criterion; the intermediate ring map is not shown to be finite.
- **Ordinary finiteness.** The GL₂ totally real specialisation of Thorne's Theorem 10.2: adequate image over F(ζ_p), ζ_p ∉ F, an ordinary regular algebraic automorphic lift and a fixed ordinary Hodge type give a finite unframed ring with unrestricted conditions away from p. The polarized CM adapter and ordinary big R = T are requested from GlobalGaloisDeformations R04.6 and OrdinaryAutomorphicFormsAndModularityLifting R21.4. The Calegari–Geraghty ring R_φ of their Theorem 4.8, with its ordinary R† and chosen Frobenius eigenvalue, is an application; the comparison of R† with flag-based ordinary conditions is a gap.

**Still open in this layer.**

- Lemma 4.2 of Khare [33] (finite ramification of the universal residual representation) cannot be located in the library copy
- Propositions 9.2–9.3 and Theorem 8.2 of KW II over F are imported
- Ordinary finiteness specialization hypotheses
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.
- Suggested APIs and tests: missing full object interfaces

<a id="n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument"></a>
### The auxiliary totally real field F of the proof of Theorem 10.1 and the modular representations π' over it

`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument` · construction · part R23.1

There is a number field F such that: (1) F/ℚ is totally real, im(ρ̄|F) is non-solvable if p = 2 and ρ̄|F(μ_p) is absolutely irreducible if p > 2, F is split at p if ρ̄|D_p is irreducible and unramified at p otherwise, and ψ_F is unramified at all finite places not above p (so ψ_F is a character of the type fixed in 8.1); (2) if ρ̄|D_p is unramified then ρ̄|G_℘ is trivial for all ℘ | p; (3) strengthened (α), (β): assuming k(ρ̄) = 2 if p = 2, ρ̄|G_F arises from a cuspidal π' of GL_2(A_F) unramified at all places, discrete series of weight k(ρ̄) at infinity, with central character ψ_F (used for type (A)); and ρ̄|G_F arises from a cuspidal π' unramified at all finite places not above p, of conductor dividing v at v | p, weight 2 at infinity, central character ψ_F, and for p = 2, k(ρ̄) = 4 with ρ_{π'} at places above 2 arising from R̄_{v,ψ} (used for types (B), (C)); when weight p+1 lifts are considered, F is split at p; (4) the reduction τ of the universal representation attached to R̄_{Q,S}^ψ, restricted to G_F, is unramified outside the places above p and infinity.

**Hypotheses and conventions.**

- existence is asserted to follow from the combined effect of Theorem 6.1 (verifying (α), (β)), Theorem 8.2 and Lemma 4.2 of Khare [33]
- condition (4) uses Lemma 4.2 of [33] to find, for each of the finitely many primes l_i ≠ p where τ is ramified, a finite extension F_{l_i}/Q_{l_i} over which τ becomes unramified, and then chooses F whose completions at l_i contain F_{l_i}; the source cites 'part (c) of Theorem 6.1' for this, but the local-extension property is Theorem 6.1(iii)(b) ((iii)(c) is the splitting at p for k(ρ̄) = p + 1)
- Lemma 4.2 of [33] could not be located: the library copy of [33] is arXiv:math/0504080v1, whose results are numbered differently (Propositions 2.1-3.1, Lemmas 5.x)

**Construction.**

1. Apply Theorem 6.1 (with (iii)(a), (b), (c), (d)) to get F with ρ̄|G_F modular in the forms (i), (ii).
2. Apply Theorem 8.2 (allowable base change F''/F) to upgrade to π' unramified outside p (resp. with the prescribed type at p) and with central character ψ_F; for p = 2, k(ρ̄) = 4 ensure ρ_{π'} at 2 arises from R̄_{v,ψ}.
3. Kill the ramification of τ away from p by local extensions (Lemma 4.2 of [33] and Theorem 6.1(iii)(b), printed as '(c)').

**API.**

- `TauCeti.CompatibleSystems.AuxiliaryField` (structure): F with the conditions (1)–(4) and the representations π′
- `TauCeti.CompatibleSystems.AuxiliaryField.piA` (projection): π′ unramified everywhere, weight k(ρ̄), central character ψ_F (type (A)); this projection is available only under p ≠ 2 or k(ρ̄) = 2. No type-(A) witness is supplied at p = 2, k = 4.
- `TauCeti.CompatibleSystems.AuxiliaryField.piBC` (projection): π′ of conductor dividing v at v | p, weight 2, central character ψ_F (types (B), (C))
- `TauCeti.CompatibleSystems.AuxiliaryField.tau_unramified` (characterisation): the reduction τ of the universal representation is unramified on G_F outside p and ∞
- `TauCeti.CompatibleSystems.AuxiliaryField.exists` (constructor): existence from Theorem 6.1 with (iii)(b)–(d), Theorem 8.2 and the local killing of ramification
- `TauCeti.CompatibleSystems.AuxiliaryField.piA_iff` (characterisation): The type-(A) automorphic witness is available under p≠2 or k(ρ̄)=2; at p=2, k=4 only the type-(B)/(C) witness is part of the construction.
- `TauCeti.CompatibleSystems.AuxiliaryField.piBC_eq` (simp): The piBC accessor returns the chosen weight-two witness with the fixed central character; in the reduced prototype it returns its stored Galois realization.

**Unit tests.**

- `aux_dyadic_weight_four` (characterisation): p = 2, k(ρ̄) = 4: only (β) is used, with ρ_{π′} at the places above 2 of the semistable type (C) Test the actual AuxiliaryField object: its type-(A) accessor guard is false and its type-(B)/(C) Galois accessor returns the stored witness.
- `aux_unramified_at_p` (degenerate): ρ̄|_{D_p} unramified: the field is chosen with ρ̄|_{G_𝔭} trivial at every 𝔭 | p The reduced object test evaluates its τ on Frob^n for n divisible by the residual Frobenius order; identifying this with the relevant p-adic completion remains a place-supplier input.
- `aux_not_cm` (non-example): a CM field would not do: Hilbert modular forms and Theorem 9.7 need F totally real In particular, the field stored in an AuxiliaryField cannot contain i with i²=−1.
- `aux_tame_killing` (computation): tame inertia of order e at ℓ ≠ p is killed over ℚ_ℓ(ℓ^{1/e}); e.g. e = 3 at ℓ = 7 (3 | 7 − 1, so the extension is abelian) Test τ on the object’s stored killed-inertia group; the completion/ramification interpretation is omitted from the reduced prototype.

**Acceptance.**

- For each type (A), (B), (C) at p, name which of the two π' is used and check its central character equals ψ_F
- Check that condition (4) is a condition on the universal residual representation τ of the global ring (finitely many ramified primes, each with finite inertia image by the definition of the local rings), not on ρ̄ alone

**Used by.**

- [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring): restriction to G_F and the modular deformation problem over F
- [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system): KW II §10.3.2 starts from this F and π′ (made Galois)

**Depends on.** this roadmap: [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension); other roadmaps' layers: `GL2ModularityLifting:R22.4`, `LocalGaloisDeformationRings:R08.2`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/GlobalFiniteness`, namespace `TauCeti.CompatibleSystems`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, p. 90: “This exists because of the combined eﬀect of Theorem 6.1” — The auxiliary field's existence is referred to Theorem 6.1, Theorem 8.2 and Lemma 4.2 of [33].
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, first bullet, p. 90: “F/Q is a totally real extension, im(¯ρ|F ) is non-solvable for p = 2” — Condition (1) on F.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, third bullet, p. 91: “Strengthened versions of (α) and (β) for p > 2” — Condition (3): the modular π' over F.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, third bullet, p. 91: “When we need to consider weight p + 1 liftings, we may assume by Theorem 6.1 and 8.2 that F is split at p.” — Splitting at p for weight p + 1.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, fourth bullet, p. 91: “This condition is ensured by using Lemma 4.2 of [33] to see that for each of the ﬁnitely many primes” — Condition (4) via Lemma 4.2 of [33] and a local-extension clause of Theorem 6.1.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, fourth bullet, p. 91: “is unramiﬁed and choosing F as in part (c) of” — The printed cross-reference '(c)', which does not match the content of Theorem 6.1(iii)(c).

<a id="n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring"></a>
### KW II Theorem 10.1: R̄_S^ψ is finite over ℤ_p, by restriction to the auxiliary totally real field

`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring` · theorem · planet “Finiteness of global deformation rings” · part R23.1

For ρ̄, S, ψ and local conditions as in 10.1, the ring R̄_S^ψ is finite as a ℤ_p-module.

**Hypotheses and conventions.**

- all hypotheses of 10.1 (S-type, weight range, non-solvable image for p = 2, ρ̄|ℚ(μ_p) absolutely irreducible for p > 2, local conditions from Theorem 3.1, case (C) at p > 2 only for k(ρ̄) = p + 1)
- inputs: Theorem 6.1 and Theorem 8.2 (through the auxiliary field F), Propositions 9.2 and 9.3 (R = T and finiteness over F), and the finite-image criterion 'Lemma 3.6 of [34]' = KW Annals Lemma 3.6 or '3.14 of [31]' = de Jong
- the ring over F, R̄_F^{ψ_F}, parametrises minimal odd deformations of ρ̄_F unramified outside the places above p with determinant ψ_F χ_p and uniformly one of the conditions (A), (B), (C) at all places above p
- the rings are those of GlobalGaloisDeformations R04.6 (framed ring over the local conditions of LocalGaloisDeformationRings R08.6; the unframed R̄^ψ_S as trace subring); only the unframed ring is finite: the framed ring is a power series ring over it in 4|S| − 1 variables

**Proof outline.**

1. Choose F as in the previous node and let R̄_F^{ψ_F} be the ring over F described in the hypotheses; the representation ρ_{π'} prescribes lifting data (π' chosen according to the type (A), (B) or (C)).
2. Apply Propositions 9.2 (p > 2) and 9.3 (p = 2) to R̄_F^{ψ_F}: it is finite as a ℤ_p-module.
3. Functoriality (ρ̄ and ρ̄|G_F absolutely irreducible) gives CNL_O-morphisms π_1: R_F^{ψ_F} → R̄_F^{ψ_F}, π_2: R_{Q,S}^ψ → R̄_{Q,S}^ψ, β: R_F^{ψ_F} → R_{Q,S}^ψ (restriction to G_F, using condition (4) and the compatibility of the local conditions at p) and α on the framed quotients, with α π_1 = π_2 β; hence β induces γ: R̄_F^{ψ_F} → R̄_{Q,S}^ψ.
4. γ carries the universal mod p representation of G_F over R̄_F^{ψ_F}/(p), which has finite image because R̄_F^{ψ_F} is finite, to the restriction to G_F of the universal mod p representation of G_Q over R̄_{Q,S}^ψ/(p); so the latter has finite image on G_F, hence on G_Q.
5. The finite-image criterion (KW Annals Lemma 3.6, or de Jong 3.14) gives R̄_S^ψ finite over ℤ_p.

**Acceptance.**

- Verify the restriction map β: check that the restriction to G_F of a deformation of type X_v at v | p satisfies the uniform condition (A), (B) or (C) at every place of F above p (F unramified or split at p as required)
- Record that the proof never shows γ is finite; finiteness of R̄_{Q,S}^ψ comes from finite image of the mod p universal representation and generation by traces
- Confirm that the same argument applied to the framed ring would fail, since R̄_{S,ψ}^□ contains power-series variables

**Depends on.** this roadmap: [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument); other roadmaps' nodes: `GlobalGaloisDeformations:R04.6/kw-deformation-data`, `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`, `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.3/minimal-ring-finite`; other roadmaps' layers: `DeformationAndDerivedPatchingAlgebra:R03.4`, `AutomorphicGaloisRepresentations:R19.6`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/GlobalFiniteness`, namespace `TauCeti.CompatibleSystems`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, p. 91: “Consider the deformation ring ¯RψF F over F that parametrises (minimal, odd) deformations of ¯ρF unramiﬁed outside places above p” — The deformation ring over the auxiliary field.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, p. 91: “we are in a position to apply Propositions 9.2 and 9.3 to” — Finiteness over F from the R = T propositions.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, p. 91: “As ¯ρ and ¯ρ|GF are absolutely irreducible, we have by functoriality” — Construction of the restriction morphisms.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Theorem 10.1, pp. 91-92: “has ﬁnite image, we deduce that the universal mod p representation” — Finite image of the universal mod p representation.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), end of proof of Theorem 10.1, p. 92: “From this we deduce, using 3.14 of [31] or Lemma 3.6 of [34], that” — The finite-image finiteness criterion.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Theorem 10.1, p. 90: “Theorem 10.1. The ring ¯Rψ S is ﬁnite as a Zp-module.” — The statement.

<a id="n-r24-1-ordinary-global-ring-finiteness"></a>
### Ordinary global deformation-ring finiteness

`R24.1/ordinary-global-ring-finiteness` · theorem · planet “Ordinary global ring finiteness” · part R23.1

For p>2 and a totally real F, let ρ̄ be odd and absolutely irreducible, with adequate image on G_F(ζ_p) and ζ_p∉F. Fix the determinant and a finite S containing p and the ramification. Suppose ρ̄ has an ordinary regular algebraic cuspidal automorphic lift of the required determinant, and fix ordinary Hodge type at p. The unframed global deformation ring with the ordinary local conditions at p and unrestricted local conditions at S away from p is module-finite over O, under the polarized CM-extension hypotheses of Thorne Theorem 10.2. Every quotient specifying additional away-p conditions is finite too. This is the GL2 totally-real specialization, not the full GL_n theorem, and does not apply to an arbitrary nonordinary ring.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Make a soluble CM extension preserving residual adequacy and local ordinary data, and embed the GL2 deformation problem with fixed determinant into the polarized problem of Thorne §10. Request the exact restriction/finite-map comparison.
2. Thorne Theorem 10.2: choose soluble CM extensions trivialising the residual representation locally and making inertia of all lifts unipotent away from p; this is not killing inertia uniformly in characteristic zero.
3. Use ordinary big R=T and specialization of its weight algebra at the chosen Hodge type; the specialized polarized ring is finite over O.
4. Use the finite restriction map to descend finiteness to the original unframed ring. Additional local quotients preserve module finiteness.

**Acceptance.**

- Any away-p quotient of the finite unframed ordinary ring remains finite. A framed power-series enlargement is not module-finite over O.

**Depends on.** this roadmap: [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions); other roadmaps' layers: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GlobalGaloisDeformations:R04.6`, `LocalGaloisDeformationRings:L8`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Finiteness`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [thorne](#src-thorne), Theorem 10.2, setup and proof, author pp. 56–58: “a finite O-module” — Ordinary global deformation-ring finiteness

<a id="n-r24-1-cg-ordinary-ring-finiteness"></a>
### Finiteness for the Calegari–Geraghty ring

`R24.1/cg-ordinary-ring-finiteness` · application · part R23.1

In CG18 Theorem 4.8’s proof, p≥3, ρ̄:G_Q→GL2(k) is absolutely irreducible and modular, twist-minimal away from p; the scalar unramified-at-p branch is the new case. For each harmless-prime character φ, fix χ_φ=ε det(ρ̄) ε̄^{-1} φ, take the ordinary framed local ring R† at p and unrestricted fixed-determinant rings R_{v,φ} at the other ramified places. The corresponding unframed ring R_φ is finite over O. Its framed version is a power-series enlargement and is not asserted finite over O. This is a finiteness input to the multiplicity theorem, not a new proof of that theorem.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.

**Proof outline.**

1. Use the modular ordinary residual witness in the source’s scalar branch and check absolute irreducibility over ℚ(ζ_p), adequacy and the polarized specialization hypotheses for Thorne’s theorem; small-image exceptions must be handled by an exact supplier, not by claiming absolute irreducibility implies adequacy.
2. Apply ordinary global-ring finiteness to these unrestricted away-p local conditions.
3. Identify R_φ as the unframed ring, then use its Artinian special fibre in the source’s system-of-parameters argument.

**Acceptance.**

- In the scalar-unramified branch check R† with chosen Frobenius eigenvalue. Prove finiteness for R_φ rather than its multi-framed power-series ring.

**Depends on.** this roadmap: [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness); other roadmaps' layers: `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `LocalGaloisDeformationRings:L8`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Finiteness`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [cg](#src-cg), Theorem 4.8 proof, PDF pp. 65–68, especially the finiteness paragraph on p. 68: “R is finite over O” — Finiteness for the Calegari–Geraghty ring

<a id="layer-r24-2"></a>
## R24.2 — Existence of characteristic-zero points

*Coverage in the R23.1 part: planned. 2 nodes, 2 planets.*

A finite nonzero 𝒪-algebra need not have a characteristic-zero point: 𝒪/(p) has none. What gives one is finiteness together with Krull dimension at least one.

- **Khare–Wintenberger.** The presentation of the framed ring and Wiles's formula give dim R̄_S^ψ ≥ 1 (KW II Proposition 4.5, from GlobalGaloisDeformations R04.3); with Theorem 10.1, the algebraic extraction of DeformationAndDerivedPatchingAlgebra R03.4 gives a point over the integers of a finite extension of ℚ_p, which lifts to the framed ring by formal smoothness. Its representation is a lift of ρ̄ of the required local type (KW II 10.3.1). Continuity, the residue embedding, localness and the specialisation of the framing variables are an adapter recorded as a gap; they are not part of the algebraic statement.
- **Newton–Thorne.** The same extraction on the ring cut out by chosen local components (potentially crystalline ordinary above p, a Steinberg component at v₀, regular components elsewhere), with the dimension bound of Böckle–Gee, Proposition 4.2.6, and the ordinary finiteness of R24.1. Automorphy of the extracted lift is a later lifting application, not an input.

**Still open in this layer.**

- Ordinary finiteness specialization hypotheses
- Integral point to continuous p-adic lift adapter
- Obtain and verify the exact outstanding supplier interfaces; retain implementationStatus unchecked.

<a id="n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type"></a>
### Existence of characteristic-zero points of R̄_S^ψ and of the associated lifts of the required local type

`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` · theorem · planet “Characteristic-zero points of deformation rings” · part R23.1

Under the hypotheses of 10.1, abs.dim R̄_S^ψ ≥ 1 (Proposition 4.5) and R̄_S^ψ is finite over ℤ_p (Theorem 10.1). Hence (Corollary 4.7) there is a local O-algebra map R̄_S^ψ → O' with O' the ring of integers of a finite extension of ℚ_p, and, since R̄_{S,ψ}^□ is formally smooth over R̄_S^ψ, a map R̄_{S,ψ}^□ → O''. The corresponding tuple gives a continuous representation ρ: G_Q → GL_2(O'') reducing to ρ̄, with det ρ = ψ χ_p, unramified outside S, whose restriction to D_v (after conjugation by the framing g_v ∈ GL_2(O'')^1) is a lift classified by R̄_{v,ψ}^□ for every v in S; that is, ρ is a p-adic lift of the required type (KW II 10.3.1).

**Hypotheses and conventions.**

- finiteness of the unframed R̄_S^ψ over ℤ_p (R24.1); the framed ring is not finite over O
- the dimension lower bound requires the local rings to be flat of the stated dimensions (previous node) and the relation bound r(J) ≤ dim H^1_{L⊥}(S, (Ad^0)*(1)) of Lemma 4.6 together with the generator count g = dim H^1_{L⊥}(S, (Ad^0)*(1)) + |S| - 1 (Lemma 4.4, Wiles' formula, Lemma 4.3)
- finiteness alone is insufficient: a finite O-algebra of dimension 0 (e.g. F, or O/π^n[x]/(x^2)) has no characteristic-zero point; it is the bound abs.dim ≥ 1 that makes p non-nilpotent
- that O'-points of R̄_{v,ψ}^□ are exactly lifts of type X_v is the 'classifies' property of Definition 2.4 / Corollary 2.3 for the flat reduced local quotients
- continuity and reduction to ρ̄ are immediate from the construction of universal lifts over complete local rings and are not argued separately in the source

**Proof outline.**

1. Presentation: R_{S,ψ}^□ ≅ R_{S,loc,ψ}^□[[X_1, ..., X_g]]/J with g = dim H^1_{L⊥}(S, (Ad^0)*(1)) + |S| - 1 (Lemma 4.4, Wiles' formula (2), Lemma 4.3(3), and the exact sequence 0 → H^0(D_v, Ad^0) → H^0(D_v, Ad) → F → L_v → 0 making each local term 1).
2. Relations: J needs at most dim H^1_{L⊥}(S, (Ad^0)*(1)) generators (Lemma 4.6); base change gives R̄_{S,ψ}^□ ≅ R̄_{S,loc,ψ}^□[[X_1, ..., X_g]]/J' with the same bound.
3. Dimension: abs.dim R̄_{S,ψ}^□ ≥ |S| - 1 + (1 + 3|S|) = 4|S|, while abs.dim R̄_{S,ψ}^□ = abs.dim R̄_S^ψ + 4|S| - 1 (Proposition 4.1); so abs.dim R̄_S^ψ ≥ 1 (Proposition 4.5).
4. Corollary 4.7: finite over ℤ_p and dimension ≥ 1 force p non-nilpotent, so a prime I with p ∉ I exists and R̄_S^ψ/I embeds in some O'; lift to the framed ring by formal smoothness.
5. 10.3.1: the O''-points of R̄_{S,ψ}^□ correspond to p-adic lifts of the required type, so a lift of that type exists as soon as R̄_S^ψ is finite, which is Theorem 10.1.
6. Separate the algebraic supplier’s integral-closure map from the arithmetic/topological adapter: verify the finite extension is a p-adic field, its integers are local and complete, the map is continuous and preserves the residual embedding, and the framing variables can be specialised. These conclusions are not part of the algebraic R03.4 theorem.

**Acceptance.**

- Check that R = F[x]/(x^2), a nonzero finite O-algebra killed by p and of Krull dimension 0, has no characteristic-zero point, and that it cannot occur as R̄_S^ψ because Proposition 4.5 forces dimension ≥ 1
- Track the coefficient extensions O ⊂ O' ⊂ O'' and check the lift is GL_2(O'')-valued with reduction ρ̄ after the fixed embedding of residue fields
- When the local rings are Cohen-Macaulay (resp. complete intersections), check the Remark after Proposition 4.5: R̄_S^ψ is then flat over O and Cohen-Macaulay (resp. a complete intersection)

**Depends on.** this roadmap: [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/export-completed-tensor-product`, `LocalGaloisDeformationRings:R08.6/local-nonemptiness`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`, `GlobalGaloisDeformations:R04.6/trace-subring-universal-representation`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/GlobalFiniteness`, namespace `TauCeti.CompatibleSystems`.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Proposition 4.5, p. 43: “It follows that, in the preceeding formula, each term of the sum over v ∈S is 1 and we ﬁnd” — The local contribution to the generator count.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Proposition 4.5, p. 45: “Thus a lower bound for the (absolute) dimension of ¯R□,ψ S is 3|S| + 1 + |S| −1 = 4|S” — The dimension lower bound.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Corollary 4.7 and proof, pp. 45-46: “If ¯Rψ S is a ﬁnitely generated Zp-module, then there is a map of CNLO-algebras” — Existence of the characteristic-zero point.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), 10.3.1, p. 92: “of its spectrum correspond exactly to the p-adic deformations of required type.” — Points of the global ring are the lifts of the required type.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), Corollary 4.7, p. 45: “Corollary 4.7. If ¯Rψ S is a ﬁnitely generated Zp-module, then there is a map of CNLO-algebras π : ¯Rψ S →O′ for O′ the ring of integers of a ﬁnite extension of Qp.” — Points from finiteness and dimension.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), proof of Proposition 4.5, p. 45: “We know that ¯R□,loc,ψ S is ﬂat over O such that abs. dim.( ¯R□,loc,ψ S ) = 1 + 3|S|.” — The local dimension count.

<a id="n-r24-2-newton-thorne-khare-wintenberger-extraction"></a>
### Extracting a point on prescribed components

`R24.2/newton-thorne-khare-wintenberger-extraction` · theorem · planet “Characteristic-zero deformation points” · part R23.1

In Newton–Thorne §3, choose the fixed-determinant unframed global deformation ring R for the stated residual automorphic representation and the specified local components C_v (potentially crystalline ordinary components above p, the chosen Steinberg component at v0, and the regular components at the other ramified places). BG19 Proposition 4.2.6 gives dim R≥1. The applicable finiteness theorem gives R finite over O. Thus R[1/p]≠0 and there is a characteristic-zero point over a finite extension of Frac(O), integral after passing to its ring of integers; its representation has the prescribed local behaviour. Automorphy of this lift is a subsequent lifting application, not a premise for the point’s existence.

**Hypotheses and conventions.**

- All hypotheses in the statement are required; the supplier interfaces below are not claims of implementation.
- Newton–Thorne Lemma 3.1 setup: p≥5; π RAESDC over totally real F with det r_π=ε^{-1}, weight zero and Steinberg at p, tamely dihedral order p at v₀ with q_v₀≡−1 mod p, potentially unramified away from p, and residual image containing SL₂(F_{p^a}) for a>a₀(p). The selected lift has determinant ε^{-2}ω and Hodge–Tate weights {0,2}. Local nonemptiness at p uses a Hida specialization; at v₀ use the explicit unipotently ramified lift.

**Proof outline.**

1. Import the exact presentation/dimension bound with the local component nonemptiness checked, including the unipotently ramified lift at v0.
2. Apply the ordinary/component-compatible finiteness theorem; verify its adequacy and automorphic residual hypotheses in this particular NT application.
3. If R[1/p]=0, finiteness implies p is nilpotent on R and R is Artinian, contradicting dim R≥1. Choose a prime not containing p and a finite residue extension of the generic fibre.
4. Use the R03.4 integral-closure theorem and the local/topological adapter to obtain the required lift.

**Acceptance.**

- O/(p) is finite and nonzero but has empty characteristic-zero fibre. The dimension ≥1 input and the selected local-component quotients are both necessary.

**Depends on.** this roadmap: [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness); other roadmaps' nodes: `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`, `PadicFamilies:L5/hida-control-nearly-ordinary`; other roadmaps' layers: `GlobalGaloisDeformations:R04.6`, `LocalGaloisDeformationRings:R08.6`, `PadicFamilies:L5`.

**Proposed location.** `TauCeti/NumberTheory/PotentialModularity/Finiteness`, namespace `TauCeti.PotentialModularity`.

**Sources.**

- [newton-thorne](#src-newton-thorne), §3, p. 14, Khare–Wintenberger paragraph: “R[1/p] is non-zero” — Extracting a point on prescribed components

<a id="layer-r24-3"></a>
## R24.3 — Prescribed local lifts

*Coverage in the R24.3 part: planned. 11 nodes, 2 planets.*

The layer constructs the prescribed lifts of KW I Theorem 5.1 and their Annals and Böckle precursors. Under RS-06 it owns this application of the global presentation (GlobalGaloisDeformations R04.3) and of the auxiliary R = T theorem (GL2ModularityLifting R22.3); it does not reprove either.

- **Böckle's appendix.** Proposition 1: when the local rings are complete intersections flat over ℤ_p of the displayed relative dimensions, the global ring is 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ}), with d = 0 or 1 for fixed or variable determinant. Lemma 2: a finite 𝒪-algebra presented with at most as many relations as variables has exactly as many, is a finite flat complete intersection, and has R[1/π] ≠ 0. Theorem 1: an auxiliary isomorphism R_Q ≅ T_Q of finite flat W(k)-algebras gives the minimal R_∅ ≅ T_∅. None of these is a lift-existence theorem by itself.
- **Minimal lifts** (KW Annals, Theorem 3.3). For p > 2, ρ̄ of S-type with 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p has a lift minimally ramified everywhere, crystalline or semistable when k(ρ̄) = p + 1: presentation, finiteness by Taylor's potential modularity with R = T, complete intersection, point.
- **Lift types.** The definition of lifts of required type (1)–(4): minimal crystalline of weight k(ρ̄); minimal of weight 2 with inertial Weil–Deligne parameter (ω^{k(ρ̄)−2} ⊕ 1, 0) or a Steinberg parameter; and two types with a prescribed level-one or level-two character at an auxiliary prime q. Each type is a theorem node, proved by finiteness (R24.1) and extraction (R24.2) for the corresponding local conditions. The application table records which type each step of KW I §§8–9 uses, and how Dieulefait–Pacetti's Theorem 1.9 matches them.
- **Weight-two lifts of prescribed type** (Snowden, Theorems 7.2.1 and 7.6.1; Gee), for odd p over a totally real field, used only by the modern route. Local nonemptiness of a type is proved before a global point is requested; that a type *compatible with ρ̄* admits a local lift of that type is a recorded gap, since Snowden's Proposition 7.7.1 gives a lift of some definite type, not of a prescribed inertial type.

**Still open in this layer.**

- Resolve the exact parameter-system algebra and auxiliary-to-minimal R=T supplier requests; verify the local minimality recognition export and Savitt weight inputs.
- Refine the omitted arithmetic lift-type suggested signatures when R01/R04/R08 carriers are available.

<a id="n-r24-3-bockle-presentation"></a>
### Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)

`R24.3/bockle-presentation` · theorem · part R24.3

Let ρ̄ : G_ℚ → GL₂(k) be odd and absolutely irreducible, X a set of local deformation conditions, unramified outside a finite set S, and d ∈ {0, 1}, Ad_X = Ad⁰ρ̄ if X fixes the determinant (d = 0) and Ad_X = Adρ̄ otherwise (d = 1). Suppose (a) for ℓ ∈ S ∖ {p, ∞} the local ring R_{X,ℓ} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_ℓ, Ad_X) − Δ_ℓ, and (b) R_{X,p} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_p, Ad_X) + 1 + d − Δ_p. Then with Δ = ΣΔ_ℓ, R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ}) for some n. In particular, when Δ ≤ 0 (for instance minimal conditions, where Δ_ℓ = 0) the ring has at most as many relations as variables (Böckle's Corollary 1; KW Annals Proposition 3.4: W⟦X₁, …, X_r⟧/(f₁, …, f_s) with r ≥ s).

**Hypotheses and conventions.**

- oddness of ρ̄ enters through the global Euler characteristic (Böckle's formula [1, Lemma 5.5(ii)])
- the local hypotheses are hypotheses: they are supplied by LocalGaloisDeformationRings (R08.6), not proved here
- this is a presentation, not a lift-existence theorem: finiteness over 𝒪 must be added (R24.1)

**Proof outline.**

1. Choose auxiliary primes S_aux (Böckle [1], Corollary 6.4) and local presentations R_{X,ℓ} = 𝒪⟦X_{ℓ,1}, …⟧/J_ℓ.
2. Böckle [1], Theorem 5.6: R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/J with J generated by at most Σ j_ℓ elements.
3. Count n + d from the tangent space with the global Euler characteristic (oddness) to get n + Δ = Σ j_ℓ.

**Acceptance.**

- Check the count on the minimal case: every Δ_ℓ = 0, so the number of relations is at most the number of variables
- Check the sign convention for d and Ad_X against GlobalGaloisDeformations R04.3's presentation

**Depends on.** other roadmaps' nodes: `GlobalGaloisDeformations:R04.3/local-to-global-presentation`, `GlobalGaloisDeformations:R04.3/relative-tangent-space`, `LocalGaloisDeformationRings:R08.6/kw-local-conditions`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `bockle_presentation`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [bockle-appendix-2003](#src-bockle-appendix-2003), Proposition 1, p. 2: “so that n + ∆ = j, as asserted.” — The statement begins.
- [bockle-appendix-2003](#src-bockle-appendix-2003), Proposition 1, p. 2: “so that n + ∆ = j, as asserted.” — The presentation.
- [bockle-appendix-2003](#src-bockle-appendix-2003), Proof of Proposition 1, p. 2: “so that n + ∆ = j, as asserted.” — Where oddness enters.
- [kw-annals-2009](#src-kw-annals-2009), Proposition 3.4, printed p. 240: “presentation as a CNL W -algebra” — KW Annals' form of it for minimal lifts.

<a id="n-r24-3-finite-presentation-complete-intersection"></a>
### Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)

`R24.3/finite-presentation-complete-intersection` · comparison · part R24.3

Let 𝒪 be a complete DVR, π a uniformizer, A=𝒪[[x₁,…,x_n]], and f₁,…,f_m∈m_A with m≤n. Let R=A/(f₁,…,f_m) be nonzero, complete noetherian local, with its residue field identified with that of 𝒪, and finite as an 𝒪-module. Then m=n, (π,f₁,…,f_n) is A-regular, R is finite flat and a complete intersection over 𝒪, and R[1/π]≠0. A characteristic-zero integral point over a finite coefficient extension is obtained by the R24.2 point interface. This is the imported algebra behind Böckle Lemma 2, not a consequence of merely naming regular sequences and flatness.

**Hypotheses and conventions.**

- finiteness over 𝒪 is essential: 𝒪⟦x⟧ (n = 1, m = 0) is a flat complete intersection over 𝒪 but is not finite, and the conclusion m = n fails
- this is the commutative-algebra core of "finiteness plus presentation gives lifts"; KW II use the same principle in the form of their Corollary 4.7 (R24.2)

**Proof outline.**

1. Import regularity/Cohen–Macaulayness of the complete DVR power-series ring and Krull’s height bound from R03.3.
2. The finite nonzero residue quotient makes π,f₁,…,f_m a system of parameters. Height forces m≥n; m≤n gives equality. Cohen–Macaulayness then makes this parameter sequence regular. Permute the sequence within m_A to put π last, proving π is a nonzerodivisor on R.
3. Finite torsion-free over a DVR is finite flat. Import the integral-point consequence from R24.2.

**Acceptance.**

- Check the height count on n = 1: 𝒪⟦x⟧/(x² − π) is finite free of rank 2 over 𝒪
- Check that m < n is impossible for finite R (the Krull height argument)

**Depends on.** layers of this roadmap: [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`; libraries: `mathlib:RingTheory.Sequence.IsRegular`, `mathlib:IsLocalRing`, `mathlib:ringKrullDim`, `mathlib:Module.Flat`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `finite_presentation_complete_intersection`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [bockle-appendix-2003](#src-bockle-appendix-2003), Lemma 2, p. 5: “then R is a complete intersection, finite flat over O.” — The lemma.

<a id="n-r24-3-bockle-minimal-r-equals-t"></a>
### Böckle's Theorem 1: an auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅

`R24.3/bockle-minimal-r-equals-t` · comparison · part R24.3

In the setting of Khare's Inventiones 154 (2003) paper, suppose that for some auxiliary set of primes Q the map R_Q → T_Q is an isomorphism of finite flat W(k)-algebras. Then the canonical map R_∅ → T_∅ of minimal rings is an isomorphism. This is NOT an unconditional lift-existence theorem: the presentation comes from GlobalGaloisDeformations R04 and the auxiliary R_Q ≅ T_Q from GL2ModularityLifting R22.

**Hypotheses and conventions.**

- R_Q → R_∅ is surjective, so finiteness of R_Q gives finiteness of R_∅
- T_Q and T_∅ are reduced and finite flat; the comparison is made on geometric points of the generic fibre

**Proof outline.**

1. Corollary 1 and Lemma 2 (R24.3/finite-presentation-complete-intersection): R_∅ and R_Q are complete intersections, finite flat over 𝒪.
2. Compare the diagram R_Q ≅ T_Q → R_∅ → T_∅ after ⊗K: a point of R_∅ ⊗ K not in T_∅ ⊗ K would be a form f ∈ M_Q ∖ M_∅ whose ρ_f is unramified at Q, contradicting Carayol's conductor theorem.

**Acceptance.**

- Check the role of reducedness of T_Q (the choice of Q) in the generic-fibre comparison
- Check that the argument uses Carayol's local-global compatibility at the primes of Q

**Ownership.** import from `GL2ModularityLifting:R22.3`: Auxiliary-to-minimal R=T is modularity-lifting algebra, consumed here as Böckle’s earlier input.

**Depends on.** this roadmap: [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation), [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection); other roadmaps' nodes: `GL2ModularityLifting:R22.3/minimal-ring-finite`, `AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `bockle_minimal_r_equals_t`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [bockle-appendix-2003](#src-bockle-appendix-2003), Theorem 1, p. 1: “of minimal rings is an isomorphism as well.” — The theorem.

<a id="n-r24-3-kw-annals-minimal-lifts"></a>
### Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)

`R24.3/kw-annals-minimal-lifts` · theorem · planet “Minimal lifts” · part R24.3

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type with p > 2, ρ̄|_{ℚ(µ_p)} absolutely irreducible, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p. Then ρ̄ has a lift that is minimally ramified at every prime; when k(ρ̄) = p + 1 it may be chosen of crystalline type (Hodge–Tate weights (0, p)) or of semistable type (weight 2). Proof: the minimal deformation ring R^univ has a presentation with r ≥ s (Böckle, Proposition 3.4), is finite over W (Proposition 3.8: Lemma 3.6 reduces finiteness to finiteness of the universal mod-p image, which follows from Taylor's potential modularity and Fujiwara's R = T over a totally real F), hence is finite flat and a complete intersection (Theorem 3.7), so it has a point in characteristic zero. This is the method suggested in the Remark in §5.2 of Khare–Ramakrishna, Finiteness of Selmer groups and deformation rings (Invent. Math. 154 (2003) 179–198, KW Annals' [27]; not Khare's paper with Böckle's appendix, which is [26]), which the subsequent KW II Theorem 5.1 generalises.

**Hypotheses and conventions.**

- k(ρ̄) ≠ p: at weight p neither the Fontaine–Laffaille local condition used for k(ρ̄) < p nor the R = T inputs of Proposition 3.8 (Fujiwara's ordinary theorem and Taylor's supersingular theorem) is available; KW Annals p. 242 apply those inputs 'as we are excluding weight p'
- at k(ρ̄) = p + 1 the crystalline local ring R_{p,crys} is formally smooth of dimension 1 (Böckle; KW Annals Proposition 3.5)
- the rationality of the lifts is not controlled
- the roadmap's pin 'KW Annals §5.2' is the Remark in §5.2 of [27] cited in KW Annals' introduction; the lifting argument itself is KW Annals §3

**Proof outline.**

1. Local rings: flat complete intersections of the right dimension (Ramakrishna, Taylor; R_{p,crys} by Proposition 3.5).
2. Proposition 3.4 (R24.3/bockle-presentation) and Lemma 3.6 (finiteness criterion).
3. Proposition 3.8: finiteness via potential modularity (R23) and R = T over F (R22).
4. Theorem 3.7 by R24.3/finite-presentation-complete-intersection, then a point.

**Acceptance.**

- Check that k(ρ̄) = p is really excluded and not merely unused
- Check the two types at k(ρ̄) = p + 1 against LocalGaloisDeformationRings R08.6/export-endpoint-weight

**Depends on.** this roadmap: [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation), [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection); layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/export-endpoint-weight`, `GL2ModularityLifting:R22.3/minimal-ring-finite`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `kw_annals_minimal_lifts`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-annals-2009](#src-kw-annals-2009), Theorem 3.3, printed p. 239: “is absolutely irreducible. We suppose that” — The theorem.
- [kw-annals-2009](#src-kw-annals-2009), Introduction, printed p. 231: “its proof) and its background. These are deduced from proving that a certain” — The method: finiteness then flatness.
- [kw-annals-2009](#src-kw-annals-2009), Introduction, printed p. 231: “This argument for producing minimal liftings has been suggested” — The pinned earlier input: the Remark in §5.2 of [27] = Khare–Ramakrishna 2003 (checkpoint 2 corrects an earlier attribution to Khare's paper [26]).
- [kw-annals-2009](#src-kw-annals-2009), Lemma 3.6, printed p. 241: “is finite if and only if” — The finiteness criterion.
- [kw-annals-2009](#src-kw-annals-2009), References, printed p. 252: “Finiteness of Selmer groups and deformation rings” — What "[27]" is.
- [kw-annals-2009](#src-kw-annals-2009), Proof of Proposition 3.8, printed p. 242: “as we are excluding weight p” — Why k(ρ̄) = p is excluded. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="n-r24-3-required-lift-types"></a>
### Lifts of required type (KW I Theorem 5.1 (1)–(4))

`R24.3/required-lift-types` · definition · planet “Lifts of required type” · part R24.3

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2, non-solvable image if p = 2, and ρ̄|_{ℚ(µ_p)} absolutely irreducible if p > 2. A lift ρ : G_ℚ → GL₂(𝒪′) of ρ̄ is of required type (i) if: (1) (k(ρ̄) = 2 when p = 2) ρ is minimally ramified at every ℓ ≠ p and crystalline of weight k(ρ̄) at p; (2) ρ has weight 2, is minimally ramified at ℓ ≠ p, and its inertial Weil–Deligne parameter at p is (ω_p^{k(ρ̄)−2} ⊕ 1, 0), or (id, N) with N ≠ 0 nilpotent when k(ρ̄) = p + 1 (k(ρ̄) = 4 if p = 2); (3) for an odd q ∥ N(ρ̄) with p | q − 1, ρ̄|_{I_q} = (χ ∗; 0 1): ρ is as in (2) at p and minimal at ℓ ≠ p, q, and ρ|_{I_q} ≅ (χ′ ∗; 0 1) for a character χ′ = ω_q^i (0 < i ≤ q − 2) lifting χ, with i even if p = 2; (4) for q ≠ p with ρ̄|_{D_q} ≅ (χ_p ∗; 0 1) up to unramified twist and p | q + 1: ρ is as in (2) at p and minimal at ℓ ≠ p, q, and ρ|_{I_q} ≅ χ′ ⊕ χ′^q for a level-2 character χ′ = ω_{q,2}^iω_{q,2}^{qj} of p-power order, with i + j even if p = 2. "Minimal" is in the sense of Diamond §3 (KW II §3.3.1 at p = 2). Lifts of required type are the 𝒪′-points of R̄^ψ_S for the corresponding local conditions (GlobalGaloisDeformations R04.6). In type (4), write 0≤j<i≤q−1, keep χ′ genuinely level two. KW display ρ|_{I_q} as (χ′ ∗; 0 χ′^q); since χ′ ≠ χ′^q the extension splits over I_q in characteristic zero, so the inertial type is χ′⊕χ′^q. The dyadic exceptional minimal case and automatic-minimality criterion at p∤q−1 are imported from R08.6.

**Hypotheses and conventions.**

- the parity conditions at p = 2 make the lift odd (Remark after KW I Theorem 5.1)
- in (4), characters χ′ of p-power order and level 2 exist unless p = 2 and v₂(q + 1) = 1
- if q ∥ N(ρ̄) and p ∤ q − 1, every geometric lift with q ∥ N(ρ) is minimal at q, so (3) needs p | q − 1
- the local condition at each place is one of LocalGaloisDeformationRings R08.6/kw-local-conditions

**Construction.**

1. Translate each type into local conditions: minimal (R08.6 inertia-rigid) away from p and q; (A), (B) or (C) at p; abelian with fixed inertial character (3) or non-abelian of level two (4) at q.
2. Identify the lifts with 𝒪′-points of R̄^ψ_S by R04.6/factorization-through-local-conditions.

**API.**

- `TauCeti.CompatibleSystems.RequiredLiftType` (structure): the case (1)–(4) with its auxiliary data (q, χ′) and the fixed character ψ
- `TauCeti.CompatibleSystems.RequiredLiftType.localCondition` (projection): the local condition X_v of LocalGaloisDeformationRings R08.6 at each v ∈ S
- `TauCeti.CompatibleSystems.RequiredLiftType.ring` (constructor): the ring R̄^ψ_S of GlobalGaloisDeformations R04.6 for these conditions
- `TauCeti.CompatibleSystems.RequiredLiftType.points_iff` (equivalence): 𝒪′-points of the ring ↔ lifts of the required type
- `TauCeti.CompatibleSystems.RequiredLiftType.det` (simp): every lift of the type has determinant ψχ_p

**Unit tests.**

- `type3_parity_p2` (non-example): p = 2, q = 5: χ′ = ω₅ has i = 1 odd and is excluded; ω₅² (i = 2) is allowed
- `type4_level_two_exists` (computation): p = 2: q = 7 has v₂(8) = 3 ≥ 2, so level-2 characters of 2-power order exist; q = 5 has v₂(6) = 1 and none exist
- `type2_steinberg` (degenerate): k(ρ̄) = p + 1: the inertial parameter is (id, N ≠ 0), a Steinberg type
- `type3_needs_p_divides` (non-example): p=3, q=5: 3∤4=q−1, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported R08.6 automatic-minimality criterion applies at q when p∤q−1.

**Acceptance.**

- Check that the determinant of a lift of each type is ψχ_p for the character ψ fixed by the type
- Check the existence condition for level-2 characters of 2-power order: v₂(q + 1) ≥ 2

**Used by.**

- [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline): type (1): minimal crystalline lifts
- [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two): type (2): weight-two lifts
- [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q): type (3): the level-one character at q
- [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q): type (4): the level-two (good-dihedral) character at q
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-insertion`: type (4) inserts a good dihedral prime
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`: types (2)–(4) in the weight recursion

**Depends on.** other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/kw-local-conditions`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; other roadmaps' layers: `AlgebraicModularFormsAndSerreWeights:R15.6`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.2`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `RequiredLiftType`; omitted signatures `localCondition`, `ring`, `points_iff`, `det`; test fragments `type3_parity_p2`, `type4_level_two_exists`, `type2_steinberg`, `type3_needs_p_divides`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1, p. 9 of the preprint: “and is crystalline of weight” — Type (1).
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1, p. 9 of the preprint: “with q an odd prime such that” — Type (3) begins.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1(4), p. 10 of the preprint: “and assume that” — Type (4) needs p | q + 1.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Remark after Theorem 5.1, p. 10: “except if p = 2 and r = 1.” — Existence of level-2 characters.

<a id="n-r24-3-theorem-5-1-part-1-minimal-crystalline"></a>
### KW I Theorem 5.1(1): minimal crystalline lifts

`R24.3/theorem-5-1-part-1-minimal-crystalline` · theorem · part R24.3

Under KW I Theorem 5.1's hypotheses on ρ̄, and k(ρ̄) = 2 if p = 2, ρ̄ has a lift of required type (1): minimally ramified at every prime ≠ p and crystalline of weight k(ρ̄) at p.

**Hypotheses and conventions.**

- at p = 2 only k(ρ̄) = 2 is allowed: type (A) at p = 2 is crystalline of weight 2 only
- k(ρ̄) = p is allowed here, unlike KW Annals Theorem 3.3: KW II's local rings include it

**Proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

**Acceptance.**

- Check the local condition at p is type (A) of weight k(ρ̄)
- Check minimality at every ℓ ≠ p is inertia-rigid

**Depends on.** this roadmap: [`R24.3/required-lift-types`](#n-r24-3-required-lift-types); layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)), [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/local-nonemptiness`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `theorem_5_1_part_1_minimal_crystalline`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1(1), p. 9 of the preprint: “and is crystalline of weight” — The statement.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.1, p. 92 of the preprint: “The existence of such points follows if we know that” — The existence argument.

<a id="n-r24-3-theorem-5-1-part-2-weight-two"></a>
### KW I Theorem 5.1(2): minimal weight-two lifts

`R24.3/theorem-5-1-part-2-weight-two` · theorem · part R24.3

Under KW I Theorem 5.1's hypotheses, ρ̄ has a lift of required type (2): weight 2, minimally ramified at ℓ ≠ p, with inertial Weil–Deligne parameter (ω^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (k(ρ̄) = 4 at p = 2).

**Hypotheses and conventions.**

- at p = 2 with k(ρ̄) = 4 the local condition is type (C): semistable non-crystalline of weight 2

**Proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

**Acceptance.**

- Check the (B)/(C) local condition at p according to k(ρ̄)
- Check that the lift is odd at p = 2

**Depends on.** this roadmap: [`R24.3/required-lift-types`](#n-r24-3-required-lift-types); layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)), [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/local-nonemptiness`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `theorem_5_1_part_2_weight_two`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1(2), p. 9 of the preprint: “and the inertial Weil-Deligne parameter at p is” — The statement.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.1, p. 92 of the preprint: “The existence of such points follows if we know that” — The existence argument.

<a id="n-r24-3-theorem-5-1-part-3-level-one-type-at-q"></a>
### KW I Theorem 5.1(3): a prescribed level-one type at q

`R24.3/theorem-5-1-part-3-level-one-type-at-q` · theorem · part R24.3

Under KW I Theorem 5.1's hypotheses, with q ∥ N(ρ̄) odd, p | q − 1 and χ′ = ω_q^i (i even if p = 2) lifting χ, ρ̄ has a lift of required type (3). If the residual representation ρ̄_q of the resulting system is irreducible, it has Serre weight i + 2 or q + 1 − i up to twist (R24.5/kw-theorem-5-1-systems).

**Hypotheses and conventions.**

- the local condition at q is abelian with fixed inertial character χ′ (LocalGaloisDeformationRings R08.6/export-away-from-p (b))

**Proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

**Acceptance.**

- Check that χ′ reduces to χ
- Check the parity condition at p = 2

**Depends on.** this roadmap: [`R24.3/required-lift-types`](#n-r24-3-required-lift-types); layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)), [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/local-nonemptiness`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`, `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `theorem_5_1_part_3_level_one_type_at_q`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1(3), p. 9 of the preprint: “with q an odd prime such that” — The statement.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.1, p. 92 of the preprint: “The existence of such points follows if we know that” — The existence argument.

<a id="n-r24-3-theorem-5-1-part-4-level-two-type-at-q"></a>
### KW I Theorem 5.1(4): a prescribed level-two type at q

`R24.3/theorem-5-1-part-4-level-two-type-at-q` · theorem · part R24.3

Under KW I Theorem 5.1's hypotheses, with ρ̄|_{D_q} ≅ (χ_p ∗; 0 1) up to unramified twist and p | q + 1, and a level-2 character χ′ = ω_{q,2}^iω_{q,2}^{qj} of p-power order (i + j even if p = 2), ρ̄ has a lift of required type (4). This is the construction that inserts a good dihedral prime (ClassicalSerreModularity R27.1).

**Hypotheses and conventions.**

- the local condition at q is non-abelian of level two with F_v = ℚ_q (LocalGaloisDeformationRings R08.6/export-away-from-p (b))
- such χ′ exist unless p = 2 and v₂(q + 1) = 1

**Proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

**Acceptance.**

- Check that the residual type at q is ρ̄|_{I_q}
- Check the parity condition at p = 2

**Depends on.** this roadmap: [`R24.3/required-lift-types`](#n-r24-3-required-lift-types); layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)), [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/local-nonemptiness`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`, `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `theorem_5_1_part_4_level_two_type_at_q`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1(4), p. 10 of the preprint: “and assume that” — The hypothesis p | q + 1.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.1, p. 92 of the preprint: “The existence of such points follows if we know that” — The existence argument.

<a id="n-r24-3-theorem-5-1-application-table"></a>
### Where the lifts of KW I Theorem 5.1 are used

`R24.3/theorem-5-1-application-table` · application · part R24.3

The applications, with the type used: KW I §8.1 (Theorem 3.1, killing ramification): (1). §8.2 (Theorem 3.2): mod 3 — (2) then (4) with χ′ = ω_{3,2}²; mod 5 — (2) then (3) with χ′ = ω₅², and then, for the residual member ρ̄′₅, (2) if 3 | N(ρ̄′₅) and (1) otherwise; inductive step — (2) then (3) with χ′ = ω_P^i for the i of §7, and then, for ρ̄′_P, (2) if p | N(ρ̄′_P) and (1) otherwise. §8.3 (Corollary 8.1): (1). §8.4 (Theorem 3.4): (2) then (4) at the good dihedral prime q. §9 (Theorem 9.1): (2), and (4) with the order-3 type at 2. KW Annals Theorem 3.3 is the minimal case (1) for k(ρ̄) ≠ p. The modern route uses Dieulefait–Pacetti Theorem 1.9: its cases (1)–(3) are the dyadic and odd-prime instances of KW I Theorem 5.1 (1) and (2), and its case (4), weight-two lifts with prescribed inertial types away from p, is due to Gee and Snowden (R24.3/modern-prescribed-type-lifts).

**Hypotheses and conventions.**

- each application must check the hypotheses of its type before requesting a global point: the residual shape at q, p | q ± 1, and the parity at p = 2

**Proof outline.**

1. Tabulate from KW I §§8–9 and Dieulefait–Pacetti §§1–2.

**Acceptance.**

- Check each row's local hypotheses in the consuming node of ClassicalSerreModularity
- Check that no application needs a type not listed in R24.3/required-lift-types

**Depends on.** this roadmap: [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q), [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `theorem_5_1_application_table`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [dieulefait-pacetti](#src-dieulefait-pacetti), Proof of Theorem 1.9, p. 6 of the arXiv version: “The ﬁrst three cases are due to Khare-Wintenberger ([KW09b, Theorem 5.1], its proof given in [KW09c]). Partial results of the last case are also proven in Khare-Wintenberger’s article (same Theorem), the more general case is due to Gee and Snowden ([Gee11]; [Sno09, Theorem 7.2.1]).” — The modern route's attribution.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §8.2, pp. 13–15 of the preprint: “In the case of (ii) we use Theorem 5.1 (1) to get an almost strictly compatible lift” — The sub-cases of the mod 5 and inductive steps use types (2) and (1). (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="n-r24-3-modern-prescribed-type-lifts"></a>
### Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)

`R24.3/modern-prescribed-type-lifts` · theorem · part R24.3

Let p be an odd prime (Snowden's standing convention, §1.4), F totally real and ρ̄ : G_F → GL₂(𝔽̄_p) odd with (A1) ρ̄|_{G_{F(ζ_p)}} absolutely irreducible and (A2) if p = 5 and the projective image is PGL₂(𝔽₅) then [F(ζ₅) : F] = 4. For a lifting problem P = (Σ, ψ, t, {τ_v}) — Σ containing the ramified places and those above p, ψ of finite order with det ρ̄ = ψ̄χ̄_p, a definite type t(v) and an inertial type τ_v at each v ∈ Σ — there are finitely many solutions (weight-two lifts with these data), and a solution exists iff a local solution exists (Theorem 7.2.1). If t is a definite type function on Σ′ ⊆ Σ compatible with ρ̄, then ρ̄ has a weight-two lift unramified outside Σ with determinant ψχ_p and type t on Σ′ (Theorem 7.6.1). Over F = ℚ, (A2) is automatic, and this gives Dieulefait–Pacetti Theorem 1.9(4) (crystalline at p if k(ρ̄) = 2, Steinberg if k(ρ̄) = p + 1). It is used only by the modern route.

**Hypotheses and conventions.**

- nonemptiness of the local type must be proved before a global point is requested: here, the local solution; Snowden proves every residual local representation has a lift of some definite type with the same conductor (Proposition 7.7.1)
- "inertial type" forgets the monodromy operator; "type" records it (Snowden §7.1)
- the finiteness input is the analogue of R24.1 (potential modularity with R = T)
- Dieulefait–Pacetti call an inertial type τ_ℓ compatible with ρ̄ when some lattice of τ_ℓ reduces to ρ̄|_{I_ℓ}; Snowden's Theorem 7.2.1 needs a local solution, a lift of ρ̄|_{G_{F_v}} of inertial type τ_v and definite type. DP do not argue the passage from the first to the second; it belongs with the local nonemptiness requested from LocalGaloisDeformationRings R08.6 (Snowden Proposition 7.7.1 supplies some definite-type lift of the same conductor, not one of a prescribed inertial type)

**Proof outline.**

1. Snowden Theorem 6.1.1 (finiteness of the global ring with the chosen local rings) and the local rings of definite type (Propositions 7.3.1, 7.4.1).
2. A local solution makes the local rings nonzero; a global point of R† is a solution.

**Acceptance.**

- Check (A2) over ℚ: [ℚ(ζ₅) : ℚ] = 4
- Check that DP Theorem 1.9(4)'s "compatible inertial type" is Snowden's local solution condition

**Depends on.** layers of this roadmap: [R24.1](#layer-r24-1) (see [Cross-part prerequisites](#cross-part-prerequisites)), [R24.2](#layer-r24-2) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; other roadmaps' layers: `LocalGaloisDeformationRings:R08.6`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/PrescribedLifts`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `modern_prescribed_type_lifts`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [snowden-2009](#src-snowden-2009), Theorem 7.2.1, p. 21 of arXiv:0905.4266v1: “A solution exists if and only if a local solution exists.” — The theorem.
- [dieulefait-pacetti](#src-dieulefait-pacetti), Theorem 1.9(4), p. 6 of the arXiv version: “any inertial type” — The form DP use.
- [snowden-2009](#src-snowden-2009), §1.4, notation, p. 3 of arXiv:0905.4266v1: “The letter p always denotes an odd prime.” — p is odd throughout. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="layer-r24-4"></a>
## R24.4 — The full KW modularity-lifting interface

*Coverage in the R24.3 part: planned. 2 nodes, 0 planets.*

An import layer. KW I Theorem 4.1, modularity lifting over ℚ for p = 2 (crystalline or semistable of weight 2) and for p > 2 (crystalline of weight 2 ≤ k ≤ p + 1, or potentially semistable of weight 2), is proved in GL2ModularityLifting R22.5 and R22.6 from KW II Theorem 9.7. This layer states the interface consumers cite, and the step from "ρ̄ modular" to the residual hypotheses (α), (β) through the weight part of Serre's conjecture (Gross, Coleman–Voloch, from SerreWeightAndLevelOptimisation R20.6) and an allowable base change. Neither node uses R24.1–R24.3.

**Still open in this layer.**

- Obtain the full KW I Theorem 4.1(2) export from R22.5, including endpoint residual-weight-two and general potentially semistable weight-two cases; residual Serre-weight supplier requests remain.

<a id="n-r24-4-alpha-beta-from-residual-modularity"></a>
### From "ρ̄ modular" to the residual hypotheses (α) and (β)

`R24.4/alpha-beta-from-residual-modularity` · comparison · part R24.3

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, with KW I Theorem 4.1's image hypotheses. Then ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) for some N prime to p and from S₂(Γ₁(Np)) (weight part of Serre's conjecture: Gross's Theorem 13.10, Coleman–Voloch, and Gross's Propositions 8.13 and 8.18); so after an allowable base change F/ℚ (solvable, totally real, unramified or split at p as required), ρ̄|_{G_F} satisfies (α) and (β) for p > 2, and (α) when p = k(ρ̄) = 2 and (β) for p = 2.

**Hypotheses and conventions.**

- the hypothesis N > 4 of Gross may be assumed, since the level need not be optimal
- for k = p KW II do not need Gross (see the Remark in §10.2)
- these are exactly the residual inputs of GL2ModularityLifting R22.5/R22.6 (Theorem 9.7)

**Proof outline.**

1. Bind the residual-weight/base-change and lifting exports of GL2ModularityLifting to the displayed KW I Theorem 4.1 hypotheses. Do not construct a new lifting proof in R24.4.
2. The consumer passes a supplied lift to the owner’s theorem; no R24.1, R24.2 or R24.3 theorem is an input.

**Acceptance.**

- Check the p = 2 cases: (α) only when k(ρ̄) = 2, (β) for k(ρ̄) = 2 and 4
- Check that the base change keeps ρ̄|_{G_F(µ_p)} absolutely irreducible (resp. non-solvable at p = 2)

**Ownership.** import from `GL2ModularityLifting:R22.5`: Confirmed RT-AREA-langlands-2/12: KW II §10.2 uses earlier lifting and residual Serre-weight results, not Theorem 10.1 or global lift existence.

**Depends on.** other roadmaps' nodes: `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; other roadmaps' layers: `SerreWeightAndLevelOptimisation:R20.6`, `AlgebraicModularFormsAndSerreWeights:R15.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/LiftingInterface`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `alpha_beta_from_residual_modularity`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.2, p. 92 of the preprint: “by the weight part of Serre’s conjecture proven in Theorem 13.10” — The residual hypotheses from modularity.

<a id="n-r24-4-kw-theorem-4-1"></a>
### KW I Theorem 4.1: modularity lifting over ℚ

`R24.4/kw-theorem-4-1` · comparison · part R24.3

Let ρ̄ : G_ℚ → GL₂(𝔽) be modular, with non-solvable image if p = 2 and ρ̄|_{ℚ(µ_p)} absolutely irreducible if p > 2. (1) (p = 2) An odd, finitely ramified 2-adic lift ρ that is crystalline of weight 2 at 2, or semistable of weight 2 at 2 (only when k(ρ̄) = 4), is modular. (2) (p > 2) A finitely ramified p-adic lift that is (i) crystalline of weight k with 2 ≤ k ≤ p + 1, or (ii) potentially semistable of weight 2 at p, is modular. Proof: (α), (β) from R24.4/alpha-beta-from-residual-modularity; after an allowable base change F/ℚ, ρ|_{G_F} satisfies the lifting data (A), (B) or (C) and Theorem 9.7 (GL2ModularityLifting R22.5 for p > 2, R22.6 for p = 2) makes it modular; solvable descent (Langlands) returns to ℚ.

**Hypotheses and conventions.**

- p = 2: non-solvable image, and the semistable case only in residual weight 4
- p > 2: cyclotomic absolute irreducibility, and the crystalline weight interval 2 ≤ k ≤ p + 1 or potentially semistable weight 2
- several cases were known before (Diamond–Flach–Guo for k ≤ p − 1; Kisin for k = p + 1 non-ordinary and for potentially Barsotti–Tate; Diamond, Wiles and Taylor–Wiles for semistable weight 2; Dickinson partially at p = 2); KW II need only 4.1(1) and 4.1(2)(i) at k = p

**Proof outline.**

1. Bind the residual-weight/base-change and lifting exports of GL2ModularityLifting to the displayed KW I Theorem 4.1 hypotheses. Do not construct a new lifting proof in R24.4.
2. The consumer passes a supplied lift to the owner’s theorem; no R24.1, R24.2 or R24.3 theorem is an input.

**Acceptance.**

- Check that the potentially semistable weight-2 case at p > 2 is covered by (B) or (C) after base change
- Check that at p = 2 the semistable case requires ρ̄ not finite at 2
- Odd-prime crystalline endpoint k=p+1 with residual weight 2 and general potentially semistable weight-two input must be supplied by the full R22.5 interface, not inferred from the narrower existing Theorem 9.7 node.

**Ownership.** import from `GL2ModularityLifting:R22.5 and R22.6`: Confirmed RT-AREA-langlands-2/12: KW II §10.2 uses earlier lifting and residual Serre-weight results, not Theorem 10.1 or global lift existence.

**Depends on.** this roadmap: [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity); other roadmaps' nodes: `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/LiftingInterface`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `kw_theorem_4_1`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 4.1, p. 7 of the preprint: “outside a finite set of primes and is either” — Case (2).
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.2, p. 92 of the preprint: “by results of Berger-Li-Zhu” — The earlier cases.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.2, p. 92 of the preprint: “by results of Berger-Li-Zhu” — The derivation.

<a id="layer-r24-5-operations"></a>
## R24.5:operations — general systems before existence theorems

*Coverage in the R24.3 part: planned. 22 nodes, 6 planets.*

Under RS-12 this sub-layer owns the general theory of compatible systems: the carriers, their predicates and operations, and the structure theorems that hold for any system. Its 22 nodes depend on no other layer of this roadmap and on no eigenform, potential-modularity or potential-automorphy theorem; AutomorphicGaloisRepresentations R19.3 and AutomorphicGaloisRepresentationsPartII AG2.6 construct instances of these carriers.

- **Carriers.** The rank-n weakly compatible system (M, S, {Q_v}, {r_λ}, {H_τ}) of BLGGT §5.1, with actual continuous semisimple members r_λ, common good Frobenius polynomials and labelled Hodge–Tate multisets; its very weak and extremely weak variants (Allen et al., §7.1), where the Hodge condition constrains only the determinant; and the two-dimensional Khare–Wintenberger family with Weil–Deligne data r_q and weights (a, b), with plain, almost strict and strict compatibility as separate predicates. The predicates on weak systems are regular, extremely regular, totally odd, essentially conjugate self-dual, irreducible, strictly compatible, pure, strictly pure and automorphic.
- **Operations.** Direct sums, tensor products, duals, symmetric and exterior powers, with their Frobenius polynomials, Hodge multisets and weights; twisting, restriction and induction, member by member and on Weil–Deligne parameters. What each preserves is stated, and so is what it does not: regularity and irreducibility are not preserved by sums, tensors or induction, and no operation is claimed to preserve cuspidal automorphy. The virtual Brauer combination is a class in the representation ring, not yet a representation.
- **Polarized systems.** A polarization is data, a perfect pairing with sign and multiplier for every member, imported from ArithmeticGaloisRepresentations G7; forgetting it keeps only essential self-duality. Duals, tensors (with the quadratic correction δ_{F/F⁺} in the multiplier), powers, twists, restriction and induction carry explicit signs and multipliers.
- **Invariants and structure.** Partial and completed L-functions with BLGGT v4's Γ- and ε-factors (local factors from EndoscopicTransferAndUnitaryTraceComparison ET.6); the Grothendieck ring of semisimple ℓ-adic representations with its pairing, restriction, induction and Brauer induction; the common component field of the monodromy groups; Larsen's algebraic groups, Serre's θ_l with bounds uniform in l, and a density-one set of good primes; residual irreducibility over F(ζ_l) for a density-one set of primes; descent of constituents of an essentially conjugate self-dual system to a CM field; independence of λ for absolute reducibility of rank-two systems over ℚ.
- **Characters, Artin representations and purity.** The rank-one systems of algebraic Hecke characters, with Hecke characters from upstream GlobalNumberFields Layers 9–10 and reciprocity from ClassFieldTheory Layers 11–12; Artin systems; and purity of character systems, of systems induced from characters and of Artin systems up to twist. Purity is asserted only with the canonical Hodge data; freely chosen higher-rank Hodge multisets with the right determinant sum need not be pure (source issue E4 of the R24.3 part).

**Still open in this layer.**

- Resolve arithmetic continuity, Hodge–Tate, perfect polarization, Hecke-character and monodromy supplier interfaces.
- Read and transcribe the Larsen–Pink/Larsen/Bogomolov/Serre/Conrad–Chai–Oort/Bruhat–Tits proof leaves named in gaps.
- Extend the suggested signatures for WD, density, algebraic monodromy, and local constants when the supplier types can be stated; current omissions are explicit.

<a id="n-r24-5-compatible-system"></a>
### Compatible systems: strict, almost strict, and plain

`R24.5/compatible-system` · definition · part R24.3

For number fields F and E, the two-dimensional E-rational family stores continuous semisimple members ρ_ι of G_F for every prime ℓ and embedding ι:E↪Q̄_ℓ, Frobenius-semisimple WD data r_q over E for every finite q (unramified for almost all q), and integers a≥b. Plain compatibility requires WD comparison at q∤ℓ and crystallinity with Hodge–Tate numbers (a,b) at coefficient places for sufficiently large ℓ. KW strict compatibility requires every member to be geometric of these Hodge–Tate numbers and WD(ρ_ι|D_q)^Fss≅ιr_q at every q, including q|ℓ via Fontaine. An almost strictly compatible system is a plain compatible system (so in particular crystalline of weights (a,b) at coefficient places for ℓ ≫ 0) that satisfies in addition, at q above the coefficient prime, only these clauses: if the semisimplified residual member is irreducible, it is geometric of weights (a,b) with full WD comparison; if ℓ≠2 and r_q is unramified, the local member is crystalline of these weights. Regularity is a≠b. No all-member de Rham condition is imposed on a plain or almost-strict carrier. Dieulefait–Pacetti Definition 1.10 uses a rank-two five-tuple; compare it after matching coefficient embeddings and both normalizations. Its almost strict systems also require every member to be de Rham at its coefficient prime (condition (4)), which KW's almost-strict definition does not.

**Hypotheses and conventions.**

- the local predicates (strict, almost strict, plain) are kept separate; almost strictness gives no Weil–Deligne information at 𝔮 | ℓ when ρ̄_ι is reducible and r_𝔮 is ramified
- rank 2 here; the general rank-n and polarised versions are the operations sub-layer's generalisation

**Construction.**

1. Definitions only; the existence theorems are R24.5.

**API.**

- `TauCeti.CompatibleSystems.CompatibleSystem` (structure): E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)
- `TauCeti.CompatibleSystems.CompatibleSystem.IsStrict` (data): compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ
- `TauCeti.CompatibleSystems.CompatibleSystem.IsAlmostStrict` (data): the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)
- `TauCeti.CompatibleSystems.CompatibleSystem.IsRegular` (data): a ≠ b
- `TauCeti.CompatibleSystems.CompatibleSystem.IsStrict.isAlmostStrict` (relation): strict ⇒ almost strict ⇒ compatible
- `TauCeti.CompatibleSystems.CompatibleSystem.enlargeCoefficients` (functoriality): Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.

**Unit tests.**

- `newform_is_strict` (compatibility): Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5.
- `weight_one_irregular` (degenerate): a weight-one newform gives an irregular system, a = b = 0
- `almost_strict_not_strict` (non-example): The almost-strict contract permits no WD conclusion at q=ℓ with reducible residual member and ramified r_q. This is a logical nonimplication of the contract, not a claim that the particular geometrically constructed systems fail strictness.
- `hodge_tate_weights_convention` (compatibility): weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0)

**Acceptance.**

- Check that a newform of weight k ≥ 2 gives a strictly compatible system (Deligne, Carayol, Saito)
- Check that the almost strict predicate is strictly weaker: it says nothing at 𝔮 = ℓ when ρ̄_ι is reducible and r_𝔮 is ramified

**Used by.**

- [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system): the object constructed
- [`R24.6/residual-members`](#n-r24-6-residual-members): change of residual characteristic
- `ClassicalSerreModularity:R33.1/paso-1-weight-two-system`: the systems propagated in the modern route
- `ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification`: the systems of KW I

**Depends on.** other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.1`; libraries: `mathlib:Representation`, `mathlib:Field.absoluteGaloisGroup`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `CompatibleSystem`, `IsRegular`; omitted signatures `IsStrict`, `IsAlmostStrict`, `isAlmostStrict`, `enlargeCoefficients`; test fragments `weight_one_irregular`, `almost_strict_not_strict`, `hodge_tate_weights_convention`; omitted tests `newform_is_strict`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §5, p. 7 of the preprint: “For a number field E” — Strict compatibility.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §5, p. 8 of the preprint: “for which (ii) b) is known to be true” — Almost strict compatibility.
- [dieulefait-pacetti](#src-dieulefait-pacetti), Definition 1.10 and after, p. 7 of the arXiv version: “then we only impose the compatibility as in condition (6)” — DP's version.

<a id="n-r24-5-system-operations"></a>
### Twisting, restriction and induction of compatible systems

`R24.5/system-operations` · construction · part R24.3

Given systems, construct character twists, finite base-field restrictions and finite-extension inductions by applying the arithmetic representation operations member by member and their WD/Hodge operations locally. Plain compatibility is preserved after enlarging S; all-place strict compatibility is preserved for de Rham systems, with Q and H transported accordingly. For induction include primes ramified in the extension in S and take at a local place the sum of local induced WD parameters. For almost-strict systems, the unconditional output is plain: to retain almost strictness one must check that every newly irreducible residual output member falls in a source coefficient-prime comparison case and that every required unramified coefficient output is crystalline of the transported weights. Twisting by a strict character preserves the rank-two residual irreducibility test; arbitrary induction/restriction may change it. The virtual Brauer combination is a class in the representation ring, not yet a representation.

**Hypotheses and conventions.**

- strict compatibility at 𝔮 | ℓ is preserved by (i)–(iii) because Weil–Deligne parameters of de Rham representations commute with twisting, restriction and induction (PadicHodgeTheory R06.3)
- this layer takes a system as input and does not assume R24.5's two-dimensional existence theorem

**Construction.**

1. Local-global compatibility of each operation with Weil–Deligne parameters (ArithmeticGaloisRepresentations R01.2, PadicHodgeTheory R06.3).
2. Recognition by Frobenius polynomials (ArithmeticGaloisRepresentations R01.5) for (iv).

**API.**

- `TauCeti.CompatibleSystems.twist` (constructor): Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.
- `TauCeti.CompatibleSystems.restrict` (constructor): Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.
- `TauCeti.CompatibleSystems.induce` (constructor): For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
- `TauCeti.CompatibleSystems.restrict_charpoly` (compatibility): At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.
- `TauCeti.CompatibleSystems.induce_rank` (compatibility): Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.

**Unit tests.**

- `twist_cyclotomic` (computation): Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2.
- `restrict_trivial_extension` (degenerate): For F′=F restriction returns the same members, Q and H.
- `induce_quadratic_trivial` (computation): Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes.
- `induced_regular_nonexample` (non-example): The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.

**Acceptance.**

- Check that Ind of a rank-2 system from a quadratic field has rank 4 and Hodge–Tate weights doubled in multiplicity
- Check that restriction of an irreducible system induced from K to G_K is reducible

**Used by.**

- [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system): Build the twist and induction summands in a virtual class.
- [`R24.5/induced-character-purity`](#n-r24-5-induced-character-purity): Transport the canonical induced Hodge data and Frobenius roots.

**Depends on.** this roadmap: [`R24.5/compatible-system`](#n-r24-5-compatible-system); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:G7`; libraries: `mathlib:Representation.ind`, `mathlib:Representation.dual`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `twist`; omitted signatures `restrict`, `induce`, `restrict_charpoly`, `induce_rank`; test fragments `twist_cyclotomic`, `restrict_trivial_extension`, `induce_quadratic_trivial`, `induced_regular_nonexample`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93 of the preprint: “Using Brauer’s theorem we get subextensions” — The operations used: induction, twist, restriction.

<a id="n-r24-5-weakly-compatible-system-rank-n"></a>
### Rank-n weakly compatible systems of l-adic representations

`R24.5/weakly-compatible-system-rank-n` · definition · planet “Weakly compatible systems” · part R24.3

Let F be a number field. A rank n weakly compatible system of l-adic representations ℛ of G_F defined over M is a 5-tuple (M, S, {Q_v(X)}, {r_λ}, {H_τ}): M a number field; S a finite set of primes of F; for each prime v ∉ S a monic degree-n Q_v(X) ∈ M[X]; for each prime λ of M (residue characteristic l) a continuous semisimple r_λ : G_F → GL_n(M̄_λ) such that for v ∉ S with v ∤ l, r_λ is unramified at v and r_λ(Frob_v) has characteristic polynomial Q_v(X), and for v | l, r_λ|_{G_{F_v}} is de Rham, and crystalline if v ∉ S; and for each τ : F ↪ M̄ a multiset H_τ of n integers with HT_τ(r_λ) = H_τ for every M̄ ↪ M̄_λ over M. Rank 1 systems are weakly compatible systems of characters. Over ℚ this is Taylor's 'rank d weakly compatible system' with Hodge numbers {n_1, …, n_d} (Documenta 2006, p. 773), who asks only for crystallinity at l ∉ S and Hodge–Tate numbers at every λ. The rank-2 systems of R24.5/compatible-system (Khare–Wintenberger, Dieulefait–Pacetti) carry Weil–Deligne data r_𝔮 at every prime and are compared with these through R24.5/compatible-system-predicates ('strictly compatible').

**Hypotheses and conventions.**

- RS-12: this node is the common carrier; it contains representations at the coefficient places, not only common traces, and the weak, almost-strict and strict conditions stay separate predicates
- M-rationality of Frobenius polynomials and independence of the Hodge–Tate multisets are part of the data, not theorems

**Construction.**

1. Assemble the five-tuple from actual continuous semisimple members supplied by R01.1. The defining axioms include common good-place characteristic polynomials and coefficient-place de Rham/crystalline and Hodge conditions.
2. This carrier has no eigenform, potential-modularity or potential-automorphy prerequisite. The eigenform construction is an R19.3 instance importing this definition.

**API.**

- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem` (structure): (M, S, Q_v, r_λ, H_τ) with the compatibility conditions.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.rank` (projection): The rank n.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.charpoly_frob` (characterisation): For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.deRham` (characterisation): r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.ofCompatibleSystem` (coercion): Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.enlargeRamificationSet` (functoriality): For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.

**Unit tests.**

- `wcs_cyclotomic` (computation): With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial.
- `wcs_newform_delta` (computation): Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention.
- `wcs_not_just_traces` (non-example): Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves.
- `wcs_S_enlarge` (compatibility): Enlarging S gives an equivalent system (fewer polynomials, same representations).

**Acceptance.**

- Frobenius-polynomial recognition (ArithmeticGaloisRepresentations R01.5) identifies each r_λ only up to isomorphism: it gives no canonical basis or lattice (RS-12 uniqueness contract).
- Check the comparison with KW systems only when the additional de Rham/crystalline hypotheses hold; the strict systems constructed below satisfy them after enlarging S.

**Used by.**

- [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates): the predicates are properties of this carrier.
- [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems): the operations act on it.
- `AutomorphicGaloisRepresentations:R19.3`: the eigenform family instance (RS-12).
- `AutomorphicGaloisRepresentationsPartII:AG2.6`: the higher-rank instances (RS-12).

**Depends on.** other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`, `PadicHodgeTheory:R06.2`; libraries: `mathlib:Representation`, `mathlib:Field.absoluteGaloisGroup`, `mathlib:LinearMap.charpoly`, `mathlib:NumberField.FinitePlace`, `mathlib:NumberField.FinitePlace.embedding`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `WeaklyCompatibleSystem`, `rank`, `ofCompatibleSystem`, `enlargeRamificationSet`; omitted signatures `charpoly_frob`, `deRham`; test fragments `wcs_cyclotomic`, `wcs_newform_delta`, `wcs_not_just_traces`, `wcs_S_enlarge`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.1, definition of a weakly compatible system, p. 51 (arXiv v1; printed page = PDF page): “We will refer to a rank 1 weakly compatible system of representations as a weakly compatible system of characters.” — The 5-tuple (M, S, {Q_v}, {r_λ}, {H_τ}), displayed above this sentence.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §6, rank d weakly compatible systems over ℚ, p. 773 (PDF page 45): “By a rank d weakly compatible system of l-adic representations” — Taylor's version over ℚ with Hodge numbers.

<a id="n-r24-5-monodromy-component-field"></a>
### The common component field of a compatible system

`R24.5/monodromy-component-field` · theorem · planet “Common monodromy component field” · part R24.3

Let ℛ be a weakly compatible system of G_F. With G_λ the Zariski closure of r_λ(G_F), there is one finite Galois F¹/F inducing Gal(F¹/F)≅G_λ/G_λ⁰ for every λ. If ℛ is regular, every irreducible subrepresentation under any open subgroup has multiplicity one, and after a single finite coefficient-field extension every such subrepresentation is defined over M_λ with a stable O_{M,λ}-lattice. No canonical lattice is selected.

**Proof outline.**

1. Import Larsen–Pink Proposition 6.14/Serre for the common component field (recorded gap).
2. Sen’s theorem gives distinct weights on a maximal torus of connected monodromy; hence regular constituents have multiplicity one.
3. Choose good Frobenius elements with distinct eigenvalues and enlarge the coefficient field by their two splitting fields at different residue characteristics. Apply BLGGT Lemma A.1.5: a semisimple characteristic-zero representation with traces in M and one element having distinct M-rational eigenvalues is defined over M. Its trace-pairing/Wedderburn proof is supplied by R01.5, consuming upstream SemisimpleAlgebras Layers 1–2. Compactness then gives a stable lattice for each constituent, with no canonical choice.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' layers: `ArithmeticGaloisRepresentations:G7`, `ArithmeticGaloisRepresentations:R01.5`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `monodromy_component_field`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), Lemma 5.3.1, pp.70–71: “Suppose that R is a weakly compatible system” — Common component field, multiplicity one, and uniform coefficient extension; v1 Lemma 5.2.1 only states the first part.
- [blggt-2014-v4](#src-blggt-2014-v4), Appendix A.1 Lemma A.1.5, p.85: “rational roots. Then r is conjugate to a representation” — The coefficient-descent criterion used in Lemma 5.3.1; its split-eigenvalue hypothesis removes the descent obstruction.

<a id="n-r24-5-larsen-rational-system-groups"></a>
### The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)

`R24.5/larsen-rational-system-groups` · construction · part R24.3

For each l: G_l the Zariski closure of r_l(G_F) in GL_n/Q_l, G⁰_l its identity component (reductive), Γ_l = r_l(G_F) ⊆ G_l(Q_l) (open, by Bogomolov), Γ⁰_l = Γ_l ∩ G⁰_l(Q_l); F⁰/F finite Galois with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for all l (Larsen–Pink 6.14); Z_l and G^der_l the centre and derived group of G⁰_l, G^ad_l = G⁰_l/Z_l, C_l = G⁰_l/G^der_l, G^sc_l the simply connected cover of G^ad_l, H_l = G^sc_l × Z_l ↠ G⁰_l; a constant A(n) with #ker(G^sc_l → G^ad_l) | A(n); Γ^Z_l = Γ⁰_l ∩ Z_l(Q_l), Γ^C_l the image of Γ⁰_l in C_l(Q_l) (open), Γ⁰⁰_l = Γ⁰_l ∩ Im(H_l(Q_l)), Γ^H_l its preimage in H_l(Q_l); a maximal torus T_l (unramified when G⁰_l is), with X*(T^ad) ⊆ X*(T^der) ⊆ X*(T^sc) ⊆ (1/A(n))X*(T^ad); a constant B(n) bounding the coordinates of weights of G^sc_l on V_l; and Serre's θ_l : S_{F⁰,l} → C_l agreeing with (r_l mod G^der_l) ∘ Art_{F⁰} on an open subgroup of O_{F⁰,l}^×.

**Hypotheses and conventions.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Construction.**

1. The kernels of Γ^H_l → Γ⁰_l and Γ^Z_l → Γ^C_l have order dividing A(n); their cokernels have order dividing A(n)³ and exponent dividing A(n) (H¹ of a finite central kernel, local Euler characteristic).
2. A(n), B(n) depend only on n because dim G^ad_l and dim V_l are bounded by n.
3. θ_l: Serre, Abelian l-adic representations III.1.2 and III.2.1, applied to r_l mod G^der_l (cited).

**API.**

- `TauCeti.CompatibleSystems.LarsenData.G` (data): G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.
- `TauCeti.CompatibleSystems.LarsenData.componentField` (data): F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.
- `TauCeti.CompatibleSystems.LarsenData.gammaH` (constructor): Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.
- `TauCeti.CompatibleSystems.LarsenData.A` (other): A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.
- `TauCeti.CompatibleSystems.LarsenData.theta` (constructor): θ_l : S_{F⁰,l} → C_l.

**Unit tests.**

- `torus_case` (degenerate): CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l.
- `gl2_case` (computation): For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted.
- `finite_image` (degenerate): An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial.
- `theta_bound_depends_on_system` (non-example): A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|.

**Acceptance.**

- Check the torus case: if G⁰_l is a torus then G^der_l = 1, C_l = G⁰_l, H_l = Z_l, and θ_l is Serre's homomorphism for an abelian representation.

**Used by.**

- [`R24.5/serre-theta-uniform-bounds`](#n-r24-5-serre-theta-uniform-bounds): the objects bounded
- [`R24.5/larsen-good-primes`](#n-r24-5-larsen-good-primes): the objects with good integral models

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field); other roadmaps' layers: `ArithmeticGaloisRepresentations:G7`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Larsen`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `G`, `componentField`, `gammaH`, `A`, `theta`; omitted tests `torus_case`, `gl2_case`, `finite_image`, `theta_bound_depends_on_system`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), §5.2, pp. 65–66 (arXiv v4): “In this section we present a formulation of the results of Larsen” — The setup of §5.2 through the construction of θ_l.

<a id="n-r24-5-serre-theta-uniform-bounds"></a>
### Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)

`R24.5/serre-theta-uniform-bounds` · lemma · part R24.3

(1) θ_l : S_{F⁰,l} → C_l is surjective. (2) If l ∉ S then θ_l = (r_l mod G^der_l) ∘ Art_{F⁰} on all of O_{F⁰,l}^×. (3) There is C(ℛ), independent of l, such that for every weight µ ∈ X*(Z_l) of Z_l on V_l, (A(n)µ) ∘ θ_l = Σ_σ m_{µ,σ}σ with |m_{µ,σ}| < C(ℛ). (4) There is D(ℛ) with #(X*(S_{F⁰,l})/θ_l*X*(C_l))_tor ≤ D(ℛ).

**Hypotheses and conventions.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Proof outline.**

1. (1): on an open U ⊆ O^× where θ_l agrees with the Galois side, the image is open, hence of finite index in the Zariski-dense image of G_{F⁰}; C_l is connected.
2. (2): for l ∉ S, r_l mod G^der_l is crystalline at l, and Conrad–Chai–Oort Proposition 6.3 extends the agreement to all of O^× (cited).
3. (3): −m_{µ,σ} is a Hodge–Tate number of (A(n)µ) ∘ (r_l mod G^der_l) (printed "mod G⁰_l", see PotentialModularityAndCompatibleSystems/E3); Wintenberger's ν_{HT,v} gives Hodge–Tate numbers as pairings ⟨µ, ν_{HT,v}⟩, bounded because the Hodge–Tate numbers of ℛ do not depend on l and roots are differences of weights.
4. (4) from (3).

**Acceptance.**

- Check (2) on the cyclotomic character: θ_l is the identity on 𝔾_m and agrees with ε_l ∘ Art on all of ℤ_l^× (ε_l crystalline).

**Depends on.** this roadmap: [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Larsen`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `serre_theta_uniform_bounds`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4): “is surjective” — Lemma 5.2.1 (1)–(4) and its proof.

<a id="n-r24-5-larsen-good-primes"></a>
### Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)

`R24.5/larsen-good-primes` · theorem · part R24.3

There is a set L of rational primes of Dirichlet density 1 such that for l ∈ L: (1) G⁰_l, hence Z_l, C_l, G^sc_l and H_l, are unramified (tori Z̃_l, C̃_l over ℤ_l); (2) there is a semisimple group scheme G̃^sc_l/ℤ_l with generic fibre G^sc_l and Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l (put H̃_l = G̃^sc_l × Z̃_l); (3) [Z̃_l(ℤ_l) : Γ^Z_l] is bounded independently of l; (4) the conjugation action of Γ_l on H_l extends uniquely to H̃_l, making V_l an H̃_l ⋊ Γ_l-module; (5) V_l contains an H̃_l ⋊ Γ_l-invariant ℤ_l-lattice; (6) there is an unramified M_λ/Q_l of bounded degree over which the G^sc_l-irreducible subquotients of V_l ⊗ Q̄_l are defined; for V_l ⊗ M_λ = ⊕V_{λ,i} (isotypic parts) and any H̃_l-invariant O_{M_λ}-lattice Λ, Λ = ⊕(Λ ∩ V_{λ,i}), and all irreducible G̃^sc_l(ℤ_l)-subquotients of Λ ∩ V_{λ,i} are absolutely irreducible, isomorphic to ρ̄_i, of dimension that of an irreducible constituent of V_{λ,i}, with ρ̄_i ≅ ρ̄_j only if i = j.

**Hypotheses and conventions.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Proof outline.**

1. (1): Larsen–Pink Proposition 8.9 (cited); T_l splits over an unramified extension of bounded degree.
2. (2): Larsen Theorem 3.17 (cited) gives G̃^sc_l with Γ^H_l ∩ G^sc_l(Q_l) = G̃^sc_l(ℤ_l), maximal compact, so Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l with Γ^Z_l open in Z̃_l(ℤ_l).
3. (3): Γ^C_l ⊇ θ_l(S̃(ℤ_l)) for l crystalline and unramified in F⁰; serre-theta-uniform-bounds (4) and Lemma A.1.6 bound [C̃_l(ℤ_l) : Γ^C_l] by D(ℛ), so [Z̃_l(ℤ_l) : Γ^Z_l] ≤ A(n)⁴D(ℛ).
4. (4): γG̃^sc_l and G̃^sc_l are the group schemes of special points of the Bruhat–Tits building with the same ℤ_l-points, hence equal (BT84 5.1.40, 5.2.8; cited).
5. (5): Larsen §1.12: an H̃_l(ℤ_l^nr)-invariant lattice, summed over Γ_l-translates.
6. (6): highest weights bounded in the fundamental-weight basis, so for large l they are restricted and the reductions ρ̄_{µ_i} are absolutely irreducible and distinct (Larsen §1.13); a simple-quotient argument splits Λ along the isotypic decomposition.

**Acceptance.**

- Check the use downstream: (6) is what makes the constituents of r̄_λ restricted to G̃^sc_l(ℤ_l) irreducible and distinct in residual-irreducibility-density-one.
- Check that (3) is not used downstream (BLGGT's own remark) and is recorded for completeness.

**Depends on.** this roadmap: [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups), [`R24.5/serre-theta-uniform-bounds`](#n-r24-5-serre-theta-uniform-bounds).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Larsen`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `larsen_good_primes`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), §5.2, Proposition 5.2.2 and proof, pp. 68–70 (arXiv v4): “There is a Dirichlet density 1 set L of rational primes with the following” — Proposition 5.2.2 (1)–(6) and its proof.

<a id="n-r24-5-polarized-system"></a>
### Polarized weakly compatible systems

`R24.5/polarized-system` · definition · planet “Polarized compatible systems” · part R24.3

Let F/F⁺ be CM and ℛ a rank-n weakly compatible system over M. Let ℳ be a rank-one weakly compatible character system of G_F⁺ over the same M (enlarge M if necessary), with ramification set lying below that of ℛ. A polarized system is the pair (ℛ,ℳ) together with a representation-level polarization witness for every λ, imported from ArithmeticGaloisRepresentations G7: a perfect pairing B_{λ,v} with B(x,y)=ε_v B(y,x), B(r_λ(g)x,r_λ(c_v g c_v)y)=μ_λ(g)B(x,y), and ε_v=−μ_λ(c_v). It is totally odd when ε_v=+1 at every real v. Forgetting the pairings only retains essential conjugate self-duality; a polarization is more data. The totally-real version uses BLGGT §2.1’s orthogonal/symplectic pairing convention, not the CM sign equation imposed without a quadratic extension.

**Construction.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

**API.**

- `TauCeti.CompatibleSystems.PolarizedSystem` (structure): Pair ℛ,ℳ with an actual polarization witness at every λ.
- `TauCeti.CompatibleSystems.PolarizedSystem.multiplier` (projection): The rank-one character system ℳ of G_F⁺, including μ(c_v).
- `TauCeti.CompatibleSystems.PolarizedSystem.pairing` (projection): The perfect representation-level pairing from G7, for each λ and real place v.
- `TauCeti.CompatibleSystems.PolarizedSystem.IsTotallyOdd` (data): All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.
- `TauCeti.CompatibleSystems.PolarizedSystem.conjugateDual` (compatibility): Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.

**Unit tests.**

- `polarized_cm_unit` (degenerate): The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign.
- `polarized_rank_two` (computation): For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on G_F.
- `polarized_multiplier_wrong` (non-example): Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v).
- `polarized_forget_pairing` (compatibility): Forget the chosen G7 pairing to obtain r^c≅r∨⊗μ; the converse requires a correctly signed perfect pairing, not a Prop-valued token.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Used by.**

- `PotentialAutomorphyInfrastructure:PA.5`: Track the lifting input and multiplier after tensor operations.
- [`R24.5/constituents-essentially-self-dual`](#n-r24-5-constituents-essentially-self-dual): Restrict the actual pairing to the selected constituent.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' layers: `ArithmeticGaloisRepresentations:G7`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `PolarizedSystem`, `multiplier`, `pairing`, `IsTotallyOdd`, `conjugateDual`; test fragments `polarized_cm_unit`, `polarized_rank_two`, `polarized_multiplier_wrong`, `polarized_forget_pairing`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), §2.1, p.31; §5.1, p.62: “a polarized (resp. totally odd, polarized) weakly compatible system” — Representation-level signs and the system pair (ℛ,ℳ).

<a id="n-r24-5-compatible-system-predicates"></a>
### Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic

`R24.5/compatible-system-predicates` · definition · part R24.3

For ℛ = (M, S, {Q_v}, {r_λ}, {H_τ}) of rank n over F: ℛ is regular if every H_τ has distinct elements; extremely regular if moreover some H_τ has no two distinct sub-multisets of equal size and equal sum; (n = 1, F totally real) totally odd if r_λ(c_v) = −1 for all infinite v; (F CM or totally real) (ℛ, ℳ) is essentially conjugate self-dual for a character system ℳ of G_{F⁺} if every (r_λ, μ_λ) is, and ℛ is totally odd essentially conjugate self-dual if such ℳ exists with every (r_λ, μ_λ) totally odd; irreducible if r_λ is irreducible for all λ above a set of rational primes of Dirichlet density 1; strictly compatible if for each finite v there is a Weil–Deligne representation WD_v(ℛ) over M̄ with ς WD_v(ℛ) ≅ WD(r_λ|_{G_{F_v}})^{F-ss} for λ not above the residue characteristic of v; pure of weight w if every root α of Q_v (v ∉ S) has |ια|² = (#k(v))^w and H_{cτ} = {w − h : h ∈ H_τ}; strictly pure if strictly compatible with each WD_v(ℛ) pure of weight w and H_{cτ} = {w − h : h ∈ H_τ}; automorphic if there is a regular algebraic cuspidal π of GL_n(𝔸_F) with rec(π_v|det|_v^{(1−n)/2})(Frob_v) of characteristic polynomial ι(Q_v) for v ∉ S. Over ℚ, Taylor's 'strongly compatible' is 'strictly compatible', and his rank-2 'regular' means distinct Hodge numbers and det ρ_λ(c) = −1. BLGGT strict compatibility here compares only λ away from the residue characteristic of v; it is weaker than KW all-place strictness. Strict purity includes local monodromy-weight purity at all v, not just good Frobenius absolute values. The totally-real pair convention is obtained from §2.1; the explicit §5.1 system definition is stated for CM F. Automorphic and irreducible predicates do not assert their preservation under every operation.

**Hypotheses and conventions.**

- these are predicates with their own preservation hypotheses (R24.5/linear-algebra-operations-on-systems), not fields of the carrier (RS-12)
- the rank-2 'strict' and 'almost strict' of R24.5/compatible-system are Khare–Wintenberger's local predicates at 𝔮 | ℓ; BLGGT's 'strictly compatible' asks WD_v(ℛ) only at λ ∤ residue characteristic of v; keep all of them separate
- the partial and completed L-functions, ε-factors and Γ-factors of a system (BLGGT pp. 52–53) are planned separately in R24.5/system-l-functions

**Construction.**

1. Definitions; independence of choices: det r_λ(c_v) = ±1 is independent of λ, and by purity n odd with v real forces w even (BLGGT p. 53).

**API.**

- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsRegular` (data): Distinct Hodge–Tate numbers for every τ.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsExtremelyRegular` (data): Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsStrictlyCompatible` (data): A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsPure` (data): Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsEssentiallySelfDual` (data): Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsIrreducible` (data): Irreducible for λ above a density-one set of primes.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsAutomorphic` (data): Frobenius polynomials of a regular algebraic cuspidal π.

**Unit tests.**

- `pred_newform` (compatibility): A newform of weight k ≥ 2 is regular, strictly pure of weight k − 1, irreducible and automorphic.
- `pred_regular_fails` (non-example): ε ⊕ ε is not regular (H = {−1, −1}).
- `pred_odd_purity` (characterisation): For n odd and v real, purity forces w even (BLGGT p. 53).
- `pred_strict_vs_almost_strict` (non-example): BLGGT strict compatibility only compares λ∤v and is implied by KW almost-strictness away from coefficient primes when the family is weakly compatible; it does not assert KW all-place strictness at v|ℓ. An unconstrained exceptional coefficient prime is a counterexample to inference from the contract.

**Acceptance.**

- Check that a newform of weight k gives a strictly pure, regular, irreducible (Ribet), automorphic rank-2 system of weight k − 1.
- Check that 'irreducible' is a density-one condition: for rank 2 over ℚ it is equivalent to irreducibility at one λ (R24.5/rank-two-reducibility-independent-of-lambda).

**Used by.**

- [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems): which predicates each operation preserves.
- [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda): the notion of an irreducible rank-2 system over ℚ.
- `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`: the requested carrier with its local predicates.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/polarized-system`](#n-r24-5-polarized-system); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `ArithmeticGaloisRepresentations:G7`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `IsRegular`, `IsExtremelyRegular`, `IsPure`; omitted signatures `IsStrictlyCompatible`, `IsEssentiallySelfDual`, `IsIrreducible`, `IsAutomorphic`; test fragments `pred_newform`, `pred_regular_fails`, `pred_odd_purity`, `pred_strict_vs_almost_strict`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.1, the subsidiary definitions, p. 51 (arXiv v1; printed page = PDF page): “We make the following subsidiary deﬁnitions.” — Regular, extremely regular, totally odd, essentially conjugate self-dual, irreducible.
- [blggt-2014](#src-blggt-2014), §5.1, strict compatibility and purity, p. 52 (arXiv v1; printed page = PDF page): “We will call R pure of weight w if” — Strictly compatible, pure, strictly pure.
- [blggt-2014](#src-blggt-2014), §5.1, automorphy, p. 53 (arXiv v1; printed page = PDF page): “We will call R automorphic if there is a regular, algebraic, cuspidal au- tomorphic representation” — Automorphic systems.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §6, Taylor's remark on motives, p. 773 (PDF page 45): “We remark that whatever is meant by a” — Strong compatibility and rank-2 regularity over ℚ.

<a id="n-r24-5-linear-algebra-operations-on-systems"></a>
### Linear-algebra operations on weakly compatible systems and what they preserve

`R24.5/linear-algebra-operations-on-systems` · construction · part R24.3

Construct direct sum, tensor, dual, symmetric and exterior powers of weakly compatible systems over a common coefficient field, with semisimplification of the algebraic output where needed. At good v, sums multiply Q polynomials; tensor roots are α_iβ_j; the dual polynomial is XⁿQ_v(0)⁻¹Q_v(X⁻¹); Sym^k and ∧^k roots are the appropriate repeated/distinct k-fold products. Hodge multisets follow the corresponding sums, negatives and k-fold sums. These operations, restriction and induction preserve weak compatibility and away-coefficient strict compatibility after the stated enlargement of S. Pure direct sums require equal weights; tensor weights add, dual weight negates, Sym^k/∧^k weight is kw; restrictions and induction preserve weight with their canonical Hodge data. Strict purity uses the local WD preservation results. Regularity survives duality/restriction; sums, tensors, symmetric powers of rank>2, exterior powers and induction can have Hodge collisions. Irreducibility survives duality, not arbitrary sums/tensors/restriction/induction. No unconditional cuspidal automorphy claim is made for any operation, including solvable base change when it becomes noncuspidal.

**Hypotheses and conventions.**

- weak compatibility of each operation uses only that de Rham, crystalline and Hodge–Tate data are preserved by the corresponding operations on representations (PadicHodgeTheory R06.3) and that characteristic polynomials of ⊗, ∨, Sym, ∧ and induced representations are determined by those of the factors
- extends R24.5/system-operations (twists, restriction, induction at rank n) by the linear-algebra operations; automorphy statements are recorded only where a source theorem supplies them

**Construction.**

1. Apply the operation member by member; compute Frobenius polynomials from Q_v (resultant-type formulas for ⊗, Sym, ∧; X^nQ_v(0)^{−1}Q_v(X^{−1}) for the dual; roots raised to the residue degree for restriction).
2. Strict compatibility: Weil–Deligne representations commute with each operation, and Frobenius-semisimplification with ⊗.
3. Counterexamples to preservation: (1 ⊕ ε) ⊗ (1 ⊕ ε^{−1}) contains 1 ⊕ 1 and is not regular although both factors are; restriction of an irreducible system induced from K to G_K is reducible.

**API.**

- `TauCeti.CompatibleSystems.directSum` (constructor): Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.
- `TauCeti.CompatibleSystems.tensor` (constructor): Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.
- `TauCeti.CompatibleSystems.dual` (constructor): Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.
- `TauCeti.CompatibleSystems.symmetricPower` (constructor): Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).
- `TauCeti.CompatibleSystems.exteriorPower` (constructor): ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.
- `TauCeti.CompatibleSystems.dual_charpoly` (compatibility): The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.
- `TauCeti.CompatibleSystems.directSum_pure` (relation): Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

**Unit tests.**

- `dual_rank_two` (computation): X²−aX+b with b≠0 becomes X²−(a/b)X+1/b.
- `sym2_distinct` (computation): For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular.
- `tensor_collision` (non-example): H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular.
- `direct_sum_mixed_weights` (non-example): 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight.
- `exterior_above_rank` (degenerate): ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty.

**Acceptance.**

- Check the dual's Frobenius polynomial in rank 2: X² − aX + b ↦ X² − (a/b)X + 1/b.
- Check that H_τ(Sym² ℛ) = {2h₁, h₁ + h₂, 2h₂} and that regularity can fail for Sym² when h₁ + h₂ collides — it cannot for rank 2 with h₁ ≠ h₂.

**Used by.**

- `PotentialAutomorphyInfrastructure:PA.5`: Compute weights and check the input remains regular/polarized under the chosen tensor operation.
- [`R24.5/system-l-functions`](#n-r24-5-system-l-functions): Dual factors and product formulas.

**Depends on.** this roadmap: [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:G7`, `PadicHodgeTheory:R06.2`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `directSum`, `tensor`, `dual`, `symmetricPower`, `exteriorPower`, `dual_charpoly`, `directSum_pure`; test fragments `dual_rank_two`, `sym2_distinct`, `tensor_collision`, `direct_sum_mixed_weights`, `exterior_above_rank`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.1, operations, p. 51 (arXiv v1; printed page = PDF page): “We deﬁne the usual linear algebra and group theoretic operations on weakly compatible systems by applying the corresponding operation to each” — Operations member by member, with the dual as the example.
- [blggt-2014](#src-blggt-2014), §5.1, restriction, p. 53 (arXiv v1; printed page = PDF page): “to be the weakly compatible system of representations of” — ℛ|_{G_{F′}} with S^{(F′)}, H^{(F′)}_τ and Q^{(F′)}_v (continued on p. 54).

<a id="n-r24-5-system-l-functions"></a>
### L-functions, Γ-factors and ε-factors of a compatible system

`R24.5/system-l-functions` · definition · part R24.3

The partial L-function is L^S(ıℛ, s) = ∏_{v∉S} q_v^{ns}/ıQ_v(q_v^s); it converges to an analytic function on Re s > 1 + w/2 if ℛ is pure of weight w, and if every place above l lies in S it depends only on r_λ (λ | l). If ℛ is strictly compatible, L(ıℛ, s) = ∏_{v∤∞} L(ıWD_v(ℛ), s) differs from L^S by finitely many Euler factors. For ℛ strictly compatible, pure of weight w and regular, with Γ_ℝ(s) = π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s) = Γ_ℝ(s)Γ_ℝ(s + 1), and following BLGGT v4: for v complex, with τ, τ′ the two embeddings with ı∘τ, ı∘τ′ extending to F_v ≅ ℂ, L_v(ıℛ, s) = Γ_ℂ(s − w/2)^n ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) ∏_{h∈H_{τ′}, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{Σ_{h∈H_τ}|h − w/2| + Σ_{h∈H_{τ′}}|h − w/2|}; for v real, with d± = n/2 (n even) or (n ± (−1)^{w/2}det ℛ(c_v))/2 (n odd, w even), L_v(ıℛ, s) = Γ_ℝ(s − w/2)^{d+}Γ_ℝ(s + 1 − w/2)^{d−} ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{d− + Σ_{h∈H_τ}|h − w/2|}. Then Λ(ıℛ, s) = L(ıℛ, s)∏_{v|∞}L_v(ıℛ, s) and ε(ıℛ, s) = ∏_{v∤∞}ε(ıWD_v(ℛ), ψ_v, s)∏_{v|∞}ε_v(ıℛ, ψ_v, s), for the standard additive character ψ of 𝔸_F/F. (BLGGT v1 instead used Γ_ℂ(s − w/2)^{n/2}-type factors and a separate Hodge factor L({H_τ}, s), which is undefined for odd w; see PotentialModularityAndCompatibleSystems/E2.)

**Hypotheses and conventions.**

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- For the completed function: strictly compatible, pure of weight w and regular.

**Construction.**

1. det r_λ(c_v) = ±1 is independent of λ because {det r_λ} is a weakly compatible system of characters; purity forces w even when n is odd and v real, so d± are integers.
2. Each quotient Γ_ℂ(s − h)/Γ_ℂ(s − w/2) with h < w/2 is a polynomial times a power of 2π when w − 2h is even, and a genuine Γ-quotient otherwise; the definition does not take roots.
3. Convergence for pure ℛ from |ια|² = q_v^w.

**API.**

- `TauCeti.CompatibleSystems.partialLFunction` (constructor): L^S(ıℛ, s) as an Euler product.
- `TauCeti.CompatibleSystems.lFunction` (constructor): L(ıℛ, s) for strictly compatible ℛ.
- `TauCeti.CompatibleSystems.archimedeanGammaFactor` (constructor): L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
- `TauCeti.CompatibleSystems.archimedeanEpsilon` (constructor): ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).
- `TauCeti.CompatibleSystems.archimedeanD` (data): d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.
- `TauCeti.CompatibleSystems.completedLFunction` (constructor): Λ(ıℛ, s) and ε(ıℛ, s).
- `TauCeti.CompatibleSystems.partialLFunction_converges` (characterisation): Convergence on Re s > 1 + w/2 for pure ℛ.
- `TauCeti.CompatibleSystems.partialLFunction_eq_of_lambda` (compatibility): L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.

**Unit tests.**

- `trivial_character` (compatibility): F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1 (suggested file).
- `gamma_duplication` (compatibility): Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one (suggested file).
- `cyclotomic_character` (compatibility): F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1 (suggested file).
- `elliptic_curve_gamma_factor` (compatibility): F = ℚ, ℛ = H¹ of an elliptic curve: n = 2, w = 1, H = {0, 1}, d± = 1, so L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s) and ε_∞ = i^{1 + 1/2 + 1/2} = −1 (suggested file). v1's Hodge factor is undefined here (w odd).

**Acceptance.**

- BLGGT note that these give the usual Λ and ε (Tate, Number theoretic background).
- The functional equation Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s) is a consequence of potential automorphy (BLGGT v4 Corollary 5.4.3), which this stage does not assume; it is planned in ModularityAndLanglandsExtensions ML.2.

**Used by.**

- [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring): L^S of virtual classes
- `ModularityAndLanglandsExtensions:ML.2`: BLGGT Corollary 5.3.2: after potential automorphy (Theorem 5.3.1), L^S(ıℛ, s) continues meromorphically and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s)

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; other roadmaps' layers: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; libraries: `mathlib:Complex.Gammaℝ`, `mathlib:Complex.Gammaℂ`, `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/LFunction`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `partialLFunction`, `archimedeanGammaFactor`, `archimedeanEpsilon`, `archimedeanD`; omitted signatures `lFunction`, `completedLFunction`, `partialLFunction_converges`, `partialLFunction_eq_of_lambda`; test fragments `trivial_character`, `gamma_duplication`, `cyclotomic_character`, `elliptic_curve_gamma_factor`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.1, pp. 52–53 (arXiv v1): “we deﬁne the partial L-function” — The definitions of L^S, L, the archimedean Γ- and ε-factors, the Hodge factors, Λ and ε in §5.1.
- [blggt-2014-v4](#src-blggt-2014-v4), §5.1, pp. 63–64 (arXiv v4): “We wish to deﬁne the completed L-function and ǫ-factors of” — The v4 archimedean factors, replacing v1's Hodge factor.

<a id="n-r24-5-galois-grothendieck-ring"></a>
### The Grothendieck ring of semisimple ℓ-adic representations

`R24.5/galois-grothendieck-ring` · construction · planet “Galois representation ring” · part R24.3

For a number field F and prime l, 𝒢𝒢_{F,l} is the category of semisimple continuous representations of G_F on finite-dimensional ℚ̄_l-vector spaces unramified almost everywhere (with cancellation U ⊕ W ≅ V ⊕ W ⇒ U ≅ V by traces), and Rep_{F,l} is its Grothendieck group, a commutative ring under semisimplified ⊗. It carries: trace homomorphisms tr σ (continuous class functions, separating classes on a dense set); dim = tr 1 ∈ ℤ; the nondegenerate symmetric ℤ-valued Hom pairing ([U], [V]) = dim Hom_{G_F}(U, V), with (A, A) = Σn_i² for A = Σn_i[V_i], so that dim A > 0 and (A, A) = 1 force A = [V] irreducible; the product formula for tensor products along a Zariski-dense θ : G_F → G₁ × G₂; conjugation conj_σ; restriction res_{F′/F} (a ring map); induction ind_{F′/F} with its trace formula, dim ind = [F′ : F] dim, the projection formula, Frobenius reciprocity and Mackey's formula; Brauer induction A = Σ n_i ind_{F_i′/F}([ı^{−1}ψ_i] res A) with the resulting pairing formula; and, for A unramified outside S ⊇ {v | l}, L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive in A and with L^S(ı ind A, s) = L^{S′}(ıA, s) (§5.4 (1)–(9)).

**Hypotheses and conventions.**

- F a number field; l a prime; ı : ℚ̄_l ≅ ℂ for L-functions.

**Construction.**

1. Items (1)–(7) are formal from semisimplicity and characters; (5) uses Zariski density to identify Hom spaces with those of algebraic representations.
2. (8): trace formula for induced characters, Frobenius reciprocity and Mackey's double-coset formula; (8f) is Brauer's induction theorem for Gal(F′/F), transported by ı^{−1} and multiplied by A.
3. (9): independence of the decomposition, from the additivity of L^S on direct sums and inductivity of partial L-functions.

**API.**

- `TauCeti.CompatibleSystems.RepRing` (constructor): Rep_{F,l} with ⊗ as multiplication.
- `TauCeti.CompatibleSystems.RepRing.trace` (constructor): tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.
- `TauCeti.CompatibleSystems.RepRing.pairing` (constructor): (A, B) = dim Hom, extended bilinearly.
- `TauCeti.CompatibleSystems.RepRing.eq_irreducible_of_pairing_eq_one` (characterisation): Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1.
- `TauCeti.CompatibleSystems.RepRing.res` (functoriality): Restriction, a ring homomorphism.
- `TauCeti.CompatibleSystems.RepRing.ind` (functoriality): Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
- `TauCeti.CompatibleSystems.RepRing.brauer` (relation): A = Σ n_i ind([ı^{−1}ψ_i] res A).
- `TauCeti.CompatibleSystems.RepRing.partialLFunction` (constructor): L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.

**Unit tests.**

- `pairing_norm` (computation): A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative.
- `trivial_class` (degenerate): [1] is the unit, with (1, 1) = 1 and dim 1 = 1.
- `induced_dimension` (computation): dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity.
- `virtual_not_genuine` (non-example): For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.

**Acceptance.**

- This is the bookkeeping behind BLGGT Theorems 5.4.1–5.4.2 (potential automorphy consequences, not planned in this stage).

**Used by.**

- `ModularityAndLanglandsExtensions:ML.2`: BLGGT Theorems 5.4.1–5.4.3 (a representation as a member of a compatible system, irreducibility of r_{l,ı}(π) for density-one l, and splitting a system into irreducible systems), argued by Brauer induction in this ring
- [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system): Norm-one pairing proves that the virtual combination is a genuine irreducible representation.

**Depends on.** this roadmap: [`R24.5/system-l-functions`](#n-r24-5-system-l-functions), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems); other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:G7`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`; libraries: `mathlib:Rep.indResAdjunction`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Grothendieck`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `RepRing`, `trace`, `pairing`, `eq_irreducible_of_pairing_eq_one`, `partialLFunction`; omitted signatures `res`, `ind`, `brauer`; test fragments `pairing_norm`, `trivial_class`, `induced_dimension`, `virtual_not_genuine`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.4, items (1)–(9), pp. 61–63 (arXiv v1): “denote the Grothendieck group” — The group-theoretic preliminaries of §5.4, items (1)–(9).

<a id="n-r24-5-residual-irreducibility-density-one"></a>
### Residual irreducibility over F(ζ_l) for a density-one set of primes

`R24.5/residual-irreducibility-density-one` · theorem · planet “Residual irreducibility” · part R24.3

Let ℛ be a regular weakly compatible system of l-adic representations of G_F defined over M (BLGGT Proposition 5.2.2). For a subrepresentation s of r_λ write s̄ for the semisimplification of its reduction and l for the rational prime below λ. There is a set L of rational primes of Dirichlet density 1 such that if s is an irreducible subrepresentation of r_λ with λ above an element of L, then s̄|_{G_{F(ζ_l)}} is irreducible.

**Hypotheses and conventions.**

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- ℛ regular.

**Proof outline.**

1. Take F¹ from BLGGT Lemma 5.2.1 (R24.5/rank-two-reducibility-independent-of-lambda). Regularity gives an element of G_λ⁰ with n distinct eigenvalues (Harris–Taylor VII.1.8, I.2.2); Frobenius elements at primes split in F¹ are Zariski dense in G_λ⁰; after enlarging M (Galois over ℚ) every r_λ is integral and the irreducible constituents of r_λ|_H, H open, are defined over M_λ with multiplicity one.
2. For r_l = ε_l ⊕ ⊕_{λ|l} r_λ: the Zariski closure G_l with open image Γ_l (Bogomolov), F⁰ independent of l, the connected centre Z_l, C_l = G_l⁰/G_l^der, the simply connected cover G_l^{SC} with central kernels of order dividing a uniform A, and Serre's θ_l : S_l → C_l, whose exponents m_{μ,σ} are bounded by a constant B independent of l.
3. Larsen's density-one set L: l unramified in M and F⁰ with ℛ unramified above l (so r_l crystalline), l ≥ 4B + 4, G_l⁰ unramified, a semisimple model G̃_l^{SC}/ℤ_l with G̃_l^{SC}(ℤ_l) the preimage of the image of G_{F⁰} and perfect, and standard reductions of the constituents.
4. Two constituents agreeing on G̃_l^{SC}(ℤ_l) × Γ_l^{Z,1} differ by a power ε_l^b: solve Σ_i (m_{1,Frob^i σ_v} − m_{2,Frob^i σ_v})l^i = b(l^{f_v} − 1)/(l − 1) digit by digit using the bound B.
5. Write s ≅ Ind_{Γ_l¹}^{Γ_l} s₀ with s₀ an irreducible Γ_l⁰-constituent; since l is unramified in F⁰, s̄|_{G_{F(ζ_l)}} ≅ Ind s̄₀ over ker ε_l, irreducible because a conjugate s̄₀^γ ≅ s̄₀ε_l^a forces a = 0 (γ has finite order).
6. In v4 the density-one set and the integral models come from larsen-good-primes (v4 Proposition 5.2.2) applied to the rational system obtained by restriction of scalars, rather than from Larsen directly.

**Acceptance.**

- Check the case n = 1: every s̄ is a character, so the conclusion holds with L the set of all primes.
- Check that the conclusion is the residual hypothesis of BLGGT Theorem 5.4.1 (4), ¯r|_{G_{F(ζ_l)}} irreducible, for every irreducible constituent s and not only for r_λ, and that it is asserted only on a density-one set of l: this is the precise condition under which irreducibility passes to reductions that R24.5:operations records.
- Check the dependencies: Larsen 1995 (1.12–1.13, 2.6, 3.15, 3.17) and Larsen–Pink 6.14 are recorded as gaps, not proved here.

**Depends on.** this roadmap: [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/larsen-good-primes`](#n-r24-5-larsen-good-primes).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Irreducibility`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `residual_irreducibility_density_one`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.2, Lemma 5.2.1 and Proposition 5.2.2, pp. 54–58 (arXiv v1): “Then there is a set of rational primes L of Dirichlet density 1 such that if s is an irreducible sub-representation of rλ” — Lemma 5.2.1 and Proposition 5.2.2 with its proof.
- [blggt-2014-v4](#src-blggt-2014-v4), §5.3, Proposition 5.3.2, p. 71 (arXiv v4): “Then there is a set of rational primes L of Dirichlet” — v4 Proposition 5.3.2 (= v1 Proposition 5.2.2), whose proof now runs through v4 Proposition 5.2.2 (larsen-good-primes).

<a id="n-r24-5-constituents-essentially-self-dual"></a>
### Constituents of an essentially conjugate self-dual system

`R24.5/constituents-essentially-self-dual` · lemma · part R24.3

Let F be an imaginary CM field, (ℛ,ℳ) a pure, extremely regular polarized weakly compatible system, F′/F a finite extension and s an irreducible subrepresentation of r_λ|G_F′. There is a CM field F″ with F⊆F″⊆F′ such that s is invariant under G_F″ and (s, μ_λ|G_F″⁺) is a polarized representation; it is totally odd when (ℛ,ℳ) is. The field is a CM descent field, not an arbitrary totally-real intermediate field. Purity and extreme regularity force the selected Hodge subset to be stable under the polarized duality.

**Hypotheses and conventions.**

- F imaginary CM (BLGGT v4 Lemma 5.4.5; v1 Lemma 5.2.3 allowed F CM or totally real); (ℛ, ℳ) polarized; ℛ pure and extremely regular; s irreducible, which the last step of the proof uses.

**Proof outline.**

1. Choose τ so that distinct equal-size subsets of H_τ have distinct sums (extreme regularity) and τ₁ on the normal closure F₁ of F′/F⁺; submodules of the same dimension are equal iff the Hodge–Tate numbers of their determinants agree, so constituents have multiplicity one.
2. Purity gives h_σ + h_{σc} = w dim s, so s^{σcc′} = s^σ; the group generated by products cc′ of complex conjugations cuts out the maximal CM subfield F″ of F′, and s extends to G_{F″}.
3. Comparing Hodge–Tate numbers, s^c ≅ μ_λ s^∨, realised by restricting the pairing matrix A_{λ,v}; this gives the parity statement.

**Acceptance.**

- Check that extreme regularity, not only regularity, is what is used: it separates equal-dimensional submodules by the Hodge–Tate numbers of their determinants, which gives multiplicity one of the constituents of r_λ|_{G_{F₁}}.
- Check the output against R24.5/linear-algebra-operations-on-systems: restriction to G_{F′} may break irreducibility, and the lemma records what survives for polarized systems (each constituent descends to a CM field F″ ⊆ F′ and stays essentially conjugate self-dual with the same μ_λ, totally odd if (r_λ, μ_λ) is).

**Depends on.** this roadmap: [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/polarized-system`](#n-r24-5-polarized-system).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Irreducibility`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `constituents_essentially_self_dual`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014](#src-blggt-2014), §5.2, Lemma 5.2.3, pp. 58–59 (arXiv v1): “is invariant by” — Lemma 5.2.3 and its proof.
- [blggt-2014-v4](#src-blggt-2014-v4), Lemma 5.4.5, pp.77–78: “Suppose that F is an imaginary CM field” — Correct CM base, irreducible constituent, actual polarization and total-oddness hypotheses.

<a id="n-r24-5-polarized-operations"></a>
### Operations on polarized systems

`R24.5/polarized-operations` · construction · part R24.3

For CM F/F⁺, put δ=δ_F/F⁺. Duality takes multiplier μ⁻¹ and the same sign; tensoring (ℛ,μ,ε) and (ℛ′,μ′,ε′) takes multiplier μμ′δ and sign εε′, so both totally odd inputs give a totally odd output. The quadratic correction changes no restriction to G_F but is necessary at c_v. For k≥1, ∧^k and Sym^k have inherited pairing sign ε^k and multiplier μ^kδ^(k−1), in characteristic zero (on nonzero representations). At k=0 the unit system has multiplier δ and sign +1; equivalently use the integer exponent k−1 in the formula. Direct sum requires a common multiplier and common signs; otherwise the block pairing is not a polarization of one pair. Twisting by a character χ of G_F uses μ times the norm character χχ^c extended to G_F⁺ with value +1 at c_v. Restriction is along a CM extension with matched real subfield; induction retains polarization only with a specified compatible extension of the multiplier and the induced perfect pairing/sign check. Regularity and irreducibility must be checked separately.

**Construction.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

**API.**

- `TauCeti.CompatibleSystems.PolarizedSystem.tensor` (constructor): Tensor pairings and multiplier μμ′δ; signs multiply.
- `TauCeti.CompatibleSystems.PolarizedSystem.dual` (constructor): Dual perfect pairings and inverse multiplier.
- `TauCeti.CompatibleSystems.PolarizedSystem.twist` (constructor): Twist by χ with norm-character multiplier correction.
- `TauCeti.CompatibleSystems.PolarizedSystem.power` (constructor): Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.
- `TauCeti.CompatibleSystems.PolarizedSystem.tensor_isTotallyOdd` (relation): Two totally odd CM systems yield a totally odd normalized tensor system.

**Unit tests.**

- `polarized_tensor_sign` (computation): ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1.
- `polarized_dual_sign` (compatibility): Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign.
- `polarized_unit_tensor` (degenerate): The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ.
- `polarized_sum_mismatch` (non-example): A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Used by.**

- `PotentialAutomorphyInfrastructure:PA.5`: Validate the tensor trick’s multiplier and total oddness.
- [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems): Refine the generic operations with polarization witnesses.

**Depends on.** this roadmap: [`R24.5/polarized-system`](#n-r24-5-polarized-system), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems); other roadmaps' layers: `ArithmeticGaloisRepresentations:G7`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `tensor`, `dual`, `twist`, `power`, `tensor_isTotallyOdd`; test fragments `polarized_tensor_sign`, `polarized_dual_sign`, `polarized_unit_tensor`, `polarized_sum_mismatch`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), §2.1, p.31; §5.1, p.62; tensor-product use in §4.3: “totally odd if εv = 1 for all v|∞.” — Derived system-level pairing operations from §2.1 covariance and CM sign equation. Multiplication by δ corrects the extension of the multiplier at real conjugations; these explicit formulas are a derivation from the definition.

<a id="n-r24-5-character-system"></a>
### Compatible systems of algebraic Hecke characters

`R24.5/character-system` · construction · part R24.3

For a type-A₀ algebraic Hecke character χ of a number field F, choose a number field M containing its algebraic finite values. Its ℓ-adic realizations give a rank-one weakly compatible system, de Rham at every coefficient place and crystalline away from a fixed finite conductor set. In BLGGT convention HT_τ={a_τ} when χ at connected infinity is ∏(τx)^−a_τ. Good geometric Frobenius polynomial is X−r_λ(Frob_v), transported from the common algebraic value by class field theory. Conversely, every finitely ramified algebraic/de Rham ℓ-adic character comes from such χ, up to the fixed reciprocity convention; Hecke characters and their algebraic infinity-type purity are imported from GlobalNumberFields Layers 9–10, reciprocity from ClassFieldTheory Layers 11–12, and the ℓ-adic realization/classification comparison is requested as ClassFieldTheory, Part II. These constructions are not duplicated here.

**Construction.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

**API.**

- `TauCeti.CompatibleSystems.characterSystem` (constructor): Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
- `TauCeti.CompatibleSystems.characterSystem_hodge` (compatibility): H_τ={a_τ} for connected-infinity exponent −a_τ.
- `TauCeti.CompatibleSystems.characterSystem_frob` (compatibility): The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
- `TauCeti.CompatibleSystems.characterSystem_unique` (extensionality): Unique up to memberwise representation isomorphism from good Frobenius polynomials.

**Unit tests.**

- `character_trivial` (degenerate): χ=1 gives Q_v=X−1, H={0}, weight 0.
- `character_cyclotomic` (computation): The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2.
- `character_finite_order` (computation): A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0.
- `character_non_algebraic` (non-example): An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Used by.**

- [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity): The algebraic character’s infinity type determines its pure weight.
- [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda): Propagate the two Hodge–Tate character constituents.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' layers: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `ArithmeticGaloisRepresentations:R01.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `characterSystem`, `characterSystem_hodge`, `characterSystem_frob`, `characterSystem_unique`; test fragments `character_trivial`, `character_cyclotomic`, `character_finite_order`, `character_non_algebraic`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), Appendix A.2, p.87, before Lemma A.2.1: “Any algebraic l-adic character of GF arises in this way.” — Algebraic character realizations, Hodge numbers, weight properties and pure WD parameters.
- [acc-2023](#src-acc-2023), §7.1, pp.1085,1092: “representations is always de Rham” — Rank-one extremely weak systems are de Rham and pure; the character realization argument is imported.

<a id="n-r24-5-artin-system"></a>
### Compatible systems of Artin representations

`R24.5/artin-system` · construction · part R24.3

Let a finite quotient Γ of G_F and a characteristic-zero finite-dimensional representation a over a number field M be given. Use coefficient extension along every M↪M̄_λ to form a compatible Artin family. Choose S containing every prime ramified in the finite quotient. Members have finite image, hence de Rham/potentially unramified with H_τ consisting of n copies of 0, and are crystalline at coefficient places outside S. Good polynomials are the characteristic polynomials of a(Frob_v), their eigenvalues roots of unity. This construction uses the finite quotient representation and coefficient extension from R01.1, and has weight zero; finite-image does not imply irreducible or regular.

**Construction.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

**API.**

- `TauCeti.CompatibleSystems.artinSystem` (constructor): Extend the given finite-quotient number-field representation to every coefficient place.
- `TauCeti.CompatibleSystems.artinSystem_hodge` (compatibility): H_τ is n copies of zero.
- `TauCeti.CompatibleSystems.artinSystem_charpoly` (compatibility): Q_v is the characteristic polynomial of the finite quotient Frobenius element.
- `TauCeti.CompatibleSystems.artinSystem_pure` (relation): The Artin family is pure of weight 0 with finite-monodromy local WD data.

**Unit tests.**

- `artin_trivial` (degenerate): The trivial rank-one quotient gives Q_v=X−1 and H={0}.
- `artin_quadratic` (computation): For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes.
- `artin_rank_two_irregular` (non-example): Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible.
- `artin_roots_unity` (characterisation): Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Used by.**

- [`R24.5/artin-twist-purity`](#n-r24-5-artin-twist-purity): Tensor finite-order Frobenius eigenvalues with the algebraic character family.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:G7`, `PadicHodgeTheory:R06.2`; libraries: `mathlib:Representation`, `mathlib:LinearMap.charpoly`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `artinSystem`, `artinSystem_hodge`, `artinSystem_charpoly`, `artinSystem_pure`; test fragments `artin_trivial`, `artin_quadratic`, `artin_rank_two_irregular`, `artin_roots_unity`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [acc-2023](#src-acc-2023), §7.1, pp.1086,1092: “or if R is Artin up to twist.” — The Artin-up-to-twist purity observation; the finite-quotient family, zero Hodge weights and root-of-unity polynomials are the explicit untwisted construction used in that observation.

<a id="n-r24-5-weakened-compatible-data"></a>
### Very weak and extremely weak compatible data

`R24.5/weakened-compatible-data` · definition · part R24.3

Use the same number-field, finite ramification set, semisimple continuous members and common monic good Frobenius polynomials as a weakly compatible system. Extremely weak data retain only HT_τ(det r_λ)=Σ H_τ at every λ, with no full-member Hodge or de Rham condition. Very weak data additionally require the members to be crystalline at all places above ℓ and have H_τ for ℓ outside a Dirichlet-density-zero set. A weak system is very weak and a very weak system is extremely weak; the converse implications are not part of the definition. For rank one the determinant condition is the full Hodge condition and algebraic-character classification recovers weak compatibility. In higher rank extremely weak H is constrained only by its sum; induction and Artin-twist purity below therefore specify canonical Hodge metadata.

**Construction.**

1. Separate the determinant Hodge comparison from the full-member condition.
2. The forgetful maps preserve actual members, Q, S and H; record their density and determinant obligations independently.

**API.**

- `TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem` (structure): The common Q, members and H with determinant-Hodge condition only.
- `TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem` (structure): Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.toVeryWeak` (functoriality): Forget the all-λ de Rham/full Hodge requirement to the density-one one.
- `TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem.toExtremelyWeak` (functoriality): Forget the density-one full-member condition, retaining determinant Hodge comparison.
- `TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem.hodgeSum` (compatibility): At every λ, the determinant labeled Hodge number equals Σ H_τ.

**Unit tests.**

- `weakening_rank_one` (characterisation): A rank-one H_τ={a} is determined by its determinant Hodge sum a.
- `weakening_higher_rank_metadata` (non-example): Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.
- `weakening_hodge_purity_not_sum` (non-example): For a rank-two weight-zero Artin family, H_τ={−1,1}, H_cτ={0,0} have both determinant sums zero, but H_cτ≠−H_τ; arbitrary extremely weak metadata do not imply Hodge purity.
- `weakening_transitive` (compatibility): The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ.

**Acceptance.**

- The distinction is an interface weakening, never a replacement of the BLGGT weak carrier.

**Used by.**

- ACC+ §7.1, Lemma 7.1.1 and Theorem 7.1.11: a reducible rank-two extremely weak system splits into weakly compatible character systems; the main potential automorphy theorem takes very weakly compatible systems with H_τ = {0, 1}
- [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity): rank-one extremely weak data are weakly compatible character systems
- [`R24.5/artin-twist-purity`](#n-r24-5-artin-twist-purity): Artin-up-to-twist purity needs the canonical Hodge metadata (E4)
- [`R24.5/induced-character-purity`](#n-r24-5-induced-character-purity): induced purity uses the transported character Hodge data

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n); other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.1`, `PadicHodgeTheory:R06.2`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `ExtremelyWeaklyCompatibleSystem`, `VeryWeaklyCompatibleSystem`, `toVeryWeak`, `toExtremelyWeak`, `hodgeSum`; test fragments `weakening_rank_one`, `weakening_higher_rank_metadata`, `weakening_hodge_purity_not_sum`, `weakening_transitive`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [acc-2023](#src-acc-2023), §7.1, pp.1084–1085: “If we further drop hypothesis (5b)” — Definitions of very weak and extremely weak systems, including the determinant condition and density-one full-member condition.

<a id="n-r24-5-rank-two-reducibility-independent-of-lambda"></a>
### Reducibility of rank-2 systems over ℚ does not depend on λ

`R24.5/rank-two-reducibility-independent-of-lambda` · theorem · part R24.3

For a rank-two weakly compatible system over ℚ in Taylor’s §6 sense, absolute reducibility of one characteristic-zero member implies absolute reducibility of every member. The two Hodge–Tate characters at that member fit into algebraic Hecke-character systems by Serre; their direct sum has the same good Frobenius polynomials, so recognition identifies every other member. This is independence of characteristic-zero reducibility, not independence of residual reducibility.

**Hypotheses and conventions.**

- Lemma 6.5 is 'an easy consequence of the characterisation of one-dimensional Hodge–Tate representations of G_ℚ' (they are finite-order characters times powers of the cyclotomic character), so the constituents of a reducible member form rank-1 systems whose Frobenius polynomials are then shared by every member

**Proof outline.**

1. Each constituent is a Hodge–Tate character and hence belongs to an algebraic Hecke-character family (rank-one supplier).
2. The two character families sum to the same common good Frobenius polynomials.
3. Apply R01.5 recognition for every λ.

**Acceptance.**

- Check Lemma 6.5 on the system of a CM newform: irreducible at every λ, although it becomes reducible on restriction to the CM field.

**Depends on.** this roadmap: [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data); other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.5`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `rank_two_reducibility_independent_of_lambda`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §6, before Lemma 6.5, p. 773 (PDF page 45): “The following lemma is an easy consequence of the characterisation of one dimensional Hodge-Tate representations of” — The proof indication for Lemma 6.5.
- [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation), §6, after Lemma 6.5, p. 774 (PDF page 46): “holds. Otherwise we call it irreducible.” — Reducible and irreducible rank-2 systems.

<a id="n-r24-5-rank-one-purity"></a>
### Purity of character systems

`R24.5/rank-one-purity` · theorem · planet “Purity of rank-one systems” · part R24.3

Every rank-one weakly compatible system is pure of an integer weight w. More generally the same conclusion holds for rank-one extremely weak data of ACC+ §7.1: actual semisimple members with common linear good Frobenius polynomials and the determinant Hodge condition at every λ. Algebraic character classification gives one integer w with a_{cτ}+a_τ=w and |ιr(Frob_v)|²=q_v^w for every good v and complex embedding. The algebraic Hecke-character realization supplies pure local WD parameters as well. This does not assert purity for arbitrary continuous nonalgebraic character data.

**Proof outline.**

1. Import the de Rham/algebraic Hecke-character classification from the rank-one owner.
2. Use the global infinity-type relation a_τ+a_cτ=w and the common geometric Frobenius values to prove both clauses of system purity.
3. Use the owner’s pure WD character theorem for the stronger local assertion.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Depends on.** this roadmap: [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data); other roadmaps' layers: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `rank_one_purity`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [blggt-2014-v4](#src-blggt-2014-v4), Appendix A.2, p.87, items (1),(2),(8): “Any algebraic l-adic character of GF arises in this way.” — Weights and pure local parameters of algebraic characters.
- [acc-2023](#src-acc-2023), §7.1, p.1092, purity paragraph: “then it is automatically pure” — Rank-one purity before potential automorphy consequences.

<a id="n-r24-5-induced-character-purity"></a>
### Purity of systems induced from characters

`R24.5/induced-character-purity` · theorem · part R24.3

For a finite extension F′/F and a pure rank-one character system ℭ/F′ of weight w, Ind_F′^F ℭ with canonical induced Hodge multiset H_τ=⊔_{σ|τ}H_σ is a pure system of weight w after adjoining ramified primes to S. This also applies to induction of rank-one extremely weak character data when H is the transported character Hodge data. At a good v the eigenvalues in each residue-degree-f block satisfy β^f=α_w with |ια_w|²=q_w^w=(q_v^f)^w, hence |ιβ|²=q_v^w. It is not a regularity or irreducibility theorem. No purity claim is made for arbitrary freely chosen higher-rank Hodge metadata with only the correct determinant sum.

**Proof outline.**

1. Construct local induction blocks; compute their good Frobenius roots via β^f=α_w.
2. Apply character purity to the source roots and convert q_w=q_v^f.
3. The conjugate Hodge relation survives the union over embeddings σ extending τ.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Depends on.** this roadmap: [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `induced_character_purity`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [acc-2023](#src-acc-2023), §7.1, p.1092, purity paragraph: “induced from an extremely weakly compatible system of characters” — Purity for induction of an extremely weak character system with its induced data.
- [blggt-2014-v4](#src-blggt-2014-v4), §5.1, pp.62–63: “We define the usual linear algebra and group theoretic operations” — Operations and the two clauses of purity.

<a id="n-r24-5-artin-twist-purity"></a>
### Purity of Artin systems up to twist

`R24.5/artin-twist-purity` · theorem · part R24.3

If ℛ=𝒜⊗ℭ where 𝒜 is a rank-n Artin system and ℭ a rank-one algebraic character system of weight w, with H_τ the canonical n copies of the character Hodge number, then ℛ is pure of weight w. Every good eigenvalue is ζα with ζ a root of unity and α the character Frobenius value. For rank-two extremely weak systems that are Artin up to twist in the ACC+ sense, use the actual character twist and canonical Hodge data (or a very weak realization) to obtain this statement; merely choosing arbitrary higher-rank Hodge multisets of the same determinant sum does not imply Hodge purity.

**Proof outline.**

1. Use |ιζ|=1 and character purity to compute the good eigenvalue absolute values.
2. Transport the character Hodge symmetry to its repeated multiset.
3. No potential-automorphy theorem enters either step.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Depends on.** this roadmap: [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** fragments of `artin_twist_purity`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [acc-2023](#src-acc-2023), §7.1, pp.1086,1092: “or if R is Artin up to twist.” — Artin-up-to-twist definition and purity observation, with the canonical-Hodge qualification recorded in source issue E4.

<a id="layer-r24-5"></a>
## R24.5 — Compatible systems from potential modularity

*Coverage in the R24.3 part: planned. 5 nodes, 3 planets.*

The existence theorems for two-dimensional systems over ℚ.

- **The Brauer-induction system.** For a lift ρ that becomes modular over a totally real Galois F (R23.4), Brauer's theorem writes 1 = Σ n_i Ind χ_i over soluble subgroups; solvable descent (R17.4) gives forms π_i over the fixed fields F_i, and ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) is a priori a virtual representation. It is a genuine absolutely irreducible two-dimensional representation because its dimension is 2 and its self-pairing in the Grothendieck ring is 1: Mackey's formula reduces the pairing to overlap fields, where both members restrict to the same family, so each summand is independent of ι and equals its value at the original prime, where the identity gives [ρ]. Dimension two alone would not suffice.
- **Compatibility.** The system is almost strictly compatible, as Khare and Wintenberger prove: Carayol and Taylor away from ℓ, Breuil and Berger at ℓ ≠ 2 with r_q unramified, Kisin at ℓ with irreducible residual member after moving to a field disjoint from its kernel (R23.5). With Skinner's theorem for Hilbert modular forms at the coefficient prime (requested from AutomorphicGaloisRepresentations R19.5) it is strictly compatible, also at reducible residual members, and it is pure when the Hilbert families are.
- **KW I Theorem 5.1.** For each lift type (1)–(4) of R24.3 there is an almost strictly compatible, irreducible, odd system through a lift of that type, with Savitt's residual weights in types (3) and (4); with Skinner's theorem the same system is strictly compatible.
- **Dieulefait's families** (Dieulefait–Pacetti, Theorem 1.11) are planned for the lifts R23.4 reaches: those of Khare–Wintenberger type (A), (B) or (C) at p, which include the lifts of Dieulefait–Pacetti's Theorem 1.9 (1)–(3) and the crystalline, Steinberg or type-(B) lifts of 1.9 (4). The rest of their statement is a gap, and their citation for it does not prove it (source issue E5 of the R24.3 part).

**Still open in this layer.**

- Obtain general Hilbert eigenform/irreducibility and overlap-pairing exports, full Skinner coefficient-prime compatibility, and eigenform purity from their owners.
- Verify Savitt’s exact residual weights; the historical almost-strict variant and the strict Brauer refinement are both planned.
- Potential modularity of weight-two lifts of other potentially Barsotti–Tate types and of general regular de Rham lifts, for the full scope of DP Theorem 1.11 (gap recorded by the review).

<a id="n-r24-5-brauer-induction-system"></a>
### The compatible system through a potentially modular lift, by Brauer induction

`R24.5/brauer-induction-system` · construction · planet “Compatible systems by Brauer induction” · part R24.3

Let ρ : G_ℚ → GL₂(𝒪) be a lift such that ρ|_{G_F} ≅ ρ_{π,ι_p} for a holomorphic cuspidal π over a totally real Galois F/ℚ (R23.4 or Theorem 9.7). By Brauer's theorem write 1_G = Σ n_i Ind_{G_i}^G χ_i with G = Gal(F/ℚ), G_i = Gal(F/F_i) solvable and χ_i characters. By Langlands' solvable base change there are π_i over F_i with ρ_{π_i,ι_p} = ρ|_{G_{F_i}}. For every ℓ and ι : ℚ̄ ↪ ℚ̄_ℓ put ρ_ι = Σ n_i Ind_{G_{F_i}}^{G_ℚ}(χ_i ⊗ ρ_{π_i,ι}). Assume the given lift is absolutely irreducible over F and each cuspidal Hilbert modular member over every solvable intermediate field is absolutely irreducible, with their overlaps identified by Frobenius recognition. Then ρ_ι is a true absolutely irreducible two-dimensional representation, its Frobenius traces agree with those of ρ at almost all primes, it does not depend on the choices, and for every F′ ⊆ F with F/F′ solvable, ρ_ι|_{G_{F′}} is the representation of the automorphic form attached to ρ|_{G_{F′}}.

**Hypotheses and conventions.**

- Finite totally real Galois F/ℚ; the supplied lift remains absolutely irreducible over F, ensuring cuspidal solvable descent and the irreducible-overlap pairing computation.
- The automorphic families and finite-order characters have a common finite coefficient field after enlarging it; the output family is indexed by its places/embeddings, not unrelated fields at different ℓ.

**Construction.**

1. Import finite Brauer induction and solvable cuspidal descent. Choose a common number field containing all finitely many Hecke fields and character values.
2. Form the virtual class A_ι=Σn_i Ind(χ_i⊗ρ_{π_i,ι}). Mackey and Frobenius reciprocity express (A_ι,A_ι) using overlap fields F_i·gF_j. The two overlap members restrict to the same irreducible family over F, so their Hom line carries the same finite descent character at every ι, identified from the original p-member by Frobenius recognition. Hence every pairing summand is independent of ι.
3. At p the Brauer identity gives A_p=[ρ], so (A_ι,A_ι)=1 and dim A_ι=2 for all ι. The representation-ring criterion yields a genuine irreducible; degree two by itself cannot do so.
4. Trace identities give the common Frobenius polynomials and independence of choices. Repeat the overlap comparison to identify restrictions to every solvable intermediate field. Local descent is then handled separately in the almost-strict and strict-compatibility theorems.

**API.**

- `TauCeti.CompatibleSystems.brauerSystem` (constructor): ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i
- `TauCeti.CompatibleSystems.brauerSystem_isTrue` (characterisation): The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
- `TauCeti.CompatibleSystems.brauerSystem_trace` (compatibility): After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
- `TauCeti.CompatibleSystems.brauerSystem_unique` (extensionality): Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
- `TauCeti.CompatibleSystems.brauerSystem_restrict` (compatibility): restriction to G_{F′} with F/F′ solvable is automorphic

**Unit tests.**

- `brauer_trivial_F` (degenerate): F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself
- `brauer_quadratic_coefficients` (computation): G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε
- `brauer_virtual_nonexample` (non-example): the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true
- `brauer_trace_agreement` (compatibility): For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.

**Acceptance.**

- Check the degenerate case of solvable Gal(F/ℚ): Brauer's theorem is not needed, F_i = ℚ, and ρ_ι is the system of the form over ℚ obtained by solvable descent
- Check that the Hodge–Tate weights of ρ_ι are those of ρ

**Used by.**

- [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility): the system whose compatibility is proved
- [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems): the systems of KW I Theorem 5.1
- [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families): Dieulefait's families for a given lift

**Depends on.** this roadmap: [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring); layers of this roadmap: [R23.4](#layer-r23-4) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' layers: `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.6`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `brauerSystem`, `brauerSystem_isTrue`, `brauerSystem_trace`, `brauerSystem_unique`, `brauerSystem_restrict`; test fragments `brauer_trivial_F`, `brauer_quadratic_coefficients`, `brauer_virtual_nonexample`; omitted tests `brauer_trace_agreement`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93 of the preprint: “Using Brauer’s theorem we get subextensions” — The construction.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93 of the preprint: “Using Brauer’s theorem we get subextensions” — True representations.
- [khare-level-one](#src-khare-level-one), §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version): “We check that ρι is a true representation by computing its inner product.” — Genuineness by inner-product computation; the norm-one step is expanded here.

<a id="n-r24-5-almost-strict-compatibility"></a>
### The Brauer system is almost strictly compatible

`R24.5/almost-strict-compatibility` · theorem · part R24.3

The system (ρ_ι) of R24.5/brauer-induction-system is almost strictly compatible. For a prime q, let F(q) ⊆ F be the decomposition field at a prime Q | q, π_q the local component at Q of the form attached to ρ|_{G_{F(q)}}, and r_q its Frobenius-semisimple Weil–Deligne parameter. (a) For q ≠ ℓ, the Weil–Deligne parameter of ρ_ι|_{D_q} is r_q (Carayol, Taylor). (b) For q = ℓ ≠ 2 with r_q unramified, it is r_q and ρ_ι|_{D_q} is crystalline (Breuil, Berger). (c) For q = ℓ with ρ̄_ι irreducible, it is r_q (Kisin's potentially semistable deformation rings, after moving to a field F′ linearly disjoint from the kernel of ρ̄_ι). Strict compatibility would follow from Kisin's result without the irreducibility hypothesis; KW II correct an earlier claim of strictness on this point. This records exactly the 2009 KW proof. Its residual-irreducibility restriction is not a present-day impossibility: the strict result below uses Skinner’s full theorem in place of that restricted coefficient-prime input.

**Hypotheses and conventions.**

- (c) needs ρ̄_ι irreducible, because Kisin's theorem does; this is the whole difference between almost strict and strict
- the case q = ℓ = 2 with r_q unramified and ρ̄_ι reducible is not covered

**Proof outline.**

1. (a) Carayol and Taylor's local-global compatibility over F(q) (AutomorphicGaloisRepresentations R19.2, R19.4).
2. (b) Breuil and Berger at an unramified coefficient prime. In the atlas (b) and (c) are both instances of the full coefficient-prime theorem requested from AutomorphicGaloisRepresentations R19.5 (Skinner 2009): the existing R19.5 node keeps Carayol's parity hypothesis, which KW's fields of even degree with no finite discrete-series place do not satisfy.
3. (c) Kisin, with F′ from potential modularity chosen linearly disjoint from ker ρ̄_ι (KW II Theorem 6.1(iii)(d), R23.5).

**Acceptance.**

- Check each case against R24.5/compatible-system's almost strict predicate
- Check that KW II's remark withdrawing strictness (Wintenberger, Documenta 2006) is reflected: only almost strictness is claimed

**Depends on.** this roadmap: [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/compatible-system`](#n-r24-5-compatible-system); layers of this roadmap: [R23.5](#layer-r23-5) (see [Cross-part prerequisites](#cross-part-prerequisites)); other roadmaps' nodes: `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentations:R19.4`, `AutomorphicGaloisRepresentations:R19.5`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `almost_strict_compatibility`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93: “it follows from Carayol and Taylor” — (a).
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 94: “it follows from Breuil and Berger” — (b).
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 94: “it follows from Kisin” — (c).
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 93: “we state that we can propagate to a strictly compatible system” — The authors' correction of the earlier strictness claim.

<a id="n-r24-5-strict-brauer-system"></a>
### Strict compatibility of the Brauer system

`R24.5/strict-brauer-system` · theorem · planet “Strict compatible systems” · part R24.3

For the rank-two Brauer system of R24.5/brauer-induction-system arising from holomorphic cuspidal Hilbert modular forms of motivic weights k_τ≥2, the members are geometric of the same Hodge–Tate weights and WD(ρ_ι|D_q)^Fss is the fixed r_q at every finite q, including q=ℓ and reducible residual members. Hence it is KW strictly compatible. For q=ℓ unramified r_q, every member is crystalline of the common weights (a de Rham representation is crystalline iff inertia acts trivially on its WD parameter and N = 0, PadicHodgeTheory R06.3). If the Hilbert modular families are pure of weight w in the geometric convention, the descended system is pure of weight w; local strict purity is transported through the same local comparison and local–global purity supplier.

**Proof outline.**

1. For a prime q choose F(q), the fixed field of its decomposition subgroup in Gal(F/ℚ). That subgroup is solvable, so the descended member over F(q) is supplied by solvable descent. The chosen completion F(q)_v is ℚ_q, allowing its local representation to be identified with the original D_q representation.
2. Away from ℓ apply full Hilbert local–global compatibility; at q=ℓ apply Skinner Theorem 1 to the descended motivic Hilbert form. No residual condition appears in Skinner’s hypotheses.
3. Potential semistability plus an unramified WD parameter (including N=0) gives crystallinity. The Hilbert eigenvalues/Hodge weights yield global purity; local monodromy purity is a separate R34.6/R19.4 supplier, not inferred merely from good primes.

**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Depends on.** this roadmap: [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-descent`; other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.5`, `AutomorphicGaloisRepresentations:R19.4`, `WeightsInEtaleCohomology:R34.6`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `strict_brauer_system`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, pp.93–94: “Let F (q) be the subfield of F fixed by the decomposition subgroup of” — The decomposition-field local descent argument in KW; the complete coefficient-prime input is supplied by Skinner separately.
- [skinner-2009](#src-skinner-2009), Theorem 1, pp.241–243; proof §2, pp.244–255: “The representation ρπ |Dv is potentially semistable” — Full coefficient-prime compatibility for motivic Hilbert forms, without residual irreducibility.
- [blggt-2014-v4](#src-blggt-2014-v4), §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63: “and these Weil–Deligne representations are pure of weight w.” — Automorphic WD/Hodge purity for polarized motivic Hilbert families. Combined with Skinner and decomposition-field descent; no all-place coefficient theorem is inferred just from BLGGT strictness.

<a id="n-r24-5-kw-theorem-5-1-systems"></a>
### KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts

`R24.5/kw-theorem-5-1-systems` · theorem · planet “Prescribed compatible systems” · part R24.3

Let ρ̄ satisfy KW I Theorem 5.1's hypotheses. For each i ∈ {1, 2, 3, 4} (with the conditions of that type) there are a number field E and an E-rational almost strictly compatible, irreducible, odd system (ρ_ι) lifting ρ̄ whose p-adic member is a lift of required type (i). In case (3), if the residual representation ρ̄_q is irreducible it has Serre weight i + 2 or q + 1 − i up to twist; in case (4), if q is odd and ρ̄_q is irreducible, its weight is q + 1 − (i − j) or i − j when i > j + 1, and q when i = j + 1 (Savitt, Corollary 6.15 and Remark 6.17). With the imported Skinner theorem the same constructed system is strictly compatible; the almost-strict conclusion is the source-faithful KW variant. Good Frobenius polynomials lie in one finite coefficient field and the geometric normalized family is pure by strict-brauer-system.

**Hypotheses and conventions.**

- the residual weight computations (3), (4) use almost strict compatibility at q and Savitt's computations of reductions of potentially Barsotti–Tate representations of tame type (requested)
- when the new residual characteristic q is 2 (KW I §9: case (4) with p = 3, q = 2 and characters of order 3) Savitt's paper does not apply, which is why the proof of KW I Theorem 9.1 gives an ad hoc argument that k(ρ̄′₂) = 2
- F. Diamond's list: the possible (i, j) are j = m(q + 1)/p^r − 1, i = q − 1 − j for 0 < m < p^r/2, so i = j + 1 does not occur

**Proof outline.**

1. The p-adic lift of type (i) (R24.3).
2. Potential modularity of the lift over a Galois F, via Theorem 9.7 as in the proof of Theorem 10.1.
3. The Brauer system and its almost strict compatibility.
4. Residual weights at q from almost strict compatibility and Savitt (and Saito for (4)).

**Acceptance.**

- Check Diamond's list on p = 3, q = 5: r = v₃(6) = 1, m = 1 gives j = 1, i = 3
- Check that the system is odd and irreducible (each member irreducible, Taylor)

**Depends on.** this roadmap: [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system); other roadmaps' layers: `AlgebraicModularFormsAndSerreWeights:R15.4`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `kw_theorem_5_1_systems`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Theorem 5.1, p. 9 of the preprint: “almost strictly compatible, irreducible, odd system” — The theorem.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Remark after Theorem 5.1, p. 10: “The computation of the weights of the residual representations” — Savitt.
- [kw-serre-modularity-II](#src-kw-serre-modularity-II), §10.3.2, p. 94: “bility and Corollary 6.15 (1) of Savitt’s paper” — Residual weights.
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Proof of Theorem 9.1, p. 19 of the preprint: “does not consider the case p = 2” — No Savitt input in residual characteristic two. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="n-r24-5-dieulefait-families"></a>
### Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)

`R24.5/dieulefait-families` · theorem · part R24.3

Dieulefait–Pacetti Theorem 1.11 states: let ρ : G_ℚ → GL₂(K_λ) be odd, irreducible, continuous, finitely ramified and de Rham at p with Hodge–Tate weights {0, k − 1}, k > 1, with ρ̄|_{G_{ℚ(ζ_p)}} absolutely irreducible (non-solvable image if p = 2); then ρ is part of a rank-2 almost strictly compatible system in the sense of DP Definition 1.10 (condition (6) relaxed only at residually reducible coefficient primes with ramified WD_p(ℛ), or p = 2; every member de Rham at its coefficient prime). This packet plans it for the lifts in the scope of R23.4: after a twist ρ̄ satisfies KW I Theorem 5.1's hypotheses, and ρ is of type (A), (B) or (C) at p (for p = 2: crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2). These include the minimal crystalline lifts of DP Theorem 1.9(1)–(3) and the weight-two lifts of DP Theorem 1.9(4) that are crystalline or Steinberg at p, or of KW type (B). Proof: potential modularity of the given lift (R23.4) over a totally real Galois F, then the Brauer system and its almost strict compatibility (R24.5). In this scope strict-brauer-system upgrades the family to KW strict compatibility, which also gives DP's de Rham condition at every member. The rest of DP's statement is a recorded gap: weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need potential modularity through a potentially Barsotti–Tate lifting theorem over totally real fields, and general de Rham lifts (k > p + 1, or potentially semistable of weight > 2) need potential modularity of arbitrary regular de Rham lifts. Neither is supplied by R23.4, and DP's citation [Die04, Theorem 1.1] does not cover them (source issue PotentialModularityAndCompatibleSystems/E5).

**Hypotheses and conventions.**

- it is a statement about a given lift, not about the existence of one: the lift is supplied (by R24.3 or otherwise)
- Dieulefait 2004 (arXiv math/0304433v1, Theorem 1.1) assumes ρ crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1; the proof planned here is KW II's §10.3.2 argument applied to a given lift, not Dieulefait's
- DP's almost strict systems require every member to be de Rham at its coefficient prime; KW's almost-strict definition does not, so the planned conclusion is stated through the strict upgrade

**Proof outline.**

1. R23.4: ρ|_{G_F} modular for some totally real Galois F.
2. R24.5/brauer-induction-system and R24.5/almost-strict-compatibility.

**Acceptance.**

- Check that de Rham with Hodge–Tate weights {0, k − 1} is what R23.4 needs
- Check the p = 2 hypothesis (non-solvable image) against R23.4
- Check that every application of DP Theorem 1.11 in DP §2 (the minimal crystalline lifts of Theorem 1.9(3) at the start of §2 and in Pasos 3 and 6, and the weight-two lifts of Theorem 1.9(4) in Pasos 1 and 6) is either in R23.4's scope or covered by the recorded gap.

**Depends on.** this roadmap: [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system); layers of this roadmap: [R23.4](#layer-r23-4) (see [Cross-part prerequisites](#cross-part-prerequisites)).

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/Basic`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `dieulefait_families`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [dieulefait-pacetti](#src-dieulefait-pacetti), Theorem 1.11, p. 7 of the arXiv version: “representation ramified at finitely many places and de Rham at p” — The statement.
- [dieulefait-pacetti](#src-dieulefait-pacetti), Proof of Theorem 1.11, p. 7 of the arXiv version: “See [Die04, Theorem 1.1].” — Attribution to Dieulefait 2004, whose Theorem 1.1 is narrower (E5).
- [dieulefait-pacetti](#src-dieulefait-pacetti), Definition 1.10(4), p. 7 of the arXiv version: “is de Rham and furthermore crystalline if” — DP's systems are de Rham at every member. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)
- [dieulefait-2004](#src-dieulefait-2004), Theorem 1.1, pp. 1–2 of arXiv:math/0304433v1: “Assume also that q ≥ 2w + 1.” — The hypotheses of the theorem DP cite. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="layer-r24-6"></a>
## R24.6 — Changing residual characteristic

*Coverage in the R24.3 part: planned. 3 nodes, 1 planet.*

The local and residual lemmas used to change the residual characteristic, and the transfer of modularity along a system.

- **Residual members.** The semisimplified reductions of a two-dimensional almost strictly compatible, irreducible, odd system are odd with the reduced determinant; absolutely irreducible for all but finitely many ℓ (bounded conductor and fixed Hodge–Tate weights force a reducible reduction to come from finitely many pairs of characters); for a ≠ b also irreducible over ℚ(ζ_ℓ) for all but finitely many ℓ; of conductor dividing the system's prime-to-ℓ conductor; of the same inertial shape when the inertia image is finite of order prime to ℓ; and of Serre weight a − b + 1 up to twist at large unramified ℓ (Fontaine–Laffaille). For regular weak systems of any rank, R24.5:operations gives irreducibility over F(ζ_l) only on a density-one set.
- **At the coefficient prime.** The almost strict contract alone gives no de Rham or Weil–Deligne statement at ℓ when the residual member is reducible and r_ℓ is ramified. The systems constructed in R24.5 are strict there by Skinner's theorem.
- **Linked systems.** A system with one member attached to a newform has all members attached to it. Two systems with isomorphic residual members at λ are linked, and modularity passes along the link by KW I Theorem 4.1 (R24.4) when its hypotheses hold; residually reducible, ramified de Rham transfer is GL2ModularityLifting R32.6 and is imported.

**Still open in this layer.**

- Resolve the reduction/conductor/weight interfaces and retain the density-one versus cofinite distinction.
- Integrate local strictness from Skinner while importing modern ramified residually reducible transfer solely from R32.6 (RT /21).

<a id="n-r24-6-residual-members"></a>
### Residual members of a compatible system

`R24.6/residual-members` · lemma · part R24.3

Let (ρ_ι) be an E-rational almost strictly compatible, irreducible, odd two-dimensional system of G_ℚ with weights (a, b), and ρ̄_ι the semisimplified reductions. (i) det ρ̄_ι is the reduction of det ρ_ι, and ρ̄_ι is odd. (ii) ρ̄_ι is absolutely irreducible for every ι above all but finitely many primes ℓ (KW I, proof of Theorem 10.1, which uses that the conductor of ρ_ι is bounded independently of ι and that the Hodge–Tate weights are fixed; KW I §8.4 uses it). If moreover a ≠ b, then for all but finitely many ℓ also ρ̄_ι|_{G_{ℚ(ζ_ℓ)}} is absolutely irreducible: for ℓ outside the ramification set with ℓ > 2(a − b) + 1, (v) gives k(ρ̄_ι) = a − b + 1 up to twist, while KW I Lemma 6.2(ii) would force a − b + 1 ∈ {(ℓ + 1)/2, (ℓ + 3)/2} if the restriction were reducible. For regular weakly compatible systems of any rank over any number field, R24.5/residual-irreducibility-density-one gives the restriction statement for every irreducible constituent, but only on a Dirichlet-density-one set of ℓ. (iii) For q ≠ ℓ, the Artin conductor of ρ̄_ι at q divides that of r_q, so N(ρ̄_ι) divides the prime-to-ℓ conductor of the system; the prime divisors of N(ρ̄_ι) are among the ramified primes of the system other than ℓ. (iv) If ρ(I_q) is finite of order prime to ℓ (for instance a dihedral group of order 2t^a with ℓ∤2t), reduction is injective on it, so ρ̄_ι|_{I_q} has the same shape. (v) If ℓ is outside the ramification set, ℓ ≠ 2 and 0≤a−b≤ℓ−2, then ρ_ι is crystalline at ℓ and k(ρ̄_ι) = a − b + 1 up to twist (Fontaine–Laffaille).

**Hypotheses and conventions.**

- (ii) is the argument KW I give at the start of the proof of Theorem 10.1; its restriction clause uses KW I Lemma 6.2(ii) and (v), and is a statement about this rank-two setting. The BLGGT density-one theorem is the general-rank statement and is not needed for (ii)
- (iv) is the reduction step in the proof of KW I Lemma 6.3
- (v) needs the Fontaine–Laffaille range; at the endpoint weights one uses the endpoint arguments instead

**Proof outline.**

1. (i), (iii): reduction of a lattice; conductors only drop under reduction (ArithmeticGaloisRepresentations R01.3).
2. (ii): for ℓ ≫ 0 the member at ℓ is crystalline with Hodge–Tate weights (a, b) in the Fontaine–Laffaille range (plain compatibility), so a reducible ρ̄_ι^ss is a sum of two characters whose restrictions to I_ℓ are the powers of the cyclotomic character attached to a and b and whose prime-to-ℓ conductors divide the fixed conductor of the system. Only finitely many pairs of Dirichlet characters occur, so if infinitely many ι were residually reducible, one pair would give a congruence of all good Frobenius traces modulo infinitely many λ, hence an equality of traces in E, and Brauer–Nesbitt with Chebotarev (ArithmeticGaloisRepresentations R01.5) would make ρ_ι reducible. The restriction to G_{ℚ(ζ_ℓ)} follows from (v) and KW I Lemma 6.2(ii).
3. (iv): the kernel of GL₂(𝒪) → GL₂(𝔽) is pro-ℓ.
4. (v): almost strict compatibility at ℓ and Fontaine–Laffaille.

**Acceptance.**

- Check (iii) on a system with a Steinberg prime q whose reduction mod ℓ becomes unramified at q (level lowering)
- Check (iv) on a dihedral inertia image of order 2·7 reduced modulo 3
- For a dihedral group of even order at ℓ=2, prime-to-ℓ injectivity cannot be used; verify the separate dyadic local input.
- Check (ii) on the Δ family (a − b = 11): ρ̄_ℓ is reducible exactly for ℓ ∈ {2, 3, 5, 7, 691} (Serre, Swinnerton-Dyer), a finite set; ρ̄_23 is irreducible but induced from ℚ(√−23) ⊂ ℚ(ζ_23), so it is reducible on G_{ℚ(ζ_23)}: this is the boundary case ℓ = 2(a − b) + 1 of the restriction clause, with weight 12 = (ℓ + 1)/2 as in KW I Lemma 6.2(ii).

**Depends on.** this roadmap: [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system); other roadmaps' nodes: `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`, `AlgebraicModularFormsAndSerreWeights:R15.4`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/ChangeOfPrime`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `residual_members`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Proof of Theorem 10.1, p. 20 of the preprint: “In both cases it is easy to see that” — (ii).
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §8.4, p. 17 of the preprint: “almost all the residual representations that arise from it are absolutely irreducible” — (ii), the cofinite conclusion as KW use it. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)
- [kw-serre-modularity-I](#src-kw-serre-modularity-I), Lemma 6.2(ii), p. 11 of the preprint: “If ρ̄ is of S-type, p ≥ 3, 2 ≤ k(ρ̄) ≤ p + 1, and ρ̄|GQ(µp ) is reducible,” — (ii), the restriction to G_{ℚ(ζ_ℓ)}: reducibility there forces weight (ℓ+1)/2 or (ℓ+3)/2. (added by REV-PotentialModularityAndCompatibleSystems--R24.3)

<a id="n-r24-6-local-compatibility-at-the-coefficient-prime"></a>
### What an almost strict system says at its own coefficient prime

`R24.6/local-compatibility-at-the-coefficient-prime` · theorem · planet “Local compatibility at the coefficient prime” · part R24.3

For an arbitrary KW almost-strict system and ι above ℓ, the definition gives full WD comparison at q=ℓ if the residual member is irreducible; if ℓ≠2 and r_ℓ is unramified it gives crystallinity and the prescribed Hodge weights. In the other cases its contract alone gives neither de Rham nor WD comparison. For the specific motivic Hilbert/Brauer systems constructed here, strict-brauer-system instead gives de Rham/potential semistability and full WD comparison at every coefficient prime, even for reducible residual members and ℓ=2; unramified r_ℓ then implies crystalline. These assertions are local input lemmas. Application of residually reducible de Rham modularity lifting belongs to GL2ModularityLifting R32.6 and is imported there.

**Hypotheses and conventions.**

- this enumerates the hypotheses under which local compatibility is valid when the new coefficient prime was already ramified: only (a) and (b)
- silently restoring the Weil–Deligne assertion in case (c) would prove strict compatibility, which KW II withdraw

**Proof outline.**

1. Read the two conditional clauses of KW’s almost-strict definition; do not infer a condition in the excluded cases.
2. For the constructed system apply strict-brauer-system, with the full Skinner supplier.
3. Pass this local hypothesis to the R32.6 consumer; no Pan or other modularity-lifting proof is constructed in R24.6.

**Acceptance.**

- Check DP Paso 5 case (1): N ramified in the system and ρ̄_N reducible is case (c)
- Check KW I §8.4: the auxiliary prime p′ is outside the ramification set, so case (b) applies

**Depends on.** this roadmap: [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system); other roadmaps' nodes: `PadicHodgeTheory:R06.3/weil-deligne-descent`; other roadmaps' layers: `AutomorphicGaloisRepresentations:R19.5`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/ChangeOfPrime`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `local_compatibility_at_the_coefficient_prime`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §5, p. 8 of the preprint: “We shall say that such a system is “almost strictly compatible” of Hodge- Tate weights (a, b).” — The almost strict conditions.
- [dieulefait-pacetti](#src-dieulefait-pacetti), Paso 5, p. 14 of the arXiv version: “we only know that it is a de Rham representation.” — The modern route in case (c).

<a id="n-r24-6-linked-systems-modularity-transfer"></a>
### Linked systems and modularity transfer

`R24.6/linked-systems-modularity-transfer` · lemma · part R24.3

If one member of a compatible rank-two family is the member attached to a newform f, all members are attached to f after common coefficient extension, by equality of good Frobenius characteristic polynomials and Chebotarev–Brauer–Nesbitt recognition. Two families are linked at λ when their chosen semisimplified residual members are isomorphic. Given this link to a modular family, the classical congruence transfer is the application of the imported KW I Theorem 4.1 interface when its local and residual-image hypotheses hold. Modern transfer, especially ramified coefficient-prime residually reducible de Rham transfer, is an import from GL2ModularityLifting R32.6, not a new theorem here.

**Hypotheses and conventions.**

- (ii) needs the lifting theorem's residual hypotheses at λ (non-solvable image at 2, cyclotomic irreducibility at odd λ)
- the transfer is along a single residual representation; the conductor and weight of the two systems may differ

**Proof outline.**

1. Compare characteristic polynomials in a common finite coefficient extension.
2. Apply recognition memberwise to the existing f-family.
3. Apply the appropriate owner’s lifting export, retaining all its local/de Rham and residual-image conditions.

**Acceptance.**

- Check (ii) in KW I §8.2's inductive step: (ρ_ι) and (ρ′_ι) linked at ℓ
- Check that the lifting theorem used at each link has its residual hypotheses

**Depends on.** this roadmap: [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1); other roadmaps' nodes: `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`; other roadmaps' layers: `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.3`.

**Proposed location.** `TauCeti/NumberTheory/CompatibleSystems/ChangeOfPrime`, namespace `TauCeti.CompatibleSystems`.

**Suggested file.** omitted signatures `linked_systems_modularity_transfer`. Arithmetic local inertia/Frobenius/WD, labeled Hodge, deformation/automorphic, density, or reductive-model interfaces as required by this node are omitted. Concrete fragment conditions are stated directly; see prerequisites and requests.

**Sources.**

- [kw-serre-modularity-I](#src-kw-serre-modularity-I), §8.2, p. 15 of the preprint: “and another application of Theorem 4.1 yields” — Linked systems.
- [dieulefait-pacetti](#src-dieulefait-pacetti), Remark 4, p. 7 of the arXiv version: “is modular if and only if any given member of the family is.” — (i).

<a id="cross-part-prerequisites"></a>
## Cross-part prerequisites

The two parts were planned side by side, and the R24.3 part cites four layers of the R23.1 part by their stage ids, in fifteen places, although the R23.1 part now has nodes for them. The node graph of both parts together is acyclic, no node uses a node of a later layer, and the R23.1 part cites nothing of the R24.3 part. The stage citations, and the nodes that supply them:

| Consuming node (R24.3 part) | Cites | Supplying node |
|---|---|---|
| [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`…-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`…-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`…-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q) | R24.1, R24.2 | [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring) ("finite over 𝒪 (R24.1, KW II Theorem 10.1)") and [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type) ("an 𝒪′-point (R24.2, KW II Corollary 4.7)") |
| [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection) | R24.2 | The algebraic extraction it means is `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`, which the R24.2 nodes themselves use |
| [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts) | R24.1 | KW Annals Proposition 3.8 is finiteness by Taylor's potential modularity, [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), with the R = T theorem it already cites (`GL2ModularityLifting:R22.3/minimal-ring-finite`) and the finite-image criterion `DeformationAndDerivedPatchingAlgebra:R03.4`; KW II Theorem 10.1 is its later generalisation |
| [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts) | R24.1, R24.2 | R24.2: the R03.4 extraction node above. R24.1: no node. The node needs Snowden's Theorem 6.1.1, finiteness of the global ring with his local rings of definite type over a totally real field, which it calls "the analogue of R24.1". No node of R24.1 states it; it rests on [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity) and an R = T theorem over the totally real field from GL2ModularityLifting. This is a gap in the plan. |
| [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families) | R23.4 | [`R23.4/potential-modularity-of-a-given-lift`](#n-r23-4-potential-modularity-of-a-given-lift) |
| [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility) | R23.5 | [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension) ("(iii) d) of Theorem 6.1": a field disjoint from the kernel of ρ̄_ι) |

At layer level these citations follow the roadmap's order, so none creates a cycle. They are the fixes the R24.3 packet needs: replacing each stage citation by the supplying node, and recording the Snowden finiteness gap. The document shows the packet as it stands.

## Requests to other roadmaps

The parts' requests to other roadmaps, grouped by supplier, each with the exact statement needed and the nodes that need it. Every request is open unless it says otherwise. Two concern upstream Tau Ceti layers that already provide what is asked (`provided-upstream`).

**`AbelianSchemesAndArithmeticModuli:A6`**

- (R23.1 part; open) Beyond the existing A6 functor, quasi-projective scheme-representability and separable geometric-product nodes: preserve smoothness and geometric connectedness, and identify local points topologically with products over places. For a smooth variety not assumed quasi-projective, first choose a dense affine open meeting the finitely many analytic opens. Verify that step rather than assuming all Weil restrictions are schemes. Needed by [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent).

**`AlgebraicModularFormsAndSerreWeights:R15.4`**

- (R24.3 part; open) Serre weights of residual representations for the weight bookkeeping of KW I Theorem 5.1(3),(4), with Savitt's computation of the reductions of potentially Barsotti–Tate representations of tame type (Duke 128 (2005), Corollary 6.15 and Remark 6.17). Needed by [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems), [`R24.6/residual-members`](#n-r24-6-residual-members).

**`AlgebraicModularFormsAndSerreWeights:R15.6`**

- (R24.3 part; open) The definitions of S-type, k(ρ̄), N(ρ̄) and "modular" used in KW I Theorems 4.1 and 5.1. Needed by [`R24.3/required-lift-types`](#n-r24-3-required-lift-types).

**`AlgebraicModuliForArithmeticGeometry:R09.3`**

- (R23.1 part; open) Relative generalized Picard functor for a normal projective curve over a Dedekind base with nonempty finite flat boundary: specialize SchemeAndStackFoundations SF.3–SF.4 representability/divisor inputs, with degree components and boundary rigidification. The general scheme, Chow, Bertini and Picard foundations are owned by SF.3–SF.4 and are not re-planned here. Needed by [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration).

**`ArithmeticGaloisRepresentations:G7`**

- (R24.3 part; open) Export the actual perfect CM/TR polarization pairing and sign/multiplier convention of BLGGT §2.1, its normalized tensor and power operations (CM δ_F/F⁺ correction), plus dimension-general symmetric/exterior operations, continuous induction/restriction, Zariski closures and connected-component representation API. These representation-level definitions are owned by G7; this packet only assembles families. Needed by [`R24.5/polarized-system`](#n-r24-5-polarized-system), [`R24.5/polarized-operations`](#n-r24-5-polarized-operations), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/artin-system`](#n-r24-5-artin-system).

**`ArithmeticGaloisRepresentations:R01.1`**

- (R24.3 part; open) Provide actual continuous representation and integral-lattice/reduction/semisimplification APIs over finite completed coefficient fields, topology on the group action, finite ramification, and coefficient extension. Mathlib Representation is algebraic and ContRepresentation only makes each operator continuous on V. Needed by [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.6/residual-members`](#n-r24-6-residual-members), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data).

**`ArithmeticGaloisRepresentations:R01.2`**

- (R24.3 part; open) Weil–Deligne parameters of ℓ-adic representations and their compatibility with twist, restriction and induction. Needed by [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types).

**`ArithmeticGaloisRepresentations:R01.3`**

- (R24.3 part; open) Artin conductors and their behaviour under reduction. Needed by [`R24.6/residual-members`](#n-r24-6-residual-members).

**`ArithmeticGaloisRepresentations:R01.4`**

- (R24.3 part; open) Residual images: absolute irreducibility and oddness of residual members. Needed by [`R24.6/residual-members`](#n-r24-6-residual-members).

**`ArithmeticGaloisRepresentations:R01.5`**

- (R24.3 part; open) Recognition of semisimple representations by common good Frobenius polynomials (Brauer–Nesbitt with Chebotarev). Also export BLGGT v4 Lemma A.1.5: for a semisimple representation of an arbitrary group over an algebraically closed characteristic-zero field, traces in M and one element with distinct M-rational eigenvalues imply an M-model. Consume the trace pairing, Schur and algebra Wedderburn presentation from upstream SemisimpleAlgebras Layers 1–2; neither traces alone nor arbitrary residual traces remove a coefficient-descent obstruction. Needed by [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda), [`R24.6/residual-members`](#n-r24-6-residual-members).

**`AutomorphicGaloisRepresentations:R19.2`**

- (R23.1 part; open) Galois representations of Hilbert modular forms (Taylor, Invent. Math. 98 (1989)) on the definite quaternionic Hecke algebras, with trace and determinant, and Wiles' ordinary shape (Invent. Math. 94 (1988)): if φ(𝐔_{ϖ_x}) ≠ 0 then ρ̄_φ|_{G_x} ∼ (χ₁ *; 0 χ₂) with χ₂ unramified and χ₂(Frob_x) = φ(𝐔_{ϖ_x}). Needed by [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations), [`R23.3/taylor-2006-lemma-5-1-corollary-5-2-weight-reduction`](#n-r23-3-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction).
- (R23.1 part; open) Hilbert/quaternionic Galois representations for all forms in Taylor/Snowden, with Hecke traces/determinants and ordinary local shape; the Carayol node requiring a finite discrete-series place is not a substitute for the unrestricted Hilbert input. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity), [`R23.3/bcgp-controlled-residual-modularity`](#n-r23-3-bcgp-controlled-residual-modularity).

**`AutomorphicGaloisRepresentations:R19.3`**

- (R24.3 part; open) Supply compatible Hilbert modular eigenform families for every holomorphic cuspidal GL₂ form over totally real F used in KW II §10.3.2, including parallel weight two with [F:ℚ] even and no finite discrete-series place. Prove every member absolutely irreducible (Taylor’s irreducibility result) and family base-change/overlap compatibility. The current R19.2 Carayol Theorem A node has a parity/discrete-series restriction and does not suffice. This construction imports the early R24.5:operations carrier, avoiding a reverse definition dependency. Needed by [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer).

**`AutomorphicGaloisRepresentations:R19.4`**

- (R24.3 part; open) Export away-coefficient local–global compatibility with full monodromy for the general Hilbert modular families of R19.3, including the Taylor/Blasius–Rogawski cases outside the current Carayol parity scope; match the KW and geometric-BLGGT Frobenius/duality normalizations. Needed by [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system).

**`AutomorphicGaloisRepresentations:R19.5`**

- (R23.1 part; open) Crystallinity and Hodge–Tate numbers {−w_x,1−k_x−w_x} for every Hilbert form needed in Taylor Lemma 1.4 when the local level is maximal; include the passage to an auxiliary ramified place used by Taylor [Tay2]. The existing Carayol node only covers its stated parity/auxiliary-place cases and uses the opposite cyclotomic Hodge–Tate convention. Needed by [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l).
- (R24.3 part; open) Add Skinner, Documenta Math. 14 (2009), Theorem 1, pp.241–243: for every motivic holomorphic cuspidal Hilbert form π over a totally real F, with k_τ≥2 and k_τ≡w mod 2, all coefficient-prime restrictions are potentially semistable of Hodge type ((w−k_τ)/2,(w+k_τ−2)/2) in Skinner’s convention and WD(ρ_π|D_v)^Fss≅ι Rec_v(π_v⊗|.|_v^−1/2). There is no residual-irreducibility assumption, no parity/[F:ℚ] restriction, and no finite discrete-series requirement; this completes Saito/Blasius–Rogawski. Current R19.5 has only the narrower Saito/Carayol route. Translate to the KW all-place local convention explicitly. Needed by [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system), [`R24.6/local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility).

**`AutomorphicGaloisRepresentations:R19.6`**

- (R23.1 part; open) Galois representations of Hilbert modular forms and their residual representations over totally real F, as used in KW II §10.1. Needed by [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring).

**`DeformationAndDerivedPatchingAlgebra:R03.3`**

- (R24.3 part; open) For a complete DVR 𝒪, A=𝒪[[x₁,…,x_n]] is regular local of dimension n+1; a system of parameters in a Cohen–Macaulay local ring is regular, and its permutations in the maximal ideal remain regular; Krull height and finite torsion-free ⇒ flat over a DVR give Böckle Lemma 2. Existing regular-local-cohen-macaulay only covers minimal generators of the maximal ideal, not arbitrary parameter systems. Supply the exact parameter-system theorem and formal-power-series instances. Needed by [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection).

**`DeformationAndDerivedPatchingAlgebra:R03.4`**

- (R23.1 part; open) Finiteness criteria for deformation rings: R is finite over 𝒪 iff the universal residual representation has finite image (KW Annals Lemma 3.6; KW II §10.1 via [31] 3.14). Needed by [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring).

**`EndoscopicTransferAndUnitaryTraceComparison:ET.6`**

- (R24.3 part; open) The local L-factor L(WD, s) and the local constant ε(WD, ψ, s) of a Frobenius-semisimple Weil–Deligne representation of W_{F_v}, F_v/ℚ_p finite, with Deligne's normalisation: additivity, inductivity in degree zero, and the unramified case ε = 1 when WD and ψ are unramified. BLGGT §5.1 take ψ_v(x) = ψ_p(tr_{F_v/ℚ_p}(x)) with ψ_p|_{ℤ_p} = 1 and ψ_p(1/p) = e^{−2πi/p}, and form ε(ıℛ, s) as the product of ε(ıWD_v(ℛ), ψ_v, s) over finite v with the archimedean and Hodge factors. Needed by [`R24.5/system-l-functions`](#n-r24-5-system-l-functions).

**`GL2AutomorphicRepresentationsAndTransfer:R17.3`**

- (R23.1 part; open) The Jacquet–Langlands correspondence for the definite quaternion algebra over a totally real field of even degree, in the form of Taylor 2006 Lemma 1.3: S_{(k⃗,w⃗),ℚ̄_l,ψ}(U_l) modulo its one-dimensional part is ⊕ π^{∞,l} ⊗ π_l^{U_l} over regular algebraic cuspidal π of weight (k⃗, w⃗) and central character ψ_i. Needed by [`R23.3/taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations`](#n-r23-3-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

**`GL2AutomorphicRepresentationsAndTransfer:R17.4`**

- (R23.1 part; open) Langlands' solvable base change and descent for GL₂ over totally real fields, as used for the intermediate fields of the potential-modularity extension. Needed by [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity).
- (R24.3 part; open) Langlands' solvable base change and descent for Hilbert modular forms, as used in KW II §§9–10 (descent of modularity along allowable base changes; the π_i of the Brauer argument). Needed by [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system).

**`GL2AutomorphicRepresentationsAndTransfer:R17.5`**

- (R23.1 part; open) Langlands–Tunnell for the solvable-image branch of KW II Theorem 6.1. Also automorphic induction of the algebraic Hecke character of LE attached to ψ, giving the modularity of (Ind_{G_L}^{G_F} ψ)|_{G_E} that Taylor 2002 uses before Theorem 1.6, and the strong Artin conjecture in the soluble cases (Tunnell; Rogawski–Tunnell) for Theorem 1.6's soluble branch. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`](#n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l).

**`GL2AutomorphicRepresentationsAndTransfer:R17.6`**

- (R23.1 part; open) Export R17.4’s soluble base-change/descent with invariance and cuspidality hypotheses, determinant, central character and local type compatibility; never infer descent over arbitrary intermediate fields. Needed by [`R23.5/control-of-the-extension`](#n-r23-5-control-of-the-extension), [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity).
- (R24.3 part; open) Supply the overlap/descent identification used to compare Mackey pairing summands for two solvable subfields of a finite totally real Galois extension. For families restricting to the same absolutely irreducible family over F, Hom over overlap fields carries a finite character determined from the fixed p-member and independent of ℓ; this proves the Brauer class has norm one. Needed by [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system).

**`GL2ModularityLifting:R22.3`**

- (R24.3 part; open) Supply Böckle Appendix 1 Theorem 1 in the 2003 Khare setting: an auxiliary R_Q≅T_Q of finite flat W(k)-algebras implies minimal R_∅≅T_∅. The current minimal-ring-finite conclusion alone is weaker than this integral isomorphism. Needed by [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t).

**`GL2ModularityLifting:R22.4`**

- (R23.1 part; open) KW II Theorem 8.2: level lowering/minimal modular lifts after allowable base change, with fixed central character and weight/local type, including dyadic and p=3 cases; Skinner–Wiles base-change theorem as used there. No exact supplier node yet states this full theorem. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument).

**`GL2ModularityLifting:R22.5`**

- (R23.1 part; open) Snowden 4.4.2 (built from 4.1.1 and 4.4.1): for an odd auxiliary prime ℓ over a totally real field, a weight-two odd finitely ramified representation satisfying (A1),(A2), finite-order det·χ_ℓ^{-1}, and local A/B/C types matching a modular residual witness is modular. Verify these hypotheses for the auxiliary induced/Tate representation in Snowden 5.1.1. KW odd-prime-lifting supplies its exact KW case; it is not a substitute for all Snowden totally-real type data. R22.6 supplies only dyadic lifting. Needed by [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity).
- (R24.3 part; open) Export the full odd-prime KW I Theorem 4.1(2), as proved in KW II §10.2: cyclotomic absolute irreducibility, modular residual input, finite ramification, crystalline weights 2≤k≤p+1 (including k=p+1 with residual weight 2) or potentially semistable weight two. The current kw-odd-prime-lifting node only states narrower Theorem 9.7 data. Include the weight/solvable-base-change reductions without finiteness Theorem 10.1, potential modularity, or lift-existence inputs. Needed by [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1).

**`GlobalGaloisDeformations:R04.6`**

- (R23.1 part; open) Finite restriction map for the fixed-determinant GL2 problem after a residual-irreducibility-preserving soluble CM extension, and the polarized comparison needed to specialize Thorne 10.2. Also global dimension bound BG19 Prop. 4.2.6 with prescribed components, and continuity/residual compatibility of points. Identify an independent owner/interface for Snowden Theorem 7.6.1 (global lift existence) used by his residual soluble descent; verify its prerequisites without substituting this packet’s R24.2 or creating a residual-modularity cycle. Needed by [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction), [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity).

**`HilbertModularVarietiesAndShimuraCurves:H6`**

- (R23.1 part; open) For Taylor 2002 §1 and Taylor 2006 §4 (RS-23 leaves R23.2 only the verification for Taylor's data): M-HBAVs (A, i, j) with ordered invertible O_M-modules and P(A, i) (Rapoport §1); the fine moduli space X/F of M-HBAVs with level structures m_λ : V_λ ≅ A[λ] and m_℘ : V_℘ ≅ A[℘] matching fixed alternating pairings a_λ, a_℘ with the j(1)-Weil pairings, fine when ker(GL₂(O_{M,λ}) → GL₂(O_M/λ)) is torsion-free, smooth, geometrically connected by the uniformisation of X(F ⊗_{F_x} ℂ) by [M : ℚ] copies of the upper half plane, and quasi-projective (Theorem G needs it; Taylor does not state it); the moduli of E-HBAVs with b₀-level structure, the group Γ, and the twists X_{R,ψ} by (R, ψ) ∈ H¹(G_ℚ, Γ) with the description of their F-points by quadruples with descent data κ_σ (Taylor 2006, pp. 759–760). Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application).
- (R23.1 part; open) Export the chosen smooth quasi-projective geometrically irreducible component of the simultaneous torsion/polarisation twist, compatible pairings and determinant, and nonempty real/finite local opens for Taylor 2002, Taylor 2006, KW II dyadic cases and Snowden over a totally real base. This includes integral ordinary tubes. All moduli/local constructions have this one owner. Needed by [`R23.2/local-points-at-l-p-infinity-and-the-point-over-E`](#n-r23-2-local-points-at-l-p-infinity-and-the-point-over-e), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity).

**`HilbertModularVarietiesAndShimuraCurves:R18.3`**

- (R23.1 part; open) Khare, level-one paper (Duke 2006), Lemma 2.2: the neatness/small-prime input used in KW II §6 and Theorem 8.2 and Taylor weight adjustment. This is not owned by R20.6, avoiding the recorded cycle. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity).

**`LocalGaloisDeformationRings:L8`**

- (R23.1 part; open) The ordinary R† with a chosen Frobenius eigenvalue versus flag-based ordinary local conditions; compare to Thorne semistable ordinary fixed-Hodge-type rings without identifying them by name alone. Needed by [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness), [`R24.1/cg-ordinary-ring-finiteness`](#n-r24-1-cg-ordinary-ring-finiteness).

**`LocalGaloisDeformationRings:R08.2`**

- (R23.1 part; open) Khare Duke 2006 Lemma 4.2: finite inertia image for a continuous local representation at l≠p into GL2 of the relevant complete characteristic-p coefficient ring; prove it from the exact local-ring inertia conditions if the printed lemma cannot be obtained. Needed by [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument).

**`LocalGaloisDeformationRings:R08.6`**

- (R23.1 part; open) Export nonempty local components of the specified inertial/Hodge/monodromy types, including the NT Steinberg component and the local ring maps used to read points. Needed by [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction).
- (R24.3 part; open) Snowden's local deformation rings of definite type (Propositions 7.3.1 and 7.4.1 of arXiv:0905.4266): nonzero, of the right dimension, for every definite type compatible with ρ̄|_{G_{F_v}}, including v | p (weight two), with the existence of a definite-type lift of the same conductor (Proposition 7.7.1). Needed by [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts).
- (R24.3 part; open) Export KW I §5’s minimal-lift definition in all inertia cases, including the exceptional dyadic induction from a ramified quadratic extension with the determinant-correcting quadratic character. Prove KW I p.10 Remark: for odd q∥N(ρ̄), p∤q−1, every geometric lift with q∥N(ρ) is minimal at q. Existing kw-local-conditions/export-away-from-p do not state this exact recognition criterion. Needed by [`R24.3/required-lift-types`](#n-r24-3-required-lift-types).

**`OrdinaryAutomorphicFormsAndModularityLifting:R21.4`**

- (R23.1 part; open) Ordinary big R=T and fixed-weight specialization giving finite unframed rings, sufficient for the GL2 specialization of Thorne 10.2. State exceptional residual-image hypotheses and the passage to a polarized CM problem explicitly. Needed by [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness), [`R24.1/cg-ordinary-ring-finiteness`](#n-r24-1-cg-ordinary-ring-finiteness).

**`OrdinaryAutomorphicFormsAndModularityLifting:R21.5`**

- (R23.1 part; open) Skinner–Wiles, Nearly ordinary deformations of irreducible residual representations (2001), Theorem 5.1: modularity of a nearly ordinary ρ over a totally real field with ρ̄^{ss} irreducible and D_i-distinguished and a χ₂-good nearly ordinary modular lift (planned as R21.5/nearly-ordinary-irreducible-lifting, whose hypothesis (iii) excludes the case below). Taylor 2002 and 2006 need it for residual representations induced from a CM field in which the places above p split (OrdinaryAutomorphicFormsAndModularityLifting/E11). Needed by [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l).

**`OrdinaryAutomorphicFormsAndModularityLifting:R21.6`**

- (R23.1 part; open) The ordinary modularity lifting theorems (Skinner–Wiles) used in Taylor's ordinary case of potential modularity. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f).

**`PadicFamilies:L5`**

- (R23.1 part; open) Use PadicFamilies:L5/hida-control-nearly-ordinary for the existing parallel-weight algebraic specialization on its even-degree, finite-order torus-character scope. Beyond that theorem, supply totally real Hida control, with ordinary weight-two input of inertial type ω^{k−2}⊕1 and passage to an unramified parallel-weight-k modular witness, including the endpoint caveats in KW II p. 57. For NT Lemma 3.1 also supply the Hida specialization producing determinant ε^{-2}ω and Hodge–Tate weights {0,2} at every p-adic place. The existing node alone does not construct the required family or supply the endpoint/local-type nonemptiness statements. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction).

**`PadicHodgeTheory:R06.2`**

- (R24.3 part; open) Provide actual labeled Hodge–Tate multisets and coefficient/base-field transport for continuous completed-field representations; direct sums, tensor products, duals, symmetric/exterior powers, restriction and induction have the stated multiset formulas. Rank-one finite-image representations are potentially unramified/de Rham with all weights zero. Needed by [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data).

**`PadicHodgeTheory:R06.4`**

- (R23.1 part; open) Torsion Fontaine–Laffaille classification over unramified local fields in the exact weight range of Taylor 2006 Lemma 1.4 and Corollary 1.5, with tame fundamental-character exponents, semisimplification, and his Hodge–Tate sign convention. The existing rational crystalline-comparison node does not supply this classification. Needed by [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l).

**`SchemeAndStackFoundations:SF.1`**

- (R23.1 part; open) Finite-group free-action quotient, finite étale Isom scheme of H-torsors, and local permutation-orbit construction/Krasner openness used by Calegari 3.2; no group-quotient moduli are redefined here. Needed by [`R23.1/function-field-isomorphism-torsor`](#n-r23-1-function-field-isomorphism-torsor), [`R23.1/potential-global-galois-local-data`](#n-r23-1-potential-global-galois-local-data).

**`SchemeAndStackFoundations:SF.2`**

- (R23.1 part; open) SGA1 V.6.9, comparison of geometric fundamental groups under algebraically closed base extension, and Chebotarev for finite étale covers of schemes of finite type over O_F (Serre Cor. 9.12), not just number-field Chebotarev. For corrected BCGP 9.1.12, give the same finite-cover specialization argument over an arbitrary number field E′ and after Weil restriction to E; Bianchi’s CM/ℚ-Galois conclusion cannot be applied directly. Needed by [`R23.1/function-field-isomorphism-torsor`](#n-r23-1-function-field-isomorphism-torsor), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent).

**`SchemeAndStackFoundations:SF.3`**

- (R23.1 part; open) Smooth proper curve Picard functor/representability, compactness of Pic^0(F) for a locally compact field, Cartier divisors/symmetric powers and the Riemann–Roch/duality/base-change statements needed for MB II 3.4–3.6. Extend the pinned invertible-sheaf and isomorphism-class API rather than replan it. Needed by [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration), [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient).

**`SchemeAndStackFoundations:SF.4`**

- (R23.1 part; open) Spreading out and normal projective compactification of a smooth curve; Chow’s lemma and Bertini containing a specified finite subscheme, as in MB II 1.4, 2.3, 3.1. The present proof only needs these precise cases. Needed by [`R23.1/elementary-reductions-of-skolem-data`](#n-r23-1-elementary-reductions-of-skolem-data), [`R23.1/reduction-to-relative-dimension-one`](#n-r23-1-reduction-to-relative-dimension-one), [`R23.1/theorem-g-from-moret-bailly`](#n-r23-1-theorem-g-from-moret-bailly).

**`SerreWeightAndLevelOptimisation:R20.3`**

- (R23.1 part; open) Gross Theorem 13.10 and Props. 8.13/8.18 and Coleman–Voloch: precise residual weight and weight-two witness in KW II’s solvable-image branch, and the companion/weight-control inputs of Taylor 2006 §5. Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f).

**`SerreWeightAndLevelOptimisation:R20.6`**

- (R24.3 part; open) The weight part of Serre's conjecture for modular ρ̄ as KW II §10.2 uses it: ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) with p ∤ N and from S₂(Γ₁(Np)) (Gross, Theorem 13.10 and Propositions 8.13, 8.18; Coleman–Voloch). Needed by [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity).

**`WeightsInEtaleCohomology:R34.6`**

- (R24.3 part; open) Export Hilbert eigenform purity in geometric normalization: common good Frobenius roots of absolute square q_v^w, H_{cτ}=w−H_τ, and pure full WD parameters at all finite places for the motivic cuspidal Hilbert families used by KW. This owner supplies purity; the compatible-system carrier does not invoke an eigenform existence theorem. Needed by [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system).

**`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`**

- (R23.1 part; open) Dirichlet-density Chebotarev for number fields, with primes outside any finite set; used to generate a finite Galois group and force avoidance. Needed by [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate).

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**

- (R24.3 part; open) ClassFieldTheory, Part II: extend the existing global reciprocity interface to the ℓ-adic realization and converse classification of finitely ramified algebraic/de Rham one-dimensional characters as type-A₀ Hecke characters, with a common number field and geometric-Frobenius convention. Consume Hecke carriers and their infinity-type purity from GlobalNumberFields Layers 9–10, and request local de Rham/crystalline and WD purity comparisons from PadicHodgeTheory R06.2–R06.3. BLGGT Appendix A.2 and ACC+ p.197 identify the required character interface. Do not rebuild global reciprocity or general characters here. Needed by [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity).

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`**

- (R23.1 part; open) Global existence and reciprocity for finite idele-class characters, including the congruence-subgroup/S-unit argument and finite ray-class quotient used in CHT 4.1.1; local reciprocity identifies cyclic local extensions. Taylor Lemma 1.1 additionally needs algebraic CM idele characters of prescribed cyclotomic norm; the finite-order extension lemma alone is insufficient. Needed by [`R23.1/cht-character-extension`](#n-r23-1-cht-character-extension), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions), [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions).

**`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`**

- (R23.1 part; open) Local Artin reciprocity on finite-order and p-adic characters, with arithmetic/geometric Frobenius conventions and cyclotomic normalization, as used in CHT 4.1.2 and Taylor 2002 Lemma 1.1. Needed by [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions), [`R23.1/cht-soluble-prescribed-completions`](#n-r23-1-cht-soluble-prescribed-completions).

**`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`**

- (R24.3 part; provided-upstream) Consume the existing upstream Hecke-character carrier, conductor and algebraic infinity-type/purity interface. This is an existing-interface import: no new character definition, reciprocity theorem or eigenform construction is requested here. Needed by [`R24.5/character-system`](#n-r24-5-character-system).

**`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`**

- (R24.3 part; provided-upstream) Consume the existing upstream Hecke-character carrier, conductor and algebraic infinity-type/purity interface. This is an existing-interface import: no new character definition, reciprocity theorem or eigenform construction is requested here. Needed by [`R24.5/character-system`](#n-r24-5-character-system).

**`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`**

- (R24.3 part; open) Brauer's induction theorem for a finite group G over ℂ: 1 = Σ n_i Ind_{H_i}^G ψ_i in the virtual character ring with n_i ∈ ℤ, H_i elementary (hence soluble) and ψ_i linear characters, together with the induced-character formula, Frobenius reciprocity and Mackey's formula of Layers 2–3. BLGGT §5.4 (8)(f) apply it to G = Gal(F′/F) and transport it to ℓ-adic Galois representations by ı^{−1}. Needed by [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system).

## Gaps

What the plan could not establish, numbered G1–G29 across the two parts (G1–G22 from the R23.1 part, G23–G29 from the R24.3 part). Each names the exact missing input and the nodes that need it. Most are proof inputs the sources cite without proof, or supplier statements whose exact form is still to be verified; none is a missing target.

<a id="gap-1"></a>
**G1. Imported foundations of Moret-Bailly's proof** (R23.1 part)

Verified: the places where each import is invoked (Remarque 1.4: Chow's lemma EGA II 5.6; Lemme 2.3: Bertini, Jouanolou ch. I thm 6.3; 3.4: representability of Pic via Murre, SGA 6 XII 1.5; Lemme 3.10.2: Altman-Kleiman, Compactifying the Picard scheme I-II; Lemme 3.8: strong approximation, Cassels-Fröhlich II section 15, extended by the source 'immédiatement' from R to a projective R-module; Lemme 3.10.4: Dirichlet unit lattice, Cassels-Fröhlich II section 18; Lemme 3.6: vanishing of R^1 by duality on the Gorenstein X̄). Not verified: any of these imported statements; none of the cited books was read. Geometry is requested from SchemeAndStackFoundations SF.3–SF.4, with relative moduli adapters from AlgebraicModuliForArithmeticGeometry R09.3. Strong approximation and S-unit compactness have the separate precise gap below; their supplier allocation and statements still require verification.

Needed by [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration), [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient), [`R23.1/local-picard-open-sets-and-strong-approximation`](#n-r23-1-local-picard-open-sets-and-strong-approximation), [`R23.1/reduction-to-relative-dimension-one`](#n-r23-1-reduction-to-relative-dimension-one).

<a id="gap-2"></a>
**G2. Khare's Lemma 2.2 (p = 3) and Conrad–Diamond–Taylor Lemmas 3.1.1 and 4.2.4 (used by Taylor 2006 §5) are unread** (R23.1 part)

Taylor 2006 Theorem 5.7's printed proof (p. 771) cites Lemmas 5.6, 1.3 and 5.3; all these and the §5 weight-adjustment statements were read and planned. KW II (p. 56) excludes p=3 from Taylor's §5 and cites Lemma 2.2 of Khare, Serre's modularity conjecture: the level one case (Duke 134), for that prime. Khare's Duke lemma and Conrad–Diamond–Taylor Lemmas 3.1.1 and 4.2.4 (JAMS 12 (1999)), which Taylor Lemma 5.4 imports, remain unread. Obtain the Duke version rather than assuming the numbering of arXiv:math/0504080v1 agrees. Khare's small-prime input is requested from HilbertModularVarietiesAndShimuraCurves R18.3, and the weight/local-level interface from R20.3/R22.4.

Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f), [`R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level`](#n-r23-3-taylor-2006-lemmas-5-4-5-6-weight-and-level), [`R23.3/taylor-2006-theorem-5-7-serre-weight-at-level-one`](#n-r23-3-taylor-2006-theorem-5-7-serre-weight-at-level-one), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity).

<a id="gap-3"></a>
**G3. KW II Theorem 8.2 and the Gross/Coleman-Voloch weight results are imported into Theorem 6.1** (R23.1 part)

Verified: the solvable-image branch of Theorem 6.1 (p. 54) uses Langlands-Tunnell, Gross Theorem 13.10 and Propositions 8.13, 8.18, Coleman-Voloch, and then 'the theorem follows from Theorem 8.2 below'; Theorem 8.2 (pp. 71-73, read) is a level-lowering/minimal-at-p statement after allowable base change, proved with definite quaternion algebras (section 7), Lemmas 7.3, 7.4, 7.7, 7.10, 8.3 and Lemma 2.2 of [60] (Taylor, icosahedral II). Not decomposed here. The full Theorem 8.2 interface is requested from GL2ModularityLifting R22.4; the Gross/Coleman–Voloch inputs are requested from SerreWeightAndLevelOptimisation R20.3. These are requests, not claims that an existing node already supplies them.

Needed by [`R23.3/kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F`](#n-r23-3-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f).

<a id="gap-4"></a>
**G4. Lemma 4.2 of Khare [33] (finite ramification of the universal residual representation) cannot be located in the library copy** (R23.1 part)

Verified: KW II (p. 91) uses 'Lemma 4.2 of [33]' with [33] = Khare, Serre's modularity conjecture: the level one case, Duke Math. J. 134 (2006). The preprint arXiv:math/0504080v1, whose numbered results are Propositions 2.1, 2.2, 3.1 and Lemmas 5.1-5.4; it has no Lemma 4.2. KW Annals Lemma 3.9 (read) proves the analogous statement for minimal deformations: the order of ρ^univ(I_l) mod p equals that of ρ̄(I_l). Not verified: the statement for the rings of 10.1, where the local conditions at l ≠ p are the inertia-rigid rings of KW II 3.3 (finite inertia image by construction). Next action: obtain the Duke version of [33] and read its Lemma 4.2; alternatively derive condition (4) from the inertia-rigid definitions of KW II 2.7 and 3.3.

Needed by [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument).

<a id="gap-5"></a>
**G5. Propositions 9.2–9.3 and Theorem 8.2 of KW II over F are imported** (R23.1 part)

Theorem 10.1 is a corollary of Theorems 6.1 and 8.2 and Propositions 9.2–9.3. The finiteness over F is GL2ModularityLifting R22.3/minimal-ring-finite and the lifting theorems R22.5/R22.6; KW II Theorem 8.2 (minimal modular lifts after allowable base change) has no node there yet.

Needed by [`R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring`](#n-r24-1-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring).

<a id="gap-6"></a>
**G6. Taylor's use of Skinner–Wiles 2001 falls in the case of OrdinaryAutomorphicFormsAndModularityLifting/E11** (R23.1 part)

Verified on the page images: Taylor 2002 (printed p. 15) applies Theorem 5.1 of [SW3] to T_℘A with residual representation (Ind_{G_L}^{G_F} ψ̄)|_{G_E}, L totally imaginary with every place above p split (printed p. 9); Taylor 2006 (pp. 762–763) applies Theorem 5.1 of [SW2] to T_{℘₁}B with residual Ind_{G_{FM}}^{G_F}(χ_{℘₁}), M imaginary quadratic and p₁ split. Both residual representations are induced from a CM field in which the places above p split, where Skinner–Wiles 2001's Lemma 2.2 bound fails (OrdinaryAutomorphicFormsAndModularityLifting/E11), so the planned R21.5 theorem excludes them. Taylor 2006 names an alternative: 'the main theorem of [SW1], theorem 3.3 of this paper and a standard descent argument', where [SW1] is Skinner–Wiles, Base change and a problem of Serre (Duke 2001, itself unread) and Theorem 3.3 is a crystalline R = T theorem for residual representations irreducible over F(√((−1)^{(l−1)/2}l)); for Taylor 2002 a lifting theorem assuming residual irreducibility over E(ζ_p) might serve (L ⊄ F(ζ_p) is part of Taylor's choice). Not checked. The issue is partly known: Khare–Wintenberger I cite C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'; a 2009 preprint), as a correction to Skinner–Wiles 2001; it was not obtained.

Needed by [`R23.3/modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar`](#n-r23-3-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar), [`R23.3/taylor-2006-potential-modularity-when-residually-irreducible-at-l`](#n-r23-3-taylor-2006-potential-modularity-when-residually-irreducible-at-l).

<a id="gap-7"></a>
**G7. Taylor 2002 Lemma 1.3 and Corollary 1.7 have no printed proofs** (R23.1 part)

Verified on the page images: Lemma 1.3 (printed p. 12) is 'proved in the same way as lemma 1.2 but is much easier so we leave the details to the reader'; Corollary 1.7 (printed p. 16) is stated without proof.

Needed by `HilbertModularVarietiesAndShimuraCurves:H6`, [`R23.3/taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l`](#n-r23-3-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l).

<a id="gap-8"></a>
**G8. Skinner–Wiles, Base change and a problem of Serre (Duke 2001), used by Taylor 2006 Corollary 5.5, remains an unread supplier input** (R23.1 part)

Verified: Taylor 2006, p. 769, obtains Corollary 5.5 by 'combining the lemma 5.4 with the main theorem of [SW1]', [SW1] = Skinner–Wiles, Duke Math. J. 107 (2001), 15–25 (p. 778). The same paper is a gap of OrdinaryAutomorphicFormsAndModularityLifting (used in Skinner–Wiles 2001 Theorem 5.1) and is used by Taylor's KW Annals Theorem 2.1; it is not freely readable. The exact allowable-base-change/level-adjustment use is included in the R22.4 request; R17.4 supplies automorphic base change and descent. Their generic statements do not certify this unread source input.

Needed by [`R23.3/taylor-2006-lemmas-5-4-5-6-weight-and-level`](#n-r23-3-taylor-2006-lemmas-5-4-5-6-weight-and-level), [`R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity`](#n-r23-3-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity).

<a id="gap-9"></a>
**G9. Local points outside finitely many places and function-field Chebotarev** (R23.1 part)

Need spreading out plus Lang–Weil/Weil point bounds for smooth geometrically connected varieties, smooth Hensel lifting, and arithmetic function-field Chebotarev with constant-field congruences (BHKT Theorem 2.1). Number-field density alone does not supply the latter. For fixed constants need two large places of coprime residue degrees. These exact prerequisites were read where invoked, not proved or verified in a supplier.

Needed by [`R23.1/forcing-linear-disjointness-by-extra-split-places`](#n-r23-1-forcing-linear-disjointness-by-extra-split-places), [`R23.1/function-field-point-with-fixed-constants`](#n-r23-1-function-field-point-with-fixed-constants), [`R23.1/frobenius-primes-generate`](#n-r23-1-frobenius-primes-generate).

<a id="gap-10"></a>
**G10. Strong approximation and S-unit compact quotient** (R23.1 part)

The curve proof needs strong approximation off an omitted place for a finite projective R-module with fixed boundary values, the S-unit lattice/cocompactness K_Σ^×/R^× for incomplete data, and its finite-flat Z analogue. The standard cited book inputs are not silently replaced by weak approximation or ordinary Dirichlet units. Their exact supplier allocation remains to be settled; MB II §§3.8–3.10 states how they are used.

Needed by [`R23.1/local-picard-open-sets-and-strong-approximation`](#n-r23-1-local-picard-open-sets-and-strong-approximation), [`R23.1/quasi-compactness-of-the-generalized-jacobian-quotient`](#n-r23-1-quasi-compactness-of-the-generalized-jacobian-quotient).

<a id="gap-11"></a>
**G11. Exact local-completion refinement and Jordan** (R23.1 part)

Bianchi 4.5.1’s first part needs BLGGT Prop. 3.1.1 (not downloaded/read in this pass): equality of completions and ℚ-Galois/CM output under equivariant local fields. The three-condition theorem only yields an embedding into L_v. Calegari 3.2 and Bianchi’s refinement also require Jordan: a subgroup of a finite group meeting every conjugacy class is the whole group. This is a finite-group supplier need, presently recorded here rather than mistaken for a number-field Chebotarev consequence.

Needed by [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.1/potential-global-galois-local-data`](#n-r23-1-potential-global-galois-local-data), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent).

<a id="gap-12"></a>
**G12. Moret–Bailly 1990 potential inverse-Galois theorem** (R23.1 part)

Moret–Bailly, Extensions de corps globaux à ramification et groupe de Galois donnés, C. R. Acad. Sci. Paris 311 (1990), 273–276, Theorem 1.2, is quoted in BHKT Theorem 9.3 and Calegari/BCGP. The 1990 original has not been obtained. The function-field local-Galois assertion therefore ends in this exact source gap; it is not confused with the soluble number-field CHT lemma.

Needed by [`R23.1/potential-global-galois-local-data`](#n-r23-1-potential-global-galois-local-data).

<a id="gap-13"></a>
**G13. Snowden auxiliary and residual soluble descent inputs** (R23.1 part)

The residual export requires Snowden §5.4’s auxiliary modular representation satisfying (A1),(A2), his weight-two matching-type lifting Theorem 4.4.2, and his independent global lift-existence Theorem 7.6.1 in the residual soluble-descent step (8.1.1). The last statement must be requested from the appropriate global-lift owner and checked for a cycle before using it. It cannot be substituted by this packet’s R24 existence theorem. The 8.2.1 theorem statement and its proof sketch are accounted for, but the imported inputs are not closed.

Needed by [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity).

<a id="gap-14"></a>
**G14. Ordinary finiteness specialization hypotheses** (R23.1 part)

Thorne 10.2 is a polarized CM GL_n theorem, with adequate cyclotomic residual image, ζ_p∉F, an ordinary RAECSDC lift and a fixed ordinary Hodge type. The GL2-over-totally-real restriction map/polarized adapter and R† comparison are requested, not yet supplied. CG’s small-image/scalar-unramified hypotheses and NT’s selected components need exact applicability checks: absolute irreducibility is not adequacy. These are the precise remaining barriers to the extended finiteness exports.

Needed by [`R24.1/ordinary-global-ring-finiteness`](#n-r24-1-ordinary-global-ring-finiteness), [`R24.1/cg-ordinary-ring-finiteness`](#n-r24-1-cg-ordinary-ring-finiteness), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction).

<a id="gap-15"></a>
**G15. Integral point to continuous p-adic lift adapter** (R23.1 part)

The exact R03.4 node gives a unit-reflecting algebra map to a finite integral closure. It does not provide a p-adic topology, a chosen residue embedding, a complete local target or a framed lift. Those require the finite p-adic-field/integral-closure identification, continuity of local maps, formal-smooth framing specialization and the universal Galois representation’s continuity. Finiteness plus nonzeroness alone is refuted by O/(p); the dimension bound ≥1 is essential.

Needed by [`R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type`](#n-r24-2-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type), [`R24.2/newton-thorne-khare-wintenberger-extraction`](#n-r24-2-newton-thorne-khare-wintenberger-extraction).

<a id="gap-16"></a>
**G16. Taylor Lemma 1.1 algebraic characters and S-unit congruence input** (R23.1 part)

Construct ψ₀ with ε_p^{-1}det Ind ψ₀ of finite order and finite inertia at the selected split places, and verify Taylor [Ta2] Lemma 2.1: every finite-index subgroup of L_S× contains the inverse image of an open congruence subgroup away from S∪T, with the c−1 quotient argument. Neither the CHT finite character extension nor the existing global reciprocity stage is cited as providing these additional assertions.

Needed by [`R23.2/taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions`](#n-r23-2-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions).

<a id="gap-17"></a>
**G17. Odd auxiliary modularity lifting with Snowden type data** (R23.1 part)

The dyadic R22.6 node cannot supply an odd auxiliary prime. The R22.5 KW node has narrower field/local hypotheses than Snowden 4.4.2. Verify or request the exact Snowden auxiliary lifting interface before using the Tate representation to transfer modularity; this input must be independent of R24.2 global lift extraction.

Needed by [`R23.3/snowden-totally-real-potential-residual-modularity`](#n-r23-3-snowden-totally-real-potential-residual-modularity).

<a id="gap-18"></a>
**G18. Torsion Fontaine–Laffaille and full Hilbert crystallinity input** (R23.1 part)

The rational FL comparison node is a near miss for inertial-character classification of mod-l lattices. The R19.5 Carayol node requires parity or an auxiliary place; Taylor Lemma 1.4 ranges over all forms after its reduction. Verify the torsion theorem, auxiliary-place passage and negative Hodge–Tate convention before the proof is closed.

Needed by [`R23.3/taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l`](#n-r23-3-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l).

<a id="gap-19"></a>
**G19. Weil restriction of varieties: property and analytic-open adapter** (R23.1 part)

Use the existing A6 functor, scheme-representability criterion and geometric product. Still need smoothness/geometric connectedness preservation and the topological local-point product; for nodes 37 and 38 choose a dense affine open meeting all local opens before restriction. Finite étale Weil restriction of abelian schemes is a different statement and cannot supply these variety assertions.

Needed by [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient), [`R23.2/restriction-of-scalars-moduli-application`](#n-r23-2-restriction-of-scalars-moduli-application), [`R23.1/snowden-soluble-preliminary-field`](#n-r23-1-snowden-soluble-preliminary-field), [`R23.5/bcgp-local-galois-data-without-descent`](#n-r23-5-bcgp-local-galois-data-without-descent).

<a id="gap-20"></a>
**G20. Local analytic density used in the approximation arguments** (R23.1 part)

Need the étale local analytic inverse theorem and density of a nonempty Zariski open on a smooth geometrically integral local-field variety, plus the excellent valuation-ring/separable completion argument of MB II 2.1. These are non-routine inputs; in particular U(K_v)≠∅ in Theorem G is not purely scheme-theoretic density.

Needed by [`R23.1/density-of-algebraic-and-separable-local-points`](#n-r23-1-density-of-algebraic-and-separable-local-points), [`R23.1/elementary-reductions-of-skolem-data`](#n-r23-1-elementary-reductions-of-skolem-data), [`R23.1/theorem-g-from-moret-bailly`](#n-r23-1-theorem-g-from-moret-bailly), [`R23.1/moret-bailly-over-a-preliminary-extension`](#n-r23-1-moret-bailly-over-a-preliminary-extension), [`R23.1/surjective-specialisation-finite-quotient`](#n-r23-1-surjective-specialisation-finite-quotient).

<a id="gap-21"></a>
**G21. Suggested APIs and tests: missing full object interfaces** (R23.1 part)

The suggested file has a normalized field-point model rather than the closed-subscheme comparison; PG has an objectwise group signature and quotient descent, without the relative group-sheaf/Cartesian-pullback construction or its tensor/dual and functor laws; auxiliary fields omit automorphic witnesses and local realization data. Supply those full interfaces from SF.3/R09.3/H6 and the place/automorphic owners, together with the geometric integralPoint_iff/enlargeSigma comparison and the identity/composition laws of mapPoint. At least three tests per full object must exercise those interfaces. Arithmetic-only examples are reduced checks, not the packet’s complete geometric/automorphic tests. The existing reduced signatures are explicitly marked as such under Protocol §13.

Needed by [`R23.1/skolem-datum-and-integral-point`](#n-r23-1-skolem-datum-and-integral-point), [`R23.1/generalized-picard-functor-and-effective-divisor-fibration`](#n-r23-1-generalized-picard-functor-and-effective-divisor-fibration), [`R24.1/auxiliary-totally-real-field-for-the-finiteness-argument`](#n-r24-1-auxiliary-totally-real-field-for-the-finiteness-argument), [`R23.2/taylor-auxiliary-data-p-L-psi-N-M`](#n-r23-2-taylor-auxiliary-data-p-l-psi-n-m).

<a id="gap-22"></a>
**G22. Taylor auxiliary prime, quadratic and coefficient field choices** (R23.1 part)

Taylor 2002 printed pp. 7–9 assert the choice of a CM quadratic L/F split at the l- and p-adic places and not contained in F(ζ_p), followed by a Galois CM N/N₀ split above l and unramified above p with residue field containing the finite image of ψ̄. Lemma 1.1 assumes L and does not construct it. Provide the exact compatibility/existence argument for the simultaneous auxiliary-prime Frobenius/class-field conditions, weak-approximation/quadratic avoidance and coefficient-field extension input; for α_w of norm p choose the ℘₀-unit conjugate before prescribing its residual character. General Frobenius prime existence is the separate node frobenius-primes-generate; that theorem alone does not establish compatibility of all the prescribed auxiliary-prime conditions.

Needed by [`R23.2/taylor-auxiliary-data-p-L-psi-N-M`](#n-r23-2-taylor-auxiliary-data-p-l-psi-n-m).

<a id="gap-23"></a>
**G23. Savitt's residual weight computations are requested, not planned** (R24.3 part)

Verified: KW I and KW II attribute the residual weights of Theorem 5.1(3),(4) to Savitt, Duke 128 (2005), Corollary 6.15 and Remark 6.17 (and T. Saito for (4)). Not verified: Savitt's statements. No stage names Savitt; the request goes to AlgebraicModularFormsAndSerreWeights R15.4, which owns Serre weights.

Needed by [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems).

<a id="gap-24"></a>
**G24. Gee 2011 was not read; Dieulefait 2004 covers only small odd crystalline weights** (R24.3 part)

Verified: Dieulefait–Pacetti's statements of Theorems 1.9(4) and 1.11 and their attributions; Snowden's Theorems 7.2.1 and 7.6.1 (read). The review read Dieulefait, arXiv math/0304433v1 (the Crelle 577 (2004) text was not obtained): its Theorem 1.1 assumes a lift crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1. Not verified: Gee, Math. Ann. 350 (2011). The nodes give KW II's and Snowden's arguments, which suffice in the scope planned.

Needed by [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families), [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts).

<a id="gap-25"></a>
**G25. The common-component and Sen monodromy inputs remain source leaves** (R24.3 part)

Verified: BLGGT v1 Lemma 5.2.1 (p.54), v4 Lemma 5.3.1 (pp.70–71), and the complete proof of its coefficient-descent Lemma A.1.5 (p.85). The component-field argument invokes Larsen–Pink Proposition 6.14/Serre, and the multiplicity-one argument invokes Sen 1973 for a torus with the labeled Hodge–Tate weights; these original proofs were not read. Import them through ArithmeticGaloisRepresentations G7 and PadicHodgeTheory R06.2. R01.5 must export the split-eigenvalue descent criterion, consuming the upstream semisimple-algebra API. The two distinct Frobenius splitting fields are needed for the uniform coefficient extension.

Needed by [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups), [`R24.5/residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one).

<a id="gap-26"></a>
**G26. Larsen, Maximality of Galois actions for compatible systems (Duke 1995), is not read** (R24.3 part)

Verified: BLGGT's proof of Proposition 5.2.2 (pp. 56–58) takes its density-one set of primes from [Lar95], citing (1.12)–(1.13) (standard reductions), Proposition 2.6 (perfectness), 3.15 (G_l⁰ unramified) and Theorem 3.17 (the integral simply connected model); it also cites Bogomolov 1980 for openness of the image and Serre's Abelian l-adic representations III.1–III.2 with Conrad–Chai–Oort Proposition 6.3 for θ_l. Not verified: Larsen's statements, which were not read. BLGGT v4 §5.2 now isolates exactly what is used (larsen-good-primes): Larsen Theorem 3.17 and §§1.12–1.13, Larsen–Pink Proposition 8.9, Bruhat–Tits 5.1.40 and 5.2.8, and Conrad–Chai–Oort Proposition 6.3; these remain unread.

Needed by [`R24.5/larsen-good-primes`](#n-r24-5-larsen-good-primes), [`R24.5/residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one).

<a id="gap-27"></a>
**G27. Supplier signatures needed for complete arithmetic Lean forms** (R24.3 part)

Pinned Mathlib has algebraic representations, Krull-topological Galois groups and completions, but lacks the arithmetic local restriction/inertia/WD, labeled Hodge, deformation-point, automorphic-eigenform, density and reductive-model interfaces needed by full signatures. The suggested file supplies actual baseline-expressible carrier fragments and named arithmetic/pairing tests; omitted predicates and theorems are listed under their planned names, never replaced by arbitrary Prop fields. Supplier requests and coverage remaining lists identify the refinements.

Needed by [`R24.3/bockle-presentation`](#n-r24-3-bockle-presentation), [`R24.3/finite-presentation-complete-intersection`](#n-r24-3-finite-presentation-complete-intersection), [`R24.3/bockle-minimal-r-equals-t`](#n-r24-3-bockle-minimal-r-equals-t), [`R24.3/kw-annals-minimal-lifts`](#n-r24-3-kw-annals-minimal-lifts), [`R24.3/required-lift-types`](#n-r24-3-required-lift-types), [`R24.3/theorem-5-1-part-1-minimal-crystalline`](#n-r24-3-theorem-5-1-part-1-minimal-crystalline), [`R24.3/theorem-5-1-part-2-weight-two`](#n-r24-3-theorem-5-1-part-2-weight-two), [`R24.3/theorem-5-1-part-3-level-one-type-at-q`](#n-r24-3-theorem-5-1-part-3-level-one-type-at-q), [`R24.3/theorem-5-1-part-4-level-two-type-at-q`](#n-r24-3-theorem-5-1-part-4-level-two-type-at-q), [`R24.3/theorem-5-1-application-table`](#n-r24-3-theorem-5-1-application-table), [`R24.3/modern-prescribed-type-lifts`](#n-r24-3-modern-prescribed-type-lifts), [`R24.4/alpha-beta-from-residual-modularity`](#n-r24-4-alpha-beta-from-residual-modularity), [`R24.4/kw-theorem-4-1`](#n-r24-4-kw-theorem-4-1), [`R24.5/compatible-system`](#n-r24-5-compatible-system), [`R24.5/system-operations`](#n-r24-5-system-operations), [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system), [`R24.5/almost-strict-compatibility`](#n-r24-5-almost-strict-compatibility), [`R24.5/kw-theorem-5-1-systems`](#n-r24-5-kw-theorem-5-1-systems), [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families), [`R24.6/residual-members`](#n-r24-6-residual-members), [`R24.6/local-compatibility-at-the-coefficient-prime`](#n-r24-6-local-compatibility-at-the-coefficient-prime), [`R24.6/linked-systems-modularity-transfer`](#n-r24-6-linked-systems-modularity-transfer), [`R24.5/weakly-compatible-system-rank-n`](#n-r24-5-weakly-compatible-system-rank-n), [`R24.5/compatible-system-predicates`](#n-r24-5-compatible-system-predicates), [`R24.5/linear-algebra-operations-on-systems`](#n-r24-5-linear-algebra-operations-on-systems), [`R24.5/rank-two-reducibility-independent-of-lambda`](#n-r24-5-rank-two-reducibility-independent-of-lambda), [`R24.5/system-l-functions`](#n-r24-5-system-l-functions), [`R24.5/galois-grothendieck-ring`](#n-r24-5-galois-grothendieck-ring), [`R24.5/residual-irreducibility-density-one`](#n-r24-5-residual-irreducibility-density-one), [`R24.5/constituents-essentially-self-dual`](#n-r24-5-constituents-essentially-self-dual), [`R24.5/larsen-rational-system-groups`](#n-r24-5-larsen-rational-system-groups), [`R24.5/serre-theta-uniform-bounds`](#n-r24-5-serre-theta-uniform-bounds), [`R24.5/larsen-good-primes`](#n-r24-5-larsen-good-primes), [`R24.5/strict-brauer-system`](#n-r24-5-strict-brauer-system), [`R24.5/monodromy-component-field`](#n-r24-5-monodromy-component-field), [`R24.5/polarized-system`](#n-r24-5-polarized-system), [`R24.5/polarized-operations`](#n-r24-5-polarized-operations), [`R24.5/character-system`](#n-r24-5-character-system), [`R24.5/rank-one-purity`](#n-r24-5-rank-one-purity), [`R24.5/induced-character-purity`](#n-r24-5-induced-character-purity), [`R24.5/artin-system`](#n-r24-5-artin-system), [`R24.5/artin-twist-purity`](#n-r24-5-artin-twist-purity), [`R24.5/weakened-compatible-data`](#n-r24-5-weakened-compatible-data).

<a id="gap-28"></a>
**G28. Brauer pairing overlap descent is a supplier proof leaf** (R24.3 part)

Khare §5 explicitly calls for an inner-product computation, and KW II references it. The norm-one proof is now spelled out using Mackey, Frobenius reciprocity and overlap Hom characters; the exact λ-independent overlap-character lemma is requested from R17.6. Degree and true restrictions alone do not certify genuineness.

Needed by [`R24.5/brauer-induction-system`](#n-r24-5-brauer-induction-system).

<a id="gap-29"></a>
**G29. Potential modularity outside R23.4's lift types, for the full Dieulefait–Pacetti Theorem 1.11** (R24.3 part)

R23.4 proves potential modularity only for lifts of type (A), (B) or (C) at p (crystalline or semistable of weight 2 at p = 2). DP Theorem 1.11 is stated for every odd, irreducible, finitely ramified lift that is de Rham at p with Hodge–Tate weights {0, k − 1}. Weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need a potentially Barsotti–Tate modularity lifting theorem over totally real fields, and general de Rham lifts need potential modularity of arbitrary regular de Rham lifts. Neither is planned in R23 or requested here, and DP's citation [Die04, Theorem 1.1] does not supply them (E5). The modern route's consumer ClassicalSerreModularity R33 must use only lifts in the planned scope or obtain these inputs. Added by REV-PotentialModularityAndCompatibleSystems--R24.3.

Needed by [`R24.5/dieulefait-families`](#n-r24-5-dieulefait-families).

## Mistakes in the sources

Mistakes found in the sources, as the parts recorded them, with the independent review's verdict on each. The R23.1 part numbers its findings E2–E10 and the R24.3 part E1–E5, both under the prefix `PotentialModularityAndCompatibleSystems/`, so E2–E5 occur in both with different meanings; each is identified below by its part. The nodes use the corrected statements.

<a id="issue-R23.1-E2"></a>
**E2 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E2`; source [kw-serre-modularity-II](#src-kw-serre-modularity-II); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Proof of Theorem 10.1, p. 91 of the author's preprint proofs.pdf
- Printed: choosing F as in part (c) of Theorem 6.1, such that a completion of F at ℓi contains Fℓi.
- Correction: "… choosing F as in part (iii) b) of Theorem 6.1 …"
- Reason: In Theorem 6.1 (p. 54) the clause about completions containing prescribed local extensions F_{ℓ_i} is (iii) b); (iii) c) makes F split at p when p > 2 and k(ρ̄) = p + 1. The proof needs the local extensions.
- Known: new: present in the author's preprint; the Inventiones version was not obtained
- Searched: The author's preprint proofs.pdf (the version read); Invent. Math. 178 (2009) 505–586: not obtained
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E3"></a>
**E3 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E3`; source [moret-bailly-1989-II](#src-moret-bailly-1989-II); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Lemme 3.10.2, printed p. 192 (Numdam scan of Ann. Sci. ÉNS 22 (1989))
- Printed: LEMME 3.30.2. — Soient F un corps localement compact, C une courbe propre, régul
- Correction: LEMME 3.10.2
- Reason: The lemma sits in 3.10 between 3.10.1 and 3.10.3, and the plan of the paper on p. 182 cites it as (3.10.2) (compactness of Jacobians); there is no §3.30.
- Known: new: present in the published article (Numdam scan)
- Searched: The Numdam item page for 10.24033/asens.1582 (no erratum listed)
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E4"></a>
**E4 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E4`; source [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: proof of Lemma 1.5, printed p. 15 (PDF page 16), read on the page image
- Printed: If it acted by ε^{−1} then it would also act by ω^{−1} on some subquotient of A[℘] (see appendix B of [CDT]). Hence χ₁|_{I_x} = ω, which we are assuming does not occur when A[λ] is semi-simple as a G_x-module.
- Correction: Hence χ₁|_{I_x} = ω^{−1} (that is, n = 1).
- Reason: The proof has arranged χ₁|_{I_x} ∼ ε^{−n} and ψ₁|_{I_x} = ω^{−n} with ψ₂ unramified, so an action by ω^{−1} on a subquotient of A[℘] means n ≡ 1 mod (l − 1), i.e. n = 1 as 0 ≤ n < l − 1, and then χ₁|_{I_x} = ω^{−1}. The printed χ₁|_{I_x} = ω would mean n = l − 2, which the lemma does not exclude; the excluded case is n = 1 (checked in the suggested Lean file).
- Known: new: not among the corrections Taylor lists in Documenta Extra Volume Coates (2006), pp. 776–777; the published version (J. Inst. Math. Jussieu 1 (2002)) was not obtained
- Searched: Taylor, On the meromorphic continuation of degree two L-functions (2006), 'Corrections to [Tay4]', pp. 776–777; the author's preprint of 23 May 2000 (fm.pdf), the only version read
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E5"></a>
**E5 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E5`; source [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: proof of Lemma 1.1, printed p. 8 (PDF page 9), read on the page image
- Printed: coincides with ψ_x on L_y^× for y ∈ S_L
- Correction: coincides with ψ_y on L_y^× for y ∈ S_L.
- Reason: The characters ψ_x are indexed by x ∈ S_L; the condition is at each y ∈ S_L separately, as in the preceding sentence 'restricts … to ψ_x on L_x^× for all x ∈ S_L'.
- Known: new: not among the corrections Taylor lists in Documenta Extra Volume Coates (2006), pp. 776–777; the published version (J. Inst. Math. Jussieu 1 (2002)) was not obtained
- Searched: Taylor, On the meromorphic continuation of degree two L-functions (2006), 'Corrections to [Tay4]', pp. 776–777; the author's preprint of 23 May 2000 (fm.pdf), the only version read
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E6"></a>
**E6 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E6`; source [taylor-2002-fontaine-mazur](#src-taylor-2002-fontaine-mazur); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: choice of α_w, printed p. 7 (PDF page 8), and the proof of Lemma 1.2, second case, printed p. 11 (PDF page 12), read on the page images
- Printed: with a_w chosen so that α_w is congruent modulo λ to an eigenvalue of ρ̄(Frob_w). … an isomorphism i₀ : O_{ℚ(β_v)} ≅ End(A/k(v)) … O_N × O_N → O_{ℚ(α)}, (a, b) ↦ tr_{N/ℚ(α)}(ab^c)
- Correction: modulo λ₀; End(A₀/k(v)); ℚ(β_v).
- Reason: On p. 7 only λ₀ | l in N₀ has been chosen; λ | λ₀ in N is chosen on p. 10, and α_w ∈ N₀. On p. 11 the abelian variety is A₀ and no α is defined in this case; the pairing is the trace from N to ℚ(β_v), as i₀ and the tensor product O_N = O_{ℚ(β_v)} ⊗ … show.
- Known: new: not among the corrections Taylor lists in Documenta Extra Volume Coates (2006), pp. 776–777; the published version (J. Inst. Math. Jussieu 1 (2002)) was not obtained
- Searched: Taylor, On the meromorphic continuation of degree two L-functions (2006), 'Corrections to [Tay4]', pp. 776–777; the author's preprint of 23 May 2000 (fm.pdf), the only version read
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E7"></a>
**E7 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E7`; source [bcgp-published](#src-bcgp-published); error; affects a stated result; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Proposition 9.1.12, published pp. 458–459
- Printed: L′/E is linearly disjoint from E′F(avoid)/E.
- Correction: Take K/E Galois disjoint from E′Favoid/E, K′=KE′, and L′/K′ Galois with group G. Remove the assertion L′=LE′ for L/K. In (4) use Gal(L′_w/K′_w).
- Reason: L′ contains E′, so printed (2) is impossible for E′≠E. Weil restriction supplies a G-cover over KE′ without descent to K. For E=Q, E′=Q(sqrt(2)), S={7}, the two split places permit different local decomposition data, so an L/K descent is not available in general. Lemma 9.2.7 uses only K and L′/K′.
- Known: Previously recorded by the accepted BCGP extraction and explicitly assigned in issue #976; reverified in the published edition in this run.
- Searched: Published Centre Mersenne PDF, pp. 458–459; Author arXiv:1812.09269 PDF, Proposition 9.1.12; Issue #976 and PAPER-BOXER-CALEGARI-GEE-PILLONI-21 extraction
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E8"></a>
**E8 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E8`; source [bhkt-published](#src-bhkt-published); misprint; affects a stated result; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Lemma 9.1(i), published p. 77; also author v2 p. 51
- Printed: is a geometrically connected finite étale K-scheme.
- Correction: Z_{ψ,φ} is finite étale over Y_K, and is a smooth geometrically connected curve over K. Replace finite étale K-scheme by finite étale Y_K-scheme geometrically connected over K.
- Reason: With H trivial, Z=Y_K, a curve of dimension one over K, so it cannot be finite over K. Its relative Isom construction and the proof identify a finite cover of Y_K. Proposition 9.2 itself correctly calls it a curve.
- Known: Beuzart-Plessis–Harris–Thorne, Inductive construction of supercuspidal L-packets, arXiv:2502.20611v1, p. 28, explicitly notes this typo and gives the corrected base.
- Searched: Publisher Acta Math. 223 PDF, pp. 76–79; arXiv:1609.03491v2, §9; Author publications pages and web erratum/correction search; Primary arXiv:2502.20611v1 PDF, p. 28
- Review: Independently read the cited source passage.

<a id="issue-R23.1-E9"></a>
**E9 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E9`; source [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation); error; affects the proof; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Corrections to [Tay4], p. 776, second bullet; compare Taylor 2002 printed p. 7 (β_v and χ̃_v)
- Printed: β_vβ_v^c = ψ(φ_v)ψ^c(φ_v) = p
- Correction: The determinant product at v|l is q_v=l^[k(v):F_l], and β_vβ_v^c=q_v. Compare reductions: for χ_v²≠1 use ψ̄(φ_v)=β̄_v; for χ_v²=1 the Teichmüller prescription gives ψ̄(φ_v)=±1, so add the finite exclusion p∤q_v−1 to obtain distinct reductions.
- Reason: a=(1+sqrt(1−4l))/2 satisfies aa^c=l and ζζ^c=1; hence β_vβ_v^c=l^f_v, not the auxiliary prime p≠l. The v|l Frobenius is away from p and ε_p(φ_v)=q_v. Lemma 1.1 prescribes reductions rather than exact p-adic lifts. The Teichmüller branch does not in general have ψ̄(φ_v)=β̄_v, so the printed uniform justification omits that case. The stated construction can be strengthened by excluding finitely many prime divisors of q_v−1.
- Known: No existing correction found in the published corrections section or the targeted erratum search; the finding is scoped to this published formula and its stated justification.
- Searched: Taylor 2006 published pp. 776–777; Taylor 2002 author fm.pdf, printed pp. 7–9; Targeted web searches for the 2006 paper, beta norm and an erratum, 2026-10-06
- Review: Read the p. 776 page image and recomputed the norm from the p. 7 formula. Distinguishedness on a local decomposition group needs the separate Teichmüller case described in the correction.

<a id="issue-R23.1-E10"></a>
**E10 of the R23.1 part** (`PotentialModularityAndCompatibleSystems/E10`; source [taylor-2006-meromorphic-continuation](#src-taylor-2006-meromorphic-continuation); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R23.1)

- Where: Proof of Lemma 5.1, p. 766: definitions of τ_T and τ_{T,x}
- Printed: Symm^{2+i}((F_l^ac)^2); Symm^{i+2}((F_l^ac)^2)
- Correction: Both factors for y∉T (respectively y∉T∪{x}) are Symm^i((F_l^ac)^2).
- Reason: The filtration on p. 765 has subrepresentation Symm^i and quotient Symm^{l−1−i}⊗det^i. The empty-T term is the weight-(i+2) space, whose coefficient representation is Symm^i by the convention on p. 739. Symm^{i+2} has dimension i+3 rather than i+1 and cannot be the identified subrepresentation.
- Known: No existing correction found in the published corrections section or targeted search; the intended factors are fixed by the preceding filtration.
- Searched: Taylor 2006 published pp. 739, 765–767 and 776–777; Targeted search for Richard Taylor Lemma 5.1 Symm correction, 2026-10-06
- Review: Read the p. 766 page image and compared both coefficient factors with the p. 765 exact sequence and the weight convention. The packet already uses Symm^i; record the printed slip to protect that correct convention.

<a id="issue-R24.3-E1"></a>
**E1 of the R24.3 part** (`PotentialModularityAndCompatibleSystems/E1`; source [kw-serre-modularity-II](#src-kw-serre-modularity-II); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R24.3)

- Where: Bibliography, reference [33], p. 96 of the author's preprint proofs.pdf
- Printed: Serre’s modularity conjecture: the level one case. Duke Math. J. 134 (3) (2006), 534–567.
- Correction: Duke Math. J. 134 (3) (2006), 557–589.
- Reason: Khare's level-one paper occupies pp. 557–589 of Duke Math. J. 134 (2006), no. 3; Dieulefait–Pacetti's bibliography ([Kha06]) gives 557–589, and KW I's own citation of the paper does not conflict with it.
- Known: new: present in the author's preprint; the Inventiones version was not obtained
- Searched: The author's preprint proofs.pdf (the version read); Invent. Math. 178 (2009) 505–586: not obtained
- Review: Confirmed. The preprint's bibliography entry [33] reads 'Duke Math. J. 134 (3) (2006), 534–567'; Project Euclid lists Khare's paper as Duke Math. J. 134 (2006), no. 3, 557–589, as does Dieulefait–Pacetti's [Kha06]. The Inventiones text was not obtained, so the finding is scoped to the preprint.

<a id="issue-R24.3-E2"></a>
**E2 of the R24.3 part** (`PotentialModularityAndCompatibleSystems/E2`; source [blggt-2014](#src-blggt-2014); error; affects a stated result; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R24.3)

- Where: arXiv v1, §5.1, pp. 52–53, the archimedean Γ-factors and the Hodge factor L({H_τ}, s)
- Printed: L({Hτ},s) = √2π^{Σ|h−w/2|} (∏τ ∏h (s − w/2)(s + 1 − w/2) … (s + |h − w/2| − 1 − w/2))^{1/2}, with L(R|GFv, w, s) = ΓC(s − w/2)^{n/2} for v real and n even
- Correction: Use v4's factors: L_v = Γ_ℝ(s − w/2)^{d+}Γ_ℝ(s + 1 − w/2)^{d−}∏_{h<w/2}Γ_ℂ(s − h)/Γ_ℂ(s − w/2) at real v (and the analogue at complex v), with no separate Hodge factor.
- Reason: The product (s − w/2)⋯(s + |h − w/2| − 1 − w/2) has |h − w/2| factors, which is not an integer when w is odd, although v1 states the definition for every pure regular strictly compatible ℛ. For an elliptic curve over ℚ (n = 2, w = 1, H = {0, 1}) v1's real factor is Γ_ℂ(s − 1/2) and no polynomial Hodge factor turns it into the standard Γ_ℂ(s); v4 gives Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s). So v1's Corollary 5.3.2(2) (the functional equation of Λ) is not defined for odd-weight systems.
- Known: Corrected in arXiv v4 (9 December 2013), §5.1 pp. 63–64
- Searched: 2026-09-29: arXiv versions v1 and v4 compared; the Annals version was not collated.
- Review: Confirmed at arXiv v1 §5.1, pp. 52–53: L({H_τ}, s) is a product of |h − w/2| linear factors, which is not an integer when w is odd, and Corollary 5.3.2(2) states Λ(ıR, s) = ε(ıR, s)Λ(ıR^∨, 1 − s) for every system satisfying Theorem 5.3.1. For an elliptic curve (w = 1, H = {0, 1}) v1's real factor Γ_ℂ(s − 1/2) would need the non-polynomial Γ_ℂ(s)/Γ_ℂ(s − 1/2). arXiv v4 §5.1, pp. 63–64, uses Γ-quotient factors with no separate Hodge factor and gives Γ_ℂ(s).

<a id="issue-R24.3-E3"></a>
**E3 of the R24.3 part** (`PotentialModularityAndCompatibleSystems/E3`; source [blggt-2014-v4](#src-blggt-2014-v4); misprint; affects nothing; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R24.3)

- Where: arXiv v4, §5.2, proofs of Lemma 5.2.1(3) (p. 67) and Proposition 5.2.2 (pp. 69–70)
- Printed: "−mµ,σ is the σ-Hodge–Tate number of (A(n)µ) ◦ (rl mod G0l(Q̄l))"; "(γG̃l)(Zl) = γ(G̃l(Zl)) = G̃l(Zl)"; "⋂_{i≠j} ker(Λ′ → VΛ,i)"
- Correction: r_l mod G^der_l(Q̄_l) (the map to C_l = G⁰_l/G^der_l); G̃^sc_l in place of G̃_l; V_{λ,i} in place of V_{Λ,i}.
- Reason: A(n)µ is a character of C_l, which is the quotient by G^der_l (modding out by G⁰_l would leave the finite component group); the argument concerns the simply connected group scheme G̃^sc_l just introduced; V_{λ,i} are the isotypic parts of V_l ⊗ M_λ.
- Known: new (arXiv v4 read; the Annals version was not collated)
- Searched: 2026-09-29: arXiv listing for 1010.2561 (v1–v4); a web search for BLGGT errata found none.
- Review: Confirmed at arXiv v4: p. 67 prints 'mod G0l(Ql)' where θ_l and A(n)µ ∈ X*(C_l) require G^der_l; p. 69 prints (γG̃_l)(Z_l) = γ(G̃_l(Z_l)) = G̃_l(Z_l) in an argument about the group scheme G̃^sc_l just introduced; p. 70 prints ker(Λ′ → V_{Λ,i}) for the isotypic parts V_{λ,i}. All three are slips of notation; the arguments are unaffected.

<a id="issue-R24.3-E4"></a>
**E4 of the R24.3 part** (`PotentialModularityAndCompatibleSystems/E4`; source [acc-2023](#src-acc-2023); error; affects a stated result; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R24.3)

- Where: Published journal-layout text §7.1, p.1092, purity observation (Artin-up-to-twist definition p.1086 and extremely weak condition p.1085); also author copy pp.189–190,196–197
- Printed: The same is true … or if R is Artin up to twist.
- Correction: For extremely weak systems, this implies purity of the good Frobenius eigenvalues. Full purity, including H_{cτ}={w−h:h∈H_τ}, requires the canonical Hodge multisets of the Artin tensor character family (or a very weak realization, which forces those multisets). The roadmap uses this qualified statement.
- Reason: Take F=ℚ(i), and the standard irreducible two-dimensional rational representation of Gal(LF/F)=S₃, where L is the splitting field of X³−2 over ℚ. Its finite-image family has good roots of unity, determinant Hodge weight zero at every λ, and is Artin up to twist with trivial character. Assign H_τ={−1,1} and H_{cτ}={0,0} at the two embeddings of F. Both sums are zero, so all extremely weak conditions hold. The good roots force w=0, but H_{cτ}≠−H_τ. The Artin-up-to-twist definition compares members only and imposes no H-multiset equality. This does not affect the canonical Artin constructor or the subsequent applications to very weak systems.
- Known: new (no correction located in the sources searched; independent review required)
- Searched: 2026-10-06: Annals DOI landing page 10.4007/annals.2023.197.3.2; no correction listed there.; 2026-10-06: published journal-layout PDF on Frank Calegari’s research page, §7.1 pp.1085–1086,1092; the observation and definitions agree with the Scholze-hosted author copy.; 2026-10-06: arXiv:1812.09999 submission history (v1 December 2018, v2 June 2022; no subsequent version listed).; 2026-10-06: Calegari’s research listing and searches for the exact title with erratum, purity, and extremely weak Artin; no matching correction found.
- Review: Confirmed at the published §7.1, pp. 1085–1086 and 1092. An extremely weakly compatible system constrains H_τ only through HT_τ(det r_λ) = Σ H_τ, and 'Artin up to twist' compares members only (r_λ ≃ ρ ⊗ χ_λ). The S₃ family over ℚ(i) (LF/F has group S₃ because L ∩ ℚ(i) = ℚ) with H_τ = {−1, 1}, H_cτ = {0, 0} is extremely weak and Artin up to twist with trivial χ, its good roots are roots of unity so w = 0, and H_cτ ≠ {−h}. The paragraph's claim is an unnumbered remark; ACC's main results in §7.1 (Theorem 7.1.11, Corollaries 7.1.12–7.1.13) concern very weakly compatible systems with H_τ = {0, 1}, where the issue does not arise.

<a id="issue-R24.3-E5"></a>
**E5 of the R24.3 part** (`PotentialModularityAndCompatibleSystems/E5`; source [dieulefait-pacetti](#src-dieulefait-pacetti); gap; affects the proof; review: confirmed by REV-PotentialModularityAndCompatibleSystems--R24.3)

- Where: Theorem 1.11 and its proof, p. 7 of arXiv:2108.07577v2 (identical in the authors' copy dated 1 May 2022); the RACSAM version (117 (2023), article 153) was not obtained
- Printed: Theorem 1.11. Let ρ : GalQ → GL2(Kλ) be an odd, irreducible, continuous Galois representation ramified at finitely many places and de Rham at p with Hodge-Tate weights {0, k − 1}, with k > 1 [...] Then ρ is part of a rank 2 almost strictly compatible system of Galois representations. Proof. See [Die04, Theorem 1.1].
- Correction: The cited theorem does not prove the statement. [Die04, Theorem 1.1] (arXiv math/0304433v1) assumes ρ crystalline at an odd prime q with Hodge–Tate weights {0, w}, w odd, and q ≥ 2w + 1. The cases DP use are covered by other arguments: KW II §10.3.2 (potential modularity of lifts of KW types (A), (B), (C) and the Brauer construction) for the lifts of Theorem 1.9(1)–(3), and Snowden's weight-two results for those of Theorem 1.9(4). The general de Rham statement needs potential modularity of arbitrary regular de Rham lifts and should cite it, or be restricted to the lifts used.
- Reason: DP apply Theorem 1.11 in §2 to the minimal crystalline lifts of Theorem 1.9(3), whose weight k ≤ p + 1 can violate q ≥ 2w + 1 (p = 3, k = 4 gives w = 3) or have w = k − 1 even, and to weight-two lifts that 'in general will not be crystalline at w' (Paso 1). Neither class is within [Die04, Theorem 1.1].
- Known: new
- Searched: 2026-10-06: arXiv:2108.07577 versions v1 (17 August 2021) and v2 (3 May 2022); the authors' copy at sweet.ua.pt/apacetti/papers/Serre.pdf (1 May 2022), which agrees with v2 here; 2026-10-06: the RACSAM landing page (doi 10.1007/s13398-023-01478-8); the publisher returned a client challenge, so the published text was not read; 2026-10-06: arXiv:math/0304433 (only v1 exists) for [Die04]; the Crelle 577 (2004) text was not obtained; 2026-10-06: web searches for an erratum or correction of the paper; none found
- Review: Added by the review after reading DP p. 7 and §2 and Dieulefait arXiv math/0304433v1 Theorem 1.1. Scoped to the versions read.

## Structural proposals

The parts' structural proposals, for the maintainer. Neither changes this document's layers: R23.6 is kept as a layer with the export table in its section, and the rank-one constructor of R24.5:operations keeps only the assembly of rank-one systems and their purity.

**rescope** (R23.1 part; roadmaps `PotentialModularityAndCompatibleSystems`)

- Detail: R23.6 is an export-table/noncircularity process panel, not an additional mathematical result. The current eight-stage scope is retained for this packet.
- Proposal: Fold R23.6 into the introduction at assembly; assign its residual, given-lift and field-control exports to R23.3, R23.4 and R23.5 respectively. No process node or planet is introduced.

**rescope** (R24.3 part; roadmaps `PotentialModularityAndCompatibleSystems`, `tauceti:TauCetiRoadmap/ClassFieldTheory`)

- Detail: The rank-one compatible-system constructor needs the algebraic ℓ-adic realization and converse classification beyond the existing upstream global Artin reciprocity roadmap. GlobalNumberFields Layers 9–10 already supply the general Hecke-character carrier and infinity-type purity.
- Proposal: Create Class field theory, Part II: algebraic ℓ-adic character realization and classification, with upstream ClassFieldTheory as its first prerequisite and GlobalNumberFields Layers 9–10 as imports. It supplies the geometric-Frobenius type-A₀ Hecke realization, common coefficient field, local Hodge/WD comparison and converse algebraic-character classification requested here. It does not reconstruct global reciprocity or general Hecke characters. The current R24.5:operations scope keeps only assembly of rank-one families and their elementary purity consequences.

## Notes for the maintainer

Observations the R24.3 part records for the maintainer, about stage edges and other roadmaps' layers.

- (R24.3 part) **PotentialModularityAndCompatibleSystems R24.4 stage dependency.** Confirmed RT /12 removes the mathematical R24.3 input: R24.4 is an import of R22 lifting plus R20 residual-weight reductions. R24.5 takes R24.3 lifts directly; only the maintainer can apply the campaign edge change.
- (R24.3 part) **AutomorphicGaloisRepresentations R19.5 and R24.6 prose.** Confirmed RT /30 requires the full Skinner 2009 theorem; current Saito/Carayol parity-scoped node is insufficient. Preserve source-faithful almost-strict statements, but do not describe coefficient-prime reducible-residual compatibility as presently unavailable.
- (R24.3 part) **tauceti:TauCetiRoadmap/GlobalNumberFields.** GlobalNumberFields Layers 9–10 already own Hecke characters and algebraic infinity-type purity, and explicitly exclude reciprocity. Import ClassFieldTheory Layers 11–12 for Artin normalization; request the ℓ-adic algebraic-character realization/classification comparison as ClassFieldTheory, Part II rather than adding another general character carrier here.

## Layer dependencies

For each layer: the layers of this roadmap whose nodes its nodes use, the layers of this roadmap it cites by stage id (see [Cross-part prerequisites](#cross-part-prerequisites)), and the other roadmaps it draws on. Every edge runs forward in the order of this document.

| Layer | Uses nodes of | Cites layers of this roadmap by id | Other roadmaps used |
|---|---|---|---|
| R23.1 | — | — | AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, SchemeAndStackFoundations, Tau Ceti Chebotarev, Tau Ceti ClassFieldTheory |
| R23.2 | R23.1 | — | AbelianSchemesAndArithmeticModuli, HilbertModularVarietiesAndShimuraCurves, Tau Ceti ClassFieldTheory |
| R23.3 | R23.1, R23.2 | — | AutomorphicGaloisRepresentations, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, GlobalGaloisDeformations, HilbertModularVarietiesAndShimuraCurves, OrdinaryAutomorphicFormsAndModularityLifting, PadicFamilies, PadicHodgeTheory, SerreWeightAndLevelOptimisation |
| R23.4 | R23.3 | — | GL2ModularityLifting |
| R23.5 | R23.1, R23.3 | — | AbelianSchemesAndArithmeticModuli, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, SchemeAndStackFoundations |
| R23.6 | — | — | — |
| R24.1 | R23.1, R23.3, R23.5 | — | AutomorphicGaloisRepresentations, DeformationAndDerivedPatchingAlgebra, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings, OrdinaryAutomorphicFormsAndModularityLifting |
| R24.2 | R24.1 | — | DeformationAndDerivedPatchingAlgebra, GlobalGaloisDeformations, LocalGaloisDeformationRings, PadicFamilies |
| R24.3 | — | R24.1, R24.2 | AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, DeformationAndDerivedPatchingAlgebra, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings |
| R24.4 | — | — | AlgebraicModularFormsAndSerreWeights, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, SerreWeightAndLevelOptimisation |
| R24.5:operations | — | — | ArithmeticGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison, PadicHodgeTheory, Tau Ceti ClassFieldTheory, Tau Ceti GlobalNumberFields, Tau Ceti RepresentationTheory/InductionRestriction |
| R24.5 | R24.3, R24.5:operations | R23.4, R23.5 | AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, GL2AutomorphicRepresentationsAndTransfer, PadicHodgeTheory, Tau Ceti RepresentationTheory/InductionRestriction, WeightsInEtaleCohomology |
| R24.6 | R24.4, R24.5:operations, R24.5 | — | AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, GL2ModularityLifting, PadicHodgeTheory |
