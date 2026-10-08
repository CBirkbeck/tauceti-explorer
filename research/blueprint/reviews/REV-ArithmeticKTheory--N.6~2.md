# Independent review of ArithmeticKTheory N.6, revision round 2

**Verdict: accepted as a planned pass.** Review job `REV-ArithmeticKTheory--N.6~2`, issue #6988, completed by Codex — codex-2Ohski on 8 October 2026. This session authored neither the original plan by codex-jToARl nor the revision by codex-20n7RW. The packet remains a complete target-level planning pass, N.6 remains **planned**, and every implementation status remains **unchecked**.

The previous review's reader contradictions are resolved. The revision supplies actual number-field definitions, real group-cohomology examples and explicit generic kernel/map interfaces wherever the pinned carriers permit them. Its remaining arithmetic signatures have individual missing-carrier/map boundaries. Acceptance checks that plan and those boundaries; it does not turn the mathematical comments into Lean declarations or discharge G1/G2.

| Item | Input | After this review |
| --- | ---: | ---: |
| Nodes | 28 | 28: 24 verified, 4 corrected |
| Definition / construction | 4 / 2 | 4 / 2 |
| Theorem / comparison / application | 10 / 5 / 7 | 10 / 5 / 7 |
| API items / mathematical tests | 34 / 21 | 34 / 21 |
| Baseline declarations | 15 | 15, all confirmed |
| Proof gaps / supplier requests | 2 / 7 | 2 / 7 |
| Source findings | 1 confirmed, 1 rejected | 2 confirmed, 1 rejected |
| New nodes / removed baseline citations | — | 0 / 0 |
| Follow-up planets | 2 | 2; six with the parent |

## Resolution of the preceding review

The [preceding report](REV-ArithmeticKTheory--N.6.md) requested mathematical consistency in the definitive reader, actual interfaces for expressible definitions and APIs, and honest omission of conditions whose suppliers are missing. Each request was checked against the revised packet, reader and suggested file:

- The VI.9.9 statement/proof locators now give book pp.522–523, PDF pp.530–531. The table excludes degree zero from the arithmetic theorem and keeps odd-degree totalisation separate.
- The full degree-four Q₂ quotient has order 24, while its dyadic primary subgroup has order 8. This distinction occurs in the reader and the detecting test.
- `SpecialAtTwo` retains exceptionality, local root witnesses and the exceptional hypothesis of the decomposition API. The definition uses the actual algebraic closures of finite completions and both embeddings; its four field tests are active examples.
- Cyclotomic descent specifies matching S/T, with the required coefficient and ramification primes inverted. The real positive sequence is retained separately from ordinary or modified cohomology.
- The certificate requires the full cohomological order and the factor 2^ρ in real degree 8k+4. Exactness determines cardinality; identifying the group still requires extension data. A two-rank is insufficient.
- E-N6-2 remains rejected: the source already uses the cokernel. That allegation is no longer used as a source correction or theorem hypothesis.
- The strict kernel uses the read L2 degree-independent module interface, with identity/composition laws. R02 supplies the finite H¹ hypothesis needed for the continuous limit. Generic compatible-section and change-of-S identities explicitly stop short of those arithmetic comparisons.
- Shapiro is imported from Mathlib, and generic cyclic norm/homology machinery from existing ClassFieldTheory Layer 0. No new general homology theory is assigned to M.2.
- All six owned constructors and all 34 API names now have active signatures. The 21 named arithmetic statements, decomposition homology conclusion and nine examples needing absent arithmetic carriers/maps are individually omitted, as permitted by the honest-conditions rule in PROTOCOL §13. The prior review's request to avoid arbitrary K-group carriers or proposition fields is satisfied.

Four node records received clear supplier corrections in this review. The positive subgroup now directly imports `K2SymbolsBrauer:T.5/real-sign-symbol`. The local family directly imports that real map and `T.2/matsumoto`; the symbol kernel directly imports `T.5/k2-of-the-integers` and `/k2-of-the-rationals` for its tests. These exact supplier statements were read. The suggested file and packet omission register no longer assign real Hilbert symbols to the finite-place L.7 layer. The twisted-residue test's omitted signature now names M.2 and ClassFieldTheory Layer 0, matching its actual prerequisites; the erroneous I.1 attribution was removed. The reader's direct-input lists and supplier explanation were synchronised. No mathematical theorem was weakened to make it type-check.

