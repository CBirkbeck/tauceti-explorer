# Reusable infrastructure for torsion in arithmetic cohomology

This roadmap proves the transport results that join integral automorphic sections, perfectoid compactifications, completed compact-support cohomology and boundary Hecke actions. Its organizing source is [Scholze’s published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), Annals 182 (2015), 945–1066. The library is built on the actual objects supplied by the geometry, completed-cohomology, boundary and determinant roadmaps. A structure containing an unproved comparison field does not meet any target below.

The five stages are retained as required by accepted RS-24. There are two parts within TC.3: early algebra, whose prerequisites contain neither TC.2 nor automorphic Galois representations, and arithmetic realization, which uses both. Consumers such as AG2.4 import the early algebra and the existing IHG.4 interpolation. This order prevents the arithmetic use of AG2.3 from making the factor-extraction argument circular.

The build order is TC.0, the early TC.2 boundary-ideal colimit, TC.1, the remaining TC.2 comparisons, arithmetic TC.3 and TC.4. The six early TC.3 algebra targets can be built independently of TC.2 and AG2. Stage numbering does not override these prerequisite edges.

All five stages are **planned**. The packet is a complete planning pass, with precise supplier extensions; it is not proof-closed and no geometric declaration is claimed implemented. Scholze’s GLₙ theorem is recorded as an assembly application of the interfaces, not an additional universal theorem for arbitrary reductive groups.

## Coefficients, supports and arithmetic inputs

Write O for a finite extension of Z_p with uniformizer ϖ, and C for a complete algebraically closed extension of Q_p. The basic geometric comparison uses Z/p^m at a fixed positive m. An O/ϖ^m version requires the stated coefficient-extension comparison; its exponent is not silently identified with a p-power exponent. Almostification over O_C uses its maximal ideal 𝔪_C. Ordinary modules, almost modules and nilpotent Hecke quotients are distinct coefficient categories, connected only by their named maps.

| Object or operation | Required convention |
| --- | --- |
| Fixed-exponent completed compact support | colim over p-level of H_c^i(X_K,Z/p^m), using pullback |
| Integral completed compact support | inverse limit over m of those colimits, with its induced topology |
| Derived coefficient limit | CC’s derived object; retain its Milnor lim¹ term until its hypotheses are checked |
| Boundary integral sheaf | kernel of O⁺ on the image compactification mapping to O⁺ on the actual boundary |
| Cusp forms | sections with the actual boundary ideal, including at every integral reduction |
| Source characteristic convention | D(1−XFrob_geom), constant term one |
| Cyclotomic convention | ε(Frob_geom)=q_v⁻¹; arithmetic Frobenius is the inverse element |
| Class field theory | Tau Ceti's Artin maps are normalized by arithmetic Frobenius; the geometric convention used by the source is their composite with inversion |
| Standard GLₙ polynomial | IHG.3’s monic polynomial with coefficient q_v^{i(i−1)/2}U_i |
| Scholze GLₙ polynomial | the reciprocal standard polynomial evaluated at q_vX; this adds the twist ε⁻¹ |

At finite Hodge-type levels distinguish the genuine minimal compactification X\*\_K from the scheme-image compactification X̄\_K inside Siegel geometry. Their finite map is an isomorphism on the interior; no global isomorphism or normality of the image is assumed. The perfectoid charts belong to the image compactification. Constructible primitive comparison is applied to the genuine proper algebraic compactification, including its singular boundary, before transporting the support diagram.

The arithmetic realization has three explicit branches. The unconditional CM branch has an imaginary quadratic subfield in F and a set S pulled back from rational primes S_Q containing p and all F/Q ramification. It uses unitary **similitude** Shimura varieties and Shin’s cohomological base change through ET.7a. General CM fields require the matching Mok classification/transfer input; totally real fields require the matching Arthur input, both requested from ML.4 with their actual assumptions. The needed characteristic-zero constituents are regular, including non-Shin-regular and non-finite-slope cases supplied by AG2.3 and the polarized AG2.7 package. Ambient self-duality does not make an arbitrary extracted GLₙ factor self-dual. Theorem 1.0.3 is not a license to call every unitary case unconditional.

## Ownership and library baseline

| Owner | What is imported |
| --- | --- |
| AdicSpacesPartII F0/R2/R3 | general formal gluing, saturated coherent lattices, completed localization, traces; the extra adhesive-base Serre and generic-étale trace requirements are explicit requests |
| PerfectoidSpaces / PerfectoidQuotients | almost categories, almost acyclicity (analytic and étale), the étale-cohomology limit theorem for towers, almost purity and the corrected strong-closed quotient/plus-ring convention |
| PerfectoidShimuraVarieties S1–S3 | Hebbarkeitssatz, good triples, anticanonical charts and traces, actual image tower, period maps and bundles, and existence of finite-level fake Hasse models/sections |
| PadicHodgeTheory early primitive / local-rational | the proper constructible primitive comparison, including singular minimal compactifications and trace compatibility |
| CompletedCohomologyPartII | fixed-exponent carriers, coefficient limits, finite/projective complexes, descent, duality, Iwasawa grade and the CC.8 support-convention adapter |
| ArithmeticLocallySymmetricSpaces | arithmetic quotient/stack carriers and their components, boundary strata/complexes, support triangle, nilmanifold fibrations, Hecke/Satake actions, level traces, character twists and cup products, finite-cover Hochschild–Serre descent |
| Current IntegralHeckeAndGaloisDeterminants | polynomial laws, determinants, duals, coefficient-subring descent, reconstruction, ghost/error bounds, spherical normalization, finite-quotient interpolation and compact uniform gluing |
| AG2.3/AG2.7, ET.7a, ML.4 | only the exact characteristic-zero classical input under the branch hypotheses above |

There is no reviewed TC entry in data/library-coverage.json. The nearby ALS and automorphic-bundle audits are ownership leads, not a TC audit. The baseline was independently searched at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. Existing algebraic and sheaf declarations were read rather than inferred from a name search. In particular, Mathlib already has PolynomialLaw and Matrix.charpolyRev; generic determinant theory is planned upstream and is not rebuilt here. Scheme-module long exact sequences exist in Tau Ceti, but do not by themselves supply the formal/perfectoid support comparisons.

The read-only current Tau Ceti library at commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and the current TauCetiRoadmap tree were also inspected. The nine newer roadmaps and four Completed roadmaps were screened. AlgebraicVectorBundles supplies generic bundle operations; ProfiniteArithmetic uses the existing pro-p quotient rather than owning this arithmetic argument; LocalGaloisGroups supplies local Galois infrastructure. None is replanned. The current IHG roadmap is authoritative for the general determinant material; its requested homogeneity extension belongs in its Part II direction. OperatorTheory has no Suggested.lean to screen, so its README was used.

The declarations verified at the pins are:

- **mathlib:PolynomialLaw**, Mathlib/RingTheory/PolynomialLaw/Basic.lean: Native polynomial-law carrier natural on tensor base changes over every test algebra; homogeneity and multiplicativity are separate IHG interfaces.
- **mathlib:Polynomial.coeff_mul**, Mathlib/Algebra/Polynomial/Coeff.lean: Coefficient of a product is the antidiagonal sum, used in coefficient separation.
- **mathlib:Polynomial.compRingHom**, Mathlib/Algebra/Polynomial/Eval/Defs.lean: Polynomial composition as a ring homomorphism; no custom substitution carrier.
- **mathlib:Polynomial.eval₂RingHom**, Mathlib/Algebra/Polynomial/Eval/Defs.lean: Evaluation after a coefficient ring homomorphism.
- **mathlib:Polynomial.mul_comp**, Mathlib/Algebra/Polynomial/Eval/Defs.lean: Composition preserves multiplication.
- **mathlib:Polynomial.reverse**, Mathlib/Algebra/Polynomial/Reverse.lean: Native reversal, with leading/constant coefficients tracked separately.
- **mathlib:Matrix.charpolyRev**, Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean: The actual determinant det(1−XM), already the constant-one convention used here.
- **mathlib:Matrix.reverse_charpoly**, Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean: The native monic characteristic polynomial reverses to charpolyRev.
- **mathlib:Matrix.charpoly_map**, Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean: Characteristic polynomial commutes with coefficient ring maps.
- **tauceti:TauCeti.maximalProPQuotient.lift**, TauCeti/Topology/Algebra/Group/Profinite/MaximalProP.lean: Actual universal factorization of a continuous homomorphism to a compact totally disconnected pro-p group; source pro-p quotient is not replanned.
- **tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδ**, TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean: Existing scheme-module connecting map; this does not supply formal/perfectoid site carriers without their supplier comparisons.

## TC.0 — Integral sheaf and formal-model transport

TC.0 works locally on specified covers before gluing. It distinguishes the power-bounded lattice from any lattice with the same generic fibre. The scalar Hartogs results are imported from PSV with their normality/codimension and genus-one qualifications; the new target is their coordinatewise use for the chosen integral frames. Boundary traces retain their integral ideal and normalized error bound.

### Integral section model

**Target TC.0/section-model-transport** (construction). Given a reduced proper rigid X over an algebraically closed complete K, a line bundle L and a finite affinoid cover U_i=Spa(R_i,R_i°) with affinoid intersections, choose sections s_j^(i). Require s_i^(i) to frame L, all ratios s_j^(i)/s_i^(i) to be power bounded, U_ij to be the unit locus of s_j^(i)/s_i^(i), and overlap differences divided by a frame to have norm at most |ϖ|. Transport the general formal gluing construction to these actual rings: 𝔛 has charts Spf R_i°, its generic fibre is X, and 𝔏 has integral frame s_i^(i). The sections reduce to global s̄\_j modulo ϖ. The charts are D(s̄\_i); 𝔛 is projective and 𝔏 ample. The structure sheaf on each chart is the power-bounded ring, with ϖ-completed localization on intersections.

**Hypotheses.** 0≠ϖ∈𝔪\_K; integral rings are R_i° rather than arbitrary plus rings. On U_ik the overlap congruence is measured using s_i^(i); finite cover and reducedness are essential.

**Construction or proof.**

1. For J⊂J′ localize at the product of ratios indexed by J′\\J, then complete; invoke formal gluing and its generic-fibre comparison.
2. Glue frame transition units; the overlap congruences glue the reduced sections.
3. The distinguished affine cover by reduced sections gives ampleness; apply the supplier projectivity criterion over O_K.

**Needs.** AdicSpacesPartII:F0/formal-scheme-gluing; AdicSpacesPartII:R2.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal: Forms the actual integral boundary lattice. TorsionCohomologyInfrastructure:TC.1/reduction-atlas-transport: Identifies the finite-level reductions used in approximation.

| API | Required statement |
| --- | --- |
| chartSections (characterisation) | Γ(𝔘\_i,O)=R_i° and Γ(𝔘\_i,𝔏)=R_i°s_i^(i). |
| modelReduction (projection) | s̄\_j restricts to s_j^(i) modulo ϖ in every frame. |
| refinementTransport (functoriality) | A compatible refinement yields the same generic-fibre and reduction maps after common admissible refinement. |
| modelGlueUniversalProperty (universal-property) | For a fixed completed chart glue datum, maps from its formal model to a formal scheme Y are exactly compatible families of chart maps; descent is unique and preserves identities and composition. This asserts no uniqueness among unrelated formal models. |

**Definition checks.**

- **disc:** For X=P¹\_K with its two standard bounded charts and L=O(1), recover the projective integral model and coordinate sections.
- **identity-localization:** For J′=J the existing intersection restriction is identity. Ratios already inverted on that intersection are units, so multiplying the localization product by them leaves the localization unchanged; it cannot diagnose a printed error.
- **bad-overlap:** Changing one overlap section by an element of norm larger than |ϖ| can change its reduction, so no global reduced section is asserted.

**Acceptance.** On a strict refinement from a chart where a ratio is not already a unit, identify completed localization at the added ratio; for J′=J identify the identity map. Identify both ring restriction and line-bundle transition on triple overlaps.

**Source.** Scholze, Lemma 2.1.1, pp. 953–954. The lemma constructs the projective formal model and ample line from the frame, bounded-ratio, unit-locus and overlap-congruence requirements in its three numbered hypotheses. Completed localization is a proof input; no erroneous localization product is printed.

### Integral boundary ideal

**Target TC.0/integral-boundary-ideal** (construction). For a coherent ideal I⊂O_X on the preceding X, set J_i=I(U_i)∩R_i°. These are ϖ-saturated finitely generated R_i°-ideals, compatible with completed localizations, and glue to a coherent ideal 𝔍⊂O_𝔛 with generic fibre I. For the reduced arithmetic boundary use its actual ideal, rather than the extension by zero of O_X. On a chart the analytic integral ideal I⁺ and 𝔍 have identical sections.

**Hypotheses.** Use the saturated-module and coherence results for topologically finite type O_K-algebras, not noetherianity of O_K. For level pullback compare the extended ideal with the integral closure/saturation of its actual generic-fibre pullback; equality requires the supplied boundary compatibility.

**Construction or proof.**

1. Intersect the generic ideal with the bounded ring.
2. Apply finite generation of saturated submodules; compare localization and completion before gluing.
3. Identify the generic fibre and restriction maps by the inclusion into O_X.

**Needs.** TorsionCohomologyInfrastructure:TC.0/section-model-transport; AdicSpacesPartII:R2/saturated-submodule-finitely-generated; AdicSpacesPartII:R2/tfp-algebra-coherent.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.1/localized-cuspidal-sections: Provides the cusp ideal on formal charts. TorsionCohomologyInfrastructure:TC.2/boundary-ideal-colimit: Compares finite-level ideals with the perfectoid ideal.

| API | Required statement |
| --- | --- |
| idealSections (characterisation) | On 𝔘\_i, Γ(𝔍)=I(U_i)∩R_i°. |
| genericIdeal (compatibility) | Inverting ϖ recovers I with its inclusion into O_X. |
| reductionRestriction (functoriality) | 𝔍/ϖ^m restricts using the completed-localization map; compatible refinements preserve this map. |
| maximalBoundedIdeal (characterisation) | The ideal lattice on a chart is the largest R_i°-submodule of R_i contained in both I(U_i) and R_i°; these characterisations determine the glued ideal and its inclusion uniquely. |

**Definition checks.**

- **no-boundary:** I=O_X gives 𝔍=O_𝔛, not the zero ideal.
- **whole-boundary:** I=0 gives 𝔍=0 at every exponent.
- **saturation:** In R=K⟨T⟩, I=(T) gives J=(T) in O_K⟨T⟩; the unsaturated ideal (ϖT) has the same generic fibre but fails this definition.

**Acceptance.** Check saturation and completed restriction for every intersection. Do not identify ordinary reduction with almost reduction.

**Source.** Scholze, Lemma 2.1.2 and proof, pp. 954–955. The lemma and its proof identify the coherent integral ideal by intersection with each power-bounded ring, using saturation and coherence over the valuation base.

### Bounded lattice extension

**Target TC.0/bounded-lattice-extension** (theorem). On a good triple (X,Z,U) over K and 0≠t with |p|≤|t|<1, restriction H⁰(X,O⁺/t)^a→H⁰(X\\Z,O⁺/t)^a is an isomorphism, and restriction onward to H⁰(U,O⁺/t)^a is injective. Apply this coordinatewise to an explicitly trivialized finite free integral lattice. Ordinary bounded sections extend in the t=0 version. Changes of frame preserve the result when the transition matrices and their inverses are integral. No assertion is made for an arbitrary vector bundle or arbitrary divisor complement.

**Hypotheses.** Good triples, their normality/codimension conditions and their tilting independence are imported from PSV S1. In the finite-cover stability theorem the trace dual is self-dual; projectivity is not inferred. For genus one use the restricted hypotheses in PSV good-triple-stability.

**Construction or proof.**

1. Import the scalar good-triple restriction theorem.
2. Apply it to each finite coordinate and compare integral frame changes.
3. Use common good refinements for the arithmetic chart intersections.

**Needs.** PerfectoidShimuraVarieties:S1/good-triple; PerfectoidShimuraVarieties:S1/good-triple-stability.

**Acceptance.** Finite free rank zero gives zero sections. An ordinary almost-zero module must not be declared zero.

**Source.** Scholze, Definition 2.3.8 and following extension assertion, pp. 966–967; Lemmas 2.3.9–2.3.11 and Corollary 2.3.12, pp. 967–970. The cited good-triple extension results give the scalar assertion; finite free frames give the bounded vector-lattice transport coordinatewise. No arbitrary coherent-vector-bundle extension is claimed.

### Almost boundary support comparison

**Target TC.0/boundary-support-comparison** (theorem). Let X̄\_∞ be the actual image compactification of the Hodge-type perfectoid tower, Z_∞ its strongly Zariski closed reduced boundary and j:X_∞↪X̄\_∞ its open complement. Define I⁺\_∞=ker(O⁺\_X̄∞→i_\*O⁺\_Z∞). For m≥1 the boundary sequence gives an almost short exact sequence 0→I⁺\_∞/p^m→O⁺\_X̄∞/p^m→i_\*O⁺\_Z∞/p^m→0. The canonical support morphism identifies (j!O⁺\_X∞/p^m)^a with (I⁺\_∞/p^m)^a on the étale site and its topological comparison site. The maps are natural in m and for the actual boundary-preserving level correspondences.

**Hypotheses.** Almostification is relative to 𝔪\_C. The corrected strong-closed definition includes the integral closure of the image plus ring. Image and genuine minimal compactifications are related by the supplied finite map, an isomorphism on the interior, without global isomorphism or normality of the image.

