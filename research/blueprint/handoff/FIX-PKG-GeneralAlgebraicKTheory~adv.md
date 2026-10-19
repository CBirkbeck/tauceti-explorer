# Handoff: FIX-PKG-GeneralAlgebraicKTheory~adv

Issue #10924; Codex — codex-rMyniu; 2026-10-19. The bot confirmed this session's claim against comment 6268388652. This submission repairs the package; it is not an independent review of this worker's own changes.

## Outcome and finding disposition

All eleven reported shape findings are resolved. The README retains all 166 target subsections and their mathematical construction contracts. Suggested.lean now contains only real-bodied light definitions over pinned carriers, four existence/milestone theorems for classifying spaces, and concrete checks. Heavy constructions remain roadmap work, rather than unfinished data used to type later claims. No arbitrary carrier parameters or hypotheses containing a desired conclusion replace the omitted constructions.

| Finding | Repair and retained specification |
|---|---|
| GAK-S1 | Removed HomotopyFibre.map and dependent Lean carriers; §1.2 retains path-pair topology, distinguished point, square maps, boundary, exactness and four fibre tests. |
| GAK-S2 | classifyingSpace_natTrans and classifyingSpace_equivalence are now theorems asserting Nonempty homotopy/equivalence data over Mathlib nerve realization; §1.1 retains the actual construction targets. |
| GAK-S3 | Removed loop-map and prespectrum constructions from Lean; §§1.2,1.7 retain based maps, loops, levels, maps, stabilization, fibres/cofibres and telescopes. |
| GAK-S4 | Removed QSpan/quotient/category development and every dependent declaration; §§2.1–2.6 retain span relations, composition, universal property, universes and K-theory. |
| GAK-S5 | Removed unfinished group operations, two-edge loop and comparison equivalence; §§2.4–2.5 retain the orientation, abelian structure and ExactK₀ comparison. |
| GAK-S6 | Removed scalar-extension functor/coherence data from Lean; §3.1 retains arbitrary associative unital rings, no flatness, finite-projective codomain, identity/composition and exactness. |
| GAK-S7 | Removed stable matrix quotient/group development and selected generators; §§3.3–3.4 retain stable colimit, elementary subgroup, block sum, functoriality and Whitehead. Finite inverse/commutator and integer-unit examples use existing matrices and units. |
| GAK-S8 | Removed the unfinished conflation exact structure; §4.2 retains the new componentwise structure on Tau Ceti's supplied ConflationCategory, with evaluation exactness and tests. |
| GAK-S9 | Removed triple/automorphism presentation development and unfinished homomorphisms/equivalences; §§4.15–4.17 retain relations, difference, maps, split-exact K₁ comparison and five-term boundary. Arithmetic difference examples pin orientation. |
| GAK-S10 | Removed Waldhausen, S and flag construction development from Lean; Layers 5–6 retain all axioms, restrictions, simplicial compatibility, latching conditions, standard flag checks, additivity and approximation/fibration. |
| GAK-S11 | Removed induced ring K-map and Nil functor data; §3.2 retains functorial higher ring K-theory, §9.8 retains forgetful/zero functors and their exact projective codomains. |

The closing Lean comment lists omitted construction families. Internal implementation helpers from the old file (e.g. ordinal intervals, matrix-representative setoids and relation generators) are covered by the precise corresponding README construction, rather than promoted to extra formalization targets. Existing supplier statements are cited, not reconstructed.

## Additional mathematical corrections

- §1.1: finite-poset contractibility detection explicitly requires nonempty C; the empty realization is a negative control. Nullhomotopy includes a constant value. The Lean theorem has the same hypothesis.
- §1.3: double-nerve swallowing points to Weibel IV Example 3.10.2 and Exercise 3.13 (p.IV.35), not Example 3.10.1 alone.
- §1.6: group-completion check uses an abelian group as a discrete symmetric monoidal groupoid and the completion map g↦g; it no longer ambiguously claims inversion fixes components.
- §6.18: the inclusion is homotopy equivalent over the base to the associated covering; its realization need not literally be a covering map.
- §§3.5,8.3,13.1–13.2: corrected the unitization/bimodule citations. II.2.7.2 is matrix Morita, whereas II.2.8 supplies the projective tensor functor; I Exercise 1.10 and IV.1.11.2 specify integral unitization, and IV.6.4 supplies products. The displayed product and block calculations are explicit new adapters. §§10.7–10.8 and 13.3 now use the verified chapter-PDF p.III.32 for III.4.4–4.5.
- §8.7: added relativeK.one_eq_classical for quotient maps with ideal-map naturality, sourced to Weibel IV.1.11.1 and Exercise 1.15. §10.12 first compares positive homotopy of the connective and Bass relative fibres by their long exact sequences, then uses this adapter and classical relative K₁ surjectivity to kill birelative π₀ as well as all negative groups. Removed the false suggestion of a possible π₀ cokernel here. Clausen–Mathew–Morrow Theorem 4.33 is about the cyclotomic-trace fibre; the relevant K-theory assertion is recalled in the proof of Proposition 4.34.
- §§9.1–9.2: named arithmetic twist/Koszul helpers, APIs and computed tests; the gluing and central-variable associative-ring generality remain explicit. Fixed the §9.3 hypothesis sentence.
- §9.10: explicit sum-resolution contraction using V⊕V₀→M and its two inflation inclusions; pullback projections can fail the required monicity. Added R²→R counterexample.
- §9.11: explained common kernel-lattice enlargement with fixed quotient, extending the chart calculation to associative coefficients rather than invoking a noncommutative scheme.
- §10.11: r-th Bass stage is zero below −r, agrees with K_j for j≥−r, and the next stage first exposes degree −r−1. This avoids the false Λ^(r−1) indexing in an input packet's old erratum discussion.
- §11.2: graph factorization of f:A→B is A↣B⊕I→B with an inflation A↣I; the projection's first summand is B.
- §§4.15,8.11,8.13,10.2,12.6,13.3: all new lightweight convention helpers have prose APIs and at least three concrete checks. Explicit target names were supplied for previously unnamed promised interfaces throughout the README. Added tests for the positive two-edge loop, quotient-refinement category, resolution subcategories, relative S, finite-resolution transfer, regularity/filtration, lattices, Laurent section and restricted completion.