The packet records the current per-node review and preserves the earlier review in `reviewHistory`. Baseline checking notes and source-verdict provenance were refreshed. The reader records the new index slip and points to the existing supplier erratum rather than creating a duplicate.

## Sources and source findings

The public [combined K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), dated 29 August 2013, was fetched independently: SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. The cited passages III.6.2.2–5, V.6.8–6.8.2, VI.2.3–2.3.1, VI.7.1–7.5 and VI.9.6–9.11 were read, including the end of the proof on PDF p.533. The book-to-PDF offset is eight pages.

All 22 rendered pages of the public [wild-kernel author preprint](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), dated 23 July 2004, were read, including the proof inputs in §§1–8 and the references. Its SHA-256 is `2675756fe4e03556dac1b26538eeca0fd1b8bf0ae7d800433a3c708812f3478b`. Its font encoding makes extracted text unreliable; page 20 was also checked at higher resolution. All locators here use preprint pagination.

The [publisher DOI](https://doi.org/10.1016/j.jpaa.2005.03.018) and ScienceDirect article returned HTTP 403 on this run. The version of record was not read or collated. The [author archive](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/papers.html) and bounded title/corrigendum, Lemma 4.4, signature and Example 1.1.1 searches yielded no verified correction. The live K-book errata URL remained unavailable. These are access and search limits, not claims that no correction exists. No private source was used.

- **E-N6-1: confirmed.** Lemma 4.4, preprint p.12, permits independent ideal-class and norm-residue prescriptions for every modulus. In Q(i), with modulus four and residue three, split odd primes have norm one modulo four, inert primes have squared norm one, and the dyadic prime has norm two. No prime ideal has norm three. A class/cyclotomic intersection compatibility condition is needed. G2 attaches this missing step to the exceptional odd dyadic localisation argument in Theorems 4.5 and 6.11. This does not assert that Theorem A is false or that the publication has the same wording.
- **E-N6-2: rejected again.** Immediately after (8.2), preprint p.20, the source already defines j using the cokernel. For Q and Z[1/2] the real restriction kernel has dimension one and its cokernel dimension zero, consistent with j=ρ=0. The original allegation remains only as reviewed history.
- **E-N6-3: added and confirmed.** Example 1.1.1, preprint p.5, uses i=2 for the classical K₂ case. Theorem 1.1 uses K_{2i}, so the intended index is i=1. This is a clear index slip affecting no intended mathematics. The finding is scoped to the hashed preprint and has this review's own verdict.

The faulty local decomposition before VI.7.1, book p.507/PDF515, is already `KTheoryFiniteLocalFields/E17`, confirmed by that supplier's independent review and recorded there as an author erratum. Moore's correct finite term is μ(E), with residue-characteristic roots included. Q₂ detects the problem because its {−1,−1} class has order two while F₂ˣ is trivial. This review rechecked the draft and III.6.2.4–5; it did not independently access the archived errata PDF and does not create another finding. The adjacent VI.9.12 proof slip is also already recorded by the parent and is outside this part's certificate inputs.

## Baseline and proof closure

Every one of the 15 baseline declarations was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed, replaced or added in this review. The actual norm, induced-homology and decomposition-group statements provide the stated conventions; they are not stand-ins for absent arithmetic comparisons.

| Pinned declaration | Checked assumptions and use |
| --- | --- |
| `mathlib:ZMod` | ZMod 0 is ℤ and positive moduli use Fin; the imported Basic module supplies the ring used at modulus two. |
| `mathlib:Algebra.norm` | Determinant norm is a multiplicative homomorphism for a commutative base ring, ring algebra; the finite-field use has the needed finite free setting. Units.map is the whole-unit norm. |
| `mathlib:FiniteField.unitsMap_norm_surjective` | Fields K,K′ with Algebra K K′ and Finite K′; the full unit norm is onto. No twisted root-subgroup conclusion is supplied. |
| `mathlib:FiniteField.algebraMap_norm_eq_pow` | Under the finite-field hypotheses, embedding the norm gives exponent (\|K′\|−1)/(\|K\|−1); the convention agrees with the node. |
| `tauceti:TauCeti.unitFiltration` | Field, ValuativeRel, TopologicalSpace and IsNonarchLocal hypotheses; the congruence subgroup is built from the valuation-subring quotient unit kernel. |
| `tauceti:TauCeti.unitFiltration_zero` | Under the same nonarchimedean local-field hypotheses, depth zero is the valuation-subring unit group. |
| `tauceti:TauCeti.unitFiltration_one` | Under the same nonarchimedean local-field hypotheses, depth one is the principal unit group. |
| `mathlib:groupHomology.indIso` | CommRing k, Group G, DecidableEq G, subgroup H and A:Rep k H; induced homology is isomorphic in every natural degree. No finite-group/flatness condition is added. |
| `mathlib:CyclotomicField` | Actual splitting field of the cyclotomic polynomial over F, with field/algebra instances; used at orders 2^ν. |
| `mathlib:AlgebraicClosure` | Actual algebraic closure of a field, with its field and algebra instances; root witnesses live in the closure of the completion. |
| `mathlib:NumberField.FinitePlace.embedding` | Dedekind base ring, fraction field and height-one prime; the ring homomorphism embeds into the adic completion. Applied to 𝓞 F and F. |
| `mathlib:ValuationSubring.decompositionSubgroup` | Actual stabiliser of a valuation subring under algebra automorphisms; the decomposition criterion uses this subgroup, not an imposed Boolean. |
| `mathlib:Rep.of` | An existing linear representation over a semiring on an additive group/module yields the representation-category object; used for the integral real sign action. |
| `mathlib:groupCohomology` | Homology of the standard cochain complex of a group representation in ModuleCat; this supplies actual degree-two real group cohomology. |
| `mathlib:PadicInt` | For a prime p, the norm-at-most-one subtype of ℚ_p, with its integral ring structure; used at dyadic and odd-prime coefficients. |


The N.6 reviewed library audit, its M.7/T.5 overlaps and the exact supplier statements were read. The parent supplies the signature defect, raw kernel, divisibility definition, primary comparisons and certificate engine. N.2–N.5 supply localisation, S-unit/class sequences, finiteness, twists and Soulé/real tables. L.1/L.3/L.6/L.7 supply finite-field and finite-local structure and compatibility; T.2/T.5/T.7 supply actual degree-two symbols and test classes. R02 supplies finite Kummer, H¹ finiteness, Poitou–Tate and inverse-limit hypotheses; L2 supplies the strict module kernel and functoriality. Their scopes justify the imports and avoid parallel definitions.

The seven requests remain precise: M.2 for arithmetic ordinary/modified/positive cohomology and map-level duality/localisation; M.7 for coefficient filtrations and real/spectral comparisons; H.6 for functorial coefficient UCT; I.1 for number-field cyclotomic actions/decomposition/transfer; I.2 for finite S-class systems; existing ClassFieldTheory Layer 6 for local reciprocity norm kernels, and Layer 0 for generic cyclic Tate/homology interfaces. Reading a supplier scope establishes ownership, not its implementation. These requests are not closed by this review.

All four inherited target groups have explicit target-level nodes: even-primary arithmetic data, real two-primary corrections, wild/divisible comparisons and certificate evidence. The internal graph is acyclic and the selected planets fit the six-planet assembled budget. No splitting into lemma-level nodes or restructuring is needed. The upstream Multiquadratic and Completed/IntegralLattices reader documents were read for the required statement/API/test style.

G1 is exactly the missing higher-degree detection of global torsion in divisible local parts, with the corresponding real detection. A local Q_p/Z_p summand defeats the argument from global torsion alone. Degree two uses Moore's uniquely divisible kernel. G2 is exactly the compatible prime-selection or replacement localisation-image input in the exceptional odd dyadic branch; the odd-prime, even-twist and nonexceptional branches use the surjective residue norm. Each downstream application retains that boundary. There is no unresolved contradiction in the planned statements and no declaration of mathematical closure.

## Per-node checks

Locators and hypotheses were checked independently, not inferred from compilation. The packet contains the same separate entry for every node.

| Node in `ArithmeticKTheory:N.6` | Verdict | Check |
| --- | --- | --- |
| `arithmetic-mod-two-dimensions` | verified | VI.9.6, book pp.520–521/PDF528–529: all four dimensions use ordinary class two-rank and Selmer-squareclass signature cokernel; S-unit and duality suppliers checked. |
| `modified-mod-two-dimensions` | verified | VI.9.6.3, book p.521/PDF529: modified restriction kernels are distinguished from ordinary and totally positive cohomology. |
| `mod-two-coefficient-orders` | verified | VI.9.7, book pp.521–522/PDF529–530: all eight orders match the exact filtrations; coefficient modulus does not impose an F₂-vector-space structure. |
| `even-two-rank-function` | verified | VI.9.9 statement on book p.522/PDF530; numerical natural subtraction, four branches, periodicity and four tests are correct. No arithmetic meaning at n=0 or odd degrees. |
| `even-two-ranks-from-arithmetic` | verified | VI.9.9 proof on book pp.522–523/PDF530–531: positive even arithmetic ranks follow from UCT and the imported odd table, using units at n=2; rank is distinct from order and rho. |
| `finite-coefficient-divisibility-kernel` | verified | V.6.8.2, book pp.412–413/PDF420–421: m≥2 annihilates the finite integral subgroup; Soulé injectivity and coefficient boundary inputs justify the stated architecture. |
| `stabilisation-of-primary-kernels` | verified | Preprint Corollary4.6, p.13: descending kernels on the finite primary integral group stabilise; a plateau alone is not an effective stopping certificate. |
| `positive-even-k-subgroup` | corrected | Preprint p.2: the real kernel applies only at i≡1 mod4. Added the exact T.5 real-sign supplier for the degree-two test; corrected the erroneous L.7 real-map omission reference in all files. |
| `local-symbol-family` | corrected | Preprint p.2 and VI.2.3/7.3: full Q₂ degree-four quotient order is 24, primary order 8. Added T.2 Matsumoto and T.5 real-sign prerequisites; finite L.7 maps and higher M.7 real maps are separated. |
| `symbol-wild-kernel` | corrected | Definition0.2, p.2: the generic kernel/lift API is correct and displays arithmetic map inputs. Added T.5 integer/rational K₂ suppliers for its tests; corrected omission ownership. |
| `global-moore-sequence` | verified | Lemma0.3, pp.2–3: positive middle group, finite-support symbols and dual twist invariant-sum target checked; real maps and inverse-limit hypotheses are explicit supplier inputs. |
| `primary-s-integer-moore-sequence` | verified | Corollary0.4, pp.2–3: S consists of primes above ℓ for unchanged primary integral group; full versus positive real terms use consistent maps. |
| `orders-of-symbol-wild-kernels` | verified | Corollary0.4, p.3: exact-sequence order identity includes the real factor only when ℓ=2 and i≡1 mod4; finite local factors are the full w_i primary orders. |
| `cohomological-wild-kernel` | verified | Equation0.5/notation0.6, p.3: strict L2 kernel, R02 H¹ finiteness/limit hypotheses and actual real cohomology tests checked. Generic change-of-S and section-limit identities do not assert arithmetic comparisons. |
| `symbol-cohomological-comparison` | verified | Proposition8.1/(8.2)/final diagram, pp.20–21: invert all dyadic primes, preserve the real i≡2 mod4 kernel C and the genuine comparison maps; the rejected misprint is not a hypothesis. |
| `special-number-fields` | verified | Definition5.2/Remark5.2.1, p.14: actual root witnesses in completion closures and exceptionality retained. All five APIs and four rational/quadratic tests match the source. |
| `special-dyadic-decomposition` | verified | Remark5.2.1/Lemma5.4/Corollary3.7, pp.10,14: exceptional odd-twist decomposition equivalence matches the actual stabilisers. Shapiro is existing; the rho₁ homology conclusion is honestly omitted at its supplier boundary. |
| `twisted-residue-norm-test` | corrected | Lemmas3.2/3.4/Remark3.4.1, p.9: faithful cyclic root-twist norm has the inversion exception, distinct from full-unit norm. Corrected omitted-signature ownership to M.2/ClassFieldTheory Layer0, matching prerequisites. |
| `hilbert-local-norm-certification` | verified | III.6.2.3–4, book pp.232–233/PDF240–241: finite Hilbert-symbol triviality uses the Kummer norm subgroup from local reciprocity, with valuation and units separate; real signs use the local-family supplier. |
| `cyclotomic-class-group-descent` | verified | Proposition4.1/Application4.2/Proposition6.8/(6.9), pp.11,16: matching S/T, m and ramification inversion, top-degree cd≤2 or positive hypothesis and norm/transfer maps checked. |
| `cyclotomic-divisible-image` | verified | Theorem4.5/Corollary4.6/Theorem6.11/Corollary7.5, pp.12–13,17–18: the image target is honestly conditional on G2 in the exceptional odd dyadic branch; no arbitrary prime selection is accepted. |
| `imaginary-nonexceptional-comparison` | verified | Proposition4.7/Theorem5.5(1), pp.13–14: odd-prime, even-twist and nonexceptional branches checked; exceptional nonspecial odd-twist branch retains G2. Example1.1.1 index slip separately recorded as E-N6-3. |
| `imaginary-special-obstruction` | verified | Lemma5.4/Theorem5.5(2)/Example5.6, pp.14–15: special odd twist gives index exactly two; Q(√−14) detects it, with no general splitting asserted and G2 retained. |
| `real-motivic-obstruction` | verified | TheoremB/Propositions7.6/7.8, pp.3,19: ordinary/positive/motivic carriers and real terms distinguished; G2 remains attached to the relevant image proof. |
| `hidden-real-k-classes-are-divisible` | verified | Proposition8.4/Lemmas8.5–6/Theorem8.7, pp.20–21: cyclotomic edge/d₂ and induced real transfer architecture uses dyadic inversion; C is divisible in the ambient field group. |
| `weibel-symbol-divisibility-theorem` | verified | TheoremA and §§4–8: target-level case assembly is correct for the symbol kernel, including hidden real classes. G2 is an explicit proof boundary; G1 is not smuggled into this theorem. |
| `raw-and-symbol-kernel-boundary` | verified | III.6.2.4 and VI.7.3/Warning7.5: degree-two torsion detection uses the uniquely divisible Moore kernel; higher local divisible primary torsion leaves exactly G1. Known VI.7.1 erratum E17 does not alter this argument. |
| `arithmetic-evidence-for-certificates` | verified | VI.9.9–11, book pp.522–525/PDF530–533 and parent certificate nodes: independent upper/lower bounds, full H² order and real factor 2^rho are required; extension data determine structure. |


## Suggested-file coverage and validation

The six owned definitions/constructions all have active signatures: two concrete numerical/number-field definitions and four generic constructions on additive or linear maps. All 34 API names are active: ten concrete and 24 generic. Each constructor has at least three mathematical tests. Twelve packet tests are active examples: four numerical, four special-field, three actual real cohomology, and one generic degree-four positive-subgroup test. Two additional examples check the full-unit finite-field norm boundary and distinguish group orders from generator rank. Neither is counted as a packet test.

The real examples use C₂ acting on actual p-adic integers with sign (-1)^(i+1). Odd-prime local H² is zero, dyadic odd i gives Z/2, and even i has zero integral H² despite a nonzero finite-level term. These are typed group-cohomology calculations, not supplied global H² carriers. The special predicate uses actual field automorphisms and completions, with exceptionality and all dyadic places retained.

The remaining 21 named arithmetic statements, the homology conclusion of `specialDyadicDecomposition` and nine packet tests are comments explicitly marked omitted. The active decomposition signature states only its actual field-stabiliser equivalence. The four generic constructors and 24 generic APIs still require the owner's arithmetic instantiations and displayed comparison/detection equations. In particular an abstract group of order 24 cannot replace the Q₂ quotient, and an arbitrarily zero group cannot replace WK₂(Q). The reader, packet's `suggestedCoverage` and final omission register agree on these limits.

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.6.json` reports **0 errors, 0 warnings**. The source-finding schema and source-version records were also checked with the existing validation functions. `lean-check research/blueprint/suggested/ArithmeticKTheory--N.6.lean` elaborates at the pinned Mathlib with exit code zero and only **56 `sorry` warnings**. Compilation checks the active interfaces and examples, not the omitted statements or any proof. The suggested file imports Mathlib modules only; the Tau Ceti unit-filtration declarations were separately checked at their exact pin.

The final path/content checks confirm only the four authorised deliverables, no source excerpts or private paths, unchanged node/API/test counts and unchecked implementation. There are no additional questions for the orchestrator. Preserve G1/G2 and the seven requests when assembling N.6; filling arithmetic omissions is future work, not a prerequisite disguised as an implementation completed by this review.
