# REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic

Verdict: **accepted after repairs**. Reviewer: Codex — codex-a71f92.
Date: 2026-09-23. Issue: #85. This accepts the repaired link/overlap packet,
not all theorem statements in the upstream roadmaps.

## Independence, claim and scope

The original partial packet was submitted in #550 by ChatGPT Pro
(cgp-866dc6aebdcc); the completed packet records Claude local (claude6/2),
including completion commit f66d8b51f39c9bd281d7368a0261610515a8a04e.
Neither is this reviewer. Claim comment 5798482896 was confirmed by bot
comment 5798485589; the whole issue was reread before work.

Review base: `505932860029f1aff21179b16fe289cd57c1da68`.
Publication base: `cca5940641794771337b3eaa6e4be2b4df0b51c3`.
Read the entire NFA document (all eight layers, contracts and exclusions),
the whole original packet/handoff, all original endpoint stage descriptions,
all ten overlap endpoints, and all eight NFA entries of the reviewed AUDIT04
library audit. The previously read complete LocalFieldsRamification document
was checked byte-for-byte unchanged before reusing those reads. Current LV.7,
LV.11, KTheoryFiniteLocalFields L.7 and SelmerIwasawaCohomology L2 were read
in full for additions.

All 60 original links are accounted for below. Final packet: **61 links**
(18 explicit, 43 inferred), **10 overlaps**, 212 historical examined entries.
Four links removed, five added; the existing NFA5 -> LV.6 pair was repaired.
Nine one-sided naming claims changed from explicit to inferred. The original
author's catalogue-wide screen is preserved as historical provenance; this
review does not turn its 212-roadmap ledger into a claim to have independently
reread every current roadmap. It checks all eight focal stages for completeness
against the current 2007-stage catalogue.

No external books or papers were reread for a full proof audit. The review
does not claim Lean compilation or formalization.

## Every original link

Indices refer to the unmodified input, so removals do not renumber this ledger.