## Sources and dependency audit

Read the complete package and its original Lean, the matching rejection report, the package-review instructions, protocol and expansion rules, reviewed library audit, and two full current upstream roadmap READMEs (AlgebraicTopology and GrothendieckEulerForms), with their representative Lean and relevant DGAInfinity layers. The package follows the exemplar form, including opening Summary, supplier contracts, numbered prose layers, definition APIs/checks and per-layer examples/dependencies.

The random sample used Python seed 10924 over the original 166 headings. All fifteen source locations below were opened and read; uncertain indexing, excision, contraction, graph and vanishing statements were checked additionally. Source results are restated in our own words; no passages or source files are committed.

| Sampled subsection | Read source and outcome |
|---|---|
| 12.11 | Schlichting 2003 Theorem 7.1 pp.14–15, Lemma 8.1 and Corollary 8.2 p.15, Theorems 9.1/9.3 pp.16–17; Neeman arXiv:2006.16536v2 introduction and §5. Unbounded derived category and noetherian all-negative scope confirmed. |
| 4.9 | Weibel V Claims 5.1.2–5.1.3 p.V.36; admissible layers have directed intersection/sum refinements. |
| 9.11 | Weibel V Lemma 7.3.2 p.V.54 and Lemma 7.8.1 pp.V.57–58. Fixed-quotient kernel enlargement is essential; associative chart extension explained. |
| 11.2 | Schlichting 2003 Remark 11.2 p.20 and Appendix A.5 p.25; wrote corrected graph factorization explicitly. |
| 8.3 | Weibel I Exercise 1.10 p.I.5, IV.1.11.2 p.IV.9 and IV.6.4 pp.IV.55–56; integral unitization/Tor and the displayed unital-product comparison confirmed. |
| 1.8 | May Chapter 25 §2 pp.221–223, definition and graded-ring lemma; suspension squares and integer sphere signs retained. |
| 7.1 | Waldhausen §1.5 p.342, biexact external pairing paragraph; pushout-product cofibration required. |
| 13.3 | Weibel II.2.7.1–2.7.2 p.II.12 and III.4.4 p.III.32; coordinate change distinguishes corner from diagonal. |
| 3.2 | Weibel IV.6.3.2 and §6.4 pp.IV.55–56; projective model, unital functoriality, opposite and filtered comparison confirmed. |
| 8.13 | Weibel V Exercise 5.3 p.V.38, §6.6.1 pp.V.41–42, IV Exercise 1.23 p.IV.17; right-module boundary normalization and left interchange sign retained. |
| 3.7 | Weibel IV Lemma 7.5 and Remark 7.5.2 pp.IV.62–63; product is pullback over C with summed kernel and unit identity extension. |
| 1.3 | Weibel IV.3.6/3.6.1 pp.IV.29–30, 3.10.1–2 pp.IV.33–34, E3.13 p.IV.35, §8.5.1 pp.IV.69–70; Waldhausen §§1.5–1.6 pp.339–346; corrected double-nerve locator. |
| 3.6 | Weibel IV.7.3 and (7.3.1) pp.IV.61–62; Q-extension morphism directions and fibre distinct from ordinary conflation maps. |
| 6.9 | Weibel V Theorem 2.2 p.V.13 and Remark 2.2.1 p.V.14; ambient admissible-kernel closure cannot be omitted. |
| 12.6 | Ranicki Proposition 3.1 pp.118–122 (PDF14–18), read page images including full matrix proof; odd top projector is 1−p and Euler formula [F,p]−[D_odd]. |

Additional direct reads include Schlichting 2002's complete six-page counterexample, Schlichting 2003 Appendix A and its completed-spectrum proof, Weibel III relative K₁ and negative-theory uniqueness, IV Bass construction and Exercises 1.15/10.1, Thomason Theorem 2.1/Lemma 2.2, and Keller Lemma 11.7/Theorem 12.1. The Keller full-faithfulness input is now read; it has its actual C1/C2 and boundedness scope.

Published deep results used as roadmap targets remain theorem targets, not claims already formalized: notably Suslin's integral finite-Tor excision criterion as stated in Weibel IV.1.11.2, and Schlichting's finite Artin counterexample. The original Suslin 1995 and EF82/ALPS85 calculation proofs were not independently reconstructed in this repair. The latter are used through Schlichting's proved counterexample, not through a claimed general-ring Bloch model or an unfulfilled K.5 source request. This source-reading limit is distinct from the resolved Lean shape findings.

Both existing input packet files were checked, unchanged: K.1 has 83 nodes and one recorded source gap; K.6 has 73 nodes and two recorded source gaps. Both checker runs report zero errors/warnings and status partial. This repair does not assert that those packet gaps or maintainer stage splits have been integrated. Maintainer follow-up: reconcile the older Bass-stage erratum with §10.11 and update the packets' Keller/source notes if desired; those files are outside this issue's deliverables.

The package's dependency order is acyclic: categorical tools → Q/plus → exact theorems → S/fibration → products → relative/projective line → Bass → Frobenius → cone comparison → continuity/enhanced invariance. The early cofinality is the monoidal split-exact theorem; general Waldhausen cofinality comes after fibration. No higher StableHomotopyKTheory or scheme roadmap is imported to construct an earlier K-theory carrier. Completed UniversalCovers is now an explicit supplied cover/classification/higher-homotopy interface, with its local hypotheses for CW realizations.

## Current-upstream and pinned-library comparison

Read-only current upstream: TauCetiRoadmap commit **0d144d044dacebca17b654695b6f1ad58f159b27**, current TauCeti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. Pinned elaboration: Mathlib **082e2d37e8**, TauCeti **f790474**. Searches covered mathematical objects and their defining operations, all current roadmaps and Completed, and specifically the nine roadmaps newer than the atlas snapshot plus ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. DGAInfinity, GrothendieckEulerForms, StablePeriodicCurved and Completed UniversalCovers were checked where the object searches found relevant overlap. The new AlgebraicVectorBundles affine equivalence was read and made an explicit boundary; its scheme theory is not a target here.

