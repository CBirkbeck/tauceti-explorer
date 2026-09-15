# Euler systems, Kolyvagin systems and higher-rank descent

## Scope and canonical ownership

This is the general descent roadmap, over number fields rather than only over Q and for finite-free p-adic representations rather than only Tate modules of elliptic curves. It supplies rank-one Euler/Kolyvagin systems, core-rank methods, higher-rank Stark systems over principal Artinian rings and DVRs, and exterior-bidual refinements over commutative Gorenstein orders. Construction of distinguished arithmetic classes is a different task: [cyclotomic systems](../EulerSystemsCyclotomicMainConjecture/README.md), [Kato systems](../KatoEulerSystems/README.md), and [Heegner-point systems](../HeegnerPointEulerSystems/README.md) prove their own norm, congruence, reciprocity and nonvanishing results.

There is no assertion that every p-adic representation has a nonzero Euler system, that a nonzero system is primitive, or that a bound is a main-conjecture equality. Noncommutative orders, arbitrary singular deformation rings, rank-zero systems and universal p=2 sharpness are not obtained by deleting hypotheses from the commutative positive-core-rank results. They are possible later Part II projects; the error-tolerant classical descent needed for all-prime finiteness in BSD is explicitly included below.

Use existing [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md) for continuous cohomology, local Tate duality and Poitou–Tate, and [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md) for actual local-condition/cone carriers and Iwasawa control. This roadmap owns only the extra auxiliary-prime conditions, system objects, regulator/derivative maps, core vertices and descent arguments. Generic exterior powers, duals, determinants and Fitting ideals must extend Mathlib or the corresponding algebra owner. [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md) L6 owns finite-free coefficient orders, trace duals, self-injective Artinian reductions and exact duality. The open PR323 GorensteinHomologicalAlgebra roadmap does not supply that order-theoretic API merely by sharing the word Gorenstein.

## Source versions and mathematical conventions

The Euler-system register records local copies, hashes and access failures. Principal sources are Mazur–Rubin 2004, Mazur–Rubin 2016, Burns–Sakamoto–Sano II, arXiv v1, Burns–Sano I, v1, and BSS III, v1. Rubin's author course draft supplies the error terms and classical/Iwasawa descent. The 2025 accepted version of BSS II was located but its PDF download returned HTTP 403; it is a version-comparison request, not the file used for the numbered targets here. In particular, v1 Theorems 5.2/5.25 retain p>3. Newer theorem numbering must not be substituted silently.

Fix a number field K, finite S containing infinity, primes above p and ramification, a complete coefficient DVR O with uniformizer varpi, and a finite-free continuous representation T. Write V=T[1/p], and distinguish the lattice dual Hom_O(T,O)(1) from the discrete Cartier dual Hom_O(T,Frac(O)/O)(1). Use arithmetic Frobenius, but keep the representation/dual/inverse appearing in each Euler polynomial explicit: MR 2004 and Rubin/BSS do not use an identical displayed polynomial. ES.2 proves their twist/convention dictionary. The dual Selmer group is computed with orthogonal local conditions, not with an independently chosen label `dual`.

An application must provide an exact hypothesis table, including field tower, S, coefficients, local conditions, dual, auxiliary-prime sets at every modulus, and the theorem version. Prime 2, exceptional residual images and local torsion are named branches, never implicit exceptions.

## ES.0. Coefficient data, quotient propagation and Selmer interfaces

1. Construct Selmer data from actual cohomology and local submodules/subcomplexes; prove propagation under T→T/varpi^m, inclusion into V and passage to V/T. Verify the square relating propagated local conditions and annihilators under local duality. The local condition on a quotient remembers the lattice; it need not be the naive full local cohomology group.
2. Define cartesian local conditions on the required quotient category, saturated lattice conditions and core rank. Prove the finite-level Euler-characteristic formula and independence of modulus under the specified hypotheses. Positive core rank is not the rank of T and not automatically the analytic rank of an L-function.
3. Package separate source-qualified admissibility predicates with expanded mathematical fields. For MR 2004 §3.5 over Q these include absolute residual irreducibility, a cyclotomic-trivial tau with rank-one coinvariants, the two H¹-vanishings over Q(T,mu_(p∞)), the Hom-vanishing alternative or p>4, a sufficiently large auxiliary-prime set, and cartesian propagation. For MR 2016 §4 over K use its Hilbert-class/unit-root field H_M, invariant vanishings, its tau/Chebotarev condition, H¹-vanishings, nonselfduality or p>3, cartesianness and prescribed positive core rank; Artinian results additionally require I_q=0. These are different records with proved implication lemmas, not one vaguely named `StandardHypotheses`.