| # | Supplier -> consumer | Decision and scope |
|---|---|---|
| 1 | EffectiveBounds 1 -> NumberFieldArithmetic 3 | Reuse the exact landed index equation, not a deduction of equality from an inequality; one-sided naming becomes inferred. |
| 2 | EffectiveBounds 1 -> NumberFieldArithmetic 8 | Class-number bound/source for coverage only; no class-number algorithm. One-sided naming becomes inferred. |
| 3 | LocalFieldsRamification 0 -> NumberFieldArithmetic 5 | Canonical global completion adapters consume intrinsic local finite extensions, not the reverse. |
| 4 | LocalFieldsRamification 0 -> NumberFieldArithmetic 6 | Local natCastValuation needs a separate global multiplicity bridge. |
| 5 | LocalFieldsRamification 2 -> NumberFieldArithmetic 5 | Only the unramified local-Frobenius branch is available; ramified primes give cosets. |
| 6 | LocalFieldsRamification 3 -> NumberFieldArithmetic 5 | Integral ring monogenicity, not merely a primitive element of the field. |
| 7 | LocalFieldsRamification 3 -> NumberFieldArithmetic 6 | Hilbert needs Galois; tame/wild bounds need their separability and characteristic hypotheses. |
| 8 | NumberFieldArithmetic 2 -> AnalyticNumberTheory:AN.4 | Ramified Artin factors act on inertia invariants, not the full representation. |
| 9 | NumberFieldArithmetic 2 -> ArithmeticGaloisRepresentations:R01.5 | Finite residual quotient Frobenius; no canonical absolute-Galois lift. |
| 10 | NumberFieldArithmetic 2 -> ClassicalArithmeticCompletion:CA.5 | Arithmetic quadratic/cyclotomic Frobenius input only. |
| 11 | NumberFieldArithmetic 3 -> ClassicalArithmeticCompletion:CA.5 | Index/factorization criteria support certificates, not an algorithm for free. |
| 12 | NumberFieldArithmetic 4 -> ClassicalArithmeticCompletion:CA.5 | Relative ideal discriminant and ramified support; reuse landed generic theory. |
| 13 | NumberFieldArithmetic 7 -> ClassicalArithmeticCompletion:CA.5 | Rank-one unit criterion; polynomial elimination also needs prime field degree. |
| 14 | NumberFieldArithmetic 2 -> ComplexMultiplicationAndExplicitReciprocity:CM.3 | Finite abelian Frobenius over the CM base; reciprocity supplies its action on j. |
| 15 | NumberFieldArithmetic 3 -> ComputationalNumberTheory:CN.2 | Conductor-avoiding Dedekind–Kummer and exact index formula; no unsupported full criterion claim. |
| 16 | NumberFieldArithmetic 7 -> ComputationalNumberTheory:CN.2 | Rank-one unit certificate only; prime degree for polynomial certificate. |
| 17 | NumberFieldArithmetic 2 -> FoundationsAndLibraryIntegration:LI.4 | REMOVE: retired integration process stage. |
| 18 | NumberFieldArithmetic 2 -> HeegnerPointEulerSystems:HE.0 | Ring class field need not be CM; retain place-dependent conjugation. Inferred. |
| 19 | NumberFieldArithmetic 1 -> IntegralIwasawaTheory:L1 | Finite-level unramified composita, not inverse-limit construction. Inferred. |
| 20 | NumberFieldArithmetic 2 -> MordellLawrenceVenkatesh:LV.1 | REMOVE: old complex-conjugation construction absent from current LV.1. |
| 21 | NumberFieldArithmetic 2 -> MordellLawrenceVenkatesh:LV.10 | REMOVE: arithmetic moved from current monodromy LV.10 to LV.11. |
| 22 | NumberFieldArithmetic 5 -> MordellLawrenceVenkatesh:LV.1 | Degree coefficients supplied; Hodge-weight average not proved by degree sum. |
| 23 | NumberFieldArithmetic 5 -> MordellLawrenceVenkatesh:LV.5 | REMOVE: topology LV.5 no longer owns S-unit reductions. |
| 24 | NumberFieldArithmetic 5 -> MordellLawrenceVenkatesh:LV.6 | REPAIR: current LV.6 uses inert Kummer completion; old size-criterion use moves to LV.7. |
| 25 | NumberFieldArithmetic 2 -> ShimuraVarieties:V5 | Finite abelian Artin prime values; reciprocity remains the consumer's. |
| 26 | NumberFieldArithmetic 5 -> SmallRamificationAndAbelianVarietyBaseCases:R25.1 | Residue-degree-weighted local-to-global discriminant; sharp finite-flat bounds separate. |
| 27 | NumberFieldArithmetic 1 -> Chebotarev 1 | Complete splitting iff trivial decomposition, with Galois hypotheses. |
| 28 | NumberFieldArithmetic 1 -> Chebotarev 10 | Non-Galois total splitting via Galois closure; no general class attached canonically. |
| 29 | NumberFieldArithmetic 1 -> Chebotarev 7 | Compositum unramifiedness supports finite exceptional sets. |
| 30 | NumberFieldArithmetic 1 -> Chebotarev 8 | Double-coset orbits; consumer retains exact centralizer/cardinality argument. |
| 31 | NumberFieldArithmetic 2 -> Chebotarev 1 | Normal top restriction unpowered; raising base uses prime-relative residue-degree power. |
| 32 | NumberFieldArithmetic 2 -> Chebotarev 11 | Prime-power Artin coefficients only at unramified primes. |
| 33 | NumberFieldArithmetic 2 -> Chebotarev 12 | Normal top-field projection is unpowered; keep zeta-residue source caveat below. |
| 34 | NumberFieldArithmetic 2 -> Chebotarev 13 | Prime-counting function uses canonical Artin classes. |
| 35 | NumberFieldArithmetic 2 -> Chebotarev 2 | Artin fibres import the supplied carrier; no new Frobenius definition. |
| 36 | NumberFieldArithmetic 2 -> Chebotarev 4 | Abelian character weight consumes Artin; generic root action is already landed. |
| 37 | NumberFieldArithmetic 2 -> Chebotarev 6 | Rational p mod n, never inverse; generic root action also landed. |
| 38 | NumberFieldArithmetic 2 -> Chebotarev 7 | Distinguish normal top projection from fixed-field base change. |
| 39 | NumberFieldArithmetic 2 -> Chebotarev 8 | One fixed top prime in a possibly nonnormal intermediate field; discard base ramification. |
| 40 | NumberFieldArithmetic 4 -> Chebotarev 2 | Already-landed ramifiedSupport; compare base-prime carriers. |
| 41 | NumberFieldArithmetic 2 -> ClassFieldTheory 11 | Ideal Artin map without reciprocity; finite prime values and real-place conjugation. |
| 42 | NumberFieldArithmetic 4 -> ClassFieldTheory 13 | Reuse TauCeti.relDiscr; conductor formula remains CFT. |
| 43 | NumberFieldArithmetic 5 -> ClassFieldTheory 10 | Canonical local-field instance is already landed; global Brauer theorem is separate. |
| 44 | NumberFieldArithmetic 5 -> ClassFieldTheory 11 | Completion/decomposition comparison, not reciprocity or archimedean maps. |
| 45 | NumberFieldArithmetic 5 -> ClassFieldTheory 12 | Normalized q^(-v) absolute value/product formula, not extension-isometry normalization. |
| 46 | NumberFieldArithmetic 5 -> ClassFieldTheory 13 | Semilocal norm is a product over all completions; restricted-product assembly stays CFT. |
| 47 | NumberFieldArithmetic 5 -> ClassFieldTheory 14 | Local Hilbert symbol evaluated at canonical finite completion. |
| 48 | NumberFieldArithmetic 5 -> EllipticCurves 7 | Finite-level completion/conjugation square; profinite passage stays elliptic/Selmer. |
| 49 | NumberFieldArithmetic 2 -> GlobalNumberFields 10 | Arithmetic p mod n; no conductor/reciprocity supplied by this calculation. |
| 50 | NumberFieldArithmetic 2 -> GlobalNumberFields 2 | idealsAway carrier only, not Artin/reciprocity needed to define ray classes. |
| 51 | NumberFieldArithmetic 2 -> GlobalNumberFields 4 | Finite idele valuation lands in supplied carrier; kernel/equivalence stays GNF. |
| 52 | NumberFieldArithmetic 5 -> GlobalNumberFields 0 | Canonical finite completion structure, not archimedean/global assembly. |
| 53 | NumberFieldArithmetic 5 -> GlobalNumberFields 1 | Finite factors for weak approximation; no reverse use of new global approximation. |
| 54 | NumberFieldArithmetic 5 -> GlobalNumberFields 8 | Algebraic component norm formulas, not topological restricted-product equivalence. |
| 55 | NumberFieldArithmetic 5 -> GlobalQuadraticForms 0 | Finite completions and tower maps; one-sided naming becomes inferred. |
| 56 | NumberFieldArithmetic 5 -> GlobalQuadraticForms 2 | Local Hasse/isotropy lists on completions; inferred. |
| 57 | NumberFieldArithmetic 5 -> GlobalQuadraticForms 4 | Openness of squares including dyadic local input; inferred. |
| 58 | NumberFieldArithmetic 5 -> GlobalQuadraticForms 5 | Tower scalar extension for quaternary and local-field input for higher rank; inferred. |
| 59 | NumberFieldArithmetic 5 -> GlobalQuadraticForms 7 | Local realization over canonical finite completions; inferred. |
| 60 | NumberFieldArithmetic 3 -> PolynomialGaloisGroups 5 | Monic possibly reducible f; exclude polynomial-discriminant primes; restore fixed points. |

