# Galois representations attached to regular algebraic automorphic representations of GL_n

## Coefficient-prime comparison and arithmetic exports

A characteristic-zero automorphic representation gives several different kinds of arithmetic information. Its good Hecke eigenvalues give Frobenius polynomials. A geometric realization can identify a filtered de Rham or crystalline module. Local–global compatibility identifies a Weil–Deligne representation; the monodromy operator carries information which a semisimplified Weil representation forgets. Reduction requires a finite p-adic field of definition and a stable lattice, and produces an intrinsic semisimple residual representation. These interfaces must retain the distinctions between an eigenvalue, a representation and an isomorphism class.

AG2.6 applies coefficient-prime comparison to the constructed automorphic representations and assembles their compatible systems. AG2.7 supplies integral and residual comparisons, Hecke ideals, auxiliary-prime genericity and the typed interfaces used by arithmetic consumers. The generic compatible-system carrier belongs to PotentialModularityAndCompatibleSystems R24.5:operations. The classical and all-Hilbert rank-two families and their coefficient-prime geometry belong to AutomorphicGaloisRepresentations R19.3 and R19.5. The constructions here use those carriers and identify their exact common specializations.

The ground field is CM for an arbitrary regular algebraic cuspidal representation. The totally real branch imposes the essentially self-dual polarization hypotheses of BLGGT. The GSp4 branch is the regular, good-level transferred branch over Q; its transfer and local Langlands dictionary belong to ModularityAndLanglandsExtensions ML.4. A unitary endoscopic sum has labelled cuspidal constituents and explicit algebraic twists. It need not be an irreducible cuspidal GL_n representation.

### Conventions and coefficient fields

Write ε_ℓ for the cyclotomic character, with HT(ε_ℓ)=−1. Artin reciprocity sends a uniformizer to geometric Frobenius. The representation r_{π,ℓ,ι} has geometric good Frobenius polynomial

P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}, with t_{v,0}=1.

The final term includes (−1)^n. For n=1 this is X−t_{v,1}. Local comparison uses rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2}); the conversion from algebraic Satake normalization belongs to AG2.0 and its agreement with local Langlands belongs to AG2.5. The highest weight is indexed from 1 through n, and the labelled multiset is

H_τ={a_{τ,1}+n−1, a_{τ,2}+n−2, …, a_{τ,n}}.

For a weight-k classical form, a=(k−2,0), this gives {k−1,0}. The sum is Σ_i a_{τ,i}+n(n−1)/2, the determinant Hodge weight. A determinant sum does not characterize the multiset: {0,3} and {1,2} have the same sum. The p-adic Hodge supplier uses HT(ε)=+1 and the negatives of de Rham filtration jumps. The supplier’s Hodge numbers are negated when they are exposed in this convention. Its filtered modules and monodromy maps themselves are transported through the explicit convention dictionary, rather than silently dualized.

For polarized weights a_{τ,i}+a_{τc,n+1−i}=w, the purity weight is W=w+n−1. The multiplier is μ_λ=ε_ℓ^{1−n}r_{χ,λ}. The algebraic character system r_χ has purity weight 2w. At a real place the total-odd sign equation is μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so χ_v(−1)=(−1)^{n+w} gives μ_λ(c_v)=−1. This explicit sign includes the algebraic weight; the source’s simplified sign cannot be used outside its intended parity. These conventions are supplied by AG2.0, including its corrected polarization dictionary.

Three coefficient fields play different roles. M_π is the number field of rationality of the finite automorphic representation and good Frobenius polynomials. A finite E/Q_ℓ realizes one λ-member and permits a lattice theorem over a local field. A strong coefficient number field E⊂C simultaneously realizes all λ-members over its completions. There is no implication that the smallest rationality field is a strong field merely because all good polynomial coefficients lie there.

For a relevant representation in Liu et al., relevance means cuspidality, conjugate self-duality, and the fixed archimedean principal series with characters arg^{1−n}, arg^{3−n}, …, arg^{n−1}, where arg(z)=z/|z|. It is a regular algebraic specialization. A strong coefficient field contains its rationality field and gives a continuous E_λ-realization for every λ, compatible with every complex/p-adic embedding inducing λ. Chenevier–Harris proves existence of an enlarged strong field. Liu’s Hypothesis 3.2.10 concerns the more specific middle-degree cohomological realization and is needed for the stated minimal-field rationality consequence. It is retained as a hypothesis; the unpublished input cited for some higher-rank cases is not converted to an unconditional theorem.

### Geometric and family comparison

The polarized construction begins with actual smooth proper PEL or Kuga–Sato cohomology, its algebraic coefficient representation, projectors and the specified Tate twist. Apply crystalline and de Rham comparison to that cohomology. Functoriality, strict exactness and compatibility with cup products restrict the comparison maps to the projector images. A representation being attached at good places is not enough to apply geometric comparison: the realization, degree and multiplicity must be supplied by AG2.1a.

Chenevier–Harris Theorem 2.3 uses a family varying weights at a chosen coefficient-prime place v_0. At the other coefficient-prime places the Hodge type is held constant, and the bounded-family comparison theorem passes the geometric comparison to the desired member. The theorem does not make the same de Rham assertion at v_0. Their S-general cyclic patching and Theorem 3.2.3 remove that exclusion. One chooses extensions with the required local behavior and enough coefficient-prime places, excludes the finite bad extensions that lose cuspidality, verifies compatibility on intersections and invariance, and descends. This argument cannot be replaced by a claim that arbitrary limits of de Rham representations remain de Rham.

Full monodromy comparison uses more geometry. Caraiani’s semistable model has two boundary directions, and its log de Rham–Witt weight sequence uses strata Y^(r,s). In the indexing of Theorem 4.6 its E_1 term is

E_1^{−h,i+h}= ⊕_{j≥0, j≥−h} ⊕_{k=0}^j ⊕_{m=0}^{j+h}
H_cris^{i−2j−h}(Y^(k+m+1, 2j+h+1−k−m)/W)(−j−h),

converging to H_log-cris^i(Y/W). The sequence carries Frobenius, residue maps and the monodromy operator. Proposition 4.4 identifies the residue operator with N. The projected cohomology of closed strata is then compared with étale cohomology; the relevant diagonal concentration gives degeneration and purity in Proposition 5.1. Existence of a weight spectral sequence alone does not give purity. The reusable sequence extends the ordinary Hyodo–Kato theory in CrystallineCohomology CR.6, and the weight inference uses WeightsInEtaleCohomology R34.6.

Caraiani’s Theorem 1.1 identifies the full Frobenius-semisimple WD representation at v|ℓ for conjugate-self-dual cohomological cuspidal representations, without a Shin-regularity assumption. The algebraic character twist produces the polarized case. Temperedness and pure-WD uniqueness are separate inputs. The proof uses the geometric Iwahori case before the general purity argument; it does not feed the general theorem back into its own geometric starting point.

For an arbitrary nonselfdual regular algebraic cuspidal π over CM F, A’Campo–Hevesi–Thorne–Whitmore, arXiv:2607.11763v1, Theorem 1.2.1 gives de Rham admissibility, the full labelled Hodge multiset and equality of the semisimplified WD parameter at the coefficient prime. Corollary 1.2.2 gives the monodromy dominance bound. It uses quantitative Hecke annihilators outside the middle degree, bounded p-adic Hodge pseudodeformation spaces with arbitrary residual multiplicities and the non-Siegel boundary analysis. It imposes neither residual irreducibility nor decomposed genericity. Its genericity in the proof of the monodromy bound is the characteristic-zero condition Hom_WD(D,D(1))=0, distinct from all residual predicates below.

The bound fixes the semisimplified Weil parameter and compares partial sums of ordered Jordan-block sizes in each irreducible Weil representation up to unramified twist. At a spherical coefficient-prime place the upper-bound N is zero, so the bound forces N=0. At an Iwahori place the WD inertia is trivial. De Rham implies potentially semistable; the supplier’s WD criterion therefore gives crystallinity in the spherical case and semistability in the Iwahori case. The full monodromy equality for a general ramified nonselfdual local component is not asserted. This distinction allows the weak compatible-system predicate while preserving the stronger requirements of full-WD consumers.

### Integral and residual interfaces

Finite local realization comes first. The compact image of G_F lies in the countable union of GL_n(E) for finite subextensions E of Q̄_ℓ/Q_ℓ. Each intersection is closed. Baire produces an open intersection; adjoining the entries of finitely many coset representatives gives a finite field containing all matrices. Compactness over this local field then gives a stable O_E-lattice.

Reduce the lattice and semisimplify. The semisimple isomorphism class is independent of lattice and auxiliary coefficient extension at fixed λ by residual Brauer–Nesbitt. An arbitrary lattice need not carry a perfect integral polarized pairing, and no self-dual lattice is inferred from its stability. The residual polarized extension is supplied at the level of the semisimple polarized representation. Finite-field descent uses the field generated by the reduced characteristic-polynomial coefficients and the vanishing of the finite-field Brauer group.

The ordinary matrix coefficient map already provides the polynomial comparison: charpoly(A mapped by red)=charpoly(A) mapped by red. For integral A∈GL_n(O_E) the constant term is a unit; semisimplification leaves the characteristic polynomial unchanged. Thus all good Frobenius polynomials reduce correctly. No new nonreduced determinant law is constructed here; interpolation of the classical polynomial comparisons belongs to IntegralHeckeAndGaloisDeterminants.

A maximal ideal m of T^S with finite residue field is of Galois type when it admits a continuous semisimple residual representation with every specified good Hecke polynomial. It is non-Eisenstein precisely when that realization is absolutely irreducible. The kernel m_{π,λ} of the reduced integral eigencharacter is unchanged by the lattice, basis or finite extension of the local coefficient field inducing the same λ. Different λ can give different ideals. The dual Hecke ideal corresponds to r_m^∨⊗ε̄^{1−n}, whose geometric eigenvalues are q_v^{n−1}/α_i. In a rank-2n unitary system the exponent is 2n−1. Integral character twists give the corresponding scalar twist of the residual representation.

