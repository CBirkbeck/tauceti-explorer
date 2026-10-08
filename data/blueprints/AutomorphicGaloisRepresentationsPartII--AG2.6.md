# Galois representations attached to regular algebraic automorphic representations of GL_n

## Coefficient-prime comparison and arithmetic exports

A characteristic-zero automorphic representation gives several different kinds of arithmetic information. Its good Hecke eigenvalues give Frobenius polynomials. A geometric realization can identify a filtered de Rham or crystalline module. Local–global compatibility identifies a Weil–Deligne representation; the monodromy operator carries information which a semisimplified Weil representation forgets. Reduction requires a finite p-adic field of definition and a stable lattice, and produces an intrinsic semisimple residual representation. These interfaces must retain the distinctions between an eigenvalue, a representation and an isomorphism class.

AG2.6 applies coefficient-prime comparison to the constructed automorphic representations and assembles their compatible systems. AG2.7 supplies integral and residual comparisons, Hecke ideals, auxiliary-prime genericity and the typed interfaces used by arithmetic consumers. The generic compatible-system carrier belongs to PotentialModularityAndCompatibleSystems R24.5:operations. The classical and all-Hilbert rank-two families and their coefficient-prime geometry belong to AutomorphicGaloisRepresentations R19.3 and R19.5. The constructions here identify the exact common specializations. The current R24.5 packet contradicts itself about which local conditions belong to the carrier. Until its owner separates raw data from Weak, VeryWeak, ExtremelyWeak and stronger predicates, the imports and assembly operation here are conditional supplier interfaces. AG2 does not define another compatible-system carrier.

The ground field is CM for an arbitrary regular algebraic cuspidal representation. The totally real branch imposes the essentially self-dual polarization hypotheses of BLGGT. The GSp4 branch is the regular, good-level transferred branch over Q; its transfer and local Langlands dictionary belong to ModularityAndLanglandsExtensions ML.4. A unitary endoscopic sum has labelled cuspidal constituents and explicit algebraic twists. It need not be an irreducible cuspidal GL_n representation.

### Conventions and coefficient fields

Write ε_ℓ for the cyclotomic character, with HT(ε_ℓ)=−1. Artin reciprocity sends a uniformizer to geometric Frobenius. The representation r_{π,ℓ,ι} has geometric good Frobenius polynomial

P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}, with t_{v,0}=1.

The final term includes (−1)^n. For n=1 this is X−t_{v,1}. Local comparison uses rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}); the conversion from algebraic Satake normalization belongs to AG2.0 and its agreement with local Langlands belongs to AG2.5. The highest weight is indexed from 1 through n, and the labelled multiset is

H_τ={a_{τ,1}+n−1, a_{τ,2}+n−2, …, a_{τ,n}}.

For a weight-k classical form, a=(k−2,0), this gives {k−1,0}. The sum is Σ_i a_{τ,i}+n(n−1)/2, the determinant Hodge weight. A determinant sum does not characterize the multiset: {0,3} and {1,2} have the same sum. The p-adic Hodge supplier uses HT(ε)=+1 and the negatives of de Rham filtration jumps. The supplier’s Hodge numbers are negated when they are exposed in this convention. Its filtered modules and monodromy maps themselves are transported through the explicit convention dictionary, rather than silently dualized.

For polarized weights a_{τ,i}+a_{τc,n+1−i}=w, the purity weight is W=w+n−1. The multiplier is μ_λ=ε_ℓ^{1−n}r_{χ,λ}. The algebraic character system r_χ has purity weight 2w. At a real place the total-odd sign equation is μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so χ_v(−1)=(−1)^{n+w} gives μ_λ(c_v)=−1. This explicit sign includes the algebraic weight; the source’s simplified sign cannot be used outside its intended parity. These conventions are supplied by AG2.0, including its corrected polarization dictionary.

Three coefficient fields play different roles. M_π is the number field of rationality of the finite automorphic representation and good Frobenius polynomials. A finite E/Q_ℓ realizes one λ-member and permits a lattice theorem over a local field. A strong coefficient number field E⊂C simultaneously realizes all λ-members over its completions. There is no implication that the smallest rationality field is a strong field merely because all good polynomial coefficients lie there.

For the general conjugate-self-dual cohomological cuspidal branch, strong-field existence comes from Chenevier–Harris Proposition 3.2.5, p.12. Two regular good Frobenius elements of different residue characteristics permit one finite number-field enlargement for every λ: each λ uses a place away from its characteristic. The definition below generalizes Liu’s named specialization to this domain. For a relevant representation in Liu et al., relevance means cuspidality, conjugate self-duality, and the fixed archimedean principal series with characters arg^{1−n}, arg^{3−n}, …, arg^{n−1}, where arg(z)=z/|z|. It is a regular algebraic specialization. A strong coefficient field contains its rationality field and gives a continuous E_λ-realization for every λ, compatible with every complex/p-adic embedding inducing λ. Chenevier–Harris proves existence of an enlarged strong field. Liu’s Hypothesis 3.2.10 concerns the more specific middle-degree cohomological realization and is needed for the stated minimal-field rationality consequence. It is retained as a hypothesis; the unpublished input cited for some higher-rank cases is not converted to an unconditional theorem (Liu Definition 3.2.5, Remark 3.2.6 and Hypothesis 3.2.10, pp.145–146).

### Geometric and family comparison

The polarized construction begins with actual smooth proper PEL or Kuga–Sato cohomology, its algebraic coefficient representation, projectors and the specified Tate twist. Apply crystalline and de Rham comparison to that cohomology. Functoriality, strict exactness and compatibility with cup products restrict the comparison maps to the projector images. A representation being attached at good places is not enough to apply geometric comparison: the realization, degree and multiplicity must be supplied by AG2.1a. Its currently named polarized-construction node gives attached-representation conclusions, not that raw interface. The direct prerequisite is therefore the owning stage with an exact input request; period admissibility is not used to manufacture its own geometric input (Chenevier–Harris §1.5, pp.6–7).

Chenevier–Harris Theorem 2.3 uses a family varying weights at a chosen coefficient-prime place v_0. At the other coefficient-prime places the Hodge type is held constant, and the bounded-family comparison theorem passes the geometric comparison to the desired member. The theorem does not make the same de Rham assertion at v_0. Their S-general cyclic patching and Theorem 3.2.3 remove that exclusion. One chooses extensions with the required local behavior and enough coefficient-prime places, excludes the finite bad extensions that lose cuspidality, verifies compatibility on intersections and invariance, and descends. This argument cannot be replaced by a claim that arbitrary limits of de Rham representations remain de Rham.

Full monodromy comparison uses more geometry. Caraiani’s semistable model has two boundary directions, and its log de Rham–Witt weight sequence uses strata Y^(r,s). In the indexing of Theorem 4.6 its E_1 term is

E_1^{−h,i+h}= ⊕_{j≥0, j≥−h} ⊕_{k=0}^j ⊕_{m=0}^{j+h}
H_cris^{i−2j−h}(Y^(k+m+1, 2j+h+1−k−m)/W)(−j−h),

converging to H_log-cris^i(Y/W). The sequence carries Frobenius, residue maps and the monodromy operator. Proposition 4.4 identifies the residue operator with N. The projected cohomology of closed strata is then compared with étale cohomology; the relevant projected degree concentration i=2n−2 gives degeneration and purity in Proposition 5.1, pp.31–32. A separate AG2.1a request supplies this tensor-square/closed-stratum realization, its multiplicity and Tate twist. The smooth proper raw realization alone does not supply it. Existence of a weight spectral sequence alone does not give purity. The indexing and residue operator are those of Proposition 4.4 p.29 and Theorem 4.6 p.31. The reusable sequence extends the ordinary Hyodo–Kato theory in CrystallineCohomology CR.6, and the weight inference uses WeightsInEtaleCohomology R34.6.

Caraiani’s Theorem 1.1 identifies the full Frobenius-semisimple WD representation at v|ℓ for conjugate-self-dual cohomological cuspidal representations, without a Shin-regularity assumption. The algebraic character twist produces the polarized case. Temperedness and pure-WD uniqueness are separate inputs. The proof uses the geometric Iwahori case before the general purity argument; it does not feed the general theorem back into its own geometric starting point.

For an arbitrary nonselfdual regular algebraic cuspidal π over CM F, A’Campo–Hevesi–Thorne–Whitmore, arXiv:2607.11763v1, Theorem 1.2.1 gives de Rham admissibility, the full labelled Hodge multiset and equality of the semisimplified WD parameter at the coefficient prime. Corollary 1.2.2, p.6, gives the monodromy dominance bound, proved by the generic maximal-orbit argument of Corollary 6.0.6, pp.111–112. It uses quantitative Hecke annihilators outside the middle degree, bounded p-adic Hodge pseudodeformation spaces with arbitrary residual multiplicities and the non-Siegel boundary analysis. It imposes neither residual irreducibility nor decomposed genericity. Its genericity in the proof of the monodromy bound is the characteristic-zero condition Hom_WD(D,D(1))=0, distinct from all residual predicates below.

Equality of the semisimplified Weil parameters is a separate conclusion of Theorem 1.2.1, pp.5–6. The order itself compares partial sums of the largest Jordan-block sizes within each irreducible Weil type modulo unramified twist; it does not impose that equality (AHTW Definition 6.0.2 and Corollary 6.0.6, pp.111–112). At a spherical coefficient-prime place the upper-bound N is zero, so the bound forces N=0. At an Iwahori place the WD inertia is trivial. De Rham implies potentially semistable; the supplier’s WD criterion therefore gives crystallinity in the spherical case and semistability in the Iwahori case. The full monodromy equality for a general ramified nonselfdual local component is not asserted. These source conclusions prove the intended weak predicate once the R24 data/predicate interface exists. AHTW Theorem 3.3.6, p.34, uses bounded stable-condition pseudodeformation quotients with arbitrary residual multiplicities and the WE15/WWE19 comparison methods. The paper avoids assuming a general formal GAGA theorem; its Theorem 3.2.4, p.30, proves a fully faithful completion component. Neither this result nor the existing fixed-representation deformation foundations supply the complete missing quotient/cohomology interface recorded below.

### Integral and residual interfaces

Finite local realization comes first. The compact image of G_F lies in the countable union of GL_n(E) for finite subextensions E of Q̄_ℓ/Q_ℓ. Each intersection is closed. Baire gives a relatively nonempty interior for one closed subgroup intersection, which is consequently an open subgroup of the compact image. Its index is finite. Adjoining the entries of finitely many coset representatives gives a finite field containing all matrices (Calegari–Geraghty, proof of Proposition 6.8, author-copy p.39). Compactness over this local field then gives a stable O_E-lattice.

Reduce the lattice and semisimplify. The semisimple isomorphism class is independent of lattice and auxiliary coefficient extension at fixed λ by residual Brauer–Nesbitt. An arbitrary lattice need not carry a perfect integral polarized pairing, and no self-dual lattice is inferred from its stability. The residual polarized extension is supplied at the level of the semisimple polarized representation. Finite-field descent uses the field generated by the reduced characteristic-polynomial coefficients and the vanishing of the finite-field Brauer group.

The ordinary matrix coefficient map already provides the polynomial comparison: charpoly(A mapped by red)=charpoly(A) mapped by red. For integral A∈GL_n(O_E) the constant term is a unit; semisimplification leaves the characteristic polynomial unchanged. Thus all good Frobenius polynomials reduce correctly. No new nonreduced determinant law is constructed here; interpolation of the classical polynomial comparisons belongs to IntegralHeckeAndGaloisDeterminants.

A maximal ideal m of T^S with finite residue field is of Galois type when it admits a continuous semisimple residual representation with every specified good Hecke polynomial. It is non-Eisenstein precisely when that realization is absolutely irreducible. The kernel m_{π,λ} of the reduced integral eigencharacter is unchanged by the lattice, basis or finite extension of the local coefficient field inducing the same λ. Different λ can give different ideals. The dual Hecke ideal corresponds to r_m^∨⊗ε̄^{1−n}, whose geometric eigenvalues are q_v^{n−1}/α_i. In a rank-2n unitary system the exponent is 2n−1. Integral character twists give the corresponding scalar twist of the residual representation.

The necessity of semisimplification has a concrete test. For the continuous Z_5-action r(t)=[[1,5t],[0,1]], the stable lattices with bases (e_1,e_2) and (5e_1,e_2) reduce to the identity representation and a nontrivial unipotent representation. Their semisimplifications are both 1⊕1. A lattice-independent raw reduction would fail this example.

### Genericity at auxiliary primes

For L/Q_p finite, ℓ≠p and a finite coefficient field k of characteristic ℓ, ACC+ local genericity means trivial inertia and α_i/α_j≠q for all i≠j, where q is the residue cardinality and the α_i are nonzero eigenvalues over k̄, counted with multiplicity. The list need not have distinct entries. Over F_3 with q=2, (1,1) is generic; over F_5 with q=2, the distinct list (2,1) is not. When q=1 a repeated list of length at least two fails. In rank one the ratio clause is empty, but unramifiedness is still required.

A rational prime p is decomposed generic for r over F when p≠ℓ, p is completely split in F, and every v|p satisfies the local predicate. Complete splitting makes q_v=p at every such place. The representation is decomposed generic when one such prime exists (ACC+ Definition 4.3.1(2) for the prime, (3) for the existential representation condition, p.972). One generic place in an inert fiber does not supply the global condition. For F=Q and the trivial rank-two representation over F_3, p=2 is a witness while p=7 is not. The same example proves that decomposed genericity does not imply global irreducibility.

Caraiani–Scholze Definition 1.9 gives the stronger local specialization: the ratios avoid both 1 and q. This is local ACC+ genericity together with pairwise distinctness. It is defined for every finite L/Q_p, rather than only Q_p. Liu Appendix D displays this stronger condition, and its footnote explains that distinctness can be removed in the corresponding noncompact concentration input. A separate strong predicate preserves that distinction. Over F_7 with q=2, (1,3) is strong-generic because its ordered ratios are 3 and 5. For an unramified quadratic extension of Q₂ and coefficients F₃, q=4≡1, and the repeated list fails the stronger predicate; the actual Lean example checks that failure, not only the congruence (Liu Definition D.1.2 and footnote 37, p.365).

