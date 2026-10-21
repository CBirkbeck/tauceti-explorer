# Arithmetic locally symmetric spaces and their cohomology, Part II

## CC.8. Shimura, Galois and Hecke adapters

This layer identifies the generic completed objects with the actual modular,
Siegel, unitary and Hilbert towers used by their consumers. Its main output is
a completed arithmetic object carrying commuting continuous actions and a
specified residual Hecke summand. The finite-level geometry and comparison,
the completed carrier, and the finite derived Hecke image theory have their
own suppliers. This layer assembles those inputs and proves the comparisons
and inverse-limit results that are specific to the completed tower.

Accepted RS-09 retains the four concrete families here. The modular and
Hilbert/curve identifications feed R31.1. The common completed Hecke algebra
and residual localisation feed R31.3. The fixed-exponent compact-support
convention feeds TC.2; Scholze’s almost comparison and its perfectoid geometric
input are TC.2 results.

### Coefficients, levels and supports

Fix a prime p, the ring of integers O in a finite extension of Q_p, its
uniformizer varpi, and its finite residue field k. A coefficient system means
one fixed integral lattice with compatible finite quotients. A rational
isomorphism of coefficient representations does not identify their integral
completed objects. For Scholze’s convention O=Z_p and the coefficient at fixed
positive n is Z/p^n.

Fix a tame level K^p. For group-ring perfect complexes choose a compact open
K_0 at p and open normal levels U in K_0. At each finite coefficient exponent
s take the level colimit using the prescribed pullback maps. Only after that
colimit take the inverse limit in s for integral completed cohomology. Completed
homology and its duality convention come from CC.3/CC.4. They are not substituted
for cohomology by exchanging these two limits. Every sequential prototype below
means a **proved cofinal subsystem** of the normal-level/coefficient diagram.

Finite coefficient colimits carry the discrete topology; integral completed
objects carry the induced coefficient inverse-limit topology. Completed Hecke
algebras carry the topology from their finite derived image quotients. This is
a specified topology, not a topology inferred from an endomorphism-ring image
or from the algebraic Jacobson radical. A theorem about an ordinary inverse
limit never suppresses a derived limit term without CC.2’s recovery hypotheses.

Ordinary, compactly supported and boundary cohomology remain distinct. Their
maps and triangle are CC.0/CC.7 inputs. Compact support is not the image of
compact support in ordinary cohomology; that image is an interior cohomology
object with different behaviour. The finite étale–Betti comparison preserves
the chosen support and the complex orientation used for trace. An almost
O_C tensor, a boundary ideal sheaf on the perfectoid minimal compactification,
and automorphic sections belong to the downstream TC.2 comparison.

### Imported mathematics and exact contracts

The generic limit carriers in this plan are Mathlib’s `RingCat.sectionsSubring`
and `ModuleCat.sectionsSubmodule`. The category `TopModuleCat` supplies the
coefficient-limit object with its induced projection topology.
`CategoryTheory.Limits.lim` and `TopModuleCat.isLimit` give the functor and
its topological limit receipt. `RingHom.range` supplies each native ring image.
`CategoryTheory.Functor.mapEnd` transports a natural diagram action through
that limit. `LinearMap.IsIdempotentElem.range_eq_ker` and
`ContinuousLinearMap.IsIdempotentElem.isClosed_range` give the native image
and closedness of a continuous projector. These statements were read at
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; the Tau Ceti baseline is
f790474821cf4256814db967cb154e7af3d0c369.

The current TauCetiRoadmap main and current Tau Ceti library were also searched.
The upstream IntegralHeckeAndGaloisDeterminants IHG.2 already owns finite
Hecke images, bounded ghosts and finite local factors. Its Suggested.lean
currently states those interfaces over a commutative base A. The equivariant
category of modules over (O/varpi^s)[K_0/U] may have a noncommutative base, so
an explicit central O-linear extension of the same owner is required. Its
absence is recorded as a supplier gap; it is not hidden by forgetting deck
equivariance. The proposed direction is **Integral Hecke and Galois Determinants,
Part II: equivariant finite Hecke images**, building on the current upstream
IHG.2. Its present stage id is a request routing anchor until that extension
has an atlas stage; the existing roadmap is not replanned. The existing
completed-group-algebra API likewise remains its
owner’s construction; this layer adds no general group ring.

| Supplier | Required output |
| --- | --- |
| CC.0 | Arithmetic tower and finite coefficient/local-system dictionary, with the real-component convention. |
| CC.1 | Fixed-exponent level colimit and cofinality; full G_p action by conjugating levels, open stabilizers and transported tame Hecke maps. |
| CC.2 | Integral topological and derived coefficient inverse limits, completeness, qualified fixed-coefficient recovery, lim¹ corrections and stable-lattice rationalisation. |
| CC.3 | Completed homology and the precise continuous duality pair, with Hecke adjoints and coefficient lattice. |
| CC.4 | Uniformly bounded perfect finite group-ring complexes; actual coherent Hecke-equivariant derived coefficient and coinvariant recovery. |
| CC.5 | Source-qualified finite generation, canonical topology comparison and dual admissibility when those extra structures are used. |
| CC.6 | Continuous completed Hochschild–Serre/derived-invariants descent and qualified classical evaluation; finite derived coinvariants come from CC.4 and coefficient-limit recovery from CC.2. |
| CC.7 | Functorial support, local-system and trace maps, including equivariance of the boundary triangle. |
| ShimuraVarieties:V8 | Actual canonical models over reflex fields, analytic quotient dictionaries, level maps and tame correspondences defined over the reflex field. |
| ModularCurvesPartII:R14.3 | Modular finite étale/Betti local-system and Hecke/trace dictionary; broader all-degree support uses EDC.6. |
| HilbertModularVarietiesAndShimuraCurves:R18.4 | Hilbert and quaternionic curve finite tower, coefficient and comparison dictionary. |
| EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison | Finite constructible étale–analytic comparison, including Rf_!, pullback and the associated support/trace comparisons. |
| EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison | Complex orientation and the chosen finite Tate-twist normalization; CC.7 supplies the coefficient-system transport. |
| IntegralHeckeAndGaloisDeterminants:IHG.2 | Existing finite image, finite local factor and ghost theory, plus its precise central O-linear equivariant noncommutative-base extension. |
| DeformationAndDerivedPatchingAlgebra:P7 | Conservative derived residue reduction for perfect complexes over finite local p-group rings; its existing commutative-base contract needs this explicit extension. |