The necessity of semisimplification has a concrete test. For the continuous Z_5-action r(t)=[[1,5t],[0,1]], the stable lattices with bases (e_1,e_2) and (5e_1,e_2) reduce to the identity representation and a nontrivial unipotent representation. Their semisimplifications are both 1⊕1. A lattice-independent raw reduction would fail this example.

### Genericity at auxiliary primes

For L/Q_p finite, ℓ≠p and a finite coefficient field k of characteristic ℓ, ACC+ local genericity means trivial inertia and α_i/α_j≠q for all i≠j, where q is the residue cardinality and the α_i are nonzero eigenvalues over k̄, counted with multiplicity. The list need not have distinct entries. Over F_3 with q=2, (1,1) is generic; over F_5 with q=2, the distinct list (2,1) is not. When q=1 a repeated list of length at least two fails. In rank one the ratio clause is empty, but unramifiedness is still required.

A rational prime p is decomposed generic for r over F when p≠ℓ, p is completely split in F, and every v|p satisfies the local predicate. Complete splitting makes q_v=p at every such place. The representation is decomposed generic when one such prime exists. One generic place in an inert fiber does not supply the global condition. For F=Q and the trivial rank-two representation over F_3, p=2 is a witness while p=7 is not. The same example proves that decomposed genericity does not imply global irreducibility.

Caraiani–Scholze Definition 1.9 gives the stronger local specialization: the ratios avoid both 1 and q. This is local ACC+ genericity together with pairwise distinctness. It is defined for every finite L/Q_p, rather than only Q_p. Liu Appendix D displays this stronger condition, and its footnote explains that distinctness can be removed in the corresponding noncompact concentration input. A separate strong predicate preserves that distinction. Over F_7 with q=2, (1,3) is strong-generic because its ordered ratios are 3 and 5.

Scalar multiplication, permutations and inversion preserve the eigenvalue predicates. Inversion exchanges the ordered pair. Conjugacy, coefficient extension and changing a Frobenius lift preserve local genericity when inertia is trivial. A scalar twist preserves local unramifiedness only if the character is unramified there. A ramified quadratic scalar twist of the trivial rank-two representation over F_3 at Q_2 has the same projective representation and the same ratios but fails the local predicate. The projective-invariance sentence in ACC+ must therefore be qualified for the local interpretation.

The global existential condition is invariant under a finite residual-character twist. ACC+ Lemma 4.3.2 gives infinitely many witnesses: include the field cut out by r, a normal closure of F and Q(ζ_ℓ) in one finite normal extension, then reproduce the original witness’s conjugacy class by Chebotarev. The cyclotomic field preserves p mod ℓ, and the normal closure preserves all places above p. The resulting positive-density set avoids any fixed finite set, including the twist’s ramification. Enormousness of the image restricted to G_{F(ζ_ℓ)} remains a separate ArithmeticGaloisRepresentations G7 condition; its adjoint-cohomology clauses are not part of genericity.

The typed exports keep these strengths visible. NonselfdualComparisonExport exposes the AHTW de Rham/Hodge comparison, ss equality, monodromy bound and spherical/Iwahori corollaries. GoodPrimeExport exposes the characteristic-zero carrier and good comparison maps. PolarizedComparisonExport adds actual Hodge, polarization, pure and full-WD comparisons. UnitaryDiscreteExport retains its twisted constituents and their away-ℓ local comparison. ResidualPolynomialExport contains a chosen finite local realization, stable lattice, semisimple reduction and polynomial/Hecke comparisons. Their forgetful maps preserve the underlying members. None supplies unproved residual irreducibility, enormousness or an ordinary filtration.

## Declaration-level plan

Each declaration below gives its direct inputs and exact output. The definitions and constructions include their consumer-facing API and discriminating tests. Reusable foundational objects are referenced by their supplying stage or node. The following layers provide the principal interfaces:

| Supplier | Interface used here |
| --- | --- |
| R24.5:operations | Arbitrary-rank compatible carrier, weak/very weak/extremely weak and pure/polarized predicates, linear operations |
| R19.3 and R19.5 | Fixed classical/Hilbert systems and full coefficient-prime comparison on the exact regular-weight overlap |
| PadicHodgeTheory R06.2, R06.3, R06.5 | Period functors, exactness, base change, bounded-family extension, geometric comparison, WD inertia and N criteria |
| CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.6 | Log-crystalline sequence and the projected weight/purity inference |
| ArithmeticGaloisRepresentations R01.1, R01.5, G7 | Finite local realization, lattices, semisimple independence, arbitrary-rank recognition/descent, separate enormousness |
| AG2.0–AG2.5; ET.6 and ET.7 | Weights and normalization, geometric realizations, families, algebraic twists, boundary analysis, local comparison, transfer and solvable descent |
| IntegralHeckeAndGaloisDeterminants IHG.3 | Integral unramified Hecke algebra, eigencharacters, quotient and involution APIs |
| AutomorphicFormsOnReductiveGroups AF.4; ML.4 | Automorphic coefficient conjugation and GSp4 transfer/normalization |
| PotentialAutomorphyInfrastructure PA.1 (consumer) | Receives the comparisons for Fontaine–Laffaille and ordinary applications, with additional hypotheses |

## AG2.6. Coefficient-prime comparison and compatible systems

### Weak, very weak and extremely weak automorphic data

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system.

Use the single arbitrary-rank carrier of R24.5:operations, with coefficient number field M, finite S, common good-prime P_v, continuous semisimple r_λ and labelled H_τ. Import its weak, very weak and extremely weak predicates without a second carrier. Weak implies very weak implies extremely weak. Extremely weak fixes only HT(det r_λ)=sum H_τ; very weak adds crystallinity and the full multiset at all coefficient-prime places for a density-one set of rational primes. No converse in rank greater than one is asserted.

The argument uses Transport AG2 geometric Frobenius and HT(ε)=−1 conventions into the supplier’s explicit normalization parameter.; Reuse the weakening maps; a determinant sum alone cannot determine a higher-rank multiset.

Direct inputs: PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

Acceptance requires For n=2 the lists {0,3} and {1,2} have the same determinant sum and are distinguished by weak compatibility.; Rank-one extremely weak data become weak through the supplier’s algebraic-character classification.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1086.

### Comparison on the geometric automorphic summand

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison.

For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply D_cris and D_dR to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. At good reduction the summand is crystalline; its filtered de Rham realization gives HT_τ={a_{τ,i}+n−i : 1≤i≤n}. At strictly semistable reduction use the filtered (φ,N) comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions n.

The argument uses Invoke the AG2.1a realization and its exact Tate/Schur normalization.; Restrict the functorial geometric comparison to projector images, using strict exactness of the period functors.; Read each Hodge graded piece in the algebraic coefficient system; negate the supplier’s HT(ε)=+1 weights at this boundary.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction, PadicHodgeTheory:R06.2/ddr-exact-strict-tensor, PadicHodgeTheory:R06.5.

Acceptance requires For a classical weight-k base-change form the AG2 multiset is {0,k−1}.; Projector images commute with coefficient extension; dimension equals the cohomological multiplicity times n.

Sources: [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.4–1.5, Theorem 1.4 and formula (1.6).

### Hodge comparison through deformation and descent

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent.

For a conjugate-self-dual cohomological cuspidal Π over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place v_0 and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

The argument uses Use the imported Fredholm determinant, finite-projective slope summands and completed base change in the AG2.3 eigenvariety interface, then apply the constant-weight bounded-family period theorem at places other than v_0.; Use S-general cyclic extensions disjoint from the finite bad cuspidality extensions; patch by intersection compatibility and invariance.; At a target coefficient place choose a solvable extension splitting enough other places, then descend the period comparison and recover its filtration.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison, AutomorphicGaloisRepresentationsPartII:AG2.3, LocallyAnalyticDistributions:L4/fredholm-determinant, LocallyAnalyticDistributions:L4/finite-slope-summands, LocallyAnalyticDistributions:L4/completed-base-change, PadicHodgeTheory:R06.2/de-rham-base-change, PadicHodgeTheory:R06.2/crystalline-semistable-base-change, EndoscopicTransferAndUnitaryTraceComparison:ET.7, PadicHodgeTheory:R06.2.

Acceptance requires The place v_0 is absent from Theorem 2.3’s de Rham claim and present in Theorem 3.2.3.; The labelled multiset, not only its sum, survives descent.

Sources: [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12.

### Polarized admissibility at the coefficient prime

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline.

Let F be CM and (π,χ) regular algebraic cuspidal polarized of weight a. For every λ|ℓ and v|ℓ, r_{π,λ}|G_{F_v} is de Rham with HT_τ={a_{τ,i}+n−i}. If π_v is spherical it is crystalline; if π_v has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4)(b) gives full Frobenius-semisimple WD comparison with rec(π_v|det|^{(1−n)/2}). The full comparison for general π_v is the separate Caraiani theorem below.

The argument uses Use the Chenevier–Harris descent theorem for Hodge admissibility.; Apply geometric semistable/crystalline comparison in the Iwahori/spherical cases.; Keep the proof order: the geometric Iwahori case precedes Caraiani’s general full-monodromy argument.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, PadicHodgeTheory:R06.3/weil-deligne-parameter.

Acceptance requires An unramified local component has N=0 and the expected crystalline polynomial.; An Iwahori component may have N≠0; semistable does not mean crystalline.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(3)–(4), pp.33–34.

### Log-crystalline purity of the automorphic summand

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand.

In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the Π-isotypic log-crystalline summand realizing the tensor-square representation is pure as a WD representation (Proposition 5.1). Use the two-index strata Y^(r,s) and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of N. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

The argument uses Use the actual tensor-square cohomological realization and projector in §§2 and 5.; Apply the two-boundary log de Rham–Witt spectral sequence, including N realized by the residue operator.; Compare closed-stratum crystalline and étale cohomology; projected concentration along i=2n−2 gives degeneration and pure graded pieces.; Recover purity on the automorphic summand through the monodromy filtration.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/geometric-coefficient-prime-comparison, CrystallineCohomology:CR.6, WeightsInEtaleCohomology:R34.6, AutomorphicGaloisRepresentationsPartII:AG2.1a.

Acceptance requires Keep both stratum indices; a one-divisor Rapoport–Zink sequence is not the required input.; A mixed cohomological summand without the concentration theorem does not pass the purity test.

Sources: [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32.

### Full polarized local–global compatibility at ℓ

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime.

For n≥2, a conjugate-self-dual cohomological cuspidal Π over CM F, any ℓ, ι and v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2}) with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The theorem has no Shin-regularity condition; it uses purity of the geometric summand, temperedness and the pure-parameter uniqueness theorem. Rank one is supplied by algebraic local class field theory.