Scalar multiplication, permutations and inversion preserve the eigenvalue predicates. Inversion exchanges the ordered pair. Conjugacy, coefficient extension and changing a Frobenius lift preserve local genericity when inertia is trivial. A scalar twist preserves local unramifiedness only if the character is unramified there. A ramified quadratic scalar twist of the trivial rank-two representation over F_3 at Q_2 has the same projective representation and the same ratios but fails the local predicate. The projective-invariance sentence in ACC+ must therefore be qualified for the local interpretation.

The global existential condition is invariant under a finite residual-character twist. ACC+ Lemma 4.3.2 gives infinitely many witnesses: include the field cut out by r, a normal closure of F and Q(ζ_ℓ) in one finite normal extension, then reproduce the original witness’s conjugacy class by Chebotarev. The cyclotomic field preserves p mod ℓ, and the normal closure preserves all places above p. The resulting positive-density set avoids any fixed finite set, including the twist’s ramification. Enormousness of the image restricted to G_{F(ζ_ℓ)} remains a separate ArithmeticGaloisRepresentations G7 condition; its adjoint-cohomology clauses are not part of genericity.

For relevant Π, Liu Corollary D.1.4, p.368, excludes finitely many coefficient places where root differences or nonratio differences vanish, and then finds a locally generic place split in F/F⁺. This local splitting conclusion does not itself give ACC+’s completely split rational prime with genericity at every place above it. The latter needs its own Chebotarev argument and hypotheses; cohomological concentration remains downstream.

The planned exports keep these strengths visible. GoodPrimeExport receives the common characteristic-zero data and good polynomials. NonselfdualComparisonExport adds the AHTW de Rham/Hodge, semisimplified Weil and monodromy-bound interfaces. PolarizedComparisonExport requires an actual pairing, purity and a single local map intertwining both Weil and N. UnitaryDiscreteExport retains two labelled constituent representations and explicit algebraic twists. ResidualPolynomialExport retains a chosen finite local realization and lattice along with semisimple reduction and Hecke comparisons. The Lean prototypes encode the algebraic components of these packages; the missing period, geometric and supplier predicates are listed at each node.

The unitary export uses the literal occurrence input of Caraiani–Scholze Corollary 5.5.5 and its §5.1 setup: F=F⁺·𝒦, with 𝒦 imaginary quadratic; F⁺≠Q, the stated ramification/splitting condition, the finite quasi-split unitary group, and the stipulated prime/level data (pp.730–731, 745–746). Each constituent has rank nᵢ, and the corrected splitting field is 𝒦, not the corollary’s undefined F₀. Global transfer belongs to ET.7a; ET.6 supplies its local correspondence. Remark 5.5.6 supplies the away-ℓ full local comparison. The parity auxiliary character and norm to 𝒦 remain explicit.

### Prototype boundaries

The suggested file elaborates at the pinned Mathlib with only warnings for incomplete proofs. It contains all 38 unique main declaration names, all 58 API names and all 49 tests as labelled typed examples. These are suggested forms, with implementation status **unchecked**. The definitions use concrete bodies, Mathlib semisimplicity and Mathlib irreducibility over an algebraic closure. No arbitrary proposition field, empty predicate or substitute automorphic/Hecke carrier fills a missing hypothesis.

System and its assembly/member projections are universally supplied parameters for the single corrected R24 data carrier. The local prime predicate uses the entire externally supplied nonempty place fiber, with e=f=1 and local genericity at every place; the singleton test fiber is only the Q specialization. Its coefficient characteristic is explicitly constrained to ℓ. Characteristic-zero and finite-residue-field recognition hypotheses are retained where algebraic semisimple uniqueness uses them.

| Suggested form | What the elaboration establishes | What remains outside its statement |
| --- | --- | --- |
| Concrete definition/API fragment | The actual homomorphisms, matrices, polynomials and proof fields have compatible types | Automorphic, geometric, topological and number-field provenance listed at the node |
| Output signature with omitted hypotheses | The target conclusion has the intended Hodge, purity or intertwiner shape | Necessary unavailable hypotheses; such a signature is not a valid assertion for arbitrary input matrices |
| Labelled example | The indicated algebraic portion uses the named definition or supplied realization | Full class-field, lattice, period or automorphic construction when explicitly omitted |
| Shared comparison component | Existing signatures/examples check the overlap or loss of information | A second construction of the supplier’s theory |

The rank-one good and nonselfdual tests inhabit their actual wrappers. The polarized weight-k test reads the full Hodge multiset from a wrapper. The unitary two-character sum explicitly fails irreducibility. The rational-trace test uses quaternionic matrices with no Q model to exhibit a descent obstruction. Partial examples state their limits: for instance, the two unipotent lattice examples check unequal raw reductions at t=1 with equal polynomials, while the Z₅ lattice construction itself is absent.

## Declaration-level plan

The following entries are organized by the AG2 consumer outputs, not by sections of any source. Each gives the full planned statement and proof route, direct supplier inputs, API and tests, source locators, and the narrower suggested Lean component. No source passage is reproduced.

| Supplier | Interface used here |
| --- | --- |
| R24.5:operations | Conditional single raw-data carrier; separate weak/very weak/extremely weak, pure and polarized predicates; assembly, weakening and linear operations |
| R19.3 and R19.5 | Fixed classical/Hilbert systems and full coefficient-prime comparison on the exact regular-weight overlap |
| PadicHodgeTheory R06.2, R06.4, R06.5 | Period exactness/base change, bounded-family extension, ordinary filtration and projector-compatible geometric comparison |
| CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.6 | Requested two-boundary extension and weight/purity inference after projected diagonal concentration |
| ArithmeticGaloisRepresentations G7 | Requested residual polarization through semisimplification and CM conjugation extension, before the polarized deformation problem |
| ArithmeticGaloisRepresentations R01.1, R01.5 | Finite local realization/lattices and existing arbitrary-rank recognition; requested precise regular-Frobenius descent splitting |
| AG2.1a | Two separate requests: raw projector-compatible cohomology before comparison; Caraiani tensor-square and closed-stratum concentration |
| AG2.0, AG2.2–AG2.5 | Weight/normalization, algebraic twists, bounded families, boundary analysis and local comparison |
| ET.6; ET.7a | Local correspondence; pure global transfer and controlled solvable descent, respectively |
| IHG.3 | Integral unramified Hecke algebra, eigencharacters, residue quotient and involution APIs |
| AF.4; ML.4 | Automorphic coefficient conjugation and GSp4 transfer/Harish–Chandra/Satake normalization |
| PA.1; Igusa/torsion infrastructure (consumers) | Arithmetic lifting and concentration with their separate residual-image, level and field hypotheses |

## AG2.6. Coefficient-prime comparison and compatible systems

### Weak, very weak and extremely weak automorphic data

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`. Kind: comparison. Implementation: unchecked.

Conditional on the R24.5:operations owner separating data from admissibility, use its single arbitrary-rank data carrier: coefficient number field M, finite S, common good-prime polynomials P_v, continuous semisimple members r_λ and labelled Hodge metadata H_τ. The carrier does not intrinsically require the members to be de Rham, crystalline, pure or polarized. Weak, VeryWeak and ExtremelyWeak are predicates supplied by that owner. Weak requires de Rhamness at every v|ℓ for every λ, the full labelled Hodge multisets for all members, and crystallinity when v|ℓ lies outside S. VeryWeak retains the determinant Hodge sums for all λ and, outside a set of rational ℓ of Dirichlet density zero, requires every λ|ℓ to be crystalline at every v|ℓ with the full labelled Hodge multisets for every coefficient embedding over M. ExtremelyWeak drops this density-one clause and retains the determinant Hodge sums for all λ. Prove Weak ⇒ VeryWeak ⇒ ExtremelyWeak on those same data. No higher-rank converse is asserted. The two current R24.5 supplier statements do not yet give this consistent interface, so this is a requested import, not a verified existing construction.

Proof route:

1. Obtain the owner’s corrected data/predicate interface before importing weakening maps; do not reuse the current carrier with full weak conditions built in as extremely weak data.
2. Transport AG2 geometric Frobenius and HT(ε)=−1 through the owner’s normalization parameter.
3. Use the supplied weakening implications. The labelled determinant sum forgets information in rank greater than one.

Direct inputs:

- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- For n=2 the lists {0,3} and {1,2} have the same determinant sum and are distinguished by weak compatibility.
- Rank-one extremely weak data become weak through the supplier’s algebraic-character classification.

Suggested Lean component (shared-component): The Hodge-sum acceptance calculation and the determinant-sum counterexample are typed; the data/predicate comparison stays a conditional supplier import.

Omitted conditions: R24 raw data and Weak/VeryWeak/ExtremelyWeak predicates; their density and local period conditions.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1086. These are imported predicates on one carrier.

### Comparison on the geometric automorphic summand

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.geometricCoefficientPrimeComparison`.

For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.

Additional input conditions:

- AG2.1a first supplies the raw smooth proper PEL or Kuga–Sato realization, algebraic coefficient representation, cohomological degree, commuting Schur/isotypic idempotents, multiplicity and Tate twist. Its currently named attached-representation conclusion does not supply these data.
- The claimed good or strictly semistable reduction belongs to that realization and the specified local model. Comparison is applied to its cohomology before any admissibility conclusion about the attached representation.

Proof route:

1. Obtain the requested raw AG2.1a realization and projector/multiplicity/Tate dictionary independently of an attached-representation admissibility theorem.
2. Restrict the functorial geometric comparison to projector images, using strict exactness of the period functors.
3. Read each Hodge graded piece in the algebraic coefficient system; negate the supplier’s HT(ε)=+1 weights at this boundary.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.1a`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`
- `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`
- `PadicHodgeTheory:R06.5`

Acceptance checks:

- For a classical weight-k base-change form the AG2 multiset is {0,k−1}.
- Projector images commute with coefficient extension; dimension equals the cohomological multiplicity times n.

Suggested Lean component (algebraic-fragment): An actual linear equivalence commuting with supplied idempotents induces an equivalence of their ranges.

Omitted conditions: Raw PEL/Kuga–Sato geometry, period functors and Hodge filtration, cohomological multiplicity and Tate normalization.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7. Geometric cases, including the dual convention.

### Hodge comparison through deformation and descent

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientHodgeComparisonThroughDescent`.

For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

Proof route:

1. Use the imported Fredholm determinant, finite-projective slope summands and completed base change in the AG2.3 eigenvariety interface, then apply the constant-weight bounded-family period theorem at places other than v_0.
2. Use S-general cyclic extensions disjoint from the finite bad cuspidality extensions; patch by intersection compatibility and invariance.
3. At a target coefficient place choose a solvable extension splitting enough other places, then descend the period comparison and recover its filtration.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.3`
- `LocallyAnalyticDistributions:L4/fredholm-determinant`
- `LocallyAnalyticDistributions:L4/finite-slope-summands`
- `LocallyAnalyticDistributions:L4/completed-base-change`
- `PadicHodgeTheory:R06.2/de-rham-base-change`
- `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`
- `PadicHodgeTheory:R06.2`

Acceptance checks:

- The place v_0 is absent from Theorem 2.3’s de Rham claim and present in Theorem 3.2.3.
- The labelled multiset, not only its sum, survives descent.

Suggested Lean component (algebraic-fragment): Equality of supplied labelled Hodge multisets descends along a surjective restriction of labels.

Omitted conditions: Bounded constant-Hodge-type family and its geometric dense locus; exceptional v₀; cyclic patching/local splitting and period descent.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12. Other coefficient places first; cyclic patching removes the exclusion.

### Polarized admissibility at the coefficient prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.polarizedCoefficientPrimeAdmissibility`.

Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.

Proof route:

1. Use the Chenevier–Harris descent theorem for Hodge admissibility.
2. Apply geometric semistable/crystalline comparison in the Iwahori/spherical cases.
3. Keep the proof order: the geometric Iwahori case precedes Caraiani’s general full-monodromy argument.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `PadicHodgeTheory:R06.3/weil-deligne-parameter`

Acceptance checks:

- An unramified local component has N=0 and the expected crystalline polynomial.
- An Iwahori component may have N≠0; semistable does not mean crystalline.

Suggested Lean component (output-signature): The representation-indexed Hodge projection has the full expected multiset, using one-based aᵢ translated to Fin n.

Omitted conditions: Polarized regular algebraic cuspidality and actual geometric realization; de Rham/crystalline/semistable predicates and Iwahori/spherical hypotheses. Necessary automorphic hypotheses are omitted, so this is not a universal assertion about arbitrary r or HT.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3)–(4), pp.33–34. Admissibility and the Iwahori comparison.

### Log-crystalline purity of the automorphic summand

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.logCrystallineAutomorphicPurity`.

In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

Additional input conditions:

- The separate AG2.1a tensor-square realization includes the two distinguished coefficient-prime places, the closed two-index strata, cohomological multiplicity and coefficient-system projector/Tate twist. Its projected stratum concentration is proved before degeneration and purity are inferred.
- The log model used for comparison is proper, fine and saturated, log smooth and vertical over the standard log DVR, with special fiber of Cartier type. The second boundary uses its own divisors and s factors. With m smooth local coordinates, a nonempty (i,j)-stratum has dimension 2n+m−i−j; carry this dimension and the Kuga–Sato/Tate shifts into the spectral sequence.

Proof route:

1. Use the actual tensor-square cohomological realization and projector in §§2 and 5.
2. Apply the two-boundary log de Rham–Witt spectral sequence, including N realized by the residue operator.
3. Compare closed-stratum crystalline and étale cohomology; projected concentration along i=2n−2 gives degeneration and pure graded pieces.
4. Recover purity on the automorphic summand through the monodromy filtration.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`
- `CrystallineCohomology:CR.6`
- `WeightsInEtaleCohomology:R34.6`
- `AutomorphicGaloisRepresentationsPartII:AG2.1a`