The last two extensions have not been found as applicable current signatures.
They are mathematical prerequisites, not evidence that a proof is formalised.
All nodes have implementation status `unchecked`. CC.8 has coverage **planned**:
every target has a statement and a prerequisite route, with the remaining
supplier and carrier gaps specified at the end. It is not closed.

### Target declarations

Names in the API and tests use the namespace `TauCeti.CompletedArithmetic`.
The statements below are the mathematical specification. The suggested file
prototypes the available native carriers; the arithmetic-specific names whose
supplier carriers are absent are registered explicitly as omissions.

Declaration names in the tables and tests below use the namespace
`TauCeti.CompletedArithmetic`.

#### 1. Arithmetic tower realisation comparisons

For each of the modular, Siegel, unitary and Hilbert families, fix the actual canonical-model tower X_K over its reflex field E, an embedding of an algebraic closure of E into C, a neat cofinal level system K=K_p K^p, and a compatible finite locally constant O/varpi^s coefficient system L_s from one chosen integral lattice. Identify the CC.0 finite-level arithmetic quotient with X_K(C), with its archimedean-component convention explicitly matched. The supplied finite étale–analytic comparison gives compatible O/varpi^s-linear isomorphisms of ordinary and compactly supported cohomology, natural for coefficient reduction, level pullback, finite étale trace and tame Hecke correspondences. Applying the existing CC.1 colimit at fixed s and then the CC.2 coefficient inverse limit gives named continuous linear comparison isomorphisms between the generic completed objects and these four actual arithmetic towers. These are comparisons of the existing carrier, not four new definitions of completed cohomology. The boundary triangle is transported only for the compactification and support maps supplied by CC.0/CC.7.

Hypotheses and conventions:

- O is the ring of integers in a finite extension of Q_p; varpi is a uniformizer; k is finite.
- Neatness ensures finite-level schemes and covering maps; nonneat levels require the supplied stack or group-cohomology interpretation.
- The connected real stabilizer A_infty^0 K_infty^0 used in the survey and the full stabilizer of a Shimura domain can differ. A comparison is asserted only after a concrete equivariant quotient dictionary; when descent is needed retain derived finite-component descent, rather than averaging at primes dividing the component-group order.
- Siegel and unitary comparisons use the finite-coefficient portion of EDC.6/complex-analytic-comparison. R14.3 and R18.4 supply the modular and Hilbert/curve inputs. Trace comparisons use the chosen complex orientation.
- For the complex orientation identify the finite Tate twist by the chosen compatible roots of unity. Use the EDC.6 trace-orientation input for Z/p^n and the supplied coefficient-extension compatibility for the selected O/varpi^s local system; no arbitrary unlabelled Tate-twist identification is made.

Construction or proof: Import X_K, its canonical model, reflex-field action, and the analytic adelic quotient from V8; retain determinant/component labels, rather than silently selecting one geometric component. Apply the exact finite-coefficient comparison with compact supports from EDC.6. For modular and Hilbert/curve families use the specialized local-system dictionaries in R14.3 and R18.4. Check all comparison squares before taking limits. Use EDC.6/trace-orientation-comparison for the chosen Tate-twist/complex-orientation normalization and CC.7 for its coefficient-system transport. Use CC.1 functoriality on the cofinal level diagram at each s and CC.7 for the support diagram. Then take the CC.2 coefficient inverse limit with its induced topology; its inverse is the limit of the finite comparison inverses. Export modularCompletedComparison, siegelCompletedComparison, unitaryCompletedComparison and hilbertCompletedComparison; R31.1 imports the first and fourth instead of constructing them again.

Acceptance cases:

- On a finite disjoint union of geometric points the comparison preserves every component idempotent, and H^0 is the product of one coefficient module per component.
- At the level of a noncompact modular curve, H_c^0=0 whereas H^0 contains constants; the support comparison must not substitute ordinary cohomology.
- For a component group C_2 at p=2, no averaging projection using 1/2 is exported. The quotient dictionary or actual derived descent must appear.
- The Galois action transported to the Betti object depends on the specified comparison and complex embedding; no Galois action on the bare singular site is asserted.

Dependencies: `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`, `ShimuraVarieties:V8`, `ModularCurvesPartII:R14.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`, `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`.

Source receipts: CE, §1.5, pp. 7–8 — The arithmetic quotient uses connected real stabilizers and retains a finite component-group action; this fixes the quotient dictionary required by the adapter.; Scholze, §4.2, proof of Theorem 4.2.1, p. 1021 — The finite compact-support group is identified with étale cohomology of extension by zero on a compactification before the perfectoid argument. Only this finite comparison recipe is used here.; Milne, Theorem 21.1 and Remark 21.2, p. 130 — Ordinary finite-coefficient comparison and its constructible extension motivate the finite input; compact supports and naturality are imported from the stronger named EDC supplier, not inferred from this ordinary statement.

#### 2. Definite unitary degree-zero adapter

In the definite unitary setting of LLHLM §5.3, with fixed tame level U^p and fixed away-p lattice W, let S(U,W_s) consist of functions on G(F^+)\G(A_f) with f(gu)=u^{-1}f(g), W_s=W/varpi^s. The actual finite double quotient and its equivariant coefficient system identify this module with H^0 of the finite discrete arithmetic tower. Thus lim_s colim_{U_p} S(U_p U^p,W_s) is canonically the CC.2 completed degree-zero object after the CC.1 level colimit for that tower, with its tame Hecke and G_p actions and coefficient-limit topology. At a nonneat finite quotient, the value at a representative x lies in W_s^{Gamma_x}; arbitrary W_s-valued functions are valid only when stabilizers act trivially. The degree-zero identification makes no claim that higher stabilizer cohomology vanishes. The finite quotient/coefficient dictionary is a CC.0 input; no canonical-model or étale–Betti comparison is used for this discrete degree-zero identification. Galois representations associated to Hecke eigenvalues are not a Galois action on these functions.

Hypotheses and conventions:

- Use the paper’s definite outer form of GL_3 over the totally real F^+≠Q, split over its CM field, and its specified local identifications and tame coefficient lattice.
- For the simple G_p action by right translation, W is fixed away p and its U_p action is trivial. A nontrivial p-adic coefficient action requires the corresponding equivariant coefficient transport, not this simplified formula.

Construction or proof: Use the finite double-coset decomposition to evaluate functions at representatives. Covariance identifies the result with the product of stabilizer invariants. Identify the same invariant fibres in finite-level equivariant H^0 using the CC.0 finite double-quotient/coefficient dictionary. Verify coefficient and level maps, including the covariant coefficient action. Apply the CC.1 level colimit and then the CC.2 coefficient inverse limit to this finite comparison; on the fixed away-p lattice use right translation to identify the G_p action and the standard finite Hecke sums. Import CC.3 for Pontryagin/Schikhof duals, rather than creating new dual carriers.

Acceptance cases:

- One double coset with trivial stabilizer gives W_s, with the prescribed tame coefficient action.
- For stabilizer C_2 acting by sign on O at p=2, integral invariant values are zero, while modulo 2 all values are invariant. Invariants cannot be interchanged with coefficient reduction without a descent theorem.
- An empty double quotient gives the zero module; a disjoint union gives a product, not an identification with one selected component.

Dependencies: `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.3`.

Source receipts: LLHLM, §5.3, pp. 120–122, especially the definitions of S(U,W), S(U^p,W) and its completed lattice — These definitions specify the definite unitary group, coefficient covariance, fixed tame level and the coefficient/level limit order. The invariant-fibre formula follows directly from their covariance condition.

#### 3. Scholze fixed-exponent support convention

For the Hodge-type datum (G,D), the fixed embedding into (Sp_{2g},D_{Sp_{2g}}), and K^p contained in the level-N subgroup with N≥3 prime to p, Scholze’s tilde H^i_{c,K^p}(Z/p^n) in published §4.2 is colim_{K_p} H_c^i(X_{K_pK^p},Z/p^n), at fixed positive n. The compact-support part of the arithmetic comparison identifies this with the CC.1 fixed-coefficient object for the same tower, constant lattice Z_p and exponent n. The integral completed lattice is a separate lim_n construction; its modulo-p^n recovery requires CC.2 and is not the definition of the fixed-exponent object. This node supplies the left input and the boundary/support convention to TC.2. Scholze Theorem 4.2.1 and Corollaries 4.2.2–4.2.3, including the almost O_C coefficient tensor and the boundary ideal sheaf on the perfectoid minimal compactification, are exclusively TC.2 outputs.

Hypotheses and conventions:

- n≥1 is fixed. Coefficients are exactly Z/p^n; an O/varpi^s variant requires an explicit coefficient extension receipt.
- No perfection, almostification or automorphic sheaf is needed to construct this CC.8 object; those operations belong to TC.2.

Construction or proof: Read the published §4.2 definition with the §4.1 Hodge embedding/tame level conventions, matching finite level and support with the arithmetic adapter. Apply cofinality and the compact-support finite comparison at fixed n. Expose the level-insertion maps so TC.2 can verify its pullback/trace diagrams. Register a supplier link CC.8→TC.2 for this fixed-exponent input. Preserve this integrated node id with its narrowed statement, and remove the perfectoid comparison output from CC.8 ownership.

Acceptance cases:

- For a proper tower ordinary and compact supports agree under CC.7; for a nonproper connected curve they do not agree in degree zero.
- The coefficient-limit lattice and its fixed quotient are not declared equal without the CC.2 coefficient-recovery hypotheses.
- Changing the integral lattice changes the corresponding integral comparison; rational isomorphism alone is insufficient.

Dependencies: `CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`.

Source receipts: Scholze, §4.2, definition on p. 1020; Theorem 4.2.1 statement and its two level diagrams on p. 1021 — The definition is a compact-support colimit at fixed exponent with the Hodge/Siegel and tame-level hypotheses. The theorem is cited only to identify the consumer and its coefficient/support requirements, not as a CC.8 theorem.

#### 4. Transported Galois and Hecke actions

On each actual finite geometric étale cohomology group of the canonical model over E, use its continuous G_E action and the chosen O-linear tame Hecke correspondence action defined over E. Transport them by the finite arithmetic comparison, then through the fixed-s level colimit and the coefficient inverse limit defining the existing completed object. The resulting actions are unique actions with those finite comparison squares; G_E and tame Hecke commute, as do both with G_p when supplied by the tower. Give the torsion level colimit the discrete topology and the integral object the inverse-limit topology. Require an open stabilizer for every torsion-colimit vector and continuous reduction maps. Then G_E×M→M is jointly continuous, and each Hecke operator is continuous. Joint continuity of G_p uses the analogous supplied open stabilizers, not just continuity of individual operators. On a rational object use the chosen stable integral lattice and its induced p-adic topology.

Hypotheses and conventions:

- The finite Galois and Hecke actions commute with level pullback, coefficient reduction and the selected support maps. Actual Hecke correspondences descend over E.
- An infinite-dimensional discrete colimit need not have an open global action kernel: require open point stabilizers, which suffice for joint continuity.
- Full G_p action may move levels by conjugation; the CC.1 conjugated-level/cofinal construction is supplied. Do not assume G_p acts on every fixed K_p group.

Construction or proof: Conjugate the finite actions across the comparison, and use naturality to descend to each colimit. Prove its smoothness vector by vector at a finite level and finite coefficient. Invoke the existing TopModuleCat limit and Functor.mapEnd on the coefficient diagram. Equality and commutation are checked under every limit projection; uniqueness follows from those projections. For joint continuity, test each inverse-limit basic open using its discrete coordinate and that coordinate’s open stabilizer. Use CC.1 for G_p level reindexing and CC.2 for stable-lattice rationalization and its topology. For each residual projector in this packet the commutation equations restrict these actions to its closed summand.

API:

