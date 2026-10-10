# Potential automorphy infrastructure package, revision 2

Completed by **Codex — codex-qgOfxR**, 2026-10-10, for issue #7912,
`PKG-PotentialAutomorphyInfrastructure~2`.

None of the manager's priority issues was available. The leading review jobs
#6219 and #5702 lacked the complete inputs identified in their existing
handoffs, so this focus package was the first suitable fallback. The
[claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7912#issuecomment-6092414856)
confirmed this session before edits began.

## Deliverables and review response

The package is complete for a fresh independent package review. README.md is
199,587 UTF-8 bytes. It retains the accepted 123 targets, 122 named API items
and 90 named checks, and adds the auxiliary extension target described below.
The six layers now follow the dependency order, rather than the old packet
numbering. Every definition retains at least three discriminating checks; the
arithmetic statements retain their hypotheses, prerequisites and source
locators. Metadata remains exactly `topic = "math.NT"`.

The previous review, by codex-SNCIEH on 2026-10-08, accepted the mathematics and
README after clarifying integral versus rational duality, but required complete
typed arithmetic signatures. The binding 2026-10-09 package instructions now
expressly require representative signatures, permit unavailable statements to
be absent, and allow a short closing list of their names. This revision follows
that newer rule: `import Mathlib`, one module docstring, namespace
`TauCetiRoadmap.PotentialAutomorphyInfrastructure`, ordered layer comments,
docstrings, `theorem` declarations and typed examples. It removes the long
comment catalogue instead of representing unavailable arithmetic carriers by
invented propositions. The README remains the complete mathematical roadmap.
The closing list identifies all definition targets requiring supplier carriers;
the local declarations explicitly identify their remaining arithmetic adapters.

The old review's rational-duality correction is retained. Further representative
signatures now pin character uniqueness in unit/valuation coordinates,
uniformizer rescaling and the orientation denominator. Successful elaboration
does not establish the truth of declarations proved by `sorry`, nor does it
type-check the missing global arithmetic interfaces. No theorem is claimed as
implemented or proved.

Only the package README, Suggested.lean and this handoff changed. No accepted
packet, original reader or suggested file, supplier, link map, atlas data or
review verdict changed. In particular, review.json is deliberately left for
the next independent reviewer.

## Construction order and changes to the accepted input

| Current package layer | Accepted layer | Construction |
| --- | --- | --- |
| 0 | PA.0, plus the coefficient dictionary | Integral models, coefficient retracts and boundary comparison |
| 1 | PA.1 | Fontaine–Laffaille compatibility |
| 2 | PA.5 | Soluble transport, auxiliary fields and rank-two systems |
| 3 | PA.2 | Ordinary towers, boundary comparison and local–global compatibility |
| 4 | PA.3, plus three Hida targets from PA.4 | Arithmetic deformation actions and the conditional support interface |
| 5 | PA.4 | Arithmetic patching verification and automorphy lifting |

`WeightIndependentHidaTwist`, `hida_weight_independence` and
`hida_weight_specialization` precede `ordinary_deformation_hecke_map` in Layer 4.
The conditional support interface still takes an actual patched pair as input;
Layer 5 constructs the pair. This order introduces no circular proof.

Two inherited field-construction prerequisites pointed upward to
PotentialAutomorphyLifting:PL.0. Those citations are replaced by the new Layer 2
target `auxiliary_cm_extension_prescriptions`. Its three contracts are distinct:
prescribed finite Galois local completions with soluble Galois global extension
and avoidance; cyclic extension of prescribed degree with splitting and
avoidance; and the CM cyclic case constructed through a totally real extension
of F⁺. Arbitrary local data are not claimed to yield a CM field. The proof
requirements include the finite-prescription character theorem, not just global
reciprocity. CHT Lemmas 4.1.1–4.1.2, p. 116, and BLGGT Appendix A.2,
pp. 600–601, supply the construction. Existing finite local Galois solvability
is cited from Tau Ceti. PotentialAutomorphyLifting should import this lower-tier
target when its plan is next edited. The ClassFieldTheory link screen currently
records no input; it needs to recognize the global-reciprocity dependency of
this new target. Neither higher plan nor link map was in this job's edit scope.

One accepted API normalization needs correction in its own future update:
`PositiveTorusMonoid.contractingElement` for ACC's rational-p element has
valuation row `v(p)(n−1,…,0)`. The row `(n−1,…,0)` is correct for a chosen local
uniformizer. In a ramified local field these rows differ. README and Lean now
make that distinction. The accepted packet remains unchanged as required.

Additional explicit controls clarify rank-zero dominance, mixed-characteristic
arithmetic rings, field/unit-ideal congruences, characteristic-zero oddness,
nonvanishing orientation denominators, and the failure of automatic symmetric-
power regularity when the Hodge gap is zero. Ordinary rescaling has the numerical
witness `3·2=6`. The rational dual interval has the witness `[2,5]→[3,6]` at
`n=2,f=2,d=8`; the integral object remains derived Hom with Ext contributions.
The Fontaine–Laffaille and ordinary selected second eigenvalues have the
witness `10/3` versus `10`. No error in the published ACC value of
`g=qn−n²[F⁺:Q]` is asserted.

## Current upstream and library audit

The two upstream form models read were ReductiveGroups and ProfiniteArithmetic,
including their README and Suggested.lean. Current upstream, all nine roadmaps
newer than the atlas snapshot, and Completed roadmaps were searched by the
mathematical objects, hypotheses and operators used by every accepted target.
Candidate statements were read, including the existing local level groups and
ordinary projector statements. The native library was searched for the
arithmetic carriers, integral weight lattices, exterior cohomology, ordinary
operators, local Galois properties, compatible-system data and residual images.
Name coincidences with ordinary group cohomology or characteristic-zero weight
theory were not treated as the missing arithmetic statements.

| Read or elaboration input | Revision |
| --- | --- |
| Current TauCetiRoadmap main used for duplication audit | `d6f707516e7ede3181dac4b2420ba25c0799d22d` |
| Current Tau Ceti used for native audit | `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` |
| Mathlib used by the final elaboration | `082e2d37e8b0463410cdb532e111cd43d5a66174` |
| Tau Ceti revision named by the atlas protocol | `f790474821cf4256814db967cb154e7af3d0c369` |

Suggested.lean imports only Mathlib. Consequently its elaboration is not a
compatibility test of future Tau Ceti arithmetic imports at either native
revision. The reviewed library coverage, AUDIT-34's notes on every target,
touching link maps and the Caraiani–Newton tier order were also read.

| Mathematical objects audited | Existing supplier and resulting boundary |
| --- | --- |
| Integral coefficients, retracts, boundary and exterior cohomology (Layer 0) | Mathlib supplies categorical `Retract`, functorial transport and derived categories. Native continuous/group cohomology supplies related low-degree operations, not the integral G(O)-equivariant exterior identification. The kept retract adds actual indexed action equations. Integral dual-Weyl lattices and their splittings are still explicit supplier requirements. |
| Siegel shuffles, weight tables, Kostant and Fontaine–Laffaille comparisons (Layer 1) | Generic Weyl and characteristic-zero highest-weight machinery exists upstream; native HighestWeight/KostantMultiplicity and spin lattices do not supply the required integral Siegel coefficient decomposition. Inverse-increasing left-coset shuffles and the arithmetic comparisons retain their specific hypotheses. No duplicate general root or weight theory is planned. |
| Local extensions, compatible systems and residual transport (Layer 2) | Native `TauCeti.LocalFieldsRamification.isSolvable_algEquiv` supplies solvability for finite valued extensions of nonarchimedean local fields. ClassFieldTheory supplies reciprocity but explicitly excludes prescribed global extensions/Grunwald–Wang. Thus the new finite-prescription construction is needed. Chebotarev and generic symmetric-power operations are consumed. Extremely weak system classifications and their arithmetic descent are not found in native generic representation theory. |
| Ordinary stable operator and finite/derived projector (Layer 3) | `SmoothRepresentationsOfLocalGroups:SR.6.5`, `StableOperator.split`/`invertiblePart`, and IntegralHeckeAndGaloisDeterminants §2.3, `Theorems.factorial_powers`/`ordinary_finite`, already state the generic results. Removed the generic Lean definition `ArithmeticOrdinarySummand`, its `operator_bijective` and `finite_quotient_comparison`, and its three generic examples. The README keeps only the arithmetic avatar with its level, diamond action and Hecke image, explicitly distinguished from the imported theory. |
| Iwahori levels and Bruhat cells (Layer 3) | ReductiveGroupsPartII §RG2.3 supplies `LevelSubgroups.iwahori`, `proPIwahori` and principal congruence groups; §RG2.4 supplies generic Bruhat/Iwahori–Weyl theory. The retained tower adds two depths, the adelic level and diamonds. The retained Siegel cells add compact charts and distinguish place-indexed relative length from embedding-indexed absolute length. The distinction is stated in the ownership section and retained target clauses. |
| Ordinary local invariants, character normalizations and boundary comparison (Layer 3) | General smooth categories, derived actions and determinant reconstruction remain with SR, ALS and IHG. Their existing statements do not supply the transfer-normalized invariants, the ordinary coefficient comparison or the full GLₙ determinant transfer. Those precise arithmetic targets remain here. The local algebraic coordinate signatures make no claim to construct their topological/adelic carriers. |
| Hida duals, deformation actions and support inputs (Layer 4) | Generic deformation rings, perfect-complex reconstruction and support belong to their stated lower-tier suppliers. Native local-ring and support APIs do not construct the arithmetic paired complexes. The inverse Hida twist and variable-determinant arithmetic component calculation are kept as applications with explicit hypotheses. |
| Taylor–Wiles towers and lifting (Layer 5) | Generic patching and determinant machinery is imported. Kept targets construct actual levels, ordered-root localizations, paired reductions and arithmetic dimension/amplitude inputs; no general patching theorem or integral R=T is replanned. |
| Products of PGL₂ in rank-two monodromy | RG2.0a supplies Weil restriction and embedding-indexed products (ACC fact (6)), not automorphism/cohomological classification of forms (facts (7)–(8)). The arithmetic forms requirement is retained separately. Abstract Goursat requires both projections surjective and does not establish descent of algebraic forms. |

The removed declarations are local generic prototypes, not deletions of accepted
arithmetic targets. All 123 accepted targets still occur in the README, with
the retained arithmetic variants distinguished from their suppliers.

## Signature and generality checks

The following spot checks compare actual Lean signatures with the local scope
stated in the README; absent global statements are not counted as elaborated.

| Signature | Hypotheses, domain and conclusion checked |
| --- | --- |
| `EquivariantRetract.idempotent` | Actual categorical retract and both indexed action equations; the projector is retraction followed by inclusion on B. |
| `UnitaryLeviWeight.dominant_iff` | Descending input rows and n>0; the cross-block bridge compares the first entries, with conjugate reversal and negation. Rank-zero row is separate. |
| `KostantShuffle.minimal_representative` | Left Levi cosets, inverse-increasing shuffles, unique minimum and the actual inversion count; multiplication direction was enumerated. |
| `CTGWeight.iff_witness` | Predicate on a supplied computed weight table, with all w and all constants; no opaque module or automorphy hypothesis. |
| `shifted_partition_recovery` | Finite integer sets, equal positive cardinalities, separated C/D, both original/shifted union equalities and cardinalities; conclusion is A=C and B=D. |
| `IwahoriLevelTower.diamondQuotient` | Local commutative ring, b≤c and c≥1 in the tower, actual congruence subgroups, surjective diagonal quotient and kernel; the arbitrary-ring level definition alone promises no arithmetic quotient comparison. |
| `RelativeBruhatCells.lengths` and `open_union` | Finite place family, degree weights for absolute length, actual GL cells; openness uses nontrivially normed fields and the ≥i direction. |
| `OrdinaryGaloisCharacters.on_units` and `on_uniformizer` | Unit-valued data over a commutative coefficient ring, reversed labelled weights, zero-based exponent −i and U-ratio; U₀=1 is present in the rank-one/determinant examples. |
| `unique_from_units_and_uniformizer` and `coordinate_uniformizer_change` | Algebraic homomorphisms on units times integral valuations; no claim of continuity or local Galois realization; negative valuations use units. |
| `BruhatOrientationCharacter.formula` and `norm_denominator_ne_zero` | Nonzero determinant supplied in Qₚ units; the rational norm remains nonzero under rational inclusion, and inverse determinant times p to the valuation has norm one. |
| `RankTwoOdd.conjugate` | Characteristic-zero commutative coefficients, two-sided inverse change-of-basis matrices, determinant −1; no mod-2 sign test is asserted. |
| `TaylorWilesArithmeticLevels.trace_scalar` | Finite residue fields, principal maximal ideals and qᵥ≡1 mod p; the local index is the flag count, whose product reduces to (n!) to the number of places. The numerical unit test assumes prime p>2 at n=2. |

## Adversarial mathematics pass

The table below covers all 123 accepted targets plus the new auxiliary target.
It records degenerate cases, negative controls, sign/direction witnesses and
supplier restrictions. For arithmetic comparisons it checks consistency and
the necessity of hypotheses against the source and supplier contracts; it is
not a new proof of those theorems. An unchanged entry means those restrictions
were already correct. The seven remaining source/interface obligations are
listed after the table, rather than declared discharged by these tests.

Independent finite calculations enumerate all left-coset shuffles for n=0–3
(counts 1,2,6,20; longest lengths 0,1,4,9), check minimality in each Levi orbit,
and check 246 separated partition instances on the integers −3 through 5.
Rational calculations check symmetric-square roots/determinants, both selected
eigenvalue normalizations, the dual degree identity for n,f=1–4, orientation
for p=2,3,5 and valuations −3 through 3, ordinary determinant telescoping for
n=0–4, and flag-count congruences for primes 3,5,7,11 and n<p. The tests do not
claim exhaustive verification of infinite arithmetic constructions.

| Target | Instances tried | Outcome or change |
| --- | --- | --- |
| `coefficient-satake-descent` | Zero localized complex; identity level; Eisenstein ideal. | Map has boundary-to-Levi direction; non-Eisenstein and decomposed-level hypotheses retained. |
| `siegel-coefficient-retract` | Identity retract; m=1; nonsplit integral lattice. | Restriction to the trivial unipotent subgroup followed by a supplied integral splitting is needed; no automatic splitting of an arbitrary lattice. |
| `ramified-satake-descent` | R empty; R stable under conjugation; R disjoint from its conjugate. | Empty R recovers the unramified comparison; T=S−(Rᶜ−R) and the asymmetric e/t generators remain distinct. |
| `kostant-shuffles` | n=0,1,2,3; internal transposition; block exchange. | Enumerated 1,2,6,20 left-coset representatives; longest lengths 0,1,4,9; internal block swap fails membership. |
| `equivariant-retract` | Identity; zero object; multiplication-by-1 versus multiplication-by-2 on Z. | Both commuting equations and retract equation retained; mismatched identity actions fail at 1. |
| `unipotent-exterior-cohomology` | Trivial U; Z_p rank one; exterior degree above rank. | Degree 0 is the coefficient ring, degree 1 its continuous dual, higher degrees vanish; p-adic free additive U is essential. |
| `boundary-degree-retract` | w=1 versus rank-one swap; no unipotent level equality. | Shifts are 0 versus −1; full U(O) condition retained, including the premise used by middle-degree comparison. |
| `integral-kostant-decomposition` | n=1, i=0,1,2; p below 2n−1. | Two degree-0/1 pieces and zero degree-2 piece; integral lattice and prime bound retained, not characteristic-zero Kostant alone. |
| `unipotent-derived-formality` | Rank-zero U; a free term in degree 1; small p. | Direct-sum term H¹[−1] occurs in cohomological degree 1; p>n² remains the equivariant-formality hypothesis. |
| `middle-degree-satake` | f=1; w=1; absent full integral unipotent subgroup. | f=1 excluded; degree d−l(w) and the full U(O) premise retained; no arbitrary-degree surjection asserted. |
| `ctg-weight` | Empty W; nonempty W with zero table, including n=0; two conjugate pairs. | Empty W passes, zero table fails, conjugate sums 0 and 1 pass; actual weight-table computation remains an adapter. |
| `ctg-one-embedding-perturbation` | One embedding versus two; perturbation a=0. | f>1 retained; no claim that zero perturbation makes a parallel table CTG; dominance uses a≥0. |
| `fontaine-laffaille-degree-shifting` | Only two p-adic places; q outside upper half; λ bridge inequality fails. | Local-degree complement must exceed f/2; admissible q and sign on conjugate first weights retained. |
| `middle-range-fontaine-laffaille` | A=0 versus A nonzero; top/bottom interval endpoints. | Residual FL assertion requires nonzero A; doubled multiset includes the conjugate-dual shift 2n−1. |
| `nilpotent-fontaine-laffaille-transfer` | Two equal residual summands; coefficient map non-surjective; B killed by ϖ. | Distinct irreducible residual factors are needed for the product of matrix algebras; scalar extension only gives kernel inclusion and a surjection. |
| `all-degree-fontaine-laffaille` | q=0,d−1; only two p-adic places; p=n². | Full degree range retained; degree-complement and strict prime bound exclude the invalid cases; no integral ordinary-Hom duality. |
| `degree-reflection-duality` | n=2,f=2; p=5 versus p=2; O/ϖ coefficient torsion. | Arithmetic degree reflection uses d−1; n₀=(2n+1−p)/2 is integral under the odd-prime bound; rational Hom distinguished from integral Ext. |
| `genericity-making-character-twist` | Trivial twist versus prescribed finite local set S. | A trivial twist need not make the doubled representation generic; coefficient enlargement and locally trivial prescribed twist retained; source asserts existence without proof. |
| `shifted-partition-recovery` | m=1,2,3, integers −3..5; overlapping shifted unions. | 246 separated instances passed; both union cardinalities are in the signature; no invented counterexample to a retained hypothesis. |
| `fontaine-laffaille-local-global` | p=n²; ramified F at p; vanishing rational cohomology. | Strict bound and unramified condition retained; second weight alternative remains when rational cohomology vanishes; nilpotence exponent positive. |
| `iwahori-level-tower` | b=0; b=c=1; field with ϖ≠0; ramified O. | b=0 diamonds trivial; (1,1) refines the supplied pro-p Iwahori; unit ideal gives full GL; use ϖ_v rather than p in congruences. |
| `arithmetic-ordinary-summand` | Zero, identity and nilpotent operator at finite quotient. | Ordinary pieces zero, whole and zero respectively; generic projector signatures removed in favor of SR/IHG; arithmetic diamond/Hecke avatar kept. |
| `ordinary-galois-characters` | n=0,1,2; λ=(2,0); U₀=1; ϖ′=3ϖ. | Reversed factors 1,u⁻²; determinant ε^{n(1−n)/2}Uₙ; new value 6 when old value 2 and unit value 3; all quotients are of units. |
| `positive-torus-monoid` | n=0,1; rows (1,0),(0,1); ramification e=2. | First row contracts upper unipotents and second fails; corrected rational-p row to e(n−1,…,0), separate from chosen-ϖ row. |
| `lowest-weight-character` | λ=0; rank-one weight 2; chosen uniformizer with λ≠0. | Values 1,u²,1; this is the normalized character on unit/valuation coordinates, not algebraic evaluation at the uniformizer. |
| `local-ordinary-parts` | Zero representation; trivial N; N=Z_p and trivial F_p coefficients. | Transfer on pN quotient is p=0, so ordinary part is zero; naive t-action would incorrectly give the entire module. |
| `ordinary-torus-invariants` | b=0; zero module; finite torsion module. | Natural map commutes with compact-torus invariants after positive-monoid localization, not with arbitrary invariants/localizations. |
| `unipotent-invariants-acyclicity` | Trivial N; zero injective; arbitrary noninjective module. | Acyclicity restricted to images of injectives in the specified smooth categories; not a vanishing assertion for every module. |
| `ordinary-exact-injective` | Zero exact sequence; torus localization; arbitrary change of ring. | Exactness/injective preservation use this smooth monoid localization, not arbitrary base change. |
| `iwahori-borel-ordinary-comparison` | b=0,c=1; c<b; c=0. | First pair allowed; latter pairs excluded; map direction is Iwahori invariants into Borel invariants before ordinary localization. |
| `derived-ordinary-comparison` | Degree-zero object; zero complex; complex unbounded below. | Bounded-below hypothesis retained; comparison combines derived invariants with exact ordinary localization. |
| `completed-arithmetic-cohomology` | λ=0; zero coefficients; finite projective coefficient reduction. | Weight-zero recovers full local-group action; derived reduction retained; finite-level map requires actual arithmetic model comparison. |
| `completed-ordinary-cohomology` | Zero; trivial N; finite ordinary quotient. | Ordinary localization follows derived N-invariants; finite control is a separate comparison, not a definition of completed cohomology. |
| `completed-classical-ordinary-control` | c=b=1; zero complex; trivial diamond quotient. | Full classical ordinary complex recovered in its diamond-derived category; transfer normalization is retained. |
| `ordinary-level-control` | c′=c; c′>c; c′<c. | Identity at equal depths; forward ordinary pullback for increasing depth; reverse-depth map not asserted. |
| `completed-ordinary-weight-control` | λ=0; rank-one λ=2; kernel of lowest-weight projection. | Trivial twist at zero; unit-square character at rank one; nilpotent kernel disappears after contraction, with imported integral projection. |
| `finite-ordinary-weight-control` | λ=0; b=0; m=1. | Finite ordinary coefficient comparison is equivariant after normalized twist; reduction degree and diamond action retained. |
| `unitary-ordinary-tower` | Zero weight; c=b=1; nonsplit p-adic factor. | Construction uses chosen split GL₂ₙ identifications; does not substitute one-depth Iwahori for the full tower. |
| `ordinary-satake-homomorphism` | Rank-one two torus blocks; λ=0; U_{v,n}^{−1}. | Unitary/Levi operator normalization and inverse generators retained; existence of a homomorphism does not imply surjectivity onto the full target algebra. |
| `unitary-completed-boundary` | Zero boundary complex; finite-level reduction; interior versus boundary. | Boundary carrier is RΓ of the boundary; no replacement by the interior ordinary complex; all level maps supplied by its triangle. |
| `unitary-ordinary-control` | Zero weight; b=0; finite m. | Weight twist and finite-level invariants commute in the stated smooth category; not an unproved assertion about arbitrary inverse limits. |
| `relative-bruhat-cells` | n=0,1; one place of degree 2; identity and longest shuffles. | Relative/absolute lengths 1/2 at that place; open union is length≥i, not ≤i; compact chart differs from generic RG2 Bruhat cells. |
| `bruhat-cell-induction` | Empty support; longest cell; finite-discrete analogy. | Functions have compact support modulo P on the indicated cells; not functions supported outside the cells; compact/infinite N charts distinguished. |
| `bruhat-filtration` | i=0; i above maximal relative length; one GL₂ place. | Whole induced object at 0, zero above maximum; exact sequence removes length i, with triangle shift +1. |
| `bruhat-invariant-filtration` | Zero complex; n=1 length strata; arbitrary nonsmooth object. | Short exact sequences occur in the smooth categories with bounded-below input; not an arbitrary exactness property of invariants. |
| `bruhat-unipotent-acyclicity` | Zero injective; trivial unipotent subgroup; noninjective object. | Acyclicity is for compact-cell induction of injectives; missing injectivity does not become universal vanishing. |
| `ordinary-compact-cell-comparison` | Zero π; full versus compact chart; quotient J_w. | J_w has zero ordinary derived invariants, rather than being zero as a representation. |
| `bruhat-unipotent-invariants` | w=1 and longest w; trivial N_w. | Intersection groups retain conjugation direction; trivial intersection gives the original π, not its ambient N-invariants. |
| `bruhat-evaluation-comparison` | Evaluate at identity representative; zero π; transformed stabilizer. | Evaluation f(w) targets N_w-invariants with the specified positive-torus action; arbitrary evaluation point not canonical. |
| `bruhat-orientation-character` | Zero Lie dimension; a=p; a=−1 at p=2; a=0. | Values 1,1,−1; a=0 excluded by unit-valued determinant; rational norm denominator nonzero, distinct from residue Teichmüller sign. |
| `ordinary-unipotent-degree-shift` | w=1 versus longest; one degree-2 local factor. | Shifts −d versus 0, using absolute l(w); inverse torus transport and orientation both retained. |
| `ordinary-bruhat-piece` | w=1 versus longest; π=0. | τ_{w⁻¹}=τ_w⁻¹; shift −d+l(w); no reversal of the character or transport direction. |
| `completed-boundary-induction-retract` | Identity-level retract; zero localized complex; Eisenstein ideal. | Non-Eisenstein Siegel stratum and actual induction supplied; arbitrary retract cannot manufacture a Satake correspondence. |
| `ordinary-boundary-degree-shifting` | w=1; zero target; full GLₙ ordinary Hecke algebra larger than Satake image. | Only surjective onto Satake image; full-group-algebra determinant transfer is an explicit remaining proof requirement. |
| `ordinary-ctg-weight-choice` | n=1; i=0,n²; p=2 and finite coefficient units. | n=1 excluded; block exchange at i=0 avoids nonexistent tuple entry; M multiple of finite unit exponent preserves mod-ϖ character triviality. |
| `ordinary-middle-degree-quotient` | n=1; i=0,n²−1; f=1. | n≥2,f>1 retained; degrees i f run through the selected quotient degrees, without full-Hecke surjectivity. |
| `determinant-torus` | n=1; f=1; neat central units versus torsion roots. | Norm-positive real torus has f−1 dimensions; roots of unity require neat/torsion-free quotient before power map injectivity. |
| `determinant-component-product` | n=1; central torsion unit; determinant equality omitted. | Product requires determinant equality and neatness; z↦det(g)zⁿ has stated component domain; no arbitrary nth-power isomorphism on F×. |
| `determinant-neat-level-shrinking` | T empty; fixed nonempty T; torsion unit kernel. | Shrinking occurs away from T using congruence kernels inside nth powers; no arbitrary replacement of the factors at T. |
| `central-torus-cohomology-shifting` | f=1; nontrivial central coefficient action; K_v not Iw(b,c). | Trivial central action and correct p-level required; torus factor has trivial Hecke action; degree set i f does not mean every degree is equal. |
| `all-degree-ordinary-characteristic-data` | n=1; polynomial identity alone; zero Hecke module. | Rank-one handled by characters; ordered product identity is retained separately from characteristic polynomial; full-transfer proof obligation not hidden. |
| `ordinary-automorphic-galois-flag` | n=1; λ=(2,0); p-adic places nonsplit in a transport field. | Ordered diagonal characters use reversed weights; non-Eisenstein residual conditions retained; nonsplit soluble transport stays a separate source leaf. |
| `fontaine-laffaille-deformation-hecke-map` | χ=1; zero nilpotent ideal; v∈Sᶜ−S. | Variable global determinant and FL local condition retained; inertial/unramified compatibility uses S∪Sᶜ, not only S. |
| `ordinary-hida-complex` | μ=0; m=1; torsion coefficient lattice. | Integral complex is derived O-dual with shift −d; finite free Iwasawa models require their stated hypotheses, not rational Hom. |
| `ordinary-deformation-hecke-map` | μ=(2,0); χ=1; a compatible finite-level system. | Hida twist (0,3) is built before use; Λ-algebra and nilpotent quotient survive passage to the limit with supplied uniform reconstruction. |
| `patched-arithmetic-mod-varpi-comparison` | N=0; paired identical complexes; restriction of scalars. | Common Hecke image lies in D(S∞/ϖ); agreeing actions are modulo the sum of ideals, not literal equal integral deformation rings. |
| `taylor-wiles-arithmetic-levels` | Q empty; n=2,q_v≡1; p=2; arbitrary field parameter. | Empty gives (K,K); scalar≡2 is a unit for p>2; actual arithmetic q_v≥2, even though polynomial q_v=1 is a valid congruence witness. |
| `taylor-wiles-selected-ideals` | n=2 roots 2,5,q_v=3; repeated residual roots. | FL eigenvalue 10/3 differs from ordinary 10; ordered distinct roots retained and U-generators are normalized before localization. |
| `selected-ideal-properness` | Zero selected cohomology; nonzero π contribution; trace scalar divisible by p. | Properness proved using a nonzero automorphic contribution and a unit trace scalar; cannot declare an ideal maximal by its notation alone. |
| `diamond-derived-augmentation` | Q empty; one finite p-group; nonfree cellular action. | Derived augmentation retained; free action/projective model needed; ordinary coinvariants may miss higher Tor. |
| `taylor-wiles-hecke-locality` | Q empty; selected maximal ideal; unlocalized Hecke algebra. | Locality is after ordered-root localization, not a property of every Hecke algebra. |
| `diamond-linear-deformation-hecke-map` | Q empty; one auxiliary place; repeated eigenvalues. | Empty recovers nonauxiliary map; distinct eigenvalues identify inertia characters and diamond action, with nilpotent quotient retained. |
| `fontaine-laffaille-patching-verification` | q=0 with n=2,f=2; Q₀ empty; χ=1. | Negative g is excluded by presentation hypotheses; N=0 recovers base; paired derived reductions and uniform ranks must be supplied. |
| `fontaine-laffaille-dimension-amplitude` | n=2,f=2; zero rational complex; globally fixed determinant. | d=8, ℓ₀=3, range [3,6]; π forces nonzero rational cohomology; fixed-determinant dimension would require a new calculation. |
| `fontaine-laffaille-full-support` | Zero module; nilpotent ideal; a characteristic-zero point. | Nonzero amplitude and paired hypotheses are essential; support is via the nilpotent Hecke quotient, not a literal integral R-module identification or R=T. |
| `fontaine-laffaille-lifting-at-good-level` | p=n²; noncrystalline lift; ρ=rι(π). | First two excluded; the reference lift is consistent; seventeen-clause profile and unramified Π at p retained. |
| `neatness-auxiliary-places` | q_v≡1 mod p; one auxiliary residue characteristic; p=2. | All excluded controls: H² vanishing needs q_v≠1, neatness uses two residue characteristics, scalar cyclotomic class uses odd p. |
| `weight-independent-hida-twist` | n=1,μ=0; n=2,μ=0; n=2,μ=(2,0). | ν+w₀μ is 0,(0,1),(0,3); twist is its inverse, and this construction now precedes all its uses. |
| `hida-weight-independence` | μ′=μ; μ′=0; variable ordinary weight. | Identity when weights equal; general equality is after normalized twisting in D(Λ₁), not of untwisted classical complexes. |
| `hida-weight-specialization` | μ′=μ; μ′=(2,0); torsion Λ₁-module. | Derived specialization retained with inverse character twist; ordinary tensor alone is insufficient without flatness. |
| `ordinary-taylor-wiles-levels` | Q empty; c=1; away-from-p auxiliary place. | Empty recovers original c-tower; finite diamonds act at Q and commute with the p-adic tower; selected roots use ordinary normalization. |
| `ordinary-diamond-augmentation` | Q empty; nonzero selected cohomology; finite p-group. | Derived Λ₁[Δ] augmentation and support assertion retained; higher Tor cannot be silently discarded. |
| `ordinary-diamond-linear-hecke-map` | Q empty; v∈Q; μ=(2,0). | Frobenius polynomials asserted only outside S∪Q; Λ[Δ]-linearity and inverse Hida twist retained. |
| `ordinary-patching-verification` | q=0; trivial twist; zero complex. | Nonnegative g and reference π contribution retained; reconstruction uses one fixed ultrafilter, not an independence assertion. |
| `ordinary-support-at-lifting-point` | Equal inertial characters; λ=μ; nonmaximal component. | Distinct inertial characters locate a maximal component; only the specified lifting point is asserted in support, not all ordinary components. |
| `ordinary-lifting-at-good-level` | Root-of-unity mismatch; finite-order inertial discrepancy; reference lift. | Whole-inertia and p-power-root compatibility are good-level hypotheses; final global theorem only requires open inertia, via soluble transport. |
| `soluble-base-change-and-descent` | Identity extension; cyclic induced ρ becoming reducible; ramified finite place. | Identity fixes both directions; irreducibility ensures cuspidality; local identity includes restriction to W_E at every finite place. |
| `split-test-prime-image-preservation` | E=F; E intersecting residual field; V₂ nonsplit. | Identity passes; split test sets prevent image loss and V₂ preserves a generic rational prime; scalar cyclotomic class remains outside kernel. |
| `fontaine-laffaille-base-change-fields` | E₀=F when prescriptions already hold; p_b=p; only two p-adic places. | Quadratic auxiliary primes avoid p; unramified p and degree-complement requirement retained; soluble CM composite preserves split image tests. |
| `ordinary-base-change-fields` | Ramified p; too-small local degree; root-of-unity mismatch. | Ramified p allowed; strict degree and local inertia/root-of-unity prescriptions retained; π_E ordinarity is a separate transport theorem. |
| `rank-two-reducibility-dichotomy` | Direct sum of two characters; trivial finite-image representation. | Reducible member leads to the systemwide character split; no assumption that extremely weak means all-member de Rham. |
| `rank-two-system-trichotomy` | Quadratic induction; irreducible Artin representation; dense SL₂ image. | Induced and Artin-up-to-twist alternatives both retained; regularity not silently used to remove the Artin alternative. |
| `rank-two-adjoint-monodromy` | J empty; diagonal PGL₂; disconnected subgroup; ramified inner form. | Empty product trivial, diagonal accounts for repeated projections; connectedness retained; unramified quasi-split forms require separate arithmetic descent, not abstract Goursat. |
| `rank-two-large-residual-image` | Induced or Artin-up-to-twist; coefficient residue field F_{l²}. | Absolute irreducibility conclusion distinct from strong-image branch; latter promises prime-field SL₂(F_l), not the full residue-field group. |
| `fontaine-laffaille-lifting-descent` | Identity extension; ramified E/F above p; reducible restricted residual representation. | Identity consistent; unramified local extension is required for unramified p-descent; split-test input prevents reducibility. |
| `ordinary-lifting-descent` | Identity extension; nonsplit p-adic extension; finite inertial discrepancy. | Soluble ordinarity descent kept as an explicit Geraghty source obligation; open inertia becomes full inertia only after the auxiliary construction. |
| `fontaine-laffaille-automorphy-lifting` | p=2 at n≥2; rank-one; polarization absent. | Prime bound excludes p=2; rank-one character supplier used separately; no polarization added to the rank-n theorem. |
| `ordinary-automorphy-lifting` | p=n; finite-order ordinary inertia factor; nonparallel weights. | Strict prime bound retained; open-inertia formulation retained; purity restriction on weights is a consequence, not an inserted hypothesis. |
| `ordinary-local-global` | n=1; reversed diagonal ordering; same polynomial with different flag order. | Rank-one supplier separate; both polynomial and ordered group-algebra product identities are required, with dominant weights and nilpotent quotient. |
| `iota-ordinary-automorphic-representation` | Weight-zero GL₁ unit/nonunit eigenvalue; ϖ′=uϖ; no ordinary eigenvector. | Unit eigenvalue passes, nonunit or absent vector fails; normalize by inverse algebraic weight before testing units; not Galois ordinarity alone. |
| `ordinarily-automorphic-representation` | Actual ordinary cuspidal witness; local ordinary Galois representation without witness. | First satisfies definition; local property alone supplies no automorphic witness; residual definition requires an ordinary automorphic lift. |
| `twisted-steinberg-ordinarity-criterion` | n=1,cτ=0; cτ=1; j=0,n; ramified coefficient/local field. | Weight-zero unit test consistent; normalization uses positive jcτ in valuation condition; primary eigenvalue proof remains Geraghty leaf. |
| `iota-ordinary-soluble-base-change` | Identity; completely split p-adic places; nonsplit local extension. | Split case identifies representations and weights directly; nonsplit equivalence not inferred from the split argument and remains a precise source leaf. |
| `integral-model-comparison` | Zero lattice; trivial Δ; p-torsion stabilizer. | Zero/trivial cases compatible; finite-free cellular claim requires a free action; groupoid model retained with stabilizers. |
| `boundary-level-coefficient-comparison` | Zero coefficient object; identity level; arbitrary non-Siegel boundary piece. | Triangle maps retain reduction and Satake action; only non-Eisenstein localization isolates the Siegel stratum. |
| `local-condition-mod-varpi-comparison` | χ=1; χ pairwise distinct but congruent mod ϖ; fixed determinant variant. | Paired reductions agree; sufficient coefficient roots chosen; global determinant varies, so fixed-determinant counts are not imported. |
| `arithmetic-component-dimension-input` | n=2,f=2; negative g; ordinary nonminimal torus component. | g=2q−8 must be nonnegative; codimension ℓ₀=3; ordinary claim applies over stated minimal prime only. |
| `arithmetic-derived-support-contract` | Zero perfect pair; rational point outside maximal component; O-torsion. | Nonzero rational amplitude and generic-component hypotheses retained; torsion is not detected by rational ordinary Hom; no integral R=T conclusion. |
| `simple-galois-composita` | Empty family; duplicate extensions; Δ=C₂; Δ=C₄. | Empty group trivial, duplicate contributes once; prime cyclic simple case valid; nonsimple C₄ outside hypotheses. |
| `symmetric-power-adjoint-genericity` | m=1; l=2m+3; normal closure losing PSL₂. | Strict bound and adjoint image over the new normal closure retained; disjointness over F alone does not replace the adjoint premise. |
| `qian-symmetric-power-avoidance` | n=1; n=2; F₁ meeting H′. | Sym⁰ trivial is generic without Lemma 7.1.6; n≥2 uses normal-closure avoidance to retain the PSL₂ image. |
| `genericity-normal-closure-restriction` | F≠Q; K=Q; a proposed Q-disjoint F′ containing F. | Disjointness is K/Q against the Galois closure; asking F′ to be Q-disjoint is impossible; K=Q recovers the original representation. |
| `residual-lifting-hypothesis-restriction` | F′=F; F′ meeting M; local norm with ramification. | Disjointness over F preserves both images and scalar class; norm restriction pulls back labelled weights; no genericity claim without normal-closure lemma. |
| `weak-automorphy-prime-to-set` | T empty; T singleton; matching outside finitely many places but failing at T. | Empty recovers weak automorphy; specified T imposes exact unramified polynomial matching and is not absorbed into an exceptional set. |
| `pure-weak-automorphy-upgrade` | Purity absent; π unramified at a comparison place; nontrivial monodromy. | Purity and local-global WD supplier retained; matching almost all Frobenius polynomials alone does not give every local compatibility assertion. |
| `density-one-crystalline-large-image` | Finite exceptional S; one coefficient place versus all λ∣l; induced system. | Density-one excludes S and requires all members; strong irreducibility retained; source generality is an explicit R24.5 obligation. |
| `rank-two-symmetric-power-transport` | n=1; n=3,m=0; eigenvalues 2,3 for Sym². | Sym⁰ rank one; m=0 repeated weights not regular; roots 4,6,9 have determinant216=6³; no automorphy inferred. |
| `rank-two-weight-zero` | {0,1},{1,0},{0,0}; empty embedding family. | First two pass as multisets, repeated zero fails; empty local table predicate vacuous but a number field has embeddings. |
| `rank-two-odd` | diag(1,−1); identity over Q; no real places; characteristic 2. | Values −1 and 1 differ over characteristic zero; empty family passes; characteristic 2 cannot distinguish signs and is excluded from coefficient fields. |
| `rank-two-member-irreducibility-equivalence` | Character sum; one irreducible member; arbitrary rank-three system. | Rank-two dichotomy supplies all-member equivalence; no arbitrary rank-three independence asserted. |
| `strong-irreducibility-symmetric-square` | Dihedral induction; regular strongly irreducible system; Artin twist. | Induced case gives reducible symmetric square; regularity excludes Artin-up-to-twist exception; no general rank-three lambda-independence used. |
| `corrected-rank-two-large-image` | Coefficient field with residue F_{l²}; strongly irreducible Artin-type system. | Conclusion remains conjugate prime-field SL₂(F_l); not the stronger residue-field group; strong irreducibility excludes finite-image Artin after finite extension. |
| `unitary-levi-weight-dictionary` | n=0; n=1 rows 2,−3; n=2 rows (2,1),(−3,−4). | Empty row dominant; bridge iff requires n>0; computed rows (3,2) and (4,3,2,1); no integral lattice duality inferred. |
| `auxiliary-cm-extension-prescriptions` | N=1; trivial versus quadratic local completion; real split prescriptions. | Identity at N=1; local degrees distinguish splitting; cyclic CM construction passes via totally real field, unlike arbitrary prescribed soluble local data. |

## Primary-source checks and retained obligations

All previously flagged interfaces were revisited. Public primary passages
confirm the orientation factor, normalized ordinary operators, rational versus
integral duality, determinant/neat component product, Satake-image restriction,
the separate ordinary polynomial/product identities, Chenevier's determinant
kernel versus faithful product separation, the prime-field rank-two conclusion,
and the auxiliary extension construction. In particular ACC's actual printed
g is the correct one, and its determinant product statement has the required
determinant equality and neatness. Neither was treated as a paper error.

The following seven inherited obligations remain explicit in the README:

1. Integral highest-weight modules, lattice splittings and lowest-weight
   projections need ReductiveGroupsIntegralRepresentationsPartII; no unrelated
   existing layer is assigned to them.
2. Arithmetic carriers and adapters need their named suppliers. R24.5 must
   reconcile all-member Hodge metadata with weakened compatibility and export
   integral lattices, reduction and Weil–Deligne transport. The local Lean cores
   do not silently supply these interfaces.
3. Geraghty's primary twisted-Steinberg eigenvalue and nonsplit ordinary soluble
   transport statements, Lemmas 5.2 and 5.7, remain source leaves. The official
   published page is a subscription preview; accessible BLGGT definitions,
   Qian's use of the lemmas and ACC's split-local argument do not prove both
   inputs. No uncleared book or unofficial copy was used.
4. Henniart/Serre rank-one classification and Larsen–Pink/Larsen monodromy need
   the extremely weak, arbitrary-number-field versions from R24.5. Larsen–Pink
   §6 (including Theorem 6.14) and Theorem 8.9 were read, but their stated
   rational compatible-system regime does not on its own discharge the exact
   adaptation here. Larsen's Theorem 3.17 primary text was not verified.
5. Uniform arithmetic free diamond-cell models, common minimal-rank bounds and
   compatible derived reconstruction must be proved before patching. They are
   not inferred for arbitrary good non-neat quotients.
6. Ordinary determinant transfer requires the polynomial-law/kernel argument
   over the larger GLₙ Hecke algebra, with O-flat unitary input and passage to
   every relevant group-algebra element. A map onto the Satake image alone does
   not give all identities of ACC Proposition 5.4.18.
7. Classification of unramified forms of products of PGL₂ needs the arithmetic
   forms interface. RG2.0a supplies Weil restriction, not that classification.

These are visible mathematical implementation/source obligations of the
roadmap, not unfinished packaging work. No exact source gap was concealed or
marked solved merely because a related paper was accessible.

The random additional sample used seed 7912. Each of these fifteen primary
locations was opened and its statement/normalization checked:

| Target | Primary locator and result |
| --- | --- |
| `central_torus_cohomology_shifting` | ACC Lemma 5.4.16 and (5.4.17), pp. 1020–1021: central triviality and torus-factor degree shift agree. |
| `ordinary_diamond_linear_hecke_map` | ACC Proposition 6.6.9, pp. 1079–1080: diamond-linear map, nilpotent quotient and Frobenius range agree. |
| `ordinary_torus_invariants` | ACC Lemma 5.2.6, p. 995: compact-torus invariants commute with this ordinary localization. |
| `genericity_making_character_twist` | ACC proof of Corollary 4.4.8, p. 984: locally trivial twisting choice is asserted there without a proof; the proof requirement remains visible. |
| `rank_two_symmetric_power_transport` | BCGNT discussion after Remark 6.2.2, p. 60: parallel Hodge formula agrees; determinant is supplied separately by symmetric-power algebra. |
| `rank_two_member_irreducibility_equivalence` | BCGP Lemma 9.1.10(1), pp. 251–252: the three rank-two conditions agree. |
| `fontaine_laffaille_base_change_fields` | ACC proof of Theorem 6.1.1, pp. 1072–1073: local splitting, avoidance and degree conditions agree. |
| `all_degree_fontaine_laffaille` | ACC Corollary 4.4.8, pp. 981–984: all-degree conclusion and geometric hypotheses agree. |
| `middle_degree_satake` | ACC Proposition 4.3.4, pp. 973–974: the degree and full-unipotent-level premise agree. |
| `completed_classical_ordinary_control` | ACC Proposition 5.2.15, p. 999: the ordinary comparison remains diamond equivariant. |
| `determinant_neat_level_shrinking` | ACC Lemma 5.4.15, pp. 1019–1020: shrinking is away from the prescribed places with the indicated power-subgroup condition. |
| `taylor_wiles_arithmetic_levels` | ACC (6.5.6)–(6.5.7), pp. 1064–1065: the pullback and trace maps have the stated scalar normalization. |
| `middle_range_fontaine_laffaille` | ACC Proposition 4.4.6, pp. 979–981: nonzero coefficient algebra and residual comparison hypotheses agree. |
| `OrdinaryGaloisCharacters` | ACC §5.1, p. 990: both unit and uniformizer formulas agree, including reversed weights and the cyclotomic factor. |
| `RankTwoOdd` | BCGP definitions before Lemma 9.1.10, p. 251: determinant −1 at real places agrees. |

## Public download provenance

The following public source files were obtained only for this job's scratch
reading. Each access date is **2026-10-10**. SHA-256 identifies the actual PDF,
not an abstract landing page. No source file or source passage is included in
the repository. The journal/physical-page distinction for Qian is retained.
The maintainer's library index was read; no restricted-library file was used.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| ACC, published CM-field paper | [Ramanujan.pdf](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |
| Qian, NSF published-version file | [NSF PDF](https://par.nsf.gov/servlets/purl/10388233) | `77969caa063c52027dc7274ccef679ce11a2382b8e0b5a8565847922a8d7c0d8` |
| BLGGT, Annals version | [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b` |
| BCGNT, Bianchi modular forms | [Author PDF](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf) | `cf0c334f106dc17aa39a77d97341ebe96743ac8dd1858006c99936d303efe915` |
| BCGP, potential modularity of abelian surfaces | [Author PDF](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf) | `1bbaa5c4f55fd2e15523953d40f41e518695025d758285eabd5ac829932c8051` |
| Chenevier, determinants | [arXiv PDF](https://arxiv.org/pdf/0809.0415) | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| Khare–Thorne, ordinary completed cohomology | [Cambridge manuscript PDF](https://www.repository.cam.ac.uk/bitstream/1810/254249/1/Khare%20et%20al%202016%20American%20Journal%20of%20Mathematics.pdf) | `744c31b9e5b28e1c5ea5f5322992d40b1e398c7fcecf5765a0a61238c0a3e579` |
| Larsen–Pink, compatible systems | [Author PDF](https://people.math.ethz.ch/~pink/ftp/LP2.pdf) | `7b904ef1ee7e136a5d2c1aa73a5f2eee603e91ba8c6188fb230fadd9e1a02e13` |
| Clozel–Harris–Taylor | [Numdam published PDF](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |

The official [Geraghty article page](https://link.springer.com/article/10.1007/s00208-018-1742-4)
was checked but does not expose the primary lemmas; it is not recorded as a
downloaded full text.

## Validation and next step

`lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`
finished with exit 0 at the pinned Mathlib. The final log has 97
declaration-uses-`sorry` warnings, no errors and no other warnings. The file has
not changed since that final elaboration. Memory was checked before compiling,
the shared wrapper was used, and no Lean process for this job is left running.

The structural/completeness audit confirms 124 target sections, all 123 accepted
anchors, all 122 named API items and 90 named checks, six ordered layers,
Examples and Dependencies in every layer, definition names either in Lean code
or in the closing list, and README size below 200,000 bytes. Numeric/exhaustive
checks are described above so that no scratch artifact is needed to understand
or resume the work.

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`
  passes with zero errors and zero warnings. The unchanged packet reports
  123 nodes (29 definitions, 94 theorems), 122 API items, 90 tests, 34 planets,
  six planned layers, seven gaps and 36 supplier requests.
- `python3 research/blueprint/intake.py check-files` on the four authorized
  deliverables reports four files and zero problems.
- `git diff --check` passes. The changed-path check contains only the two
  revised package files and this handoff; metadata and review.json are unchanged.
- A declaration scan verifies a docstring before each of the 117 declarations
  and examples, one Mathlib import, the required namespace, and no `lemma`,
  `True` or proposition-valued `sorry` definition. Every downloaded public PDF's
  SHA-256 matches the provenance table above.

Resume with a fresh independent package review of README.md and the actual
representative signatures, particularly the normalization witnesses, newly
owned auxiliary extension construction and explicit source/interface leaves.
The higher-owner and ClassFieldTheory-link updates described above are outside
this job. This session takes no second job and does not review its own work.