Acceptance checks:

- Keep both stratum indices; a one-divisor Rapoport–Zink sequence is not the required input.
- A mixed cohomological summand without the concentration theorem does not pass the purity test.

Suggested Lean component (output-signature): The supplied monodromy-graded Frobenius matrices have squared root norm q^(W+i).

Omitted conditions: Two-boundary log de Rham–Witt complex, Frobenius/residue maps, closed-stratum projectors and diagonal concentration; monodromy filtration. These necessary geometric hypotheses are omitted.

Sources:

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32. The projected two-boundary spectral sequence supplies purity.

- [Caraiani, published version](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf), §3A, pp.1609–1611, including Lemma 3.2; comparison hypotheses immediately before Corollary 2.3, p.1609. Specifies the log comparison domain and both independent boundary directions; E6–E8 record corrected indices and the dimension contribution of the smooth coordinates.

### Full polarized local–global compatibility at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.fullPolarizedCoefficientPrimeComparison`.

For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.

Proof route:

1. Twist to the conjugate-self-dual branch and take solvable local base change to an Iwahori situation.
2. Use log-crystalline purity of the tensor-square realization and the established temperedness theorem.
3. Apply Taylor–Yoshida pure WD uniqueness to the known semisimplification, then descend and undo the character twist.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`
- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Acceptance checks:

- A Steinberg parameter retains its nonzero N.
- The even-rank non-Shin-regular case is included.

Suggested Lean component (output-signature): A single invertible u intertwines both the Weil action and monodromy N.

Omitted conditions: Polarized automorphic/geometric hypotheses, de Rham/WD constructions and tensor-square purity with pure-WD uniqueness. Necessary hypotheses are omitted; arbitrary matrix pairs need not admit such u.

Sources:

- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2; §§2 and 5. Equality includes N, including even non-Shin-regular weights.

### Nonselfdual de Rham comparison at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.allCMCoefficientPrimeComparison`.

A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.

Proof route:

1. Use quantitative Hecke annihilators for cohomology outside the middle degree (Theorem 2.5.7), via local Shimura cohomology and Mantovan’s formula, rather than a residual genericity assumption.
2. Use bounded potentially semistable pseudodeformation quotients for arbitrary residual multiplicities (Theorem 3.3.6).
3. Control non-Siegel boundary terms and shift interior cohomological degrees; induction on n yields the bounded torsion local–global comparison P(n,a,S,T_n) in Proposition 5.2.8.
4. After suitable cyclic base change remove the auxiliary local-degree inequalities in Proposition 5.2.8 and apply Theorem 5.2.9.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `PadicHodgeTheory:R06.3/weil-deligne-parameter`
- `AutomorphicGaloisRepresentationsPartII:AG2.4`

Acceptance checks:

- Reducible residual representations are allowed.
- The result is equality after ss, not an equality of monodromy operators.

Suggested Lean component (output-signature): Full labelled Hodge multisets and conjugacy of supplied semisimplified Weil projections are typed, with no N intertwiner.

Omitted conditions: Regular algebraic CM cuspidality; actual period/WD projections; AHTW quantitative cohomology and bounded pseudodeformations. These necessary hypotheses are omitted.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9. All regular algebraic CM cuspidal representations.

### Nonselfdual monodromy bound at ℓ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.nonselfdualCoefficientPrimeMonodromyBound`.

Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.

Proof route:

1. Use the ss equality from Theorem 1.2.1.
2. Local genericity of a cuspidal global π implies its local rec^T parameter is generic in the WD sense Hom_WD(D,D(1))=0.
3. Apply Proposition 6.0.5 and Corollary 6.0.6: its monodromy is maximal in the fixed-Weil-parameter space.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`

Acceptance checks:

- Two parameters with the same Weil semisimplification and different N can satisfy a strict inequality.
- WD genericity here is a characteristic-zero Hom condition, not AG2.7 residual genericity.

Suggested Lean component (output-signature): Partial-sum dominance of supplied Weil-type block lists is typed independently of semisimplified Weil equality.

Omitted conditions: Frobenius-semisimple WD construction, extraction of descending Jordan block lists by irreducible Weil type modulo unramified twist, automorphy and maximal-orbit hypotheses. Arbitrary lists do not satisfy this output without the omitted hypotheses.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.111–112. Generic local GL_n parameters occupy the maximal monodromy orbit.

### Nonselfdual spherical and Iwahori admissibility

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.allCMCrystallineIwahoriAdmissibility`.

For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.

Proof route:

1. Apply the p-adic monodromy theorem.
2. A finite inertia action in characteristic zero is semisimple; triviality of its semisimplification therefore gives trivial inertia.
3. For spherical π_v all Jordan blocks on the upper bound have size one, so the dominance order forces N=0.
4. Apply the supplier’s semistable/crystalline criterion and Frobenius comparison.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`
- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`
- `PadicHodgeTheory:R06.3/weil-deligne-descent`

Acceptance checks:

- An Iwahori parameter may retain nonzero N.
- No Fontaine–Laffaille weight range or residual genericity is required.

Suggested Lean component (algebraic-fragment): A monodromy matrix of rank at most zero is zero.

Omitted conditions: Actual WD inertia, crystalline/semistable period criteria, spherical and Iwahori hypotheses; the Iwahori semistability output.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Admissibility is a consequence using the imported WD criteria.

### Totally real polarized coefficient-prime descent

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.totallyRealPolarizedCoefficientPrimeComparison`.

For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

Proof route:

1. Use the totally-real attached representation from AG2.0 and BLGGT.
2. Choose a cuspidality-preserving quadratic CM extension split at the prescribed finite place and identify the restrictions by their good polynomials.
3. Apply the full polarized CM coefficient-prime theorem at the unchanged local field and transport its Hodge/WD data.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`

Acceptance checks:

- The completion at the selected place is unchanged by split base change.
- The rank-two exact R19 overlap imports its full all-Hilbert theorem.

Suggested Lean component (algebraic-fragment): Conjugacy after a local group isomorphism implies conjugacy before that isomorphism.

Omitted conditions: Totally-real polarized automorphic branch, split CM base change, its local-completion identification and controlled descent.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §2.1 terminology. The source allows CM or totally real polarized fields.

### Embedding independence and semisimple uniqueness

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientEmbeddingIndependence`.

Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.

Proof route:

1. Use Chebotarev density to extend equality from good Frobenius classes to continuous characteristic-zero traces or characteristic polynomials.
2. Apply arbitrary-rank semisimple Brauer–Nesbitt.
3. For changes of ι fixing M_π, good polynomials coincide; conclude isomorphism, retaining scalar automorphisms.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `ArithmeticGaloisRepresentations:R01.5`
- `mathlib:Matrix.charpoly_units_conj`

Acceptance checks:

- In rank one, an algebraic Hecke character is recovered.
- Scalar matrices give nonunique intertwiners even for an absolutely irreducible member.

Suggested Lean component (algebraic-fragment): For semisimple representations over a characteristic-zero field, equality of characteristic polynomials at every group element gives conjugacy over the algebraic closure.

Omitted conditions: Topology, genuine global Galois group and good Frobenius set; Chebotarev upgrade from good places to every element.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The common rationality field and Frobenius data determine members.

### Compatible system attached to π

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.compatibleSystem`.

For a regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, once the R24.5 owner fulfills the data/predicate separation request, assemble R_π on that single imported carrier: M_π is the field fixed by σ∈Aut(C) preserving π^∞; S_π is the finite ramification set of π; P_v(X) is the common monic rec^T geometric Frobenius polynomial; r_λ is the attached continuous semisimple representation; H_τ={a_{τ,i}+n−i}. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for v outside S_π above ℓ. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every π.

Proof route:

1. Require the owner’s corrected raw-data assembly and projection laws; the current contradictory carrier statements are not treated as a completed import.
2. Fix the finite rationality field and finite ramification set from AG2.0.
3. Install every λ-member and P_v using good-place compatibility and embedding independence.
4. Read the labelled Hodge multisets from the coefficient-prime theorem and prove the weak predicate.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- All λ use one M_π and S_π.
- Only the polarized instance receives the full pure-WD comparison below.

Planned API:

- `TauCeti.AutomorphicGalois.compatibleSystem` (constructor): Map π to R_π in the supplier carrier.
- `TauCeti.AutomorphicGalois.compatibleSystem_member` (projection): The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
- `TauCeti.AutomorphicGalois.compatibleSystem_goodPolynomial` (simp): At v outside S_π, the common polynomial is P_v(X).
- `TauCeti.AutomorphicGalois.compatibleSystem_hodgeTate` (data): The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
- `TauCeti.AutomorphicGalois.compatibleSystem_weak` (compatibility): R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
- `TauCeti.AutomorphicGalois.compatibleSystem_embedding` (extensionality): Two ι inducing the same λ on M_π give isomorphic members.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.compatibleSystem_rank_one` (degenerate): For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system. **Prototype:** The assembly/projection law retains an actual supplied rank-one homomorphism; algebraic-Hecke-character/class-field construction is omitted.
- `TauCeti.AutomorphicGalois.compatibleSystem_weight_k` (computation): At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.compatibleSystem_R19` (compatibility): On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member. **Prototype:** Characteristic-zero semisimple comparison assumes equality for every group element after the supplied dual/twist normalization; the actual R19 dictionary is omitted.
- `TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness` (non-example): A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place. **Prototype:** Explicit distinct nilpotent N matrices test the missing monodromy data; no weak-system inhabitant is constructed.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: Supplies the fixed automorphic members and their normalization, before deformation or lifting.
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`: Allows tensor, dual and algebraic-character operations on the same carrier.

Suggested Lean component (algebraic-fragment): The constructor calls an externally supplied assembly operation on actual homomorphisms, polynomials and Hodge multisets. Projection APIs use explicit supplier coherence laws. The weak API currently tests only common good polynomials.

Omitted conditions: The corrected R24 data carrier/assembly implementation and admissibility predicates; number field, varying completions/place indexing, finite S, continuity, automorphic pi, good-place and full weak period conditions.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. Construct the automorphic data; stronger admissibility is supplied separately.
- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, pp.5–6. Upgrades the all-CM instance to weak compatibility.

### Complex and local coefficient conjugation

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.coefficientConjugation`.

For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

Proof route:

1. Use rationality and conjugation of finite automorphic components from Clozel’s theorem.
2. Conjugate every good Satake polynomial and compare through σ⁻¹ι.
3. Apply semisimple uniqueness; the local formula follows by taking σ=ισ_ℓι⁻¹.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `AutomorphicFormsOnReductiveGroups:AF.4`

Acceptance checks:

- σ=id gives the same isomorphism class.
- Composition gives σ_ℓτ_ℓ(r)≅σ_ℓ(τ_ℓ(r)), not a pullback on G_F.

Suggested Lean component (algebraic-fragment): Entrywise ring-automorphism change followed by its inverse returns the same group homomorphism; G itself is unchanged.

Omitted conditions: Clozel conjugate automorphic representation σπ and its weight/rationality construction; embedding conventions for ι and σ_ℓ.

Sources:

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 5.1 and Lemma 5.2, p.38, footnote 4. Both complex and local coefficient automorphisms, with inverse orientation.

### Strong coefficient field

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsStrongCoefficientField`.

For Π regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1}) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.

Proof route:

1. Define the simultaneous realization condition on the supplier’s family, keeping the embedding compatibility.
2. Use descent/uniqueness only after scalar extension; record E_λ-linear conjugacy as the equivalence relation.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- Containing Q(Π) is necessary, not by itself sufficient.
- Q(Π) being strong under Hypothesis 3.2.10 remains conditional.

Planned API:

- `TauCeti.AutomorphicGalois.IsStrongCoefficientField` (characterisation): The preceding all-λ realization property.
- `TauCeti.AutomorphicGalois.strongCoefficientField_member` (data): Choose an E_λ-realization with its scalar-extension isomorphism.
- `TauCeti.AutomorphicGalois.strongCoefficientField_baseChange` (functoriality): For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
- `TauCeti.AutomorphicGalois.strongCoefficientField_unique` (extensionality): Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.strongCoefficientField_character` (degenerate): A rank-one character whose values lie in E has the expected E_λ-realizations. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongCoefficientField_extension` (compatibility): Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality` (non-example): The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split. **Prototype:** A supplied complex quaternionic representation has rational traces and two specified quaternion generators; its matrices cannot descend to GL₂(Q). This tests a nonsplit descent obstruction, beyond based-matrix inequality.
- `TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner` (characterisation): Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `Liu et al., §3.2 and Appendix D`: Defines λ-members and integral reductions simultaneously.
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`: Uniform field of definition can precede every local lattice choice.

Suggested Lean component (algebraic-fragment): For every external coefficient-place index, a homomorphism over the supplied descended field becomes conjugate to the given member. Choice returns that model with its conjugacy evidence; tower and uniqueness APIs are typed.

Omitted conditions: A common number field E, finite places and completions E_λ, their relation to every inducing embedding, continuity and automorphic pi. The quaternionic non-example supplies its actual group representation and tests rational-trace failure of Q-descent.

Sources:

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 3.2.5 and Remark 3.2.6, printed p.145. A simultaneous field of definition, distinguished from Q(Π).
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, author-copy p.12. Justifies the broader regular cohomological domain used by the following uniform-realization theorem.

### Uniform strong realization of polarized systems

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.existsUniformStrongCoefficientField`.

For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

Proof route:

1. Regular Hodge–Tate weights give a regular semisimple element in the algebraic monodromy group.
2. Choose two good regular Frobenius elements of different residue characteristics by Chebotarev.
3. Adjoin their eigenvalues to E_0 and apply the splitting/descent argument at each λ.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- Both good places are needed so one lies away from each coefficient prime.
- Hypothesis 3.2.10 is not used for the existence of an enlarged E.

Suggested Lean component (algebraic-fragment): Semisimple characteristic-zero representations in one algebraically closed ambient field, with traces in E₀ and characteristic polynomial one of two monic separable degree-n polynomials, descend over a finite intermediate extension.