All retained links point from the field/arithmetic construction to its actual
consumer. In particular NFA does not import reciprocity to construct idealsAway
or its ideal Artin map, and the completion adapters import intrinsic local
fields before consumers use them.

## Overlap decisions

1. **rescope** — NumberFieldArithmetic 4 / Chebotarev 2. Reuse the already landed TauCeti.NumberField.ramifiedSupport (NumberField/Discriminant/RamifiedSupport.lean), comparing the precise base-prime carriers by an abbreviation or named equality with ramifiedPrimes. Import membership and finiteness; retain the Artin-fibre complement theorem in Chebotarev. Do not make ramifiedSupport depend on an Artin map.

2. **keep** — NumberFieldArithmetic 7 / PolynomialGaloisGroups 0. Keep the distinct field and polynomial interfaces, share generic normal-closure/embedding-action lemmas below both, and prove the minimal-polynomial comparison on the polynomial side. Respect the polynomial roadmap's explicit one-declaration exchange: do not add a reverse dependency to NFA or move nTj classification into NFA.

3. **keep** — NumberFieldArithmetic 3 / GlobalNumberFields 11. Keep the primitive-element and arbitrary-order interfaces distinct. NFA's exact power-order equation already exists as TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr (NumberField/Index/Discriminant.lean:56), not merely the EffectiveBounds inequality. Reuse this and existing determinant/change-of-basis infrastructure, and add the comparison of a NumberFieldOrder at Z[theta] with index theta where needed. General nonmaximal-order Picard carriers and proper-versus-invertible issues stay in GNF; early splitting must not depend on them.