**Construction or proof.**

1. Use the corrected strongly closed ideal sequence on each perfectoid chart.
2. Check the support map on interior and boundary stalks; pass between sites by almost acyclicity.
3. Glue using the actual boundary and finite-map identifications.

**Needs.** PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower; PerfectoidShimuraVarieties:S2/genuine-to-image-comparison; PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity; PerfectoidQuotients:Q4/completed-integral-closed-quotient; PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed.

**Acceptance.** For Z=∅ obtain O⁺/p^m; for Z=X obtain zero. Keep the almost symbol on every support comparison.

**Source.** Scholze, Theorem 4.2.1 proof, pp. 1021–1023; Lemma 2.2.9, pp. 957–958. The proof identifies the almost boundary kernel with the support sheaf using the strongly closed boundary; the later corrected quotient notion is imported explicitly.

### Boundary trace transport

**Target TC.0/boundary-trace-transport** (theorem). For normal integral finite-level chart rings R⊂S in a finite generically étale cover, with f a nonzerodivisor and S\[f⁻¹] finite étale over R\[f⁻¹], the algebra trace sends S to R. If J is the integral closure in S of an integrally closed ideal I⊂R, it sends J into I. Apply this to the actual boundary ideals in the anticanonical tower, then use its normalized Tate traces: the errors are bounded by C_r=(g²+g+1)ε∑\_{r′≥r}p^(−r′), tending to zero. Trace diagrams modulo p^m are interpreted in the almost category; an integral normalization by p-powers is accompanied by its stated bound.

**Hypotheses.** Normality, generic separability and the boundary ideal being the integral closure of I are hypotheses. The general trace-integrality/ideal theorem is an extension request to R3, not the finite locally free trace pairing alone.

**Construction or proof.**

1. Invoke trace integrality for the normal generic étale cover and the integrally closed ideal.
2. Match the actual tower trace with the algebra trace on the interior, then extend bounded sections.
3. Apply the PSV normalized trace estimate and retain the almost reduction square.

**Needs.** AdicSpacesPartII:R3; PerfectoidShimuraVarieties:S1/tate-normalized-traces; TorsionCohomologyInfrastructure:TC.0/bounded-lattice-extension; TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal.

**Acceptance.** A trace from a degree-p cover is not divided by p without the estimate. Verify the boundary-preserving hypothesis rather than extending an arbitrary finite cover.

**Source.** Scholze, Lemma 4.3.2, pp. 1025–1026; Corollary 3.2.23, pp. 994–995. Lemma 4.3.2 preserves integrally closed boundary ideals under trace; Corollary 3.2.23 supplies the displayed shrinking normalized-trace error.

## Early TC.2 input — Boundary ideal colimit

This ordinary ideal-colimit comparison is constructed after TC.0 and before TC.1 classical approximation. Its stable stage and target IDs remain TC.2. The later almost Čech comparison is a separate result.

### Boundary ideal colimit

**Target TC.2/boundary-ideal-colimit** (theorem). On each standard perfectoid chart and every m≥1, the ordinary module I⁺\_∞/p^m is the filtered colimit of the integral boundary ideals modulo p^m at finite image levels, and also of those at genuine minimal levels, with the actual chart restriction maps. This is an ordinary isomorphism. Its proof uses ordinary injectivity on the open interior and approximation plus normalized traces for surjectivity; the trace reduction diagrams used inside the argument remain almost diagrams.

**Hypotheses.** Use the supplied anticanonical good charts, their finite étale interior transitions and actual boundary ideals. Completion of the ambient plus-ring colimit does not by itself identify its ideal modulo p^m.

**Construction or proof.**

1. Prove injectivity at image levels from the colimit description R⁺/p^m=colim R⁺\_(K_p)/p^m of the supplied tower and ϖ-saturation of the ideals (I⁺∩p^mR⁺=p^mI⁺); at genuine levels construct the unique map to I⁺ compatible with evaluation off the boundary and deduce injectivity by valuations.
2. Approximate a bounded ideal section by finite-level sections; control its boundary values.
3. Apply boundary-preserving normalized traces with C_r→0 and two successive precision/divisibility corrections, obtaining an ordinary representative modulo p^m.

**Needs.** TorsionCohomologyInfrastructure:TC.0/boundary-trace-transport; TorsionCohomologyInfrastructure:TC.0/boundary-support-comparison; PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower; PerfectoidShimuraVarieties:S2/genuine-to-image-comparison.

**Acceptance.** For the whole boundary both colimits are zero. Do not infer ordinary surjectivity merely from an almost-surjective ambient ring map.

**Source.** Scholze, Lemma 4.3.3 and proof, pp. 1026–1028. The lemma proves an ordinary, not merely almost, ideal-colimit isomorphism; normalized traces and the two divisibility corrections are retained in the proof sketch.

## TC.1 — Period-map bundles and approximating sections

The period isomorphism first identifies rational bundles, with the Tate twist visible. Integral bounds, reduction transport and independence of approximating choices are subsequent results. Existence of the finite-level fake Hasse sections is PSV’s target. Localization and integral Serre lifting convert finitely many bounded sections into classical cusp sections without asserting that torsion cohomology itself lifts.

### Period lattice transport

**Target TC.1/period-lattice-transport** (construction). On the Siegel perfectoid tower of genus g, let W be the tautological rank-g flag bundle and ω\_Fl=det(W∨). Transport the rational period comparison Lie A⊗O(1)≅π\_HT\*W to the Hodge line: π\_HT\*ω\_Fl≅ω\_A(−g). After choosing a compatible Tate trivialization this identifies the underlying line bundles; its action is transported with the similitude character. On each Lagrangian coordinate chart choose its Plücker frame and compare the finite-level automorphic lattice with the bounded lattice in that frame. Record both inclusions after multiplication by specified p-powers on the quasicompact chart. Hodge-type pullbacks use the actual Hodge Levi torsor comparison and retain the weight-dependent Tate twist. This construction is a transport of supplied bundles, not a second period map.

**Hypotheses.** Use only the 2^g coordinate Lagrangians selecting one of i,g+i, not arbitrary g-element coordinate subsets. The rational comparison alone gives no equality of integral lattices. Away-from-p correspondences preserve the transported data; the p-action also moves the flag chart and carries its character.

**Construction or proof.**

1. Import the tautological and Hodge-Levi pullbacks with their Tate twists.
2. Use finite local frames and quasicompactness to bound the lattice denominators in both directions.
3. Transport lattice restrictions and tame correspondences through the supplied equivariant isomorphism.

**Needs.** PerfectoidShimuraVarieties:S3/siegel-tautological-pullback; PerfectoidShimuraVarieties:S3/hodge-levi-pullback; TorsionCohomologyInfrastructure:TC.0/bounded-lattice-extension.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.1/reduction-atlas-transport: Supplies the Plücker frame and bounded reduction. TorsionCohomologyInfrastructure:TC.2/cech-comparison: Makes integral section comparisons compatible with tame Hecke actions.

| API | Required statement |
| --- | --- |
| periodLine (equivalence) | The transported line is π\_HT\*ω\_Fl≅ω\_A(−g), with the chosen Tate trivialization labelled. |
| latticeBounds (data) | For each chosen quasicompact chart supply integers a,b with p^a L_bounded⊂L_finite⊂p^(−b)L_bounded. |
| tameTransport (compatibility) | Integral restrictions and tame correspondence maps commute with the transported rational comparison and recorded denominators. |
| periodFrameChange (functoriality) | Changing a Plücker frame by a specified rational unit transports the lattice inclusions using its norm bounds; an integral unit gives equal transported lattices. Identity and successive frame changes agree with direct transport. |

**Definition checks.**

- **genus-one:** For g=1 the line comparison has twist −1; forgetting it changes the cyclotomic action.
- **nonlagrangian-coordinate:** For g=2 the coordinate plane span(e₁,e₃) is not isotropic, but its Plücker chart Fl_{13} is nonempty: span((1,0,0,1),(0,1,1,0)) is isotropic and has p₁₃=p₁₂=1. This nonadmissible chart is excluded from the 2^g orbit charts; it is not an empty chart.
- **rescaled-lattice:** Replacing a local lattice by p times itself changes the bound; an API asserting equality of all lattices fails.

**Acceptance.** Record the twist before choosing its trivialization. Test a p-level change on both the flag chart and the lattice, rather than asserting p-Hecke invariance.

**Source.** Scholze, Theorem 3.3.18 and its proof, pp. 1012–1016; Theorem 4.1.1, pp. 1017–1020. The tautological-bundle comparison, its determinant and the chosen Tate trivialization supply the rational line comparison; integral lattice bounds require the separate bounded-chart transport.

### Approximation atlas transport

**Target TC.1/reduction-atlas-transport** (construction). For each m≥1 import PSV S3’s finite-level formal model and approximating Plücker sections modulo p^m on the Lagrangian coordinate cover. Use TC.0 to identify its reductions with the bounded period-line and boundary-ideal reductions. Two sufficiently accurate section choices agree modulo p^m after passage to a common finer p-level and common formal refinement, hence induce the same maps on localized cusp sections. Construct the transport for each tame Hecke correspondence using common source levels; this is independence of the approximation maps, not uniqueness of the formal model before refinement.

**Hypotheses.** The finite level depends on m and the finite set of charts/sections. Only the integral bounds actually supplied by the approximation are used; no unspecified all-ε estimate is assumed.

**Construction or proof.**

1. Take the supplied finite-level approximations with precision exceeding m plus the recorded lattice losses.
2. Identify the formal charts by completed localization and compare their boundary lattices.
3. Compare two choices on a common refinement; their section differences vanish modulo p^m and the localization diagrams commute.

**Needs.** PerfectoidShimuraVarieties:S3/hodge-tate-formal-models; TorsionCohomologyInfrastructure:TC.0/section-model-transport; TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal; TorsionCohomologyInfrastructure:TC.1/period-lattice-transport.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.1/localized-cuspidal-sections: Provides compatible distinguished formal opens. TorsionCohomologyInfrastructure:TC.1/classical-section-approximation: Transports finite-level cusp sections to the perfectoid Čech terms.

| API | Required statement |
| --- | --- |
| reducedChartMap (projection) | The transported chart map identifies the chosen formal lattice modulo p^m with its bounded chart reduction. |
| commonRefinement (compatibility) | Two approximation choices yield equal localization maps after a common sufficiently fine level/refinement. |
| heckeReductionSquare (functoriality) | For each tame correspondence the pullback and boundary-preserving trace squares commute at fixed m. |
| refinementComposition (functoriality) | The fixed-exponent reduction and cusp-localization maps commute with the supplied refinement maps; the identity refinement acts identically, and successive refinements agree with their composite. |

**Definition checks.**

- **fixed-precision:** Adding p^m times an integral section leaves the reduction unchanged.
- **precision-loss:** At m≥1 the integral sections 0 and p^(m−1) in a unit frame agree modulo p^(m−1) and differ modulo p^m. Approximation at one fewer digit does not determine the fixed-m reduction map.
- **unit-rescaling:** Rescaling a frame by an integral unit changes coordinates by that unit; the identified section is unchanged after transport, not by treating the coordinates as equal.

**Acceptance.** Existence of fake Hasse approximations is imported from PSV, not replanned. Check choice independence for maps after refinement rather than formal schemes at the original level.

**Source.** Scholze, Theorem 4.3.1 proof, pp. 1029–1031. The proof approximates Plücker sections at fixed precision and constructs formal charts; comparing the induced reduction maps uses a common level and formal refinement, rather than asserting uniqueness of models.

### Localized cuspidal sections

**Target TC.1/localized-cuspidal-sections** (theorem). For a nonempty intersection of distinguished opens indexed by J, put s̄\_J=∏\_{j∈J}s̄\_j and r=|J|. On the fixed formal model with ample 𝔏 and boundary ideal 𝔍, the restriction map identifies Γ(D(s̄\_J),𝔍/p^m) with colim_k Γ(𝔛,𝔍⊗𝔏^(kr)/p^m), transitions multiplication by s̄\_J. The same holds after imposing any positive divisibility condition on k by passing to a cofinal subsequence. The identification carries the actual boundary condition and agrees with bounded chart localization.

**Hypotheses.** The notation on the right means reduction of 𝔍⊗𝔏^(kr). Use the supplier coherent formal localization theorem over the adhesive valuation base.

**Construction or proof.**

1. Apply the ample distinguished-open localization theorem to the coherent boundary lattice.
2. Identify its chart sections by TC.0 and TC.1 transport.
3. Restrict to cofinal k satisfying the desired weight-step congruence.

**Needs.** TorsionCohomologyInfrastructure:TC.1/reduction-atlas-transport; AdicSpacesPartII:R2.

**Acceptance.** The transition multiplies by the product s̄\_J, so the twist increases by |J|. Do not drop 𝔍 and thereby replace cusp sections with all sections.

**Source.** Scholze, Theorem 4.3.1 proof, pp. 1030–1031. The proof writes sections on a distinguished intersection as the colimit of global twists by powers of its product section; a cofinal weight subsequence gives the same localization.

### Integral cuspidal lifting

**Target TC.1/formal-cuspidal-lifting** (theorem). For the projective formal model over O_C, its coherent boundary lattice 𝔍 and ample 𝔏, all sufficiently large t satisfy H¹(𝔛,𝔍⊗𝔏^t)=0. Consequently reduction Γ(𝔛,𝔍⊗𝔏^t)→Γ(𝔛,(𝔍⊗𝔏^t)/p^m) is surjective. Compare these integral sections with classical cuspidal sections on the genuine minimal compactification through the finite genuine-to-image map. This comparison must be proved on the actual ideals, without an assumed global isomorphism of compactifications.

**Hypotheses.** 𝔍 is p-torsion free and coherent by saturation. O_C is not noetherian; the supplier must furnish the adhesive proper formal Serre theorem and the genuine-to-image cusp-section comparison.

**Construction or proof.**

1. For the coherent p-torsion-free lattice F_t=𝔍⊗𝔏^t on the projective formal model, obtain H¹ vanishing for all large t: either Scholze's route, H¹ of the reduction F_t/p for large t (Serre vanishing for the ample reduction), which gives H¹(F_t/p^j)=0 for every j by the filtration with graded pieces F_t/p, or proper formal Serre vanishing for F_t itself.
2. Deduce surjectivity of Γ(𝔛,F_t)→Γ(𝔛,F_t/p^m): from integral H¹ vanishing directly, or from H¹(F_t/p^j)=0 for all j together with Γ(𝔛,F_t)=lim_j Γ(𝔛,F_t/p^j) and Mittag-Leffler.
3. Identify their generic fibres and compare cusp sections through the finite minimal-compactification map.

**Needs.** TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal; TorsionCohomologyInfrastructure:TC.1/localized-cuspidal-sections; AdicSpacesPartII:R2; PerfectoidShimuraVarieties:S2/genuine-to-image-comparison.

**Acceptance.** H¹ vanishing of one reduction F_t/p^m alone does not give integral lifting; the deduction needs vanishing for all F_t/p^j (which follows from F_t/p for a p-torsion-free lattice) together with completeness and Mittag-Leffler, or integral H¹ vanishing. Keep the finite-map cusp-section comparison as an explicit supplier obligation.

**Source.** Scholze, Theorem 4.3.1 proof, pp. 1030–1031. The proof builds the projective formal model with its ample line and boundary lattice, uses ampleness to make H¹ of the twisted boundary lattice modulo p^n vanish for k sufficiently divisible, and concludes that the mod p^n sections are the reductions of the integral ones, whose generic fibre is the space of classical cusp forms.

### Classical section approximation

**Target TC.1/classical-section-approximation** (theorem). At each fixed m and for a finite list of bounded cuspidal sections on chart intersections, there is a common finer finite p-level and sufficiently large twists of the ample automorphic line in any prescribed cofinal positive weight step such that the sections are represented, modulo p^m after the recorded integral losses, by localized reductions of integral classical cusp forms. The representations are compatible with the chosen finite set of tame pullback/trace correspondences. When the classical determinant step is used, choose the weight step a>n in the symplectic case and a≥n in the unitary case.

**Hypotheses.** Use only a finite list at a time, and choose precision to absorb denominators and almost annihilators when passing to almost Čech cohomology. No uniform single weight or finite p-level for every cohomology class is asserted.

**Construction or proof.**

1. Descend bounded sections and boundary ideals using the ordinary ideal-colimit theorem of TC.2.
2. Apply localization on the transported approximation atlas and move to a cofinal weight-step sequence.
3. Use integral cuspidal lifting; repeat at common levels for the finite set of correspondences.

**Needs.** TorsionCohomologyInfrastructure:TC.1/localized-cuspidal-sections; TorsionCohomologyInfrastructure:TC.1/formal-cuspidal-lifting; TorsionCohomologyInfrastructure:TC.2/boundary-ideal-colimit.

**Acceptance.** Track m, level, twist and boundary ideal in each representative. This is an approximation of sections, not a lifting of torsion cohomology classes to characteristic zero.

**Source.** Scholze, Theorem 4.3.1 proof, pp. 1027–1031; Corollary 5.1.11, p. 1038. The proof first descends finitely many bounded ideal sections modulo the fixed coefficient exponent and then lifts their large twists to genuine finite-level classical cusp sections.

## TC.2 — Coherent, completed and torsion cohomology