Omitted conditions: The simultaneous number-field/p-adic-completion setup; regular Hodge weights, Chebotarev construction of two good places of different residue characteristics and each member’s choice away from ell. This algebraic component retains two regular polynomials, but does not construct those places.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, p.12. Uniform realization follows from two regular Frobenius elements.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Remark 3.2.6, printed p.145. Existence is separate from conditional minimal-field rationality.

### Purity and polarization of the polarized system

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.polarizedSystemPurity`.

For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.

Proof route:

1. Use the algebraic weight symmetry and AG2.0’s corrected multiplier sign.
2. Apply tempered local comparison and weight purity at the good and away-coefficient places.
3. Populate the separate pure/polarized predicates, then use full coefficient-prime comparison for the all-place property.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`
- `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`
- `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`
- `PotentialModularityAndCompatibleSystems:R24.5/polarized-system`
- `PotentialModularityAndCompatibleSystems:R24.5/character-system`

Acceptance checks:

- At n=2, a=(k−2,0), W=k−1.
- Purity is not inferred from a common polynomial family on an arbitrary nonselfdual branch.

Suggested Lean component (output-signature): At good places the root norm equation uses purity weight w+n−1.

Omitted conditions: Polarized automorphic hypotheses, monodromy-graded strict purity, Hodge conjugation, multiplier and total-oddness conditions. Necessary hypotheses are omitted; arbitrary P is not pure.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65. Purity weight and branch predicates on the imported carrier.

### Very weak compatibility and the density-one DGI route

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`. Kind: comparison. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.veryWeakCompatibilityUnderDGI`.

After the R24.5 data/predicate separation request is fulfilled, the weak compatibility proved for the constructed R_π implies very weak compatibility through the owner’s weakening map on the same data. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational ℓ for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.

Proof route:

1. Apply the all-CM or totally-real polarized weak compatibility already proved for R_π.
2. Forget to the very weak predicate; the finite ramification set omits only finitely many coefficient characteristics.
3. Compare its conclusion with the two ACC+ source lemmas without importing their downstream Fontaine–Laffaille route.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `PotentialModularityAndCompatibleSystems:R24.5:operations`

Acceptance checks:

- A finite set of exceptional ℓ is allowed.
- Existence of a local generic prime alone does not establish absolute irreducibility.

Suggested Lean component (algebraic-fragment): The full Hodge equality restricts to a specified subset of coefficient indices.

Omitted conditions: Density-one rational coefficient primes, DGI/image/Fontaine–Laffaille arguments, crystallinity and the owner’s weakened predicates. The subset is not asserted to have density one in Lean.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemmas 7.1.9–7.1.10, pp.1093–1094. The density-one DGI route, with rank-two specialization.

### Comparison strength at the coefficient prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give`. Kind: comparison. Implementation: unchecked.

The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

Proof route:

1. Compare the exact outputs without upgrading a bound to equality.
2. Retain the branch tag on each arithmetic export.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`

Acceptance checks:

- A ramified nonselfdual member cannot be passed to a full-WD consumer without an additional theorem.
- Crystallinity at good places is sufficient for the imported weak predicate.

Suggested Lean component (shared-component): The two export structures and their negative examples distinguish a monodromy bound from a map intertwining N.

Omitted conditions: Actual automorphic/period realizations and the unavailable full branch predicates.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. Separate ss equality and N bound.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2. The polarized theorem identifies N.

### Rank-two comparison with R19

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`. Kind: comparison. Implementation: unchecked.

For a fixed classical newform of weight k≥2 or regular cohomological Hilbert eigenform in the exact R19.3/5 overlap, identify the AG2 λ-member with the R19 member after converting geometric/arithmetic Frobenius and the stated Tate twist. For the standard weight-k classical normalization this is r_AG2≅r_R19^∨, giving geometric polynomial X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}, and det=r_ψ ε^{1−k} where r_ψ(Frob_q^geom)=ψ(q). For Hilbert (k_τ,w) use Skinner’s explicit half-integer normalization before dualizing; parity is part of its hypotheses. Import R19’s full Skinner coefficient-prime theorem, not Kisin’s conditional theorem as unconditional.

Proof route:

1. Fix the same eigenform and match normalized good Frobenius polynomials.
2. Apply semisimple uniqueness for the transported λ-members.
3. Transport Hodge and WD data from the supplier theorem on its exact regular-weight domain.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`
- `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`

Acceptance checks:

- For k=2 the weights are {0,1}; geometric det is ψε⁻¹.
- Finite-image weight-one systems do not enter the regular k≥2 comparison.

Suggested Lean component (shared-component): The rank-two assembly test identifies already-normalized semisimple members from every-element characteristic-polynomial equality; the full weight-k multiset is checked.

Omitted conditions: The R19 classical/Hilbert normalization constructor, Skinner local theorem and geometric-versus-arithmetic Frobenius dictionary.

Sources:

- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.5 formula (1.6); Theorem 3.2.3. Explicit dual-normalization comparison on the common domain.

### Coefficient independence of tensor automorphy

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.tensorAutomorphyIndependentOfIota`.

Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

Proof route:

1. Choose the RAESDC automorphic realization at the initial coefficient embedding and conjugate it so its good polynomials match those of the tensor product in C.
2. Use the λ-independent tensor operation on the supplier carrier.
3. At each (q,j) compare good polynomials and apply arbitrary-rank semisimple uniqueness.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- The identity coefficient embedding recovers the given automorphic representation.
- No residual genericity is introduced by changing j.

Suggested Lean component (algebraic-fragment): Two supplied characteristic-zero semisimple tensor/automorphic members with every-element polynomial equality become conjugate over the algebraic closure.

Omitted conditions: Tensor and automorphic constructions, initial irreducibility and RAESDC automorphy, and the good-prime Chebotarev transport. No general tensor automorphy is asserted by this algebraic component.

Sources:

- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1. The same coefficient-conjugation argument applies to an automorphic tensor product.

### GSp₄ crystalline Hodge comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.gsp4CrystallineHodgeComparison`.

In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform f of good p-level and weight (a,b), a≥b≥3, the AG2.2 transferred r_f is crystalline at p with HT={0,b−2,a−1,W}, W=a+b−3. If f is also an eigenform for the Hecke operators at p, det(X−φ)=λ_f(Q_p(X)) in their monic convention. The eigenform-at-p condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.

Proof route:

1. Apply the ML.4 transfer and AG2.2 GSp4-valued realization with its exact similitude.
2. Read the four graded weights from the regular algebraic coefficient system.
3. Apply crystalline comparison at good p-level and the specialized p-Hecke polynomial when its eigencharacter exists.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `ModularityAndLanglandsExtensions:ML.4`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`

Acceptance checks:

- At (a,b)=(3,3) the weights are {0,1,2,3}.
- Singular limit-of-discrete-series weights are not asserted by this theorem.

Suggested Lean component (output-signature): CG’s four labelled weights and equality of supplied crystalline Frobenius/Hecke polynomials are typed in the range a≥b≥3.

Omitted conditions: Regular good-level GSp₄ eigenform, de Rham/crystalline period projections, and the additional p-Hecke-eigenform hypothesis for polynomial equality. These necessary hypotheses are omitted.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(3), author-copy pp.38–39. Regular good-level GSp4 branch, with the corrected eigenform wording.

### Ordinary GSp₄ triangular shape

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.ordinaryGsp4CoefficientPrimeShape`.

Under CG Proposition 6.8(4), assume f is a p-Hecke eigenform and ordinary: its T_{p,1} and Q_{p,2} eigenvalues are units. The roots α,β,γ,δ of λ_f(Q_p(X)) have valuations 0,b−2,a−1,W and are distinct. r_f|G_Qp has the upper-triangular diagonal unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ). The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.

Proof route:

1. Apply the two unit-eigenvalue hypotheses in CG’s ordinary criterion.
2. Determine root valuations in increasing order and normalize each by its p-power.
3. Use the ordinary crystalline filtration to obtain the stated triangular diagonal.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`
- `PadicHodgeTheory:R06.4/ordinary-representation`
- `PadicHodgeTheory:R06.4`
- `ModularityAndLanglandsExtensions:ML.4`

Acceptance checks:

- At a=b=3 the valuations 0,1,2,3 are all distinct.
- The formula imposes no splitting of the off-diagonal extensions.

Suggested Lean component (output-signature): One basis makes the supplied rank-four member upper triangular with all four supplied diagonal characters.

Omitted conditions: Regular ordinary good-level GSp₄ form, both unit Hecke operator conditions, saturated filtration and cyclotomic/unramified character construction. These necessary hypotheses are omitted; arbitrary r and characters do not have this shape.

Sources:

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(4), author-copy p.39. Use roots of the specialized polynomial, correcting E55.

### Pilloni GSp₄ normalization comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`. Kind: comparison. Implementation: unchecked.

Pilloni Theorem 5.1.7.1 for cuspidal π with discrete-series π_∞ and parameter (λ_1,λ_2;−λ_1−λ_2+3) gives a de Rham representation with HT={0,−λ_2,−λ_1,−λ_1−λ_2}. At p outside the nonspherical set it is crystalline and det(1−Xφ)=Θ_π(Q_p(X)). Its geometric Frobenius and HT(ε)=−1 conventions require reciprocal conversion X^4Q_p(1/X) to the monic polynomial. The corrected similitude exponent is ε^{λ_1+λ_2}, as recorded in E27 of the paper extraction. Substitution λ_1=1−a, λ_2=2−b gives CG’s four Hodge numbers; identifying the automorphic representations also requires the ML.4 Harish–Chandra/Satake dictionary.

Proof route:

1. Read the discrete-series hypothesis and the author copy’s exact weight signs.
2. Reverse the degree-four polynomial, retaining the determinant convention.
3. Compare the Hodge recipes algebraically; use the requested transfer dictionary before asserting equality of representations.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `ModularityAndLanglandsExtensions:ML.4`

Acceptance checks:

- λ=(−2,−1) gives {0,1,2,3}.
- The theorem is not an assertion for every singular-weight p-adic form.

Suggested Lean component (shared-component): The explicit CG/Pilloni substitution gives the same four Hodge entries; strict inequalities between ordinary valuation exponents are checked separately.

Omitted conditions: ML.4 Harish–Chandra/Satake identification and reciprocal det(1−Xφ) versus monic charpoly conversion; full Pilloni de Rham/crystalline theorem and corrected similitude.

Sources:

- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 5.1.7.1(3)–(4), Remark 5.1.7.1, author-copy pp.22–23. Hodge weights and the reciprocal polynomial in its stated convention.

## AG2.7. Integral, residual and arithmetic exports

### Finite p-adic realization before lattices

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.existsFinitePadicRealization`.

For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.

Proof route:

1. Use the compactness of the continuous image of G_F and the countability of finite local extensions inside Q̄_ℓ.
2. Apply Baire to image∩GL_n(E), which is closed, obtaining an open subgroup.
3. Adjoin entries of finitely many coset representatives to E.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`
- `ArithmeticGaloisRepresentations:R01.1`

Acceptance checks:

- Do not apply local-field lattice compactness directly over Q̄_ℓ.
- The chosen E is finite over Q_ℓ, not a finite field of positive characteristic.

Suggested Lean component (algebraic-fragment): Finitely many supplied algebraic matrix entries lie in a finite intermediate extension.

Omitted conditions: Compact p-adic image, countability of finite local extensions, closed intersections, Baire interior/open subgroup and finite-coset reduction. The finite-entry step alone is not the finite p-adic realization theorem.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, after Theorem 2.1.1, p.34. Finite realization is the prerequisite for the residual construction.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Proposition 6.8, author-copy p.39. An explicit source for finite local realization; the proof sketch records the compact-image argument in arbitrary rank.

### Residual representation of π

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualRep`.

Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.

Proof route:

1. Use finite p-adic realization first; compactness then supplies an O_E-stable lattice.
2. Reduce the integral representation and semisimplify; use arbitrary-rank residual Brauer–Nesbitt for lattice independence.
3. Use finite-image Frobenius density to recover all characteristic-polynomial coefficients from good places; descend the semisimple member by finite-field Brauer-group vanishing. In positive characteristic use characteristic polynomials rather than traces alone.
4. Request preservation of polarization under reduction and semisimplification and the specified 𝒢_n-extension from ArithmeticGaloisRepresentations G7. The deformation-problem supplier assumes that extension as input. Do not claim every chosen lattice carries a perfect pairing.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`
- `ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence`
- `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`
- `ArithmeticGaloisRepresentations:G7`
- `mathlib:Matrix.GeneralLinearGroup.map`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- Changing λ may change the residual representation; only auxiliary choices at fixed λ are removed.
- Nonsemisimple reductions can differ.

Planned API:

- `TauCeti.AutomorphicGalois.residualRep` (constructor): The continuous semisimple residual member over its finite field of realization.
- `TauCeti.AutomorphicGalois.residualRep_indep_lattice` (extensionality): Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
- `TauCeti.AutomorphicGalois.residualRep_coeffExtension` (functoriality): Enlargement of E gives scalar extension of the same semisimple residual representation.
- `TauCeti.AutomorphicGalois.residualRep_goodPolynomial` (compatibility): At good v away from ℓ the polynomial is the coefficient reduction of P_v.
- `TauCeti.AutomorphicGalois.residualRep_extendGn` (constructor): For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.residualRep_rank_one` (degenerate): For an integral character ψ, r̄ is its reduction and no semisimplification changes it. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.residualRep_diagonal_reduction` (computation): Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial. **Prototype:** The reduced diagonal matrix over ZMod 3 has the required polynomial; full integral reduction is additionally tested by residualExport_diagonal_mod3.
- `TauCeti.AutomorphicGalois.residualRep_R19_dual` (compatibility): For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding. **Prototype:** Finite residue field and common integral every-element polynomials identify semisimplifications over the algebraic closure; construction of the R19 normalization is omitted.
- `TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice` (non-example): For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1. **Prototype:** At t=1 the identity and nontrivial unipotent matrices over ZMod 5 are unequal with equal charpoly; the actual Z₅-action and lattice bases are omitted.

