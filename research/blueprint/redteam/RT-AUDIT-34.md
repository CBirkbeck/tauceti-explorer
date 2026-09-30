# RT-AUDIT-34 — independent library-audit red team

Complete; four medium findings. Agent: Codex — codex-a71f92. Date: 2026-09-30. Refs #4456.

## Scope and method

Input: [accepted AUDIT-34](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/research/blueprint/audit/AUDIT-34.result.json) and [REV-AUDIT-34](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/research/blueprint/reviews/REV-AUDIT-34.md), at explorer commit `87471039bf9e14520e92e64b1ae1bbada6e45f74`. The original audit was by local lane claude4/1; its accepted independent reviewer was Claude Code cc-7b31c4. I did neither job. I read the five complete roadmap documents and their stages, all cited pinned declaration statements with their in-scope hypotheses, and every overlap destination. The audit itself is unchanged by this submission.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Both source trees matched these pins and were clean. Searches used the declaration index first, then both complete Lean source trees; plausible hits were checked in source. No Lean compilation was performed or required: there is no Lean deliverable, and no new build/cache/project was created.

| Coverage | Count |
| --- | ---: |
| Roadmaps / layers | 5 / 37 |
| Targets | 178 |
| Target labels: absent / partial / mathlib / both | 121 / 46 / 10 / 1 |
| Layer verdicts: not built / partly built / process | 30 / 5 / 2 |
| Citation occurrences / distinct declarations / source files | 197 / 166 / 113 |
| Overlap occurrences / unique destinations | 112 / 91 |

All 196 indexed citation occurrences matched name, library, file and line. The sole index miss, `IsAdicComplete.henselianRing`, is an actual source instance at the cited locator, not a finding. A nested-comment/string-aware lexical check found no `sorry`, `admit` or `sorryAx` tokens in the 113 cited files. This does not claim a fresh elaboration or a transitive proof-dependency audit. “Absent” below means no matching construction found by the recorded searches and source inspection; it is not an exhaustive semantic proof of absence.

## Findings

The four corrections concern the accuracy of the explanatory inventory and routing. They do not change any of the 37 overall verdicts or 178 target labels. In particular, existing generic ingredients remain distinct from the absent arithmetic/logic endpoint. Each severity is medium because the error is bounded: the affected target is already only partial or absent, or already recorded as an overlap.

### RT-AUDIT-34/1 — Continuity in the group variable

Kind: library-claim; severity: medium.

**Where:** research/blueprint/audit/AUDIT-34.result.json / roadmaps/PotentialModularityAndCompatibleSystems/layers/PotentialModularityAndCompatibleSystems:R24.2/targets/1/note (second target; zero-based JSON index).

**Claim:** The note describes ContRepresentation as the right ambient notion for the continuous Galois representation induced by a characteristic-zero point. At the pin it does not impose continuity in the group variable: it only requires each operator on the representation space to be continuous.

**Evidence:** https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L47-L57: ContRepresentation has [Monoid G] but no TopologicalSpace G, and its field is G →* V →L[R] V. The explicit warning at lines 21–25 says the action is not assumed continuous. By contrast, https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Action/Continuous.lean#L34-L74 requires a topology on G and Action.IsContinuous is ContinuousSMul G on the underlying space; ContAction selects those actions. These are generic interfaces, not a Galois deformation-point construction.

**Fix:** Retain partial/related, but say ContRepresentation supplies continuous linear operators only, not the required continuity of the Galois action. Record the missing topological-action condition and its verification for the deformation-point representation; optionally cite Action.IsContinuous/ContAction with their concrete-category/topology hypotheses as generic groundwork. Do not replace this with an unqualified TopRep citation, which has the same group-topology limitation. Qualify the same ContRepresentation shorthand in summaries where it could imply arithmetic continuity.

### RT-AUDIT-34/2 — Ordinary versus derived limits

Kind: library-claim; severity: medium.

**Where:** research/blueprint/audit/AUDIT-34.result.json / roadmaps/PotentialAutomorphyInfrastructure/layers/PotentialAutomorphyInfrastructure:PA.2/targets/4/note (fifth target; zero-based JSON index).

**Claim:** The note claims generic derived-limit machinery exists and merely needs instantiation, but its only cited declaration is the ordinary limit functor CategoryTheory.Limits.lim. It does not supply derived tower limits or their cohomological control.

**Evidence:** https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L535-L544 defines lim : (J ⥤ C) ⥤ C using ordinary limit and limMap, under HasLimitsOfShape J C. No derived functor or tower bound is present in this statement. https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean#L110-L165 supplies a Mittag-Leffler eventual-range condition for inverse systems of types, not this arithmetic derived-limit/control theorem. Index then full-source searches for derived limits, Rlim, lim¹ and inverse-limit control did not identify the claimed tower API. The audit's TC.2 target 3 itself distinguishes ordinary limit from missing lim¹/control.

**Fix:** Change the note to credit ordinary limits and generic homological/finite-generation groundwork only; leave derived tower limits and the required vanishing/control/duality bounds explicitly outstanding, unless exact declarations with matching hypotheses are added. Keep the related lim citation and partial classification; do not infer that generic derived categories or derived-functor frameworks are absent.

### RT-AUDIT-34/3 — Existing de Rham period-ring definitions

Kind: library-claim; severity: medium.

**Where:** research/blueprint/audit/AUDIT-34.result.json / roadmaps/PotentialModularityAndCompatibleSystems/layers/PotentialModularityAndCompatibleSystems:R24.6/targets/3/note and declarations (fourth target; zero-based JSON index).

**Claim:** The note says BDeRham.lean builds only the first step toward B_dR, namely inverting p in Fontaine's theta construction. The same pinned file already defines both BDeRhamPlus and BDeRham, so this understates the reusable period-ring groundwork.

**Evidence:** https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean#L53-L93: for a commutative ring R, prime p that is not a unit in R, and p-adic completeness, fontaineThetaInvertP is at line 64, BDeRhamPlus at line 77 is the kernel-adic completion of the inverted Witt ring, and BDeRham at line 90 localizes that completion at the multiplicative closure of the images of all generators of ker theta. The definition does not prove ker theta principal; in characteristic p these definitions can give the zero ring. Neither definition provides D_dR, admissibility, a lifting theorem or Weil–Deligne representations.

**Fix:** Credit BDeRhamPlus and BDeRham explicitly as related existing definitions, with the stated assumptions and limited API, rather than describing only fontaineThetaInvertP. Retain absent for the actual de Rham lifting target and not built for R24.6; do not turn period-ring definitions into a comparison or representation-theoretic theorem.

### RT-AUDIT-34/4 — General congruence-module owner

Kind: duplicate; severity: medium.

**Where:** research/blueprint/audit/AUDIT-34.result.json / roadmaps/SerreWeightAndLevelOptimisation/layers/SerreWeightAndLevelOptimisation:R20.1/duplicates/3/note (AutomorphicCongruences:L0).

**Claim:** The duplicate note assigns ownership of the general congruence-module construction to AutomorphicCongruences:L0. That stage expressly imports the general construction from IntegralHeckeAndGaloisDeterminants and owns the source-specific automorphic application instead.

**Evidence:** https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/AutomorphicCongruences/README.md, L0: 'Import congruence ideals/modules, generalized matrix algebras, pseudorepresentations, reducibility ideals and the general extension-class construction from IntegralHeckeAndGaloisDeterminants.' Its next sentence assigns the chosen integral periods and actual automorphic extension classes here. https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/IntegralHeckeAndGaloisDeterminants/README.md, IHG.1 constructs reducibility ideals, extension modules and lattice constructions; IHG.5 assigns local-condition/lattice comparisons to IHG and automorphic lower bounds to AutomorphicCongruences.

**Fix:** Rewrite the AutomorphicCongruences:L0 entry as a consumer/source-specific application, not owner of the general congruence-module construction. Record IntegralHeckeAndGaloisDeterminants as the general supplier, citing IHG.1 for reducibility/extension/lattice infrastructure and IHG.5 for the local-condition comparison where relevant. Do not assert IHG.1 alone explicitly specifies every congruence-module primitive: if a finer owner node is needed, request it within that roadmap instead of replanning it in R20.1 or L0.

## Per-stage assessment and target ledger

Numbers below are one-based within each stage. The findings also supply zero-based JSON target indices. Every target below was checked; its label is the accepted input label, not a new formalization claim. All declarations listed in the citation appendix were opened, including related declarations on absent targets.

### PotentialAutomorphyInfrastructure

[Roadmap document](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/PotentialAutomorphyInfrastructure/README.md).

#### PA.0 — not built

Checked generic group cohomology, bar complexes and algebraic coefficient functoriality against all eight targets. Fixed-ring maps, abstract double-coset Hecke rings and degree-zero finite-index corestriction do not supply arithmetic local systems, derived coefficient change, integral Hecke complexes or a boundary splitting. Searches for arithmetic quotients, Borel–Serre and non-neat boundary models found no matching construction.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Algebraic coefficient local systems on arithmetic locally symmetric spaces |
| 2 | partial | Finite-level cellular complexes computing the cohomology of arithmetic groups |
| 3 | partial | Integral Hecke actions on the finite-level complexes |
| 4 | partial | Derived coefficient change for the arithmetic complexes |
| 5 | partial | Level-change compatibility (restriction, corestriction, Shapiro) |
| 6 | absent | Boundary localization compatibility and summand/filtration maps for the unitary boundary argument, with their twists and degree shifts |
| 7 | absent | A proved splitting of the boundary filtration under the source's genericity condition |
| 8 | absent | A non-neat groupoid (orbifold) model at levels that are not sufficiently small |

#### PA.1 — not built

Read WeylModule with its Q-algebra assumption, Schur functors on complex finite-dimensional representations, and highest-weight statements with field/characteristic-zero/algebraic-closure hypotheses. They are not integral coefficient modules or modular linkage. Generic homological connecting maps remain related; integral Fontaine–Laffaille/lattice and concentration-transfer targets remain missing.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Integral algebraic coefficient modules over O and their reduction mod p |
| 2 | partial | Weyl and dual Weyl modules with their highest-weight filtrations |
| 3 | absent | Linkage principle and the weight bounds used for degree shifting |
| 4 | partial | Cohomological connecting morphisms and spectral-sequence comparison with Hecke equivariance and exact shifted degrees |
| 5 | absent | Integral Fontaine-Laffaille classification and lattice comparison (consumed from R07.3) |
| 6 | absent | Transfer of the local p-adic Hodge condition using the geometric concentration theorem |

#### PA.2 — not built

Read dynamic parabolic/Levi constructions over commutative rings and ordinary lim. Neither supplies a p-adic arithmetic level tower or an ordinary-parts functor. No factorial-power ordinary projector or tower control API found. Finding /2 corrects the derived-limit claim without changing partial status.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Group-independent ordinary projector from stabilized factorial powers on finite quotients, with compatible profinite limits |
| 2 | absent | Finite-quotient and continuity hypotheses for the arithmetic tower |
| 3 | partial | Parabolic level tower with commuting positive-monoid operators and the ordinary summand of the arithmetic complexes |
| 4 | absent | Local ordinary-parts functor in the coefficient regime of ACC+ §§5.2-5.3, with its maps on parabolic induction and adjunction/control statements |
| 5 | partial | Positive monoids, normalization, central characters, derived limits and duality/finite-generation bounds for the ordinary construction |
| 6 | absent | Ordinary degree-shifting comparison preserving the Galois filtration and its characters |

#### PA.3 — not built

Read support, Krull dimension and regular-sequence statements. Their algebraic hypotheses do not build patched complexes or compare changes of local deformation condition. Patching/Ihara searches distinguished unrelated manifold patching and author-name hits from derived arithmetic patching; no matching theorem found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Comparison of patched complexes for two systems of local deformation conditions agreeing modulo a coefficient ideal |
| 2 | absent | Compatibility of Hecke and deformation-ring actions on the patched object |
| 3 | partial | Component support, characteristic-zero localization and specialization of cohomological amplitude |
| 4 | absent | Generic support implication used for derived Ihara avoidance, with hypotheses on local rings and residual images |
| 5 | absent | Keeping equality of reduced supports, equality after inverting p, near faithfulness and integral ring isomorphisms distinct |

#### PA.4 — partly built

Verified hyperfilter requires an infinite type, and the ultrafilter lemma extends a nonbottom filter; these really supply a nonprincipal ultrafilter on an infinite indexing set. The auxiliary-prime theorem gives rational q above a bound with q congruent to 1 modulo n, specified unramifiedness and cyclotomic irreducibility, not residual Frobenius eigenvalues or dual-Selmer killing. Chebotarev groundwork is not the required density endpoint. No ultrapatching compatibility theorem found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Construction of Taylor-Wiles auxiliary prime sets under a residual image hypothesis |
| 2 | absent | Tracking set size, congruences on residue cardinalities, selected eigenvalues and framed local deformation data |
| 3 | mathlib | A fixed nonprincipal ultrafilter |
| 4 | absent | Boundedness and compatibility hypotheses of ultrapatching for the system of finite-level complexes, and identification of the specialization with the original complex |
| 5 | absent | Independence from permitted transition-map choices for the fixed ultrafilter |

