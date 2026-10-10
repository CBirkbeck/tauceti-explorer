# Independent adversarial package review: Perfectoid quotients

**Verdict: needs_changes.** This is a completed fixing review of issue #8080,
by Codex (GPT-6), session `codex-ZE6yli`, on 10 October 2026. Neither the package
writing nor its previous review was my work. Local corrections are applied;
the unresolved cross-roadmap ownership defects below prevent an upstream-ready
verdict. Elaborating signatures does not establish their truth or resolve
those defects.

## Corrections applied

- Recast the README in the required roadmap form: ownership, conventions,
  exact suppliers, four numeric layers, prose subsections, named API lists,
  mathematical Checks, examples and dependencies per layer, downstream users
  and references. Supplier-owned smooth, animated, derived and Tate interfaces
  are grouped under the exact contracts. All original target mathematics and
  all 37 named original Checks remain represented; the library-owned root
  comparison is cited instead of replanned.
- Put the whole suggested file in `TauCetiRoadmap.PerfectoidQuotients`, with
  one introductory module description, mathematical declaration docstrings,
  `theorem` declarations and short closing names for unavailable carriers.
  Deleted the large declaration catalogue and repeated supplier descriptions.
- Removed the local typed root-sequence comparison and its proposal as a new
  construction. Mathlib `Perfection.quotientMulEquiv` and
  `Perfection.coeff_quotientMulEquiv` already supply it with weaker hypotheses.
  The normalized finite-quotient and expansion target remains new.
- Removed a second typed `principal_theta_kernel_criterion` which had exactly
  the conclusion of `theta_generator_nonzerodivisor`. The README retains the
  genuinely broader, two-direction BMS1 criterion and names its absence from
  the representative file.
- Corrected the claimed general finite-Witt supplier. `PR.0` supplies length
  two interfaces, not all `W_(r+1)→W_r` maps or the BMS finite Fontaine maps.
  Added those definitions locally, with truncation, coordinate, restriction,
  Frobenius and length-one APIs, sources, three or more Checks each and actual
  truncated-Witt Lean carriers. The p-complete construction is distinguished
  from its broader pseudouniformizer-complete application.
- Replaced the unspecified representative-choice power function by a canonical
  quotient ring-map target with its divisibility hypothesis and a named
  representative equation. Gave the ambient ring explicitly in root closure.
  Marked each genuinely partial signature as such in prose: torsion-removal
  comparisons, root-stable sufficient case, sharp completion and product
  generality. The infimum closure and difference operator allow arbitrary
  natural exponents; the perfectoid applications keep a prime.
- Named the absolute cotangent, Fontaine normal-form and generator-map
  contracts. Cut the unsupported general promise of further finite-kernel
  comparisons. Added two-term calculations for Witt coordinates versus
  digits, the Fontaine sign, the cohomological shift, quotient-map direction,
  derived-completion operator and perfectoidization composition. Added actual
  root-index and nonradical nilpotent-class witnesses.
- Replaced the unavailable Michigan lecture-note link by the author-hosted
  IAS copy, retaining the 23 April 2017 version and printed-page convention.
  Corrected the scope's assertion that its strongly closed theorem is a
  stronger result than P4's: P4.15 already includes the same result.

## Unresolved defects and exact repair boundary