Read the actual supplying declarations rather than inferring from names:

- Mathlib nerve/nerveMap, realization and contractible-space/homotopy carriers; SerreClassLocalization abelian, isZero_obj_iff, isIso_map_iff, preservesFiniteLimits, preservesFiniteColimits and exactFunctor_comp_iff. Localization's additive/preadditive hypotheses are part of the supplied construction.
- Mathlib Module.Finite.exists_comp_eq_id_of_projective and Module.finrank_mul_finrank; the former supplies complements, the latter the finite-field transfer rank calculation. Deleted transfer_dimension from the representative Lean and cited the dimension identity only in supplier contracts.
- TauCeti ExactK0 and its generator/conflation/universal-property/map/transport statements, ConflationCategory and evaluations, IsFrobenius and current stable triangulation, finiteProjectiveModules and split exact structure.
- Current CategoryTheory.Equivalence.finiteProjectiveModulesEquivalence, isConflationExact_finiteProjectiveModulesEquivalence_functor and finiteProjectiveModulesK0Equiv; full-idempotent cornerEquivalence uses TwoSidedIdeal.span {e}=⊤. Higher comparison and non-full idempotent extension remain new targets, not duplicate module equivalences.

No Q-category, plus/Q identification, stable GL/Whitehead, S-construction, Bass spectrum or general negative K-theory implementation was found in those sources. Arithmetic Frobenius and operator spectra in other roadmaps are different objects. The old file's diagonalRank was an unnecessary arithmetic wrapper and is replaced by a direct negative-control example.

## Every-subsection adversarial pass

Each row covers the subsection's defining data, identities, theorem hypotheses, stated API and Checks together. Cases listed were computed or compared with the cited source; they are not formal proofs of the roadmap. Generic category/ring targets were tested on zero objects/rings and low ranks; characteristic two, equal/mixed-characteristic DVRs, empty categories, nonempty matrix indices and noninjective filtered maps appear where relevant. A numeric q=1 or compactness test is inapplicable to targets with no such parameter. “Retained” means the scoped claim survived these tests, not that a sorry proof proves it.