#### PA.5 — not built

Checked tensor, dual and symmetric-power representation operations: they do not define compatible systems or prove Hodge–Tate, Frobenius, monodromy, purity or polarization compatibility. The absent system/checklist claims survived the source search. Continuity in a profinite group variable is not supplied just by the name ContRepresentation (finding /1).

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Compatible systems of Galois representations and their comparison under restriction to field extensions |
| 2 | partial | Tensor products, duals, characters and symmetric powers of compatible systems |
| 3 | absent | Compatibility of Frobenius polynomials, Hodge-Tate multisets, local monodromy and integral lattices under each permitted operation |
| 4 | absent | Regularity, purity and polarization properties of a compatible system, stated only where proved |
| 5 | absent | A reusable checklist theorem that an input package survives a specified base change |

### PotentialModularityAndCompatibleSystems

[Roadmap document](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/PotentialModularityAndCompatibleSystems/README.md).

#### R23.1 — partly built

Geometrically irreducible and smooth scheme notions are present. Composition lemmas have openness hypotheses; field linear disjointness and totally-real predicates do not produce the required extension. Number-field weak approximation supplies a finite product of local approximations, not the Moret–Bailly/Rumely point theorem. Searches found no such general geometric existence theorem.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Moret-Bailly/Rumely rational-point existence theorem for a smooth geometrically irreducible variety with prescribed local conditions |
| 2 | mathlib | Smooth geometrically irreducible varieties over a number field |
| 3 | partial | Prescribed nonempty local open sets (v-adic approximation at finitely many places) |
| 4 | partial | A finite extension satisfying the required disjointness and real-place conditions |
| 5 | absent | Statement of exactly which places split and how linear disjointness is forced |

#### R23.2 — not built

Read abelian-variety and component statements. Scheme.Hom.irreducibleComponentsEquiv uses an open geometrically irreducible morphism; it is not arbitrary base-change invariance. Abelian varieties are not moduli with polarization, torsion, Weil pairing and specified real/local points. Weil-pairing provenance and preparatory torsion-divisor material do not implement this package.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | The simultaneous torsion/polarisation moduli problem over R10's moduli scheme |
| 2 | partial | Geometric irreducibility of the twisted moduli problem |
| 3 | absent | Suitable real points and every prescribed finite local point of the twist |
| 4 | absent | Pairing and determinant compatibilities on the torsion (Weil pairing, determinant of the residual representation) |
| 5 | absent | Identification of the component of a multi-component twist to which the theorem applies |

#### R23.3 — not built

Abstract solvable groups and totally-real/abelian-variety groundwork do not prove Artin modularity, Langlands–Tunnell, or transfer of residual modularity. Searches for those statements and their standard alternative names found no endpoint.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Potential residual modularity in KW II Theorem 6.1's strength |
| 2 | partial | Finding the auxiliary abelian variety over a suitable totally real field |
| 3 | absent | Transfer of known modularity from the auxiliary residual representation |
| 4 | absent | Verification of solvable-image, ordinary/finite-flat and lifting hypotheses |

#### R23.4 — not built

Representation.IsIrreducible exists over a field, but it does not prove irreducibility survives the required field restriction. Neither the supplied-lift potential-modularity theorem nor its local component comparison was found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Modularity of a supplied characteristic-zero lift after a suitable extension |
| 2 | partial | Preservation of residual irreducibility under the extension |
| 3 | absent | Local component comparison permitted by the extension |

#### R23.5 — not built

Generic Galois, linear-disjointness, decomposition/ramification and solvability APIs were read with their field-extension assumptions. They do not construct the controlled extension or automorphic base change/descent with determinant and weight bookkeeping.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Precise local splitting and disjointness conditions on the auxiliary extension |
| 2 | partial | Compatibility with solvable intermediate fields |
| 3 | absent | Automorphic base change and descent statements actually invoked later |
| 4 | absent | Recording determinant and weight throughout |

#### R23.6 — process

Process verdict is appropriate for the export/application-table and source-independence bookkeeping layer. Its three absent targets do not purport to be library theorems; this does not certify the potential-modularity inputs as built.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Export separate residual and characteristic-zero potential-modularity statements with all hypotheses visible |
| 2 | absent | An application table separating which downstream result uses which statement |
| 3 | absent | Validation of the separation against KW II §§6 and 10 and Taylor's proof |

#### R24.1 — not built

Read Module.Finite and RingHom.Finite: they express finiteness, not finiteness of a deformation-ring restriction map. No fixed-determinant global deformation functor/ring or KW finiteness theorem found; framed and unframed problems remain distinguished.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Global deformation-ring finiteness over O (KW II Theorem 10.1) |
| 2 | absent | Restriction to a totally real extension and comparison with the modular deformation problem |
| 3 | partial | Finiteness of the restriction map of deformation rings |
| 4 | absent | Application to the unframed global ring with fixed determinant and local conditions (not the framed power-series enlargement) |

#### R24.2 — not built

Read Krull/integrality and ContRepresentation groundwork. None constructs a characteristic-zero deformation point with residual specialization. Finding /1 identifies the missing group-variable continuity condition; partial classification remains justified as groundwork only.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Existence of a point of the deformation ring over a finite extension of the coefficient field, from finiteness plus the presentation lower bound and local nonemptiness |
| 2 | partial | The point has residue characteristic zero and the induced representation is continuous with the required residual reduction |
| 3 | partial | Tracking integrality and the coefficient extension needed to realise the point |

#### R24.3 — not built

Generic flatness and Witt-vector APIs are not local deformation rings, complete-intersection presentations or crystalline/semistable component lifting. A presentation-file discussion of complete intersections is not such a declaration. No local lift theorem found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Böckle's Proposition 1: local deformation rings complete intersections flat over Z_p with the displayed relative dimensions, tracking fixed versus variable determinant (ad^0 versus ad) |
| 2 | absent | Böckle's Theorem 1: minimal R=T from an auxiliary R_Q ≅ T_Q of finite flat W(k)-algebras |
| 3 | absent | The four lift constructions of KW I Theorem 5.1 with exact determinant, weight, ramification and local-type hypotheses |
| 4 | absent | Enumeration of the minimum-ramification, weight-two and auxiliary good-dihedral applications, including the local-at-2 cases |
| 5 | absent | Nonemptiness of a local type before requesting a global point of that type |

#### R24.4 — not built

Cyclotomic field/character material is not an absolutely irreducible crystalline lift of the specified residual representation or an inertial-type/good-dihedral construction. All three target absences survived focused searches.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Derivation of KW I Theorem 4.1 (the full modularity-lifting interface) from KW II §10 and the patching theorem |
| 2 | absent | The p=2 nonsolvable-image case and the crystalline-weight-two versus semistable-weight-two distinction, with the residual weight-four condition in the dyadic case |
| 3 | partial | For odd p: cyclotomic absolute irreducibility and the stated crystalline weight interval or potentially semistable weight-two condition |

#### R24.5 — not built

Read split representation Green K0 and simpleClassBasis, including Artinian coefficient-ring and exhaustive pairwise-nonisomorphic simple-family hypotheses. They do not automatically identify compatible systems or prove solvable descent. Distinguish this K0 from an exact-sequence Grothendieck group.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Construction of a compatible system over the original field with a prescribed member, via potential modularity, solvable base change/descent and character induction |
| 2 | absent | Independence of the system from the choices made |
| 3 | partial | Existence of genuine two-dimensional representations rather than a virtual Brauer-induction combination |
| 4 | absent | Common coefficient field, Frobenius polynomials, purity, Hodge weights and the available local compatibility |

#### R24.5:operations — not built

Checked all six operations/arithmetic-point targets against generic tensor, dual, restriction, induction and symmetric-power infrastructure. These provide operations, not preservation of compatible-system purity, regularity, polarization or the general Moret–Bailly theorem. Owner comparison retains R23.1 as the arithmetic-point milestone rather than duplicating it.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | General Moret-Bailly/Skolem theorem for an arbitrary smooth geometrically irreducible variety over a number field, with local conditions, prescribed splitting and linear disjointness |
| 2 | partial | Total reality of the constructed extension proved from the real local conditions |
| 3 | absent | Compatible systems as actual representations at coefficient places with common Frobenius polynomials, not only a trace table |
| 4 | absent | Weak, almost strict and strict local predicates supported separately |
| 5 | partial | Rank-n and polarized systems: tensor products, duals, symmetric and exterior powers, induced systems and restriction, with the conditions retaining irreducibility, regularity, polarization and purity |
| 6 | absent | Hodge-Tate and local monodromy compatibility imported from p-adic Hodge theory |

#### R24.6 — not built

All four exceptional-prime/Weil–Deligne/de Rham targets remain absent. Finding /3 credits the two existing period-ring definitions beyond inverting p, without inferring kernel principality, admissibility, local-global compatibility or a de Rham lifting theorem.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Reduction and specialisation lemmas for changing the coefficient prime, controlling determinant, conductor, inertial type, irreducibility and oddness |
| 2 | absent | Hypotheses making local compatibility valid when the new coefficient prime was already ramified |
| 3 | absent | Preserving the almost-strict limitation in the residually reducible case |
| 4 | absent | A de Rham lifting theorem in place of the missing Weil-Deligne assertion |

### SerreWeightAndLevelOptimisation

[Roadmap document](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/SerreWeightAndLevelOptimisation/README.md).

#### R20.1 — not built

Read characteristic-zero Petersson old/new and eigenform material with level/nonzero, degeneracy and character hypotheses. Strong multiplicity one concerns fixed level/weight/character and coefficients outside a finite exceptional set, not arbitrary integral/residual level comparison. Finding /4 corrects the congruence-module owner.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Old/new exact sequences from the integral Hecke modules |
| 2 | absent | Congruence modules |
| 3 | partial | Localisation and saturation of the integral Hecke modules |
| 4 | absent | Passage between characteristic-zero and residual eigensystems with controlled level |
| 5 | partial | How a Hecke eigensystem survives when a prime is removed from the level, and recovery of a chosen characteristic-zero lift |

#### R20.2 — not built

Searched Mazur, Ribet, Ihara, modular curves and Neron models as well as level lowering. Banach-space Mazur results and existing characteristic-zero modular-form results do not provide the residual modular-curve theorem or its local hypotheses.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Mazur's principle |
| 2 | absent | Ribet/Diamond level-lowering statements, including ramified and higher-exponent cases |
| 3 | absent | Use of bad-fibre geometry and character-group maps rather than a trace congruence |
| 4 | absent | Verification of irreducibility, q mod p restrictions, exceptional cases and coefficient fields per theorem |
| 5 | absent | Iteration reaching the prime-to-p Artin conductor, not merely its radical |

#### R20.3 — not built

Finite-free Cartier duality for Hopf algebras is genuine groundwork, not a classification of finite-flat Galois models, Serre weights or extension classes. The residual weight/ordinary/finite-flat target package was not found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | The Edixhoven/Serre weight theorem |
| 2 | absent | Characteristic-p operations on mod-p modular forms (theta operator, Frobenius, weight filtration) |
| 3 | partial | Local finite-flat and extension calculations at p, with the geometric interpretation |
| 4 | absent | Reducible and irreducible local cases with the low-characteristic corrections |
| 5 | absent | The exact conclusion at weight p+1 and the effect of twisting |

#### R20.4 — not built

Dirichlet conductor/change-of-level and complex nebentypus lowering exist; lowering has divisibility/periodicity assumptions. No automatic residual character specialization or required Serre conductor comparison follows.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Removal of unwanted p-power level in the stated ranges |
| 2 | absent | The finite-flat weight-two consequence for p ≥ 5 |
| 3 | partial | Control of the nebentypus and its lift, including that a character congruent to 1 need not be trivial when p divides its order |
| 4 | absent | The character specialisation statement after excluding the relevant primes |

#### R20.5 — not built

Gaussian integers are not the quadratic Galois field/induction and dyadic-exception analysis requested here. Searches for the exceptional representations and named arguments found no matching construction.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Buzzard's Theorem 2.8 mod-2 level-lowering branch with the non-Q(i)-induced hypothesis |
| 2 | absent | The separate Q(i)-induced analysis |
| 3 | absent | Comparison with Wiese's assigned weight-one theorem and KW I's precise exceptions |
| 4 | absent | An exact list of weak-to-classical-strong Serre implications |
| 5 | absent | Enumeration of the remaining p=2 scalar local case |

#### R20.6 — process

Read the integration/export and case-table contract and the accepted review's treatment of process versus not built. Kept process: the label describes assembly/validation work and does not mark the underlying unproved arithmetic statements as formalized.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | The bounded-level, weight-two, trivial-character consequence used at sufficiently large good p |
| 2 | absent | The optimisation inputs used inside KW and the modern qualitative proof, without importing their final Serre theorem |
| 3 | absent | A case table showing how R27 supplies the dyadic completion |

### TorsionCohomologyInfrastructure