The ordinary ideal-colimit theorem is proved before using the approximation atlas. The almost support comparison then joins CC’s fixed-exponent carrier to the perfectoid Čech complex. Geometric dimension supplies the amplitude and Iwasawa consequences. Continuity of the classical Hecke topology is pointwise on finite sets. Descent and coefficient limits use CC’s existing objects with their actual derived-limit conditions.

### Perfectoid compact support comparison

**Target TC.2/cech-comparison** (theorem). For the Hodge-type tower with tame K^p inside a prime-to-p level-N subgroup, N≥3, C complete algebraically closed over Q_p and m≥1, there is a natural almost isomorphism (colim_Kp H_c^i(X_KpKp,Z/p^m))⊗(O_C/p^m)^a ≅ H^i_top(X̄\_∞,(I⁺\_∞/p^m)^a). It is realized on the finite Lagrangian rational chart cover by the alternating Čech complex of the actual ideal sections, since all intersections are affinoid perfectoid and almost acyclic. It is compatible with coefficient reductions, p-level pullback and tame Hecke pullback/trace on common refinements.

**Hypotheses.** X̄\_∞ is the image compactification, and finite-level X\*\_K is the genuine proper minimal compactification when applying constructible primitive comparison. The primitive input must apply to singular proper algebraic compactifications and j!Z/p^m, not only proper smooth spaces. The left object is CC.8’s fixed-exponent carrier; TC.2 owns this theorem and its geometric vanishing corollaries.

**Construction or proof.**

1. Apply the constructible primitive comparison at each genuine proper finite level; the finite genuine-to-image map is an isomorphism on the interior, so j_! cohomology is the same on both compactifications.
2. Pass to the filtered p-level system by the étale-cohomology limit theorem for X̄\_∞ ~ lim of the finite levels, and identify j!O⁺ with the almost boundary ideal through TC.0.
3. Compare étale and analytic cohomology of the almost sheaves by étale almost acyclicity on affinoid perfectoid charts; apply almost purity on the interior to compare traces, and almost Čech acyclicity on all intersections to identify the topological complex.

**Needs.** CompletedCohomologyPartII:CC.8/scholze-4-2-convention-and-the-perfectoid-comparison; PadicHodgeTheory:P8:local-rational/constructible-primitive-comparison; TorsionCohomologyInfrastructure:TC.0/boundary-support-comparison; PerfectoidSpaces:P3/almost-purity-theorem; PerfectoidSpaces:P2/integral-almost-acyclicity; PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower; PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison; PerfectoidSpaces:P3/etale-almost-acyclicity.

**Acceptance.** Record each cohomology degree, support and coefficient exponent. Compare the complete tame correspondence square, including trace, not just the pullback.

**Source.** Scholze, Theorem 4.2.1, pp. 1021–1023. Theorem 4.2.1 and its proof compare compact-support completed cohomology with almost integral boundary-ideal cohomology: primitive comparison at finite level, passage to the limit by Corollary 7.18 of Perfectoid spaces, agreement of analytic and étale cohomology (Propositions 6.14 and 7.13 there), the strongly closed boundary sequence, and almost purity for the trace.

### Geometric completed amplitude

**Target TC.2/geometric-amplitude** (theorem). If d=dim_C X_K, the fixed-exponent compactly supported completed cohomology colim_Kp H_c^i(X_K,Z/p^m) vanishes for i>d, for every m≥1. Its integral coefficient inverse limit also vanishes there. For m=1 use that the perfectoid image compactification has spectral cohomological dimension ≤d: its underlying space is the inverse limit of the finite-level spaces along spectral maps, each finite level has cohomological dimension ≤d (Huber Proposition 2.5.8, or the limit of all its formal models, each of dimension ≤d), and the bound passes to the limit. Then use faithfulness of tensoring F_p-vector spaces with (O_C/p)^a. Extend to m by Bockstein induction.

**Hypotheses.** Almost-zero O_C-modules do not vanish ordinarily in general; the faithful test here is specifically for F_p-vector spaces. Integral vanishing is for the ordinary inverse limit of the supplied fixed-exponent groups; derived limits retain their own conditions.

**Construction or proof.**

1. Bound the cohomological dimension of each finite-level minimal compactification by d, and pass to the cofiltered spectral limit: every abelian sheaf is a filtered colimit of constructible sheaves pulled back from a finite stage.
2. Apply TC.2 comparison and the faithful F_p coefficient test.
3. Use Bockstein exact sequences for every exponent, then the defined integral inverse limit.

**Needs.** TorsionCohomologyInfrastructure:TC.2/cech-comparison; CompletedCohomologyPartII:CC.2/coefficient-bockstein-comparison; PerfectoidShimuraVarieties:S2/hodge-image-compactified-tower; PerfectoidSpaces:P0; AdicSpacesPartII:R2.

**Acceptance.** Test all m, not only m=1. No vanishing in degrees ≤d is inferred.

**Source.** Scholze, Corollary 4.2.2 and proof, pp. 1023–1024. Corollary 4.2.2 and its proof give vanishing above the complex dimension; the extension to all finite exponents uses the coefficient exact sequences, while integral passage retains inverse-limit issues.

### Geometric Iwasawa bounds

**Target TC.2/iwasawa-consequences** (theorem). At a torsion-free pro-p level K_p with Λ=Z_p\[\[K_p]], completed Borel–Moore homology vanishes in degree i>d, its degree-d module is p-torsion free, and for i<d the codimension of completed ordinary homology over Λ is at least d−i. These conclusions specialize CC’s completed duality and grade machinery to the geometric amplitude above. The argument uses the minimum codimension of a violating module and the range l₀=0,q₀=d.

**Hypotheses.** Use the actual finite projective completed complex and pro-p duality hypotheses from CC.4/CC.7. Λ grade/codimension is the supplier convention for the possibly noncommutative Iwasawa algebra.

**Construction or proof.**

1. Transport compact-support vanishing through completed Poincaré duality.
2. Use the Bockstein argument for top-degree p-torsion freedom.
3. Apply the CC grade spectral sequence with the corrected minimum-codimension argument.

**Needs.** TorsionCohomologyInfrastructure:TC.2/geometric-amplitude; CompletedCohomologyPartII:CC.7/completed-iwasawa-poincare-duality; CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem; CompletedCohomologyPartII:CC.4.

**Acceptance.** Retain separate ordinary and Borel–Moore support conventions. An inequality for i<d is not a freeness claim.

**Source.** Scholze, Corollary 4.2.3, p. 1024. Corollary 4.2.3 gives the Borel–Moore vanishing, middle-degree torsion-freeness and codimension inequality, with the corrected minimum and equal-rank range labels.

### Classical Hecke topology