| Statement(s) | Instances, result and change |
|---|---|
| §1.1 Homotopies from functors | Point, discrete pair, empty category, [1]; the first and last contract, the pair and empty space do not. Added nonemptiness and explicit map API. |
| §1.2 Based homotopy fibres | id_X, point→Y, X→point, inclusion into two discrete points; fibres are contractible, ΩY, X and point respectively. Retained path direction and nullhomotopy. |
| §1.3 Bisimplicial realization and subdivision | Singleton, discrete pair, [1]; diagonal/iterated realization preserve components and subdivision preserves interval. Corrected swallowing locator to IV E3.13. |
| §1.4 Comma categories and Quillen’s criteria | Adjunction, inclusion in a discrete pair, initial vertex of [1]; comma fibres distinguish the valid A/B hypotheses from strict fibres. Named both dual criteria. |
| §1.5 Acyclic maps and the plus construction | P=1, perfect π₁ with H₂≠0, circle; plus is identity in the first case and cannot erase the latter obstructions. Local coefficients retained. |
| §1.6 Symmetric monoidal group completion | ℕ, ℤ, free modules over k×k; completion gives ℤ, fixes 1 in ℤ, and has diagonal K₀ image. Corrected abelian group completion check. |
| §1.7 Sequential spectra and stable exact sequences | Zero spectrum, E→0, Hℤ telescope under 2; zero, suspension shift and ℤ[1/2] agree. No set-union telescope assertion. |
| §1.8 Stable pairings and the sphere sign | Degrees (1,1), (1,2), (−1,1), characteristic two; signs −,+,− and −1=1 in 𝔽₂. Odd squares only 2-torsion; Lean witnesses. |
| §2.1 Exact categories and Quillen's category Q(A) | Zero/whole subobjects of k, ℤ→ℤ/2 in split exact structure, invertible span; two arrows remain distinct, ordinary epi is excluded, automorphisms retained. |
| §2.2 The universal property of Q(A) | Identity/zero functor and non-bicartesian square over k; identity distinguishes the two subobjects, zero identifies them, false square relation excluded. |
| §2.3 Small models, transport of the exact structure and independence | Equivalent finite-projective models, zero category, changed zero object; transported higher groups agree without identifying carrier universes. Named small model target. |
| §2.4 The fundamental group of the Q-construction is the Grothendieck group | 0, k, k↣k²↠k; loop class 0,1 and 2=1+1. Reversing loop gives −1; algebraic ExactK₀ remains a supplier. |
| §2.5 The K-groups of an exact category | Zero category, field, component −1; groups zero for zero, π₀ΩBQ=ℤ for field, negative virtual class retained although BQ connected. |
| §2.6 Elementary properties: opposites, finite products and filtered colimits | Product with zero, two fields, constant and noninjective filtered diagrams; product K₀=ℤ² and finite equations descend. No infinite-product claim. |
| §3.1 Scalar extension as an exact functor of finitely generated projectives, without a flatness hypothesis | ℤ→𝔽₂, projective ranks 0/1, k→M₂k; split exactness survives nonflat extension and diagonal K₀ multiplier is 2. Arbitrary module monos need not survive. |
| §3.2 The early ring model: functorial connective K-theory of unital rings | Zero ring, k×k, identity and noninjective stages; K(0)=0, K₀(k×k)=ℤ², maps compose and finite idempotents descend. Right modules use opposite comparison. |
| §3.3 Stable matrices and elementary transformations | Rank 0, e₁₂(0), inverse parameter ±1, ordered three-index commutator; identity stabilizes, inverse uses −1, commutator gives e₁₃. Direct Lean matrix checks. |
| §3.4 Whitehead’s stable commutator theorem | Field, integer unit −1, E₂(𝔽₂); determinant quotient retained, −1 has order two, finite E₂=S₃ not perfect. Stable third index essential. |
| §3.5 Idempotent extension for nonunital maps | Zero map, identity, rank-one corner; eB is respectively zero, B, first-row projective. No fullness silently imposed. |
| §3.6 The Q-extension category | Zero quotient, split k extension, nonzero kernel; fibre at zero is Core(A); Q-kernel arrow is reversed while middle arrow is covariant. |
| §3.7 Monoidal products in the extension fibres | Zero extension, split k extension, two rank-one kernels; unit extension works and fibre-product kernel rank is two. Split exactness retained for equivalence. |
| §3.8 Cartesian extension lifts | Identity Q-span, zero inflation, reversed deflation; cartesian lift identity and enlargement directions match the Q factorization. |
| §3.9 Contractibility of the localised extension-action category | Zero quotient, split k quotient, disconnected arbitrary action; the specified connected action contracts, arbitrary action does not supply cancellation. |
| §3.10 The localised extension category fibres over Q | Identity base change, zero base object, rank-one quotient; localized fibres compare coherently through split extensions, as Theorem B requires. |
| §3.11 Contractibility of extensions | Zero category, 0↣X and split category; initial zero contracts inflations; only the constructed localized extension total is claimed contractible. |
| §3.12 The plus-equals-Q theorem | Zero ring, field, k×k; plus describes positive component while K₀ records all projectives, rather than just free rank. |
| §3.13 Projective complements and cofinality | Zero projective and (k,0) over k×k with complement (0,k); sum free, diagonal free K₀ image proper. Supplied retract theorem cited. |
| §3.14 Early absolute K0/K1 comparison for rings | Zero ring, units 1 and −1, scalar extension; π₀ generator fixed, [1]=0, [−1] has order two. No ring-general K₃ presentation. |
| §3.15 What the product description does not say | Virtual component −1 over a field and zero ring; component choice cannot be a projective representative in general or a natural spectrum splitting. |
| §4.1 The 3×3 lemma for exact categories | Zero 3×3 diagram, split vector-space rows and nonzero proposed middle composite; exact cases pass, non-complex excluded explicitly. |
| §4.2 The exact category of conflations | Zero conflation, k↣k²↠k, one bad column; three component conflations required. Underlying conflation category is supplied; exact structure new. |
| §4.3 The Additivity theorem | Zero functor, split rank-two sequence, two-step filtration; 2=1+1 and alternating identity hold with exact quotient functors. |
| §4.4 Length-one resolution comparison | P=H, DVR torsion, dual-number simple; identity and length-one DVR resolution qualify, projective covers without finite resolution do not. |
| §4.5 Resolution dimensions and successive exact subcategories | Resolution lengths 0/1/2, ℤ/2, dual-number simple; H₀=P, ℤ/2 in H₁ not H₀, infinite-resolution simple absent from union. Added three checks. |
| §4.6 The Resolution theorem | Field, DVR, dual numbers; finite projective resolutions qualify in first cases; simple dual-number module is excluded. |
| §4.7 The actual two intersection functors in dévissage | Zero layer, single B-layer, length-two module; intersections and quotient closure preserve B; no exact functor of successive composition factors invented. |
| §4.8 The Devissage theorem | Finite-length k[t]/t² modules with B=k-spaces, B=A, B=0; factors have k-filtration, identity works, B=0 only qualifies for zero A. |
| §4.9 Isomorphic quotient comma models | B=0, B=A, rank-one layer; quotient-isomorphic models and admissible-layer refinements give the stated comma equivalences. Source Claims 5.1.2–3 read. |
| §4.10 Models of a quotient object with kernel functor | N=0, identity model of N, model with kernel k; kernel remains in B and is not discarded by quotient-isomorphism condition. |
| §4.11 Epimorphic kernel equivalence | Identity epi, zero target, kernel rank one; kernel functor and the pushout contraction preserve admissible arrows. |
| §4.12 Epimorphic models suffice | Identity model and models with proper image; epimorphic submodels compare by image refinements, not arbitrary non-epi arrows. |
| §4.13 Filtered quotient models | B=0, B=A, and rank-one rational representatives 1/2,1/3; zero/terminal models and common target 1/6 with integral maps 3,2. Added the category/forgetful/quotient-isomorphism API and three checks; isomorphisms alone fail. |
| §4.14 Serre localization | B=0, B=A, finite-length torsion in a DVR; fibre is zero, whole K(A), or torsion K respectively; K₀ quotient is onto. |
| §4.15 Relative triples for an additive functor | T=id, T→0, inverse triple and integers (2,1)/(1,2)/(1,1); relative difference +1,−1,0. Lean convention checks added. |
| §4.16 Stable automorphism boundary | Identity/inverse automorphism, diag(u,v), zero category, integer −1; composition maps to addition and determinant to uv; split exact scope retained. |
| §4.17 The classical five-term sequence of an additive functor | T=id and T→0; identity fibre vanishes and latter relative group is split K₀. Summand-density hypothesis retained for the boundary. |
| §5.1 Waldhausen structures and extra axioms | Zero category, exact category with isomorphisms, all maps weak; Waldhausen gluing and extra saturation/extension remain distinct hypotheses. |
| §5.2 S-diagrams and latching cofibrations | n=0/1/2, flag 0↣k↣k², one failed latching mono; quotient data and latching cofibrations are required. No bare pointwise criterion. |
| §5.3 Isomorphic functors on object S | Identity iso, zero functor, noninvertible transformation; simplicial object-S homotopy only asserted for exact natural isomorphisms. |
| §5.4 The simplex fibres in Waldhausen additivity | Zero quotient, split rank-two flag, simplex faces; pullback fibre records selected subobject and quotient, not arbitrary flags. |
| §5.5 The pushout contraction of an additivity fibre | v constantly 0/1 and a single switch; pushout comparison gives identity endpoint and constant split endpoint, preserving relative cofibrations. |
| §5.6 Object S-additivity | Zero category, split k² flag, n=1; object-S additivity recovers subobject and quotient ranks (1,1), not middle rank alone. |
| §5.7 The K-theory space of a Waldhausen category | Zero C, exact k-spaces, all weak maps; K(0)=0, k-spaces have K₀=ℤ, all-weak K-space contracts. |
| §5.8 Edgewise S/Q diagrams | n=0/1, zero flag, 0↣k↣k²; opposite edge and quotient orientation give actual Q-span; subdivision is essential. |
| §5.9 Comparison of the S-construction with the Q-construction | Zero exact category and k-spaces; S and Q give same component rank without confusing weak isos with all maps. |
| §5.10 Additivity for Waldhausen categories | Zero sequence and split k↣k²↠k; induced K-map of middle equals sum; exactness in weak-map diagram directions retained. |
| §5.11 Relative S-delooping and spectra | F=id, 0→C, C→0; relative fibres contract, give ΩK(C), give K(C). Added checks pin double loop and extra component. |
| §5.12 Non-functorial Waldhausen factorizations | Zero category, complex mapping cylinder, vector spaces with only isomorphism weak maps; existence holds in first two and fails for k→0 in last. |
| §5.13 Cofibrant diagrams on a finite poset | Empty poset, singleton, two-point chain, noncofibrant diagram; empty colimit zero, singleton ordinary cofibrancy, structural latching condition retained. |
| §5.14 Swallowing a second weak-map nerve direction | A=identities, A=B, groupoid; swallowing contracts redundant direction without asserting every unrelated nerve contractible. |
| §6.1 Trivial-cofibration comparison | Zero category, mapping cylinder, only-isomorphism weak maps; comparison needs cylinder and saturation, not mere wide-subcategory inclusion. |
| §6.2 Relative S-localization comparison | v=w, all-weak w, n=0/1; relative S identifies the w-cofibration strings with correct acyclic fibre. |
| §6.3 The Waldhausen localisation (fibration) theorem | v=w and all-weak w; fibres zero and whole ordinary K respectively. Saturation, extension, cylinder retained. |
| §6.4 Approximation lifts filtered objects | Filtration length 0/1/2 and identity F; induction starts at zero and attaches through pushout cofibrations. |
| §6.5 Iterated mapping cylinders of a simplex diagram | Simplex dimension 0/1/2, zero complex; iterated cylinder records face-compatible weak maps, unlike unrelated objectwise cylinders. |
| §6.6 Cylinder extension over boundaries | Empty boundary, one edge and triangulated circle; finite compatible cylinder attachments extend the comma diagrams. |
| §6.7 Cylinder comma contractions | Identity F and zero target with approximation; comma contraction uses the constructed common cone, not an assumed equivalence. |
| §6.8 The Approximation theorem | Identity equivalence, zero categories, failure of reflection; App1 and App2 are separately required. |
| §6.9 The Gillet-Waldhausen comparison | Field, DVR resolution, non-closed embedding of exact category; admissibly acyclic and ambient-acyclic agree only under stated closure. No blanket ambient claim. |
| §6.10 Finite-poset factorization | Empty/singleton poset, arrow and noncofibrant X; relative latching colimits are constructed during induction, not assumed for arbitrary X. |
| §6.11 Contract the approximation comma categories | Point/finite chain diagrams, zero target; App2 cone and saturation make comparison pointwise weak. Nonemptiness comes from App2 on zero. |
| §6.12 Approximation with factorizations | Identity F, zero categories, no functorial cylinder; existential source factorization suffices, target factorization not introduced. |
| §6.13 Acyclic-cofibration comparison | Zero object, identity and cone maps; only factorization and saturation are used in comparison, not an assigned cylinder. |
| §6.14 Fibration with factorizations | v=w and all-weak w; correct fibres with existential factorization. Extension and saturation still required. |
| §6.15 Weak equivalences detected by a Grothendieck quotient | G=0, even-rank subgroup of ℤ, zero object; equal classes define weak arrows and equality in quotient is essential. |
| §6.16 The class-weak S-construction realizes the quotient group | n=0/1/2 and quotient G=ℤ/2; S-increments give 0, one and two increments with BG realization rather than discrete G. |
| §6.17 Cofinality with non-functorial factorizations | G=0 and parity quotient ℤ/2; positive K unchanged and K₀ image subgroup; quotient is discrete only after looping. |
| §6.18 Cofinality and K₀ | Identity inclusion, free objects in k×k-projectives, idempotent completion; positive invariance with proper diagonal K₀ image. Covering assertion corrected to equivalence over base. |
| §7.1 The bisimplicial S-grid of a biexact functor | Zero functor, tensor of ranks 2 and 3, pair of cofibrations; S-grid gives rank 6 and requires pushout-product cofibration. |
| §7.2 Stabilization of pairings | Stage 0/1/2 and zero input; compatibility with structure maps makes pairing independent of chosen stages. |
| §7.3 Transport biexact natural isomorphisms to pairing homotopies | Identity iso, associator, swap of two degree-one inputs; natural homotopies transport coherence with sphere sign. |
| §7.4 External products from biexact functors: the K-theoretic pairing and its coherence | Ranks 0/1/2, commutative/noncommutative coefficients; external pairing available generally, internal ring multiplication needs commutativity. |
| §7.5 The total K-group is a graded-commutative ring | Degrees 0/1/2 and 2-torsion; interchange sign +,−,+, and odd square killed by 2 rather than declared zero. |
| §7.6 Units and the K₀ tensor comparison | Rank 2×3, unit 1, inverse unit; K₀ product 6, [1]=0, inverse unit negates degree-raising operation. |
| §7.7 Transfer maps and the projection formula | Identity, finite inseparable field degree d, ℤ→𝔽₂; transfer values 1,d,0. Finite resolution and commutative projection formula scope explicit. |
| §7.8 Base change of a finite field transfer through an Artin algebra | Separable product, inseparable local algebra, identity field extension; lengths count multiplicities, including nonreduced tensor product and infinite F′/F. |
| §8.1 Relative K-theory as a homotopy fibre | id_R, R→0, 0→R; fibres contract, give K(R), give ΩK(R). Component group and coker K₀ in relative-S retained. |
| §8.2 Relative K-theory is not support K-theory | I=0, I=R, DVR residue quotient; relative quotient fibre distinguished from support localization; no support equivalence inferred. |
| §8.3 Nonunital rings, the unitisation and the comparison with the unital theory | I=0, unital I and square-zero I; augmentation fibre zero, product decomposition for unital I, positive excision not automatic. |
| §8.4 Projective patching and its clutching boundary | g=1, rank zero, shear g and inverse, cusp conductor square; orientation x=g y gives (1,1), inverse (−1,1). Lean witnesses. |
| §8.5 Milnor's sequence is exact at the pair of K₁-groups | Identity pullback, zero corner, stabilized elementary correction; surjective chart permits elementary lifting and exactness at middle K₁ only. |
| §8.6 Milnor Mayer–Vietoris | Identity square and conductor square; matching differences and clutching boundary give six-term segment, not full positive Mayer–Vietoris. |
| §8.7 Relative projective triples are components of the K-fibre | id_R, R→0 and I=0; relative triple class and classical relative K₁ adapter agree. Added named adapter with IV E1.15. |
| §8.8 Ideal K-zero through the augmented-ring patching square | I=0, I=R and square-zero ideal; augmented ring is R, R×R, or retains cross terms respectively. Kernel comparison orientation fixed. |
| §8.9 Degree-zero ideal excision | I=0, I=R and ideal-identifying map; K₀ excision holds without Tor vanishing; positive equivalence not inferred. |
| §8.10 Excision holds under hypotheses, and fails without them | Zero ideal, unital ideal, nonzero square-zero ideal; Tor groups vanish in first two, Tor₁=I in third. Integral criterion kept distinct from rational/bar formulations. |
| §8.11 The degree-one index | DVR uniformizer, unit, dual-number ε, class pairs (0,1)/(1,0)/(1,1); index +1,0,0 and arithmetic +1,−1,0. Kernel term essential. |
| §8.12 The DVR boundary is the normalized valuation | DVRs ℤ_p and k[[π]], unit and π^m for m=−1/0/1; boundary normalized valuation, with no mixed-characteristic restriction. |
| §8.13 Transport the right product action through the localization boundary | j=0/1 and n=1/2/3; right module sign +, left odd sign −, uniformizer-last +,−,+. Lean examples pin sign. |
| §9.1 The projective line over an associative ring, as a gluing category | Zero ring, u₀/u₁/u₂, twist exponents (0,1)/(1,1)/(2,−1); cohomology (R,0)/(0,0)/(0,R), exponents −1,0,3. |
| §9.2 The two-chart Koszul sequence | t=0, t=2 over ℤ and characteristic two; (t,−1) then (1,t) composes to zero and second map onto. Added helper API and Lean witnesses. |
| §9.3 Eventual regularity and projectivity of sections | Zero bundle, u_i, finite-projective summands; eventual bound depends on gluing and inverse while tensor/cohomology statement uniform in N. |
| §9.4 Regularity and global generation on the two charts | u₀(P), u₁(P), u₋₁(P); first regular, second nonregular for P≠0, third generated with nonregular kernel. Added three checks. |
| §9.5 The canonical resolution of a regular gluing bundle | u₀(P), u₋₁(P), nonzero u₁(P); (T₀,T₁)=(P,0),(P²,P), last excluded from MR. Kernel conflation stays in VB. |
| §9.6 Regular bundle filtration | F=u₀(P), n=0/1/−r; membership follows decreasing index, not increasing. Added checks for filtration orientation. |
| §9.7 The K-theory of the projective line over a ring: K(R) × K(R) ≃ K(P¹_R) | Zero ring, field, two line generators; K₀ pair independent and 2u_{i+1}=u_i+u_{i+2} matches Koszul signs. |
| §9.8 The Nil category of a ring and the Nil groups | Zero endomorphism, nonzero nilpotent Jordan block, identity; first two qualify, identity on nonzero module does not. Reduced Nil differs from whole K(Nil). |
| §9.9 The resolution diagram for chart localization | M=0, K=0,V=Q and nonzero minus chart; h sees torsion M, f sees quotient Q; support condition not discarded. |
| §9.10 Contractibility of the resolution fibres | M=0 with V=V₀=R, zero bundle; sum inclusions monic, pullback projections R²→R not monic. Replaced vague refinement argument by explicit contraction. |
| §9.11 Directed bundle lattices | Zero quotient, split kernel-plus-quotient extension, two denominator bounds; common enlargement changes kernel only and leaves fixed quotient Q. Explained associative chart argument. |
| §9.12 Projective-line localization | Zero torsion and characteristic t resolution; h/f equivalences give minus-chart fibre, and additive inverse sign retained. |
| §9.13 Localisation at t: the sequences through R[t] and through P¹_R | Zero ring, t as central nonzerodivisor, nilpotent module P_ν; length-one t-resolution identifies torsion category with Nil category, not arbitrary torsion modules. |
| §9.14 The Nil inclusion factors through the forgetful map on K-theory | ν=0, P=0 and ν²=0; characteristic sequence gives u₀−u₁ times forgetful map; reduced Nil summand maps trivially. |
| §9.15 Nil_n(R) ≅ NK_{n+1}(R) | Field and dual numbers; NK of field zero, unit 1+εt detects possible nonzero Nil₀ via shifted NK₁. Index shift is +1. |
| §9.16 The positive Fundamental Theorem | n=1, regular field, nonregular dual numbers; boundary reaches K₀ and both Nil terms remain for general ring. |
| §9.17 The t-class section | x=0,[R],[R²], inverse t; section boundaries 0,1,2,−1. Positive t-first convention pinned by index/shear arithmetic. |
| §10.1 Flasque rings, infinite sum rings and the Eilenberg swindle | Zero ring, field, row-and-column-finite cone; zero swindle works, field impossible by [k]=1, cone swindle preserves finite-support ideal. |
| §10.2 Contracted functors and the contraction LF | Constant ℤ functor, field K₀, integer chart pairs (1,1)/(1,0)/(0,1); diagonal/difference gives 0,+1,−1, sum would fail. Lean witnesses. |
| §10.3 Bass's negative K-groups | Iteration 0/1/2, zero ring and unitization split; supplied K₀ at zero and L-iteration, not negative homotopy of a space. |
| §10.4 Contraction of negative groups | Field, zero ring, first contraction; LK₁=K₀ gives ℤ for field although LK₀=0. Section obtained before negative induction. |
| §10.5 The Fundamental Theorem with Nil terms, in every degree | Degrees 1/0/−1, field and dual numbers; both NK summands retained; negative terms agree through contracted functor induction. |
| §10.6 Morita invariance | Matrix sizes 0/1/2 and nontrivial invertible module; n=0 excluded, Morita preserves higher additive groups but not arbitrary internal ring units. |
| §10.7 The axioms a theory of negative K-theory must satisfy | I=0, I=R, diagonal versus corner k→M₂k; sequences identity and zero, corner class 1 versus unital diagonal 2. Nonunital functor required. |
| §10.8 The cone proof of uniqueness for negative ring theories | Cone of zero ring and cone of field; shift E_j(SR)=E_{j−1}(R) consistent and uniqueness relative to degree-zero/boundary data. |
| §10.9 Mayer–Vietoris for a Milnor square, continued into negative degrees | Identity Milnor square, zero quotient, conductor square; downward exactness follows contractions, not false positive excision. |
| §10.10 The nonconnective Bass K-theory spectrum | Connective stage, first Bass stage and zero ring; construction exposes one new negative degree per Λ and preserves nonnegative groups. |
| §10.11 The homotopy groups of the Bass spectrum are the K-groups and Bass's negative groups | r=0/1/2, j=−r and j=−r−1; old stage zero below −r; next stage first exposes contraction. Corrected packet-stage indexing explicitly. |
| §10.12 Nonpositive Milnor excision | I=0, I=R and ideal-identifying map; relative π₁ surjective plus nonpositive isos kills birelative π₀. Corrected citation and previously false possible π₀ residue. |
| §10.13 Vanishing of the negative K-groups for a regular noetherian ring | Field, DVR, noetherian finite-global-dimension ring, singular ring; negative groups vanish in stated scope, singular converse not asserted. |
| §11.1 Frobenius categories, Frobenius pairs and their derived categories | Identity pair, zero inclusion, two-term identity complex and degree-zero k; derived quotient zero in first two, acyclic/nonacyclic complexes distinguished. |
| §11.2 Existential factorization in a Frobenius pair | f=id_A, A→0 and A→B; graph lands in B⊕I and projection is stable equivalence. Corrected graph target explicitly, no functorial choices assumed. |
| §11.3 Stable classes modulo a dense triangulated subcategory | Dense even-Euler subcategory of Dᵇ(k), zero and shifted k; quotient class group ℤ/2 and shift negates class. |
| §11.4 The K-zero criterion for a dense triangulated subcategory | H=0, H=K₀T, parity subgroup; [X] membership classifies dense subcategory and does not mean X=0. Thomason 2.1–2.2 read. |
| §11.5 Flasque enlargement and suspension | Zero pair, cone identity and one suspension; flasque enlargement K vanishes and boundary shifts exactly one degree. |
| §11.6 The set-up: negative K-groups of a triangulated category with models | Zero derived category, identity pair map, non-idempotent-complete model; degree zero uses completed derived category, not naive K₀. |
| §11.7 Negative localization | Identity exact sequence and zero terms; connecting map has degree −1 and exactness retains cofinal quotient condition. |
| §11.8 Additivity and filtered colimits for the negative groups | Zero conflation, split pair of maps, constant filtered diagram; induced sum and continuity hold for actual model maps. |
| §11.9 The weak inflation replacement of an exact functor | Identity F, zero models and a non-weak inflation; replacement retains specified weak inflation and equivalent derived maps. |
| §11.10 Strictify the roof diagram for dual approximation | Identity roof, nonidentity denominator and dual orientation; lifting requires a common refinement and cannot invert arbitrary maps. |
| §11.11 Derived invariance through the replacement and approximation | Identity pair equivalence and equivalence without specified model map; theorem applies only to former enhanced data. |
| §11.12 Cofinality of Frobenius models | Identity and dense parity inclusion; positive K unchanged with K₀ subgroup image. Full faithfulness/cofinality retained. |
| §11.13 Fibration for nested Frobenius weak classes | D₀=D₁, D₀=0 and whole thick subcategory; nested weak classes give correct trivial and total fibres. |
| §11.14 The completion comparison and the homotopy groups of IK | Identity pair, zero pair and completion with new K₀ classes; positive homotopy unchanged, completed π₀ may differ. Ω-spectrum assertion uses completion. |
| §11.15 Localization of the Frobenius IK spectra in all degrees | Zero terms and identity quotient sequence; spectrum fibre includes nullhomotopy and exactness across degree zero uses completion. |
| §11.16 Exact-category spectra and invariance | Idempotent-complete P(R), noncomplete additive category and zero exact category; positive Quillen groups recover, naive K₀ need not recover without completion. |
| §12.1 Karoubi’s direct filtration in the discrete additive case | A=0, A=U, finite truncations and unrestricted column-finite matrix; quotient U, zero, and controlled finite factorization respectively. Uncontrolled first row fails. |
| §12.2 The finite-defect index and the cone boundary | Zero defect, complementary projectors, free k×k diagonal image; index coker−ker; (1,0) not diagonal. Lean negative-control witness. |
| §12.3 Karoubi’s derived groups from a flasque cone | Zero category, cone category, first suspension; swindle and completion-corrected K₀ yield correct negative shift. |
| §12.4 Compare Karoubi’s negative groups with Bass contractions | Field, zero ring, central polynomial variable; Bass/cone groups agree naturally; discrete summability means finite support, not analytic series. |
| §12.5 Finite domination of a chain complex | Identity domination, contractible complex, merely homotopy-idempotent fg; first two valid, last not an actual Karoubi object. |
| §12.6 Turn finite domination into a finite idempotent complex | Support 0/1/2, p=0/1 and Euler ranks 2,3; even p, odd 1−p, Euler −1. Ranicki full matrix proof inspected in page images; Lean parity witnesses. |
| §12.7 Return from restricted completion | Degree-zero A-object, projective (k,0), contractible identity on it; image criterion passes first/third and fails second. Added three checks. |
| §12.8 Lift a quotient complex through a Karoubi filtration | Zero differential, two successive maps with composite factoring through A, contractible quotient; finite corrections make d²=0, arbitrary raw lifts do not. |
| §12.9 Karoubi complex approximation | Identity filtration, zero quotient, A-dominated acyclic complex; fibre uses restricted completion A^H rather than bare A. |
| §12.10 Cone–Frobenius comparison | Idempotent-complete projectives, zero category and later suspension; cone/Frobenius comparison retains completion at every stage. |
| §12.11 Agreement and vanishing | Field, DVR, noetherian abelian category and Neeman abelian counterexample; all-negative vanishing needs noetherianity, K₋₁ obstruction uses unbounded D(E). |
| §13.1 The nonunital extension of the Bass spectrum | I=0, unital ℤ and corner; augmentation fibre zero, K(ℤ), and unitization coordinate diag(c,z), respectively. |
| §13.2 Nonunital idempotent extension | h=0,id and corner; idempotent tensor functor is zero, identity and rank-one corner, agreeing under augmentation-fibre equivalence. |
| §13.3 Corner embeddings become identity under matrix Morita | Matrix indices 1/2, unit coordinates (1,1)/(1,0)/(0,1); diag(c,z) preserves one and Morita-normalized corner is identity. Lean three checks. |
| §13.4 Filtered continuity and products | Product with zero, two fields, constant/noninjective filtered diagrams; finite products and finite-data descent work; infinite products not asserted. |
| §13.5 Filtered continuity of the nonunital Bass spectrum | Zero diagram, corner matrix union and nonunital transition; unitization filtered colimit and exact spectrum fibres give the actual corner map equivalence. |
| §13.6 Derived invariance needs an enhancement, not a triangulated equivalence | Identity DG model map, Morita bimodule with inverse, bare triangulated equivalence; only enhanced maps supply K-equivalence, last explicitly insufficient. |
| §13.7 Relative and transfer compatibility | Degrees 0/1/−1, identity transfer and unit action; integer sphere signs and relative module boundaries extend without assuming commutativity of arbitrary rings. |
| §13.8 Two Artin module models with equivalent triangulated stable categories | Odd p, p=3 examples and p=2 excluded; both Artin stable module models have simple 𝔽_p and suspension identity, no mixed model comparison. |
| §13.9 The K-theory fibration for each Artin stable module model | Projective, zero and simple Artin module; acyclic fibre is projective K and module K is G(𝔽_p), without replacing connective stable model by completed IK. |
| §13.10 A triangulated-invariance counterexample | p=3 and odd p; ℤ/9 has an element not killed by 3 while (ℤ/3)² does not. Published finite-ring counterexample used in its stated scope; Lean exponent witnesses. |