4. **keep** — NumberFieldArithmetic 2 / Chebotarev 4. Keep the rational Frobenius adapter and the character-weight/conductor interface distinct, but import the already landed general-base root action AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one and autToPow_eq_absNorm (NumberField/Cyclotomic/Frobenius.lean:96,133). Its exponent is the absolute norm, not its inverse, at a prime avoiding the root-of-unity order. Neither owner should plan a second proof of that action.

5. **rescope** — NumberFieldArithmetic 3 / AlgebraicCurves 6. Reuse pinned TauCeti.KummerDedekind.primesOverEquivNormalizedFactorsMinPolyMk and its span, residue-degree and ramification-index theorems in RingTheory/DedekindDomain/KummerDedekind.lean. They require an integral generator, a nonzero maximal base prime and the conductor-avoiding hypothesis, with the declared domain/integral-closure/torsion-free setup. AlgebraicCurves obtains Conclusion B through its place/prime bridge, retains Conclusion A under its integral-generator hypotheses and the infinity-chart change. Do not reprove this generic theorem or depend on NFA's number-field layers.

6. **rescope** — NumberFieldArithmetic 1 / AlgebraicCurves 8. Keep one Dedekind-generic statement of each: NFA 1.3 on Mathlib's IsDecompositionField/IsInertiaField, and NFA 1.5 for composita and the Galois closure. AlgebraicCurves Layer 8 derives its group-order form through the Galois correspondence on the affine models R_x, using its two-chart bridge for places over ∞. It keeps what is specific to function fields: exactness of constants in Cor. 3.9.7, Abhyankar's lemma and the constant-field material. The ramification groups G_i fall under the overlap that the AlgebraicCurves packet already records against NFA Layers 5–6.

7. **rescope** — NumberFieldArithmetic 4 / AlgebraicCurves 7. Reuse pinned TauCeti.span_traceDual_one_eq_traceDual_one, extended_dual_one_eq_dual_one and map_differentIdeal_eq_differentIdeal (RingTheory/DedekindDomain/Different/Localization.lean:110,176,247), respecting the finite-module, fraction-ring, integral-closure and separability hypotheses of the appropriate statements. AlgebraicCurves specializes these at its affine models. Completion is a separate operation: these localization declarations alone do not settle NFA 5.9's completion comparison.

8. **rescope** — NumberFieldArithmetic 1 / NumberFieldArithmetic 4 / FunctionFieldArithmetic:FA.3. Import the existing generic TauCeti.relDiscr definition and separable tower/discriminant theory, together with the generic decomposition/inertia dictionary under its hypotheses. Do not use the number-field-specific ramifiedSupport carrier for function fields. Share the underlying ideal-factorization support argument and state a function-field adapter if required. FA.3 retains Artin–Schreier/Witt, inseparable and global-function-field-specific results; AlgebraicCurves owns its different/Hurwitz/curve bridge. Residue separability and the finite-residue-field boundary must not be silently dropped.