Consumers:

- `ACC+, Definition 2.3.6`: Certifies the residual Galois type of m_π.
- `PotentialAutomorphyInfrastructure:PA.0`: Supplies residual automorphic input, without adding irreducibility or enormous-image hypotheses.

Suggested Lean component (algebraic-fragment): Construct a semisimple homomorphism from an actual integral model and residue map, with every-element reduced characteristic polynomial. Lattice independence assumes equal integral polynomials and finite residue field. The G_n API currently transports only the matrix pairing equation.

Omitted conditions: Finite local field and stable-lattice construction, continuous global Galois action, lattice spanning/comparison; G_n carrier, CM conjugation extension, multiplier and total oddness. The unequal unipotent reductions are typed at t=1; the full Z₅ lattices are omitted.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p.34. The invariant is the semisimple reduction, with its polarized extension.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p.1085. Finite-field descent of residual members.

### Reduction of good Frobenius polynomials

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`. Kind: lemma. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.goodPolynomialReduction`.

For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.

Proof route:

1. Write Frobenius in an integral lattice basis.
2. Apply the pinned Matrix.charpoly_map lemma to residue reduction.
3. Apply the supplier’s semisimplification invariance to the reduced representation.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `mathlib:Matrix.charpoly_map`
- `mathlib:Matrix.GeneralLinearGroup.map`

Acceptance checks:

- For diag(1,2) modulo 3, X²−3X+2 becomes X²+2.
- Conjugating the lattice basis leaves the polynomial unchanged.

Suggested Lean component (shared-component): Matrix.charpoly_map and the residual polynomial API give the actual coefficient-reduction square.

Omitted conditions: Geometric good-place/integrality provenance and stable-lattice carrier; these are external to the matrix identity.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Residual Hecke polynomials are reduced characteristic polynomials.

### Maximal Hecke ideal of Galois type

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsGaloisType`.

For the unramified integral Hecke algebra T^S over O, a maximal ideal m with finite residue field k_m is of Galois type if there exists a continuous semisimple r_m:G_{F,S}→GL_n(k_m) such that at every v outside S its good geometric Frobenius polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} modulo m (T_{v,0}=1). Include the coefficient prime in S for this unramified quotient statement. r_m is considered up to isomorphism; the condition does not itself require absolute irreducibility.

Proof route:

1. Use the supplier’s T^S and the residual Frobenius convention fixed by AG2.0.
2. Quantify a continuous semisimple realization of the reduced Hecke polynomials.
3. Use residual Chebotarev/Brauer–Nesbitt for uniqueness up to isomorphism.

Direct inputs:

- `IntegralHeckeAndGaloisDeterminants:IHG.3`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`
- `ArithmeticGaloisRepresentations:R01.5`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- At n=1 the polynomial is X−T_{v,1}, using E3’s correction.
- A reducible semisimple representation can certify Galois type.

Planned API:

- `TauCeti.AutomorphicGalois.IsGaloisType` (characterisation): Existence of the stated semisimple realization over k_m.
- `TauCeti.AutomorphicGalois.galoisType_rep` (data): A chosen r_m together with the polynomial matching theorem.
- `TauCeti.AutomorphicGalois.galoisType_rep_unique` (extensionality): Any two semisimple realizations are isomorphic after a common residue-field extension.
- `TauCeti.AutomorphicGalois.galoisType_coeffExtension` (compatibility): The polynomial comparison commutes with the existing GL coefficient map.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial` (computation): For n=1 the constant term is −T_{v,1}. **Prototype:** The signed n=1 constant coefficient is computed explicitly; construction of a Hecke eigencharacter is omitted.
- `TauCeti.AutomorphicGalois.galoisType_reducible` (degenerate): A Hecke eigencharacter with r_m=1⊕1 can be of Galois type. **Prototype:** The actual existential IsGaloisType predicate is inhabited by the rank-two trivial semisimple homomorphism with polynomial (X−1)².
- `TauCeti.AutomorphicGalois.galoisType_charpoly_map` (compatibility): Residue extension maps the matched polynomial exactly by Matrix.charpoly_map. **Prototype:** The genuine Matrix.charpoly_map theorem checks arbitrary coefficient reduction; the Hecke quotient realization is omitted.
- `TauCeti.AutomorphicGalois.galoisType_not_nonEisenstein` (non-example): The reducible example cannot certify non-Eisensteinness. **Prototype:** Taking the supplied Frobenius map to include every group element rules out a different absolutely irreducible witness with trivial characteristic polynomials.

Consumers:

- `ACC+, §2.3 and Chapter 4`: Chooses the residual representation attached to localization at m.
- `IgusaVarietiesAndTorsionConcentration:IG.5`: Provides the residual representation on which genericity is imposed.

Suggested Lean component (algebraic-fragment): Galois type is existence of a Mathlib-semisimple homomorphism matching every supplied normalized polynomial. A chosen witness retains its matching evidence. Uniqueness assumes finite k and polynomial equality for every group element.

Omitted conditions: Integral unramified Hecke algebra, maximal ideal/residue quotient, finite field and continuity in the predicate, actual G_{F,S}, good Frobenius set and Chebotarev density.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, printed p.938. Existence with all good Hecke polynomials, separated from non-Eisensteinness.

### Non-Eisenstein maximal ideal

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsNonEisenstein`.

A maximal ideal m of T^S is non-Eisenstein if it is of Galois type and its semisimple realization r_m is absolutely irreducible. The condition is independent of the chosen realization by semisimple uniqueness. It is a global condition, separate from local ACC+ genericity and from enormousness of the image after restriction to G_{F(ζ_ℓ)}.

Proof route:

1. Conjoin Galois type with absolute irreducibility of its realization.
2. Use uniqueness and invariance under residue-field extension to make the condition intrinsic to m.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `mathlib:Representation.IsSemisimpleRepresentation`
- `mathlib:Representation.IsIrreducible`

Acceptance checks:

- A rank-one Galois-type ideal is non-Eisenstein.
- Local ratio genericity does not imply this condition.

Planned API:

- `TauCeti.AutomorphicGalois.IsNonEisenstein` (characterisation): Galois type plus absolute irreducibility.
- `TauCeti.AutomorphicGalois.nonEisenstein_galoisType` (projection): Forget absolute irreducibility.
- `TauCeti.AutomorphicGalois.nonEisenstein_coeffExtension` (compatibility): Absolute irreducibility persists under any residue-field extension and is detected over k̄.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.nonEisenstein_rank_one` (degenerate): Every rank-one Galois-type realization is absolutely irreducible. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.nonEisenstein_not_trivial_rank_two` (non-example): The rank-two trivial representation cannot make its ideal non-Eisenstein. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.nonEisenstein_absolute_not_relative` (characterisation): An irreducible k_m-representation that splits over k̄_m does not satisfy the definition. **Prototype:** An actual order-four real rotation representation is irreducible over R and reducible over AlgebraicClosure R; it tests absolute versus relative irreducibility without a finite-residue-field realization.

Consumers:

- `ACC+, Theorem 2.3.5 and Chapter 4`: Separates irreducible localized Galois data from reducible Galois-type data.

Suggested Lean component (algebraic-fragment): Non-Eisensteinness adds Mathlib irreducibility after coefficient extension to AlgebraicClosure to the same Galois-type witness. Tests separate reducible, rank-one and relatively-but-not-absolutely irreducible cases.

Omitted conditions: Maximal Hecke ideal, finite residue field/continuous Galois topology and Chebotarev recognition of its witness.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938. Absolute irreducibility is an additional global condition.

### Independence of the residual Hecke ideal

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualHeckeIdealIndependence`.

Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.

Proof route:

1. Match the reduced θ_π(P_v) with the residual Frobenius polynomial.
2. Use semisimple lattice independence for the representation.
3. An injective residue-field extension leaves the kernel of θ̄_π unchanged.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal`
- `IntegralHeckeAndGaloisDeterminants:IHG.3`

Acceptance checks:

- Changing a lattice cannot change m_{π,λ}.
- Different coefficient primes can yield different maximal ideals.

Suggested Lean component (algebraic-fragment): The kernel of an actual ring eigencharacter is invariant under an injective residue-field extension.

Omitted conditions: Surjectivity/finite residue field needed for maximality, normalized Hecke-algebra identification and integral stable-lattice/embedding comparison.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. The reduced automorphic eigencharacter has the matching residual representation.

### Dual and character-twist Hecke comparison

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.dualAndTwistHeckeComparison`.

For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

Proof route:

1. Apply the contragredient Hecke involution to the polynomial coefficients.
2. Compute eigenvalues of dual times the geometric cyclotomic twist.
3. Match all good polynomials and use semisimple uniqueness.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`
- `IntegralHeckeAndGaloisDeterminants:IHG.3`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- At n=2, α_i become q/α_i.
- A ramified scalar twist can violate local unramifiedness.

Suggested Lean component (algebraic-fragment): The reciprocal q^(n−1)/α eigenvalue formula preserves the ordered noncyclotomic ratio predicate.

Omitted conditions: Actual dual/twist Hecke algebra involution, reciprocal degree-n polynomial identity and cyclotomic character; local unramifiedness is handled separately in genericityTransfer.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 2.3.6, p.938. Exact dual ε^(1−n) and character-twist conventions.

### Local residual genericity

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsGeneric`.

Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

Proof route:

1. Use actual residual local inertia and a Frobenius lift; unramifiedness makes the matrix independent of the lift.
2. Split the characteristic polynomial in k̄ and test all ordered pairs of eigenvalues, retaining multiplicity.
3. Keep the eigenvalue predicate separate from its local representation predicate.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `ArithmeticGaloisRepresentations:R01.1`
- `mathlib:Matrix.charpoly`
- `mathlib:Matrix.GeneralLinearGroup.map`

Acceptance checks:

- For n=1 the ratio condition is vacuous but unramifiedness remains required.
- A ramified scalar representation has generic eigenvalue ratios without being locally generic.

Planned API:

- `TauCeti.AutomorphicGalois.IsGenericEigenvalues` (characterisation): For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
- `TauCeti.AutomorphicGalois.IsGeneric` (characterisation): Trivial inertia together with the eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.isGeneric_unramified` (projection): A locally generic representation kills inertia.
- `TauCeti.AutomorphicGalois.isGeneric_frobenius_independent` (extensionality): For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_smul` (functoriality): Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_reindex` (compatibility): Reordering the list by a permutation leaves the predicate unchanged.
- `TauCeti.AutomorphicGalois.isGenericEigenvalues_inverse` (compatibility): Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue` (computation): Over F_3 with q=2, the list (1,1) is generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q` (non-example): Over F_5 with q=2, the distinct list (2,1) is not generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.isGeneric_rank_one` (degenerate): Every one-term nonzero list is generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one` (non-example): Over F_3 with q=1, (1,1) is not generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal` (compatibility): The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α). **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `ACC+, §4.3; §6 Taylor–Wiles construction`: Provides the local noncyclotomic ratio input without implying the other global hypotheses.
- `IgusaVarietiesAndTorsionConcentration:IG.5`: This is the condition exported by AG2.7 to the Hecke localization consumer.

Suggested Lean component (algebraic-fragment): Actual inertia, group homomorphism, Frobenius element and algebraic-closure charpoly factorization define local genericity with all ordered ratios and multiplicities. Frobenius-lift, scalar, inverse and reindex APIs are typed.

Omitted conditions: Identification with a genuine local Galois group/inertia and residue cardinality; finite coefficient field, ell≠p and topology. These local numerical parameters are supplied externally.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(1), p.972. Unramifiedness and the ordered noncyclotomic ratio condition.

### Completely split generic prime

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsDecomposedGenericPrime`.

For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.

Proof route:

1. Conjoin coefficient-prime avoidance, complete splitting and the local predicate at every place.
2. Use complete splitting to rewrite each q_v as p in the residue field.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`
- `ArithmeticGaloisRepresentations:R01.1`

Acceptance checks:

- One generic place in a non-split fiber does not suffice.
- A generic prime is away from the coefficient characteristic.

Planned API:

- `TauCeti.AutomorphicGalois.IsDecomposedGenericPrime` (characterisation): The complete-splitting and all-v condition.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_local` (projection): For every v|p, obtain unramifiedness and the local predicate with q=p.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_coeffExtension` (functoriality): Any extension of the finite coefficient field preserves and reflects the condition.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.decomposedGenericPrime_Q` (computation): For F=Q there is exactly one place over p; the splitting clause is automatic. **Prototype:** The whole externally supplied Q-place fiber is PUnit with e=f=1; the actual number-field place identification is omitted.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert` (non-example): An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds. **Prototype:** A supplied nonempty fiber with residue degree 2 fails complete splitting; no quadratic number field is constructed.
- `TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell` (degenerate): p=ℓ is excluded independently of eigenvalues. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.

Consumers:

- `ACC+, Lemma 4.3.2`: Provides the witness whose Frobenius class is reproduced by Chebotarev.

Suggested Lean component (algebraic-fragment): A rational prime p different from the characteristic ell, e=f=1 and genericity at EVERY member of an externally supplied nonempty full place fiber define the prime predicate. Coefficient extension retains CharP at ell.

Omitted conditions: Identification of the supplied entire fiber, e/f, inertia and Frobenius with number-field places; finite residual field, continuity and number-field splitting equivalence. No singleton fiber replaces an arbitrary number-field fiber.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(2), p.972. All places over a completely split rational prime.

### Decomposed generic residual representation

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsDecomposedGeneric`.

A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

Proof route:

1. Quantify the auxiliary rational prime in the preceding predicate.
2. Keep its witness available for the infinite-prime theorem.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`

Acceptance checks:

- A single witness is sufficient.
- For n≥2 the trivial representation may be decomposed generic when suitable p≠1 mod ℓ split in F.

Planned API:

- `TauCeti.AutomorphicGalois.IsDecomposedGeneric` (characterisation): There exists p satisfying IsDecomposedGenericPrime(r,p).
- `TauCeti.AutomorphicGalois.decomposedGeneric_witness` (data): Extract the prime witness and all-v local conditions.
- `TauCeti.AutomorphicGalois.decomposedGeneric_coeffExtension` (compatibility): The existential condition is preserved and reflected by finite residue-field extension.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3` (computation): For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness. **Prototype:** The actual existential predicate on the one-place fiber and trivial rank-two homomorphism over ZMod 3 has p=2 as a witness.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible` (non-example): The preceding decomposed-generic representation is reducible. **Prototype:** The preceding actual existential witness coexists with failure of Mathlib absolute irreducibility.
- `TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime` (characterisation): For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is. **Prototype:** The actual prime predicate fails at p=7 for the same one-place/trivial ZMod 3 representation.

Consumers:

- `ACC+, Lemma 7.1.9`: Supplies the density-one DGI hypothesis, separately from absolute irreducibility.
- `PotentialAutomorphyInfrastructure:PA.1`: Genericity hypothesis for the Fontaine–Laffaille comparison.

Suggested Lean component (algebraic-fragment): Existence quantifies exactly the preceding complete-splitting/all-place prime predicate. Actual F₃ examples distinguish existential genericity, irreducibility and a failed p=7 witness.

Omitted conditions: Number-field provenance/topology of the external place fiber; Chebotarev prime production is separate.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(3), p.972. Existence of an auxiliary rational prime.

### Strong local decomposed genericity

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`. Kind: definition. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.IsStrongGeneric`.

For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

Proof route:

1. Add injectivity of the eigenvalue list to the ACC+ ratio predicate, equivalently excluding ratio 1.
2. Prove invariance under scalar, permutation, dual and coefficient extension with the same unramifiedness clauses.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`

Acceptance checks:

- A repeated list can be ACC+-generic and fail this predicate.
- Rank one still requires unramifiedness.

Planned API:

- `TauCeti.AutomorphicGalois.IsStrongGenericEigenvalues` (characterisation): IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
- `TauCeti.AutomorphicGalois.IsStrongGeneric` (characterisation): Trivial inertia plus the stronger eigenvalue predicate over k̄.
- `TauCeti.AutomorphicGalois.strongGeneric_generic` (projection): Forget the ratio-1 exclusion.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct` (projection): The Frobenius eigenvalues have no repeated roots.
- `TauCeti.AutomorphicGalois.strongGeneric_arbitrary_local_field` (compatibility): The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.strongGeneric_not_repeated` (non-example): Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio` (computation): Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_rank_one` (degenerate): Every single nonzero eigenvalue is strong-generic. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.strongGeneric_non_Qp` (compatibility): For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit. **Prototype:** The example checks q=4=1 in ZMod 3 and failure of the strong repeated-root predicate; construction of the unramified quadratic local field is omitted.

Consumers:

- `Caraiani–Scholze, Definition 1.9 and §6`: The residual stronger condition controls generic principal-series lifts.
- `Liu et al., Appendix D`: States the distinction between the displayed strong condition and the relaxed concentration input.

Suggested Lean component (algebraic-fragment): Strong local genericity adds injectivity of the eigenvalue list. The arbitrary-local-field component uses q=p^f, and the q=4 mod 3 repeated-root failure is typed.

Omitted conditions: Construction of a finite local extension and proof of its residue cardinality, genuine inertia/Frobenius and continuity.

Sources:

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition 1.9, printed p.652. The stronger condition over an arbitrary p-adic field.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition D.1.2, footnote 37, printed p.365. The paper explains the relaxed noncompact input.

### Infinitely many decomposed generic primes

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.infinitelyManyDecomposedGenericPrimes`.

If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

Proof route:

1. Encode r, complete splitting and the cyclotomic residue value in one finite normal extension.
2. Use the witness’s Frobenius conjugacy class and all its conjugates to retain conditions at every v.
3. Apply Chebotarev and discard the chosen finite exceptional set.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- For r=1⊕1 over F_3 and F=Q, all p≡2 mod 3 away from 3 are witnesses.
- Keeping only the field cut out by r loses the q=p mod ℓ information.

Suggested Lean component (algebraic-fragment): An infinite supplier witness set contained in the decomposed-generic primes gives infinitude and avoidance of every finite exceptional set.

Omitted conditions: Finite Galois/splitting/cyclotomic extension and Chebotarev positive-density argument. Infinitude is a supplied hypothesis, not a result for arbitrary place parameters.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 4.3.2, pp.972–973. Chebotarev reproduces the witness at all conjugate places.

### Genericity transfer and projective qualification

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.genericityTransfer`.

The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

Proof route:

1. Cancel a common nonzero scalar in ratios and exchange ordered pairs for inversion.
2. Use conjugacy and coefficient-change invariance of characteristic polynomials.
3. For the global twist choose a witness away from the character’s finite ramification set.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`
- `mathlib:Matrix.charpoly_units_conj`
- `mathlib:Matrix.charpoly_map`

Acceptance checks:

- A ramified quadratic scalar twist of 1⊕1 at L=Q_2, k=F_3, has the same projective representation but is not locally generic.
- For the globally trivial F_3 representation, an arbitrary finite character twist retains some good witness.

Suggested Lean component (algebraic-fragment): Scalar-twist invariance of local genericity requires an actual character trivial on inertia, alongside the pointwise matrix twist equation.

Omitted conditions: Global projective transfer, semisimplified tensor/base-change hypotheses and the global Chebotarev argument avoiding the character’s finite ramification set.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 4.3.1, p.972; Lemma 4.3.2. Qualify the local assertion by unramifiedness; see E5.

### Residual genericity outside finitely many λ

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi`. Kind: theorem. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.residualGenericityOutsideFiniteSet`.

For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place w split in F/F⁺ that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every v above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.

Proof route:

1. Use the relevant polarized regular representation and a regular unramified Frobenius from CH.
2. Local genericity of the characteristic-zero π excludes the q-ratios.
3. Exclude finitely many algebraic bad factors and use the Appendix D split-place Chebotarev argument.
4. Pass the resulting generic Hecke ideal to the consumer rather than importing concentration back into AG2.6.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity`
- `ArithmeticGaloisRepresentations:R01.5`

Acceptance checks:

- A nonzero algebraic difference can vanish at finitely many λ; these λ must be excluded.
- No absolute residual irreducibility or enormousness follows from this local condition.

Suggested Lean component (algebraic-fragment): If reduction preserves nonzero root differences and nonratio differences, the actual reduced unit roots are strongly generic.

Omitted conditions: Number-field roots, finiteness of bad coefficient places, Liu’s split-local-place Chebotarev step and its concentration hypotheses. No completely split all-place rational-prime conclusion is encoded.

Sources:

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Corollary D.1.4, printed p.368; Remark 3.2.6. Exclude divisors of finitely many nonzero algebraic quantities, then use Chebotarev.

### Good-prime characteristic-zero export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.GoodPrimeExport`.

GoodPrimeExport(π) consists of the imported R_π carrier, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the supplier carrier, not a new compatible-system definition.

Proof route:

1. Package the carrier and its good polynomial comparison.
2. Give the forgetful map from stronger branch exports and a coefficient-change map inherited from the supplier.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`

Acceptance checks:

- The export can be consumed with no polarization hypothesis.
- Forgetting branch evidence preserves M,S,P_v and every λ-member.

Planned API:

- `TauCeti.AutomorphicGalois.GoodPrimeExport` (constructor): Wrap R_π with its good comparison maps.
- `TauCeti.AutomorphicGalois.goodPrimeExport_member` (projection): Retrieve the λ-member and good Frobenius theorem.
- `TauCeti.AutomorphicGalois.goodPrimeExport_coeffChange` (functoriality): Use supplier coefficient change, with identity and composition laws.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.goodPrimeExport_character` (degenerate): At n=1 it is the algebraic-character good-prime package. **Prototype:** An actual GoodPrimeExport wrapper is inhabited for the trivial rank-one character with polynomial X−1; its class-field provenance is omitted.
- `TauCeti.AutomorphicGalois.goodPrimeExport_polynomial` (computation): For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}. **Prototype:** An actual rank-two wrapper exposes the quadratic polynomial; the modular-form nebentype/cyclotomic construction is omitted.
- `TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD` (non-example): The package cannot supply N at a ramified place without branch evidence. **Prototype:** Explicit F=diag(1,2) with N=0 or E₁₂ satisfies the WD Frobenius relation, while no invertible N-intertwiner exists.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: The characteristic-zero fixed automorphic input.
- `IntegralHeckeAndGaloisDeterminants:IHG.1`: Provides dense classical comparisons for interpolation, whose nonreduced determinant construction is owned by IHG.

Suggested Lean component (algebraic-fragment): GoodPrimeExport is evidence for all supplied member Frobenius polynomials on the external System. Supplier coefficient change with its projection law maps those polynomials.

Omitted conditions: R24 raw carrier implementation, finite ramification set, good-place identification, continuity, automorphic attachment and coefficient-place/completion dictionary. Identity/composition of System coefficient change require the omitted owner laws.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094. The minimum automorphic compatible-data export.

### Nonselfdual Hodge and monodromy-bound export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.NonselfdualComparisonExport`.

NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

Proof route:

1. Package the proved de Rham/Hodge maps and the separate ss/bound statements at each coefficient-prime place.
2. Expose the spherical and Iwahori corollaries as hypothesis-indexed local projections.
3. Forget to the good-prime carrier without changing its members.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary`

Acceptance checks:

- An unrestricted regular CM cuspidal input receives the full labelled Hodge output.
- A general ramified member is exported with an N bound, not full equality.

Planned API:

- `TauCeti.AutomorphicGalois.NonselfdualComparisonExport` (constructor): Combine the AHTW coefficient-prime maps with the common carrier.
- `TauCeti.AutomorphicGalois.nonselfdualExport_goodPrime` (projection): Forget to GoodPrimeExport with the same members.
- `TauCeti.AutomorphicGalois.nonselfdualExport_hodge` (data): Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
- `TauCeti.AutomorphicGalois.nonselfdualExport_wdBound` (data): Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.nonselfdualExport_rank_one` (degenerate): For an algebraic character the Hodge multiset has one element and N=0. **Prototype:** An actual NonselfdualComparisonExport wrapper is inhabited for the trivial rank-one member, singleton Hodge weights and size-one Weil block. A separate nilpotent rank-one example gives N=0; period/class-field construction is omitted.
- `TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline` (compatibility): At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion. **Prototype:** The zero-rank upper bound forces the monodromy matrix to be zero; actual period/inertia criteria for crystallinity are omitted.
- `TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD` (non-example): The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone. **Prototype:** Concrete strict dominance [1,1]≺[2] has unequal block lists. No polarized pairing is inferred.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.1`: Supplies unrestricted de Rham and Hodge data before additional Fontaine–Laffaille/ordinary assumptions.
- `TorsionCohomologyInfrastructure`: Keeps the unconditional characteristic-zero Hodge comparison distinct from residual concentration hypotheses.

Suggested Lean component (algebraic-fragment): The actual wrapper retains good polynomials, all supplied Hodge multisets, a separate conjugacy of semisimplified Weil actions and per-type block partial-sum bounds. A rank-one wrapper is inhabited in its labelled example.

Omitted conditions: Actual de Rham periods, WD semisimplification and normalized descending block extraction; underlying geometry/automorphy and R24 carrier. The wrapper does not supply a full N map or polarized pairing.

Sources:

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6. The nonselfdual export includes the known Hodge and coefficient-prime properties.

### Polarized Hodge and Weil–Deligne export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.PolarizedComparisonExport`.

PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the supplier’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.

Proof route:

1. Assemble separately established comparison and polarization maps.
2. Supply forgetful maps and their agreement on the underlying members.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`
- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`

Acceptance checks:

- The χ multiplier and W=w+n−1 are retained.
- An arbitrary nonselfdual good-prime package cannot be promoted to this type.

Planned API:

- `TauCeti.AutomorphicGalois.PolarizedComparisonExport` (constructor): Combine the established polarized branch comparisons.
- `TauCeti.AutomorphicGalois.polarizedExport_goodPrime` (projection): Forget to GoodPrimeExport, preserving all good polynomials.
- `TauCeti.AutomorphicGalois.polarizedExport_local` (data): Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- `TauCeti.AutomorphicGalois.polarizedExport_supplier` (compatibility): Return precisely the R24.5 pure/polarized predicates with normalization conversion.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.polarizedExport_weight_k` (computation): For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ. **Prototype:** An actual PolarizedComparisonExport wrapper returns the full {k−1,0} multiset and determinant Hodge sum. The W=k−1 and multiplier/determinant character specialization are omitted.
- `TauCeti.AutomorphicGalois.polarizedExport_forget` (compatibility): The forgotten good package has exactly the same λ-members and P_v. **Prototype:** Forgetting an actual polarized wrapper retains the identical external System member and good Frobenius polynomial.
- `TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected` (non-example): AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field. **Prototype:** No invertible matrix intertwines zero N with nonzero E₁₂; thus an ss/bound-only comparison cannot fill the full-map requirement.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.1–PA.5`:  supplies the Hodge/polarization input before their additional local and residual hypotheses.
- `Liu et al., §3.2`: Supplies the polarized relevant members and local comparison maps.

Suggested Lean component (algebraic-fragment): The actual wrapper retains good polynomials/Hodge multisets, an invertible pairing with its matrix equation, one local u intertwining Weil and N, and good-prime root purity. Weight-k and forgetful tests use this wrapper.

Omitted conditions: Period/WD construction, cohomological/automorphic provenance, graded strict purity, total oddness and R24 full pure/polarized predicates. The supplier API currently projects pairing and good purity only; the weight-k test omits multiplier/determinant and W verification.

Sources:

- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §5.1, pp.63–65. The polarized system evidence.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2. Full coefficient-prime WD evidence.

### Unitary discrete-parameter export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.UnitaryDiscreteExport`.