**Acceptance:** compute the core rank and propagated conditions in a permitted finite-order twist of O(1), an admissible elliptic example and a deliberately inadmissible example. Explain which hypothesis fails in the last case instead of producing an instance by choice.

## ES.1. Auxiliary primes and local comparison maps

Construct the ray-class extensions K(q), their selected local cyclic quotients and the squarefree-conductor category. Prove unramified, finite, singular and transverse local descriptions at an auxiliary q, using the actual Frobenius quotient and inertia maps. Construct the finite–singular comparison including its cyclic-group tensor factor; prove independence of a chosen generator after that factor is retained. The transverse condition comes from restriction to the specified extension, not an arbitrary complementary subspace.

Use upstream Chebotarev on the finite extensions cut out jointly by T modulo powers and a finite collection of cohomology classes. Prove the simultaneous localization and independence lemmas needed for descent, the supply of core vertices, and exclusion of any prescribed finite set of primes. Record the small-prime restrictions in the argument. A single prime with a desired Frobenius is insufficient to prove the required simultaneous nonzero localizations.

**Acceptance:** finite–singular isomorphisms commute with quotient maps; local orthogonality and strict/relaxed/transverse modifications have correctly dualized conditions; all chosen primes avoid S and earlier conductors.

## ES.2. Euler-system modules and norm relations

Define systems over an explicit directed family of finite abelian extensions, with cohomology indexed by the correct enlarged S(F). Build the module of compatible classes as an equalizer/submodule, not a structure containing an unproved global existence assertion. Prove its universal property, restriction of indexing family, coefficient extension where cohomology base change is available, twisting, smoothing and removal/addition of Euler factors. Prove equivalence with the conductor-indexed presentation on a cofinal suitable family.

Construct the normalization dictionary between arithmetic/geometric Frobenius and the Tate-dual convention. Changes of local Euler factors induce explicit modification maps, not equality of differently normalized systems. The ES norm relation uses corestriction; it is not ordinary restriction or pointwise equality. Separate the p-power tower relation from the auxiliary-prime relation. A system allowed by the definition may be zero.

**Acceptance:** the cyclotomic owner provides genuine smoothed units and Kummer classes, not the torsion expression −zeta^-1; Kato and Heegner adapters identify their precise cohomological representations and normalization maps. No analytic reciprocity theorem is a field of the definition.

## ES.3. Derivative operators and corrected Kolyvagin classes

Construct the cyclic group-ring norm N_q and derivative D_q, prove (sigma_q−1)D_q=|G_q|−N_q, and prove the product/augmentation identities for squarefree conductors. Work modulo the correct conductor ideal I_n, allowing its dependence on Frobenius and |G_q|. Establish invariance of the derivative class and the exact restriction/descent statement, including kernel or cokernel errors when invariants do not vanish. Prove lift and generator independence in the intrinsic target.

The raw derivative classes initially satisfy a weak system relation. Construct the MR Appendix A correction, verify all finite–singular edge relations, and only then export a Kolyvagin system. For the Q route use MR Theorem 3.2.4 with its large ambient extension, cyclic Frobenius coinvariants and injectivity of Fr_q^(p^k)−1. Distinguish its generalized Kolyvagin-system output from the stronger ordinary output requiring the additional local divisibility condition. Over K use Rubin or the source-qualified higher-rank route; do not declare the Q theorem proved over every number field by renaming its base.

**Acceptance:** the conductor-one component is the initial class in the theorem's precise target; quotient/scalar/twist compatibility is proved; a two-prime test checks the correction terms and signs. Merely constructing a derivative operator does not complete ES.3.