**Target TC.2/classical-hecke-topology** (definition). Let T be the abstract tame Hecke algebra Z_p\[G(A_f^p)//K^p], with K^p of measure one. For a positive weight step a, give T the weakest topology for which every action map T→End_C(H⁰(X\*\_K,ω^(ak)⊗I)) is continuous, over all sufficiently small p-levels K_p (K=K_pK^p) and all k≥1; here H⁰(X\*\_K,ω^(ak)⊗I) is the finite-dimensional C-vector space of classical cusp forms on the genuine minimal compactification and End_C carries its p-adic topology. Denote this topological algebra T_cl. Let T_(K,k) be the image of T in that endomorphism ring. Because pullback and the integral trace preserve the integral cusp sections, T_(K,k) is a finitely generated torsion-free Z_p-module, and its subspace topology is its p-adic topology. Hence finite intersections of the ideals ker(T→T_(K,k)/p^r) form a basis of open ideals. T_cl can be nonseparated; passing to its separated completion is a separate operation. The weight step used for determinant interpolation satisfies a>n for Sp and a≥n for U.

**Hypotheses.** Fix the tame level and the same abstract Hecke generators as in TC.3; the classical spaces are taken for every weight ak with k≥1, not only for large k. The defining spaces are the rational cusp-form spaces with their p-adic topology. An integral lattice is a way of describing the neighbourhoods, valid only for a Hecke-stable lattice; it is not an extra datum of the definition.

**Construction or proof.**

1. Use the classical Hecke action on each finite-dimensional cusp space and form the initial topology, keeping its possible closure of zero.
2. Pullback and the integral boundary-ideal trace of Lemma 4.3.2 preserve the integral cusp sections, so each T_(K,k) preserves a bounded lattice and is a finitely generated Z_p-module; a lattice in a finite-dimensional Q_p-subspace of the Banach space End_C carries the p-adic topology.
3. Describe the basic neighbourhoods as finite intersections of ker(T→T_(K,k)/p^r), equivalently of the kernels of T→End(Λ/p^rΛ) for Hecke-stable lattices Λ.

**Needs.** TorsionCohomologyInfrastructure:TC.1/formal-cuspidal-lifting; TorsionCohomologyInfrastructure:TC.0/boundary-trace-transport; IntegralHeckeAndGaloisDeterminants:IHG.4/uniform-congruence-witness.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.2/hecke-continuity: Provides the topology whose finite-set continuity is proved. TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant: Provides discrete quotients for the imported interpolation theorem.

| API | Required statement |
| --- | --- |
| basicNeighborhood (characterisation) | Finite intersections of the ideals ker(T→T_(K,k)/p^r), over finitely many (K_p,k) and r≥1, form a basis of open ideals of T_cl. |
| latticeNeighborhood (characterisation) | For any Hecke-stable bounded O_C-lattice Λ in a classical cusp space, the kernels of T→End(Λ/p^rΛ) define the same neighbourhood filter as that space's p-adic topology; the integral cusp sections of TC.1 are such a lattice. |
| classicalActionContinuous (compatibility) | Every specified classical action T→End_C(H⁰(X\*\_K,ω^(ak)⊗I)) is continuous for this initial topology. |
| stepRefinement (functoriality) | A cofinal restriction of weights used in localized approximation transports its neighborhoods only via the proved approximation maps, not by arbitrary equality of topologies. |
| initialTopologyCriterion (universal-property) | For a topological ring B and a ring homomorphism f:B→T_cl, f is continuous exactly when every specified classical action composed with f is continuous. This criterion is preserved by identity and composition of ring maps. |

**Definition checks.**

- **two-actions:** For actions Z→Z/2 and Z→Z/3 the intersection kernel is 6Z, not their union.
- **nonseparated:** If every classical action annihilates an element t, t lies in every neighborhood; T_cl is not forced Hausdorff.
- **bad-step:** In the symplectic rank-n application the choice a=n cannot supply the required discrete-series family; it is excluded.
- **p-adic-not-discrete:** If T acts on a one-dimensional cusp space through a character λ:T→Z_p with λ(t)=p, then t^r→0 in T_cl although no power of t lies in the kernel of the action. With the discrete topology on End_C that kernel would be open and t^r would not tend to zero.

**Acceptance.** Any use of the completion explicitly factors through closure of zero. The chosen step satisfies the discrete-series range. The topology is not the discrete topology on the image of T: on a one-dimensional cusp space where t acts by p, every power t^r is nonzero but tends to zero in T_cl.

**Source.** Scholze, Theorem 4.3.1 and footnote 18, p. 1025; Corollaries 5.1.7 and 5.1.11, pp. 1036 and 1038. Theorem 4.3.1 defines T_cl,m as T with the weakest topology making its maps to End_C of the classical cusp spaces of weight mk continuous, the targets carrying the p-adic topology, and notes in its footnote that T_cl may not be separated. Corollary 5.1.7 shows the image of T there is flat over Z_p with finite étale generic fibre, and the proof of Corollary 5.1.11 uses that every open ideal of T_cl contains a finite intersection of the ideals ker(T_cl→T_K,k), together with the weight progression, which needs the discrete-series range of Proposition 5.1.1.

### Classical Hecke continuity

**Target TC.2/hecke-continuity** (theorem). The action of T_cl on colim_Kp H_c^i(X_K,Z/p^m), viewed as a discrete module, is continuous in the pointwise topology: the annihilator of any finite set of classes contains a basic classical zero-neighborhood. This statement holds at every m and is compatible with tame correspondences. Prove it through the almost Čech comparison, using finite section approximation at sufficient precision and the faithful finite-coefficient test; it does not say every torsion class comes from one classical cohomology class.

**Hypotheses.** Use only the prescribed Hodge-type compactification and the weight step of T_cl. When almost representatives are used, choose extra precision to absorb their annihilators.

**Construction or proof.**

1. Represent finitely many classes in the almost Čech complex.
2. Apply classical section approximation to finitely many terms and relations at sufficiently high precision.
3. A finite classical annihilator then kills the chosen classes; convert the almost assertion using finite coefficients and Bockstein.

**Needs.** TorsionCohomologyInfrastructure:TC.1/classical-section-approximation; TorsionCohomologyInfrastructure:TC.2/cech-comparison; TorsionCohomologyInfrastructure:TC.2/classical-hecke-topology.

**Acceptance.** Quantify the annihilator for each finite set and m. No assertion of one uniform classical weight for the entire completed module.

**Source.** Scholze, Theorem 4.3.1, p. 1025; proof pp. 1027–1031. The proof uses fixed-exponent chart approximation to show each finite set of cohomology classes is annihilated by a classical zero-neighborhood. It does not lift each torsion class to characteristic zero.

### Descent and coefficient limits

**Target TC.2/descent-and-coefficient-limits** (comparison). Use CC’s Hochschild–Serre comparison on the actual pro-p tower to descend fixed-exponent compact support cohomology to finite level. The E₂ rows have tower cohomological degree 0≤j≤d, so each finite-level target has a filtration of length at most d+1. Define the finite-level action on this supplied complex before invoking IHG ghost/filtered-action nilpotence. Coefficient inverse limits are taken after p-level colimits. Compare derived and ordinary coefficient limits only with the supplied Milnor exact sequence and verified Mittag–Leffler/lim¹ hypotheses; reduction of integral completed cohomology is not automatically the fixed-exponent object.

**Hypotheses.** The compact support descent uses the supplied finite-level support complex and continuous cochains, not an ordinary group cohomology replacement without comparison. Uniform filtration length counts nonzero tower rows, not all group-cohomology degrees.

**Construction or proof.**

1. Apply fixed-exponent descent and geometric vanishing to bound the row filtration.
2. Transport the same tame action to the bounded supplier complex and record its homotopies/naturality.
3. Use CC’s coefficient-limit and Bockstein maps; retain any lim¹ term until its vanishing hypotheses are checked.

**Needs.** TorsionCohomologyInfrastructure:TC.2/geometric-amplitude; TorsionCohomologyInfrastructure:TC.2/hecke-continuity; CompletedCohomologyPartII:CC.6/fixed-exponent-descent; CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level; CompletedCohomologyPartII:CC.2/milnor-and-mittag-leffler-control; IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence; IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound.

**Acceptance.** Check the action is on one actual complex. A degree-zero Tor contribution is kept in coefficient changes.

**Source.** Scholze, Corollary 5.2.6 proof, pp. 1044–1045; §4.2, pp. 1020–1024. The proof descends from sufficiently small p-levels by Hochschild–Serre with bounded geometric rows, and treats each coefficient exponent before inverse limits.

## TC.3 — Boundary induction and determinant factor extraction

Read the first six algebra targets before the arithmetic realization. They use only polynomial carriers and IHG’s existing laws/error algebra. In particular, weighted extraction is a theorem about an input determinant, not an assumption that an ambient Galois representation splits. The ambient error bound first reaches a neat tame level through an auxiliary prime and returns to S by stabilizing over infinitely many such primes. The later targets realize the character family on actual arithmetic covers, determine the Levi coefficients continuously, realize the Laurent determinant, and extract its degree-n law. Error bounds are 2(d+1) before extraction and 4(d+1) after it. The packet proposes two sub-layers: TC.3a, the six algebra targets from the twisted polynomial product to the Laurent coefficient ideal, and TC.3b, the arithmetic realization. AG2.4 may import TC.3a only once that split is applied, because AG2.7 requires AG2.4 and TC.3b requires AG2.7.

### Twisted polynomial product

**Target TC.3/twisted-polynomial-product** (definition). For a commutative ring R, P,Q∈R\[X] and a unit u∈Rˣ, set weightedProduct(P,Q,u)=P((u⁻¹)X)Q(uX). This is ordinary polynomial substitution using the existing composition ring homomorphism. It records the opposite character weights used to separate the Levi factor; it creates no new polynomial carrier.

**Hypotheses.** The twist parameter is a unit; division means multiplication by its inverse.

**Construction or proof.**

1. Compose P with C(u⁻¹)X and Q with C(u)X, then multiply.
2. Use the existing coefficient formula to compute the first differing weighted coefficients.

**Needs.** mathlib:Polynomial.compRingHom; mathlib:Polynomial.coeff_mul.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.3/twisted-product-separation: The two coefficient equations use its opposite weights. TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation: Substitute the actual character value u=χ(g).

| API | Required statement |
| --- | --- |
| weightedProduct_one (simp) | At u=1 the result is PQ. |
| weightedProduct_coeff_zero (characterisation) | Its constant coefficient is P₀Q₀. |
| weightedProduct_map (functoriality) | Coefficient base change carries the product to the product of the mapped factors and mapped unit. |
| weightedProduct_swap (compatibility) | weightedProduct P Q u = weightedProduct Q P u⁻¹. Opposite substitutions are exchanged, rather than twisting both factors in the same direction. |

**Definition checks.**

- **constant-factors:** For P=2,Q=3 over Z and u=−1 the result is the constant 6.
- **opposite-scaling:** Over Q with P=1−2X,Q=1−3X,u=2 obtain 1−7X+6X²; scaling both factors by u gives the wrong result.
- **collision:** At u=1, interchanging 1−2X and 1−3X leaves the product unchanged. Thus separation requires the unit-difference hypotheses and is not built into this definition.

**Acceptance.** Use opposite weights in the two factors.

**Source.** Scholze, Lemma 5.3.4 proof, pp.1048–1049. The character-twist calculation in Lemma 5.3.4 motivates this light polynomial definition with opposite substitutions; its formula is defined here over the existing polynomial carrier.

### Twisted product separation

**Target TC.3/twisted-product-separation** (theorem). Let R be any commutative ring, n≥0, u∈Rˣ and P,Q,P′,Q′∈R\[X] have degree at most n and constant term 1. If PQ=P′Q′, P(X/u)Q(uX)=P′(X/u)Q′(uX), and 1−u^(2j) is a unit for 1≤j≤n, then P=P′ and Q=Q′. Coefficientwise induction solves the two equations at order j by a unit determinant. This works over nonreduced rings and commutes with ring base change preserving the unit hypotheses.

**Hypotheses.** For n=0 all four polynomials equal 1. The condition is invertibility of each difference, not merely inequality of u^(2j) and 1.

**Construction or proof.**

1. At the first differing coefficient j, the untwisted equation gives δP_j+δQ_j=0.
2. The twisted equation gives u^(−j)δP_j+u^jδQ_j=0; eliminate using the unit 1−u^(2j).
3. Induct to n; coefficients above n vanish.

**Needs.** mathlib:Polynomial.coeff_mul; mathlib:Polynomial.compRingHom; TorsionCohomologyInfrastructure:TC.3/twisted-polynomial-product.

**Acceptance.** No domain or characteristic-zero hypothesis. This node has no geometric, automorphic or TC.2 prerequisite. Over Z/9 take u=2, P=1+3X, Q=1, P′=1, Q′=1+3X. Both products coincide and both twisted products equal 1+6X, yet P≠P′; 1−u²=6 is nonzero but is not a unit.

**Source.** Scholze, Lemma 5.3.4 proof, pp. 1048–1049, abstract coefficient-induction specialization. The first-differing-coefficient calculation in the lemma abstracts to any commutative ring with unit differences, giving the stated two-factor uniqueness theorem.

### Weight factorization uniqueness

**Target TC.3/finite-weight-series-factorization** (theorem). For a commutative ring S and a finite subset M⊂Z, a formal series Q(T,X)∈S\[T,T⁻¹]\[\[X]], Q≡1 mod X, has at most one expression ∏\_{m∈M}Q_m(T^mX) with Q_m∈1+XS\[\[X]]. If Q is polynomial in X and such a factorization exists, every Q_m is polynomial. The assertion is natural for S→S′. Finite weight support is essential.

**Hypotheses.** Only finitely many nonconstant factors are allowed. The source’s leading-order and polynomiality arguments are used in their corrected forms recorded in sourceIssues.

**Construction or proof.**

1. Compare the first nonzero X-order: its distinct Laurent weights have independent coefficients.
2. For polynomiality shift all weights to nonnegative values and isolate the least weight.
3. Reexpand in T with coefficients polynomial in X; induction removes the least-weight factor and continues over the finite set.

**Needs.** mathlib:Polynomial.coeff_mul; IntegralHeckeAndGaloisDeterminants:IHG.0.

**Acceptance.** Test the first nonzero coefficient at order one. A repeated equal weight must be grouped before uniqueness is asserted.

**Source.** Scholze, Lemma 5.3.10, pp. 1053–1054. Lemma 5.3.10 gives finite-weight uniqueness and polynomiality; the corrected first order and expansion variable are recorded separately.

### Weighted determinant unit law

**Target TC.3/weighted-unit-law** (construction). Suppose a group-indexed family of polynomials P_g^(m), constant term 1, degree at most n_m and finite weight support, is realized by an h-dimensional determinant D̃:R\[G]\[V,V⁻¹]→R\[T,T⁻¹], h=∑n_m, with D̃(1−XV^kg)=∏\_m P_g^(m)(T^(km)X). For each R-algebra S construct the multiplicative natural unit law D₀^(m):1+US\[G]\[\[U]]→1+US\[\[U]] by finite-weight factorization of D̃, with D₀^(m)(1−U^a xg)=P_g^(m)(U^a x), a≥1. Polynomial inputs have polynomial outputs. The natural algebra law is obtained by evaluating D₀^(m)(1+U(x−1)) at U=1.

**Hypotheses.** G is any group; each group-algebra expression has finite support. Continuity at later profinite finite-image limits is supplied separately. The characteristic identities hold for every g and every integer k, not only Frobenius or k=1.

**Construction or proof.**

1. Apply the determinant multiplication and Amitsur identities over every test algebra.
2. Separate finitely many weights using the preceding series uniqueness theorem.
3. Prove evaluation multiplicativity through the nilpotent kernel argument, using the correct noncommutative inverse order.

**Needs.** TorsionCohomologyInfrastructure:TC.3/finite-weight-series-factorization; IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula; IntegralHeckeAndGaloisDeterminants:IHG.0/multiplicative-polynomial-law; mathlib:PolynomialLaw.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.3/weighted-determinant-factors: Provides each multiplicative polynomial law before proving its degree. TorsionCohomologyInfrastructure:TC.3/laurent-family-realization: Extracts the Levi factor from the realized weighted family.

| API | Required statement |
| --- | --- |
| unitCharacteristic (characterisation) | D₀^(m)(1−U^a xg)=P_g^(m)(U^a x) for a≥1 over every test algebra. |
| unitMultiplicative (structure) | D₀^(m)(fg)=D₀^(m)(f)D₀^(m)(g), including noncommuting group-algebra inputs. |
| evaluatedLaw (compatibility) | D^(m)(x)=D₀^(m)(1+U(x−1))\|U=1 is natural and multiplicative; its polynomiality is proved before evaluation. |
| unitLawNaturality (functoriality) | For every R-algebra map S→S′, coefficient transport commutes with the formal unit law and its polynomial evaluation; identity and composition maps obey the same law. |
| unitLawUniqueness (extensionality) | The prescribed characteristic values on every 1−U^a xg determine the natural formal unit law uniquely by finite-order approximation and finite-weight uniqueness. |

**Definition checks.**

- **rank-one:** For a rank-one unit character χ:G→Rˣ and P_g=1−χ(g)X, the evaluated law sends ∑a_g g to ∑a_gχ(g). The augmentation is the special case χ=1.
- **degree-zero:** For n_m=0 the unit law and evaluated law are identically 1, including at zero.
- **nilpotent-unit:** Over S=k\[ε]/ε² the law on 1−Uεg is 1−Uεχ(g), retaining ε; reducing to k first loses a required coefficient.

**Acceptance.** Natural transformations over all test algebras are part of the output. Evaluation at U=1 is performed only after polynomiality.

**Source.** Scholze, Lemmas 5.3.11–5.3.12, pp. 1054–1056. Lemmas 5.3.11–5.3.12 construct the natural multiplicative law on formal units and prove polynomiality before evaluation at U=1, including noncommuting inputs.

### Weighted determinant factors

**Target TC.3/weighted-determinant-factors** (theorem). Under the weighted-unit-law hypotheses, for each m there exists a unique n_m-dimensional determinant D^(m):R\[G]→R with D^(m)(1−Xg)=P_g^(m)(X). It is compatible with every ring base change and with nilpotent quotients. It is obtained as an actual natural homogeneous multiplicative polynomial law, not by pointwise selection of polynomial roots. The degrees are forced by the unit leading coefficient of the full characteristic polynomial and h=∑n_m, combined with the supplier’s direct-factor decomposition of a multiplicative polynomial law into homogeneous degrees.

**Hypotheses.** The supplied h-dimensional determinant on group units has degree exactly h; do not infer exact degrees from degree upper bounds alone. The homogeneity lemma 5.3.13 is a requested IHG.0 extension, not a second definition of determinants here.

**Construction or proof.**

1. Construct the evaluated multiplicative polynomial laws.
2. Use the IHG homogeneity decomposition on coefficient-ring idempotent factors.
3. Compare characteristic degrees on each nonzero component to force n_m; use determinant uniqueness from characteristic coefficients.

**Needs.** TorsionCohomologyInfrastructure:TC.3/weighted-unit-law; IntegralHeckeAndGaloisDeterminants:IHG.0; IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial.

**Acceptance.** Include degree zero and nonconnected/nonreduced coefficient rings. No TC.2 or AG2 input enters this algebra theorem.

**Source.** Scholze, Lemma 5.3.8 and Remark 5.3.9, pp. 1052–1053; proof through p. 1057; Lemma 5.3.13, pp. 1056–1057. Lemma 5.3.8 is the weighted determinant extraction theorem; Lemma 5.3.13 supplies the homogeneous-component argument, including degree zero and disconnected coefficient rings.

### Laurent coefficient ideal bound

**Target TC.3/laurent-coefficient-ideal** (theorem). Let R be commutative, I⊂R\[T,T⁻¹] and I^N=0, N≥1. For each a∈Z define I_a={f: f(T^a)∈I}, put I′=⋂\_a I_a, and let J⊂R be generated by the Laurent coefficients of elements of I′. Then J^N=0 and I′⊂J·R\[T,T⁻¹]. Hence any characteristic constraints realized over R\[T,T⁻¹]/I′ descend to (R/J)\[T,T⁻¹] with the same nilpotence exponent. In the determinant application realize all transformed quotients first and use imported coefficient-subring descent to obtain the law over the intersection quotient.

**Hypotheses.** N≥1; finite Laurent support for each element. A determinant over the intersection quotient is supplied by the preceding transformed-law gluing, not by the coefficient-ideal assertion itself.

**Construction or proof.**

1. Form the transformed-ideal intersection.
2. Separate the finitely many Laurent monomials in any N-fold product by sufficiently spaced substitutions T↦T^a.
3. Read off each coefficient product, proving J^N=0 and the quotient characteristic identities.

**Needs.** mathlib:Polynomial.coeff_mul; IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-quotient-functoriality.

**Acceptance.** The output exponent remains N. Record the transformed-ideal intersection before taking coefficients.

**Source.** Scholze, Lemma 5.3.7 proof, pp. 1051–1052. Lemma 5.3.7 bounds the coefficient ideal by separating finitely many Laurent exponents with suitable spaced substitutions; this is algebraic and needs no cohomology input.

### Boundary Satake polynomials

**Target TC.3/satake-ambient-polynomials** (construction). At v∉S let e_i be the elementary symmetric normalized GL_n Satake generators, e₀=1 and e_n a unit; q=q_v. Define P_v(X)=∑\_{i=0}^n(−1)^i q^(i(n+1)/2)e_iX^i and Q_v(X)=∑\_{i=0}^n(−1)^i q^(−i(n+1)/2)(e_{n−i}/e_n)X^i. Q is the constant-one dual polynomial, equivalently the normalized reciprocal of P. Under the unnormalized Siegel-Levi Satake map the ambient polynomial is (1−X)P_v(X)Q_v(X) for Sp_2n, and P_v(X)Q_vc(q_vX) for U(n,n), both at split and inert places (v^c=v in the inert case, q_v=q_v⁺²). For the standard double-coset generators U_i, e_i=q^(−i(n−i)/2)U_i; hence P_v(X)=P_standard^rec(q_vX), where P_standard is IHG.3’s monic polynomial. Square roots used to describe Satake parameters disappear in the integral coefficients.

**Hypotheses.** Use the full unnormalized hyperspecial Satake transform of ALS.4, not an Iwahori positive-part map. At split CM places keep the two conjugate blocks and their duals. For the source geometric Frobenius ε(Frob_v)=q_v⁻¹; the conversion to the standard reciprocal polynomial is the twist ε⁻¹.

**Construction or proof.**

1. Import spherical generators and their Satake images.
2. Compute the Levi root images: Sp roots q^((n+1)/2)a_i and their inverses; U split q^(n/2)X_i,q^(−n/2)Y_i, inert q_v^(n/2)a_i and inverses.
3. Take elementary symmetric products to obtain the displayed identities, and compare the integer exponents with IHG.3.

**Needs.** IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial; IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-duality; ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps; mathlib:Polynomial.reverse; mathlib:Matrix.charpolyRev.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.3/siegel-boundary-specialization: Pins the actual boundary action and factor identities. TorsionCohomologyInfrastructure:TC.4/normalization-validations: Checks GL₁ and GL₂ output conventions.

| API | Required statement |
| --- | --- |
| leviPolynomial (data) | P has constant term 1 and coefficient (−1)^i q^(i(n+1)/2)e_i; all coefficients lie in the integral Hecke algebra. |
| dualPolynomial (characterisation) | Q has roots reciprocal to those of P and constant term 1; it includes division by the top elementary symmetric generator. |
| ambientRestriction (compatibility) | The ambient Hecke polynomial restricts to the Sp or CM displayed product under the actual unnormalized Satake map. |
| normalizedReciprocal (relation) | If c is the unit top coefficient of the degree-n polynomial P, then Q(X)=X^n P(X⁻¹)/c in the Laurent polynomial ring, hence in the polynomial ring. Taking this normalized reciprocal twice recovers P; coefficient base change preserves the identity. |

**Definition checks.**

- **rank-one-twist:** For n=1,q=3,U₁=2, P=1−6X, whereas the standard reciprocal is 1−2X; this detects the missing ε⁻¹ twist.
- **rank-two-twist:** For n=2,q=2,U₁=3,U₂=5, P=1−6X+40X², the standard reciprocal evaluated at 2X.
- **unitary-top-sign:** For n=1 over Q, P=1−aX and Q_c=1−bX give P Q_c(qX)=1−(a+qb)X+qabX², not a negative top term.

**Acceptance.** The CM degree-2n coefficient has positive sign. Check geometric/arithmetic inversion separately from the additional Tate twist.

**Source.** Scholze, Lemma 5.1.6, pp. 1034–1035; Lemma 5.2.5 and following polynomials, pp. 1042–1043; §5.4 polynomial, p. 1057. The local Satake calculation and the §5.4 polynomial identify the integral Levi factors and the extra cyclotomic twist. The unitary top coefficient uses the corrected positive sign.

### Classical ambient determinant

**Target TC.3/classical-ambient-determinant** (theorem). For scalar cusp weights in the range k>n for Sp_2n and k≥n for U(n,n), specialize the imported discrete-series transfer and regular conjugate-self-dual GL constituent representations to obtain ambient rank h=2n+1 (real) or 2n (CM) determinants over each integral classical Hecke image. They satisfy the source ambient geometric-Frobenius polynomial and polarization σ∨c≅σε^δ with δ=0 real, δ=1 CM. Apply IHG.4 interpolation to every discrete quotient of T_cl supplied by continuity. General real fields require the precise Arthur input; general CM fields require Mok. The unconditional CM branch requires F to contain an imaginary quadratic field, S to be pulled back from rational primes including p and all F/Q ramification, and uses unitary similitude Shimura varieties with Shin’s cohomological base change.

**Hypotheses.** Use AG2.3’s regular constituent input, not only Shin-regular or finite-slope representations. The rank of an endoscopic GL constituent is n_i; the final exponent in its segment is (ℓ\_i−1)/2. Passage to a finite coefficient ring containing the finitely many classical data is labelled.

**Construction or proof.**

1. Use the supplied classification/transfer and discrete series at the stated weight range.
2. Assemble the individual regular polarized constituent representations with the exact twists to match the ambient Satake polynomial.
3. Use the already planned IHG interpolation on the continuous quotient; preserve the conditional versus unconditional branches.

**Needs.** TorsionCohomologyInfrastructure:TC.2/hecke-continuity; TorsionCohomologyInfrastructure:TC.2/classical-hecke-topology; TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials; AutomorphicGaloisRepresentationsPartII:AG2.3/solvable-index-induction; AutomorphicGaloisRepresentationsPartII:AG2.7; ModularityAndLanglandsExtensions:ML.4; EndoscopicTransferAndUnitaryTraceComparison:ET.7a; IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation.

**Acceptance.** The unconditional field and S hypotheses occur in the exported theorem. Ambient polarization is not a polarization of the extracted arbitrary GL_n factor.

**Source.** Scholze, Proposition 5.1.1 and Theorems 5.1.2–5.1.4, pp. 1031–1034; Corollary 5.1.7, pp. 1035–1036; Corollaries 5.1.10–5.1.11, pp. 1037–1038; Remark 5.4.6, pp. 1060–1061. The discrete-series range, endoscopic constituents and regular polarized Galois inputs give the ambient determinants and their integral interpolation; Remark 5.4.6 restricts the unconditional CM branch.

### Siegel Levi boundary realization

**Target TC.3/siegel-boundary-specialization** (theorem). For the Siegel parabolic of Sp_2n or U(n,n) with Levi Res_F/Q GL_n, choose decomposed level K_P=(K∩M)(K∩U), so K_M is both the projection image and intersection with M. The actual Borel–Serre stratum is a unipotent nilmanifold bundle over X_KM; in this Siegel case U is commutative and its fibre is a torus. The ALS boundary triangle, projection and zero section show that the ambient boundary Hecke annihilator is contained in the annihilator of H!^i(X_KM,O/p^m), with action through the unnormalized Satake map. Apply the preceding ambient polynomial identity. This is a kernel containment and resulting quotient, not a direct-summand assertion for full boundary cohomology.

**Hypotheses.** Retain all adelic components and actual boundary inclusion; choose the level hypotheses before using a section. Use the interior image H!^i=im(H_c^i→H^i), not unrestricted ordinary cohomology.

**Construction or proof.**

1. Import the actual stratum fibration, boundary LES and correspondence action.
2. Construct the projection/section maps on the supported cohomology diagram and deduce annihilator containment.
3. Use ALS Satake compatibility to evaluate the ambient characteristic polynomial.

**Needs.** ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison; ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre; TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials.

**Acceptance.** For levels without the stated decomposition use refinement/descent, not an assumed section. No general noncommutative U is declared a torus.

**Source.** Scholze, Definition 5.2.1 and Lemma 5.2.2, pp. 1038–1039; Lemma 5.2.3 and Corollary 5.2.4, p. 1041. The boundary Leray calculation uses the Siegel stratum, its torus fibre and the unnormalized Satake map to obtain the interior-annihilator containment; it is not a full-boundary direct-summand assertion.

### Ambient interior error bound

**Target TC.3/ambient-interior-error** (theorem). Let A₀ be the finite Hecke image on H!^i(X_KM,O/p^m) in the Siegel-Levi specialization. With d=\[F:Q]n(n+1)/2 in the real case and d=\[F⁺:Q]n² in the CM case, there is I⊂A₀ with I^(2(d+1))=0 and a continuous ambient determinant of rank h over A₀/I with characteristic polynomial (1−X)P_vQ_v or P_vQ_vc(q_vX). The nilpotence is obtained by combining the length d+1 fixed-exponent descent filtration with the two boundary/interior steps, using IHG’s imported filtered-module error algebra.

**Hypotheses.** The ideal and determinant are on the same finite Hecke image; the actual action diagrams precede nilpotence. A finite extension coefficient ring is permitted with the supplied coefficient-change comparison. The perfectoid inputs need tame level inside a level-N subgroup, N≥3 prime to p. Reach it by adjoining the places over an auxiliary prime ℓ≥3, ℓ≠p, to S⁺ without changing K; the result for S⁺∪{ℓ} is then returned to S by stabilizing over infinitely many ℓ, so that the exponent d+1 per filtration is not lost.

**Construction or proof.**

1. Use the classical ambient determinant on the fixed-exponent tower.
2. For an auxiliary ℓ, choose a normal open K_pK^p_(S⁺)⊂K_(S⁺) whose tame part lies in the level-ℓ subgroup, and descend by the completed Hochschild–Serre sequence: its rows have tower degree 0..d, so the Hecke image A_ℓ away from S⁺∪{ℓ} has an ideal J_ℓ with J_ℓ^(d+1)=0 and a determinant modulo J_ℓ.
3. The ambient Hecke image A on H_c^i(X_K,Z/p^m) is finite and contains A_ℓ, so infinitely many ℓ give the same extended ideal J=J_ℓA. For two such ℓ₁≠ℓ₂ both determinants live over A/J and agree at Frobenius outside S∪{ℓ₁,ℓ₂}; by density they are equal, hence unramified at ℓ₁ and ℓ₂, and give a determinant of G_F,S over A/J with the prescribed characteristic polynomials at every v∉S.
4. Use the boundary realization quotient and two filtration steps; retain exponent 2(d+1).

**Needs.** TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant; TorsionCohomologyInfrastructure:TC.3/siegel-boundary-specialization; TorsionCohomologyInfrastructure:TC.2/descent-and-coefficient-limits; IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound; IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant-dense.

**Acceptance.** The finite quotient map is named and its kernel bound is explicit. The geometric d is not the dimension of the GL_n locally symmetric space.

**Source.** Scholze, Corollary 5.2.6 and proof, pp. 1044–1045; Corollary 5.2.7, pp. 1045–1046. The source bounds the error of the ambient cohomology action by two bounded filtrations, hence exponent 2(d+1), before extracting a Levi factor. Its proof adjoins an auxiliary prime ℓ to S⁺ for the neat tower and says only that the result follows by varying ℓ; the stabilization step is supplied here (finding E19).

### Auxiliary character realization

**Target TC.3/auxiliary-character-realization** (construction). For a finite-order character χ:G_F,S′→W(F̄\_p)ˣ of order prime to p, realize its class-field character as a degree-zero cohomology class at a refined GL_n level. Its χ-isotypic projector is integral, since the covering index is prime to p, and cup product gives the split injection of the original interior module into the χ-twisted interior module. The Levi polynomial changes to P_v(X/χ(Frob_v)), and its dual to Q_v(χ(Frob_v)X); in the CM term use the conjugate character at v^c. Ramification is included in S′, and later auxiliary-prime descent restores S. This produces actual input determinants at the twisted level, not formal twists of unsupported eigenvalues.

**Hypotheses.** Take χ of odd order as in the source (in particular trivial at real infinite places) and order prime to p. A merely prime-to-p even-order sign character need not occur in degree-zero cohomology at the stated archimedean quotient. Choose the refinement realizing the finite class-field character and keep all coefficient extensions. The splitting uses prime-to-p index; it does not average over a p-cover. Tau Ceti's ClassFieldTheory normalizes every Artin map by arithmetic Frobenius. The source matches uniformizers with geometric Frobenius, so the character of the idele class group used here is the composite of Tau Ceti's Artin map with inversion; with that convention ψ\_v(ϖ\_v)=χ(Frob_v) for geometric Frobenius.

**Construction or proof.**

1. Attach to χ the finite-order idele class character ψ through the global Artin map, converting its arithmetic normalization; oddness makes ψ trivial at the archimedean places and unramifiedness outside S′ makes it trivial on the local units there.
2. Choose a normal K′⊂K of index prime to p with ψ trivial on det(K′); π₀(X_K′) is F^×\\A_F,f^×/det(K′), so the ψ-isotypic part of H⁰(X_K′,W(F̄\_p)) is free of rank one, and its projector is integral because \[K:K′] is prime to p. The level trace makes pullback split injective.
3. Cup product with this class intertwines each tame Hecke operator t with its ψ-twist f_ψ(t), and cup product with the ψ⁻¹ class retracts it; apply the ambient error theorem to the twisted image.

**Needs.** tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition; ArithmeticLocallySymmetricSpaces:ALS.3/level-trace; ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility; ArithmeticLocallySymmetricSpaces:ALS.3/character-twist; TorsionCohomologyInfrastructure:TC.3/ambient-interior-error.

**Use-derived API.** TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation: Produces separating character values and actual twisted data. TorsionCohomologyInfrastructure:TC.3/laurent-family-realization: Realizes the variable character family modulo finite powers.

| API | Required statement |
| --- | --- |
| characterLevel (constructor) | The finite prime-to-p cover realizes the chosen class-field character at a common level. |
| isotypicProjector (projection) | The χ-idempotent is divided by the prime-to-p degree and gives an integral splitting. |
| twistedPolynomial (compatibility) | Cup product intertwines each tame Hecke action with P_v(X/χ\_v) and the corresponding dual/conjugate twist. |
| cupRetraction (compatibility) | At the chosen prime-to-p refinement, cup product with the inverse-character degree-zero class retracts the character cup injection on its image; its composite there is the identity, and the retraction intertwines the corresponding inverse Hecke twist. |

**Definition checks.**

- **trivial-character:** χ=1 recovers the original injection and polynomials.
- **inverse-character:** In rank one P=1−aX twists to 1−aχ⁻¹X, not 1−aχX.
- **p-cover:** For a degree-p cover over Z/p the averaging idempotent is undefined, so the split-injection assertion is not supplied.

**Acceptance.** Track the inverse χ in P and direct χ in Q. Include the auxiliary ramification set at each stage.

**Source.** Scholze, Theorem 5.3.1 proof, pp. 1046–1047. The proof realizes odd prime-to-p class-field characters in degree-zero arithmetic cohomology at refined level and cups them with the interior module, with opposite polynomial twists.

### Cyclotomic factor continuation

**Target TC.3/cyclotomic-factor-continuation** (theorem). Choose a finite extension L₀ containing F, Galois over F⁺, trivializing the residual root data and, in the CM case, the residual cyclotomic character. For an auxiliary odd ℓ≠p, let F_ℓ^cycl/F be the cyclotomic Z_ℓ-extension and S_ℓ=S∪{v|ℓ}; use the maximal pro-p extension of L₀F_ℓ^cycl unramified outside S_ℓ. On the finite Artinian coefficient factors, the requested residual-kernel theorem factors each ambient determinant through the quotient retaining this pro-p kernel and the finite residual image. Odd prime-to-p characters of arbitrarily large ℓ-power order separate an element outside the cyclotomic kernel: choose χ with χ(g)^(2j)≠1 for 1≤j≤n; then χ(g)^(2j) is a root of unity of ℓ-power order different from 1, and since ℓ≠p, 1−χ(g)^(2j) is a unit of W(F̄\_p). Twisted-product separation determines the continuous Levi coefficients there. Stabilize a common error ideal I₀ across infinitely many characters and auxiliary primes using finiteness of the coefficient Hecke image. Two distinct primes, chosen away from the finite extension degree, cover the omitted kernels and descend the coefficient functions to G_F,S, removing the extra ramification. The coefficients are independent of auxiliary choices, with I₀^(4(d+1))=0.

**Hypotheses.** Use the cyclotomic Z_ℓ-extension, not the entire roots-of-unity extension; include places over ℓ until two-prime descent restores S. Factor the determinant over finite Artinian local coefficient rings, not just its residual field determinant. A continuous finite-image coefficient family can be defined over a finite residue field extension before this step.

**Construction or proof.**

1. Apply Chenevier Lemma 3.8 separately on each finite local coefficient factor to kill the prime-to-p part of the residual kernel; identify the quotient using the maximal pro-p group universal property. Sum the two comparison ideals when comparing character determinants.
2. Use unit separation to determine the Levi coefficients off the cyclotomic kernel.
3. Patch with two auxiliary primes and continuity; stabilize the finite ideal choices and descend ramification.

**Needs.** TorsionCohomologyInfrastructure:TC.3/twisted-product-separation; TorsionCohomologyInfrastructure:TC.3/auxiliary-character-realization; IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-sum-bound; tauceti:TauCeti.maximalProPQuotient.lift; IntegralHeckeAndGaloisDeterminants:IHG.1; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction.

**Acceptance.** Nonvanishing alone is replaced by unit differences. Only finitely many ideals is used after passing to the finite coefficient image. The finite quotient retains the residual image; it is not asserted to be a pro-p quotient of the entire Galois group. The ℓ-ramification allowed in the construction disappears only after the two-prime descent argument.

**Source.** Scholze, Lemmas 5.3.2–5.3.4 and Corollary 5.3.5 with proof, pp. 1047–1050. Lemmas 5.3.2–5.3.4 and Corollary 5.3.5 continue the Levi coefficients using cyclotomic Z_l extensions, unit character separation, stabilized finite ideals and two auxiliary primes. The determinant factorization input is Chenevier Lemma 3.8, not a field-only kernel result. Chenevier, §3.1, Lemma 3.8 and proof, p.43. The continuous determinant deformation factors through the quotient with pro-p residual kernel over a profinite local coefficient ring; application to the finite Artinian factors is requested from IHG.1.

### Laurent determinant realization

**Target TC.3/laurent-family-realization** (theorem). For the continuous finite-image family P_g, choose an auxiliary prime ℓ retaining I₀,ℓ=I₀ and with ℓ∤\[F̃:F] for a finite extension killing all coefficient data. Actual twisted ambient determinants realize character evaluations of a Laurent-valued rank-(2n+1) law in the real case, or rank-2n law in the CM case. Work first after the finite coefficient extension needed for the character values. Comparing each character uses the sum ideal Ĩ\_χ=I₁+I_χ. Algebraic characteristic-coefficient subring descent on G×Z, via Amitsur’s formula, constructs the natural law over the Laurent coefficient subring; the Laurent ring is not assumed compact. Apply every T↦T^a substitution and the coefficient-ideal theorem to replace the error by an ideal generated by coefficients with exponent 4(d+1), then contract to the original finite Hecke image A₀ and descend using its characteristic coefficients. In the real case retain the factor (1−X) as weight zero in the full determinant; the weight −1 factor is extracted only in levi-interior-determinant. Weights −1,+1 carry P_g and its dual, with the CM conjugate/cyclotomic factor retained.

**Hypotheses.** The auxiliary prime retains the stabilized ideal; being merely large is insufficient. All characteristic identities required by the weighted extraction theorem are verified, including every power V^k.

**Construction or proof.**

1. Realize the permitted character evaluations through finite-level ambient determinants after the required coefficient extension; all comparisons use the sum ideals.
2. Embed the Laurent coefficient ring modulo the common error in the product of character-evaluation quotients. The prescribed characteristic coefficients of every gV^k lie in that subring. Apply IHG.0/determinant-coefficient-subring and Amitsur to descend the product law algebraically; no compact-Laurent argument is used.
3. Intersect transformed errors, bound the coefficient ideal, contract it to A₀ and descend the law by its characteristic coefficients. Keep the symplectic weight-zero factor when checking all g and all powers V^k.

**Needs.** TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation; TorsionCohomologyInfrastructure:TC.3/laurent-coefficient-ideal; IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula; IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-coefficient-subring.

**Acceptance.** Keep Ĩ\_χ in every comparison until its powers are bounded. The output is a natural determinant law over test algebras, not only a Laurent characteristic function. The real characteristic is (1−X)P_g(T⁻ᵏX)Q_g(TᵏX); no division of a determinant law by (1−X) is presumed. Laurent coefficient descent is algebraic; compact gluing is reserved for profinite coefficient rings.

**Source.** Scholze, Lemmas 5.3.6–5.3.7, pp. 1050–1052. Lemmas 5.3.6–5.3.7 realize all character evaluations and descend algebraically to Laurent coefficients, then replace the error by a bounded coefficient ideal. The symplectic weight-zero factor remains until extraction.

### Levi interior determinant

**Target TC.3/levi-interior-determinant** (theorem). For the actual finite Hecke image A₀ on GL_n interior cohomology at exponent m, there is J⊂A₀ with J^(4(d+1))=0 and a continuous degree-n determinant D:G_F,S→A₀/J in the polynomial-law sense, with D(1−XFrob_v)=P_v(X), v∉S. Extract the weight −1 Levi factor from the Laurent family by the algebraic weighted determinant theorem; then use imported continuity/finite-image criteria. It is independent of auxiliary character choices by characteristic uniqueness. Ring base change and common-quotient level comparisons preserve it. Its arithmetic existence inherits exactly the conditional or unconditional classical-input branch stated above.

**Hypotheses.** This concludes the concrete Siegel-Levi realization, not a generic all-group Galois theorem. No self-duality condition is imposed on the extracted arbitrary GL_n factor.

**Construction or proof.**

1. Apply the Laurent-family realization with the stated coefficient ideal.
2. Apply the independent finite-weight algebra theorem to obtain the actual degree-n law.
3. Use dense Frobenius characteristic uniqueness and finite-image continuity; compare common quotient data under base change.

**Needs.** TorsionCohomologyInfrastructure:TC.3/laurent-family-realization; TorsionCohomologyInfrastructure:TC.3/weighted-determinant-factors; IntegralHeckeAndGaloisDeterminants:IHG.4/finite-quotient-determinant-data; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant-dense.

**Acceptance.** The quotient exponent is 4(d+1), not 2(d+1). A polynomial factor at each Frobenius alone does not satisfy this acceptance test.

**Source.** Scholze, Theorem 5.3.1, p. 1046; algebraic conclusion pp. 1052–1057. Theorem 5.3.1 follows from the Laurent realization and weighted extraction, giving a continuous rank-n interior determinant with the doubled error bound and prescribed Frobenius polynomial.

## TC.4 — Reusable output and validation examples

The boundary induction is on actual integral complexes for smaller GL blocks. The uniformity argument counts filtration depth, not the number of strata or the order of a finite-level covering group. Product gluing over coefficient exponents uses UCT in the correct direction. The four-route result is a commuting action/characteristic diagram on common quotients, not a map assigning a polynomial to an arbitrary class. The rank-one, rank-two and nonlifting examples test its normalization and coefficient behavior.

### Integral GL boundary induction

**Target TC.4/integral-boundary-induction** (theorem). For GL_n/F with F totally real or CM, S conjugation-stable containing p and all places ramified over F⁺, and K hyperspecial outside S, realize the Borel–Serre boundary with finite coefficients O/ϖ^m by its actual finite stratification and nilmanifold-fibre complexes. Its Hecke-module cohomology has a filtration of length bounded only by \[F:Q] and n whose graded terms are subquotients of finite sums of lower-rank Levi cohomology/group-cohomology terms, with action through the full unnormalized Satake transform and the actual coefficient twists. Combining lower-rank determinants with those twists gives a degree-n boundary determinant modulo an ideal of uniformly bounded nilpotence. Stacky levels and arbitrary finite-free algebraic lattices are handled by finite-level coefficient trivialization and Hochschild–Serre descent, using the bounded geometric row range rather than the unbounded group-cohomology direction.

**Hypotheses.** Import the integral boundary filtration from ALS.4, including the CM and lattice versions, as an explicit extension request. Integral nilmanifold cohomology is not replaced by characteristic-zero Nomizu–Kostant or an unproved exterior-algebra formula. Number of adelic strata can grow with level; only the depth of the rank/stratum filtration is bounded.

**Construction or proof.**

1. Use the finite boundary-stratum filtration, nilmanifold Leray complex and coefficient trivialization at a sufficiently fine p-level.
2. Use derived Künneth for Levi products, including Tor, and induct on rank for each smaller block.
3. Compute the Satake block factors with the required cyclotomic twists; apply IHG direct sums, uniform extension bounds and quotient gluing.

**Needs.** ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle; ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence; ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre; ArithmeticLocallySymmetricSpaces:ALS.4; CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting; IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum; IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound; TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials; ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre.

**Acceptance.** A recurrence for the filtration/error bound must not depend on K, ξ, i or m. Do not import ALS gln-boundary-eisenstein, which assumes Galois input and would be circular.

**Source.** Scholze, Theorem 5.4.1 proof, pp. 1058–1059; Caraiani–Le Hung §3, Proposition 3.3 and Remark 3.4, author PDF pp. 6–9. The conclusion uses rank induction on actual boundary strata. The finite-coefficient boundary geometry and Satake action are imported; the integral/CM/lattice filtration is an explicit ALS extension, without assuming the exterior-power formula of CLH Remark 3.1. CLH, §3, Proposition 3.3 and Remark 3.4, author PDF pp. 6–9. The finite-coefficient boundary filtration and Hecke action; the integral/CM/lattice generalization is an explicit ALS request.

### Finite torsion determinant assembly

**Target TC.4/finite-torsion-assembly** (application). Specialize the infrastructure to Scholze’s GL_n arithmetic output: there exists N=N(\[F:Q],n) such that for every K=K_SK^S⊂∏GL_n(O_Fv), every finite-free Z_p algebraic representation lattice M_ξ, all i≥0 and m≥1, the finite Hecke image A(K,ξ,i,m)=im(T_F,S→End(H^i(X_K,M_ξ/p^m))) admits I with I^N=0 and a continuous degree-n determinant over A/I with D(1−XFrob_v)=P_v(X) for v∉S. Use the source’s stack interpretation at nonneat levels. The theorem is an assembly on this actual family, with the classical input branch and field/S restrictions explicitly inherited from TC.3. It supplies no all-reductive-group theorem and no explicit value of N beyond the proven interior bound.

**Hypotheses.** F totally real or CM; n≥1; S is conjugation-stable, contains p and F/F⁺ ramification. Unconditional CM: imaginary quadratic subfield and S pulled back from S_Q containing p and F/Q ramification; otherwise the matching Arthur/Mok input is a hypothesis.

**Construction or proof.**

1. For neat level and trivial coefficients put B_i=im(H^i→H^i_∂). The exact sequence is 0→H!^i→H^i→B_i→0. Let A! and A_B be the faithful Hecke images on these two factors; A_B is a quotient of the full boundary Hecke image. Thus the map A→A!×A_B is well defined.
2. An operator in this map’s kernel kills H!^i and sends H^i into H!^i, so the kernel has square zero. First push the boundary determinant along its quotient map to A_B and glue on the joint product image; pulling the error back multiplies its exponent by at most two.
3. Use characteristic-compatible determinant descent on the joint quotient. Choose a neat normal K′⊂K on which M_ξ/p^m is trivial and descend by the finite-cover Hochschild–Serre sequence H^a(K/K′,H^b(X_K′,M_ξ/p^m))⇒H^(a+b)(X_K,M_ξ/p^m): its rows vanish above the dimension of the manifold X_K′, so every degree has a filtration of uniformly bounded length although the group cohomology of K/K′ is unbounded.

**Needs.** TorsionCohomologyInfrastructure:TC.3/levi-interior-determinant; TorsionCohomologyInfrastructure:TC.4/integral-boundary-induction; IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-extension-bound; IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing; ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre; IntegralHeckeAndGaloisDeterminants:IHG.5/filtered-module-error-bound; ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold; CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting.

**Acceptance.** Uniformity is in K, ξ, i and m with F-degree and n fixed. The boundary factor is its image B_i in the cohomology sequence; annihilation of H^i does not imply annihilation of all H^i_∂. Independent finite-exponent error ideals are permitted by the simultaneous product construction.

**Source.** Scholze, Theorem 5.4.1, pp. 1057–1059; Remark 5.4.6, pp. 1060–1061. Theorem 5.4.1 combines the interior module with its actual boundary image, then descends coefficients and level with uniform filtration depth. Remark 5.4.6 fixes the unconditional arithmetic branch.

### Integral coefficient transport

**Target TC.4/integral-and-inverse-system-transport** (theorem). For fixed K,ξ,i let A_m be the finite Hecke image on H^i(X_K,M_ξ/p^m), H=H^i(X_K,M_ξ) the finite Z_p-module, and B the closed simultaneous image of T_F,S in ∏\_{m≥1}A_m. The UCT injection H/p^m↪H^i(X_K,M_ξ/p^m) makes each action on H/p^m continuous for the B-topology and compatible in m. Taking their inverse limit extends the integral action to B. The integral Hecke image A_Zp⊂End_Zp(H) is a finite Z_p-submodule, hence compact and closed, so density gives a surjection B→A_Zp. Choose any finite-exponent error ideals I_m with their common bound N and set J=B∩∏I_m. The injective simultaneous projections give J^N=0. The compact ring B/J embeds in ∏A_m/I_m and contains the common Hecke coefficients; IHG compact coefficient gluing constructs its continuous degree-n determinant. Push it along B/J→A_Zp/image(J); the uniform exponent N is unchanged. Varying levels uses closed joint action rings and common quotients; individual canonical maps A_m→A_r are not required.

**Hypotheses.** Use products, not direct sums, for simultaneous coefficient exponents. Integral cohomology H is a finite Z_p-module; UCT includes the next-degree Tor term. The I_m need not be compatible with reduction. Each is closed because A_m is finite, so J is closed and B/J is compact Hausdorff. Only common Frobenius characteristic coefficients are needed for product gluing.

**Construction or proof.**

1. Use UCT to induce the continuous action of each A_m on H/p^m; its pullbacks to B form a compatible system. Completeness identifies H with lim H/p^m and gives the extended integral action.
2. The integral image is closed in End_Zp(H); density of the original Hecke image and compactness of B make its extended image exactly A_Zp, not just a dense subring.
3. Bound J by the existing arbitrary-family nilpotence theorem, embed B/J into the product of finite coefficient quotients, apply compact determinant gluing using their common characteristic coefficients, and push the law and ideal to A_Zp.

**Needs.** TorsionCohomologyInfrastructure:TC.4/finite-torsion-assembly; CompletedCohomologyPartII:CC.2/coefficient-bockstein-comparison; IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing; IntegralHeckeAndGaloisDeterminants:IHG.5.

**Acceptance.** Check the containment is ∩ker(T→A_m)⊂ker(T→A_Zp). The same integer N persists after product gluing; no loss depending on m. Use the arbitrary index family with a common N, as in current upstream IHG Layer 5; its older atlas node states only the finite-family case. No transition map between separately chosen I_m is needed.

**Source.** Scholze, Corollary 5.4.2 proof, p. 1060; Remark 5.4.5, p. 1061, with corrected kernel containment and products. Corollary 5.4.2 and Remark 5.4.5 give the simultaneous finite-coefficient action, corrected to a product and the UCT kernel direction; compact product gluing supplies the integral quotient.

### Four route Hecke compatibility

**Target TC.4/four-route-compatibility** (theorem). For the finite Hecke image on an interior GL_n module H!^i(X_K,O/p^m) realized by the Siegel boundary diagram, use the actual common refinements and joint action rings. After its quantified quotient A→A/I with I^(4(d+1))=0, four action/characteristic calculations agree: (1) the ambient Shimura finite-level support diagram, fixed-exponent completion and almost boundary-ideal Čech comparison followed by classical section approximation; (2) the ambient boundary action on the GL_n interior image through unnormalized Levi Satake; (3) auxiliary-character Laurent realization and degree-n determinant extraction; (4) the integral GL_n spherical polynomial from IHG.3 after reciprocal/geometric-Frobenius and ε⁻¹ transport. The common value at every v∉S is P_v in (A/I)\[X]. For a full ordinary GL_n finite-level module with coefficients M_ξ/p^m, apply these squares to its interior and lower-rank boundary subquotients, then glue by TC.4 boundary induction and the assembly quotient I^N=0, N=N(\[F:Q],n). The squares commute under ring base change and coefficient/level pullback/trace on joint quotients. Almost errors in route (1) are discharged by finite-coefficient faithfulness; the nilpotent ideal is a separate error.

**Hypotheses.** These are maps of actions and characteristic coefficients, not a purported canonical map taking an arbitrary cohomology class to a polynomial. Agreement under a coefficient or level change is stated only after the named common quotient maps, not by inventing A_m→A_r. The perfectoid comparison is on the ambient Hodge-type Shimura tower. There is no asserted perfectoid compactification or direct class-to-section map for an arbitrary GL_n locally symmetric space. For full ordinary cohomology compare the action on its specified filtration subquotients, not a claimed lift of each class to the ambient tower.

**Construction or proof.**

1. Use the Siegel boundary annihilator containment to connect the GL_n interior image with the ambient Shimura action; compose that ambient finite-level support/trace diagram with TC.2 comparison and continuity. Keep exponent 4(d+1) on the extracted interior quotient.
2. Compose boundary Satake and character-twist identities with the extracted determinant characteristic formula.
3. Use determinant uniqueness on dense Frobenius data and the IHG base-change maps to identify the two composites on each common coefficient quotient.
4. For ordinary coefficients descend and filter through the interior and smaller-Levi boundary modules; compare each graded action square and use the uniform assembly ideal I^N=0 rather than asserting a perfectoid map on GL_n classes.

**Needs.** TorsionCohomologyInfrastructure:TC.2/cech-comparison; TorsionCohomologyInfrastructure:TC.2/hecke-continuity; TorsionCohomologyInfrastructure:TC.3/siegel-boundary-specialization; TorsionCohomologyInfrastructure:TC.3/levi-interior-determinant; TorsionCohomologyInfrastructure:TC.4/finite-torsion-assembly; TorsionCohomologyInfrastructure:TC.4/integral-and-inverse-system-transport; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant-dense; TorsionCohomologyInfrastructure:TC.4/integral-boundary-induction.

**Acceptance.** Explicitly give all four arrows, their coefficient categories and the ideal/exponent. Validate before inverse limits; generic-fibre agreement alone is insufficient.

**Source.** Scholze, Theorem 4.2.1, pp. 1021–1023; Theorem 4.3.1, pp. 1024–1030; §§5.2–5.4, pp. 1038–1061. This is a compatibility target obtained by composing the four cited action and characteristic diagrams on common quotients; the separate almost and nilpotent errors are kept explicit.

### Residual and local specialization

**Target TC.4/residual-and-local-specialization** (application). A finite-field Hecke eigensystem on the finite torsion module kills the nilpotent ideal, so IHG reconstruction gives a continuous semisimple degree-n representation over an algebraic closure with characteristic P_v, unique up to conjugacy. For a split absolutely irreducible residual system over a finite field k, localize and complete a Hecke coefficient ring on which that system occurs: a finite torsion action ring, or the integral action ring when the eigensystem is in its support. After the coefficient extension needed to identify k and its residual basis, the determinant lives over the resulting complete henselian local ring Â/Î, with Î^N=0. IHG irreducible reconstruction gives a representation over Â/Î with its local Hecke coefficient map. Uniqueness after fixing the residual basis is up to strict conjugacy. This asserts neither a lift to Â nor an integral action localization at an eigensystem appearing only through torsion in the next cohomology group; such systems use the closed simultaneous torsion action ring.

**Hypotheses.** The finite field contains the eigensystem and is identified with the residual coefficient field after the required finite extension; absolute irreducibility is tested after algebraic closure. The local ring is supported at the chosen system and retains the nilpotent error quotient. Use the local Hecke coefficient map in its characteristic identity, not the original residual-field map ψ.

**Construction or proof.**

1. Factor the field-valued map through the nilpotent quotient and invoke IHG semisimple reconstruction with finite-image continuity.
2. Choose a supported local action ring and apply completion/coefficient change to its determinant and error ideal; record Î^N=0 and the identified residual representation.
3. Use henselian absolutely irreducible reconstruction over Â/Î. For each finite coefficient quotient, continuity of the determinant gives an open normal group kernel; its full-matrix Cayley–Hamilton realization factors through the same finite quotient. Hence the reconstructed matrices are continuous in the inverse-limit coefficient topology. Compare by strict conjugacy after fixing the residual basis; no lifting through Î is asserted.

**Needs.** TorsionCohomologyInfrastructure:TC.4/finite-torsion-assembly; TorsionCohomologyInfrastructure:TC.4/integral-and-inverse-system-transport; IntegralHeckeAndGaloisDeterminants:IHG.5/residual-semismple-specialization; IntegralHeckeAndGaloisDeterminants:IHG.5/residual-irreducible-quotient-lift; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-iff-open-kernel.

**Acceptance.** Keep semisimple field reconstruction separate from henselian local reconstruction. Uniqueness is a conjugacy statement. If Î≠0, the codomain remains GL_n(Â/Î); absolute irreducibility alone does not produce a representation over Â. A torsion-only eigensystem uses the simultaneous torsion ring, not an unsupported integral maximal ideal.

**Source.** Scholze, Corollaries 5.4.3–5.4.4, p. 1060; Remark 5.4.5, pp. 1060–1061; Chenevier Theorem 2.22(i), pp. 34–35 (via IHG). Corollaries 5.4.3–5.4.4 reconstruct respectively a semisimple residual representation and an irreducible local representation over a nilpotent quotient. They do not lift the latter to the full integral Hecke algebra.

### Rank one and two normalization checks

**Target TC.4/normalization-validations** (application). For GL₁, with geometric reciprocity, an unramified finite-order class-field character ψ evaluated by the standard double-coset U₁ gives P_v=1−q_vψ(Frob_v)X. The Scholze-normalized output is ε⁻¹ψ, while the standard reciprocal convention gives ψ. For GL₂ over Q on modular-curve cohomology, with integral double-coset eigenvalues t_ℓ,d_ℓ, IHG’s monic polynomial is Y²−t_ℓY+ℓd_ℓ, its reciprocal is 1−t_ℓX+ℓd_ℓX², and the Scholze polynomial is 1−ℓt_ℓX+ℓ³d_ℓX². Validate the four-route theorem by this ε⁻¹ twist and by inverse Frobenius conversion when using arithmetic Frobenius. These are normalization tests of supplied class-field/modular objects, not additional constructions of them.

**Hypotheses.** ℓ∉S and ℓ≠p so all powers are units in the coefficient ring. U_i are the standard double-coset generators; they are not the normalized e_i. Tau Ceti's ClassFieldTheory uses arithmetic Frobenius; the geometric reciprocity used in the rank-one check is its composite with inversion.

**Construction or proof.**

1. Apply the exact e_i versus U_i identity of TC.3.
2. Check rank one with global/local reciprocity and ε(Frob_geom)=q⁻¹.
3. Check rank two by the actual modular correspondence’s t_ℓ,d_ℓ action, then compare reciprocal and inverse characteristic polynomials.

**Needs.** TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials; TorsionCohomologyInfrastructure:TC.4/four-route-compatibility; IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; ModularCurvesPartII:R14.3.

**Acceptance.** The ε⁻¹ twist and inverse Frobenius are two distinct operations. For n=2,q=2,t=3,d=5 recover 1−6X+40X².

**Source.** Scholze, §5.2 Satake calculations, pp. 1040–1044; §5.4 polynomial, p. 1057. The §5.4 polynomial is compared explicitly with IHG’s spherical convention in ranks one and two; the arithmetic modular-curve instance remains a supplier-carrier validation.

### Arithmetic nonlifting check

**Target TC.4/arithmetic-nonlifting-validation** (application). Take F=Q,n=1,p=2,K=Ẑˣ and the trivial integral coefficient lattice. With the source’s stack convention the arithmetic quotient is \[point/{±1}]. Its H¹ with Z₂ coefficients is zero, but H¹ with F₂ coefficients is F₂ and its Bockstein maps isomorphically to H²(Z₂)\[2]. Thus this actual arithmetic torsion class has no integral H¹ lift. At every odd ℓ the rank-one tame generator acts as identity and the extracted mod-2 determinant is trivial, since q_ℓ≡1 mod2. The universal coefficient diagram still commutes and the simultaneous finite-coefficient kernel is contained in the integral kernel. As a separate algebraic diagnostic, the two-term integral complex Z --2→ Z has a mod-2 degree-zero class 1 with no integral degree-zero lift.

**Hypotheses.** Do not silently replace the nonneat stack quotient by its coarse point, which loses the class. The two-term complex diagnostic supplements rather than replaces the arithmetic example.

**Construction or proof.**

1. Identify Qˣ\\(Rˣ/(R_>0·{±1})×A_fˣ/Ẑˣ) with the single orbit and stabilizer {±1}.
2. Compute cyclic group cohomology via the alternating zero/multiplication-by-2 resolution and its Bockstein.
3. Evaluate odd-prime GL₁ Hecke action and the character polynomial; compare with UCT and all four routes.

**Needs.** TorsionCohomologyInfrastructure:TC.4/normalization-validations; TorsionCohomologyInfrastructure:TC.4/integral-and-inverse-system-transport; CompletedCohomologyPartII:CC.2/coefficient-bockstein-comparison; ArithmeticLocallySymmetricSpaces:ALS.0.

**Acceptance.** H¹(F₂)≠0 although H¹(Z₂)=0. Using the coarse quotient or assuming all mod-p classes lift fails this test.

**Source.** Scholze, Stack convention, p. 1057; Corollary 5.4.2 proof, p. 1060; Remark 5.4.5, pp. 1060–1061; arithmetic example deduced from these conventions. The source’s stack convention and coefficient exact sequence support the independently computed GL_1/Q example. The group-cohomology calculation and the two-term-complex diagnostic are deductions, not a stated example in Scholze.

## Supplier extensions and completion gates

The seventeen requests below specify exact theorems or adapters on their owners’ objects. A missing specialization is not supplied by a structure field in this roadmap. These requests explain why the five stages remain planned rather than closed. No unassigned mathematical gap is hidden behind a general “comparison needed” label.

- **AdicSpacesPartII:R2:** Supply the O_K topologically finite type formal projectivity/ampleness criterion used in Lemma 2.1.1, completed-localization/generic-fibre compatibility, and comparison under common admissible refinements, without assuming O_K noetherian. Supply coherent localization on distinguished opens and proper formal Serre vanishing for projective topologically finite type formal schemes over O_C/adhesive valuation bases. F0/formal-serre-vanishing assumes a noetherian base and alone is insufficient. Prove integral H¹-vanishing and resulting reduction-surjectivity. Supply the finite-level topological cohomological dimension ≤d and its spectral inverse-limit transport, via all formal models/noetherian descent or Huber Proposition2.5.8, as used in Corollary4.2.2 pp.1023–1024. Include cohomology commuting with the constructible spectral-limit system. Consumed by TorsionCohomologyInfrastructure:TC.0/section-model-transport, TorsionCohomologyInfrastructure:TC.1/formal-cuspidal-lifting, TorsionCohomologyInfrastructure:TC.1/localized-cuspidal-sections, TorsionCohomologyInfrastructure:TC.2/geometric-amplitude.
- **AdicSpacesPartII:R3:** Extend the existing trace API to normal finite generically étale rings and integrally closed ideals: Tr(S)⊂R and Tr(integral closure of I in S)⊂I, under Lemma 4.3.2 hypotheses; prove localization and completion compatibility for the arithmetic charts. Consumed by TorsionCohomologyInfrastructure:TC.0/boundary-trace-transport.
- **PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed:** Extend the existing corrected quotient/strongly-closed API by the boundary reduction sequence on its actual plus-ring kernel: the target plus ring is p-torsion-free and R⁺→R_I⁺ is almost surjective, so reduction gives 0→I⁺/p^m→R⁺/p^m→R_I⁺/p^m→0 in the almost category, natural for compatible boundary pairs and coefficient reductions. Glue this on the actual sheaf carriers. The quotient construction itself is already owned by Q4, not newly requested. Consumed by TorsionCohomologyInfrastructure:TC.0/boundary-support-comparison.
- **PerfectoidShimuraVarieties:S2/genuine-to-image-comparison:** Supply the comparison of cusp sections/actual boundary ideals along the finite genuine-minimal-to-image compactification map required in Scholze p.1030. Do not replace it by a global isomorphism or normality of the image. Consumed by TorsionCohomologyInfrastructure:TC.1/formal-cuspidal-lifting.
- **PerfectoidSpaces:P0:** Supply the almost base change and faithful F_p-vector-space test V⊗(O_C/p)^a=0⇒V=0, plus exactness needed for Bockstein induction. Do not treat arbitrary almost-zero integral modules as zero. Consumed by TorsionCohomologyInfrastructure:TC.2/geometric-amplitude.
- **CompletedCohomologyPartII:CC.4:** Supply the actual finite projective completed support/chain complex at a torsion-free pro-p level, its Iwasawa duality hypotheses, and the tame action needed for Corollary 4.2.3. Consumed by TorsionCohomologyInfrastructure:TC.2/iwasawa-consequences.
- **PadicHodgeTheory:P8:local-rational/constructible-primitive-comparison:** Verify the finite-coefficient constructible primitive comparison for singular proper algebraic minimal compactifications with j!Z/p^m is natural for coefficient reduction, level pullback and finite étale interior traces. Its early primitive input precedes local-rational; no dependency on TC.2 or later P8 comparison is introduced. Consumed by TorsionCohomologyInfrastructure:TC.2/cech-comparison.
- **IntegralHeckeAndGaloisDeterminants:IHG.0:** Extend the existing polynomial-law/determinant API, as IntegralHeckeAndGaloisDeterminants Part II in its direction, by Lemma 5.3.13: any multiplicative group-algebra polynomial law decomposes over finitely many coefficient idempotents into homogeneous determinants and a constant-zero component. Supply characteristic uniqueness over all test algebras and the finite-weight formal-series carrier API; TC.3 retains only weight extraction. Placement: the owning layer must not require any TorsionCohomologyInfrastructure stage. IntegralHeckeAndGaloisDeterminantsPartII:IHR.3–IHR.7 import TC.2–TC.4, so this item belongs to the upstream IntegralHeckeAndGaloisDeterminants roadmap or to an IHR layer without TC prerequisites (IHR.1, IHR.2 or a new early layer); placing it in IHR.3–IHR.7 would close a cycle through TC.3. Consumed by TorsionCohomologyInfrastructure:TC.3/finite-weight-series-factorization, TorsionCohomologyInfrastructure:TC.3/weighted-determinant-factors.
- **AutomorphicGaloisRepresentationsPartII:AG2.7:** Supply the exact regular polarized constituent input of Scholze Theorem 5.1.4 for CM and totally real constituents, including non-Shin-regular/non-finite-slope cases, its geometric-Frobenius cyclotomic normalization and integral coefficient descent. Use AG2.3 for regularity removal, not AG2.2 alone. Consumed by TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant.
- **ModularityAndLanglandsExtensions:ML.4:** Supply the precise Arthur (real) and Mok (general CM) classification/standard-transfer input of Scholze Theorem 5.1.2 with its actual assumptions; until supplied, these arithmetic applications explicitly assume it. This stage is absent from TC.3’s pure algebra prerequisite closure. Consumed by TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant.
- **EndoscopicTransferAndUnitaryTraceComparison:ET.7a:** Supply Shin’s cohomological base change for the unitary similitude groups via the appendix to Goldring, with its assembly through AG2.2/AG2.3, under Remark 5.4.6: F contains an imaginary quadratic field and S is pulled back from S_Q including p and all F/Q ramification. Consumed by TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity:** Use the existing global Artin map of Layer 11, with its local compatibility at finite and archimedean places and its arithmetic-Frobenius normalization, to attach to a finite-order character of G_F,S′ a finite-order idele class character trivial on the local units outside S′. The geometric-Frobenius convention of Scholze pp.1046–1047 is obtained in TC by composing with inversion; the realization of the character on covers of arithmetic quotients is an ALS input (ALS.0 components, ALS.3 level trace and character twist), not a class-field-theory request. Consumed by TorsionCohomologyInfrastructure:TC.3/auxiliary-character-realization, TorsionCohomologyInfrastructure:TC.4/normalization-validations.
- **ArithmeticLocallySymmetricSpaces:ALS.4:** Extend the current boundary-complex plan by the integral finite-coefficient filtration of Caraiani–Le Hung §3 Proposition 3.3/Remark 3.4 and Scholze Theorem 5.4.1: prove the CM and algebraic-lattice versions using actual nilmanifold complexes, derived Künneth including Tor, Hecke/Satake coefficient twists, and filtration depth bounded only by \[F:Q],n. Do not use the characteristic-zero Nomizu–Kostant formula or the Galois-assuming gln-boundary-eisenstein node. Consumed by TorsionCohomologyInfrastructure:TC.4/integral-boundary-induction.
- **ArithmeticLocallySymmetricSpaces:ALS.0:** Supply the finite-level arithmetic stack/group-cohomology carrier at nonneat K, including the GL₁/Q level Ẑˣ quotient with stabilizer {±1}; it must retain stabilizer cohomology. Consumed by TorsionCohomologyInfrastructure:TC.4/arithmetic-nonlifting-validation.
- **ModularCurvesPartII:R14.3:** Use the actual integral modular-curve Hecke correspondences with t_ℓ,d_ℓ and the lattice comparison to ALS/CC. The polynomial used here is the existing IHG.3 normalization followed by the explicitly computed ε⁻¹ twist. Consumed by TorsionCohomologyInfrastructure:TC.4/normalization-validations.
- **IntegralHeckeAndGaloisDeterminants:IHG.1:** Add in the IHG Part II direction the continuous determinant residual-kernel factorization of Chenevier Lemma 3.8 (arXiv:0809.0415v2, §3.1, p.43). Let G be profinite, k a finite field of characteristic p, ρ̄:G→GL_d(k) a continuous semisimple residual representation, A a commutative profinite local W(k)-algebra with residue field k, and D a continuous determinant deforming detρ̄. If H is the smallest closed normal subgroup of kerρ̄ such that kerρ̄/H is pro-p, prove D factors through A\[G/H]. For a finite Artinian local A, pass to the faithful Cayley–Hamilton quotient: its residual radical is nilpotent and 1+rad is a finite p-group; then pass to profinite quotients. State continuity and coefficient-change compatibility and application factorwise to a finite product of local rings. The field-only IHG.1/nilpotent-ideal-kernel theorem and the group-only maximalProPQuotient.lift do not supply this conclusion. Placement: the owning layer must not require any TorsionCohomologyInfrastructure stage. IntegralHeckeAndGaloisDeterminantsPartII:IHR.3–IHR.7 import TC.2–TC.4, so this item belongs to the upstream IntegralHeckeAndGaloisDeterminants roadmap or to an IHR layer without TC prerequisites (IHR.1, IHR.2 or a new early layer); placing it in IHR.3–IHR.7 would close a cycle through TC.3. Consumed by TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation.
- **IntegralHeckeAndGaloisDeterminants:IHG.5:** Import the arbitrary-family common-exponent theorem already stated in current TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants, Layer 5, Nilpotence in a product of coefficient rings: a jointly injective family f_i:A→B_i with (J.map f_i)^N=0 for all i implies J^N=0, without a finite-index premise. Apply it to the closed simultaneous action ring. This is an adapter to existing upstream work, not a request to plan that theorem again. The older atlas IHG.5/nilpotent-product-bound node states only a finite family and cannot alone justify the infinite product. Consumed by TorsionCohomologyInfrastructure:TC.4/integral-and-inverse-system-transport.

The early primitive input is before P8:local-rational; it is not obtained from a later P8 comparison that already consumes TC.2. The logarithmic primitive result belongs to the supplier’s T6:log-primitive stage and is not required by this paper’s constructible j! comparison. A future logarithmic application must import that exact result rather than treating the étale comparison here as logarithmic.

## Source coverage and corrections

This table routes every assigned extraction item, including review additions 75, 118, 122 and 126. An imported source result is not another node here. Detailed hypotheses in the named supplier remain binding, including resolution/normality for good triples and the restricted genus-one cases.

| Item | Published locator | Target or existing owner |
| --- | --- | --- |
| PAPER-SCHOLZE-15/3 | §1, Conjecture 1.0.2 and Theorem 1.0.3, pp. 947–948 | TorsionCohomologyInfrastructure:TC.4/finite-torsion-assembly; TorsionCohomologyInfrastructure:TC.4/residual-and-local-specialization |
| PAPER-SCHOLZE-15/4 | §2.1, Lemma 2.1.1, pp. 953–954 | TorsionCohomologyInfrastructure:TC.0/section-model-transport |
| PAPER-SCHOLZE-15/5 | §2.1, Lemma 2.1.1, pp. 953–954 | TorsionCohomologyInfrastructure:TC.0/section-model-transport |
| PAPER-SCHOLZE-15/6 | §2.1, Lemma 2.1.2 and proof, pp. 954–955 | TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal |
| PAPER-SCHOLZE-15/18 | §2.3.1, Proposition 2.3.2 and Remark 2.3.3, pp. 958–961 | PerfectoidShimuraVarieties:S1/perfectoid-hebbarkeitssatz |
| PAPER-SCHOLZE-15/19 | §2.3.1, Lemma 2.3.4, p. 961 | PerfectoidShimuraVarieties:S1/perfectoid-hebbarkeitssatz |
| PAPER-SCHOLZE-15/20 | §2.3.2, Corollary 2.3.5, p. 962 | PerfectoidShimuraVarieties:S1/hasse-locus-hebbarkeitssatz |
| PAPER-SCHOLZE-15/21 | §2.3.2, Lemma 2.3.6 and Remark 2.3.7, p. 963 | PerfectoidShimuraVarieties:S1/hasse-locus-hebbarkeitssatz |
| PAPER-SCHOLZE-15/22 | §2.3.3, Definition 2.3.8 and the paragraph after it, pp. 966–967 | PerfectoidShimuraVarieties:S1/good-triple; TorsionCohomologyInfrastructure:TC.0/bounded-lattice-extension |
| PAPER-SCHOLZE-15/23 | §2.3.3, Lemma 2.3.9, p. 967 | PerfectoidShimuraVarieties:S1/good-triple-stability |
| PAPER-SCHOLZE-15/24 | §2.3.3, Lemma 2.3.10, pp. 968–969 | PerfectoidShimuraVarieties:S1/good-triple-stability |
| PAPER-SCHOLZE-15/25 | §2.3.3, Lemma 2.3.11 and Corollary 2.3.12, pp. 969–970 | PerfectoidShimuraVarieties:S1/good-triple-stability |
| PAPER-SCHOLZE-15/36 | §3.2.2, Proposition 3.2.9, Lemma 3.2.10 and Remark 3.2.11, pp. 980–983 | PerfectoidShimuraVarieties:S1/hasse-blowup-hartogs |
| PAPER-SCHOLZE-15/49 | §3.2.5, Lemma 3.2.24 (and the standing assumption g ≥ 2 before it), pp. 995–997 | PerfectoidShimuraVarieties:S1/hartogs-for-finite-covers-of-anticanonical-tower |
| PAPER-SCHOLZE-15/51 | §3.2.5, the paragraph before Lemma 3.2.27, Lemma 3.2.27 and Corollary 3.2.28, pp. 998–999 | PerfectoidShimuraVarieties:S1/characteristic-p-base-triples-good |
| PAPER-SCHOLZE-15/53 | §3.2.5, Propositions 3.2.33–3.2.34, pp. 1000–1001 | PerfectoidShimuraVarieties:S1/gamma1-level-perfectoid |
| PAPER-SCHOLZE-15/54 | §3.2.5, Lemma 3.2.35 and Theorem 3.2.36, pp. 1001–1002 | PerfectoidShimuraVarieties:S1/full-level-anticanonical-perfectoid |
| PAPER-SCHOLZE-15/67 | §3.3, Theorem 3.3.18(v)–(vi), p. 1013, and its proof, pp. 1014–1015; Theorem 3.1.2(ii) (the identification of the pullback of ω with π\_HT^\*ω\_Fl), p. 972 | PerfectoidShimuraVarieties:S3/siegel-tautological-pullback; TorsionCohomologyInfrastructure:TC.1/period-lattice-transport |
| PAPER-SCHOLZE-15/71 | §4.1, Theorem 4.1.1(v), p. 1019 | PerfectoidShimuraVarieties:S3/hodge-levi-pullback; TorsionCohomologyInfrastructure:TC.1/period-lattice-transport |
| PAPER-SCHOLZE-15/72 | §4.2, p. 1020, and the proof of Theorem 4.2.1, pp. 1021–1023 | TorsionCohomologyInfrastructure:TC.0/integral-boundary-ideal; TorsionCohomologyInfrastructure:TC.0/boundary-support-comparison |
| PAPER-SCHOLZE-15/73 | §4.2, Theorem 4.2.1, pp. 1020–1021; proof pp. 1021–1023 | TorsionCohomologyInfrastructure:TC.2/cech-comparison |
| PAPER-SCHOLZE-15/74 | §4.2, Corollary 4.2.2, p. 1023; Theorem 1.0.7, p. 950 | TorsionCohomologyInfrastructure:TC.2/geometric-amplitude |
| PAPER-SCHOLZE-15/75 | §4.2, Corollary 4.2.3, p. 1024 | TorsionCohomologyInfrastructure:TC.2/iwasawa-consequences |
| PAPER-SCHOLZE-15/76 | §4.3, Theorem 4.3.1, p. 1025; Theorem 1.0.5, p. 949 | TorsionCohomologyInfrastructure:TC.2/hecke-continuity |
| PAPER-SCHOLZE-15/77 | §4.3, Lemma 4.3.2, pp. 1025–1026 | TorsionCohomologyInfrastructure:TC.0/boundary-trace-transport |
| PAPER-SCHOLZE-15/78 | §4.3, Lemma 4.3.3 and proof, pp. 1026–1028 | TorsionCohomologyInfrastructure:TC.2/boundary-ideal-colimit |
| PAPER-SCHOLZE-15/84 | §5.1, Lemma 5.1.6(i), pp. 1034–1035 | TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials |
| PAPER-SCHOLZE-15/85 | §5.1, Lemma 5.1.6(ii)–(iii), pp. 1034–1035 | TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials |
| PAPER-SCHOLZE-15/89 | §5.1, Corollary 5.1.11, p. 1038 | IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation; TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant |
| PAPER-SCHOLZE-15/92 | §5.2, pp. 1039–1040 | ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps |
| PAPER-SCHOLZE-15/93 | §5.2, Lemma 5.2.3 and Corollary 5.2.4, p. 1041 | ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison; TorsionCohomologyInfrastructure:TC.3/siegel-boundary-specialization |
| PAPER-SCHOLZE-15/94 | §5.2, Lemma 5.2.5(i), p. 1042 | TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials |
| PAPER-SCHOLZE-15/95 | §5.2, Lemma 5.2.5(ii)–(iii), pp. 1042–1043 | TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials |
| PAPER-SCHOLZE-15/96 | §5.2, the paragraph before Corollary 5.2.6, p. 1043 | TorsionCohomologyInfrastructure:TC.3/satake-ambient-polynomials |
| PAPER-SCHOLZE-15/97 | §5.2, Corollary 5.2.6, p. 1044 | TorsionCohomologyInfrastructure:TC.3/ambient-interior-error |
| PAPER-SCHOLZE-15/98 | §5.2, Corollary 5.2.7, p. 1045 | TorsionCohomologyInfrastructure:TC.3/ambient-interior-error |
| PAPER-SCHOLZE-15/99 | §5.3, Theorem 5.3.1, p. 1046 | TorsionCohomologyInfrastructure:TC.3/levi-interior-determinant |
| PAPER-SCHOLZE-15/100 | §5.3, proof of Theorem 5.3.1, pp. 1046–1047 | TorsionCohomologyInfrastructure:TC.3/auxiliary-character-realization |
| PAPER-SCHOLZE-15/101 | §5.3, Lemmas 5.3.2–5.3.3, pp. 1047–1048 | TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation |
| PAPER-SCHOLZE-15/102 | §5.3, Lemma 5.3.4 and Corollary 5.3.5 with proof, pp. 1048–1050 | TorsionCohomologyInfrastructure:TC.3/cyclotomic-factor-continuation; TorsionCohomologyInfrastructure:TC.3/twisted-product-separation |
| PAPER-SCHOLZE-15/103 | §5.3, Lemmas 5.3.6–5.3.7, pp. 1050–1052 | TorsionCohomologyInfrastructure:TC.3/laurent-family-realization; TorsionCohomologyInfrastructure:TC.3/laurent-coefficient-ideal |
| PAPER-SCHOLZE-15/104 | §5.3, Lemma 5.3.8 and Remark 5.3.9, pp. 1052–1053 | TorsionCohomologyInfrastructure:TC.3/weighted-determinant-factors |
| PAPER-SCHOLZE-15/105 | §5.3, Lemma 5.3.10 and proof, pp. 1053–1054 | TorsionCohomologyInfrastructure:TC.3/finite-weight-series-factorization |
| PAPER-SCHOLZE-15/106 | §5.3, Lemmas 5.3.11–5.3.12, pp. 1054–1056 | TorsionCohomologyInfrastructure:TC.3/weighted-unit-law |
| PAPER-SCHOLZE-15/107 | §5.3, Lemma 5.3.13, pp. 1056–1057 | IntegralHeckeAndGaloisDeterminants:IHG.0; TorsionCohomologyInfrastructure:TC.3/weighted-determinant-factors |
| PAPER-SCHOLZE-15/109 | §5.4, Theorem 5.4.1, p. 1058 | TorsionCohomologyInfrastructure:TC.4/finite-torsion-assembly |
| PAPER-SCHOLZE-15/111 | §5.4, Corollary 5.4.3, p. 1060 | TorsionCohomologyInfrastructure:TC.4/residual-and-local-specialization |
| PAPER-SCHOLZE-15/112 | §5.4, Corollary 5.4.4, p. 1060 | TorsionCohomologyInfrastructure:TC.4/residual-and-local-specialization |
| PAPER-SCHOLZE-15/113 | §5.4, Remark 5.4.5, p. 1061 | TorsionCohomologyInfrastructure:TC.4/integral-and-inverse-system-transport |
| PAPER-SCHOLZE-15/114 | §5.4, Remark 5.4.6, p. 1061 | TorsionCohomologyInfrastructure:TC.3/classical-ambient-determinant |
| PAPER-SCHOLZE-15/118 | §4.3, proof of Theorem 4.3.1, pp. 1029–1031 (announced in §1, p. 951) | PerfectoidShimuraVarieties:S3/hodge-tate-formal-models; TorsionCohomologyInfrastructure:TC.1/reduction-atlas-transport |
| PAPER-SCHOLZE-15/122 | §5.4, proof of Theorem 5.4.1, p. 1058, integral boundary induction and its reference to Caraiani–Le Hung §3 | TorsionCohomologyInfrastructure:TC.4/integral-boundary-induction |
| PAPER-SCHOLZE-15/126 | §4.2, proof of Corollary 4.2.2, pp. 1023–1024 | TorsionCohomologyInfrastructure:TC.2/geometric-amplitude |

The following findings are stated in our own words, with the verdict of the second independent review; the packet keeps the earlier verdicts in each entry. E1 is rejected and is not used as an erratum. E2–E18 are confirmed; E17 is in the form the revision gave it, verified on p.954. E19 (the auxiliary prime of Corollary 5.2.6) and E20 (the misplaced proof of Corollary 5.4.4) are new. E21–E28 are findings of the reviewed paper extraction at locators this roadmap cites, checked again on the published pages.

- **TorsionCohomologyInfrastructure/E1 — Alleged localization product in Lemma 2.1.1 proof; published proof is on pp.953–954 (rejected):** Rejected again: the published proof on p.954 displays no localization product, so there is no wrong index set to correct. The real slip on that page is E17.

- **TorsionCohomologyInfrastructure/E2 — Remark 2.2.4 and Definition 2.2.6, pp.956–957 (confirmed):** Import the corrected closed quotient and strong-closed notions from PerfectoidQuotients Q4, as recorded in the reviewed extraction: Bhatt–Scholze Prisms Theorem7.4/Remark7.5 and Étale cohomology of diamonds Definition5.7(ii)/Theorem5.8. The later quotient theorem and plus-ring condition correct these source statements; this run imports that owner rather than reconstructing the proof. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E3 — Chart-orbit assertion, p.1008; Theorem 3.3.18(i), pp.1012–1014; Theorem 4.1.1(i), pp.1019–1020; use on p.1030 (confirmed):** Use only Lagrangian coordinate subsets, one of each paired symplectic basis coordinate. The g=2 nonadmissible chart p₁₃≠0 is nonempty but its reduction cell has p³−p points, whereas an admissible graph cell has p³. An integral symplectic coordinate change would preserve those counts. Thus nonisotropy of the coordinate plane alone is not an emptiness proof. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E4 — Corollary 4.2.3 proof, p.1024 (confirmed):** Choose the minimum codimension among violating modules. The spectral-sequence comparison requires the lower-codimension terms not to interfere. Reach: the proof.

- **TorsionCohomologyInfrastructure/E5 — Paragraph after Corollary 4.2.3, p.1024 (confirmed):** Use l₀=0 and q₀=d. For an equal-rank group l₀=rank G(R)−rank K_∞=0, and q₀=(dim_R X−l₀)/2=d for the Shimura varieties here; the printed values are exchanged. Reach: the proof.

- **TorsionCohomologyInfrastructure/E6 — Theorem 5.1.2 constituent segment, p.1033 (confirmed):** The final exponent is (ℓ\_i−1)/2 and the constituent is a representation of GL_n_i. A segment of length ℓ\_i runs from (1−ℓ\_i)/2 to (ℓ\_i−1)/2 in unit steps. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E7 — Corollary 5.1.11, p.1038 (confirmed):** Choose a>n for Sp and a≥n for U when taking all weights ak,k≥1. The initial term k=1 must already satisfy Proposition5.1.1’s range. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E8 — Unitary ambient polynomial displays (ii) and (iii), pp.1042–1043 (confirmed):** The coefficient of X^(2n) has positive sign; use P_v(X)Q_vc(q_vX). The two degree-n top coefficients have product sign (−1)^(2n)=1. Reach: the proof.

- **TorsionCohomologyInfrastructure/E9 — Lemma 5.3.6 setup, pp.1049–1050 (confirmed):** Require I₀,ℓ=I₀ as well as ℓ∤\[F̃:F]. Otherwise the character family has no common chosen coefficient quotient. Reach: the proof.

- **TorsionCohomologyInfrastructure/E10 — Lemma 5.3.6 proof, p.1051 (confirmed):** Use Ĩ\_χ=I₁+I_χ and restrict to characters with Ĩ₀,χ=I₀. The untwisted and twisted determinants must be compared modulo both errors. Reach: the proof.

- **TorsionCohomologyInfrastructure/E11 — Lemma 5.3.10 proof, p.1053 (confirmed):** Take the first nonzero coefficient order r and compare modulo X^(r+1). At order one the displayed induction otherwise does not start. Reach: the proof.

- **TorsionCohomologyInfrastructure/E12 — Lemma 5.3.10 polynomiality proof, pp.1053–1054 (confirmed):** Expand the remaining product in T with polynomial coefficients in X, after isolating the least weight. Q₀∈S\[X] can be divided out coefficientwise in this expansion while retaining polynomial X-coefficients. Reach: the proof.

- **TorsionCohomologyInfrastructure/E13 — Proof of Lemma 5.3.8, multiplicativity of D^(m), the display before Lemma 5.3.12, p.1055 (confirmed):** Use the inverse of (1−Ux)(1−Uy), namely (1−Uy)⁻¹(1−Ux)⁻¹, when forming the kernel element. With the corrected order its specialization at U=1 is identity, as the kernel argument requires. Reach: the proof.

- **TorsionCohomologyInfrastructure/E14 — Corollary 5.4.4, p.1060 (confirmed):** Use σ\_m and the local Hecke coefficient map. Its right-hand side is in the local integral Hecke quotient, not the residual field. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E15 — Corollary 5.4.2 proof, p.1060 (confirmed):** Reverse the containment: the simultaneous finite-coefficient kernel is contained in the integral action kernel. UCT injects integral cohomology modulo p^m into finite-coefficient cohomology; its next-degree Tor term prevents the converse in general. Reach: the proof.

- **TorsionCohomologyInfrastructure/E16 — Remark 5.4.5, p.1061 (confirmed):** Use products over m, and over (i,m), then the closed image. Identity has infinitely many nonzero components, so it does not belong to the direct sum. Reach: the proof.

- **TorsionCohomologyInfrastructure/E17 — Lemma 2.1.1 proof, p.954, choosing the function defining an intersection unit locus (confirmed):** Use (i) for bounded section ratios and (ii) for the unit-locus description of overlaps. For i∈J and J⊂J′, take the product of s_j^(i)/s_i^(i) over j∈J′\\J. Condition (i) bounds the ratios; (ii) identifies where they have absolute value one. Later on the page the reduced-section gluing already correctly cites the overlap bound (iii). There are three numbered hypotheses in the published lemma. Reach: nothing.

- **TorsionCohomologyInfrastructure/E18 — Author PDF, §3 Remark 3.1, p.8 (finding scoped to this author version) (confirmed):** Use the actual integral/mod-p nilmanifold cochain complex and its Levi/Hecke action. An exterior-power identification needs additional hypotheses and a comparison theorem; it does not follow from neatness. Take GL₃/Q, the full upper unipotent U, principal level 3 and p=5. Its lattice has coordinates a,b,c in 3Z and commutators in the central 9Z. Its abelianization is Z²⊕Z/3, so H¹(U-lattice,F₅) has dimension 2. The displayed exterior first power of Lie(U) has dimension 3. Principal level 3 is neat, hence meets the level hypothesis. Reach: a stated result.

- **TorsionCohomologyInfrastructure/E19 — Corollary 5.2.6 proof, p.1044 (arXiv v2: proof of Corollary V.2.6, p.90; same text) (confirmed):** For each ℓ the argument gives J_ℓ, with J_ℓ^(d+1)=0, only in the Hecke image away from S⁺∪{ℓ}, and a determinant unramified outside S∪{ℓ}. Since the Hecke image A is finite, infinitely many ℓ share the extended ideal J=J_ℓA; for two of them the determinants over A/J agree at all Frobenius outside S∪{ℓ₁,ℓ₂}, hence coincide, are unramified at ℓ₁ and ℓ₂, and give the statement for S with the same exponent d+1. The Hochschild–Serre sequence for the level-ℓ tower is equivariant only for Hecke operators away from ℓ, so neither the filtration nor the determinant controls the operators at ℓ; gluing two primes without the stabilization only gives an ideal of exponent 2d+1. Reach: the proof. Not found corrected elsewhere.

- **TorsionCohomologyInfrastructure/E20 — Remark 5.4.5 and the proof printed after it, p.1061 (arXiv v2: Remark V.4.5, p.104; same layout) (confirmed):** That proof is the proof of Corollary 5.4.4; it belongs before Remark 5.4.5, which says only that the same proof gives the stronger statements. The proof uses the irreducibility of σ\_ψ and produces σ\_m over the localized ring, which is exactly the content of Corollary 5.4.4. Reach: nothing. Not found corrected elsewhere.

- **TorsionCohomologyInfrastructure/E21 — Lemma 5.2.2, p.1038 (confirmed):** The projection is X^P_(K_P)→X^M_(K^M_P). The lemma's spaces are indexed by compact open subgroups; X_P is not a level. Reach: nothing.

- **TorsionCohomologyInfrastructure/E22 — Paragraph before Lemma 5.2.3, p.1041 (confirmed):** The embedding is X^M_(K^M)→X^P_(K^P). The target must be the stratum X^P_(K^P), of which the Levi space is a section. Reach: nothing.

- **TorsionCohomologyInfrastructure/E23 — Theorem 4.3.1 proof, p.1030 (confirmed):** Use Ṽ\_(JK_p), the preimage in the genuine minimal compactification, in both places. Earlier on the same page the continuity statement and the localization are for Ṽ\_(JK_p); the formal model and 𝔍 live on the genuine compactification. Reach: nothing.

- **TorsionCohomologyInfrastructure/E24 — Remark 5.1.5, p.1034 (confirmed):** χ=|·|^(n−1−k). From (Π^∨)^c≅Π one gets (Π′^∨)^c≅Π|·|^(−(k+1−n)/2)=Π′|·|^(n−1−k). Reach: nothing.

- **TorsionCohomologyInfrastructure/E25 — §5.4 setup paragraph, p.1057 (confirmed):** K_S⊂∏\_(v∈S)GL_n(O_Fv) is any compact open subgroup and K^S=∏\_(v∉S)GL_n(O_Fv). Duplicated phrase; the arXiv v2 wording is correct. Reach: nothing.

- **TorsionCohomologyInfrastructure/E26 — Theorem 4.1.1 proof, first displayed limit, p.1020 (confirmed):** The limit runs over K^p′⊂G′(A_f^p), the Siegel group. The spaces 𝒴\*\_(K^p′) are Siegel spaces, defined for levels of G′. Reach: nothing.

- **TorsionCohomologyInfrastructure/E27 — Theorem 4.1.1(i) and the end of its proof, pp.1018–1020 (confirmed):** The identification of R⁺\_(K^p) with the p-adic completion of the colimit of the finite-level plus rings, and the descent of V_J to a finite-level affinoid, need an argument; the perfectoid supplier provides it. Lemma 4.3.3's injectivity uses exactly this colimit description, so it cannot be left implicit. Reach: the proof.

- **TorsionCohomologyInfrastructure/E28 — Theorem 3.3.18(vi) proof, last paragraph, p.1015 (confirmed):** It does not meet U minus the boundary, so it is an open subset contained in the boundary, hence empty. On U minus the boundary |h|≥|p|^C>|p|^(C+1). Reach: nothing.

For the E3 chart count, write a basis of the nonadmissible cell as (1,a,0,b),(0,c,1,d). Isotropy imposes bc−ad=1. Over F_p this gives p³−p choices; an admissible Lagrangian graph cell instead has three unrestricted symmetric-matrix entries and p³ choices. Direct enumeration gives 24 versus 27 at p=3 and 120 versus 125 at p=5. An integral symplectic change of coordinates preserves the reduction counts, so these cells cannot be identified that way.

E18 is limited to the hashed Caraiani–Le Hung author PDF. The previous review could not obtain the journal text; no journal collation is claimed. Actual nilmanifold cochains, their Levi/Hecke actions and derived Künneth terms remain the ALS contract.

## Suggested Lean and validation scope

The suggested file states only what the pinned carriers support: the light weighted polynomial formula and its API, the end separation theorem, polynomial normalization examples, an existing matrix-characteristic comparison, and the two-term nonlifting diagnostic. The actual arithmetic stack example remains a target on ALS’s carrier. The geometry, formal models, almost sheaves, completed support complexes and full determinant-extraction law remain reader targets until their suppliers expose their types. No replacement geometric or determinant structures are introduced.

Every definition/construction above has at least three use-derived API entries and three discriminating tests. The file is kept compact and states milestones; it does not develop a sequence of auxiliary lemmas. Elaboration validates the signatures, not the unimplemented proofs. The handoff records the actual compiler and validator outcomes.

The packet’s planets select at most six key objects/results per stage. Every target has its exact source, hypotheses, prerequisite chain and acceptance checks, and every stage has a remaining-work record. Implementation must discharge the supplier requests, prove the transport maps on their actual objects, and verify the four routes before claiming proof closure.

Sources were accessed on 2026-10-14. The published Scholze PDF has SHA256 ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16. The additional [Caraiani–Le Hung author PDF](https://www.ma.imperial.ac.uk/~acaraian/papers/complexconjugation.pdf) was read at §3, printed pp.6–9; its checksum and exact edition are recorded in the packet. Chenevier’s [0809.0415v2](https://arxiv.org/pdf/0809.0415v2) was read at Corollary 1.14, p.14, and Lemma 3.8, §3.1, p.43; its exact-version checksum is in the packet. Scholze’s [arXiv v2](https://arxiv.org/pdf/1306.2070v2) was read only to compare the passages of E19 and E20. All mathematical text here is original wording organized by library targets, not a section-by-section source summary.