[Roadmap document](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/TorsionCohomologyInfrastructure/README.md).

#### TC.0 — not built

Read Huber/rational-localization completion and integral-element criteria with completeness, Hausdorff and unit-ideal hypotheses. The construction is a structure presheaf plus sheaf criteria, not automatic acyclicity. PreTilt/untilt here is a multiplicative sharp map, not a tilting equivalence. Formal Spf, almost/perfectoid gluing and analytic Hartogs targets were not found; algebraic one-dimensional Hartogs is not a replacement.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Comparison of the integral structure sheaves given by formal models, by power-bounded affinoid sections and by the relevant sites, on the specified covers |
| 2 | partial | Ideal-of-boundary sheaves, their pullback under level maps and compatibility with completion |
| 3 | absent | An exact extension theorem for bounded functions across the chosen boundary, stable under admissible refinement |
| 4 | absent | Almost acyclicity on affinoid perfectoid charts, retaining the almost ideal and the p-power loss through Čech complexes |

#### TC.1 — not built

Abstract Hecke double cosets and existing adic material do not construct Shimura infinite-level towers, automorphic line bundles or a Hodge–Tate period map. Author-name Shimura hits are not constructions.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Comparison of an automorphic bundle lattice with its pullback along the Hodge-Tate period map, for a Hodge-type Shimura tower |
| 2 | absent | Hecke equivariance away from p, with the p-action on the flag side described separately |
| 3 | absent | Comparison of finite-level sections with infinite-level sections modulo varpi^m |
| 4 | absent | Approximation/extension lemmas producing finite-level classical sections after twisting by a high power of an ample automorphic line bundle |
| 5 | absent | Carrying the boundary ideal, the power of the ample bundle and the congruence exponent through the argument |

#### TC.2 — not built

Ordinary limits, generic spectral sequences and nilpotence infrastructure were checked separately from completed cohomology, derived inverse-limit control and bounded Tor/cohomological amplitude. No matching tower API found. Nilpotent ideals are not inferred from pointwise nilpotence without a uniform argument.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Cohomological comparison diagram between finite-level torsion classes, completed cohomology, Čech cohomology on perfectoid charts and TC.1's sections |
| 2 | absent | Naturality for Hecke correspondences and for changes of coefficient exponent |
| 3 | partial | Cohomological-dimension/amplitude estimates and derived-limit bounds controlling the kernel of the Hecke map |
| 4 | partial | Export of a quantified nilpotent ideal with compatible quotient maps, without erasing the error by inverting p |

#### TC.3 — not built

Dynamic Levi natural isomorphisms and GL_n arithmetic Hecke rings do not supply a boundary fibration or local Satake comparison. No polynomial-law pseudodeterminant, Cayley–Hamilton arithmetic factor extraction or geometric restriction-of-scalars package found; restriction of module scalars is different.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | Identification of the boundary fibration for symplectic/unitary parabolics whose Levi contains a restriction of scalars of GL_n |
| 2 | absent | Calculation of the Hecke action through the Levi Satake map |
| 3 | partial | Polynomial identities relating Levi factors, contragredients and character twists to the ambient Hecke polynomial |
| 4 | absent | Abstract factor-separation lemma using auxiliary characters with the source's separation property, coefficient-ring endomorphisms and determinant identities |
| 5 | absent | Uniqueness, change-of-ring and compatibility for two choices of auxiliary data giving the same factor, including nilpotent coefficient quotients |
| 6 | absent | A continuous determinant over the ring, not merely a pointwise factorisation of a polynomial |

#### TC.4 — not built

Class-formation/ray-class material supplies generic GL1 ingredients, not the specified Hecke compatibility. Homology maps alone are not a universal-coefficient theorem for the torsion argument. No residual torsion arithmetic test theorem found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | A compatibility theorem that all four routes from a finite-level class to Hecke characteristic polynomials commute after the quantified quotient |
| 2 | partial | Uniformity in m and tame level, and passage to inverse systems |
| 3 | partial | A GL_1 class-field normalization example |
| 4 | absent | A GL_2 modular-curve normalization example |
| 5 | absent | A genuinely torsion test class at the level of the universal-coefficient sequence |

### LogicAndDefinabilityInNumberTheory

[Roadmap document](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/campaign/LogicAndDefinabilityInNumberTheory/README.md).

#### LD.0 — partly built

Read single-sorted first-order syntax, arithmetic languages, named-parameter definability, and projection/image hypotheses (finite index types where required). CompatibleRing is a semantics bridge; language homomorphisms are not general quotient interpretations. Los/ultraproduct results use nonempty factors. Elementary embeddings/Tarski–Vaught are real existing results. Hyperreal standard part is for finite elements of an ordered field, not a hyperinteger or finite-cardinality field construction.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | partial | First-order languages, including the language of rings and a language of valued fields |
| 2 | mathlib | Structures, terms, formulas, sentences, theories and the satisfaction relation |
| 3 | mathlib | Definable sets with an explicit parameter set, and their Boolean/projection algebra |
| 4 | partial | Interpretation of one structure/language in another, with a proved semantics bridge |
| 5 | mathlib | Ultraproducts of a family of structures |
| 6 | mathlib | Los's transfer theorem for ultraproducts |
| 7 | mathlib | Explicit elementary extensions (elementary embeddings/substructures, Tarski-Vaught) |
| 8 | partial | Nonstandard arithmetic with a standard-part interface |

#### LD.1 — partly built

Read ideal HenselianRing, local-ring characterizations and complete-to-Henselian results in both libraries. IsAdicComplete.henselianRing is a real instance omitted from the declaration index, not a nonexistent citation. Valued/residue/value-group APIs are algebraic, not multisorted first-order syntax or angular components. ACF completeness/Lefschetz transfer are not valued-field QE/AKE. Presburger QE appears as a TODO, not a theorem.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | both | Henselianity of valued/local rings |
| 2 | partial | Residue field and value group as separate sorts of a valued-field structure |
| 3 | absent | Angular component maps ac_n and the Denef-Pas language |
| 4 | partial | Quantifier elimination and relative quantifier elimination results |
| 5 | absent | Ax-Kochen-Ershov transfer between henselian valued fields |
| 6 | absent | Denef-Pas cell decomposition for henselian valued fields |

#### LD.2 — not built

Generic normalized Haar and compactness of p-adic integers are groundwork for measure, not definable families/cells or Igusa rationality. Existing PadicMeasure is a continuous-functional/Amice-transform theory with different codomain/interface, not a substitute for positive Haar volumes and definable integration. No relevant cell/constructible pushforward API found.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Definable cells and p-adic cell decomposition |
| 2 | partial | Measures on p-adic definable sets (Haar measure on Q_p^n and volumes of definable families) |
| 3 | absent | Rationality of local Igusa zeta functions and Poincare series |
| 4 | absent | Constructible functions and their operations (pushforward, integration) |

#### LD.3 — not built

Abelian-category K0 imposes exact-sequence relations, not the scissors relations and Lefschetz localization of K0 of varieties. ACF/Ax–Grothendieck does not provide motivic specialization or Cluckers–Loeser transfer. Searches found no target jet/arc/motivic integration construction.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | The Grothendieck ring of varieties / of definable sets as an integration target |
| 2 | absent | Arc/jet spaces and the motivic measure |
| 3 | absent | Specialization of motivic integrals to p-adic integrals |
| 4 | absent | Pushforward along definable maps and the Fubini/change-of-variables theorem for motivic integrals |
| 5 | absent | Transfer principles between characteristics (Cluckers-Loeser) |

#### LD.4 — partly built

Read recursively enumerable/halting/Rice and Diophantine definitions over the naturals, plus exponentiation via Pell–Matiyasevic. The exponentiation theorem is present; the bridge from every recursively enumerable set to a Diophantine set is not. The full integer H10 endpoint remains a TODO. No unsupported claim about H10 over Q is imported.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | mathlib | Recursively enumerable sets and computable predicates |
| 2 | mathlib | Diophantine sets and Diophantine representations over the naturals |
| 3 | mathlib | Matiyasevic's theorem that exponentiation is Diophantine (via the Pell equation) |
| 4 | absent | MRDP: every recursively enumerable set is Diophantine |
| 5 | absent | Negative solution of Hilbert's tenth problem over the integers (undecidability) |
| 6 | absent | Variants over other rings and fields (Q, number fields, rings of integers), each with its own interpretation theorem |

#### LD.5 — not built

The existing logic vocabulary does not prove definable local-density/point-count transfer or certified algorithms for the requested families. Cross-roadmap links are consumers/interfaces, not evidence that the definable-integration endpoints have been built.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | Local-density and point-counting transfer statements derived from definable integration |
| 2 | absent | Definability interfaces to arithmetic statistics |
| 3 | absent | Definability interfaces to nonarchimedean geometry |
| 4 | absent | Certified-algorithm interfaces for special families and a frontier register of undecided field cases |

#### LD.6 — not built

Algebraic real-closed fields are not real-closed-field QE or an o-minimal structure API. Northcott finiteness is not Pila–Wilkie counting outside the algebraic part; the analytic Lindemann–Weierstrass part is not functional Ax–Lindemann/Ax–Schanuel. Refined searches removed incidental word fragments and found no requested o-minimal/unlikely-intersection theorem.

| Target | Accepted library label | Description |
| --- | --- | --- |
| 1 | absent | o-minimal structures and their definable sets |
| 2 | absent | Cell decomposition in an o-minimal structure |
| 3 | absent | Pila-Wilkie rational-point counting outside the algebraic part, with explicit height and epsilon |
| 4 | absent | Pila-Zannier applications (Manin-Mumford, Andre-Oort cases) built from separate orbit and transcendence inputs |
| 5 | absent | Functional transcendence: Ax-Lindemann and Ax-Schanuel |
| 6 | absent | Galois-orbit lower bounds for special points, and definability of uniformisation maps |

## Absence-search ledger

The patterns below are the broad first-pass families, run case-insensitively against `declarations.tsv`, then `mathlib/Mathlib` and `TauCeti/TauCeti`. They cover every absent target through its stage contract and standard alternative terminology. Broad matches are leads, not evidence of presence; the conclusions record the source distinction used. Additional focused searches tested the named alternatives and excluded author-name/substring noise. These are search summaries, not a claim that every broad query had zero hits.

### 1. PA0-boundary

Pattern: `locally.?symmetric|borel.?serre|arithmetic.?quotient|boundary.?cohomology|non.?neat`.

No arithmetic locally symmetric/Borel–Serre/non-neat boundary construction found.

### 2. PA1-weights

Pattern: `fontaine.?laffaille|dual.?weyl|integral.{0,20}highest.?weight|linkage.?principle`.

Char-zero Lie highest weights/Weyl modules are not integral modular coefficient theory; inspected their field/Q-algebra assumptions.

### 3. PA2-ordinary

Pattern: `ordinary.?part|ordinary.?projector|jacquet|factorial.{0,20}projector|h_eOrd`.

No ordinary-parts/factorial-projector arithmetic construction found.

### 4. PA3-patching

Pattern: `patching|patched.?complex|ihara|taylor.?wiles`.

Author-name/dispatching/manifold-patching and bibliographic hits are not Taylor–Wiles/Ihara patching.

### 5. PA4-Chebotarev

Pattern: `chebotarev|enormous|dual.?selmer|residual.?image`.

Read auxiliary-prime and Chebotarev prime-count groundwork; no prescribed residual Frobenius/dual-Selmer theorem or required density endpoint found.

### 6. PA5-systems

Pattern: `compatible.?system|we[iy]l.?deligne|hodge.?tate|polarized.{0,20}representation`.

Complex Hodge-theoretic Tate twists are not p-adic Hodge–Tate/Weil–Deligne compatible systems.

### 7. R23-points-moduli

Pattern: `moret|rumely|hilbert.?blumenthal|polarisation|polarization|weil.?pairing|tate.?module|moduli`.

Generic/Hodge polarization and a torsion-divisor reference to Weil pairing do not give polarized torsion moduli or a Moret–Bailly theorem.

### 8. R23-modularity

Pattern: `residual.?modular|modularity.?lift|langlands.?tunnell|automorphic.?represent|solvable.?base.?change`.

Algebraic-group solvable base change is not Langlands/Tunnell or automorphic base change.

### 9. R24-deformation

Pattern: `deformation|framed.?lift|complete.?intersection|crystalline.?representation|semistable.?representation|de.?rham.?representation|inertial.?type|good.?dihedral|artin.?conductor`.

Topological deformation and a presentation-file complete-intersection discussion are not Galois deformation rings or lifting theorems.

### 10. R20-integral

Pattern: `congruence.?module|congruence.?ideal|integral.?hecke|residual.?eigen|mod.?p.?modular|modular.?curve|neron.?model`.

Existing IntegralHeckeRing for GL_n over Z is an arithmetic double-coset algebra, not the integral cohomological congruence construction.

### 11. R20-optimisation

Pattern: `mazur|ribet|edixhoven|serre.?weight|level.?lower|weight.?filtration|theta.?operator|wiese|buzzard`.