## ES.4. Core vertices, descent and error-tolerant bounds

Construct the Selmer graph and its system sheaf, with vertex modules, edge modules and transition maps. Establish the core-vertex connectivity and local cyclicity results with their source hypotheses. Apply Poitou–Tate to strict/relaxed modifications and prove length bounds on the dual Selmer group. Track which bounds concern the entire finite dual group, a cotorsion quotient, or a Pontryagin dual; these are not interchangeable.

There are two interfaces. The clean MR DVR theorem (2004 §5.2, especially 5.2.2) uses its residual hypotheses and torsion-free local quotients; its upper bound is the divisibility index of the initial class, with infinity allowed when the class is zero. The error-tolerant Rubin/classical interface retains cohomological restriction errors, bounded local torsion and derivative denominators. In Rubin II.2.2 retain both n_W and n_W* and every auxiliary-field hypothesis; only applications that prove their vanishing may specialize to an error-free formula. For a classical descent with nonzero bounded errors, prove a bound uniform in the torsion exponent before passing to p-primary Selmer groups.

The general error-tolerant proof exports inequalities in terms of proved finite error constants. It does not assert these constants are bounded for arbitrary T or at p=2. [HeegnerPointEulerSystems](../HeegnerPointEulerSystems/README.md) supplies the classical arithmetic checks for exceptional, bad, dyadic and CM branches. Thus full finiteness of Sha in the BSD application does not rest solely on a clean large-image odd-prime theorem. Finiteness at one prime, or separate finiteness at every prime without almost-all vanishing, is not full finiteness of Sha.

## ES.5. Primitivity and sharpness over DVRs

Define residual primitivity and the index of a system using the actual reduction maps and leading/core vertices. Prove the rank-one module theorem, reduction surjectivity and the equality between the appropriate initial-class index and the dual-Selmer length under primitivity/core-rank-one hypotheses. Include the higher elementary-divisor information obtained from components, not only the annihilator exponent.

Separate three conclusions: nonzero initial class gives a finite upper bound; a primitive system can give a sharp bound under the theorem's assumptions; an analytic leading-term formula additionally needs arithmetic class construction and a reciprocity/height identity with all local factors. A nonzero point is not automatically primitive. Tamagawa defects and failure of saturation are recorded as lengths/ideals rather than discarded by rationalizing. Heegner descent can yield a square-index Sha bound through self-dual arithmetic structure; that factor of two is not a universal formula for every T.

**Acceptance:** scaling a system by varpi changes its index as predicted and cannot preserve a false sharpness claim; a system whose leading class vanishes is accepted as a system but cannot certify finiteness.

## ES.6. Exterior biduals, Stark systems and Gorenstein coefficients

Construct the exterior bidual bigcap_R^r M=Hom_R(wedge_R^r Hom_R(M,R),R), its determinant evaluation map, contraction maps, functoriality and coefficient change with all hypotheses. Prove agreement with the ordinary exterior power for finite projectives, but do not assert this for arbitrary integral lattices. Import PadicMeasuresIwasawaAlgebras L6's Gorenstein-order, self-injective Artinian reduction, exact-duality and Fitting APIs; own only system-specific exterior contractions and coefficient transitions.

First construct MR 2016 Stark and Kolyvagin systems over principal Artinian rings/DVRs, with core rank r and its §4 hypotheses, and prove the Stark regulator, rank-one freeness and structure control. Next extend to the semilocal commutative Gorenstein orders of BSS II. At finite level, retain Hypotheses 3.2, 3.3 and 4.2: residual irreducibility and invariants, a suitable tau, two cohomology vanishings, and existence of a relaxed Selmer core vertex with the specified free rank. For inverse limits retain Hypothesis 4.7 and the core-vertex requirement at every modulus. Prove these hypotheses in each application, not as consequences of the word Gorenstein.

**Acceptance:** the Stark regulator and component ideals commute with admissible scalar reduction. Construct rank-one and higher-rank examples and an example where replacing the exterior bidual by an exterior power would lose integral information. BSS II v1's p>3 restrictions for its Kolyvagin structure theorems remain visible.

## ES.7. Higher-rank derivatives and Fitting-ideal control