In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2}$(N_{F/𝒦}det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{𝒦/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This package need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here F=F⁺·𝒦 with 𝒦 the imaginary quadratic field of CS §5.1; the printed F₀ in Corollary 5.5.5 is the already confirmed E11 misprint, not another splitting field.

Additional input conditions:

- For the literal CS Corollary 5.5.5 application, retain the §5.1 unitary datum and the given irreducible admissible Π^S in the indicated BCS supercuspidal alternating Igusa summand. Its identification with the labelled pure automorphic transfer parameter is supplied as input; this export does not prove an Igusa trace or concentration theorem.
- The constituent Π_i are regular C-algebraic, θ-stable isobaric representations supplied by that parameter, and r_i has rank n_i (known E10), not n. The source setup has F⁺≠Q, quasi-split finite unitary group, and the ramified rational primes of F contained in Spl_{F/F⁺}; these source restrictions are retained for that literal application.

Proof route:

1. Use the ET.7a pure stable/endoscopic transfer and the AG2.2 constituent representations.
2. Install ε_i with the parity correction so the indicated twist is L-algebraic.
3. Take the direct sum and match normalized Satake polynomials using local LLC compatibility away from ℓ.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.2`
- `AutomorphicGaloisRepresentationsPartII:AG2.5`
- `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`
- `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`
- `PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`

Acceptance checks:

- The two-constituent sum is allowed to be reducible.
- Theorem 5.5.4’s finite-place statement is used only at v∤ℓ, correcting the known E83 extraction finding.
- The known E10/E11 corrections are respected: constituent rank n_i and q split in 𝒦, not an undefined F₀.

Planned API:

- `TauCeti.AutomorphicGalois.UnitaryDiscreteExport` (constructor): Build the labelled direct sum with explicit algebraic character twists.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_constituent` (projection): Retrieve r_i, ε_i and its inclusion into the direct sum.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_goodPolynomial` (compatibility): Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters` (computation): For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2). **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity` (characterisation): The direct-sum dimension is n_1+n_2, with neither twist changing dimension. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility` (non-example): A two-character endoscopic sum cannot certify global irreducibility. **Prototype:** The actual block-sum representation retains an invariant proper first summand and explicitly fails Mathlib irreducibility.

Consumers:

- `IgusaVarietiesAndTorsionConcentration:IG.5–IG.7`: Provides the discrete automorphic Galois summands used in the generic principal-series argument.
- `TorsionCohomologyInfrastructure:TC.0`: Supplies characteristic-zero summands, while torsion interpolation stays with IHG.

Suggested Lean component (algebraic-fragment): Two actual constituent homomorphisms and character twists give a labelled block-sum homomorphism. APIs test inclusion and product charpoly; the two-character example is explicitly not irreducible.

Omitted conditions: Literal CS endoscopic occurrence input, compact unitary field/group/level setup, auxiliary parity character construction, split-good-prime Hecke identification and away-ell full local comparison.

Sources:

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5 and Remark 5.5.6, printed pp.745–746. The algebraic twists and finite-place comparison restricted away from ℓ.

### Lattice and residual polynomial export

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export`. Kind: construction. Implementation: unchecked.

Suggested name: `TauCeti.AutomorphicGalois.ResidualPolynomialExport`.

ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

Proof route:

1. Choose finite E and stable lattice in that order.
2. Package the residue coefficient homomorphism and its characteristic-polynomial comparison.
3. Use lattice-independent semisimplification and kernel-independent m_{π,λ} for the comparison API.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`
- `mathlib:Representation.IsSemisimpleRepresentation`

Acceptance checks:

- The integral lattice may change while the residual semisimple isomorphism class remains fixed.
- The good-polynomial maps use the pinned GL map and charpoly_map.

Planned API:

- `TauCeti.AutomorphicGalois.ResidualPolynomialExport` (constructor): Assemble finite realization, chosen lattice and reduction maps.
- `TauCeti.AutomorphicGalois.residualExport_compareLattice` (equivalence): Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- `TauCeti.AutomorphicGalois.residualExport_maxIdeal` (projection): Retrieve m_{π,λ} with Galois-type evidence.
- `TauCeti.AutomorphicGalois.residualExport_charpoly` (compatibility): The integral/residual Frobenius square commutes by Matrix.charpoly_map.

Discriminating tests and their suggested forms:

- `TauCeti.AutomorphicGalois.residualExport_rank_one` (degenerate): Reduction of an integral character is its residual character. **Prototype:** The actual residual wrapper’s rank-one semisimple member is conjugate to the actual coefficient-reduced integral homomorphism.
- `TauCeti.AutomorphicGalois.residualExport_diagonal_mod3` (computation): The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3. **Prototype:** Labelled typed Lean example under this exact test name; the node’s component and omittedConditions describe the algebraic portion and the omitted supplier realization.
- `TauCeti.AutomorphicGalois.residualExport_unipotent_lattices` (non-example): The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions. **Prototype:** The identity and unipotent reductions at t=1 are unequal with equal charpoly; the full Z₅ lattice construction is omitted.

Consumers:

- `PotentialAutomorphyInfrastructure:PA.0`: Supplies residual automorphic data before lifting.
- `IntegralHeckeAndGaloisDeterminants:IHG.1–IHG.3`: Supplies classical integral polynomial comparisons, not a family over a nonreduced Hecke algebra.

Suggested Lean component (algebraic-fragment): An actual integral homomorphism/residue eigencharacter is retained alongside a semisimple residual member, every-element reduced polynomial and good Hecke matching. APIs compare finite-field semisimple members and identify the actual kernel.

Omitted conditions: Finite local coefficient field and stable lattice, global topology, surjectivity/maximality of the reduced eigencharacter and the integral Hecke polynomial provenance. The unipotent test includes unequal raw matrices, not a construction of the Z₅ lattices.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085. Integral-to-residual good-polynomial interface.

### Rank-two residual comparison with R19

Anchor: `AutomorphicGaloisRepresentationsPartII:AG2.7/rank-two-residual-comparison-with-r19`. Kind: comparison. Implementation: unchecked.

For the regular classical/Hilbert exact overlap, fixed λ and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and R19 λ-members. In the classical normalization r̄_AG2≅r̄_R19^∨; the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. R19’s explicit geometry and lattice calculations remain supplier tools; only the semisimple isomorphism class, not a preferred lattice, is compared.

Proof route:

1. Identify characteristic-zero members through the exact R19 normalization dictionary.
2. Choose lattices and use residual semisimple independence to compare reductions.
3. Compare normalized reduced Hecke eigencharacters and their kernels.

Direct inputs:

- `AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`

Acceptance checks:

- At k=2 the determinant is ψ̄ε̄⁻¹ in the AG2 geometric convention.
- A claim that all integral lattices are identified fails the unipotent lattice test.

Suggested Lean component (shared-component): The residual R19 dual test compares already-normalized integral members through their common polynomials and finite-field semisimple reduction.

Omitted conditions: Construction of the classical/Hilbert dual/twist and Hecke-algebra normalization dictionary; preferred lattices are not compared.

Sources:

- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6 and following duality statement, p.938. The dual convention descends to the residual comparison.

## Supplier requests

These are precise imports or owner extensions. They remain requests; this packet neither edits those owners nor assumes their gaps have been closed.

- **`PadicHodgeTheory:R06.5`**: Projector-compatible filtered semistable comparison for the PEL/Kuga–Sato realizations, with D_st, N and cup products; the existing good-reduction node supplies only the smooth proper crystalline case. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`.
- **`PadicHodgeTheory:R06.2`**: Berger–Colmez bounded constant-Hodge-type family theorem in the CH Theorem 2.3 setting, at coefficient-prime places other than the weight-varying v_0; prove strict period comparison on that family. This is a family extension of the scalar period-functor API, not a claim that de Rham representations are closed under arbitrary limits. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.7a`**: S-general cyclic base-change and patching/descent from CH §3.1–3.2, including finite excluded cuspidality extensions, local Grunwald–Wang realization and coefficient-place splitting. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`, `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.3`**: The CH bounded eigenvariety family and geometric dense locus, with one place v_0 allowed to vary and constant other local Hodge types; import LocallyAnalyticDistributions:L4 for its generic Fredholm ingredient only. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent`.
- **`CrystallineCohomology:CR.6`**: Part II extension: Caraiani §§3–4 two-boundary log de Rham–Witt complex, residue realization of N (Proposition 4.4), and Theorem 4.6 bi-indexed stratum spectral sequence with its Tate twists. The existing ordinary Hyodo–Kato theory is a base, not this full generalized sequence. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.
- **`WeightsInEtaleCohomology:R34.6`**: Purity and monodromy-weight inference for the projected Caraiani two-boundary spectral sequence, after the explicit diagonal concentration of projected closed-stratum cohomology; retain the concentration hypothesis. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.1a`**: Raw geometric interface before period comparison: actual smooth proper PEL/Kuga–Sato cohomology with algebraic coefficients, degree, commuting Schur and automorphic isotypic idempotents, multiplicity, exact Tate twist, coefficient extension and cup-product compatibility; identify the normalized attached member inside that cohomology. CH §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7 give the geometric route. The current polarized-construction-inputs-shin-and-chenevier-harris node states attached-representation conclusions and cannot replace these input data. No local admissibility may be assumed to construct this realization. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.1a`**: Separate Caraiani tensor-square/closed-stratum interface: the semistable PEL/Kuga–Sato realization of the tensor square, its two boundary directions and distinguished local places, projected closed-stratum cohomology, multiplicity m_ξ and Tate twist t_ξ. Prove the diagonal degree concentration i=2n−2 used in Proposition 5.1, pp.31–32, after the geometric set-up of §2. This concentration is needed in addition to the reusable CR.6 two-boundary spectral sequence and is not supplied by the preceding smooth proper realization alone. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.5`**: Exact Varma §8.2 Jordan-block dominance and generic maximal-orbit theorem, and Taylor–Yoshida Theorem 1.4(4) uniqueness of pure WD parameters from the semisimplified Weil representation. Existing integrated summary does not state these inputs with complete hypotheses. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.4`**: AHTW §5 bounded-torsion Hecke local–global interface and non-Siegel boundary control used in Proposition 5.2.8/Theorem 5.2.9; this is additional scope beyond the original classical/determinant extraction. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison`.
- **`ArithmeticGaloisRepresentations:R01.1`**: The compact-image Baire finite-p-adic-realization theorem for continuous maps from profinite G to GL_n(Q̄_ℓ), with countability of finite local extensions and closedness of GL_n(E), before the existing local-field lattice theorem. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime`.
- **`ArithmeticGaloisRepresentations:R01.5`**: Import the existing arbitrary-rank characteristic-zero/residual Chebotarev–Brauer–Nesbitt recognition target. Additional need: the precise regular-Frobenius simultaneous descent obstruction-splitting criterion used by CH Proposition 3.2.5 (traces in E₀, split regular Frobenius, and two good places of different residue characteristics for a uniform number-field enlargement). Do not re-plan generic recognition as a rank-two-only supplier. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness`, `AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field`, `AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi`.
- **`IntegralHeckeAndGaloisDeterminants:IHG.3`**: T^S with geometric rank-n Hecke polynomials, its integral eigencharacters, residue quotients, dual involution and algebraic-character twist; interpolate elsewhere over nonreduced rings, with this interface receiving only classical comparisons. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`, `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence`, `AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison`.
- **`AutomorphicFormsOnReductiveGroups:AF.4`**: Clozel conjugation theorem in NT Theorem 5.1: σπ exists, is cuspidal regular algebraic and has finite components σπ^∞; number-field rationality. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`.
- **`PadicHodgeTheory:R06.4`**: Ordinary crystalline filtration when the ordered Newton slopes agree with the ordered Hodge numbers in the CG6.8 regular good-level GSp4 normalization: each successive Frobenius eigenline is weakly admissible and corresponds to the stated saturated Galois filtration. Retain both unit operator hypotheses used to establish the root valuations. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`.
- **`AutomorphicGaloisRepresentationsPartII:AG2.2`**: Algebraic twisting from polarized GL_n to the conjugate-self-dual construction; GSp4 realization and corrected similitude (known E27/E54/E55); CS5.5.5 endoscopic discrete constituents with each explicit ε_i twist. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime`, `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.
- **`ModularityAndLanglandsExtensions:ML.4`**: GSp4 transfer/LLC normalization, the CG (a,b) and Pilloni λ Harish–Chandra/Satake dictionary and the specialized monic versus det(1−Xφ) polynomial conversion. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison`, `AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape`, `AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison`.
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.7a`**: CS5.5.5 Shin stable/endoscopic transfer with L-morphism ζ̃_{n1,n2} and the parity-corrected auxiliary Hecke character $, identifying the twisted direct-sum Satake polynomial. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export`.
- **`PotentialModularityAndCompatibleSystems:R24.5:operations`**: Correct the single shared data carrier so it contains the coefficient number field/place indexing, finite ramification set, continuous semisimple members, common good polynomials and labelled Hodge metadata without intrinsically imposing local de Rham/full-Hodge/crystalline, pure or polarized conditions. Supply separate Weak, VeryWeak, ExtremelyWeak, Pure and Polarized predicates with precise quantifiers, weakening maps, assembly/projection laws and coefficient change. The current weakly-compatible-system-rank-n and weakened-compatible-data statements contradict one another on this boundary. AG2 uses universally supplied data and operations conditionally; it neither edits this owner nor defines a replacement carrier. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`, `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`, `AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export`, `AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export`.

- **`ArithmeticGaloisRepresentations:G7`**: For a continuous finite-local-field CM polarized representation with multiplier ε_ℓ^(1−n)r_χ, prove that stable-lattice reduction followed by semisimplification admits the residual polarization and continuous extension G_{F+}→𝒢_n over the finite residue field or its algebraic closure, with multiplier ε̄_ℓ^(1−n)r̄_χ and the specified complex-conjugation sign. Retain the characteristic-2 case allowed by BLGGT §2.1, p.34, or prove exactly the additional restriction needed there. Do not impose Schur/absolute-irreducibility or deformation-ring hypotheses. Generic polarization and conjugation-extension constructions belong here; GlobalGaloisDeformations:G7/polarized-deformation-problem consumes a given extension and does not supply it. Needed by `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.

## Remaining gaps and coverage

- **Generalized two-boundary log-crystalline comparison**: CR.6 and the existing geometric period comparison do not yet specify Caraiani’s full two-boundary weight spectral sequence and the projected-stratum concentration interface. The target node records its exact source and proof; the reusable sequence is requested as a CrystallineCohomology, Part II extension.
- **AHTW quantitative cohomology and arbitrary-multiplicity pseudodeformations**: The source theorem is fully stated, but the supplier chain is not already closed by the atlas: AHTW Theorem 2.5.7 uses quantitative local Shimura cohomology annihilators (FS/HKW, Mantovan/HL25, Harris–Viehmann cases), not the generic-only IG.5 concentration theorem; Theorem 3.3.6 constructs reduced p-torsion-free bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities using Wake–Wang Erickson stable conditions and the bounded stable-condition algebraization/comparison results of WE15/WWE19. AHTW explains why it avoids assuming general formal GAGA; no general quotient-stack GAGA theorem is asserted as a prerequisite. Existing BunG/Newton and fixed-representation R08.3 foundations do not contain these full extensions. Precise Part II supplier extensions must be designed without an IG.5→AG2.6 cycle.
- **Supplier types and complete predicates absent from the pinned Lean baseline**: The suggested file now has actual declarations for all 38 unique main names and 58 unique API names, with all 49 packet tests as labelled typed examples. The missing automorphic, raw geometric, period/WD, number-field place and stable-lattice interfaces remain implementation gaps. Each node and partial example records its algebraic component and omitted conditions under section 13; output signatures with necessary hypotheses omitted are not universal matrix theorems. System is an external parameter for the single R24 data carrier. Semisimplicity/absolute irreducibility use Mathlib, and no arbitrary Prop fields, empty predicates, fake automorphic types or AG2 compatible-system carrier are introduced.
- **Common carrier and weakened predicates disagree in the supplier**: R24.5/weakly-compatible-system-rank-n builds full weak conditions into its object while weakened-compatible-data claims the same object permits determinant-only Hodge data. The owner must separate raw data from Weak/VeryWeak/ExtremelyWeak and stronger predicates. The relevant statements and constructor/import here are conditional on that requested correction; the suggested file quantifies external data and projection laws. Supplier edits are outside this issue’s deliverables.
- **Raw projector-compatible geometric realization not supplied**: The current AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris node states attached-representation conclusions. It does not supply the raw PEL/Kuga–Sato cohomology, commuting projectors, multiplicity and Tate twist needed before period comparison. The geometric node now depends on the AG2.1a stage’s exact raw-interface request rather than treating that named conclusion as a realization. A second, separate request supplies Caraiani’s tensor-square and projected closed-stratum concentration.
- **Polarization through residual semisimplification**: BLGGT §2.1, p.34 states the residual CM 𝒢_n-extension, but the previously cited deformation-problem node assumes it. ArithmeticGaloisRepresentations G7 owns the generic pairing/conjugation API; its exact reduction-and-semisimplification extension is requested here, including the coefficient-characteristic boundary, without importing Schur hypotheses. No self-dual lattice is asserted.

The target-level revision is complete. Both AG2.6 and AG2.7 remain **planned**, with no closed stage or implemented declaration. Source-level proof chains and typed algebraic prototypes do not establish full supplier closure.

Remaining work for `AutomorphicGaloisRepresentationsPartII:AG2.6`:

- Close the precise geometric/family/solvable-descent supplier requests and CR.6 Part II spectral sequence gap.
- Design the AHTW quantitative-cohomology and arbitrary-multiplicity pseudodeformation supplier extensions; resolve the recorded gap without an IG consumer cycle.
- Refine the source-level proof chains to individual lemmas after the requested supplier interfaces exist.
- Resolve the R24 common-data/predicate contradiction and exact raw geometric supplier requests. Replace the documented algebraic signature fragments by complete supplier-typed statements when those interfaces exist; every named prototype/API/test is now present.

Remaining work for `AutomorphicGaloisRepresentationsPartII:AG2.7`:

- Close the finite p-adic realization, arbitrary-rank recognition/Chebotarev, integral Hecke and unitary-transfer supplier requests.
- Supply complete automorphic/Hecke/place/lattice and period/WD types and predicates, then refine the recorded algebraic fragments to the full statements. The actual suggested declarations and labelled tests are delivered and elaborate; implementation remains unchecked.

- Close the G7 residual polarization/semisimplification extension request before the 𝒢_n-valued residual output; the deformation problem is a consumer of that extension.

## Source corrections

This independent review rechecked E3–E5 and confirmed four additional findings E6–E9. All descriptions are in our own words; the field named `printed` contains a paraphrase or an affected formula. E6–E8 were checked against the published version as well as the preprint. E9 is restricted to the identified Chenevier–Harris author copy.

- **E3**, §2.2.5, (2.2.6), p. 922; checked on the page image: Paraphrase of the affected display: the final rank-n coefficient lacks the sign required in odd rank. The last term is (−1)^n q_v^{n(n−1)/2} T_{v,n}, the i = n case of the general term. For n = 1 the printed form gives X + T_{v,1} while the general term gives X − T_{v,1}, and the characteristic polynomial of the Frobenius on an unramified character χ is X − χ(ϖ_v). The proof of Theorem 2.3.5 (p. 938) prints the same polynomial with the last term (−1)^n q_v^{n(n−1)/2} T_{v,n}. Independent verdict: confirmed.
- **E4**, §2.2.5, (2.2.7) and the definition of P̃_{v,σ}, p. 922; Lemma 2.2.13(2), p. 927: Paraphrase of the affected displays: the degree-2n coefficient formula loses its monomial in (2.2.7), and the following sums use exponents indexed as though the degree were n. The general term of (2.2.7) is (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j}, and both sums of degree 2n are Σ_{i=0}^{2n} (−1)^i e_{v,i} X^{2n−i}. P̃_v is monic of degree 2n (its leading term X^{2n} is printed), so the i-th term must carry X^{2n−i}; with X^{n−i} the sum has negative exponents for i > n. Independent verdict: confirmed.
- **E5**, Remark after Definition 4.3.1, printed p.972, local genericity reading: Paraphrase of the local reading: the remark treats projectivization as sufficient for genericity without separately retaining trivial inertia. The ratio predicate is projectively invariant. Local genericity is invariant under unramified scalar twists; an arbitrary scalar twist also requires checking unramifiedness. Global existential decomposed genericity is invariant under finite residual character twists after avoiding the twist’s ramification set via Lemma 4.3.2. At L=Q_2 with k=F_3, r=1⊕1 has q=2 and is generic. A ramified quadratic scalar twist χ⊕χ has the same projective representation and eigenvalue ratios but nontrivial inertia, so is not locally generic. This does not invalidate the global existential statement. Independent verdict: confirmed.

- **E6**, §3A, definition of the second separate boundary log structure, p.1611; also arXiv v1 §3.1, p.9: The display for the second boundary log structure repeats the first boundary’s open immersions and open complements. Use j_{2,j} and U_{2,j} for the second boundary; leave the first boundary using j_{1,j} and U_{1,j}. The combined log structure on the same page uses both independent families. For X₁X₂=ϖ and Y₁Y₂=ϖ, the second boundary must detect the Y-divisors rather than duplicate the X-divisors. The p.1611 page image confirms the repeated first-boundary indices; the intended two-boundary construction is unchanged. Independent verdict: confirmed.
- **E7**, §3A local boundary membership, p.1609, and Lemma 3.2 chart, p.1611; also arXiv v1 §3.1 and Lemma 3.1.2, pp.8–9: The second boundary’s membership list ends at j_r, and the chart’s second product ends at Y_r, although its second monoid has s generators. Use j_s as the endpoint of the second boundary membership list and Y₁⋯Y_s in the chart’s second equation. The model has independent r and s. Its preceding local equation and the proof’s second auxiliary model use s Y-factors, while the chart maps all s second-boundary generators to them. For r=1,s=2 the printed Y₁=ϖ chart loses the second boundary component. The published p.1611 image and p.1609 text confirm the slips; v1 has the same indices. Independent verdict: confirmed.
- **E8**, §3A dimension of Y^(i,j), p.1610; also arXiv v1 §3.1, p.8: The stated dimension of a nonempty two-index stratum omits the m smooth Z-coordinates of the local model. The local dimension is 2n+m−i−j. The expression 2n−i−j applies when m=0. On the special fiber, imposing i X-coordinates and j Y-coordinates to vanish already kills both product equations, leaving 2n+m−i−j free coordinates. With n=r=s=i=j=m=1, the stratum is the affine Z-line, of dimension 1 rather than 0. The published p.1610 page image includes the Z-coordinates and omits m from the dimension. This is a dimension slip; the projected degree/Tate shifts remain separate in the purity argument. Independent verdict: confirmed.
- **E9**, Identified author copy, §1, highest-weight notation immediately after Special Hypotheses 1.2, p.4: Both highest-weight tuples are described as having nonnegative entries, while the next formula makes them reverse negatives of one another. Use non-increasing tuples of integers; a dominant algebraic GL_n weight need not have nonnegative entries. Nonnegativity of both tuples combined with μ_i(τ^c)=−μ_{n−i+1}(τ) forces every entry to be zero. For n=2, μ(τ)=(1,0) has dual tuple (0,−1), a valid dominant integral weight excluded by that wording. The author-copy p.4 image confirms it. The packet already uses integer weights and needs no theorem restriction. Independent verdict: confirmed.

The existing E10/E11 correction for CS constituent rank and its imaginary quadratic splitting field, and E27 for Pilloni’s similitude, are inherited corrections rather than new source findings. The packet records the 8 October 2026 public erratum searches, including Caraiani’s author page, arXiv history, MSP article/PDF, and Harris’s annotated errata list. No relevant correction was located. The CH publisher did not serve text through the browser and the Chenevier page timed out; no claim about the CH version of record is made.

## Sources and verification

The independent review retrieved the ten cited public PDFs on 8 October 2026 and confirmed every recorded SHA-256. It read the cited target statements and relevant proof passages, including the revision locators below, and additionally retrieved Caraiani’s published PDF for §3A pp.1609–1611. These are scoped readings, not a claim to have read every page of all eleven PDFs. Public URLs, hashes, access dates and version distinctions are recorded in the packet.

- [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1) — A’Campo, Hevesi, Thorne and Whitmore. arXiv:2607.11763v1, 13 July 2026; unrefereed preprint. Revision check: Theorem 1.2.1 and Corollary 1.2.2 pp.5–6; §3 introduction and Theorem 3.2.4 pp.27–30; Theorem 3.3.6 p.34; Proposition 5.2.8/Theorem 5.2.9 pp.75–76; §6 Definitions 6.0.1–5 and Corollary 6.0.6 pp.111–112.
- [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4) — Barnet-Lamb, Gee, Geraghty and Taylor. arXiv:1010.2561v4; Annals 179 (2014). Revision check: Theorem 2.1.1 pp.32–34; §5.1 definitions and normalization pp.62–65.
- [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) — Allen et al.. Author copy with Annals 197 (2023) pagination; printed page = PDF page + 896. Revision check: (2.2.6)–(2.2.7) p.922; Definition 2.3.6 p.938; Definition 4.3.1 and Lemma 4.3.2 pp.972–973; §7.1.1–2 pp.1084–1085; Lemmas 7.1.9–10 pp.1093–1094.
- [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf) — Chenevier and Harris. Author copy; Cambridge Mathematical Journal 1 (2013). Revision check: Theorem 1.4 and §1.5/formula (1.6) pp.5–7; Theorem 2.3 p.8; §3.2, Theorem 3.2.3 and Proposition 3.2.5 pp.11–12.
- [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1) — Caraiani. arXiv:1202.4683v1; Algebra & Number Theory 8 (2014). Revision check: Theorem 1.1 pp.1–2; §2 pp.2–3; Proposition 4.4 p.29; Theorem 4.6/Remark 4.7 and Proposition 5.1 pp.31–32.
- [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2) — Newton and Thorne. arXiv:2212.03595v2; Annals 203 (2026). Revision check: Theorem 5.1/Lemma 5.2/footnote 4 p.38; proof of Lemma 5.8 pp.42–44.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568) — Liu et al.. Inventiones 228 (2022), 107–375; public journal copy. Revision check: Definition 3.2.5/Remark 3.2.6/Hypothesis 3.2.10 pp.145–146; Definition D.1.2 and footnote 37 p.365; Corollary D.1.4 and proof p.368.
- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf) — Calegari and Geraghty. Duke 169 (2020), 801–896; author copy. Revision check: Proposition 6.8(3)–(4) and finite-field Baire proof, author-copy pp.38–39.
- [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) — Pilloni. Author copy; Duke Mathematical Journal 169 (2020), no.9, 1647–1807. Revision check: Theorem 5.1.7.1/Remark 5.1.7.1, author-copy pp.22–23.
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) — Caraiani and Scholze. Annals 186 (2017), 649–766; journal PDF. Revision check: §5.1 setup pp.730–731; Corollary 5.5.5 and Remark 5.5.6 pp.745–746.

- [Caraiani, published version](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf) — Algebra & Number Theory 8 (2014), 1597–1646. Independent check: §3A pp.1609–1611, comparison domain and Lemma 3.2; E6–E8 persist from arXiv v1.

Pinned declaration statements were read for the eleven baseline references. The seven prior references are retained, and the actual Mathlib semisimplicity, irreducibility, matrix-to-linear equivalence and matrix rank declarations are reused by the new prototypes.

The independent review `REV-AutomorphicGaloisRepresentationsPartII--AG2.6~2` accepts this target-level pass after five in-place node corrections. It confirms all eleven baseline entries, 58 API names and 49 packet tests. The 43 node verdicts are 38 verified and five corrected, with no added or unverifiable node. The source findings E3–E9 are confirmed. The 20 requests and six recorded gaps keep full supplier closure open; both stages remain planned and every implementation status remains unchecked. The [review report](../reviews/REV-AutomorphicGaloisRepresentationsPartII--AG2.6~2.md) gives the evidence and validation.