The argument uses Twist to the conjugate-self-dual branch and take solvable local base change to an Iwahori situation.; Use log-crystalline purity of the tensor-square realization and the established temperedness theorem.; Apply Taylor–Yoshida pure WD uniqueness to the known semisimplification, then descend and undo the character twist.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline, AutomorphicGaloisRepresentationsPartII:AG2.6/log-crystalline-purity-on-the-automorphic-summand, AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness, AutomorphicGaloisRepresentationsPartII:AG2.5, EndoscopicTransferAndUnitaryTraceComparison:ET.7.

Acceptance requires A Steinberg parameter retains its nonzero N.; The even-rank non-Shin-regular case is included.

Sources: [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2; §§2 and 5.

### Nonselfdual de Rham comparison at ℓ

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison.

A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM F, n≥1, regular algebraic cuspidal π of highest weight a, ℓ, ι and v|ℓ, r_{π,ℓ,ι}|G_{F_v} is de Rham, has HT_τ={a_{ιτ,i}+n−i}, and WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}. Here rec^T(π_v)=rec(π_v|det|^{(1−n)/2}). No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed. This is the July 2026 preprint theorem, with its precise input chain recorded below.

The argument uses Use quantitative Hecke annihilators for cohomology outside the middle degree (Theorem 2.5.7), via local Shimura cohomology and Mantovan’s formula, rather than a residual genericity assumption.; Use bounded potentially semistable pseudodeformation quotients for arbitrary residual multiplicities (Theorem 3.3.6).; Control non-Siegel boundary terms and shift interior cohomological degrees; induction on n yields the bounded torsion local–global comparison P(n,a,S,T_n) in Proposition 5.2.8.; After suitable cyclic base change remove the auxiliary local-degree inequalities in Proposition 5.2.8 and apply Theorem 5.2.9.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, PadicHodgeTheory:R06.3/weil-deligne-parameter, AutomorphicGaloisRepresentationsPartII:AG2.4.

Acceptance requires Reducible residual representations are allowed.; The result is equality after ss, not an equality of monodromy operators.

Sources: [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9.

### Nonselfdual monodromy bound at ℓ

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound.

Under the preceding theorem, WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v). The order fixes the semisimplified Weil representation and compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-i sum on the left is ≤ the corresponding sum on the right. It is Varma’s order of §8.2, used in AHTW Definition 6.0.2. Full equality of N is not asserted for a general nonselfdual ramified π_v.

The argument uses Use the ss equality from Theorem 1.2.1.; Local genericity of a cuspidal global π implies its local rec^T parameter is generic in the WD sense Hom_WD(D,D(1))=0.; Apply Proposition 6.0.5 and Corollary 6.0.6: its monodromy is maximal in the fixed-Weil-parameter space.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound, AutomorphicGaloisRepresentationsPartII:AG2.5.

Acceptance requires Two parameters with the same Weil semisimplification and different N can satisfy a strict inequality.; WD genericity here is a characteristic-zero Hom condition, not AG2.7 residual genericity.