Define higher-rank Euler systems in exterior biduals over O[Gal(F/K)]-type coefficient orders, with the transition maps constructed in ES.6. Construct the higher derivative map, prove generator/order independence, and include the determinant/permutation correction terms required to obtain the finite–singular relations. Identify rank-one specialization with ES.3 after the explicit convention dictionary.

The pinned BSS II v1 §§6.1–6.4 route requires reflexivity of H¹(O_(F,S(F)),T), H⁰(F,T)=0, an ambient extension containing the ray-class fields and a Z_p^d-extension with no finite place splitting completely, and the Frobenius-power injectivity hypothesis 6.11. Hypothesis 6.1's reflexivity is not automatic in torsion unit examples; a modified-cohomology variant needs its own comparison. Use Theorem 6.12/Corollary 6.13 for construction, separately Theorems 4.6/5.2/5.25 and their additional conditions for structure bounds.

Prove the system-component ideals bound the correct higher Fitting ideals; prove equalities for basis Stark/Kolyvagin systems under the exact theorem assumptions. Over a non-domain order do not replace ideal containment by a valuation formula, or module structure by the order of its underlying group. The Burns–Sano basic determinant construction is a separate optional supplier of systems; a conjectural Rubin–Stark element remains a conditional application until its integrality and norm properties are proved.

## ES.8. Iwasawa variation and application handoffs

Combine the Selmer owner's inverse-limit/control results with ES.3–ES.7 to construct the Iwasawa system maps. Prove specialization outside explicitly listed exceptional primes, distinguish residual primitivity from Lambda-primitivity, and check every local-control kernel/cokernel. In MR 2004 §5.3, characteristic divisibility becomes equality only with the additional core-rank/nonzero/Lambda-primitive conditions of Theorem 5.3.10. Several-variable variants retain Rubin's no-completely-split-finite-prime hypothesis and distinguish finite from pseudo-null modules.

The application adapters have one-way dependencies: cyclotomic units plus ES.4/8 produce the cyclotomic divisibility, with the independent index argument supplying equality; Kato classes plus explicit reciprocity produce a modular divisibility; Heegner classes plus Gross–Zagier and their all-prime arithmetic verification produce rank/finite-Sha conclusions. BSD p-part equalities require the separately sourced primitivity/main-conjecture theorems. This roadmap neither assumes those endpoints nor derives their necessary nonvanishing from them.

## Completion and prototype contract

Each milestone must supply actual constructions, map-level naturality, coherent normalization changes and the stated worked tests. The final acceptance suite includes rank one, positive higher core rank, nontrivial coefficient order, a primitive/nonprimitive pair, an exceptional-prime branch, and checks that invalid hypotheses do not produce theorems. Source-numbered theorem statements and their prerequisite proofs are implementation tasks, not axioms.

Suggested.lean gives a small compilable algebraic seed and explicit future signatures for unavailable cohomological carriers. Its sorrys are deliberate roadmap targets. Passing Lean elaboration verifies names/types in the seed, not this theory or any case of BSD.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `ES.1` | Construct simultaneous Chebotarev localization for the extension cut out by the representation and all classes used in a descent step; one prescribed Frobenius prime does not ensure independence. |
| `ES.3` | Track the conductor ideal, derivative descent errors and MR correction map explicitly. Verify the two-prime finite–singular square before exporting an ordinary or generalized system. |
| `ES.4` | For the error-tolerant theorem separate finiteness of each error module from a bound uniform in the torsion exponent; consumers must establish the latter for exceptional primes. |
| `ES.8` | Write the integral image/index and oriented characteristic containment before invoking primitivity; residual primitivity and Lambda-primitivity have different reduction maps. |

**Producer–consumer handoff.** Kato and cyclotomic owners supply their own classes and reciprocity; Heegner HE.7 supplies actual dyadic/CM error constants and almost-all vanishing.

**Acceptance.** Scale a system by varpi and verify a formerly sharp bound changes; check a zero system remains a valid object without supplying nonvanishing.

**Source-readiness boundary.** BSS accepted/v1 comparison and the classical exceptional-prime source proof remain unverified; no proof-readiness claim is made.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