| Declaration | Contract |
| --- | --- |
| `transportedAction` | The monoid action on the existing topological coefficient-limit object is the image of the natural diagram action under the limit functor; arithmetic finite actions are transported first. |
| `transportedAction_projection` | Each limit projection intertwines the induced operator with the corresponding diagram component. |
| `transportedAction_unique` | Two continuous actions agreeing under every coefficient projection agree. |
| `transportedAction_commute` | Commuting natural diagram actions induce commuting operators on the limit. |
| `transportedAction_jointlyContinuous` | If each coordinate action is jointly continuous, the action on the induced limit topology is jointly continuous. |
| `transportedAction_localized` | A continuous idempotent commuting with all action operators has an invariant image with the restricted continuous action. |

Unit tests:

- **transportedAction_identity**. The trivial natural action induces the identity on every element of the completed object.
- **transportedAction_sign**. For a constant O coefficient-limit diagram with the C_2 sign action, the nontrivial element acts by −1, including at p=2; reduction modulo 2 can be trivial without making the integral action trivial.
- **transportedAction_noncommuting**. The two shears on O^2, represented by matrices [[1,1],[0,1]] and [[1,0],[1,1]], do not commute. Commutation on the completed object requires the finite commuting-action hypothesis.

Acceptance cases:

- Projection to each coefficient coordinate recovers the specified action, with the same order of Hecke composition.
- A product of finite discrete representations gives a continuous inverse-limit action even when their common kernel is not open.

Dependencies: `CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.7`, `mathlib:TopModuleCat`, `mathlib:CategoryTheory.Functor.mapEnd`, `mathlib:CategoryTheory.Limits.lim`, `mathlib:TopModuleCat.isLimit`.

Source receipts: CE, §1.5, p. 7 — The arithmetic tower carries the full p-adic group and completed tame Hecke action; CC.8 adds the canonical-model Galois transport to the generic construction.; GN, Remark 2.1.13, p. 11 — The completed Hecke action commutes with the full p-adic group on completed homology. This is the consumer requirement for the transported action.

#### 5. Compatible finite derived Hecke image diagram

Fix the commutative abstract spherical O-Hecke algebra H away from a finite set S containing p and all bad tame places. On each CC.4 perfect complex C_{U,s} over the finite group ring B_{U,s}=(O/varpi^s)[K_0/U], use the specified central O-linear derived H action and its finite faithful image T_{U,s}. For V⊂U and t≥s, require the actual Hecke-equivariant derived base-change identification B_{U,s} tensor-derived over B_{V,t} C_{V,t} ≅ C_{U,s}. It induces a surjective O-algebra homomorphism T_{V,t}→T_{U,s}, taking the class of h to the class of the same h. With the CC.4 coherence receipts these maps form a cofiltered diagram of finite commutative rings. Mere intertwining of homology maps does not construct these image-ring maps. The finite image, finite local factors, ghost bounds and derived idempotent splitting are IHG.2 inputs; CC.8 plans their compatible tower diagram.

Hypotheses and conventions:

- U ranges over open normal subgroups of K_0, with a cofinal countable subsystem chosen for prototypes; finite images are finite as sets, not just finitely generated modules.
- B_{U,s} can be noncommutative. The finite image contracts must be O-linear in D(B_{U,s}); IHG’s existing commutative-base Suggested.lean is not silently an equivariant noncommutative contract.
- Use one compatible H and one common bounded cohomological interval for the family when exporting uniform ghost results.

Construction or proof: Request the finite equivariant image/idempotent/ghost contract from IHG.2, with the existing commutative-base statements as its specialization. Verify finite cardinality from a bounded finite projective group-ring representative. Apply derived coefficient change to each Hecke endomorphism. Since the same abstract H acts at the target, the source action kernel is contained in the target kernel; form the quotient/image map and prove surjectivity on H classes. Check identity/composition using the actual CC.4 base-change isomorphisms and their coherence. Expose the image ring functor without reintroducing the finite Hecke algebra theory.

API:

| Declaration | Contract |
| --- | --- |
| `derivedHeckeDiagram` | The functor on the cofiltered normal-level/coefficient category has object T_{U,s} and transition given by the specified derived coefficient change. |
| `derivedHeckeDiagram_class` | Every transition sends the derived image class of h∈H to its target image class. |
| `derivedHeckeDiagram_surjective` | Each transition is surjective; finite images are finite commutative O-algebras. |
| `derivedHeckeDiagram_coherence` | Identity and composite transitions agree, including their base-change comparison isomorphisms. |

Unit tests:

- **derivedHeckeDiagram_zero**. A zero complex has the one-element image ring at every level; its compatible diagram has no maximal ideals.
- **derivedHeckeDiagram_scalar**. For the scalar action on a rank-one O/varpi^s complex at trivial group level, the image is O/varpi^s and coefficient transitions are quotient maps.
- **derivedHeckeDiagram_intertwiner_insufficient**. For H=k[x] acting by x=0 on k and by x=1 on k, the zero map of modules intertwines the actions, but no H-compatible map of the two image quotients exists. A bare intertwiner cannot replace base-change recovery.

Acceptance cases:

- Every transition is surjective on actual image rings and preserves the class of each abstract Hecke operator.
- An operator killed in the finer derived image is killed after actual derived coefficient change.