Sources: [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.111–112.

### Nonselfdual spherical and Iwahori admissibility

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary.

For arbitrary regular algebraic cuspidal π over a CM field, r_{π,λ}|G_{F_v} is crystalline when v|ℓ and π_v is spherical, and is semistable when π_v has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the rec^T Satake polynomial. Proof: de Rham implies potentially semistable; ss compatibility gives trivial WD inertia for Iwahori π_v, and the monodromy bound against N=0 forces N=0 in the spherical case. Iwahori semistability does not establish full monodromy equality.

The argument uses Apply the p-adic monodromy theorem.; A finite inertia action in characteristic zero is semisimple; triviality of its semisimplification therefore gives trivial inertia.; For spherical π_v all Jordan blocks on the upper bound have size one, so the dominance order forces N=0.; Apply the supplier’s semistable/crystalline criterion and Frobenius comparison.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound, PadicHodgeTheory:R06.3/p-adic-monodromy-theorem, PadicHodgeTheory:R06.3/weil-deligne-descent.

Acceptance requires An Iwahori parameter may retain nonzero N.; No Fontaine–Laffaille weight range or residual genericity is required.

Sources: [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.

### Totally real polarized coefficient-prime descent

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent.

For a regular algebraic essentially self-dual cuspidal π over a totally real F, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

The argument uses Use the totally-real attached representation from AG2.0 and BLGGT.; Choose a cuspidality-preserving quadratic CM extension split at the prescribed finite place and identify the restrictions by their good polynomials.; Apply the full polarized CM coefficient-prime theorem at the unchanged local field and transport its Hodge/WD data.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-hodge-comparison-through-families-and-descent, EndoscopicTransferAndUnitaryTraceComparison:ET.7.

Acceptance requires The completion at the selected place is unchanged by split base change.; The rank-two exact R19 overlap imports its full all-Hilbert theorem.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; §2.1 terminology.

### Embedding independence and semisimple uniqueness

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness.

Fix π, its coefficient field M_π, λ and the embedding M_π→Q̄_ℓ attached to λ. Any two continuous semisimple n-dimensional representations of G_F with the common good geometric Frobenius polynomials P_v for v outside a finite set are isomorphic over Q̄_ℓ. Thus r_{π,ℓ,ι} depends on ι only through its restriction to M_π, up to isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different λ are compared by the common M_π-polynomials, not by identifying their topological coefficient fields.

The argument uses Use Chebotarev density to extend equality from good Frobenius classes to continuous characteristic-zero traces or characteristic polynomials.; Apply arbitrary-rank semisimple Brauer–Nesbitt.; For changes of ι fixing M_π, good polynomials coincide; conclude isomorphism, retaining scalar automorphisms.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, ArithmeticGaloisRepresentations:R01.5, mathlib:Matrix.charpoly_units_conj.

Acceptance requires In rank one, an algebraic Hecke character is recovered.; Scalar matrices give nonunique intertwiners even for an absolutely irreducible member.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094.

### Compatible system attached to π

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi.

For a regular algebraic cuspidal π of GL_n(A_F), with F CM, or F totally real and π polarized, construct the instance R_π of the imported arbitrary-rank R24.5 carrier: M_π is the field fixed by σ∈Aut(C) preserving π^∞; S_π is the finite ramification set of π; P_v(X) is the common monic rec^T geometric Frobenius polynomial; r_λ is the attached continuous semisimple representation; H_τ={a_{τ,i}+n−i}. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for v outside S_π above ℓ. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every π.

The construction uses Fix the finite rationality field and finite ramification set from AG2.0.; Install every λ-member and P_v using good-place compatibility and embedding independence.; Read the labelled Hodge multisets from the coefficient-prime theorem and prove the weak predicate.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary, AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent.

The API serves PotentialAutomorphyInfrastructure:PA.0: Supplies the fixed automorphic members and their normalization, before deformation or lifting.; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems: Allows tensor, dual and algebraic-character operations on the same carrier..

- **TauCeti.AutomorphicGalois.compatibleSystem** (constructor): Map π to R_π in the supplier carrier.
- **TauCeti.AutomorphicGalois.compatibleSystem_member** (projection): The λ-member after embedding is r_{π,ℓ,ι}, up to isomorphism.
- **TauCeti.AutomorphicGalois.compatibleSystem_goodPolynomial** (simp): At v outside S_π, the common polynomial is P_v(X).
- **TauCeti.AutomorphicGalois.compatibleSystem_hodgeTate** (data): The labelled multiset is {a_{τ,i}+n−i}, including multiplicities.
- **TauCeti.AutomorphicGalois.compatibleSystem_weak** (compatibility): R_π satisfies the R24.5 weak predicate, with explicit normalization conversion.
- **TauCeti.AutomorphicGalois.compatibleSystem_embedding** (extensionality): Two ι inducing the same λ on M_π give isomorphic members.

Acceptance tests:

- **TauCeti.AutomorphicGalois.compatibleSystem_rank_one** (degenerate): For an algebraic Hecke character ψ, this is its class-field-theoretic compatible system.
- **TauCeti.AutomorphicGalois.compatibleSystem_weight_k** (computation): At n=2, a=(k−2,0), the Hodge multiset is {k−1,0} and its sum is k−1.
- **TauCeti.AutomorphicGalois.compatibleSystem_R19** (compatibility): On the exact classical/Hilbert overlap, applying the stated dual/twist dictionary identifies each λ-member with the R19 fixed-form member.
- **TauCeti.AutomorphicGalois.compatibleSystem_no_automatic_strictness** (non-example): A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094; [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1, pp.5–6.

### Complex and local coefficient conjugation

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation.

For RAESDC π over totally real F or RAECSDC π over CM F, σ∈Aut(C), r_{σπ,ι}≅r_{π,σ⁻¹ι}. If σ_ℓ∈Gal(Q̄_ℓ/Q_ℓ) and σ=ισ_ℓι⁻¹, then σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}. Coefficient conjugation acts on matrix entries; the absolute Galois group G_F is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

The argument uses Use rationality and conjugation of finite automorphic components from Clozel’s theorem.; Conjugate every good Satake polynomial and compare through σ⁻¹ι.; Apply semisimple uniqueness; the local formula follows by taking σ=ισ_ℓι⁻¹.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, AutomorphicFormsOnReductiveGroups:AF.4.

Acceptance requires σ=id gives the same isomorphism class.; Composition gives σ_ℓτ_ℓ(r)≅σ_ℓ(τ_ℓ(r)), not a pullback on G_F.

Sources: [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Theorem 5.1 and Lemma 5.2, p.38, footnote 4.

### Strong coefficient field

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field.

For Π cuspidal conjugate-self-dual with archimedean principal series arg^{1−n},arg^{3−n},…,arg^{n−1} (Liu’s relevant specialization) and a number field E⊂C containing Q(Π), E is a strong coefficient field if for each finite λ of E there exists a continuous E_λ-linear ρ_{Π,λ} whose scalar extension to Q̄_ℓ is ρ_{Π,ι} for every ι inducing λ. Members are unique up to E_λ-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners.

The construction uses Define the simultaneous realization condition on the supplier’s family, keeping the embedding compatibility.; Use descent/uniqueness only after scalar extension; record E_λ-linear conjugacy as the equivalence relation.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality, ArithmeticGaloisRepresentations:R01.5.

The API serves Liu et al., §3.2 and Appendix D: Defines λ-members and integral reductions simultaneously.; AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi: Uniform field of definition can precede every local lattice choice..

- **TauCeti.AutomorphicGalois.IsStrongCoefficientField** (characterisation): The preceding all-λ realization property.
- **TauCeti.AutomorphicGalois.strongCoefficientField_member** (data): Choose an E_λ-realization with its scalar-extension isomorphism.
- **TauCeti.AutomorphicGalois.strongCoefficientField_baseChange** (functoriality): For E′/E finite, each λ′-member is E′_λ′⊗_{E_λ}ρ_{Π,λ}, with the identity and composition laws.
- **TauCeti.AutomorphicGalois.strongCoefficientField_unique** (extensionality): Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

Acceptance tests:

- **TauCeti.AutomorphicGalois.strongCoefficientField_character** (degenerate): A rank-one character whose values lie in E has the expected E_λ-realizations.
- **TauCeti.AutomorphicGalois.strongCoefficientField_extension** (compatibility): Changing E to a finite extension gives exactly the supplier’s coefficient base-change operation at every λ′.
- **TauCeti.AutomorphicGalois.strongCoefficientField_not_rationality** (non-example): The definition does not identify rational Frobenius traces with a canonical E_λ-model; a nontrivial Schur obstruction must be split.
- **TauCeti.AutomorphicGalois.strongCoefficientField_scalar_intertwiner** (characterisation): Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class.

Sources: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition 3.2.5 and Remark 3.2.6, printed p.145.

### Uniform strong realization of polarized systems

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems.

For a conjugate-self-dual cohomological cuspidal Π over CM F, there is one finite number field E⊂C which is a strong coefficient field for all λ. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field E_0 of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each λ can use one place away from ℓ; a split regular Frobenius and E_0-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

The argument uses Regular Hodge–Tate weights give a regular semisimple element in the algebraic monodromy group.; Choose two good regular Frobenius elements of different residue characteristics by Chebotarev.; Adjoin their eigenvalues to E_0 and apply the splitting/descent argument at each λ.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline, AutomorphicGaloisRepresentationsPartII:AG2.6/strong-coefficient-field, ArithmeticGaloisRepresentations:R01.5.

Acceptance requires Both good places are needed so one lies away from each coefficient prime.; Hypothesis 3.2.10 is not used for the existence of an enlarged E.

Sources: [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), Proposition 3.2.5, p.12; [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Remark 3.2.6, printed p.145.

### Purity and polarization of the polarized system

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure.

For a regular algebraic polarized cuspidal (π,χ) with a_{τ,i}+a_{τc,n+1−i}=w, R_π is pure and BLGGT-strictly pure of weight W=w+n−1. Its polarization is r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}; the χ-system has purity weight 2w. Total oddness uses μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1), so the required sign is χ_v(−1)=(−1)^{n+w}. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition.

The argument uses Use the algebraic weight symmetry and AG2.0’s corrected multiplier sign.; Apply tempered local comparison and weight purity at the good and away-coefficient places.; Populate the separate pure/polarized predicates, then use full coefficient-prime comparison for the all-place property.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier, AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/polarized-system, PotentialModularityAndCompatibleSystems:R24.5/character-system.

Acceptance requires At n=2, a=(k−2,0), W=k−1.; Purity is not inferred from a common polynomial family on an arbitrary nonselfdual branch.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65.

### Very weak compatibility and the density-one DGI route

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi.

The constructed R_π is weakly compatible, hence very weakly compatible by the imported weakening map. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational ℓ for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.

The argument uses Apply the all-CM or totally-real polarized weak compatibility already proved for R_π.; Forget to the very weak predicate; the finite ramification set omits only finitely many coefficient characteristics.; Compare its conclusion with the two ACC+ source lemmas without importing their downstream Fontaine–Laffaille route.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

Acceptance requires A finite set of exceptional ℓ is allowed.; Existence of a local generic prime alone does not establish absolute irreducibility.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemmas 7.1.9–7.1.10, pp.1093–1094.

### Comparison strength at the coefficient prime

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give.

The polarized branch has de Rham admissibility and full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1; spherical crystallinity and Iwahori semistability follow from WD criteria. Full N equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

The argument uses Compare the exact outputs without upgrading a bound to equality.; Retain the branch tag on each arithmetic export.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound.

Acceptance requires A ramified nonselfdual member cannot be passed to a full-WD consumer without an additional theorem.; Crystallinity at good places is sufficient for the imported weak predicate.

Sources: [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6; [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2.

### Rank-two comparison with R19

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19.

For a fixed classical newform of weight k≥2 or regular cohomological Hilbert eigenform in the exact R19.3/5 overlap, identify the AG2 λ-member with the R19 member after converting geometric/arithmetic Frobenius and the stated Tate twist. For the standard weight-k classical normalization this is r_AG2≅r_R19^∨, giving geometric polynomial X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}, and det=r_ψ ε^{1−k} where r_ψ(Frob_q^geom)=ψ(q). For Hilbert (k_τ,w) use Skinner’s explicit half-integer normalization before dualizing; parity is part of its hypotheses. Import R19’s full Skinner coefficient-prime theorem, not Kisin’s conditional theorem as unconditional.

The argument uses Fix the same eigenform and match normalized good Frobenius polynomials.; Apply semisimple uniqueness for the transported λ-members.; Transport Hodge and WD data from the supplier theorem on its exact regular-weight domain.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions.

Acceptance requires For k=2 the weights are {0,1}; geometric det is ψε⁻¹.; Finite-image weight-one systems do not enter the regular k≥2 comparison.

Sources: [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf), §1.5 formula (1.6); Theorem 3.2.3.

### Coefficient independence of tensor automorphy

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding.

Let π_1 and σ be RAESDC over a totally real F. Suppose r_{π_1,ι}⊗r_{σ,ι} is irreducible and automorphic for one (ℓ,ι), in the RAESDC sense used by Newton–Thorne. Then r_{π_1,j}⊗r_{σ,j} is automorphic for every prime q and j:Q̄_q≅C. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

The argument uses Choose the RAESDC automorphic realization at the initial coefficient embedding and conjugate it so its good polynomials match those of the tensor product in C.; Use the λ-independent tensor operation on the supplier carrier.; At each (q,j) compare good polynomials and apply arbitrary-rank semisimple uniqueness.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation, AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-embedding-independence-and-semisimple-uniqueness, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.

Acceptance requires The identity coefficient embedding recovers the given automorphic representation.; No residual genericity is introduced by changing j.

Sources: [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2), Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1.

### GSp₄ crystalline Hodge comparison

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison.

In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform f of good p-level and weight (a,b), a≥b≥3, the AG2.2 transferred r_f is crystalline at p with HT={0,b−2,a−1,W}, W=a+b−3. If f is also an eigenform for the Hecke operators at p, det(X−φ)=λ_f(Q_p(X)) in their monic convention. The eigenform-at-p condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.

The argument uses Apply the ML.4 transfer and AG2.2 GSp4-valued realization with its exact similitude.; Read the four graded weights from the regular algebraic coefficient system.; Apply crystalline comparison at good p-level and the specialized p-Hecke polynomial when its eigencharacter exists.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.2, ModularityAndLanglandsExtensions:ML.4, AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline.

Acceptance requires At (a,b)=(3,3) the weights are {0,1,2,3}.; Singular limit-of-discrete-series weights are not asserted by this theorem.

Sources: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(3), printed pp.838–839.

### Ordinary GSp₄ triangular shape

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/ordinary-gsp4-coefficient-prime-shape.

Under CG Proposition 6.8(4), assume f is a p-Hecke eigenform and ordinary: its T_{p,1} and Q_{p,2} eigenvalues are units. The roots α,β,γ,δ of λ_f(Q_p(X)) have valuations 0,b−2,a−1,W and are distinct. r_f|G_Qp has the upper-triangular diagonal unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ). The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.

The argument uses Apply the two unit-eigenvalue hypotheses in CG’s ordinary criterion.; Determine root valuations in increasing order and normalize each by its p-power.; Use the ordinary crystalline filtration to obtain the stated triangular diagonal.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison, PadicHodgeTheory:R06.4/ordinary-representation, PadicHodgeTheory:R06.4, ModularityAndLanglandsExtensions:ML.4.

Acceptance requires At a=b=3 the valuations 0,1,2,3 are all distinct.; The formula imposes no splitting of the off-diagonal extensions.

Sources: [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proposition 6.8(4), printed p.839.

### Pilloni GSp₄ normalization comparison

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.6/pilloni-gsp4-normalization-comparison.

Pilloni Theorem 5.1.7.1 for cuspidal π with discrete-series π_∞ and parameter (λ_1,λ_2;−λ_1−λ_2+3) gives a de Rham representation with HT={0,−λ_2,−λ_1,−λ_1−λ_2}. At p outside the nonspherical set it is crystalline and det(1−Xφ)=Θ_π(Q_p(X)). Its geometric Frobenius and HT(ε)=−1 conventions require reciprocal conversion X^4Q_p(1/X) to the monic polynomial. The corrected similitude exponent is ε^{λ_1+λ_2}, as recorded in E27 of the paper extraction. Substitution λ_1=1−a, λ_2=2−b gives CG’s four Hodge numbers; identifying the automorphic representations also requires the ML.4 Harish–Chandra/Satake dictionary.

The argument uses Read the discrete-series hypothesis and the author copy’s exact weight signs.; Reverse the degree-four polynomial, retaining the determinant convention.; Compare the Hodge recipes algebraically; use the requested transfer dictionary before asserting equality of representations.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/gsp4-crystalline-hodge-comparison, AutomorphicGaloisRepresentationsPartII:AG2.2, ModularityAndLanglandsExtensions:ML.4.

Acceptance requires λ=(−2,−1) gives {0,1,2,3}.; The theorem is not an assertion for every singular-weight p-adic form.

Sources: [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 5.1.7.1(3)–(4), Remark 5.1.7.2, author-copy pp.22–23.

## AG2.7. Integral, residual and reusable arithmetic exports

### Finite p-adic realization before lattices

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization.

For each continuous r_{π,ℓ,ι}:G_F→GL_n(Q̄_ℓ), there is a finite extension E/Q_ℓ over which its matrices are defined, after a change of basis if desired. Prove this before invoking a compact-local-field stable-lattice theorem. The compact image is covered by GL_n(E) for the countably many finite subextensions of Q̄_ℓ/Q_ℓ; Baire gives one such closed subgroup with open intersection, and finitely many coset representatives lie in a larger finite field. A uniform strong number field is available on the polarized branch, but is not needed for this local assertion.

The argument uses Use the compactness of the continuous image of G_F and the countability of finite local extensions inside Q̄_ℓ.; Apply Baire to image∩GL_n(E), which is closed, obtaining an open subgroup.; Adjoin entries of finitely many coset representatives to E.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi, ArithmeticGaloisRepresentations:R01.1.

Acceptance requires Do not apply local-field lattice compactness directly over Q̄_ℓ.; The chosen E is finite over Q_ℓ, not a finite field of positive characteristic.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, after Theorem 2.1.1, p.34.

### Residual representation of π

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi.

Choose a finite E/Q_ℓ realizing r_{π,λ}, an O_E-stable lattice L, and a basis of L. Define r̄_{π,λ} as the semisimplification of L/m_EL. Its isomorphism class over k̄_ℓ is independent of L, the basis and enlargement of E, for a fixed coefficient embedding λ. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good v away from ℓ it is unramified and has characteristic polynomial P_v reduced through λ. For F/F^+ CM in the totally odd polarized branch, the semisimple residual polarized representation admits the 𝒢_n-valued extension with multiplier ε̄^{1−n}r̄_χ supplied by the polarized representation API. An arbitrary lattice is not declared self-dual.

The construction uses Use finite p-adic realization first; compactness then supplies an O_E-stable lattice.; Reduce the integral representation and semisimplify; use arbitrary-rank residual Brauer–Nesbitt for lattice independence.; Descend the semisimple member by finite-field Brauer-group vanishing, using all characteristic-polynomial coefficients.; Apply the polarized semisimple extension theorem rather than claiming every chosen lattice carries a perfect pairing.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/finite-p-adic-field-of-realization, ArithmeticGaloisRepresentations:R01.1/continuity-descent-and-lattice-independence, ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent, AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation, GlobalGaloisDeformations:G7/polarized-deformation-problem, mathlib:Matrix.GeneralLinearGroup.map.

The API serves ACC+, Definition 2.3.6: Certifies the residual Galois type of m_π.; PotentialAutomorphyInfrastructure:PA.0: Supplies residual automorphic input, without adding irreducibility or enormous-image hypotheses..

- **TauCeti.AutomorphicGalois.residualRep** (constructor): The continuous semisimple residual member over its finite field of realization.
- **TauCeti.AutomorphicGalois.residualRep_indep_lattice** (extensionality): Two lattice reductions have isomorphic semisimplifications over k̄_ℓ.
- **TauCeti.AutomorphicGalois.residualRep_coeffExtension** (functoriality): Enlargement of E gives scalar extension of the same semisimple residual representation.
- **TauCeti.AutomorphicGalois.residualRep_goodPolynomial** (compatibility): At good v away from ℓ the polynomial is the coefficient reduction of P_v.
- **TauCeti.AutomorphicGalois.residualRep_extendGn** (constructor): For F/F^+ CM, totally odd polarized residual members extend to 𝒢_n with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

Acceptance tests:

- **TauCeti.AutomorphicGalois.residualRep_rank_one** (degenerate): For an integral character ψ, r̄ is its reduction and no semisimplification changes it.
- **TauCeti.AutomorphicGalois.residualRep_diagonal_reduction** (computation): Reduction of diag(1,2) modulo 3 has polynomial (X−1)(X−2), the reduction of the characteristic-zero polynomial.
- **TauCeti.AutomorphicGalois.residualRep_R19_dual** (compatibility): For the classical weight-k overlap at fixed λ, r̄_AG2≅r̄_R19^∨ under the same residue embedding.
- **TauCeti.AutomorphicGalois.residualRep_noncanonical_lattice** (non-example): For the Z_5-action r(t)=[[1,5t],[0,1]], lattices with bases (e1,e2) and (5e1,e2) give identity and nontrivial unipotent reductions; both semisimplify to 1⊕1.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), §2.1, p.34; [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, p.1085.

### Reduction of good Frobenius polynomials

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction.

For a stable lattice realization A_v∈GL_n(O_E) of a good geometric Frobenius, Matrix.charpoly(A_v) has integral coefficients and maps under O_E→k_E to Matrix.charpoly(Ā_v); semisimplification leaves it unchanged. Thus the reduced polynomial is the reduction of ι⁻¹P_v. The constant term is a unit because A_v is invertible. This is ordinary characteristic-polynomial coefficient change, not a new determinant-law construction.

The argument uses Write Frobenius in an integral lattice basis.; Apply the pinned Matrix.charpoly_map lemma to residue reduction.; Apply the supplier’s semisimplification invariance to the reduced representation.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, mathlib:Matrix.charpoly_map, mathlib:Matrix.GeneralLinearGroup.map.

Acceptance requires For diag(1,2) modulo 3, X²−3X+2 becomes X²+2.; Conjugating the lattice basis leaves the polynomial unchanged.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085.

### Maximal Hecke ideal of Galois type

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type.

For the unramified integral Hecke algebra T^S over O, a maximal ideal m with finite residue field k_m is of Galois type if there exists a continuous semisimple r_m:G_{F,S}→GL_n(k_m) such that at every v outside S its good geometric Frobenius polynomial is Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} modulo m (T_{v,0}=1). Include the coefficient prime in S for this unramified quotient statement. r_m is considered up to isomorphism; the condition does not itself require absolute irreducibility.

The construction uses Use the supplier’s T^S and the residual Frobenius convention fixed by AG2.0.; Quantify a continuous semisimple realization of the reduced Hecke polynomials.; Use residual Chebotarev/Brauer–Nesbitt for uniqueness up to isomorphism.

Direct inputs: IntegralHeckeAndGaloisDeterminants:IHG.3, AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions, ArithmeticGaloisRepresentations:R01.5.

The API serves ACC+, §2.3 and Chapter 4: Chooses the residual representation attached to localization at m.; IgusaVarietiesAndTorsionConcentration:IG.5: Provides the residual representation on which genericity is imposed..

- **TauCeti.AutomorphicGalois.IsGaloisType** (characterisation): Existence of the stated semisimple realization over k_m.
- **TauCeti.AutomorphicGalois.galoisType_rep** (data): A chosen r_m together with the polynomial matching theorem.
- **TauCeti.AutomorphicGalois.galoisType_rep_unique** (extensionality): Any two semisimple realizations are isomorphic after a common residue-field extension.
- **TauCeti.AutomorphicGalois.galoisType_coeffExtension** (compatibility): The polynomial comparison commutes with the existing GL coefficient map.

Acceptance tests:

- **TauCeti.AutomorphicGalois.galoisType_rank_one_polynomial** (computation): For n=1 the constant term is −T_{v,1}.
- **TauCeti.AutomorphicGalois.galoisType_reducible** (degenerate): A Hecke eigencharacter with r_m=1⊕1 can be of Galois type.
- **TauCeti.AutomorphicGalois.galoisType_charpoly_map** (compatibility): Residue extension maps the matched polynomial exactly by Matrix.charpoly_map.
- **TauCeti.AutomorphicGalois.galoisType_not_nonEisenstein** (non-example): The reducible example cannot certify non-Eisensteinness.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, printed p.938.

### Non-Eisenstein maximal ideal

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal.

A maximal ideal m of T^S is non-Eisenstein if it is of Galois type and its semisimple realization r_m is absolutely irreducible. The condition is independent of the chosen realization by semisimple uniqueness. It is a global condition, separate from local ACC+ genericity and from enormousness of the image after restriction to G_{F(ζ_ℓ)}.

The construction uses Conjoin Galois type with absolute irreducibility of its realization.; Use uniqueness and invariance under residue-field extension to make the condition intrinsic to m.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type.

The API serves ACC+, Theorem 2.3.5 and Chapter 4: Separates irreducible localized Galois data from reducible Galois-type data..

- **TauCeti.AutomorphicGalois.IsNonEisenstein** (characterisation): Galois type plus absolute irreducibility.
- **TauCeti.AutomorphicGalois.nonEisenstein_galoisType** (projection): Forget absolute irreducibility.
- **TauCeti.AutomorphicGalois.nonEisenstein_coeffExtension** (compatibility): Absolute irreducibility persists under any residue-field extension and is detected over k̄.

Acceptance tests:

- **TauCeti.AutomorphicGalois.nonEisenstein_rank_one** (degenerate): Every rank-one Galois-type realization is absolutely irreducible.
- **TauCeti.AutomorphicGalois.nonEisenstein_not_trivial_rank_two** (non-example): The rank-two trivial representation cannot make its ideal non-Eisenstein.
- **TauCeti.AutomorphicGalois.nonEisenstein_absolute_not_relative** (characterisation): An irreducible k_m-representation that splits over k̄_m does not satisfy the definition.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938.

### Independence of the residual Hecke ideal

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence.

Fix π, λ and an integral eigencharacter θ_π:T^S→O_E at that coefficient place. Then m_{π,λ}=ker(T^S→O_E→k_E) is of Galois type with realization r̄_{π,λ}. Its kernel is independent of stable lattice, basis and finite extension of E inducing the same λ: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when r̄_{π,λ} is absolutely irreducible. Independence across distinct λ is not asserted.

The argument uses Match the reduced θ_π(P_v) with the residual Frobenius polynomial.; Use semisimple lattice independence for the representation.; An injective residue-field extension leaves the kernel of θ̄_π unchanged.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction, AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type, AutomorphicGaloisRepresentationsPartII:AG2.7/non-eisenstein-maximal-ideal, IntegralHeckeAndGaloisDeterminants:IHG.3.

Acceptance requires Changing a lattice cannot change m_{π,λ}.; Different coefficient primes can yield different maximal ideals.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085.

### Dual and character-twist Hecke comparison

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/dual-and-character-twist-hecke-comparison.

For a Galois-type maximal ideal m of rank n, the contragredient Hecke ideal m^∨ is of Galois type with r_{m^∨}≅r_m^∨⊗ε̄^{1−n}. At good geometric Frobenius its eigenvalues are q_v^{n−1}/α_i. An integral unramified-at-v character ψ multiplies the eigenvalues by ψ(Frob_v), and its Hecke twist realizes r_m⊗ψ̄. In the rank-2n unitary Hecke algebra the reciprocal factor is q_v^{2n−1}. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

The argument uses Apply the contragredient Hecke involution to the polynomial coefficients.; Compute eigenvalues of dual times the geometric cyclotomic twist.; Match all good polynomials and use semisimple uniqueness.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type, IntegralHeckeAndGaloisDeterminants:IHG.3, AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.

Acceptance requires At n=2, α_i become q/α_i.; A ramified scalar twist can violate local unramifiedness.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 2.3.6, p.938.

### Local residual genericity

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes.

Let L/Q_p be any finite extension with residue cardinality q, ℓ≠p, k a finite field of characteristic ℓ, and r:G_L→GL_n(k) continuous. It is ACC+-generic at L if inertia acts trivially and, over k̄, the eigenvalues α_i∈k̄× of r(Frob_L^geom), listed with multiplicity, satisfy α_i/α_j≠q for every i≠j. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when q≠1 in k; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

The construction uses Use actual residual local inertia and a Frobenius lift; unramifiedness makes the matrix independent of the lift.; Split the characteristic polynomial in k̄ and test all ordered pairs of eigenvalues, retaining multiplicity.; Keep the eigenvalue predicate separate from its local representation predicate.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, ArithmeticGaloisRepresentations:R01.1, mathlib:Matrix.charpoly, mathlib:Matrix.GeneralLinearGroup.map.

The API serves ACC+, §4.3; §6 Taylor–Wiles construction: Provides the local noncyclotomic ratio input without implying the other global hypotheses.; IgusaVarietiesAndTorsionConcentration:IG.5: This is the condition exported by AG2.7 to the Hecke localization consumer..

- **TauCeti.AutomorphicGalois.IsGenericEigenvalues** (characterisation): For a list α:Fin n→k×, require α_i/α_j≠q for i≠j; list multiplicities are retained.
- **TauCeti.AutomorphicGalois.IsGeneric** (characterisation): Trivial inertia together with the eigenvalue predicate over k̄.
- **TauCeti.AutomorphicGalois.isGeneric_unramified** (projection): A locally generic representation kills inertia.
- **TauCeti.AutomorphicGalois.isGeneric_frobenius_independent** (extensionality): For trivial inertia, changing the Frobenius lift preserves the matrix and predicate.
- **TauCeti.AutomorphicGalois.isGenericEigenvalues_smul** (functoriality): Multiplication of every α_i by the same nonzero scalar preserves the eigenvalue predicate.
- **TauCeti.AutomorphicGalois.isGenericEigenvalues_reindex** (compatibility): Reordering the list by a permutation leaves the predicate unchanged.
- **TauCeti.AutomorphicGalois.isGenericEigenvalues_inverse** (compatibility): Inverting every eigenvalue preserves the predicate by exchanging ordered pairs.

Acceptance tests:

- **TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue** (computation): Over F_3 with q=2, the list (1,1) is generic.
- **TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q** (non-example): Over F_5 with q=2, the distinct list (2,1) is not generic.
- **TauCeti.AutomorphicGalois.isGeneric_rank_one** (degenerate): Every one-term nonzero list is generic.
- **TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one** (non-example): Over F_3 with q=1, (1,1) is not generic.
- **TauCeti.AutomorphicGalois.isGeneric_matrix_diagonal** (compatibility): The list condition on α agrees with the characteristic-polynomial factorization of the diagonal matrix diag(α).

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(1), p.972.

### Completely split generic prime

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime.

For a continuous residual r:G_F→GL_n(k), a rational prime p is a decomposed-generic prime if p≠ℓ, p is completely split in F, and r is unramified and ACC+-generic at every v|p. Complete splitting means e_v=f_v=1 at every v, so q_v=p. This is a property of the pair (r,p), distinct from local genericity at one arbitrary place and from existence of such a p.

The construction uses Conjoin coefficient-prime avoidance, complete splitting and the local predicate at every place.; Use complete splitting to rewrite each q_v as p in the residue field.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes, ArithmeticGaloisRepresentations:R01.1.

The API serves ACC+, Lemma 4.3.2: Provides the witness whose Frobenius class is reproduced by Chebotarev..

- **TauCeti.AutomorphicGalois.IsDecomposedGenericPrime** (characterisation): The complete-splitting and all-v condition.
- **TauCeti.AutomorphicGalois.decomposedGenericPrime_local** (projection): For every v|p, obtain unramifiedness and the local predicate with q=p.
- **TauCeti.AutomorphicGalois.decomposedGenericPrime_coeffExtension** (functoriality): Any extension of the finite coefficient field preserves and reflects the condition.

Acceptance tests:

- **TauCeti.AutomorphicGalois.decomposedGenericPrime_Q** (computation): For F=Q there is exactly one place over p; the splitting clause is automatic.
- **TauCeti.AutomorphicGalois.decomposedGenericPrime_not_inert** (non-example): An inert prime in a quadratic F is not decomposed generic even when the local ratio condition holds.
- **TauCeti.AutomorphicGalois.decomposedGenericPrime_not_ell** (degenerate): p=ℓ is excluded independently of eigenvalues.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(2), p.972.

### Decomposed generic residual representation

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity.

A continuous residual representation r:G_F→GL_n(k) is decomposed generic if there exists a rational prime p which is decomposed generic for r. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

The construction uses Quantify the auxiliary rational prime in the preceding predicate.; Keep its witness available for the infinite-prime theorem.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/completely-split-generic-prime.

The API serves ACC+, Lemma 7.1.9: Supplies the density-one DGI hypothesis, separately from absolute irreducibility.; PotentialAutomorphyInfrastructure:PA.1: Genericity hypothesis for the Fontaine–Laffaille comparison..

- **TauCeti.AutomorphicGalois.IsDecomposedGeneric** (characterisation): There exists p satisfying IsDecomposedGenericPrime(r,p).
- **TauCeti.AutomorphicGalois.decomposedGeneric_witness** (data): Extract the prime witness and all-v local conditions.
- **TauCeti.AutomorphicGalois.decomposedGeneric_coeffExtension** (compatibility): The existential condition is preserved and reflected by finite residue-field extension.

Acceptance tests:

- **TauCeti.AutomorphicGalois.decomposedGeneric_trivial_F3** (computation): For F=Q, k=F_3, r=1⊕1, the prime p=2 is a witness.
- **TauCeti.AutomorphicGalois.decomposedGeneric_not_irreducible** (non-example): The preceding decomposed-generic representation is reducible.
- **TauCeti.AutomorphicGalois.decomposedGeneric_not_every_prime** (characterisation): For the same r, p=7 has q=1 mod 3 and is not a witness, although p=2 is.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 4.3.1(2), p.972.

### Strong local decomposed genericity

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity.

For any finite extension L/Q_p, ℓ≠p, define the Caraiani–Scholze Definition 1.9 specialization: r is unramified and α_i/α_j∉{1,q} for all i≠j over k̄. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be Q_p. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

The construction uses Add injectivity of the eigenvalue list to the ACC+ ratio predicate, equivalently excluding ratio 1.; Prove invariance under scalar, permutation, dual and coefficient extension with the same unramifiedness clauses.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes.

The API serves Caraiani–Scholze, Definition 1.9 and §6: The residual stronger condition controls generic principal-series lifts.; Liu et al., Appendix D: States the distinction between the displayed strong condition and the relaxed concentration input..

- **TauCeti.AutomorphicGalois.IsStrongGenericEigenvalues** (characterisation): IsGenericEigenvalues(α,q) and α injective, equivalently ratios avoid {1,q}.
- **TauCeti.AutomorphicGalois.IsStrongGeneric** (characterisation): Trivial inertia plus the stronger eigenvalue predicate over k̄.
- **TauCeti.AutomorphicGalois.strongGeneric_generic** (projection): Forget the ratio-1 exclusion.
- **TauCeti.AutomorphicGalois.strongGeneric_distinct** (projection): The Frobenius eigenvalues have no repeated roots.
- **TauCeti.AutomorphicGalois.strongGeneric_arbitrary_local_field** (compatibility): The definition uses q=|k_L| and specializes to Definition 1.9 for every finite L/Q_p.

Acceptance tests:

- **TauCeti.AutomorphicGalois.strongGeneric_not_repeated** (non-example): Over F_3, q=2, (1,1) is ACC+-generic but not strong-generic.
- **TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio** (computation): Over F_7, q=2, (1,3) is strong-generic: the two ordered ratios are 3 and 5.
- **TauCeti.AutomorphicGalois.strongGeneric_rank_one** (degenerate): Every single nonzero eigenvalue is strong-generic.
- **TauCeti.AutomorphicGalois.strongGeneric_non_Qp** (compatibility): For an unramified quadratic L/Q_2 and ℓ=3, use q=4≡1; the ratio-1 clause remains explicit.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition 1.9, printed p.652; [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Definition D.1.2, footnote 37, printed p.365.

### Infinitely many decomposed generic primes

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes.

If r:G_F→GL_n(k) is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set. Let K be a normal closure of F, the field cut out by r and Q(ζ_ℓ). A witness determines a conjugacy class in Gal(K/Q) whose restriction fixes F, fixes the all-place eigenvalue ratios and fixes p mod ℓ. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

The argument uses Encode r, complete splitting and the cyclotomic residue value in one finite normal extension.; Use the witness’s Frobenius conjugacy class and all its conjugates to retain conditions at every v.; Apply Chebotarev and discard the chosen finite exceptional set.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity, ArithmeticGaloisRepresentations:R01.5.

Acceptance requires For r=1⊕1 over F_3 and F=Q, all p≡2 mod 3 away from 3 are witnesses.; Keeping only the field cut out by r loses the q=p mod ℓ information.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Lemma 4.3.2, pp.972–973.

### Genericity transfer and projective qualification

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/genericity-transfer-and-projective-qualification.

The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

The argument uses Cancel a common nonzero scalar in ratios and exchange ordered pairs for inversion.; Use conjugacy and coefficient-change invariance of characteristic polynomials.; For the global twist choose a witness away from the character’s finite ramification set.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes, AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity, AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes, mathlib:Matrix.charpoly_units_conj, mathlib:Matrix.charpoly_map.

Acceptance requires A ramified quadratic scalar twist of 1⊕1 at L=Q_2, k=F_3, has the same projective representation but is not locally generic.; For the globally trivial F_3 representation, an arbitrary finite character twist retains some good witness.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), After Definition 4.3.1, p.972; Lemma 4.3.2.

### Residual genericity outside finitely many λ

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/finite-exceptional-residual-genericity-for-relevant-pi.

For a relevant Π with a strong coefficient field E in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots α_i and α_i≠qα_j. After a finite extension of E containing these roots, exclude the finitely many coefficient places dividing denominators, roots, α_i−α_j or α_i−qα_j. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain the required split generic place for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own F^+≠Q and level hypotheses and belongs to the Igusa/torsion consumer.

The argument uses Use the relevant polarized regular representation and a regular unramified Frobenius from CH.; Local genericity of the characteristic-zero π excludes the q-ratios.; Exclude finitely many algebraic bad factors and use the Appendix D split-place Chebotarev argument.; Pass the resulting generic Hecke ideal to the consumer rather than importing concentration back into AG2.6.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/uniform-strong-realization-for-polarized-systems, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence, AutomorphicGaloisRepresentationsPartII:AG2.7/strong-local-decomposed-genericity, ArithmeticGaloisRepresentations:R01.5.

Acceptance requires A nonzero algebraic difference can vanish at finitely many λ; these λ must be excluded.; No absolute residual irreducibility or enormousness follows from this local condition.

Sources: [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Corollary D.1.4, printed p.368; Remark 3.2.6.

### Good-prime characteristic-zero export

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export.

GoodPrimeExport(π) consists of the imported R_π carrier, its finite coefficient field and common S_π/P_v data, the chosen λ-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping the supplier carrier, not a new compatible-system definition.

The construction uses Package the carrier and its good polynomial comparison.; Give the forgetful map from stronger branch exports and a coefficient-change map inherited from the supplier.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi.

The API serves PotentialAutomorphyInfrastructure:PA.0: The characteristic-zero fixed automorphic input.; IntegralHeckeAndGaloisDeterminants:IHG.1: Provides dense classical comparisons for interpolation, whose nonreduced determinant construction is owned by IHG..

- **TauCeti.AutomorphicGalois.GoodPrimeExport** (constructor): Wrap R_π with its good comparison maps.
- **TauCeti.AutomorphicGalois.goodPrimeExport_member** (projection): Retrieve the λ-member and good Frobenius theorem.
- **TauCeti.AutomorphicGalois.goodPrimeExport_coeffChange** (functoriality): Use supplier coefficient change, with identity and composition laws.

Acceptance tests:

- **TauCeti.AutomorphicGalois.goodPrimeExport_character** (degenerate): At n=1 it is the algebraic-character good-prime package.
- **TauCeti.AutomorphicGalois.goodPrimeExport_polynomial** (computation): For a weight-k classical overlap its polynomial is X²−a_qX+ψ(q)q^{k−1}.
- **TauCeti.AutomorphicGalois.goodPrimeExport_not_fullWD** (non-example): The package cannot supply N at a ramified place without branch evidence.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1093–1094.

### Nonselfdual Hodge and monodromy-bound export

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/nonselfdual-hodge-and-monodromy-bound-export.

NonselfdualComparisonExport(π) for an arbitrary regular algebraic cuspidal π over CM F wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and F-ss monodromy upper bound at every v|ℓ. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified N equality. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

The construction uses Package the proved de Rham/Hodge maps and the separate ss/bound statements at each coefficient-prime place.; Expose the spherical and Iwahori corollaries as hypothesis-indexed local projections.; Forget to the good-prime carrier without changing its members.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-de-rham-and-semisimplified-coefficient-comparison, AutomorphicGaloisRepresentationsPartII:AG2.6/nonselfdual-coefficient-prime-monodromy-bound, AutomorphicGaloisRepresentationsPartII:AG2.6/all-cm-crystalline-and-iwahori-corollary.

The API serves PotentialAutomorphyInfrastructure:PA.1: Supplies unrestricted de Rham and Hodge data before additional Fontaine–Laffaille/ordinary assumptions.; TorsionCohomologyInfrastructure: Keeps the unconditional characteristic-zero Hodge comparison distinct from residual concentration hypotheses..

- **TauCeti.AutomorphicGalois.NonselfdualComparisonExport** (constructor): Combine the AHTW coefficient-prime maps with the common carrier.
- **TauCeti.AutomorphicGalois.nonselfdualExport_goodPrime** (projection): Forget to GoodPrimeExport with the same members.
- **TauCeti.AutomorphicGalois.nonselfdualExport_hodge** (data): Retrieve de Rham comparison and the labelled multiset at every v|ℓ.
- **TauCeti.AutomorphicGalois.nonselfdualExport_wdBound** (data): Retrieve ss comparison and the F-ss monodromy upper bound, retaining their distinct strengths.

Acceptance tests:

- **TauCeti.AutomorphicGalois.nonselfdualExport_rank_one** (degenerate): For an algebraic character the Hodge multiset has one element and N=0.
- **TauCeti.AutomorphicGalois.nonselfdualExport_good_crystalline** (compatibility): At a spherical coefficient-prime place the upper bound N=0 and trivial inertia recover the crystalline supplier criterion.
- **TauCeti.AutomorphicGalois.nonselfdualExport_not_polarized_fullWD** (non-example): The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone.

Sources: [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1), Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.

### Polarized Hodge and Weil–Deligne export

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/polarized-hodge-and-wd-export.

PolarizedComparisonExport(π,χ) wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full F-ss WD comparison at all finite places, including coefficient-prime places. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, the supplier’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.

The construction uses Assemble separately established comparison and polarization maps.; Supply forgetful maps and their agreement on the underlying members.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/good-prime-characteristic-zero-export, AutomorphicGaloisRepresentationsPartII:AG2.6/full-polarized-comparison-at-the-coefficient-prime, AutomorphicGaloisRepresentationsPartII:AG2.6/totally-real-polarized-coefficient-prime-descent, AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure.

The API serves PotentialAutomorphyInfrastructure:PA.1–PA.5:  supplies the Hodge/polarization input before their additional local and residual hypotheses.; Liu et al., §3.2: Supplies the polarized relevant members and local comparison maps..

- **TauCeti.AutomorphicGalois.PolarizedComparisonExport** (constructor): Combine the established polarized branch comparisons.
- **TauCeti.AutomorphicGalois.polarizedExport_goodPrime** (projection): Forget to GoodPrimeExport, preserving all good polynomials.
- **TauCeti.AutomorphicGalois.polarizedExport_local** (data): Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- **TauCeti.AutomorphicGalois.polarizedExport_supplier** (compatibility): Return precisely the R24.5 pure/polarized predicates with normalization conversion.

Acceptance tests:

- **TauCeti.AutomorphicGalois.polarizedExport_weight_k** (computation): For a weight-k base-change form it returns H={0,k−1}, W=k−1 and determinant ε^{1−k}r_ψ.
- **TauCeti.AutomorphicGalois.polarizedExport_forget** (compatibility): The forgotten good package has exactly the same λ-members and P_v.
- **TauCeti.AutomorphicGalois.polarizedExport_nonselfdual_rejected** (non-example): AHTW ss comparison plus an N bound does not fulfill a full-WD comparison field.

Sources: [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4), Theorem 2.1.1, pp.33–34; [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1), Theorem 1.1, pp.1–2.

### Unitary discrete-parameter export

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/unitary-discrete-parameter-export.

In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i attached to an endoscopic discrete parameter of ranks n_1+n_2=n, with each ε_i the algebraic character of |det|^{(n_i−n)/2}$(N_{F/K}det)^{ε(n−n_i)}, and ε(m)≡m mod 2. The polynomial at every v over q∈Spl_{F_0/Q} outside S∪{ℓ} is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-ℓ local comparison from Remark 5.5.6. This package need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove.

The construction uses Use the ET.6 stable/endoscopic transfer and the AG2.2 constituent representations.; Install ε_i with the parity correction so the indicated twist is L-algebraic.; Take the direct sum and match normalized Satake polynomials using local LLC compatibility away from ℓ.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.5, AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character, EndoscopicTransferAndUnitaryTraceComparison:ET.6, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems.

The API serves IgusaVarietiesAndTorsionConcentration:IG.5–IG.7: Provides the discrete automorphic Galois summands used in the generic principal-series argument.; TorsionCohomologyInfrastructure:TC.0: Supplies characteristic-zero summands, while torsion interpolation stays with IHG..

- **TauCeti.AutomorphicGalois.UnitaryDiscreteExport** (constructor): Build the labelled direct sum with explicit algebraic character twists.
- **TauCeti.AutomorphicGalois.unitaryDiscreteExport_constituent** (projection): Retrieve r_i, ε_i and its inclusion into the direct sum.
- **TauCeti.AutomorphicGalois.unitaryDiscreteExport_goodPolynomial** (compatibility): Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.

Acceptance tests:

- **TauCeti.AutomorphicGalois.unitaryDiscreteExport_two_characters** (computation): For n_1=n_2=1, at good v with twisted values β_1,β_2 the polynomial is (X−β_1)(X−β_2).
- **TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity** (characterisation): The direct-sum dimension is n_1+n_2, with neither twist changing dimension.
- **TauCeti.AutomorphicGalois.unitaryDiscreteExport_not_cuspidal_irreducibility** (non-example): A two-character endoscopic sum cannot certify global irreducibility.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Corollary 5.5.5 and Remark 5.5.6, printed pp.745–746.

### Lattice and residual polynomial export

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/lattice-residual-polynomial-export.

ResidualPolynomialExport(π,λ) contains a finite p-adic realization E, an explicitly chosen stable O_E-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good P_v and the comparison isomorphisms under another lattice or coefficient extension. It exports m_{π,λ} and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

The construction uses Choose finite E and stable lattice in that order.; Package the residue coefficient homomorphism and its characteristic-polynomial comparison.; Use lattice-independent semisimplification and kernel-independent m_{π,λ} for the comparison API.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/good-polynomial-reduction, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence.

The API serves PotentialAutomorphyInfrastructure:PA.0: Supplies residual automorphic data before lifting.; IntegralHeckeAndGaloisDeterminants:IHG.1–IHG.3: Supplies classical integral polynomial comparisons, not a family over a nonreduced Hecke algebra..

- **TauCeti.AutomorphicGalois.ResidualPolynomialExport** (constructor): Assemble finite realization, chosen lattice and reduction maps.
- **TauCeti.AutomorphicGalois.residualExport_compareLattice** (equivalence): Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- **TauCeti.AutomorphicGalois.residualExport_maxIdeal** (projection): Retrieve m_{π,λ} with Galois-type evidence.
- **TauCeti.AutomorphicGalois.residualExport_charpoly** (compatibility): The integral/residual Frobenius square commutes by Matrix.charpoly_map.

Acceptance tests:

- **TauCeti.AutomorphicGalois.residualExport_rank_one** (degenerate): Reduction of an integral character is its residual character.
- **TauCeti.AutomorphicGalois.residualExport_diagonal_mod3** (computation): The diagonal integral test reduces X²−3X+2 to X²+2 modulo 3.
- **TauCeti.AutomorphicGalois.residualExport_unipotent_lattices** (non-example): The two Z_5-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6, p.938; §7.1, p.1085.

### Rank-two residual comparison with R19

Anchor: AutomorphicGaloisRepresentationsPartII:AG2.7/rank-two-residual-comparison-with-r19.

For the regular classical/Hilbert exact overlap, fixed λ and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and R19 λ-members. In the classical normalization r̄_AG2≅r̄_R19^∨; the geometric good polynomial is X²−ā_qX+ψ̄(q)q^{k−1}. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. R19’s explicit geometry and lattice calculations remain supplier tools; only the semisimple isomorphism class, not a preferred lattice, is compared.

The argument uses Identify characteristic-zero members through the exact R19 normalization dictionary.; Choose lattices and use residual semisimple independence to compare reductions.; Compare normalized reduced Hecke eigencharacters and their kernels.

Direct inputs: AutomorphicGaloisRepresentationsPartII:AG2.6/rank-two-comparison-with-r19, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi, AutomorphicGaloisRepresentationsPartII:AG2.7/residual-hecke-ideal-independence.

Acceptance requires At k=2 the determinant is ψ̄ε̄⁻¹ in the AG2 geometric convention.; A claim that all integral lattices are identified fails the unipotent lattice test.

Sources: [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), Definition 2.3.6 and following duality statement, p.938.

## Mathematical boundaries of the imported interfaces

**PadicHodgeTheory:R06.5.** Projector-compatible filtered semistable comparison for the PEL/Kuga–Sato realizations, with D_st, N and cup products; the existing good-reduction node supplies only the smooth proper crystalline case.

**PadicHodgeTheory:R06.2.** Berger–Colmez bounded constant-Hodge-type family theorem in the CH Theorem 2.3 setting, at coefficient-prime places other than the weight-varying v_0; prove strict period comparison on that family. This is a family extension of the scalar period-functor API, not a claim that de Rham representations are closed under arbitrary limits.

**EndoscopicTransferAndUnitaryTraceComparison:ET.7.** S-general cyclic base-change and patching/descent from CH §3.1–3.2, including finite excluded cuspidality extensions, local Grunwald–Wang realization and coefficient-place splitting.

**AutomorphicGaloisRepresentationsPartII:AG2.3.** The CH bounded eigenvariety family and geometric dense locus, with one place v_0 allowed to vary and constant other local Hodge types; import LocallyAnalyticDistributions:L4 for its generic Fredholm ingredient only.

**CrystallineCohomology:CR.6.** Part II extension: Caraiani §§3–4 two-boundary log de Rham–Witt complex, residue realization of N (Proposition 4.4), and Theorem 4.6 bi-indexed stratum spectral sequence with its Tate twists. The existing ordinary Hyodo–Kato theory is a base, not this full generalized sequence.

**WeightsInEtaleCohomology:R34.6.** Purity and monodromy-weight inference for the projected Caraiani two-boundary spectral sequence, after the explicit diagonal concentration of projected closed-stratum cohomology; retain the concentration hypothesis.

**AutomorphicGaloisRepresentationsPartII:AG2.1a.** Actual projected PEL tensor-square/Kuga–Sato realization and the closed-stratum concentration used in Caraiani Proposition 5.1; supply the cohomological multiplicity and twist dictionary, not just a statement that an attached representation exists.

**AutomorphicGaloisRepresentationsPartII:AG2.5.** Exact Varma §8.2 Jordan-block dominance and generic maximal-orbit theorem, and Taylor–Yoshida Theorem 1.4(4) uniqueness of pure WD parameters from the semisimplified Weil representation. Existing integrated summary does not state these inputs with complete hypotheses.

**AutomorphicGaloisRepresentationsPartII:AG2.4.** AHTW §5 bounded-torsion Hecke local–global interface and non-Siegel boundary control used in Proposition 5.2.8/Theorem 5.2.9; this is additional scope beyond the original classical/determinant extraction.

**ArithmeticGaloisRepresentations:R01.1.** The compact-image Baire finite-p-adic-realization theorem for continuous maps from profinite G to GL_n(Q̄_ℓ), with countability of finite local extensions and closedness of GL_n(E), before the existing local-field lattice theorem.

**ArithmeticGaloisRepresentations:R01.5.** Arbitrary-rank continuous semisimple recognition over G_F from good characteristic polynomials (characteristic zero and finite residue fields), using Chebotarev and Brauer–Nesbitt; regular-Frobenius simultaneous descent obstruction splitting for CH Proposition 3.2.5. The existing rank-two recognition is used as a special case, not promoted without proof.

**IntegralHeckeAndGaloisDeterminants:IHG.3.** T^S with geometric rank-n Hecke polynomials, its integral eigencharacters, residue quotients, dual involution and algebraic-character twist; interpolate elsewhere over nonreduced rings, with this interface receiving only classical comparisons.

**AutomorphicFormsOnReductiveGroups:AF.4.** Clozel conjugation theorem in NT Theorem 5.1: σπ exists, is cuspidal regular algebraic and has finite components σπ^∞; number-field rationality.

**PadicHodgeTheory:R06.4.** Ordinary crystalline filtration when the ordered Newton slopes agree with the ordered Hodge numbers in the CG6.8 regular good-level GSp4 normalization: each successive Frobenius eigenline is weakly admissible and corresponds to the stated saturated Galois filtration. Retain both unit operator hypotheses used to establish the root valuations.

**AutomorphicGaloisRepresentationsPartII:AG2.2.** Algebraic twisting from polarized GL_n to the conjugate-self-dual construction; GSp4 realization and corrected similitude (known E27/E54/E55); CS5.5.5 endoscopic discrete constituents with each explicit ε_i twist.

**ModularityAndLanglandsExtensions:ML.4.** GSp4 transfer/LLC normalization, the CG (a,b) and Pilloni λ Harish–Chandra/Satake dictionary and the specialized monic versus det(1−Xφ) polynomial conversion.

**EndoscopicTransferAndUnitaryTraceComparison:ET.6.** CS5.5.5 Shin stable/endoscopic transfer with L-morphism ζ̃_{n1,n2} and the parity-corrected auxiliary Hecke character $, identifying the twisted direct-sum Satake polynomial.

The two-boundary log-crystalline sequence extends ordinary Hyodo–Kato theory. The A’Campo–Hevesi–Thorne–Whitmore proof also requires quantitative local Shimura cohomology and bounded p-adic Hodge pseudodeformation spaces with arbitrary residual multiplicities. The ordinary BunG/Newton theory and fixed-representation deformation spaces provide foundations, but their present targets do not state these full extensions. In particular, the residual genericity consumer in IG.5 cannot serve as an input to the unrestricted all-CM theorem which supplies it. The extensions retain the source’s precise Theorems 2.5.7 and 3.3.6.

The ACC+ author copy prints the last term of (2.2.6) without (−1)^n and omits or misindexes powers of X in the degree-2n polynomials (2.2.7), the adjacent specialized polynomial and Lemma 2.2.13(2). The formulas above retain the corrected degree and signs. Its projective-genericity sentence is used with the local unramifiedness qualification proved above. The GSp4 branches use the already recorded eigenform/specialized-polynomial corrections E54/E55 and Pilloni’s similitude correction E27.