Separate author names, Mazur–Ulam/Gelfand–Mazur, Hodge weight filtrations and characteristic-zero level lowering from residual optimisation.

### 12. TC0-formal

Pattern: `\bSpf\b|formal.?scheme|admissible.?blow|almost.?zero|almost.?isom|almost.?module|perfectoid.?space|hartogs`.

Existing algebraic one-dimensional Hartogs is not analytic perfectoid-boundary Hartogs; no formal Spf/almost/perfectoid-space gluing package found.

### 13. TC1-tower

Pattern: `shimura|automorphic.?bundle|automorphic.?line|hodge.?tate.?period|infinite.?level`.

Shimura author citations do not construct Shimura towers or Hodge–Tate period maps.

### 14. TC2-cohomology

Pattern: `completed.?cohomology|lim¹|derived.?inverse.?limit|tor.?amplitude|cohomological.?amplitude|universal.?coefficient`.

Ordinary limits/Mittag-Leffler conditions and generic derived categories do not supply the required completed-cohomology/derived-tower control.

### 15. TC3-determinants

Pattern: `satake|pseudorep|pseudochar|chenevier|weil.?restriction|restriction.?of.?scalars`.

Module/Lie scalar restriction is not geometric Weil restriction; no relevant Satake/pseudodeterminant construction found.

### 16. LD0-interpretation

Pattern: `interpretation|interpretable|multisort|multi.sort|hypernatural|hyperinteger`.

Single-sorted semantics and language morphisms are not general quotient interpretations; hyperreal standard part is not hyperinteger arithmetic.

### 17. LD1-valued

Pattern: `angular.?component|denef|kochen|ershov|quantifier.?elimin|back.and.forth`.

Presburger quantifier elimination is a TODO; dense-order back-and-forth and ACF completeness do not prove valued-field QE/AKE.

### 18. LD2-integral

Pattern: `igusa|poincar[eé].?series|cell.?decomposition|constructible.?function|padic.{0,20}measure|measure.{0,20}padic`.

PadicMeasure/Amice exists with a different interface; graded/knot Poincare constructions are not local Igusa/Poincare rationality.

### 19. LD3-motivic

Pattern: `motivic|jet.?scheme|arc.?space|grothendieck.{0,20}variet|cluckers|loeser`.

No matching motivic measure, jet/arc, K0-varieties or Cluckers–Loeser target found.

### 20. LD4-undecidability

Pattern: `mrdp|dprm|hilbert.{0,5}tenth|diophantine.{0,20}undecid|julia.?robinson|dioph.{0,20}rePred|rePred.{0,20}dioph`.

Diophantine exponentiation is present, while the RE-to-Diophantine bridge/full H10 endpoint remains unimplemented in the inspected files.

### 21. LD5-6-counting

Pattern: `\bo.minimal|semialgebraic|semi.algebraic|subanalytic|tarski.?seidenberg|pila|zannier|ax.?lindemann|ax.?schanuel|andre.?oort|manin.?mumford|mordell.?lang`.

Broad substring noise was removed by refined word-boundary searches; real-closed fields, Northcott and analytic Lindemann–Weierstrass are not o-minimal/Pila/Ax endpoints.

## Pinned citation ledger

One row per distinct declaration (166); the uses column accounts for all 197 citation occurrences. File links point to the exact library pin. A related fit means groundwork, not the complete target. The per-stage assessments record the important hypothesis and domain restrictions.