Dependencies: `CompletedCohomologyPartII:CC.4`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:RingHom.range`.

Source receipts: GN, Definition 2.1.11 and Remark 2.1.12, p. 10 — The finite rings are images in the derived category of finite group-ring modules, and their transitions come from coefficient-change identifications, including reduction through a normal subgroup at nonnormal levels.

#### 6. Residual support at a pro-p level

Choose an open pro-p U_0⊂K_0, restrict to V normal in K_0 contained in U_0, and put A_0=T_{U_0,1} (formed by the same coefficient-change construction, permitting U_0 nonnormal through a smaller normal subgroup). Under finite equivariant images, bounded perfect complexes, the Hecke-equivariant derived coinvariant identification k tensor-derived over (O/varpi^s)[U_0/V] C_{V,s} ≅ C_{U_0,1}, and conservative derived residue reduction for those perfect complexes, each surjection T_{V,s}→A_0 induces a bijection of maximal ideals. Equivalently its kernel is contained in the Jacobson radical of the finite ring and is nilpotent. The maximal ideals are indexed by the support of the actual derived image, not by arbitrary maximal ideals of H.

Hypotheses and conventions:

- U_0/V is a finite p-group. This hypothesis is essential.
- The conservative reduction is required after splitting each Hecke residual idempotent; its summand is a perfect complex over the finite local group ring.
- Ghost nilpotence identifies the support of a faithful derived image with the union of its homology supports; no equality of derived and homology images is assumed.

Construction or proof: Split a finite residual factor using the IHG equivariant idempotent contract. A nonzero factor acts on a nonzero perfect summand: if its identity vanished on all cohomology, bounded ghost nilpotence would force that idempotent to vanish. Over the local finite p-group algebra, conservative derived residue reduction detects this nonzero perfect summand. One can use a minimal representative with differentials in its radical, as in Gee–Newton 2.1.6–2.1.9; after residue reduction its nonzero free term survives. The P7 noncommutative extension is an explicit supplier gap. The coinvariant identification puts every finer residual label in the support at U_0,1. Surjectivity gives the converse. A finite commutative ring’s radical is nilpotent; conclude the stated kernel criterion.

Acceptance cases:

- For a trivial tower A_0=k×k, exactly two residual labels persist.
- For the C_2 sign representation over F_3, derived coinvariants vanish because 2 is invertible; a nonzero perfect summand can disappear. The pro-p hypothesis cannot be removed.
- Nilpotent ghosts can change an image algebra but cannot create a new residual maximal ideal.

Dependencies: `CompletedCohomologyPartII:CC.8/compatible-derived-hecke-images`, `CompletedCohomologyPartII:CC.4`, `DeformationAndDerivedPatchingAlgebra:P7`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Source receipts: GN, Lemma 2.1.14, p. 11; Definitions 2.1.6–2.1.8 and Proposition 2.1.9, pp. 9–10 — The pro-p residual support argument is the first part of the semilocality proof. Minimal complexes over a possibly noncommutative local ring provide an alternative rigorous detection argument with a named prerequisite.

#### 7. Completed derived Hecke algebra

For the compatible finite derived-image diagram F of this packet define T_hat as its inverse limit, the subring of the product consisting of compatible tuples, with the subspace topology of the product of finite discrete rings. This is the instance of Mathlib RingCat.sectionsSubring attached to F, not a new generic inverse-limit construction. It is a compact Hausdorff complete topological commutative O-algebra. The evaluation maps to finite images are continuous surjections. The compatible map H→T_hat has dense image; it need not be surjective. Cofinal normal-level systems and iterated coefficient/level limits give canonical topological ring isomorphisms. The supplied finite actions induce a continuous action on the compatible CC.4 chain/homology system and its completed limit; on completed cohomology use the CC.3 adjoint/dual convention or an explicitly supplied cohomological diagram.

Hypotheses and conventions:

- The normal-level/coefficient index is nonempty and cofiltered; transitions are surjective finite ring maps. Use a countable cofinal subsystem only after proving cofinality.
- The completed module action is asserted only on diagrams whose action and transition maps are compatible and jointly continuous at each discrete coefficient level.

Construction or proof: Apply the existing sections subring to the ring functor. The compatibility equations define a closed subset of the product of finite Hausdorff spaces; compactness, Hausdorffness and completeness follow. For a finite coordinate or finite compatible set of coordinates, choose one finer coordinate. Finite surjective transitions and compactness lift it to a compatible tuple; images of H surject onto that finer image ring, proving density. Use the limit universal property to compare cofinal/iterated systems. Apply compatible finite actions coordinatewise to CC.4 completed homology; use CC.3 rather than equating chain, homology and dual actions.

API:

| Declaration | Contract |
| --- | --- |
| `completedHecke` | The carrier is RingCat.sectionsSubring for the finite derived-image functor; use its inherited commutative ring and the product-induced topology. |
| `completedHecke_eval` | Evaluation at any (U,s) is a continuous surjective ring map and satisfies all transition equations. |
| `completedHecke_ext` | Two elements agree exactly when their evaluations at every finite image agree. |
| `completedHecke_lift` | A compatible family of continuous ring maps to the finite images factors uniquely and continuously through T_hat. |
| `completedHecke_dense` | The abstract H map is dense because it surjects onto every finite image; density does not assert surjectivity onto the limit. |
| `completedHecke_cofinal` | Restriction to a cofinal level/coefficient subsystem is a topological ring isomorphism preserving each retained evaluation. |
| `completedHecke_action` | Evaluation of t acting on a compatible module element equals the corresponding finite image operator applied to that coordinate. |
| `completedHecke_action_continuous` | If the finite coordinate actions are jointly continuous and compatible with the diagram, the induced action on the compatible-sections completed module is jointly continuous for the product-induced topologies. |

Unit tests:

- **completedHecke_constant**. For the constant identity-transition diagram on a finite commutative ring A, T_hat≅A with its discrete topology.
- **completedHecke_scalar**. For A_s=Z/p^s with reduction maps, T_hat≅Z_p; the map Z→Z_p is dense and is not surjective.
- **completedHecke_zero**. For the one-element finite image diagram, the completed ring is the one-element ring and its maximal spectrum is empty.

Acceptance cases:

- No topology of pointwise convergence on End(completed homology) replaces the specified inverse-limit topology.
- The underlying ring and projections agree with the native compatible-sections carrier.

Dependencies: `CompletedCohomologyPartII:CC.8/compatible-derived-hecke-images`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.4`, `mathlib:RingCat.sectionsSubring`, `mathlib:ModuleCat.sectionsSubmodule`.

Source receipts: GN, Definition 2.1.11, p. 10; Remark 2.1.13, p. 11 — These give the inverse limit, its topology, the iterated coefficient/level presentation and its action on completed homology.

#### 8. Semilocal product decomposition

Let T_hat be the preceding inverse limit and fix the finite base image A_0 of residual-support-stability. Then evaluation q:T_hat→A_0 is surjective and ker(q) is contained in J(T_hat). Pullback gives a bijection MaxSpec(A_0)≅MaxSpec(T_hat), including algebraic maximal ideals, not only continuous ones. With this finite index set, T_hat≅∏_m T_hat_m as rings and as topological rings when each factor is endowed with the inverse-limit topology from its finite local factors. Each T_hat_m is a compact complete Hausdorff local ring with the same finite residue field as the corresponding A_0 factor, and equals the algebraic localization of T_hat at m. The topology asserted here is the finite-image inverse-limit topology. No noetherianity, finite O-module assertion, or identification with the algebraic J-adic topology is inferred merely from semilocality.