## Lean, structure and submission checks

Suggested.lean: **231 lines**, 13 light definitions/abbreviations, 4 theorems and 46 examples. No new construction carriers, sorry-bodied data, arbitrary replacement groups, True placeholders, #print axioms, lake builds or language server. The final lean-check exited **0**, with **7** warnings, all declaration uses sorry; no errors or other warnings. Available memory was 83 GB before checking and only one elaboration ran at a time.

The four classifying-space signatures and all thirteen light definitions were compared with their README hypotheses and tests; general ring helpers use Ring rather than CommRing where valid. The homotopy-equivalence and homotopy statements assert existence (Nonempty), so no unfinished data operations enter later signatures. Every retained named declaration occurs in the README. The integer corner helper is explicitly a computed specialization of the general ring target, not a restriction of that target.

Structural check: all **166** original target headings retained, every subsection has a named interface, source locator and Needs paragraph; definition sections have at least three discriminating checks. README mathematics and all new source descriptions use own words. Source files remain outside the repository.

Checks run: lean-check; check_blueprint.py on both original packets (zero errors/warnings); intake.py check-files on the four deliverables (zero problems); git diff --check. The independent submission check remains the final intake authority. No other job was claimed; nothing outside the four authorized paths is included.

## Source versions for reproduction

Accessed 2026-10-19. SHA-256 identifies each public PDF actually used for the sampled and corrective reads; chapter PDFs use chapter pagination. Full source text is not retained in the repository.