| Declaration | Pinned source | Audit uses and accepted fit |
| --- | --- | --- |
| `groupCohomology` | [mathlib:186](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean#L186) | PotentialAutomorphyInfrastructure:PA.0 #1 (related) |
| `Subgroup.IsArithmetic` | [mathlib:102](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean#L102) | PotentialAutomorphyInfrastructure:PA.0 #1 (related) |
| `CongruenceSubgroup.Gamma` | [mathlib:41](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L41) | PotentialAutomorphyInfrastructure:PA.0 #1 (related) |
| `groupCohomology.inhomogeneousCochains` | [mathlib:123](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean#L123) | PotentialAutomorphyInfrastructure:PA.0 #2 (related) |
| `Rep.barResolution` | [mathlib:429](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/Resolution.lean#L429) | PotentialAutomorphyInfrastructure:PA.0 #2 (related) |
| `HeckeCoset.toSet_eq_doubleCoset_rep` | [tauceti:123](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Basic.lean#L123) | PotentialAutomorphyInfrastructure:PA.0 #3 (related); TorsionCohomologyInfrastructure:TC.1 #2 (related) |
| `HeckeRing.GL2.heckeTNat` | [tauceti:82](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Operators.lean#L82) | PotentialAutomorphyInfrastructure:PA.0 #3 (related); TorsionCohomologyInfrastructure:TC.3 #3 (related) |
| `groupCohomology.map` | [mathlib:141](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean#L141) | PotentialAutomorphyInfrastructure:PA.0 #4 (related) |
| `groupCohomology.mapIso` | [mathlib:177](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean#L177) | PotentialAutomorphyInfrastructure:PA.0 #4 (related) |
| `groupCohomology.coindIso` | [mathlib:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean#L59) | PotentialAutomorphyInfrastructure:PA.0 #5 (related) |
| `TauCeti.ContCohomology.explicitCor0Transversal` | [tauceti:146](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean#L146) | PotentialAutomorphyInfrastructure:PA.0 #5 (related) |
| `TauCeti.weylModuleOfShape` | [tauceti:417](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean#L417) | PotentialAutomorphyInfrastructure:PA.1 #1 (related); PotentialAutomorphyInfrastructure:PA.1 #2 (special case) |
| `Rep` | [mathlib:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean#L30) | PotentialAutomorphyInfrastructure:PA.1 #1 (related) |
| `TauCeti.YoungTableau.weylModule` | [tauceti:122](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean#L122) | PotentialAutomorphyInfrastructure:PA.1 #2 (special case) |
| `TauCeti.schurFunctor` | [tauceti:492](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean#L492) | PotentialAutomorphyInfrastructure:PA.1 #2 (related) |
| `groupCohomology.δ` | [mathlib:94](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LongExactSequence.lean#L94) | PotentialAutomorphyInfrastructure:PA.1 #4 (related) |
| `CategoryTheory.Abelian.SpectralObject` | [mathlib:41](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralObject/Basic.lean#L41) | PotentialAutomorphyInfrastructure:PA.1 #4 (related) |
| `CategoryTheory.SpectralSequence` | [mathlib:37](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/SpectralSequence/Basic.lean#L37) | PotentialAutomorphyInfrastructure:PA.1 #4 (related); TorsionCohomologyInfrastructure:TC.2 #3 (related) |
| `WittVector.fontaineTheta` | [mathlib:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean#L165) | PotentialAutomorphyInfrastructure:PA.1 #5 (related) |
| `IsIdempotentElem` | [mathlib:38](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Idempotent.lean#L38) | PotentialAutomorphyInfrastructure:PA.2 #1 (related) |
| `TauCeti.Cocharacter.parabolic` | [tauceti:293](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean#L293) | PotentialAutomorphyInfrastructure:PA.2 #3 (related); TorsionCohomologyInfrastructure:TC.3 #1 (related) |
| `TauCeti.Cocharacter.levi` | [tauceti:344](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean#L344) | PotentialAutomorphyInfrastructure:PA.2 #3 (related); TorsionCohomologyInfrastructure:TC.3 #1 (related) |
| `CategoryTheory.Limits.lim` | [mathlib:541](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L541) | PotentialAutomorphyInfrastructure:PA.2 #5 (related) |
| `Module.support` | [mathlib:49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L49) | PotentialAutomorphyInfrastructure:PA.3 #3 (related) |
| `Module.mem_support_iff_exists_annihilator` | [mathlib:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L70) | PotentialAutomorphyInfrastructure:PA.3 #3 (related) |
| `ringKrullDim` | [mathlib:29](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean#L29) | PotentialAutomorphyInfrastructure:PA.3 #3 (related); PotentialModularityAndCompatibleSystems:R24.2 #1 (related) |
| `RingTheory.Sequence.IsWeaklyRegular` | [mathlib:135](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean#L135) | PotentialAutomorphyInfrastructure:PA.3 #3 (related) |
| `NumberField.exists_auxiliaryPrime` | [tauceti:45](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.lean#L45) | PotentialAutomorphyInfrastructure:PA.4 #1 (related) |
| `Filter.hyperfilter` | [mathlib:96](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Filter/Ultrafilter/Basic.lean#L96) | PotentialAutomorphyInfrastructure:PA.4 #3 (exact) |
| `Filter.notMem_hyperfilter_of_finite` | [mathlib:111](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Filter/Ultrafilter/Basic.lean#L111) | PotentialAutomorphyInfrastructure:PA.4 #3 (exact) |
| `Ultrafilter.exists_le` | [mathlib:293](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Filter/Ultrafilter/Defs.lean#L293) | PotentialAutomorphyInfrastructure:PA.4 #3 (more general) |
| `FirstOrder.Language.Ultraproduct.sentence_realize` | [mathlib:154](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Ultraproducts.lean#L154) | PotentialAutomorphyInfrastructure:PA.4 #4 (related); LogicAndDefinabilityInNumberTheory:LD.0 #6 (exact) |
| `TauCeti.GaloisLatticeCat` | [tauceti:135](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/Basic.lean#L135) | PotentialAutomorphyInfrastructure:PA.5 #1 (related) |
| `ContRepresentation` | [mathlib:54](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L54) | PotentialAutomorphyInfrastructure:PA.5 #1 (related); PotentialModularityAndCompatibleSystems:R24.2 #2 (related) |
| `Rep.tensor_ρ` | [mathlib:666](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean#L666) | PotentialAutomorphyInfrastructure:PA.5 #2 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #5 (related) |
| `Representation.symmetricPower` | [tauceti:47](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SymmetricPower.lean#L47) | PotentialAutomorphyInfrastructure:PA.5 #2 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #5 (related) |
| `Rep.ihom` | [mathlib:757](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Rep/Basic.lean#L757) | PotentialAutomorphyInfrastructure:PA.5 #2 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #5 (related) |
| `AlgebraicGeometry.GeometricallyIrreducible` | [mathlib:42](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean#L42) | PotentialModularityAndCompatibleSystems:R23.1 #2 (related); PotentialModularityAndCompatibleSystems:R23.2 #2 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #1 (related) |
| `AlgebraicGeometry.GeometricallyIrreducible.comp` | [mathlib:124](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean#L124) | PotentialModularityAndCompatibleSystems:R23.1 #2 (exact) |
| `AlgebraicGeometry.GeometricallyIntegral.of_geometricallyReduced_of_geometricallyIrreducible` | [mathlib:61](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Geometrically/Integral.lean#L61) | PotentialModularityAndCompatibleSystems:R23.1 #2 (exact) |
| `AlgebraicGeometry.Smooth` | [mathlib:62](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean#L62) | PotentialModularityAndCompatibleSystems:R23.1 #2 (exact) |
| `TauCeti.GlobalNumberFields.weakApproximation_denseRange` | [tauceti:202](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean#L202) | PotentialModularityAndCompatibleSystems:R23.1 #3 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #1 (related) |
| `TauCeti.henselianLocalRing_integer` | [tauceti:34](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Henselian.lean#L34) | PotentialModularityAndCompatibleSystems:R23.1 #3 (related); LogicAndDefinabilityInNumberTheory:LD.1 #1 (special case) |
| `HenselianLocalRing` | [mathlib:108](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean#L108) | PotentialModularityAndCompatibleSystems:R23.1 #3 (related); LogicAndDefinabilityInNumberTheory:LD.1 #1 (more general) |
| `IntermediateField.LinearDisjoint` | [mathlib:157](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/LinearDisjoint.lean#L157) | PotentialModularityAndCompatibleSystems:R23.1 #4 (related); PotentialModularityAndCompatibleSystems:R23.5 #1 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #1 (related) |
| `NumberField.IsTotallyReal` | [mathlib:47](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean#L47) | PotentialModularityAndCompatibleSystems:R23.1 #4 (related); PotentialModularityAndCompatibleSystems:R23.3 #2 (related); PotentialModularityAndCompatibleSystems:R24.1 #2 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #2 (related) |
| `NumberField.InfinitePlace.IsReal` | [mathlib:185](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean#L185) | PotentialModularityAndCompatibleSystems:R23.1 #4 (related); PotentialModularityAndCompatibleSystems:R24.5:operations #2 (related) |
| `NumberField.InfinitePlace.IsReal.isUnramified` | [mathlib:318](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean#L318) | PotentialModularityAndCompatibleSystems:R23.1 #4 (related) |
| `TauCeti.AlgebraicGeometry.AbelianVariety` | [tauceti:94](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L94) | PotentialModularityAndCompatibleSystems:R23.2 #1 (related); PotentialModularityAndCompatibleSystems:R23.3 #2 (related) |
| `AlgebraicGeometry.Scheme.Hom.irreducibleComponentsEquiv` | [mathlib:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Geometrically/Irreducible.lean#L89) | PotentialModularityAndCompatibleSystems:R23.2 #5 (related) |
| `IsSolvable` | [mathlib:114](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Solvable.lean#L114) | PotentialModularityAndCompatibleSystems:R23.3 #4 (related); PotentialModularityAndCompatibleSystems:R23.5 #2 (related) |
| `Representation.IsIrreducible` | [mathlib:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Irreducible.lean#L30) | PotentialModularityAndCompatibleSystems:R23.4 #2 (related) |
| `Ideal.ramificationIdx` | [mathlib:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RamificationInertia/Ramification.lean#L52) | PotentialModularityAndCompatibleSystems:R23.5 #1 (related) |
| `IsGalois` | [mathlib:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Galois/Basic.lean#L57) | PotentialModularityAndCompatibleSystems:R23.5 #2 (related) |
| `Module.Finite` | [mathlib:117](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean#L117) | PotentialModularityAndCompatibleSystems:R24.1 #3 (related) |
| `RingHom.Finite` | [mathlib:170](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Defs.lean#L170) | PotentialModularityAndCompatibleSystems:R24.1 #3 (related) |
| `IsIntegralClosure` | [mathlib:28](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean#L28) | PotentialModularityAndCompatibleSystems:R24.2 #3 (related) |
| `TauCeti.ringKrullDim_le_of_isIntegral` | [tauceti:57](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/KrullDimension/Integral.lean#L57) | PotentialModularityAndCompatibleSystems:R24.2 #3 (related) |
| `Module.Flat` | [mathlib:113](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean#L113) | PotentialModularityAndCompatibleSystems:R24.3 #1 (related) |
| `WittVector` | [mathlib:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean#L52) | PotentialModularityAndCompatibleSystems:R24.3 #2 (related) |
| `IsCyclotomicExtension` | [mathlib:76](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/Basic.lean#L76) | PotentialModularityAndCompatibleSystems:R24.4 #3 (related) |
| `TauCeti.repRing` | [tauceti:106](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/RepresentationRing/Basic.lean#L106) | PotentialModularityAndCompatibleSystems:R24.5 #3 (related) |
| `TauCeti.simpleClassBasis` | [tauceti:268](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean#L268) | PotentialModularityAndCompatibleSystems:R24.5 #3 (related) |
| `Representation.exteriorPower` | [tauceti:50](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ExteriorPower.lean#L50) | PotentialModularityAndCompatibleSystems:R24.5:operations #5 (related) |
| `Representation.ind` | [mathlib:77](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Induced.lean#L77) | PotentialModularityAndCompatibleSystems:R24.5:operations #5 (related) |
| `fontaineThetaInvertP` | [mathlib:64](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean#L64) | PotentialModularityAndCompatibleSystems:R24.6 #4 (related) |
| `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` | [tauceti:247](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L247) | SerreWeightAndLevelOptimisation:R20.1 #1 (special case) |
| `TauCeti.cuspFormsOld` | [tauceti:103](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L103) | SerreWeightAndLevelOptimisation:R20.1 #1 (special case) |
| `TauCeti.cuspFormsNew` | [tauceti:200](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L200) | SerreWeightAndLevelOptimisation:R20.1 #1 (special case) |
| `TauCeti.ModularForm.levelRaise` | [tauceti:278](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Degeneracy.lean#L278) | SerreWeightAndLevelOptimisation:R20.1 #1 (special case) |
| `TauCeti.disjoint_cuspFormsOld_cuspFormsNew` | [tauceti:228](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean#L228) | SerreWeightAndLevelOptimisation:R20.1 #1 (special case) |
| `LocalizedModule` | [mathlib:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean#L89) | SerreWeightAndLevelOptimisation:R20.1 #3 (related) |
| `Subalgebra.saturation` | [mathlib:428](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean#L428) | SerreWeightAndLevelOptimisation:R20.1 #3 (related) |
| `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | [tauceti:87](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L87) | SerreWeightAndLevelOptimisation:R20.1 #5 (special case) |
| `TauCeti.mem_cuspFormsOld_of_forall_coprime_qExpansion_coeff_eq_zero` | [tauceti:178](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/MainLemma.lean#L178) | SerreWeightAndLevelOptimisation:R20.1 #5 (special case) |
| `HeckeRing.GL2.Newform` | [tauceti:102](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean#L102) | SerreWeightAndLevelOptimisation:R20.1 #5 (related) |
| `HeckeRing.GL2.Newform.eq_of_forall_notMem_qExpansion_coeff_eq` | [tauceti:115](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L115) | SerreWeightAndLevelOptimisation:R20.1 #5 (special case) |
| `TauCeti.FiniteLocallyFreeBicommutativeHopfAlgCat` | [tauceti:77](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/HopfAlgebra/FiniteDual/CartierDuality/Basic.lean#L77) | SerreWeightAndLevelOptimisation:R20.3 #3 (related) |
| `DirichletCharacter.changeLevel` | [mathlib:66](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L66) | SerreWeightAndLevelOptimisation:R20.4 #3 (related) |
| `DirichletCharacter.conductor` | [mathlib:246](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L246) | SerreWeightAndLevelOptimisation:R20.4 #3 (related) |
| `isInternal_modFormCharSpace` | [tauceti:131](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/CharacterDecomp.lean#L131) | SerreWeightAndLevelOptimisation:R20.4 #3 (related) |
| `TauCeti.exists_cuspForm_mem_cuspFormCharSpace_or_eq_zero` | [tauceti:262](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/ConductorDichotomy.lean#L262) | SerreWeightAndLevelOptimisation:R20.4 #3 (related) |
| `GaussianInt` | [mathlib:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Zsqrtd/GaussianInt.lean#L50) | SerreWeightAndLevelOptimisation:R20.5 #2 (related) |
| `TauCeti.ValuationSpectrum.mem_iff_forall_vle_one` | [tauceti:89](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Integral.lean#L89) | TorsionCohomologyInfrastructure:TC.0 #1 (related) |
| `TauCeti.ValuationSpectrum.presentationLimitPresheaf` | [tauceti:298](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/StructurePresheaf/Basic.lean#L298) | TorsionCohomologyInfrastructure:TC.0 #1 (related) |
| `TauCeti.ValuationSpectrum.isSheaf_iff_isSheafFor_rationalCover` | [tauceti:51](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/SheafCriterion.lean#L51) | TorsionCohomologyInfrastructure:TC.0 #1 (related) |
| `TauCeti.Huber.IsPowerBounded` | [tauceti:111](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/PowerBounded.lean#L111) | TorsionCohomologyInfrastructure:TC.0 #1 (related) |
| `TauCeti.Huber.PairOfDefinition.enlargeIdeal` | [tauceti:163](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/RingOfDefinition.lean#L163) | TorsionCohomologyInfrastructure:TC.0 #1 (related) |
| `TauCeti.Huber.PairOfDefinition.completionRingOfDefinition` | [tauceti:81](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Huber/Completion.lean#L81) | TorsionCohomologyInfrastructure:TC.0 #2 (related) |
| `TauCeti.ValuationSpectrum.restrictToIdeal` | [tauceti:69](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/RestrictToIdeal.lean#L69) | TorsionCohomologyInfrastructure:TC.0 #2 (related) |
| `TauCeti.ValuationSpectrum.exists_span_eq_top_forall_rationalSubset_subset` | [tauceti:141](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Refinement.lean#L141) | TorsionCohomologyInfrastructure:TC.0 #3 (related) |
| `PreTilt.untilt` | [mathlib:49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/Untilt.lean#L49) | TorsionCohomologyInfrastructure:TC.0 #4 (related) |
| `CategoryTheory.SimplicialObject.cechNerve` | [mathlib:105](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/CechNerve.lean#L105) | TorsionCohomologyInfrastructure:TC.0 #4 (related); TorsionCohomologyInfrastructure:TC.2 #1 (related) |
| `CategoryTheory.Limits.HasLimitsOfShape` | [mathlib:113](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L113) | TorsionCohomologyInfrastructure:TC.2 #3 (related) |
| `IsNilpotent` | [mathlib:154](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Basic.lean#L154) | TorsionCohomologyInfrastructure:TC.2 #4 (related) |
| `nilpotencyClass` | [mathlib:78](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/Defs.lean#L78) | TorsionCohomologyInfrastructure:TC.2 #4 (related) |
| `TauCeti.Cocharacter.leviDecompositionNatIso` | [tauceti:203](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Naturality.lean#L203) | TorsionCohomologyInfrastructure:TC.3 #1 (related) |
| `Polynomial.roots` | [mathlib:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Roots.lean#L58) | TorsionCohomologyInfrastructure:TC.3 #3 (related) |
| `CategoryTheory.Limits.limit` | [mathlib:181](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L181) | TorsionCohomologyInfrastructure:TC.4 #2 (related) |
| `TauCeti.ClassFieldTheory.Formation` | [tauceti:123](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ClassFieldTheory/Formation/Basic.lean#L123) | TorsionCohomologyInfrastructure:TC.4 #3 (related) |
| `TauCeti.GlobalNumberFields.rayHom` | [tauceti:128](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean#L128) | TorsionCohomologyInfrastructure:TC.4 #3 (related) |
| `CategoryTheory.ShortComplex.homologyMap` | [mathlib:435](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/ShortComplex/Homology.lean#L435) | TorsionCohomologyInfrastructure:TC.4 #5 (related) |
| `FirstOrder.Language` | [mathlib:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Basic.lean#L58) | LogicAndDefinabilityInNumberTheory:LD.0 #1 (exact) |
| `FirstOrder.Language.ring` | [mathlib:60](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Ring/Basic.lean#L60) | LogicAndDefinabilityInNumberTheory:LD.0 #1 (exact) |
| `FirstOrder.Ring.CompatibleRing` | [mathlib:157](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Ring/Basic.lean#L157) | LogicAndDefinabilityInNumberTheory:LD.0 #1 (exact); LogicAndDefinabilityInNumberTheory:LD.0 #4 (special case) |
| `FirstOrder.Language.presburger` | [mathlib:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Arithmetic/Presburger/Basic.lean#L43) | LogicAndDefinabilityInNumberTheory:LD.0 #1 (related) |
| `FirstOrder.Language.Structure` | [mathlib:154](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Basic.lean#L154) | LogicAndDefinabilityInNumberTheory:LD.0 #2 (exact) |
| `FirstOrder.Language.Term` | [mathlib:79](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Syntax.lean#L79) | LogicAndDefinabilityInNumberTheory:LD.0 #2 (exact) |
| `FirstOrder.Language.BoundedFormula` | [mathlib:309](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Syntax.lean#L309) | LogicAndDefinabilityInNumberTheory:LD.0 #2 (exact) |
| `FirstOrder.Language.Formula` | [mathlib:320](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Syntax.lean#L320) | LogicAndDefinabilityInNumberTheory:LD.0 #2 (exact) |
| `FirstOrder.Language.Theory` | [mathlib:328](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Syntax.lean#L328) | LogicAndDefinabilityInNumberTheory:LD.0 #2 (exact) |
| `Set.Definable` | [mathlib:56](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Definability.lean#L56) | LogicAndDefinabilityInNumberTheory:LD.0 #3 (exact); LogicAndDefinabilityInNumberTheory:LD.5 #2 (related) |
| `Set.definable_iff_empty_definable_with_params` | [mathlib:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Definability.lean#L88) | LogicAndDefinabilityInNumberTheory:LD.0 #3 (exact) |
| `Set.Definable.image_comp` | [mathlib:242](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Definability.lean#L242) | LogicAndDefinabilityInNumberTheory:LD.0 #3 (exact) |
| `Set.DefinableFun` | [mathlib:450](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Definability.lean#L450) | LogicAndDefinabilityInNumberTheory:LD.0 #3 (exact) |
| `FirstOrder.Ring.mvPolynomial_zeroLocus_definable` | [mathlib:29](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Ring/Definability.lean#L29) | LogicAndDefinabilityInNumberTheory:LD.0 #3 (special case); LogicAndDefinabilityInNumberTheory:LD.0 #4 (related) |
| `FirstOrder.Language.LHom` | [mathlib:49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/LanguageMap.lean#L49) | LogicAndDefinabilityInNumberTheory:LD.0 #4 (related) |
| `FirstOrder.Language.LEquiv` | [mathlib:279](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/LanguageMap.lean#L279) | LogicAndDefinabilityInNumberTheory:LD.0 #4 (related) |
| `FirstOrder.Language.Ultraproduct.«structure»` | [mathlib:74](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Ultraproducts.lean#L74) | LogicAndDefinabilityInNumberTheory:LD.0 #5 (exact) |
| `FirstOrder.Language.Ultraproduct.setoidPrestructure` | [mathlib:49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Ultraproducts.lean#L49) | LogicAndDefinabilityInNumberTheory:LD.0 #5 (exact) |
| `Filter.Germ` | [mathlib:79](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Filter/Germ/Basic.lean#L79) | LogicAndDefinabilityInNumberTheory:LD.0 #5 (related) |
| `FirstOrder.Language.Ultraproduct.boundedFormula_realize_cast` | [mathlib:95](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Ultraproducts.lean#L95) | LogicAndDefinabilityInNumberTheory:LD.0 #6 (more general) |
| `FirstOrder.Language.Ultraproduct.realize_formula_cast` | [mathlib:146](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Ultraproducts.lean#L146) | LogicAndDefinabilityInNumberTheory:LD.0 #6 (more general) |
| `FirstOrder.Language.Theory.isSatisfiable_iff_isFinitelySatisfiable` | [mathlib:100](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Satisfiability.lean#L100) | LogicAndDefinabilityInNumberTheory:LD.0 #6 (related) |
| `FirstOrder.Language.ElementaryEmbedding` | [mathlib:45](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/ElementaryMaps.lean#L45) | LogicAndDefinabilityInNumberTheory:LD.0 #7 (exact) |
| `FirstOrder.Language.Embedding.isElementary_of_exists` | [mathlib:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/ElementaryMaps.lean#L245) | LogicAndDefinabilityInNumberTheory:LD.0 #7 (exact) |
| `FirstOrder.Language.ElementaryEmbedding.ofModelsElementaryDiagram` | [mathlib:224](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/ElementaryMaps.lean#L224) | LogicAndDefinabilityInNumberTheory:LD.0 #7 (exact) |
| `FirstOrder.Language.ElementarySubstructure.isElementary` | [mathlib:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/ElementarySubstructures.lean#L72) | LogicAndDefinabilityInNumberTheory:LD.0 #7 (exact) |
| `Hyperreal` | [mathlib:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Real/Hyperreal.lean#L44) | LogicAndDefinabilityInNumberTheory:LD.0 #8 (special case) |
| `ArchimedeanClass.stdPart` | [mathlib:273](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Order/Ring/StandardPart.lean#L273) | LogicAndDefinabilityInNumberTheory:LD.0 #8 (more general) |
| `Hyperreal.stdPart_coe` | [mathlib:173](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Real/Hyperreal.lean#L173) | LogicAndDefinabilityInNumberTheory:LD.0 #8 (special case) |
| `Hyperreal.stdPart_of_tendsto` | [mathlib:299](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Real/Hyperreal.lean#L299) | LogicAndDefinabilityInNumberTheory:LD.0 #8 (special case) |
| `HenselianRing` | [mathlib:94](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean#L94) | LogicAndDefinabilityInNumberTheory:LD.1 #1 (more general) |
| `HenselianLocalRing.TFAE` | [mathlib:119](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean#L119) | LogicAndDefinabilityInNumberTheory:LD.1 #1 (more general) |
| `IsAdicComplete.henselianRing` | [mathlib:170](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean#L170) | LogicAndDefinabilityInNumberTheory:LD.1 #1 (more general) |
| `Valued` | [mathlib:124](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Valued/ValuationTopology.lean#L124) | LogicAndDefinabilityInNumberTheory:LD.1 #2 (related) |
| `IsLocalRing.ResidueField` | [mathlib:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean#L30) | LogicAndDefinabilityInNumberTheory:LD.1 #2 (related) |
| `ValuationRing.ValueGroup` | [mathlib:77](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationRing.lean#L77) | LogicAndDefinabilityInNumberTheory:LD.1 #2 (related) |
| `FirstOrder.Language.BoundedFormula.IsQF` | [mathlib:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Complexity.lean#L72) | LogicAndDefinabilityInNumberTheory:LD.1 #4 (related) |
| `FirstOrder.Language.BoundedFormula.realize_toPrenex` | [mathlib:262](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Complexity.lean#L262) | LogicAndDefinabilityInNumberTheory:LD.1 #4 (related) |
| `FirstOrder.Language.presburger.definable_iff_isSemilinearSet` | [mathlib:148](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Arithmetic/Presburger/Definability.lean#L148) | LogicAndDefinabilityInNumberTheory:LD.1 #4 (related) |
| `FirstOrder.Field.ACF_isComplete` | [mathlib:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Field/IsAlgClosed.lean#L165) | LogicAndDefinabilityInNumberTheory:LD.1 #4 (related) |
| `FirstOrder.Field.ACF_zero_realize_iff_infinite_ACF_prime_realize` | [mathlib:223](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Field/IsAlgClosed.lean#L223) | LogicAndDefinabilityInNumberTheory:LD.1 #5 (related); LogicAndDefinabilityInNumberTheory:LD.3 #5 (related) |
| `MeasureTheory.Measure.haarMeasure` | [mathlib:521](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean#L521) | LogicAndDefinabilityInNumberTheory:LD.2 #2 (more general) |
| `PadicInt.compactSpace` | [mathlib:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/ProperSpace.lean#L57) | LogicAndDefinabilityInNumberTheory:LD.2 #2 (related) |
| `MeasureTheory.Measure.haar.index` | [mathlib:94](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Basic.lean#L94) | LogicAndDefinabilityInNumberTheory:LD.2 #2 (related) |
| `TauCeti.AbelianK0` | [tauceti:79](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean#L79) | LogicAndDefinabilityInNumberTheory:LD.3 #1 (related) |
| `FirstOrder.Field.ACF_zero_realize_iff_finite_ACF_prime_not_realize` | [mathlib:236](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/ModelTheory/Algebra/Field/IsAlgClosed.lean#L236) | LogicAndDefinabilityInNumberTheory:LD.3 #5 (related) |
| `ax_grothendieck_of_definable` | [mathlib:200](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/AxGrothendieck.lean#L200) | LogicAndDefinabilityInNumberTheory:LD.3 #5 (related) |
| `REPred` | [mathlib:157](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Computability/RE.lean#L157) | LogicAndDefinabilityInNumberTheory:LD.4 #1 (exact) |
| `ComputablePred` | [mathlib:129](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Computability/RE.lean#L129) | LogicAndDefinabilityInNumberTheory:LD.4 #1 (exact) |
| `ComputablePred.computable_iff_re_compl_re` | [mathlib:225](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Computability/RE.lean#L225) | LogicAndDefinabilityInNumberTheory:LD.4 #1 (exact) |
| `ComputablePred.halting_problem` | [mathlib:65](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Computability/Halting.lean#L65) | LogicAndDefinabilityInNumberTheory:LD.4 #1 (exact); LogicAndDefinabilityInNumberTheory:LD.4 #5 (related) |
| `ComputablePred.rice` | [mathlib:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Computability/Halting.lean#L33) | LogicAndDefinabilityInNumberTheory:LD.4 #1 (related) |
| `Dioph` | [mathlib:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L245) | LogicAndDefinabilityInNumberTheory:LD.4 #2 (exact) |
| `Dioph.DiophFn` | [mathlib:341](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L341) | LogicAndDefinabilityInNumberTheory:LD.4 #2 (exact) |
| `Dioph.inter` | [mathlib:317](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L317) | LogicAndDefinabilityInNumberTheory:LD.4 #2 (exact) |
| `Dioph.ex_dioph` | [mathlib:347](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L347) | LogicAndDefinabilityInNumberTheory:LD.4 #2 (exact) |
| `Dioph.dioph_comp` | [mathlib:476](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L476) | LogicAndDefinabilityInNumberTheory:LD.4 #2 (exact) |
| `Dioph.pow_dioph` | [mathlib:667](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L667) | LogicAndDefinabilityInNumberTheory:LD.4 #3 (exact) |
| `Dioph.pell_dioph` | [mathlib:634](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L634) | LogicAndDefinabilityInNumberTheory:LD.4 #3 (exact) |
| `Dioph.xn_dioph` | [mathlib:659](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Dioph.lean#L659) | LogicAndDefinabilityInNumberTheory:LD.4 #3 (exact) |
| `Pell.eq_pow_of_pell` | [mathlib:860](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/PellMatiyasevic.lean#L860) | LogicAndDefinabilityInNumberTheory:LD.4 #3 (exact) |
| `IsRealClosed` | [mathlib:48](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsRealClosed/Basic.lean#L48) | LogicAndDefinabilityInNumberTheory:LD.6 #1 (related) |
| `Northcott` | [mathlib:36](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Northcott.lean#L36) | LogicAndDefinabilityInNumberTheory:LD.6 #3 (related) |
| `LindemannWeierstrass.exp_polynomial_approx` | [mathlib:157](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Transcendental/Lindemann/AnalyticalPart.lean#L157) | LogicAndDefinabilityInNumberTheory:LD.6 #5 (related) |

## Overlap/ownership ledger

All 112 occurrences below resolve to 91 distinct stage contracts. I read all 88 campaign destinations and the three upstream modular-form stage descriptions. Except the marked owner error, the references can be retained as shared inputs, specialization, consumer interface, or alternative source-specific proof route. Their inclusion in an audit's `duplicates` list does not by itself require deletion of a roadmap or establish accidental duplication. In particular, motivic integration is not Voevodsky motives; dynamical and abelian unlikely-intersection endpoints are not identical theorems; finite and general-rank/derived versions need their own specialization maps.

| Audited stage | Destination | Assessment of the accepted overlap note |
| --- | --- | --- |
| PotentialAutomorphyInfrastructure:PA.0 | ArithmeticLocallySymmetricSpaces:ALS.4 | Retain as scoped overlap/interface: Named supplier: ALS.4 owns boundary and Levi cohomology, whose summand/filtration maps PA.0 re-uses and normalizes; the overlap is by design (requires edge), not accidental duplication. |
| PotentialAutomorphyInfrastructure:PA.0 | AutomorphicGaloisRepresentationsPartII:AG2.7 | Retain as scoped overlap/interface: Named supplier of the integral, residual and reusable arithmetic exports that PA.0's Hecke interface consumes. |
| PotentialAutomorphyInfrastructure:PA.0 | TorsionCohomologyInfrastructure:TC.3 | Retain as scoped overlap/interface: TC.3 owns boundary induction and determinant factor extraction; PA.0's boundary summand/filtration maps overlap with TC.3's boundary induction step (the PA source-to-owner matrix cites TC.3 for §4.2). |
| PotentialAutomorphyInfrastructure:PA.1 | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 | Retain as scoped overlap/interface: Named supplier: R07.3 owns Fontaine-Laffaille theory itself; PA.1 only consumes the classification and lattice comparison. |
| PotentialAutomorphyInfrastructure:PA.1 | IgusaVarietiesAndTorsionConcentration:IG.7 | Retain as scoped overlap/interface: Named supplier of the localized concentration theorem PA.1 combines with the weight filtration. |
| PotentialAutomorphyInfrastructure:PA.1 | CohomologyComparisons:CP.5 | Retain as scoped overlap/interface: CP.5 states integral torsion inequalities and lattice recovery with a Fontaine-Laffaille input; the lattice-comparison target overlaps PA.1's use of R07.3. |
| PotentialAutomorphyInfrastructure:PA.1 | PadicHodgeTheory:R06.4 | Retain as scoped overlap/interface: R06.4 is the integral and small-weight interface to p-adic Hodge theory; it states the same weight-interval and unramified-base inequalities PA.1 is told to retain. |
| PotentialAutomorphyInfrastructure:PA.2 | PadicFamilies:L0a | Retain as scoped overlap/interface: Named supplier: L0a owns the finite and profinite ordinary projectors; PA.2 consumes the projector and owns only the arithmetic tower it is applied to. |
| PotentialAutomorphyInfrastructure:PA.2 | IgusaVarietiesAndTorsionConcentration:IG.7 | Retain as scoped overlap/interface: Named supplier of the concentration theorem, imported independently of PA.1's use. |
| PotentialAutomorphyInfrastructure:PA.2 | OrdinaryAutomorphicFormsAndModularityLifting:R21.1 | Retain as scoped overlap/interface: R21.1 applies the ordinary projector to the modular/Hilbert/quaternionic Hecke complexes and proves the maps of the deformation problem preserve the ordinary image; that is the rank-2 instance of PA.2's construction, and the roadmap itself flags it as a comparison case. |
| PotentialAutomorphyInfrastructure:PA.2 | ExcursionOperatorsAndSpectralAction:ES7:parabolic | Retain as scoped overlap/interface: Also states stratum maps and parabolic induction, but for the Bernstein-stratum/GL_n comparison rather than for ordinary parts in equal characteristic. |
| PotentialAutomorphyInfrastructure:PA.3 | DeformationAndDerivedPatchingAlgebra:P9 | Retain as scoped overlap/interface: Named supplier: P9 owns amplitude, depth and component support for patched complexes; PA.3 supplies the arithmetic instance and the change-of-condition comparison. |
| PotentialAutomorphyInfrastructure:PA.3 | DeformationAndDerivedPatchingAlgebra:P8 | Retain as scoped overlap/interface: P8 owns patching complexes with cohomology in several degrees, the abstract form of the object PA.3 compares. |
| PotentialAutomorphyInfrastructure:PA.3 | ModularCurvesPartII:R14.4 | Retain as scoped overlap/interface: States Ihara and level-change statements in the GL(2)/modular-curve case; PA.3's derived Ihara avoidance is the general-rank derived replacement for that classical argument. |
| PotentialAutomorphyInfrastructure:PA.4 | GlobalGaloisDeformations:R04.5 | Retain as scoped overlap/interface: R04.5 is titled 'Taylor-Wiles auxiliary primes'; it is the general owner of the auxiliary-prime construction PA.4 instantiates for the CM/unitary tower. |
| PotentialAutomorphyInfrastructure:PA.4 | DeformationAndDerivedPatchingAlgebra:P8 | Retain as scoped overlap/interface: Owns the abstract ultrapatching construction and its support statements; PA.4 verifies the arithmetic tower satisfies its hypotheses. |
| PotentialAutomorphyInfrastructure:PA.4 | GL2ModularityLifting:R22.2 | Retain as scoped overlap/interface: Auxiliary levels and freeness: the rank-2 instance of the same auxiliary-prime bookkeeping. |
| PotentialAutomorphyInfrastructure:PA.4 | ModularCurvesPartII:R14.6 | Retain as scoped overlap/interface: Bad-prime and patching interfaces for modular curves, overlapping PA.4's local framed data at auxiliary places. |
| PotentialAutomorphyInfrastructure:PA.5 | PotentialModularityAndCompatibleSystems:R24.5:operations | Retain as scoped overlap/interface: Named supplier: PA.5 explicitly imports the general operation interface from R24.5:operations and adds only the general-rank checklist; the two state the same operation lemmas. |
| PotentialAutomorphyInfrastructure:PA.5 | AutomorphicGaloisRepresentationsPartII:AG2.6 | Retain as scoped overlap/interface: Coefficient-prime comparison and compatible systems: states the same Frobenius-polynomial and Hodge-Tate compatibilities from the automorphic side. |
| PotentialAutomorphyInfrastructure:PA.5 | ModularityAndLanglandsExtensions:ML.3 | Retain as scoped overlap/interface: Downstream consumer: symmetric powers and Sato-Tate; PA.5 must not assume the automorphy of symmetric powers that ML.3 proves. |
| PotentialModularityAndCompatibleSystems:R23.1 | PotentialModularityAndCompatibleSystems:R24.5:operations | Retain as scoped overlap/interface: The 'general arithmetic-point' half of R24.5:operations restates R23.1 as the general Moret-Bailly/Skolem theorem for an arbitrary smooth geometrically irreducible variety; the two layers state the same theorem, with R23.1 the milestone and the operations layer the generalisation note. |
| PotentialModularityAndCompatibleSystems:R23.1 | HilbertModularVarietiesAndShimuraCurves:H6 | Retain as scoped overlap/interface: H6 owns the twisted torsion moduli and arithmetic points to which R23.1 is applied; it repeats the point-existence conclusion in the moduli case. |
| PotentialModularityAndCompatibleSystems:R23.1 | AlgebraicModuliForArithmeticGeometry:R09.3 | Retain as scoped overlap/interface: Named dependency supplying the geometric/moduli prerequisites of the theorem. |
| PotentialModularityAndCompatibleSystems:R23.2 | HilbertModularVarietiesAndShimuraCurves:H6 | Retain as scoped overlap/interface: Named supplier: H6 owns the twisted torsion moduli and their arithmetic points; R23.2 states the same construction with the specific pairing/determinant compatibilities its application needs. |
| PotentialModularityAndCompatibleSystems:R23.2 | AbelianSchemesAndArithmeticModuli:A4 | Retain as scoped overlap/interface: Degree-one realizations and deformation theory of abelian schemes; overlaps the polarisation-and-torsion moduli problem. |
| PotentialModularityAndCompatibleSystems:R23.2 | PELModuli:M2 | Retain as scoped overlap/interface: Representability and smoothness at good level for PEL moduli — the same class of moduli problem in greater generality. |
| PotentialModularityAndCompatibleSystems:R23.3 | GL2AutomorphicRepresentationsAndTransfer:R17.5 | Retain as scoped overlap/interface: Named dependency: supplies the solvable Artin and base-change inputs the transfer of modularity uses. |
| PotentialModularityAndCompatibleSystems:R23.3 | ClassicalSerreModularity:R27.1 | Retain as scoped overlap/interface: Good-dihedral representations and auxiliary primes; uses the same potential-residual-modularity input in the Serre-conjecture proof. |
| PotentialModularityAndCompatibleSystems:R23.3 | SmallRamificationAndAbelianVarietyBaseCases:R25.5 | Retain as scoped overlap/interface: GL2-type and ordinary terminal cases restate the auxiliary-abelian-variety route in the base cases. |
| PotentialModularityAndCompatibleSystems:R23.4 | GL2ModularityLifting:R22.6 | Retain as scoped overlap/interface: Named dependency: the modularity-lifting theorem R23.4 applies; the two layers share the conclusion 'this lift is modular'. |
| PotentialModularityAndCompatibleSystems:R23.4 | OrdinaryAutomorphicFormsAndModularityLifting:R21.6 | Retain as scoped overlap/interface: Named dependency for the ordinary branch of the same lifting statement. |
| PotentialModularityAndCompatibleSystems:R23.4 | ClassicalSerreModularity:R33.1 | Retain as scoped overlap/interface: Qualitative target and first weight change uses potential modularity of a given lift as an input. |
| PotentialModularityAndCompatibleSystems:R23.5 | GL2AutomorphicRepresentationsAndTransfer:R17.4 | Retain as scoped overlap/interface: Cyclic and solvable base change: owns the base-change/descent statements R23.5 invokes. |
| PotentialModularityAndCompatibleSystems:R23.5 | PotentialModularityAndCompatibleSystems:R24.5 | Retain as scoped overlap/interface: R24.5 also uses solvable base change and descent to build a system over the original field; R23.5 supplies the controlled extension it descends along. |
| PotentialModularityAndCompatibleSystems:R23.6 | HilbertModularVarietiesAndShimuraCurves:R18.6 | Retain as scoped overlap/interface: The geometric outputs used by modularity: the same export-and-noncircularity discipline for the geometric side. |
| PotentialModularityAndCompatibleSystems:R23.6 | GlobalGaloisDeformations:R04.6 | Retain as scoped overlap/interface: Arithmetic exports for patching and global lifts — the corresponding export layer on the deformation side. |
| PotentialModularityAndCompatibleSystems:R24.1 | DeformationAndDerivedPatchingAlgebra:R03.4 | Retain as scoped overlap/interface: Finiteness and characteristic-zero points: the abstract owner of the finiteness statement R24.1 proves in the KW setting. |
| PotentialModularityAndCompatibleSystems:R24.1 | GlobalGaloisDeformations:R04.6 | Retain as scoped overlap/interface: Named dependency: arithmetic exports for patching and global lifts, including the presentation used for finiteness. |
| PotentialModularityAndCompatibleSystems:R24.1 | LocalGaloisDeformationRings:R08.6 | Retain as scoped overlap/interface: Named dependency supplying the local conditions whose deformation rings enter the global finiteness comparison. |
| PotentialModularityAndCompatibleSystems:R24.2 | DeformationAndDerivedPatchingAlgebra:R03.4 | Retain as scoped overlap/interface: Finiteness and characteristic-zero points: states the same finiteness-plus-dimension implies-a-point argument abstractly. |
| PotentialModularityAndCompatibleSystems:R24.2 | GlobalGaloisDeformations:R04.6 | Retain as scoped overlap/interface: Owns the global presentation and its lower bound, which R24.2 combines with finiteness. |
| PotentialModularityAndCompatibleSystems:R24.3 | LocalGaloisDeformationRings:R08.3 | Retain as scoped overlap/interface: Potentially semistable deformation spaces: owns the local rings whose complete-intersection and flatness properties Böckle's Proposition 1 assumes. |
| PotentialModularityAndCompatibleSystems:R24.3 | ClassicalSerreModularity:R26.2 | Retain as scoped overlap/interface: Prescribed lifts in conductor one: the same KW I Theorem 5.1 lift constructions, specialised. |
| PotentialModularityAndCompatibleSystems:R24.3 | GlobalGaloisDeformations:R04.6 | Retain as scoped overlap/interface: Supplies the presentation that R24.3 says must precede the application. |
| PotentialModularityAndCompatibleSystems:R24.4 | GL2ModularityLifting:R32.1 | Retain as scoped overlap/interface: Exact statement table for modularity lifting: the same theorem statements, collected for the modern route. |
| PotentialModularityAndCompatibleSystems:R24.4 | GL2ModularityLifting:R22.5 | Retain as scoped overlap/interface: Odd-prime modularity lifting: the odd-p half of R24.4's interface. |
| PotentialModularityAndCompatibleSystems:R24.4 | GL2AutomorphicRepresentationsAndTransfer:R17.6 | Retain as scoped overlap/interface: Characteristic-two soluble cases and transfer interfaces: the complementary p=2 solvable case. |
| PotentialModularityAndCompatibleSystems:R24.5 | PotentialModularityAndCompatibleSystems:R24.5:operations | Retain as scoped overlap/interface: The operations sublayer builds the general system interface R24.5's existence theorem populates; the two share the Frobenius-polynomial and purity conditions. |
| PotentialModularityAndCompatibleSystems:R24.5 | AutomorphicGaloisRepresentations:R19.3 | Retain as scoped overlap/interface: Purity and compatible systems: states the same purity and Frobenius-polynomial conditions from the automorphic side. |
| PotentialModularityAndCompatibleSystems:R24.5 | AutomorphicGaloisRepresentationsPartII:AG2.6 | Retain as scoped overlap/interface: Coefficient-prime comparison and compatible systems, in higher rank. |
| PotentialModularityAndCompatibleSystems:R24.5:operations | PotentialAutomorphyInfrastructure:PA.5 | Retain as scoped overlap/interface: PA.5 explicitly consumes this operation interface and restates the same comparison lemmas for restriction, tensor, dual, character and symmetric power. |
| PotentialModularityAndCompatibleSystems:R24.5:operations | PotentialModularityAndCompatibleSystems:R23.1 | Retain as scoped overlap/interface: The arithmetic-point half of this layer is R23.1's Moret-Bailly theorem, stated for a general variety instead of the Hilbert torsion moduli. |
| PotentialModularityAndCompatibleSystems:R24.5:operations | ArithmeticGaloisRepresentations:G7 | Retain as scoped overlap/interface: Named import: dimension-general arithmetic API for the actual representation operations and recognition. |
| PotentialModularityAndCompatibleSystems:R24.5:operations | PadicHodgeTheory:R06.2 | Retain as scoped overlap/interface: Named import for Hodge-Tate and local monodromy compatibility; R06.2's period functors and admissibility state those compatibilities. |
| PotentialModularityAndCompatibleSystems:R24.6 | ClassicalSerreModularity:R33.1 | Retain as scoped overlap/interface: Qualitative target and first weight change: the same change-of-prime specialisation lemmas drive the Serre-conjecture induction. |
| PotentialModularityAndCompatibleSystems:R24.6 | ClassicalSerreModularity:R27.4 | Retain as scoped overlap/interface: Removing the good-dihedral condition uses the same change-of-residual-characteristic step. |
| PotentialModularityAndCompatibleSystems:R24.6 | PadicLocalLanglandsForGL2Qp:R30.2 | Retain as scoped overlap/interface: The local representation categories state the local compatibility that R24.6 must preserve across primes. |
| SerreWeightAndLevelOptimisation:R20.1 | tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms | Retain as scoped overlap/interface: This Tau Ceti library roadmap layer owns the Petersson product and the oldform/newform subspaces; it is already built, and it supplies the characteristic-zero half of R20.1's old/new sequences. |
| SerreWeightAndLevelOptimisation:R20.1 | tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor | Retain as scoped overlap/interface: Owns eigenforms, newforms and the conductor — the eigensystem bookkeeping R20.1 restates in integral form; also already built in Tau Ceti. |
| SerreWeightAndLevelOptimisation:R20.1 | ModularCurvesPartII:R14.4 | Retain as scoped overlap/interface: Ihara and level-change statements: the same degeneracy-map level-change algebra, on the cohomology of modular curves. |
| SerreWeightAndLevelOptimisation:R20.1 | AutomorphicCongruences:L0 | Correct owner claim: finding /4. |
| SerreWeightAndLevelOptimisation:R20.2 | ModularCurvesPartII:R13.5 | Retain as scoped overlap/interface: Bad fibres and regular/semistable models: owns the geometric input R20.2 is required to use. |
| SerreWeightAndLevelOptimisation:R20.2 | NeronModelsAndSemistableAbelianVarieties:R11.6 | Retain as scoped overlap/interface: Interfaces for modularity and finiteness: supplies the component/character groups of the bad fibres. |
| SerreWeightAndLevelOptimisation:R20.2 | HilbertModularVarietiesAndShimuraCurves:R18.5 | Retain as scoped overlap/interface: Bad-prime uniformisation: the quaternionic counterpart of the same level-lowering geometry. |
| SerreWeightAndLevelOptimisation:R20.3 | AlgebraicModularFormsAndSerreWeights:R15.4 | Retain as scoped overlap/interface: Serre's local weight recipe: owns the recipe R20.3 proves the theorem for. |
| SerreWeightAndLevelOptimisation:R20.3 | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5 | Retain as scoped overlap/interface: Local residual types and Serre weights: states the same local finite-flat/extension classification. |
| SerreWeightAndLevelOptimisation:R20.3 | ClassicalSerreModularity:R26.6 | Retain as scoped overlap/interface: Level-one theorem and KW's initial case: consumes the same weight optimisation at p. |
| SerreWeightAndLevelOptimisation:R20.4 | EllipticCurveModularity:R29.2 | Retain as scoped overlap/interface: Residual Serre witnesses at bounded level: the consumer of R20.4's character specialisation. |
| SerreWeightAndLevelOptimisation:R20.4 | tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus | Retain as scoped overlap/interface: Owns the nebentypus/diamond-operator theory R20.4 needs to control; already built in Tau Ceti over ℂ. |
| SerreWeightAndLevelOptimisation:R20.5 | ClassicalSerreModularity:R27.4 | Retain as scoped overlap/interface: Removing the good-dihedral condition: handles neighbouring dyadic exceptional cases of the same induction. |
| SerreWeightAndLevelOptimisation:R20.5 | SerreWeightAndLevelOptimisation:R20.2 | Retain as scoped overlap/interface: R20.2 owns the odd-prime level-lowering statements that R20.5 says do not cover the dyadic cases; the two layers partition the same theorem list. |
| SerreWeightAndLevelOptimisation:R20.6 | ClassicalSerreModularity:R26.1 | Retain as scoped overlap/interface: Statement and exact source decomposition: the companion export/statement-table layer for the Serre conjecture proper. |
| SerreWeightAndLevelOptimisation:R20.6 | EllipticCurveModularity:R29.2 | Retain as scoped overlap/interface: Consumes exactly the bounded-level weight-two trivial-character export this layer packages. |
| TorsionCohomologyInfrastructure:TC.0 | AdicSpacesPartII:F0 | Retain as scoped overlap/interface: Named supplier: owns formal geometry and the gluing of compatible formal models from admissible affinoid covers, which is the missing third description in TC.0's comparison. |
| TorsionCohomologyInfrastructure:TC.0 | PerfectoidSpaces:P0 | Retain as scoped overlap/interface: Almost mathematics with a reusable base ideal: owns the almost-module theory TC.0's last target consumes. |
| TorsionCohomologyInfrastructure:TC.0 | PerfectoidSpaces:P3 | Retain as scoped overlap/interface: Almost purity and étale tilting: states the almost acyclicity/almost purity input on affinoid perfectoids. |
| TorsionCohomologyInfrastructure:TC.0 | ClassicalAdicEtaleCohomology:H1 | Retain as scoped overlap/interface: Formal models, specialization, and nearby-cycle comparison — the same formal-model transport, for a different application. |
| TorsionCohomologyInfrastructure:TC.1 | PerfectoidShimuraVarieties:S3 | Retain as scoped overlap/interface: Named supplier: Hodge-type period map and coefficients — owns the period map TC.1 pulls back along. |
| TorsionCohomologyInfrastructure:TC.1 | AutomorphicBundles:B4 | Retain as scoped overlap/interface: Classical forms and explicit weights: owns the automorphic bundles whose lattices TC.1 compares. |
| TorsionCohomologyInfrastructure:TC.1 | HodgeTateAndCanonicalSubgroups:T6 | Retain as scoped overlap/interface: General canonical local systems and logarithmic comparison: supplies the anticanonical tower and controlled integral sheaves TC.1 works over. |
| TorsionCohomologyInfrastructure:TC.2 | CompletedCohomologyPartII:CC.2 | Retain as scoped overlap/interface: Named import: completion, derived inverse limits and topology — owns the derived-limit bounds TC.2 uses. |
| TorsionCohomologyInfrastructure:TC.2 | CompletedCohomologyPartII:CC.1 | Retain as scoped overlap/interface: Named import: torsion colimits and the smooth group action, the finite-level torsion side of the diagram. |
| TorsionCohomologyInfrastructure:TC.2 | CompletedCohomologyPartII:CC.8 | Retain as scoped overlap/interface: Named import: Shimura, Galois and Hecke adapters — the tower adapter TC.2 compares with automorphic sections. |
| TorsionCohomologyInfrastructure:TC.2 | IntegralHeckeAndGaloisDeterminants:IHG.5 | Retain as scoped overlap/interface: Nilpotent descent and specialization: owns the quantified nilpotent error TC.2 exports. |
| TorsionCohomologyInfrastructure:TC.3 | IntegralHeckeAndGaloisDeterminants:IHG.3 | Retain as scoped overlap/interface: Integral spherical normalization: owns the Satake normalization TC.3 calculates through. |
| TorsionCohomologyInfrastructure:TC.3 | ArithmeticLocallySymmetricSpaces:ALS.4 | Retain as scoped overlap/interface: Boundary and Levi cohomology: owns the boundary strata and induced Hecke actions TC.3's fibration uses. |
| TorsionCohomologyInfrastructure:TC.3 | PotentialAutomorphyInfrastructure:PA.0 | Retain as scoped overlap/interface: PA.0's boundary summand/filtration maps for the unitary boundary argument overlap TC.3's boundary induction; the PA source-to-owner matrix cites TC.3 for exactly this. |
| TorsionCohomologyInfrastructure:TC.4 | IntegralHeckeAndGaloisDeterminants:IHG.6 | Retain as scoped overlap/interface: Integral Ribet theory without residual distinctness: the same integral Hecke/determinant compatibility, in the application direction. |
| TorsionCohomologyInfrastructure:TC.4 | CompletedCohomologyPartII:CC.6 | Retain as scoped overlap/interface: Descent and classical comparison: states the corresponding finite-level comparison for completed cohomology. |
| LogicAndDefinabilityInNumberTheory:LD.0 | PotentialAutomorphyInfrastructure:PA.4 | Retain as scoped overlap/interface: Also fixes a nonprincipal ultrafilter and builds an ultraproduct, but of a system of finite-level complexes for Taylor-Wiles ultrapatching rather than of first-order structures; it needs the ultrafilter/ultralimit vocabulary this layer exports. |
| LogicAndDefinabilityInNumberTheory:LD.0 | DeformationAndDerivedPatchingAlgebra:P8 | Retain as scoped overlap/interface: The abstract ultrapatching construction for complexes with cohomology in several degrees; same ultrafilter and ultraproduct infrastructure, different category of objects. |
| LogicAndDefinabilityInNumberTheory:LD.0 | LogicAndDefinabilityInNumberTheory:LD.4 | Retain as scoped overlap/interface: LD.4 restates the definable-set and interpretation apparatus for Diophantine sets, and its 'each transfer needs its own interpretation theorem' clause is the interpretation target of this layer. |
| LogicAndDefinabilityInNumberTheory:LD.1 | ClassicalAdicEtaleCohomology:H1:henselian | Retain as scoped overlap/interface: Constructs affinoid henselisations and henselian pairs with their approximation theorems; the same henselianity input, developed for adic spaces rather than for valued-field logic. |
| LogicAndDefinabilityInNumberTheory:LD.1 | KTheoryFiniteLocalFields:L.2 | Retain as scoped overlap/interface: Works with henselian DVRs and henselian pairs away from the residue characteristic; overlaps only the henselianity target, not the elimination theory. |
| LogicAndDefinabilityInNumberTheory:LD.1 | LogicAndDefinabilityInNumberTheory:LD.2 | Retain as scoped overlap/interface: LD.2's definable cells are the output of the cell decomposition this layer is asked to prove; the two layers state the same Denef-Pas theorem from opposite sides. |
| LogicAndDefinabilityInNumberTheory:LD.2 | AnalyticNumberTheory:AN.8 | Retain as scoped overlap/interface: Builds prehomogeneous-vector-space zeta integrals and p-adic local densities and says explicitly that it imports Igusa/motivic local methods via LD.3; the local Igusa integrals are the same objects. |
| LogicAndDefinabilityInNumberTheory:LD.2 | ExponentialSumsAndCircleMethod:ES.3 | Retain as scoped overlap/interface: Constructs p-adic local densities and singular series with Haar-measure normalisation; overlaps this layer's p-adic measure target for the special case of counting solutions of a form. |
| LogicAndDefinabilityInNumberTheory:LD.2 | SieveMethodsAndPrimePatterns:SV.0 | Retain as scoped overlap/interface: Defines multiplicative local densities; a much weaker, purely elementary version of the local-density target that LD.2/LD.5 export. |
| LogicAndDefinabilityInNumberTheory:LD.2 | LogicAndDefinabilityInNumberTheory:LD.1 | Retain as scoped overlap/interface: The cell decomposition that produces these cells is stated as a target of LD.1 (Denef-Pas route). |
| LogicAndDefinabilityInNumberTheory:LD.3 | MotivesAndAlgebraicCycles:MC.4 | Retain as scoped overlap/interface: Builds Voevodsky-style geometric mixed motives and motivic cohomology; the layer's own text says to coordinate geometric realizations with motives rather than identify the two Grothendieck rings, so the overlap is deliberate but real at the level of the motivic target category. |
| LogicAndDefinabilityInNumberTheory:LD.3 | AnalyticNumberTheory:AN.8 | Retain as scoped overlap/interface: Declared consumer of LD.3: it imports Igusa/motivic local methods for prehomogeneous zeta integrals, so the local-factor rationality statements are shared. |
| LogicAndDefinabilityInNumberTheory:LD.3 | LogicAndDefinabilityInNumberTheory:LD.2 | Retain as scoped overlap/interface: The p-adic side of the same specialization statement; LD.2's Igusa rationality is the specialization of LD.3's motivic rationality. |
| LogicAndDefinabilityInNumberTheory:LD.4 | ClassicalArithmeticCompletion:CA.4 | Retain as scoped overlap/interface: Declared input; it supplies Pell equations and elementary descent, which is precisely the PellMatiyasevic material the Diophantine-exponentiation target already uses in Mathlib. |
| LogicAndDefinabilityInNumberTheory:LD.4 | ComputationalNumberTheory:CN.0 | Retain as scoped overlap/interface: Fixes computable presentations, bit complexity and randomness models; overlaps the recursive/computable-function target but from the algorithmic rather than the undecidability side. |
| LogicAndDefinabilityInNumberTheory:LD.4 | LogicAndDefinabilityInNumberTheory:LD.0 | Retain as scoped overlap/interface: The 'each transfer needs its own interpretation theorem' clause here is the interpretation target stated in LD.0. |
| LogicAndDefinabilityInNumberTheory:LD.5 | AnalyticNumberTheory:AN.8 | Retain as scoped overlap/interface: Consumes LD.3 for local densities and Igusa/motivic local methods; the arithmetic-statistics interface this layer exports is the same handoff seen from the consumer side. |
| LogicAndDefinabilityInNumberTheory:LD.5 | ComputationalNumberTheory:CN.0 | Retain as scoped overlap/interface: States the algorithm/complexity model that this layer's 'certified algorithms for special families' would have to be expressed in. |
| LogicAndDefinabilityInNumberTheory:LD.6 | DiophantineApproximationAndTranscendence:DT.5 | Retain as scoped overlap/interface: States 'source-scoped functional-transcendence applications' and says it coordinates unlikely intersections with RP; the Ax-Lindemann/Ax-Schanuel and unlikely-intersection targets are the same theorems. |
| LogicAndDefinabilityInNumberTheory:LD.6 | HeightsRationalPointsAndObstructions:RP.5 | Retain as scoped overlap/interface: Develops the Mordell-Lang and Manin-Mumford proof routes for subvarieties of abelian varieties; this layer would prove the Manin-Mumford case again by the Pila-Zannier method. |
| LogicAndDefinabilityInNumberTheory:LD.6 | ArithmeticDynamics:DY.6 | Retain as scoped overlap/interface: States proven dynamical Mordell-Lang and unlikely-intersection cases as source-bound endpoints; the same family of statements in the dynamical setting. |
| LogicAndDefinabilityInNumberTheory:LD.6 | LogicAndDefinabilityInNumberTheory:LD.0 | Retain as scoped overlap/interface: Declared input: the definable-set apparatus this layer's counting statements quantify over is LD.0's, and it is already in Mathlib. |

## Validation and handoff

`python3 scripts/check_redteam.py RT-AUDIT-34.result.json` passed. Independent count/index/source checks returned 5 roadmaps, 37 layers, 178 targets, 197 citation occurrences, 166 distinct declarations, 113 files and 112 overlap occurrences, with the single explained index omission and no lexical proof placeholders. All duplicate destinations resolved. The result JSON and this report enumerate the same four findings. No audited source, roadmap, library or accepted review was edited.

Next action is independent verification of findings /1–/4 at the pinned locators, followed by a separate fix job only for confirmed findings. No additional audit work is left as a checkpoint.