Hypotheses and conventions:

- Every finite transition is surjective and its map to A_0 has radical kernel. Finite local-factor decompositions and their uniqueness are supplied by IHG.2.
- For the zero image system, the maximal spectrum is empty and the empty product is the one-element ring.

Construction or proof: An element is a unit in the limit exactly when all its finite coordinates are units: their unique inverses form a compatible tuple. For x in ker(q) and any y, every coordinate of 1−yx is a unit because each finite kernel is radical. Thus ker(q)⊂J(T_hat), which treats all algebraic maximal ideals. Use surjectivity of q to identify the finite maximal spectrum. Match each finite local factor to its A_0 label. Ring maps preserve its unique central idempotent, so finite decompositions are compatible. Take the finite product of inverse-limit factors. The coordinatewise splitting and recombination are inverse continuous ring maps. Each factor has radical kernel over its finite local base, hence is local; elements outside its maximal ideal are units. The projection’s algebraic universal property identifies it with localization. This proves the needed semilocal/topological decomposition directly, without relying on the stronger J-adic conclusion in the source proof. Export that stronger conclusion only with an additional closed-powers/completeness proof.

Acceptance cases:

- A constant k×k diagram has two algebraic maximal ideals and two factors.
- For T={(a,b)∈O×O : a≡b mod varpi}, the ring is local: it has two rational eigensystems but only one residual factor.
- An inverse system of local finite rings with arbitrarily large embedding dimensions may yield a nonnoetherian local limit; this theorem exports no noetherian instance.

Dependencies: `CompletedCohomologyPartII:CC.8/completed-hecke-algebra`, `CompletedCohomologyPartII:CC.8/residual-support-stability`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Source receipts: GN, Lemma 2.1.14, p. 11 — The source states semilocality, residue finiteness and the local product decomposition. This node proves the inverse-limit-topology portion directly and leaves the source’s stronger algebraic radical-adic conclusion outside its claimed output.

#### 9. Compatible residual Hecke projectors

Given a residual maximal ideal m_0 of A_0, let e_{m_0,U,s} be the unique central idempotent of T_{U,s} equal to 1 in the local factor labelled m_0 and 0 in its other local factors. Their compatible tuple is e_{m_0}∈T_hat. This is the unique idempotent with those finite evaluations. The finite family is pairwise orthogonal and sums to 1, and e_{m_0}T_hat is the m_0-labelled completed local factor. It is independent of the chosen finite residual base, pro-p level and cofinal normal subsystem after the labelled transition identifications. A maximal ideal of the abstract H is eligible only if it lies in the finite-image residual support and is pulled back from m_0.

Hypotheses and conventions:

- The finite local decomposition and residual-label bijections are fixed by the preceding theorem.
- Do not lift separate characteristic-zero eigencharacters that are congruent modulo varpi to distinct integral projectors.

Construction or proof: Use the unique finite local-factor idempotents from IHG.2. The residual-label bijections show that transition maps preserve them. Form their element of the existing sections ring, and check idempotence, orthogonality and the finite sum at every coordinate. Use cofinality and the unique finite evaluations to prove choice independence. Identify the image ideal with the corresponding product factor.

API:

| Declaration | Contract |
| --- | --- |
| `residualProjector` | The element of T_hat formed from the compatible finite local-factor idempotents. |
| `residualProjector_eval` | Its evaluation equals the unique projector for the specified finite residual factor. |
| `residualProjector_unique` | An element with those finite evaluations is the same residual projector; consequently it is independent of all cofinal choices. |
| `residualProjector_relations` | The residual projectors are idempotent, pairwise orthogonal and have finite sum 1. |
| `residualProjector_factor` | Multiplication by the residual projector identifies its image ring with the corresponding factor of the semilocal product. |

Unit tests:

- **residualProjector_product**. For O×O with the two residual maximal ideals, the projectors are (1,0) and (0,1).
- **residualProjector_local**. For a local completed image ring the sole residual projector is 1.
- **residualProjector_congruent_characters**. In T={(a,b)∈O×O : a≡b mod varpi}, (1,0) is not an element of T. Both rational characters belong to the same residual factor, whose projector is 1.

Acceptance cases:

- A residual ideal outside the image support is rejected as input; it does not define an arbitrary new summand.