| Defect | Evidence | Required resolution |
| --- | --- | --- |
| B1: integral-perfectoid predicate has two owners | [PerfectoidSpaces §1.24](../packages/PerfectoidSpaces/README.md#p1-24) states the same torsion-allowing BMS1 predicate and its root/Frobenius criteria as §§0.1–0.2 here. BMS2 normalization is an equivalence, not a distinct mathematical object. | Adopt the lower-tier predicate once. Reconcile its BMS1/BMS2 normalization and API, then remove this package's second ownership claim and refer its dependent signatures to that single supplier. |
| B2: perfectoidization and surjectivity have two owners | [PerfectoidSpaces §4.15](../packages/PerfectoidSpaces/README.md#p4-15) explicitly includes initial integral perfectoid rings under semiperfectoid rings, unit surjectivity and the strongly Zariski closed theorem. It says that it owns the integral construction. These overlap §§1.2, 3.2–3.3 here. | Fix a single lower-tier universal-ring and surjectivity contract, with derived versus ordinary completeness explicitly distinguished. Recast the initial-prism formula here as a comparison with that object; remove duplicate target ownership. |

The tier file places PerfectoidSpaces below this roadmap and explicitly lists
PerfectoidQuotients notions to move down. Merely renaming the local Lean
predicate, or saying that the analytic object belongs to P4 while retaining
its already-owned integral theorem, does not repair the dependency graph.
Conversely, deleting the local predicate without an agreed supplier would
leave the representative dependent targets and their tests without a common
interface. The neighboring package, packets and ownership/link data are outside
this review's edit scope. I therefore recorded the precise common-supplier gap
in Scope and ownership and in this verdict, rather than claiming closure or
rewriting another job's files. No claim is made that either package's general
completeness wording has already been reconciled.

These are defects in target ownership and prerequisite contracts, not a demand
for finished Lean proofs. The unavailable generic prism, cotangent, almost and
analytic carriers are legitimate supplier plans; their absence alone is not a
reason for this verdict. Other existing plan gaps, including the completed
colimit/kernel calculation, remain stated mathematical proof obligations.

## Source verification

I read every originally flagged locator; the package contained no unresolved
unverified-locator flag. For the independent sample I used
`random.Random('codex-ZE6yli').sample(packet['nodes'], 15)` on the unchanged
61-node packet. The following is the sample in draw order. Pages are printed
pages; no source passage is included in the repository.

| Sampled target | Locator checked in the public version | Result |
| --- | --- | --- |
| strongly Zariski closed | BS22 Remark 7.5, p.56; ECD Definition 5.7 and Theorem 5.8, pp.24–25 | Source supports both image statements; the plus map is ambient to quotient. Ownership is nevertheless B2. |
| integral perfectoid quotient/radical criterion | BMS1 Example 3.15, p.24; BS22 Theorem 7.4, pp.56,62 | Elementary characteristic-p consequence; source is not represented as naming this exact lemma. |
| theta naturality | BMS1 Definition 3.1 and Lemmas 3.2–3.4, pp.19–21 | Natural quotient and Witt maps have the stated direction. |
| tilt projection in characteristic p | BMS1 Lemma 3.10 proof, pp.22–23; Example 3.15, p.24 | Principal kernel gives the intermediate projection argument; distinguished from assuming the desired injectivity. |
| Bhatt root extension | Bhatt Definition 2.2 and footnote 6, p.4 | Saturation is required; raw completion is only an almost model. |
| smooth prismatic Hodge–Tate supplier | BS22 Construction 4.9, pp.38–39; Theorems 6.3–6.4, pp.52–54 | Smoothness, bounded prism, twists, completed forms and Bockstein convention retained. |
| prism/animation supplier | BS22 Lemma 3.9 and Theorem 3.10, pp.31–32; Lemma 4.8, pp.38–39 | Perfect-prism correspondence and initiality have their separate roles. |
| sharp naturality | BMS1 Definition 3.1 and Lemma 3.2, pp.19–20 | Inverse-root reduction and multiplicative sharp yield the claimed functoriality. |
| completed colimits | BS22 Theorem 7.4 proof, p.62; Stacks 091P and 091U | The completed-category step and ordinary completion/image step remain separate. |
| Witt quotient torsion | BMS2 Proposition 4.19(3), preprint pp.22–23; published p.227 | The elementary proof gives the unit-coordinate sufficient condition and bound one. |
| p-integral closedness | ČS24 §2.1.7 and (2.1.7.1), p.13; Česnavičius Lemma 4.7, p.8 | Regularity and the localization ambient ring matter; quotient direction verified. |
| André flatness | BS22 Theorem 7.14 and Remark 7.15, pp.61–62 | Actual p-complete cover and modulo-p ind-syntomic refinement, not ordinary flatness of Bhatt's extension. |
| perfect quotient/radical criterion | BMS1 Example 3.15, p.24; BS22 Theorem 7.4, pp.56,62 | Reducedness plus quotient Frobenius gives the full criterion, including the unit ideal. |
| semiperfectoid definition | BS22 Notation 7.1, p.55; Stacks 091P(7) | Derived completion is exactly the ordinary-module tower criterion used in Lean. |
| equivalence invariance | BMS2 Definition 4.18, p.22 | The normalization is intrinsic; orientation is not extra data. |

Additional fresh readings covered BMS1 §3, pp.19–27; BMS2 pp.22–23;
ČS24 §§2.1.2–2.1.11, pp.11–17; Česnavičius §§4.2–4.8, pp.7–9;
Anschütz–Le Bras Corollary 2.1.10, p.14; BS22 §7, pp.55–62;
Bhatt Notation 1.4 and §§2.1–2.7, pp.3–5; Davis–Kedlaya Theorem 3.2 and
its finite-Frobenius implications, pp.6–11; and Bhatt's lecture notes
Theorem 9.4.3 through Corollary 9.4.7, printed pp.113–117
(PDF pp.114–118). The older warning before Theorem 9.4.3 is not inherited
as a denial of the later BS22 surjectivity theorem.

Public versions are [BS22 v4](https://arxiv.org/pdf/1905.08229v4),
[BMS1 v3](https://arxiv.org/pdf/1602.03148v3),
[BMS2 v2](https://arxiv.org/pdf/1802.03261v2),
[published BMS2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf),
[ČS24 v3](https://arxiv.org/pdf/1912.10932v3),
[Česnavičius v4](https://arxiv.org/pdf/1711.06456v4),
[Anschütz–Le Bras v4](https://arxiv.org/pdf/1907.10525v4),
[Bhatt v2](https://arxiv.org/pdf/1608.08882v2),
[Davis–Kedlaya v1](https://arxiv.org/pdf/1409.7530v1),
[Bhatt's 2017 notes](https://www.math.ias.edu/~bhatt/teaching/mat679w17/lectures.pdf)
and [ECD, 14 April 2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf).
The ten non-note PDFs matched the packet's receipts. The library source index
was consulted; no restricted book was needed or copied. Stacks
[091P](https://stacks.math.columbia.edu/tag/091P),
[091T](https://stacks.math.columbia.edu/tag/091T),
[091U](https://stacks.math.columbia.edu/tag/091U) and
[0G3I](https://stacks.math.columbia.edu/tag/0G3I) fix the completion comparisons.
These readings support the stated claims and proof routes; they are not a
claim to have checked entire papers or every supplier's implementation.

## Object-based library and roadmap audit

I inspected the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current upstream roadmap main
`8acc80159cfd301db68bde9393a52668efdd8c8c`. Searches covered operators,
ring-map domains, Frobenius hypotheses, root closure, Witt coordinates,
Fontaine kernels, complete tensor/quotient operations and universal mapping
properties. The nine newer roadmaps and all Completed directories were
included. Positive matches were read. No lake command was run in either
read-only current checkout.

The library audit file has no dedicated PerfectoidQuotients entry. The packet's
65 baseline declarations are inputs, not evidence that all planned objects
are absent. The material matches and removals are:

| Existing mathematics | Disposition |
| --- | --- |
| Mathlib `Perfection.quotientMulEquiv`, `coeff_quotientMulEquiv`, Teichmuller | Removed duplicate typed comparison and local planning claim. Needs only adic completeness and characteristic p of the quotient; no perfectoidness. |
| Mathlib `PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`, `surjective_fontaineTheta` | Existing carriers and surjective theta imported; principal kernels and general-ring naturality remain additional assertions. |
| Mathlib Witt p-adic completeness, p regularity and coordinate divisibility | Inputs to the unit and torsion lemmas; not new completion or Witt definitions. |
| Mathlib `AdicCompletion.map_surjective`, `of_surjective`, `map_of` | Completion/image inputs. The first theorem is general module surjectivity, without Noetherian or finite-generation assumptions. |
| Current Tau Ceti `WittVector.isAdicComplete_span_p_teichmuller`, `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller` | Existing (p,[ϖ])-adic Witt topology retained only in the boundaries. |
| Current Tau Ceti `WittVector.frobenius_teichmuller`, `frobeniusEquiv_symm_teichmuller`, continuous Frobenius; `Valuation.Integers.perfectRing`; Huber Witt adapter | Existing perfect-ring, field and topological inputs; not general finite Witt Frobenius or semiperfectoid perfectoidization. |
| Current upstream AdicSpaces Layer 6.1 | Perfectoid-field and topological A_inf model deferred. General integral quotient statements differ in allowing torsion and nondomains. |
| Atlas PerfectoidSpaces P1.24, P4.15 | Unresolved duplicate ownership B1/B2. These are not hidden by a namespace change or a statement that only P4's space carrier is imported. |

No additional exact duplicate was found among the other current upstream or
Completed object matches. This does not erase B1/B2. The lower-tier DD/CR,
EnhancedDerivedSheaves and PerfectoidSpaces suppliers and same-bundle
PrismaticCohomology routes were checked against the tier order. No
`FoundationsAndLibraryIntegration` or `UPSTREAM:` reference remains. A full
whole-atlas dependency certification is outside this review.

## Definition tests and Lean signature comparison

All seven original locally presented definitions/constructions retain at least
three discriminating Checks. The two new finite maps also have at least three.
Their test carriers are actual Mathlib objects; no arbitrary unrelated data
was substituted to type a missing supplier.

| Definition or construction | Positive, degenerate and negative/agreement controls | Mirror |
| --- | --- | --- |
| Integral perfectoid predicate | Zero, prime field, product; ℤ/4, polynomial, dual numbers and semiperfect nonreduced quotient | Lean examples; B1 remains an ownership defect. |
| Ambient p-integral closure | Closed subring identity, zero ambient ring, F₂[T²], proper F₂[T³], T¹ polynomial model | Lean examples. |
| Semiperfectoid predicate | Zero, perfectoid identity, nonreduced root quotient, polynomial nonexample | Lean examples; three additional difference-operator witnesses. |
| Initial prism | Zero, F_p crystalline prism, perfectoid A_inf prism, QRSP comparison | Full prism carrier absent; initialPrism and its API/Checks named in the short closing block. |
| Perfectoidization | Zero, already perfectoid ring, radicalization of A/(T), two presentations, swap then projection | Lean examples on actual universal ring maps; B2 remains. |
| Bhatt root extension | Zero algebra, adjacent and iterated roots, saturated analytic comparison, g=0 identity | Almost/analytic carriers absent; construction and API/Checks in closing block. |
| Integral closed quotient | Zero ideal, unit ideal, characteristic p, nonclosed ideal, minimal plus ring | Analytic carrier absent; construction and API/Checks in closing block. B2 remains. |
| Finite Witt Frobenius | Length zero; (1,1)↦3 over ℤ at p=2; (0,1)↦0 over F₂ | Three Lean examples and coordinate/truncation/restriction APIs. |
| Finite Fontaine map | Length zero; θ₁(2)=0, θ₂(2)=(0,1) over F₂; θ₂([a])=(T,0) for a♯=T | Four Lean examples and Teichmüller/restriction/Frobenius/length-one APIs. |
| Private quotient power map | π=1 over ℤ; π=0 over F₂; 1+T↦1 from modulo T to modulo T² | Three Lean examples plus representative formula. |

The mathematical tests here are statements; most have `sorry` bodies. The
difference-operator two-coordinate test is proved by `decide`. These are
signature/definition controls, not a claim of formalized results.

The following signature comparisons include the enclosing variable and
include blocks; this exceeds the required ten samples.

| Signature | Comparison with prose |
| --- | --- |
| `IsIntegralPerfectoid` | Actual zero branch, nonunit p, classical completeness, unit root, surjective quotient Frobenius and actual theta kernel; no selected generator or assumed theorem. |
| `perfection_isUnit_iff` | Characteristic p, not perfectness, of the underlying ring; coordinate zero in inverse perfection. |
| `witt_mul_coeff_one` | Arbitrary characteristic-p base, not necessarily a field/perfect; p vanishes in base coordinates, not in Witt vectors. |
| `theta_kernel_charP` | Principal kernel, exact CharP and actual pinned completeness/nonunit instances; no hidden Frobenius-surjectivity premise. |
| `untilt_natural`, `theta_natural` | hg is included and relates the supplied quotient map to f. The induced map is not arbitrary. |
| `finiteWittFrobenius_coeff_zero` | Mixed-characteristic formula includes p x₁; finite length really decreases. |
| `finiteFontaineTheta_frobenius` | F after θ_(r+1) equals θ_r after Witt φ. r=0 is permitted via the zero target; the BMS applications use r≥1. |
| `Witt.witt_principal_quotient_p_torsion` | Unit Witt coordinate one; n is natural and includes zero; no domain premise. |
| `pIntegralClosure` and six APIs | Fixed ambient subring, no newly adjoined ambient field. The closure laws allow any natural exponent; ordinary-integral containment has prime p. |
| `perfectoid_p_integral_closedness` | Actual quotient ring map, divisibility witness and regular π; no circular perfectoidness assumption. |
| `perfectoid_torsion_free_quotient` | Only perfectoidness and regularity of the actual quotient are typed; the larger tilt/fibre-product target is separately identified. |
| `perfectoid_completed_root_quotient` | The Lean sufficient special case supplies a pth root in the set for every member; prose retains the broader ideal-power condition. |
| `perfectoid_sharp_ideal_completion` | Finite tuple and actual sharp ideal; typed ordinary conclusion, not a disguised derived/tilt comparison. |
| `IsSemiperfectoid` | Exact Stacks tower bijectivity plus a surjective perfectoid presentation, existential in one universe. |
| `PerfectoidizationData`, lift/map APIs | Actual ring, actual eta and unique factorization; existence is a theorem, not an assumed conclusion of that theorem. |
| `radical_quotient_universal` | Actual map to every perfectoid target; parent CharP induces p=0 in target, including zero. |
| `principal_root_quotient_perfectoidization` | Explicit semiperfectoid source, completed full-root ideal and unit-compatible equivalence; surjectivity is a conclusion. |

## Per-statement adversarial pass

Each original node appears once below, in packet order. The table checks the
mathematical assertion under its exact hypotheses; supplier assertions remain
conditional on their named interfaces. B1/B2 prevent an overall closure or
ownership certification. No groups, q-parameters or determinant parities occur
in this package, so those unrelated controls are not substituted for its
actual ring, ideal, exponent and map parameters.

| Statement | Instances and computation tried | Result or change |
| --- | --- | --- |
| `semiperfectoid-quasisyntomic-and-qrsp-rings` | 0, F₂, F₂[T], F₂[ε]/ε², ℤ/4, a perfect product | Zero is included; the two characteristic-p nonexamples and ℤ/4 are excluded. Same predicate as P1.24: ownership blocker B1. |
| `integral-perfectoid-nontrivial-criterion` | F₂ with π=0; zero ring | Nonunit-p instances exclude the zero branch from this signature; the root condition and principal kernel remain separate. |
| `inverse-perfection-unit-criterion` | the towers of 0 and 1; a product of characteristic-p rings | Coordinatewise inverses are compatible. No Frobenius-surjectivity hypothesis is inserted. |
| `perfect-witt-unit-criterion` | p, 1+p in W(F₂); W(F₂×F₂) | Constant coordinate detects units over a perfect ring, extending the pinned field-only criterion. |
| `witt-product-first-coordinate` | p=2, x=y=2; x=1, y=2; 2[T] | The coordinates of 4 are (0,0,1,…); coordinate one of 2[T] is T². Added computed Checks/examples. |
| `theta-kernel-characteristic-p` | F₂; a semiperfect nonreduced root quotient | For the field the kernel is (2). The nonreduced quotient fails the principal-kernel hypothesis; surjective Frobenius is not silently assumed. |
| `tilt-projection-injective-characteristic-p` | F₂; the nonzero root class in A/(T) | The principal-kernel premise is essential. In the nonreduced case roots give a nonzero tower with zero coordinate zero. |
| `untilt-naturality` | identity, zero element, projection of a product | The explicitly compatible map modulo p fixes the direction R→S. Checked the include hg block; sharp is multiplicative, not additive. |
| `theta-naturality` | 0,1, two Teichmüller inputs, projection | The same hg block ties the Witt map to f. Finite theta and sign witnesses added; equality of maps is not assumed as a premise. |
| `integral-perfectoid-ring-equivalence` | identity and swapping F₂×F₂ | The prime is fixed and all three defining conditions transport. No orientation is part of the predicate. |
| `characteristic-p-perfectoid-criterion` | F₂, perfect root algebra, polynomial and nilpotent quotients | Bijective, not merely surjective, Frobenius is necessary; zero is handled separately from exact CharP. |
| `quotient-frobenius-surjective` | I=0, I=1, I=(T) in a perfect root algebra | Choose a root before quotienting. Surjectivity survives the nonreduced quotient. |
| `perfect-quotient-radical-criterion` | I=0, I=1, I=(T) and √(T) | The nonradical quotient has a nonzero square-zero class. The zero quotient is allowed. |
| `radical-quotient-integral-perfectoid` | I=0, I=1, I=(T) | Reducedness plus quotient Frobenius gives perfectness; the unit ideal uses the zero branch. |
| `characteristic-p-perfectoidization-universal` | T=0; T=F₂; maps killing (T) | Reducedness of the actual target kills the radical. A unital map forces p=0; target CharP is not an extra premise. |
| `compatible-root-ideal-radical` | f=0, f=1, f=T; root indices 0,1,2 | Roots are inverse Frobenius iterates. Added T,T^(1/2),T^(1/4) computations and the nilpotent-class control. |
| `integral-perfectoid-quotient-radical-criterion` | the same three ideals and nonradical (T) | The raw quotient and its radical quotient differ. The theorem is a corollary of the two criteria, not a definition. |
| `witt-product-p-square-detection` | ξ=p; g=0,1,p; p=2; perfect products | ξ₁ must be a unit; no domain or nonzerodivisor hypothesis on ξ is used. |
| `witt-principal-p-saturation` | ξ=p, ξ=1+p; f=0,1,p | For ξ=p the hypothesis forces p∣f. Cancelling p takes place in W(k), where p is regular, not in the quotient. |
| `witt-principal-quotient-p-torsion` | n=0,1,2; ξ=p; ξ=4 in W(F₂) | n=0 forces x=0. The class of 1 modulo 4 is a counterexample without the unit-coordinate hypothesis; retained its negative Check. |
| `prism-and-animation-import-contract` | zero prism; crystalline prism; no chosen generator | The Cartier ideal, δ-structure and derived carriers remain supplier inputs. A Witt Frobenius alone does not give a prism. |
| `smooth-prismatic-hodge-tate-reexport` | relative dimension 0 and 1; p=2; i=0,1 | Forms are completed, negative twists are dual powers of I/I², and comparisons use Frobenius where specified. Supplier contract only. |
| `semiperfectoid-rings` | 0, F₂, A/(T), F₂[T], ℚ at p=2 | The tower operator is identity in characteristic p; (1,1,0,…) gives (−1,1,0,…); ℚ has a nonzero kernel. Added witnesses. |
| `initial-prism-of-a-semiperfectoid-ring` | S=0, F₂, perfectoid and QRSP S | Initiality is among all prisms, not only bounded ones. Unit replacement changes orientation, not the universal object. |
| `universal-perfectoidization` | 0, perfectoid S, A/(T), swapping/projecting a product | Actual universal maps have source S. Composition and the noninjective unit are witnessed. The same object is claimed by P4.15: B2. |
| `derived-prismatic-initiality-import-contract` | zero algebra, regular quotient, QRSP quotient | Discreteness is required of the Hodge–Tate reduction; only weak initiality and an idempotent retract are asserted before the additional identifications. |
| `lifting-quasisyntomic-covers-to-prisms` | identity cover; zero base; perfect versus nonperfect base | Use the existing PR.2 theorem; completed perfection preserves flatness only with its perfect-base hypotheses. No second generic theorem. |
| `andre-flatness-lemma` | 0; F₂; a product; constant polynomial 1 | Root assertions require positive degree. The target need not be a domain. Actual p-complete faithful flatness is distinct from the almost variant. |
| `surjectivity-of-perfectoidization` | 0, perfect S, A/(T); quotient by 1 | Surjectivity does not imply injectivity or perfectoidness of S. P4.15 already includes the generic image theorem: B2. |
| `completed-integral-closed-quotient` | I=0, I=1, I=(T), a nonclosed ideal | Retain completion, localization, the minimal plus ring and continuous maps. P4.15 has the same integral construction: B2. |
| `zariski-closed-subsets-are-strongly-zariski-closed` | empty and full locus; V(T); changed plus ring | The plus map is R⁺→R_I⁺. This is not stronger than P4.15, which already states it; corrected scope claim and recorded B2. |
| `frobenius-surjectivity-equivalences` | π=0 in F₂; p=2; length 0,1,2; ℤ₂ | ℤ₂ does not have the required root divisibility. Infinite Witt Frobenius is not the finite map. Replaced the absent PR.0 supplier by local finite-map targets. |
| `bms-perfectoid-normalization` | perfect F₂; torsion-free O_Cp; O_Cp×F₂ | The BMS2/BMS1 bridge allows p-torsion; divisibility alone is not a completion comparison. P1.24 overlap remains B1. |
| `principal-theta-kernel-criterion` | π=0 in F₂; a regular π in O_Cp; a nonregular π | Regularity is required only for the converse. Removed the duplicate Lean signature that merely repeated normalized generator regularity; retained the full README criterion. |
| `theta-generator-unit-coordinate` | ξ=p in W(F₂); ξ=4; ξ and −ξ at p=2 | Coordinate one, not coordinate zero or an unmodified Teichmüller digit, detects generators. Added named normal-form and generator-map contracts and the ±2 witness. |
| `perfectoid-bounded-p-torsion` | n=0,1,2; F₂; O_Cp; their product | Bound one allows p-torsion and zero divisors. Ordinary/derived completeness is a separate consequence. |
| `perfectoid-cotangent-vanishing` | R→R identity; R=F₂; zero ring | Relative completed L is zero; absolute L_(F₂/ℤ₂) is F₂[1], not zero. Added the degree −1/0 shift witness and a named absolute target. |
| `perfectoid-rings-reduced` | 0, F₂, O_Cp×F₂; a=0,1 and n=0,1,2 | Reduced does not mean domain. Ann(0)=R and Ann(1)=0; compatible roots and power torsion have the same annihilator. |
| `torsion-free-perfectoid-quotient` | π=0 in F₂; regular π; product with a characteristic-p factor | The characteristic-p quotient is zero when π=0. The fibre product uses both reduced special fibres. Explicitly separated full comparisons from the partial Lean conclusion. |
| `compatible-roots-and-iterated-frobenius` | p=2, π₁,π₂; reduction of a root tower | Removed the duplicate multiplicative comparison; Mathlib already supplies it. Retained only normalized finite quotient/expansion clauses. |
| `p-integral-closure` | zero ambient ring; F₂[T²] and F₂[T³] inside F₂[T] | The first closure is F₂[T]; the second stays proper although ordinary integral closure is F₂[T]. Made the ambient ring explicit and added T¹ control. |
| `p-integral-closedness-criterion` | π=1; π=0; π=T over F₂[T] | π=0 is excluded by regularity in a nonzero ring. The quotient map is modulo π to modulo π^p and squares representatives; fixed its actual canonical ring-map contract. |
| `completed-p-integral-closure-perfectoid` | π=1; characteristic-p root algebra; regular versus zero π | Keep regularity, divisibility, compatible roots and surjectivity as separate hypotheses. Unit-ideal completion is zero. |
| `completely-etale-and-henselian-perfectoid` | identity, zero target, J=0, J=1 | Use derived p-complete étaleness; arbitrary raw étale algebras are not declared complete. The unit henselian pair gives the zero completion. |
| `completed-root-polynomial-algebras` | empty variable set; one variable; p=2 | The empty set recovers A. A[T] without adjoining roots fails the characteristic-p Frobenius test; completion and root tower are both essential. |
| `completed-perfectoid-tensor-products` | empty family, one factor, a zero factor | Empty tensor product is A, not zero; a zero factor gives zero. Infinite families use filtered finite tensors before completion. |
| `completed-root-stable-quotients` | empty set, set containing 1, full T-root tower, {T} | The first two give A and zero; {T} alone produces a nonradical nonexample. Explicitly identified the stronger sufficient hypothesis used in Lean. |
| `products-of-perfectoid-rings` | empty product, one factor, F₂×F₂, a nonperfect factor | Empty product is zero. The Lean ordinary-ring version uses the unique ℤ_p actions on perfectoid factors; the prose records this generality. |
| `completion-along-sharp-ideal` | r=0, sharp(1), one nonunit sharp | The zero ideal gives A; the unit ideal gives zero. No p-containment is imposed. Explicitly separated ordinary Lean conclusion from derived/tilt comparisons. |
| `tate-powerbounded-model-import-contract` | O_Cp; an unsaturated integral model; characteristic-p analog | The p-torsion-free input and saturation are essential. This is a P1 input, not a second Tate adapter or general-predicate converse. |
| `completed-perfectoidization-base-change` | identity cover, diagonal R→R×R, nonfaithful R→0 | Keep complete faithful flatness and perfectoid R′. The zero map is not a cover for nonzero R; arbitrary base change is not asserted. |
| `perfectoidization-completed-colimits` | F empty, F={1}, finite and infinite J | Finite quotients are derived complete as finite cokernels; the colimit is in the completed category. The union-of-kernels/completion identification remains an explicit target. |
| `principal-root-quotient-perfectoidization` | f=0, f=1, compatible roots of T at p=2 | The completed quotient kills every root; raw R/(f) need not be perfectoid. Kept actual unit compatibility and the separate semiperfectoid hypothesis in Lean. |
| `relative-perfectoid-cover-of-smooth-site` | relative dimension 0 and 1; perfect/nonperfect base | Relative perfectness is not absolute perfectness. The cover means refinements of every test prism; retain cotangent vanishing and complete-flatness hypotheses. |
| `frobenius-flat-prism-perfection-cover` | crystalline perfect base; zero base; nonflat Frobenius | Complete flatness of Frobenius is required. Perfection is completed; faithful refinement does not follow from arbitrary ring perfection. |
| `andre-ind-syntomic-mod-p` | F₂; product of fields; the zero ring | Only modulo-p ind-syntomicity is asserted; the stronger ordinary theorem remains in IntegralPerfectoidPartII. |
| `bhatt-field-integral-model-comparison` | K°; 0; an F_p quotient with its residue K° action | The quotient fails K°-flatness. General integral perfectoidness does not imply this field model; keep t≠0, topology and saturation. |
| `bhatt-rational-root-neighborhoods` | ℓ=0,1,2; \|T−g\|=\|t\| and \|t\|²; g=0 | Neighborhoods shrink, so integral restriction maps go B_ℓ→B_(ℓ+1). No density of a single restriction is claimed. |
| `bhatt-perfectoid-root-extension` | zero algebra; g=0; root indices 0,1,2 | At g=0 all roots vanish by reducedness and the extension is A. Raw completion C is only almost isomorphic to its saturation; retained footnote-6 correction. |
| `bhatt-root-extension-almost-flat` | ℓ=0 versus ℓ>0; P=T, P=T²−g, P=1; p=2 | The flatness assertion uses ℓ>0 and the specified almost ideal. Monic roots require positive degree; the uniform-target universal property is an additional extension calculation. |
| `functorial-almost-absolutely-integrally-closed-extension` | identity and composite maps; zero algebra; monic 1 | The iteration is functorial on root data; it remains almost faithfully flat modulo t. Countably filtered completion/saturation and finite coefficients are explicit proof obligations. |

The API and added local contracts are checked separately below. Short names
refer to the displayed APIs of the corresponding definition; they are not
new duplicate copies of already-owned generic assertions.

| API or added contract | Control and result |
| --- | --- |
| `IsIntegralPerfectoid.of_subsingleton` | Zero ring has the root witness 0 and unique unit; explicit branch avoids undefined nonunit-p instances. |
| `.complete` | Completeness at the unit p-ideal implies zero; nonzero prime fields have p-ideal zero. |
| `.has_p_root` | π=0 over F₂; π^p=p u in O_Cp. ℤ/4 has no square root of 2 times a unit. |
| `.iff_nontrivial` | For F₂ the root and Frobenius clauses hold; for the semiperfect nonreduced quotient the kernel clause fails. |
| `.congr` | Swap of a product carries every root witness and kernel ideal, not a selected orientation. |
| `integralPerfectoid_iff_perfect` | F₂ passes; F₂[T] and A/(T) respectively fail surjectivity and injectivity. |
| `IsSemiperfectoid.presentation` | Identity presentation for perfectoid S; actual quotient presentation for A/(T). |
| `.derived_complete` | Characteristic p makes the operator identity; ℚ's geometric kernel prevents acceptance. |
| `.of_perfectoid` | Bounded p-torsion plus classical completeness gives derived completeness; zero is allowed. |
| `.congr` | Identity and product swap preserve the difference operator and surjective presentation. |
| `.classically_complete_of_bounded` | n=0 is p-torsion-free; n=1 includes F₂. The theorem compares completeness under an explicit bound, not all semiperfectoid rings. |
| `initialPrism.structureMap` | F₂ maps identically to W(F₂)/(2); zero maps to zero. |
| `.ideal_principal` | The image of d, and of u d, generate the same ideal for a unit u; no equality of orientations asserted. |
| `.lift` | For perfectoid S the A_inf prism maps to every prism under S; the domain is fixed. |
| `.lift_unique` | Endomorphism compatible with the unit is the identity; arbitrary δ-endomorphisms are not equated. |
| `.map` | S→T→U gives initial prisms in that direction; identity and composite follow by uniqueness. |
| `.presentation_independent` | Two presentations of F₂ recover the same crystalline prism over F₂. |
| `perfectoidization.eta` | For A/(T), eta kills T^(1/2) and preserves 1. |
| `.isIntegralPerfectoid` | Output is A/√(T), while input A/(T) is not reduced. |
| `.lift` | Evaluation at T=0 factors through the radical quotient, uniquely. |
| `.lift_eta` | The factored evaluation has the original values 0 and 1 on T and 1. |
| `.lift_unique` | Two maps equal on eta(S) agree; no hypothesis equates their conclusions directly. |
| `.map` and `.map_eta`, `.map_id`, `.map_comp` | Swap then second projection sends (0,1) to 0; second projection alone gives 1. Added this computed witness. |
| `.of_perfectoid` | F₂ and zero are fixed, while A/(T) has a noninjective unit. |
| `.presentation_independent` | The unique equivalence preserves eta, rather than merely the abstract output ring. |
| `perfectoidClosedQuotient.map` | I=0 gives identity; I=1 gives zero; every element of I is killed. |
| `.plus` | I=0 retains R⁺; changing the plus ring changes the pair contract, not arbitrarily to R°. |
| `.lift` | Maps annihilating T factor through V(T); a map carrying T to 1 does not. |
| `.choices` | Unit multiples of π give a canonical comparison preserving the map from R. |
| `.spa` | I=0 has full image, I=1 empty image; the nonradical root locus is represented by the saturated quotient. |
| `pIntegralClosure.le` | T² belongs before and after closure in F₂[T]. |
| `.isClosed` | T² in F₂[T²] forces T into its closure. |
| `.minimal` | F₂[T³] is already square-root closed; the ambient ring itself is always a competitor. |
| `.idempotent` | Closing F₂[T²] twice still gives F₂[T]. |
| `.mono` | Constants ⊆ F₂[T²] ⊆ F₂[T] gives the corresponding closure inclusions. |
| `.le_integralClosure` | T satisfies X²−T² in the first example; the T³ example makes the containment strict. |
| `bhattRootExtension.map` | Zero algebra and g=0 give the unique map and the identity model. |
| `.root` | Root zero is the image of g, not an arbitrarily chosen later root. |
| `.root_pow` | At indices 0,1,2 the adjacent powers recover the previous root; iterated powers alone would not fix the adjacent relation. |
| `.perfectoid` | Saturation and K°-flatness remain required; general p-torsion rings are not silently admitted. |
| `.raw_almost_iso` | C→C_* is an almost isomorphism, not an equality of integral models. |
| `.map_comp` | Maps preserving g preserve the chosen entire tower; composition is in the same ring-map direction. |
| `finiteWittFrobenius` and `.truncate` | (1,1) over ℤ at p=2 gives 3, distinct from restriction's 1. |
| `.coeff_zero` | Over F₂, (0,1) gives 0; over ℤ the p term remains. |
| `.restrict` | At r=0 both paths end in W₀=0; at r=1 both have the same first Frobenius coordinate. |
| `finiteFontaineTheta` and `.teichmuller` | θ₂([a]) has coordinates (T,0) for a♯=T, not a shifted root. |
| `.restrict` | θ₂(2)=(0,1) restricts to θ₁(2)=0; zero length has the unique value. |
| `.frobenius` | F θ₂([a])=[(a♯)^p]=θ₁ φ([a]); fixes the side of the Frobenius. |
| `.one` | The length-one coordinate agrees with the existing theta on 2 and Teichmüller inputs. |
| `quotientPowerMap` and `.mk` | π=1 yields zero quotients; π=0 over F₂ yields identity; 1+T modulo T maps to 1 modulo T². |
| `powerPolynomialSubring` | Exponents 1,2,3 give full polynomials, square-polynomials, and the strict cube-polynomial subring. |
| `pCompletionTowerMap` | (1,1,0,…)↦(−1,1,0,…), identity over F_p, nonzero geometric kernel over ℚ. |
| `theta_generator_normal_form`, `theta_map_preserves_generator` | θ([a]−2)=0 while θ([a]+2)=4 at p=2 in characteristic zero; units map to units and generate the same ideal after the induced Witt map. |
| `perfectoid_absolute_cotangent` | For F₂ the absolute completed object is F₂[1], with degrees −1 and 0 equal to F₂ and zero; relative identity cotangent is zero. |

## Validation and handoff

- `lean-check` exited 0 with **120 declaration-uses-sorry warnings** and no
  errors or other diagnostics. The file contains 54 examples, 64 theorems,
  13 definitions, one structure and one instance. Definitions whose carriers
  are not available are listed by name with their API/Checks in the closing
  comment. No `True`, arbitrary assumed-conclusion carrier, `Prop := sorry`,
  `#print`, `#eval`, `#synth`, or new generic prism implementation is present.
- The unchanged packet checker reports 0 errors and 0 warnings. Its seven
  planned gaps and nine requests remain unchanged; schema validity is not
  closure certification.
- Intake validation reports **5 files, 0 problems**. All original named
  Checks are preserved, and all 61 original nodes occur exactly once in the
  adversarial table. Local file links and anchors, table delimiters and
  `git diff --check` pass. A normalized 16-word scan of the README, report
  and handoff against the eleven public source texts found no matches;
  manual reading also found no source passages or section-by-section source
  summaries. No private source/build paths or source files are submitted.
  The metadata remains `math.AG`.

The handoff names B1/B2, the exact overlapping neighbor sections, the two
library/internal removals and the new finite-map ownership. This review is
complete, not a checkpoint. No other job was claimed; no merge, closure or
label update is performed by the worker.