9. **keep** — NumberFieldArithmetic 2 / Multiquadratic 1. Keep the uniform finite-level Artin/splitting interface and the multiquadratic sign-vector interface distinct. Reuse the already landed square-root Frobenius calculation; add a named comparison with artinSymbol only if it is not already available. The full (F2)^n Galois identification requires independent square classes; a redundant radicand list only gives a constrained sign vector. The quadratic adapter is the one-factor projection, not a new reciprocity proof.

10. **rescope** — NumberFieldArithmetic 4 / LocalFieldsRamification 3. Reuse the single already landed TauCeti.relDiscr in RingTheory/DedekindDomain/Discriminant/Basic.lean:35. It is generic below both roadmaps, not a reason to add a reverse LocalFieldsRamification -> late NFA -> LocalFieldsRamification dependency. Once the local integer rings satisfy its Dedekind/finite-module/torsion-free setup, define the local discriminant by it or prove a named equality. LFR retains discriminantExponent and delta=f*d; NFA retains global assembly. Separability is needed for nonvanishing and the relevant theorems, not for the bare definition.

These are scope recommendations, not edits to other owners. In particular,
the generic discriminant definition already lies below both local and global
roadmaps; its reuse creates no reverse late-layer dependency.

## Pinned library checks

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`;
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
The reviewed NFA audit guided, but did not replace, reading the following
actual declaration statements and their variable/hypothesis contexts:

| Tau Ceti path (under TauCeti/) | Declaration and reviewed boundary |
|---|---|
| NumberTheory/EffectiveBounds/Discriminant/Basic.lean:61 | NumberField.abs_discr_le_of_basis_isIntegral; algebraic-integer basis, inequality only. |
| NumberTheory/NumberField/Index/Discriminant.lean:56 | TauCeti.NumberField.IntegralPrimitiveElement.discr_minpoly_eq_index_sq_mul_discr; exact power-order equation already landed. |
| NumberTheory/NumberField/ArtinSymbol.lean:57 | NumberField.artinSymbol; finite Galois, unramified base prime, conjugacy class. |
| NumberTheory/NumberField/Ideal/ArtinMap.lean:175 | TauCeti.NumberFieldArithmetic.artinHomAway; explicit commutativity, finite excluded set and unramifiedness outside it. |
| NumberTheory/NumberField/Cyclotomic/Frobenius.lean:96,133 | AlgHom.IsArithFrobAt.apply_eq_pow_absNorm_of_pow_eq_one / autToPow_eq_absNorm; general number-field base, root order avoiding the prime, arithmetic absolute-norm exponent. |
| RingTheory/DedekindDomain/Discriminant/Basic.lean:35 | TauCeti.relDiscr; finite torsion-free extension of Dedekind rings, bare definition does not require separability. |
| RingTheory/DedekindDomain/Discriminant/Separable.lean:40,50 | Nonvanishing and tower statement under their separable fraction-field contexts. |
| NumberTheory/NumberField/Discriminant/RamifiedSupport.lean:54 | TauCeti.NumberField.ramifiedSupport and membership API; number-field carrier, not a ready-made function-field carrier. |
| RingTheory/DedekindDomain/KummerDedekind.lean:87,98,112,157,181 | TauCeti.KummerDedekind factor/prime equivalence, span, residue quotient, f=degree and e=multiplicity; integral generator, nonzero maximal prime and conductor avoidance. |
| RingTheory/DedekindDomain/Different/Localization.lean:110,176,247 | TauCeti trace-dual/fractional-dual/different localization; finite-module and fraction-ring contexts, with integral closure and separability for the later statements. Not completion. |
| RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean:95,137,143 | Completion residue equivalence/cardinality and nonarchimedean-local-field instance under finite residue hypotheses. |

Existing statements are imports. This is not a claim that every API mentioned
in an old README is implemented; in particular canonical completion extension
maps, comparison coherence and consumer-specific assembly retain their separate
obligations.

## Completeness spot-check

Searched descriptions of all 2007 current stages, overlaying the six new-roadmap
definitions on the atlas. Searches were case-insensitive. Counts include
already-linked endpoints; “new” means not among the original endpoint set,
not a declaration missing from the libraries.

| NFA layer | Search expression | Hits / new endpoint candidates |
|---|---|---|
| 1 | `composit(?:um\|a)\b\|double.?coset\|split.*[Gg]alois closure` | 31 / 23 |
| 2 | `artinSymbol\|artinHomAway\|arithmetic.Frobenius\|complexConjugationAt` | 27 / 14 |
| 3 | `index.discriminant\|[Dd]edekind.[Kk]ummer\|factorizationType\|[Ii]ntegralPrimitiveElement` | 3 / 0 |
| 4 | `relDiscr\|ramifiedSupport\|ramifiedPrimes\|relative.discriminant` | 8 / 0 |
| 5 | `semilocalEquiv\|completionAlgHom\|decomposition.group\|finite.place.*complet\|complet.*number.field` | 23 / 11 |
| 6 | `different.exponent\|discriminant.exponent` | 4 / 1 |
| 7 | `fundamental.unit\|unit.*certificat\|normalClosureData` | 5 / 2 |
| 8 | `LMFDB.*label\|intrinsic.label` | 6 / 5 |

The initial broad “composit” search also matched “composition”; it was narrowed
to the expression above. Double-coset vocabulary in Hecke/Mackey theory was
not treated as number-field prime decomposition. Frobenius in geometric
cohomology, local groups alone, LMFDB labeling alone, and generic unit theorem
uses are likewise not enough.

Full additional candidate reads included R01.2, IHG.3, cyclotomic Euler-system
L0, A6, NC.1, ED.4, EllipticKTheory E.8/E.7, ES.7, IntegralIwasawa I.2,
KTheoryFiniteLocalFields L.7, SelmerIwasawa L2, KTheoryLowDegrees U.4 and CN.5.
The surviving precise field-level matches and moved consumers are:

- **NumberFieldArithmetic 2 -> MordellLawrenceVenkatesh:LV.11** (`addedBy: REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`): LV.11 chooses a friendly auxiliary place through cyclotomic Frobenius in a compositum. NFA 2.4–2.6 supplies finite-level restriction and the arithmetic Frobenius/root-of-unity congruence, turning the chosen class into conditions on q_v modulo q-1. The general-base formula is already AlgHom.IsArithFrobAt.autToPow_eq_absNorm at the pinned library. Chebotarev existence, the Weil pairing (with its separate inverse convention), and the small-orbit count remain consumer work.
- **NumberFieldArithmetic 2 -> MordellLawrenceVenkatesh:LV.6** (`addedBy: REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`): For LV.6's finite cyclic Kummer extension, Frobenius at an unramified place generates its decomposition group and has order the residue degree (NFA 2.3). Thus a Frobenius generating the entire cyclic Galois group makes that place inert. Chebotarev supplies existence, Kummer theory the cyclic extension and degree; neither follows from the Frobenius dictionary alone.
- **NumberFieldArithmetic 5 -> MordellLawrenceVenkatesh:LV.7** (`addedBy: REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`): LV.7's size_v criterion indexes local terms by places w above v and weights them by [E_w:K_v]. Applying NFA 5.2–5.5 to each field factor of the finite etale algebra gives canonical completion factors, semilocal decomposition and degrees. Identification with Frobenius orbit lengths additionally uses the unramified hypothesis and Frobenius/decomposition theory; no ramified equality between orbit size and full e*f degree is asserted. The semilinear Frobenius/Lagrangian and finiteness arguments remain LV's.
- **NumberFieldArithmetic 5 -> KTheoryFiniteLocalFields:L.7** (`addedBy: REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`): L.7 states compatibility of restriction/transfer and arithmetic operations with completion of a number field at a finite place. NFA 5.1–5.2 supplies the canonical local-field completion and extension map K_v -> L_w for a chosen place above v. This is the field-level input for completion squares; it supplies no K-theory transfer, Chern-class or trace naturality theorem, which remain L.7's responsibility.
- **NumberFieldArithmetic 5 -> SelmerIwasawaCohomology:L2** (`addedBy: REV-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic`): L2 forms the finite-extension Selmer global-to-local map using all places above each v and decomposition-stable local conditions. NFA 5.2 and 5.6 supply finite-level canonical completion extensions and the decomposition-group comparison, including conjugation compatibility; these underlie the local factors rather than selecting just one completion. Passage to separable closures, continuous Galois cohomology, local conditions, the cohomological direct-sum map and duality remain the Selmer roadmap's work.

Other searches did not establish additional direct NFA contracts: absolute
Galois/decomposition constructions require the consumer's profinite passage;
finite-field étale Frobenius is not the NFA number-field construction; arbitrary
unit/S-unit bases are not the rank-one certificate; and algorithmic label
schemas are not the NFA intrinsic-label theorem.

Cross-packet check: CFT already records NFA1 -> CFT13, NFA2 -> CFT12 and
NFA6 -> CFT13. GQF records the same NFA5 -> GQF0/2/4/5 pairs also recorded
here. These agree in direction and supply no extra distinct pair to add.
The native atlas has no incident NFA edge. Existing AlgebraicCurves overlap
with NFA5/6 remains in its owner's packet, not copied again.

## Source caveats and boundaries

The original two source caveats remain visible:

- Chebotarev 12.1: deleting Euler factors multiplies the zeta residue by the
  product of (1 - Norm(p)^(-1)); only the coefficient of the logarithmic
  derivative's pole stays 1.
- NFA 5.6: comparison with a distinguished local Frobenius requires an
  unramified place; a ramified place only has the coset modulo inertia.

The repaired reasons additionally make explicit: ramified Artin Euler factors
use inertia invariants; LV's Hodge-weight identity is not proved by an
unweighted degree sum; ramified orbit lengths are not full local e*f degrees;
multiquadratic Gal=(F2)^n needs the standing independent-square-class
hypothesis; and function-field finite ramification support does not reuse a
number-field-typed carrier unchanged. No out-of-scope source edits are made.

## Validation and publication handoff

Initial checker result: four stale LV quote errors and one retired LI.4 warning.
After repairs, all **156** active evidence items are literal substrings of the
named stage or its full roadmap document. **55** surviving quote strings needed
only whitespace restoration (not normalized matching or invented quotations).

Fresh publication snapshot preserved all 296 content files, 230 atlas shards,
six new roadmap definitions, atlas data, library audit and binding instructions
byte-for-byte. The unmodified NFA packet also matched exactly. Concurrent
ModularCurves, AlgebraicCurves and LocalFieldsRamification link changes are
preserved, and the graph checks were rerun with them.

Checks on the publication base:

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_NumberFieldArithmetic.json`: 0 errors, 0 warnings.
- Strict literal-substring and duplicate-pair audit: 156/156 quotes, 61 unique pairs.
- Augmented graph: 3508 native edge entries, 723 current packet entries,
  238 new-roadmap requires entries, and 25 conservative consecutive-layer
  edges for NFA, LocalFieldsRamification and ClassFieldTheory. No target of
  any of the 61 links reaches its source. This is not a claim that all
  unrelated atlas components are acyclic.
- Intake path check: only the two issue-authorized deliverables.
- `python3 -m unittest discover -s tests -p test_intake.py`: 29 tests pass.
- No Lean file changed; Lean not run.

Only the repaired JSON and this report are submitted. Scratch audit code and
snapshots are excluded. No unresolved link-review work remains; automated
intake may integrate the accepted map. Source theorem caveats above are not
silently promoted to correctness claims.