Dependencies: `CompletedCohomologyPartII:CC.8/completed-semilocal-product`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:RingCat.sectionsSubring`.

Source receipts: GN, Definition 2.1.11, pp. 10–11; Lemma 2.1.14, p. 11 — The inverse-limit image algebra and its product into local factors provide canonical residual idempotents. This construction makes the projector compatibility and choice independence explicit.

#### 10. Residual localisation of the completed tower

For a compatible continuous T_hat action on the existing completed cohomology/homology object M, define its localisation at the supported residual ideal m_0 to be the image of the continuous idempotent operator P_{m_0}=e_{m_0} acting on M, with its subspace topology. Use the native linear-map range; do not define another completed carrier. For Hausdorff M it is closed, and M is the topological direct product of these finitely many images. Algebraically this image agrees with localization at the corresponding maximal ideal of T_hat, by the semilocal product theorem. The inclusion and projection split continuously. On CC.4 complexes take the corresponding compatible derived idempotent summands supplied by IHG.2. On a cohomological dual object use the adjoint-transposed Hecke convention from CC.3; the residual label is transported along that adjoint anti-isomorphism, not assumed unchanged.

Hypotheses and conventions:

- T_hat acts continuously and its finite projectors agree with the finite diagram actions on M. The native idempotent image construction is reused from Mathlib.
- The cohomology/homology duality identification and Hecke adjoints must be supplied by CC.3 for the stated supports and coefficient lattice.

Construction or proof: Apply the ring action to e_{m_0}; its idempotence gives a continuous idempotent operator. Take its native linear range with induced topology. Use Mathlib’s idempotent range=kernel(1−P) and closed-range theorem. Restrict the operator to obtain a split continuous projection and inclusion; finite orthogonal projectors yield the topological product. Use the algebraic localization universal property of the ring factor to compare module localization. Use the imported derived splitting for complexes and the CC.3 adjoint action for cohomology versus homology. Restrict commuting Galois, G_p and tame Hecke actions to the summand. No localization by an arbitrary abstract H ideal outside the supported finite spectrum is exported.

API:

| Declaration | Contract |
| --- | --- |
| `completedLocalization` | The native range of the continuous residual idempotent on the completed object, with induced topology. |
| `completedLocalization_inclusion` | The range subtype inclusion is continuous and linear. |
| `completedLocalization_projection` | P corestricts to a continuous linear projection onto its range, and the inclusion/projection composites are 1 on the range and P on M. |
| `completedLocalization_fixed` | An element lies in the selected range exactly when P x=x. |
| `completedLocalization_closed` | In a Hausdorff completed object the selected range is closed. |
| `completedLocalization_complete` | For the complete separated additive uniformity of the Hausdorff completed object, its closed residual range is complete with the induced uniformity. |
| `completedLocalization_map` | Any continuous linear map intertwining two labelled projectors restricts to the ranges, respecting identity and composition. |
| `completedLocalization_algebraic` | For the supported residual label and semilocal product ring, the selected image is algebraically the localization of M at that maximal ideal. |

Unit tests:

- **completedLocalization_zero**. The zero projector selects the zero module, even when M is nonzero.
- **completedLocalization_one**. The identity projector selects all of M with its original topology.
- **completedLocalization_product**. On O×O with the first residual factor projector, the selected module is O×{0}; (0,1) is excluded.

Acceptance cases:

- The range topology is inherited from M and the inclusion/projection are continuous; no algebraic localization topology is silently substituted.
- A nonidentity residual summand may be zero on one degree of M without removing that label from the all-degree derived image algebra.

Dependencies: `CompletedCohomologyPartII:CC.8/residual-hecke-projector`, `CompletedCohomologyPartII:CC.8/transported-arithmetic-actions`, `CompletedCohomologyPartII:CC.3`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`.

Source receipts: GN, Lemma 2.1.14, p. 11; Definition 3.3.5, p. 18, and Proposition 3.4.19, p. 24 — The semilocal factors are the residual localization used for completed homology and patched complexes. CC.8 supplies the common topological summand, not patching or its augmentation theorem.

#### 11. Localisation through limits, supports and duality

For a compatible residual label on the actual completed tower, localisation commutes with the fixed-coefficient filtered level colimit and with the coefficient inverse limit: e(lim_s colim_U M_{U,s}) is continuously isomorphic to lim_s colim_U e_{U,s}M_{U,s}, with the inherited topologies. It also commutes with cofinal reindexing and with all supplied equivariant morphisms, including Galois and tame Hecke actions. For a supplied equivariant support triangle, applying compatible derived projectors gives its residual summand triangle and the induced localized long exact sequence. For the exact CC.3 Pontryagin/Schikhof duality pair, the transpose projector selects the dual of the original residual summand, with the adjoint Hecke label. This is not a claim that an arbitrary algebraic dual commutes with arbitrary inverse limits.

Hypotheses and conventions:

- All finite projectors, transition maps and support-triangle maps are compatible. There are finitely many residual labels.
- Use CC.1 for the discrete level colimit, CC.2 for integral topology and qualified fixed-coefficient recovery, and CC.3 for the continuous duality regime. Retain the CC.2 lim^1 terms when its recovery hypotheses fail.

Construction or proof: At each fixed s, represent a vector at some finite level; applying its projector produces a representative in the selected finite summand. Orthogonal complements show the resulting filtered-colimit image comparison is bijective. At the coefficient limit, send a compatible vector to its coordinate projections and use coordinatewise inclusion as inverse on the selected range. Continuity is tested under every coordinate map; no exactness of arbitrary inverse limits is used. For support triangles use the already equivariant CC.7 triangle and its functorial IHG splitting. For duality transpose the split inclusion/projection; use the exact CC.3 continuous dual comparison and coefficient/support regime.

Acceptance cases:

- For a constant O^2 tower with first-coordinate projector, both orders of limits/localization give the first coordinate with its original topology.
- Localizing the boundary triangle preserves all three terms; it cannot replace compact support by the image in ordinary cohomology.
- For a pairing between a module and its continuous dual, transpose the first-coordinate projector; a Hecke adjoint that permutes residual labels permutes the dual factor accordingly.

Dependencies: `CompletedCohomologyPartII:CC.8/completed-residual-localisation`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.2`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.7`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Source receipts: GN, Remark 2.1.13, p. 11, and Proposition 3.4.19, p. 24 — Residual localization is compatible with the completed homology object and the augmentation identification. The general CC.8 compatibility is a split-idempotent argument on the supplied diagrams, not a new augmentation or duality theorem.; LLHLM, §5.3, pp. 121–122 — The unitary example keeps a completed lattice and its dual, illustrating why dual localization must preserve the fixed lattice and its coefficient convention.

#### 12. Derived and homology images have the same residual labels

Suppose the finite derived image diagram T_i maps surjectively and compatibly to the corresponding image T_i^H on the direct sum of finite homology groups, and all complexes have cohomology in one common interval [a,b], a≤b. The induced map of finite-ring inverse limits T_hat→T_hat^H is surjective and its kernel has (b−a+1)-st power zero. Consequently it induces a bijection of residual maximal ideals and transports the unique residual projectors. It need not be an isomorphism. An action on one completed homology degree, or on End of its completed limit, is a further quotient and is not identified with either all-degree inverse-limit image algebra without a separate theorem.

Hypotheses and conventions:

- Finite-ring diagrams share the same cofiltered index and compatible image-quotient maps. A uniform cohomological interval supplies the uniform exponent.
- The IHG equivariant ghost bound is required in the actual derived category of the group-ring complexes.

Construction or proof: Use the IHG bounded ghost theorem at every finite coordinate. Products of b−a+1 compatible ghost elements vanish at every coordinate and hence in the sections ring. Surjectivity of the inverse-limit quotient uses compactness: for a fixed compatible homology-image tuple the finite fibres and finite transition constraints have the finite-intersection property, since a common finer coordinate can be lifted. Arbitrary inverse limits of surjections between infinite modules would not justify this step. Apply the nilpotent-quotient maximal-spectrum and unique idempotent-lift comparison from the finite/complete Hecke input; label and projector compatibility follows. Do not identify the two rings.