| Source | Public URL | SHA-256 |
|---|---|---|
| weibel-I | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf) | `f9662904b3f3477a05025175f1f8fd2d063156d6599f6b806137cbb2cc61fd76` |
| weibel-IV | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| weibel-V | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) | `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8` |
| weibel-II | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf) | `529ea8a5853e9fa55279e7ad79047155409b10847bd924b56f708f0950ebc607` |
| weibel-III | [PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307` |
| schlichting-2002 | [PDF](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlk.pdf) | `6c7db56e5fa5f05bd55e0dae8f81c7952356eadf925c0e03d2ab5e252ede7ee9` |
| schlichting-2003 | [PDF](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlneg.pdf) | `f59620e3ba25d5a8591a108d2b9647b68b5caf04794745862d2aa71e178b5aa6` |
| waldhausen | [PDF](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf) | `2f452696998132a438fe7596deb681fefcf829829b4604ca1029083e4dcb1c6e` |
| may | [PDF](https://www.math.uchicago.edu/~may/CONCISE/ConciseRevised.pdf) | `6724f02748ed1f2f589a72b524d2e3f08758abbe8216f16e5e6ffd22ebdc8927` |
| quillen | [PDF](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf) | `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04` |
| ranicki | [PDF](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/finite.pdf) | `2882abe515b8fa191a120a28dcbb555ec84e28da7b075cf3bc788078e08ca4b8` |
| keller | [PDF](https://webusers.imj-prg.fr/~bernhard.keller/publ/dcu.pdf) | `7659d64ae88d44f7596c606d73da56fa0a426b25b354cc6da69ba988ee25abee` |
| cmm | [PDF](https://arxiv.org/pdf/1803.10897v2) | `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c` |
| neeman | [PDF](https://arxiv.org/pdf/2006.16536v2) | `3d168bb7501f0cbb43e665bd78a9a183ebc4b8a4c9f0f358a3b35e6b970ca3e1` |
| thomason | [PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8FA43E2F659E004A21FE2F0652743CE8/S0010437X97000067a.pdf/classification_of_triangulated_subcategories.pdf) | `e28914a9c3f39d808f34bfaee4bf96ae1d92801cd04e4968f14669acb2ee88af` |