Acceptance cases:

- A constant quotient k[epsilon]/epsilon^2→k has identical residual labels and projector 1 but is not an isomorphism.
- Without a uniform exponent, coordinatewise nilpotent kernels need not yield a nilpotent limit kernel; the uniform-amplitude hypothesis stays in the statement.

Dependencies: `CompletedCohomologyPartII:CC.8/completed-hecke-algebra`, `CompletedCohomologyPartII:CC.8/residual-hecke-projector`, `IntegralHeckeAndGaloisDeterminants:IHG.2`.

Source receipts: GN, Remark 2.1.12, p. 10, and Lemma 2.1.14, p. 11 — The finite derived image has nilpotent kernel on all homology; its residual support is therefore detected on homology. This node states the uniform-amplitude inverse-limit extension with its additional compactness hypotheses.

### Required acceptance of the layer

The four named arithmetic comparisons must use actual canonical-model towers,
not formal placeholder towers. At finite levels check both coefficient and
level maps and the support/trace diagrams before comparing completed objects.
Keep geometric components and the finite real-stabilizer quotient explicit.
The definite unitary specialisation must reproduce stabilizer invariants and
the exact lattice from LLHLM §5.3. Its eigenvalue Galois representation is not
a Galois action on its algebraic function space.

For the big Hecke algebra, verify the transition maps on derived classes of
every abstract tame operator. Prove residual-label stability with a **pro-p**
base and genuine derived coinvariant recovery. Check that all algebraic
maximal ideals of the limit, including any that were not assumed continuous,
are captured by the finite residual spectrum. The unit criterion in the
semilocal proof supplies this step. It must not be replaced by an assertion
that profiniteness by itself implies semilocality.

The projector must keep congruent characteristic-zero eigensystems in one
residual factor. The localization must be the closed split image on the
existing completed object, with the original topology. Its coordinate
projections, Galois/Hecke actions, support triangle and exact continuous-dual
receipt must agree with the supplied diagrams. Derived and all-degree homology
Hecke images can differ by ghosts. The uniform bound gives identical residual
labels, not equality of rings or faithfulness on one homology degree.

The atlas planets are Completed arithmetic actions, Residual Hecke support,
Completed Hecke algebra, Semilocal Hecke decomposition, Residual Hecke
projectors and Completed residual localisation. Each denotes a mathematical
construction or theorem above; comparisons and qualification checks are not
additional planets.

### Remaining supplier work and suggested-file boundary

**Finite equivariant noncommutative Hecke contract.** The current upstream IHG.2 Suggested.lean states finite-image and ghost APIs over commutative A. The CC.4 deck group-ring base can be noncommutative. The requested equivariant extension is mathematically required before these arithmetic signatures can use genuine finite derived-image objects; forgetting deck equivariance is insufficient.

**Finite p-group derived residue detection.** P7’s existing local/minimal-complex packet is commutative-base. The noncommutative finite local group-ring derived Nakayama needed after Hecke idempotent splitting is an exact additional supplier contract. The source supports it, but no applicable current supplier signature was found.

**Arithmetic comparison and tower interfaces at the pins.** The pinned libraries contain generic limits, topological modules and derived categories, but not the CC.0–CC.7 arithmetic tower/local-system carrier or the selected canonical-model comparison. Suggested.lean consequently prototypes the real compatible-sections, limit action and idempotent-range interfaces; the arithmetic-specific signature register lists the omitted comparison/action/finite-image/support/duality declarations with their exact suppliers. They are not replaced by arbitrary cohomology functions, private scheme stand-ins or vacuous predicates.

The finite geometry requests and the eight same-roadmap contracts in the table
remain the exact inputs to discharge. Import their real carriers and maps when
adding the registered arithmetic signatures. Preserve their support, coefficient,
component, equivariance and continuity hypotheses. This is the work needed for
closure; the target-level planning pass covers all of CC.8.

Gee–Newton §2.1, pp. 7–11, and Proposition 3.4.16, pp. 23–24, are routed to the
CC.4 owner. The proposition constructs a perfect patched
O_infty[[K_0]] complex with open-ideal/deck-coinvariant recovery; Proposition
3.4.19, p. 24, identifies augmentation homology with residual completed
homology. This resolves the missing-source lead for the chain model, without
placing the patched construction in CC.8. The Fu, Boxer–Pilloni, Nakamura and
BCGP source additions attached to the issue belong to CC.1–CC.6; the handoff
routes them to that first-part owner.

### Public sources read

The packet records the PDF hashes and access date, 11 October 2026. No source
text or source excerpts are included here.

- Toby Gee and James Newton, [Patching and the completed homology of locally symmetric spaces](https://www.ma.imperial.ac.uk/~tsg/Index_files/derivedpatchingpadicLL.pdf). Author PDF, 57 pages, corresponding to arXiv:1609.06965; page numbers are the printed author-PDF pages. Read: Introduction, pp. 1–3; §2.1.1–2.1.14, pp. 7–11; Definition 3.3.5, p. 18; Propositions 3.4.16 and 3.4.19, pp. 23–24.
- Frank Calegari and Matthew Emerton, [Completed cohomology — a survey](https://math.uchicago.edu/~emerton/pdffiles/survey.pdf). Author survey PDF; printed pages. Read: §1.5, pp. 7–8; quotient and component conventions.
- Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals of Mathematics 182 (2015), 945–1066, published §4.2 numbering. Read: §4.1, Theorem 4.1.1 hypotheses, pp. 1017–1020; §4.2 definition, p. 1020; Theorem 4.2.1 statement and comparison diagrams, p. 1021; opening finite-comparison step of proof.
- Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, [Serre weights and Breuil’s lattice conjecture in dimension three](https://math.rice.edu/~bl70/LLHLMlattices.pdf). Forum of Mathematics, Pi 8 (2020), e5; 135-page published PDF. Read: §5.3, pp. 120–122; definite unitary forms and completed lattice.
- James S. Milne, [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf). Version 2.21, 22 March 2013. Read: Theorem 21.1 and Remark 21.2, p. 130.
