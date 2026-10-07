# Relative Fargues–Fontaine curves and period geometry

This roadmap constructs the Fargues–Fontaine period spaces for a perfectoid base over a finite field and a nonarchimedean local coefficient field. It develops integral period domains, generic annuli, Frobenius quotients, effective Cartier divisors, their formal neighbourhoods, rank-one twists and the graded section algebra. Its final layer supplies linear Beauville–Laszlo gluing and transfers modifications to G-bundles. The constructions are functorial in the base and preserve ramified and equal-characteristic coefficients wherever the stated theorem covers them.

The starting point is the fixed-field, coefficient-field ℚ_p adic curve of [Adic Spaces](../../../content/tau-ceti/AdicSpaces/README.md), Layer 6. That roadmap supplies its own interval Huber pairs, topology, Frobenius and quotient sheaf. Here the corresponding specialization is compared with those objects. The new work is the relative base, the coefficient extension, the integral π=0 end, relative divisors and the patching interfaces. A field-case theorem about ℚ_p is an anchor for a comparison; a theorem over all coefficient fields requires its own proof and hypotheses.

This is a mathematical specification. Definitions have their reusable API and distinguishing examples, and named theorems have explicit proof inputs. Exact identifiers are included so that the specification also describes a dependency graph. The [suggested file](../suggested/RelativeFarguesFontaine.lean) proposes names and signatures; it claims no implementation. The mathematical statements in this document are definitive. Precise unfilled proof interfaces are recorded under [Closure interfaces](#closure-interfaces), with supplier requests collected in the [handoff](../handoff/ASM-RelativeFarguesFontaine.md).

## Scope and neighbouring owners

The upstream [Adic Spaces link map](../links/tauceti_TauCetiRoadmap_AdicSpaces.json) supplies the rational structure presheaf (Layer 3), sheaf criteria under their actual hypotheses (Layer 4), analytic gluing (Layer 5), and the ℚ_p field-case period charts (Layer 6). General completed tensor products, sheafy Tate/Kiehl descent and sousperfectoid arguments belong to **AdicSpacesPartII**, R0, R3 and R5. This roadmap supplies the coefficient and period-ring calculations to which those criteria apply. It keeps the two topologies on a common underlying Witt ring distinct.

The upstream [Local Fields and Ramification link map](../links/tauceti_TauCetiRoadmap_LocalFieldsRamification.json) supplies complete local coefficient fields and finite extensions from Layer 0, and maximal unramified extensions and their Frobenius from Layer 2. The Gauss-fibre inertia calculation also imports the inertia subgroup and exact sequence from Layer 4. Formal Lubin–Tate groups, their logarithm and torsion tower, and nonperfect-residue Cohen lifting need **LocalFieldsRamification, Part II** inputs; they are not inferred from the upstream unramified-extension layer. Cohen lifting also needs the full cotangent-complex obstruction theory of **DerivedDeRhamCohomology:DD.0**, rather than Mathlib’s naive cotangent complex.

**PerfectoidSpaces** owns perfectoid criteria, tilting and almost purity. The integral criterion needed on a root chart includes regularity, completeness and the precise quotient-Frobenius condition. **DiamondsAndVStacks** owns the v-site, diamonds, pre-adic functors of points and effective ordinary module descent. Almost vanishing alone is not effective ordinary descent. The requested D3 module-descent and D6 pre-adic extensions are explicit supplier contracts.

The accepted [RS-20 ownership](../restructure/RS-20.result.json) separates the early curve from **VectorBundlesAndIsocrystals**. VB1 owns the arbitrary-rank isocrystal-to-bundle tensor functor and arbitrary-bundle cohomology. VB2 owns ampleness, global generation, the global analytic-to-Proj comparison, tautological twists and classification/PID extensions. VB3 owns the properness, spatiality and cohomological smoothness of degree-one divisor moduli. RF3 constructs only rank-one twists, the graded algebra and the morphism on the section-covered open. These outward outputs are not prerequisites for the early quotient or its Cartier equations.

**BunGAndNewtonStrata:BG0** owns the equivalence between geometric torsors, cohomological torsors and exact tensor functors. RF4 imports the scheme and smooth integral versions it needs, then transfers linear gluing. The supplier must be independent of RF4; a reverse RF4 prerequisite in the dictionary creates a cycle. **GeometricSatakeAndFusion:GS0:loop-geometry** owns loop quotients, Grassmannians and their Hecke presentations; BG2 and the Hecke/shtuka layers consume the resulting G-modifications.

RF4’s linear lattice and punctured-Witt algebraicity exports support the **essential-surjectivity** part of **AInfCohomology:AI.2**. Breuil–Kisin–Fargues full faithfulness has an algebraic proof and is not assigned a blanket curve dependency. The no-leg/one-leg shtuka recovery used in the lattice comparison requires a foundation supplier independent of downstream HS2.

## Conventions

### Coefficients and Witt vectors

Fix a prime p, a residue cardinality q=p^f and a nonarchimedean local field E with residue field 𝔽_q. Its complete discrete valuation ring is O_E and its chosen uniformizer is π. The notation allows both mixed and equal characteristic. The affinoid base is S=Spa(R,R⁺), perfectoid over 𝔽_q; ϖ is a topologically nilpotent unit of R, lying in R⁺. General bases are handled by gluing over such affinoid opens.

For perfect input, W_{O_E}(R⁺) denotes the strict π-adically complete lift with residue R⁺, with the residue-field identification included. In equal characteristic this is R⁺[[π]]. In mixed characteristic, finite coefficient change tensors over the maximal unramified coefficient subring. It does not tensor two arbitrary O_E-actions without identifying that subring.

The arbitrary-algebra ramified Witt functor uses universal ghost polynomials in characteristic-zero coefficient situations. Ghost injectivity is only an argument on torsion-free universal inputs, not an axiom on every coefficient algebra. Coordinate extensionality and evaluation at torsion inputs are part of its API. A twisted polynomial Q must satisfy Q≡X^q modulo π. Its transported Teichmüller lift need not be multiplicative. The ordinary Teichmüller map [−] is multiplicative and is not an additive structural map R→W_{O_E}(R).

Write φ for the coefficient-compatible q-Frobenius. Coefficient changes, Teichmüller lifts and Frobenius must be compared with Mathlib’s p-typical Witt constructions at the exact ℚ_p specialization. A Lubin–Tate torsion tower and the coefficient-root tower used to perfect an integral chart are distinct constructions.

### Three period loci and their topology

Put A_inf,E=W_{O_E}(R⁺), with its weak (π,[ϖ])-adic topology. The integral period domain is

𝒴_S = Spa(A_inf,E,A_inf,E) ∖ V([ϖ]).

It retains the π=0 end. The unlocalized weak Witt ring is a Huber ring and need not be Tate. Its rational localizations and separated completions carry the specified Tate topologies; these are constructed before any Tate sheaf criterion is applied.

The generic domain is Y_S=𝒴_S∖V(π). Both π and [ϖ] are nonzero there. For the additional p-typical algebraicity comparison set E=ℚ_p, W=W(R⁺), and

Z_S = Spa(W,W) ∖ V(p,[ϖ]) = D(p) ∪ D([ϖ]).

Here D(a) means the locus where the valuation of a is nonzero. Z_S contains both 𝒴_S=D([ϖ]) and the crystalline end [ϖ]=0,p≠0. It is larger than the generic intersection D(p)∩D([ϖ]). Its two rational charts satisfy |[ϖ]|≤|p|≠0 and |p|≤|[ϖ]|≠0. Kedlaya’s A₁,A₂,A₁₂ and B₁,B₂,B₁₂ retain the ideals of definition in Definition 3.5; an isomorphism of underlying rings involving a primed chart is not automatically a homeomorphism. Proposition 3.6 gives stable uniformity for A₁,A₁₂,B₁,B₂,B₁₂,B₂′ and only uniformity for A₂.

RF0 owns Z_S and this chart/sheafiness input. RF4 owns the equivalence between vector bundles on its punctured algebraic and analytic spectra. RF0’s stable algebraicity comparison identifier is an import of that exact RF4 theorem. Freeness and extension across the omitted point have the valued-field hypotheses of Kedlaya 3.9; Example 3.14 excludes that conclusion over a general perfect Tate base.

The coefficient-root charts adjoin roots of the **whole ratio** π/[ϖ]. At level m use π_m,ϖ_m and s_m with π_m=ϖ_m s_m and s_{m+1}^p=s_m. The tilted coordinate t₁ has sharp π/[ϖ]; the resulting disc coordinate is t=ϖt₁. Independent roots without these relations do not specify the chart.

### Radii, quotient and base projection

On the generic domain define the real radius through the rank-one generalization of a valuation by log|[ϖ]|/log|π|. For higher-rank points use the equivalent rational power inequalities. Frobenius multiplies the radius by q. Replacing ϖ by ϖ^m multiplies this radius by m; the corresponding windows remain cofinal. Interval norm parameters are compared with this radius convention, rather than identified without the reciprocal-radius calculation.

The curve is the analytic Frobenius quotient X_S=Y_S/φ^ℤ, glued from wandering interval charts. Its diamond is given by the product formula followed by the equivariant Frobenius quotient. The natural projection |X_S|→|S| is continuous and qcqs in the stated affinoid scope. There is no adic structural morphism X_S→S obtained from Teichmüller representatives. Products and base-change assertions that use the base are stated on diamonds or on the explicit period-ring interfaces.

The twelve period-ring variants have their own radius, growth, plus and completion data. The sheaf theorem names all twelve, the acyclicity theorem its exact nine variants, and Kiehl descent its exact three cases. An all-E theorem transports each estimate through the stated coefficient comparison; replacing p by π in a formula does not prove that transport. Countable Stein arguments use complete Banach modules, dense restriction maps and a convergent correction, rather than algebraic Mittag–Leffler alone.

### Cartier divisors and completed neighbourhoods

A marked untilt determines θ and a principal regular kernel, locally generated by a primitive element ξ=π−a[ϖ]. An integral characteristic-p leg may have ξ=π. The norm estimate is proved on finite-level ordinary discs and transferred by approximation through boundary suprema; it does not assert arbitrary attainment of a perfected-chart spectral supremum.

Div^d is the v-sheafification of the symmetric **orbit sheaf**, with repeated legs retained. It is not the symmetric quotient stack with permutation stabilizers. Div^0 is terminal and represents the empty divisor. A sum of ordered primitive legs has equation ∏ξ_i. Permutation invariance descends its invertible ideal, not a preferred global generator. The early inverse degree criterion requires local factorization and fibre-length arguments independent of later Picard/Banach–Colmez classification.

For a closed Cartier divisor D with invertible ideal I_D, complete the **ambient** structure sheaf along I_D. Its sections, where the divisor is affinoid, are B_D⁺; puncturing this completion by the completed invertible ideal gives B_D. Completing O_D along its zero ideal does not give B_D⁺. A unit change of ξ gives the same intrinsic completion. Repeated powers I_D^m have cofinal adic topology but a different numbered filtration. Disjoint divisors give a Chinese-remainder product decomposition; colliding divisors retain multiplicity and do not give independent products.

Div^1 has the coefficient-base presentations Spd(E)/φ^ℤ over Perf_{𝔽_q} and Spd(Ê)/φ^ℤ after extending to Perf_{𝔽̄_q}. The spatial/proper/cohomologically smooth moduli theorem is a VB3 output. These coefficient bases and ownership boundaries also apply when transporting the projection properties.

The comparison with Mathlib’s PreTilt, Fontaine theta and BDeRhamPlus first identifies the marked geometric tilt, the p-localized theta kernel and the Cartier ideal. For finite mixed-characteristic E, select the embedding/factor and lift it successively by formal étaleness. Equal-characteristic completion is intrinsic to the Cartier ideal. Graded filtration pieces are tensor powers of the conormal line, and are not globally free without a trivialization. At one geometric generic leg the completed ring is a complete DVR with residue C♯. A multileg completion is not assigned that DVR property.

### Twists, graded algebra and modifications

The rank-one descent multiplier for O(n) is π^(−n)φ; its sections satisfy φ(f)=π^n f. The corresponding isocrystal has slope −n and the line bundle has degree +n. The lattice ξ^k B_D⁺ gives the modification O(−k), consistently with these signs. RF3 defines P=⊕_{n≥0}H⁰(X_S,O(n)) and reuses Mathlib’s Proj scheme. The algebraic standard-open isomorphism D₊(g)≅Spec of the degree-zero homogeneous localization is distinct from the ring homomorphism to analytic functions. RF3 constructs the latter and the resulting morphism on the section-covered open U. Proving U=X_S and the global comparison/twists belongs to VB2. The two crystalline-boundary charts and their Čech section input precede the mixed-characteristic Lubin–Tate divisor section.

An algebraic exact square R→R₁,R₂→R₁₂ means exactness of 0→R→R₁⊕R₂→R₁₂→0, with the difference as last map. Glueing data carry actual base-change identifications. Finite-projective recovery requires the universal comparison-surjectivity criterion and the maximal-ideal covering condition; an exact square by itself does not imply every proposed descent conclusion. Topological glueing squares remain AdicSpacesPartII’s specialization of this algebraic interface.

A Stacks glueing pair (R→R′,f) has isomorphisms modulo every f^n and bijections on f-power torsion. The completion version includes f regular. Completion is not assumed fpqc and no noetherian hypothesis is inserted into the general theorem.

A modification is an isomorphism off D, meromorphic along D. Its groupoid arrows are isomorphisms commuting with that identification. Extensionality is up to the specified isomorphism, not equality of differently chosen bundle objects. Pole bounds control both the map and its inverse. Local lattice gluing for a **globally given reference bundle** uses an affinoid chart cover of D; an affinoid divisor need not lie inside a single affinoid chart with a global equation. Effectivity for arbitrary complement data is a separate target with its exact missing input recorded below.

For a repeated divisor mD, an ℓ-bound at mD is an mℓ-bound at D. Given a k-bound at D, ceiling(k/m) is a sufficient bound at mD; claims about a least bound also require existence of that least bound. Composition at intersecting D₁,D₂ is meromorphic at D₁+D₂: kD₁+ℓD₂≤max(k,ℓ)(D₁+D₂). Independent local pieces form a product only for disjoint supports; a colliding chain retains its intermediate modification.

The unramified schematic B-pair theorem uses KL’s actual φ^a setting and the later VB2 scheme comparison. Flat quasicoherent sections use ordinary tensor products with the completed coefficient ring, not a completed tensor product for an arbitrary infinite module. For varying pairs (T,Ξ), the integral lattice T is retained as data: a rational automorphism multiplying by 1/p is not a ℤ_p-lattice automorphism.

For G-modifications, BG0 supplies the exact tensor dictionary in the required scheme/integral generality. Meromorphy over E is tested on a faithful representation using its tensor generator V⊕V∨; tensor operations propagate explicit degree bounds. The integral closed-immersion criterion is not inferred from the field theorem. Ordinary v-descent uses the smooth affine O_E scope of its source. Étale-local triviality in the cited theorem retains reductive G and the actual henselian approximation hypotheses.

## Layer overview and order

The first part develops RF0–RF3; the second develops RF4 and its two children. Aggregates RF0, RF2 and RF4 collect their children and do not introduce parallel copies of those constructions. The exact prerequisites listed at each target determine proof order within this overview. In particular the RF0 algebraicity interface points forward to its RF4 owner; it is not used to construct the early period charts. Within RF3, the boundary Čech input precedes the Lubin–Tate section.

| Layer | Owned outputs | Interfaces consumed elsewhere |
| --- | --- | --- |
| RF0:integral-Y (with RF0 coefficient aggregate) | Ramified Witt algebra, weak topology, integral charts, whole analytic p-typical locus, classical points and tilting map | Period domains, primitive Cartier equations; whole-locus charts to RF4 |
| RF0:annuli | Relative interval/Robba rings, norms, rational localization, sheaf/acyclicity and finite-étale interfaces | RF1 quotient and global period sheaves; section estimates |
| RF1 | Analytic Frobenius quotient, diamond product formula, functoriality and global period sheaves | Relative curve and its topological projection |
| RF2:integral-divisors | Effective Cartier legs/products, divisor v-sheaves and ambient ideal completions | B_D⁺, B_D and legs for RF4/GS0 |
| RF2:untilts | Marked primitive/untilt comparison, degree-one presentation, period completion and filtration | Intrinsic de Rham completions and local DVR comparison |
| RF3 | Rank-one twists, boundary sections, LT section, graded algebra and section-covered Proj map | Sign-compatible VB1/VB2 inputs |
| RF4:vector-bundles | Algebraic exact-square and Beauville–Laszlo gluing, modifications, B-pairs, lattice comparisons, p-typical punctured algebraicity | Linear gluing and AI.2 essential-surjectivity inputs |
| RF4:G-torsors | Meromorphic G-modifications, Tannakian transfer and structure-group/base/divisor compatibilities | G-bundle lattice modifications for GS0/BG2/HS |

## Sources and baseline

The source identifiers at individual targets resolve to the bibliography at the end. Edition-qualified locators matter: the 2017 and corrected 2018 Fargues–Fontaine author copies have different pagination; the Guo–Reinecke published PDF and arXiv v3 are separate source records. KL Foundations is arXiv v5, with the corrections in KL II Appendix A and its Theorem 3.3.13. Gabber–Ramero 5.4.21 is cited in the public arXiv v3 numbering. No identification with an unchecked printed-book locator is presumed.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declaration inventory below retains the exact inputs and their limited scope. WittVector is the p-typical carrier; AdicCompletion is an ideal-adic algebraic construction; Huber.Pair and spa provide valuation/ring-pair interfaces; BDeRhamPlus is the p-localized PreTilt completion. None alone supplies a relative perfectoid curve, a v-stack or effective period-bundle descent. The reviewed [library audit](../../../data/library-coverage.json) for GS0 loop/Witt geometry distinguishes those existing constructions from the missing relative divisor and patching theory.

### Existing declaration interfaces

| Baseline declaration | Supplied interface |
| --- | --- |
| `mathlib:AdicCompletion` | The inverse system completion of a module along powers of an ideal, with the ring structure for the ring itself. Cartier completion and analytic topology are compared explicitly. The I-adic completion of a module; with I = (f) it is the ring R-hat of the Beauville-Laszlo lemma and, for I the divisor ideal on an affinoid chart, the ring B^+_D. |
| `mathlib:AdicCompletion.of` | The canonical map M -> AdicCompletion I M, the first leg of the Beauville-Laszlo square. |
| `mathlib:Algebra.Etale` | Etale algebras. |
| `mathlib:Algebra.FormallyEtale.comp_bijective` | Bijectivity of AlgHom postcomposition to B/I for I²=0 and a formally etale source. Applied successively, not misread as a theorem for every ideal. |
| `mathlib:Algebra.FormallyEtale.of_isSeparable` | A separable field algebra is formally etale. It supplies the separable finite coefficient-field input after inverting p. |
| `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` | If A is formally smooth over R and S is I-adically complete, every R-algebra map A -> S/I lifts to A -> S. This is the step 'triviality modulo I_S implies triviality' for torsors over B^+ (FS VI.1.7). |
| `mathlib:Algebra.Smooth` | Smooth algebras; the coordinate ring of a torsor under a smooth group is smooth over the base. |
| `mathlib:AlgebraicGeometry.LocallyRingedSpace` | Ringed spaces with local stalks, the target category of the map on the section-covered open. |
| `mathlib:AlgebraicGeometry.Scheme` | Locally affine locally ringed spaces, including the existing projective spectrum scheme. |
| `mathlib:AlgebraicGeometry.projIsoSpec` | The locally ringed space of the standard positive-degree Proj open is isomorphic to Spec of HomogeneousLocalization.Away. This is an algebraic chart theorem; no analytic chart ring is asserted isomorphic to it. |
| `mathlib:BDeRham` | Mathlib's B_dR: BDeRhamPlus with the generators of ker(theta) inverted. The p-typical case of R_3. |
| `mathlib:BDeRhamPlus` | AdicCompletion of ker theta on the p-localized Witt ring for PreTilt O p. It agrees with the geometric period completion only after identifying the input, theta and Cartier ideals; characteristic-p input gives the zero localization. Mathlib's B_dR^+ of an integral perfectoid ring: the ker(theta)-adic completion of W(R-flat)[1/p]; zero if p = 0 in R. The p-typical case of the ring R_2 of Kedlaya-Liu Definition 8.9.4. |
| `mathlib:CategoryTheory.Equivalence` | Equivalences of categories: the gluing functors. |
| `mathlib:CategoryTheory.Functor.Monoidal` | Monoidal functors, the form of the exact tensor functors Rep G -> Bun. |
| `mathlib:CategoryTheory.MonoidalCategory` | Monoidal categories. |
| `mathlib:CommAlgCat.FiniteEtale` | The category of finite etale R-algebras, the FEt(R) of Kedlaya-Liu Corollary 1.3.10. |
| `mathlib:GradedAlgebra` | An internal decomposition of an algebra by submodules whose products add degrees; direct sum multiplication produces the external section algebra. |
| `mathlib:HenselianRing` | Henselian pairs and the instance that an I-adically complete ring is henselian along I. This is a carrier and elementary completeness input; it does not by itself supply the regular element t, henselian pair (R,tI), approximation or etale-neighbourhood conclusion of Gabber-Ramero 5.4.21. |
| `mathlib:Ideal.span` | The generated ideal of a subset, used for primitive equations, products and Cartier powers. |
| `mathlib:Ideal.span_singleton_mul_left_unit` | Equality span{uξ}=span{ξ} for IsUnit u. Reuse this algebraic fact; new work concerns the completed sheaf and its filtration. |
| `mathlib:IsAdicComplete` | Ideal-adic separatedness and completeness as a module condition; no comparison with any Huber completion is automatic. I-adic completeness (Hausdorff and precomplete); B^+_D is I_D-adically complete. |
| `mathlib:IsAdicComplete.liftRingHom` | Lifts a compatible family of ring maps into S/I^n to S when S is I-adically complete. Used for the unique compatible separable-coefficient lift. |
| `mathlib:IsDiscreteValuationRing` | The local nonfield principal-ideal-domain class. The complete-DVR and residue-field theorems at a geometric leg are new. Discrete valuation rings; at a geometric point B^+ is a finite product of complete DVRs with algebraically closed residue field. |
| `mathlib:IsLocalization` | The algebraic localization universal property. Its Huber, completion and generator-free sheaf comparisons are separate targets. |
| `mathlib:IsLocalization.Away` | Localization away from one element; the ring R[1/f] of the Beauville-Laszlo square and B_D = B^+_D[1/xi]. |
| `mathlib:LinearEquiv` | Linear isomorphisms; the comparison isomorphisms psi_1, psi_2 and beta of a glueing datum. |
| `mathlib:Localization.Away` | The concrete localization R[1/f]. |
| `mathlib:Module.Dual` | The dual module; duals of glueing data and of modifications. |
| `mathlib:Module.FaithfullyFlat` | Faithful flatness; R -> R-hat x R[1/f] need not be flat, which is why Beauville-Laszlo is not fpqc descent. |
| `mathlib:Module.Finite` | Finitely generated modules; finite glueing data. |
| `mathlib:Module.FinitePresentation` | Finitely presented modules; Kedlaya-Liu Lemma 1.3.9(a) shows the module of sections is finitely presented. |
| `mathlib:Module.Flat` | Flat modules; flat modules are glueable, and flatness is checked on the two pieces (Stacks 15.92.18). |
| `mathlib:Module.Free` | Free modules; trivial bundles and the field case of the B-pair description. |
| `mathlib:Module.Invertible` | Invertible modules (M^dual tensor M = R); the ideal I_D of a closed Cartier divisor is invertible. |
| `mathlib:Module.Projective` | Projective modules; finite projective modules are the vector bundles on affine schemes and sheafy affinoids. |
| `mathlib:PerfectRing` | The bijective Frobenius condition in characteristic p. Perfect coefficient rings satisfy it; perfectoidness is an additional analytic notion. |
| `mathlib:PreTilt` | The ring Perfection (O/(p)) p. This algebraic inverse limit is compared to a marked geometric tilt through P1, rather than called that tilt by definition. |
| `mathlib:PreTilt.untilt` | The multiplicative sharp map under prime, nonunit and p-adic completeness hypotheses; it is not additive and does not classify marked untilts. |
| `mathlib:ProjectiveSpectrum` | The homogeneous prime spectrum excluding the irrelevant ideal, and its topology. The projective scheme construction is imported; coverage by analytic sections is not a baseline result. |
| `mathlib:TensorProduct` | Tensor products of modules; base change of glueing data and tensor products of lattices. |
| `mathlib:Valuation` | Multiplicative maps into a linearly ordered group with zero satisfying the ultrametric inequality; new analytic valuations need their continuity and plus bounds. |
| `mathlib:WittVector` | The p-typical carrier with coefficients indexed by N. Its ramified analogue and strict-lift comparison are new. p-typical Witt vectors; A = W(R^+) in Kedlaya's algebraicity theorem. |
| `mathlib:WittVector.fontaineTheta` | The p-typical map W(PreTilt O p)→O for p-adically complete O, with prime and nonunit hypotheses. A marked geometric tilt and all-E theta need explicit comparisons. |
| `mathlib:WittVector.frobenius` | The p-typical ring endomorphism under Fact p.Prime. It is not by itself the q-Frobenius on ramified coefficients. |
| `mathlib:WittVector.ghostComponent` | The nth p-typical ghost component as a ring homomorphism, used only after the exact Q_p parameter specialization. |
| `mathlib:WittVector.teichmuller` | The p-typical multiplicative monoid homomorphism. It gives the unramified comparison, without asserting an additive coefficient map. |
| `mathlib:nonZeroDivisors` | The submonoid of nonzerodivisors; f in it makes (R, f) a glueing pair. |
| `tauceti:TauCeti.AffineGroupSchemeCat` | Affine group schemes; the structure group G. |
| `tauceti:TauCeti.Comodule.IsFaithful` | A comodule (representation) is faithful if its representation morphism to a general linear group is a closed immersion for some finite basis; the faithful V of the meromorphy criterion. |
| `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` | Faithfulness is independent of the witnessing basis: for any finite basis b, faithful iff the coordinate morphism is a closed immersion. |
| `tauceti:TauCeti.Huber.Pair` | A Huber ring equipped with an integral-element subring; it supplies the ring-pair interface, not sheafiness or an analytic adic space. |
| `tauceti:TauCeti.ReductiveAffineGroupSchemeCat` | Reductive affine group schemes of finite type over a field: the hypothesis on G over E in FS Definitions VI.1.6 and VI.1.8. The O_E-integral reductive case is not in the pinned library. |
| `tauceti:TauCeti.ValuationSpectrum.spa` | The subset of continuous valuation-spectrum points bounded by1 on the plus subring. It is a carrier and does not supply the structure sheaf or quotient geometry. |

## Part I — period domains, divisors and rank-one geometry

### RF0 — coefficients and integral period geometry

The coefficient prefix constructs the strict lift and its algebraic operations before weak-topology chart completion. Integral charts retain π=0; the separate whole-analytic p-typical locus supplies the crystalline-end charts for RF4. Classical points carry their untilt marking, and the nonclassical Gauss fibre is tested on the actual tilted disc.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-witt-polynomials"></a>

#### 1. Ramified Witt polynomials

**Definition.** For E of characteristic zero with residue field F_q and uniformizer π, set w_n(X_0,…,X_n)=Σ_{i=0}^n π^i X_i^(q^(n-i)). For every O_E-algebra A the ghost map on A^N is w_A(x)=(w_n(x))_n. A is not required perfect, reduced, flat or complete.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedWittPolynomials`.

**Hypotheses.** E is a nonarchimedean local field of characteristic zero; q=p^f; n≥0. The all-E perfect strict lift is a separate construction.

**Direct prerequisites.** `mathlib:WittVector`, `mathlib:WittVector.ghostComponent`.

**Proof/construction outline.**

1. Write the finite polynomials over O_E, then evaluate them in any O_E-algebra.
2. Functoriality follows from evaluation of polynomials.

**API.**

- `ramifiedGhost` (data): w_n(x)=Σ_{i≤n}π^i x_i^(q^(n-i)).
- `ramifiedGhost_zero` (characterisation): w_0(x)=x_0.
- `ramifiedGhost_one` (characterisation): w_1(x)=x_0^q+πx_1.
- `ramifiedGhost_natural` (functoriality): For f:A→B, w_B(f(x))=f(w_A(x)).

**Distinguishing examples.**

- `ghost_first` (computation): w_0(x)=x_0.
- `ghost_second` (computation): w_1(x)=x_0^q+πx_1.
- `ghost_p_typical` (compatibility): For E=Q_p,π=p,q=p this is Mathlib WittVector.ghostComponent.

**Acceptance properties.**

- Compute w_0=x_0 and w_1=x_0^q+πx_1.

**Uses.** FF18 §1.2.1 Lemme 1.2.1: Defines operations by integral universal polynomial identities, without ghost injectivity on A.

**Sources.**

- [FF18-courbes, §1.2.1, printed p. 53](#source-rf0-ff18-courbes): The characteristic-zero scope of the arbitrary-algebra construction precedes the displayed Witt polynomials.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-dwork-criterion"></a>

#### 2. Ramified Dwork criterion

**Theorem.** If A is a π-torsion-free O_E-algebra with O_E-linear ring endomorphism σ lifting a↦a^q modulo π, the ghost map w_A is injective and its image consists precisely of sequences y with y_(n+1)-σ(y_n)∈π^(n+1)A for every n≥0.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedDworkCriterion`.

**Hypotheses.** E as in ramified-witt-polynomials; π-torsion-free (equivalently p-torsion-free here); σ(a)≡a^q mod π. No completeness assumption.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials](#relativefarguesfontaine-rf0-integral-y-ramified-witt-polynomials).

**Proof/construction outline.**

1. Injectivity follows inductively by cancelling π^n in the nth coordinate.
2. The binomial congruence propagates a≡b mod π^i to a^q≡b^q mod π^(i+1).
3. Solve recursively for each Witt coordinate by the Dwork congruence.

**Acceptance properties.**

- The constant ghost sequence of a scalar from O_E passes the congruence; no injectivity claim is made on F_q.

**Sources.**

- [FF18-courbes, Lemme 1.2.1, proof, printed p. 53](#source-rf0-ff18-courbes): The proof identifies the ghost image by successive congruences under a Frobenius lift.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-witt-arbitrary-algebras"></a>

#### 3. Ramified Witt functor on arbitrary coefficient algebras

**Construction.** There is a unique functor W_(O_E,π) from O_E-algebras to O_E-algebras with underlying set A^N for which every ghost map is an O_E-algebra homomorphism. Its operations are universal integral polynomials and are natural even on algebras with π-torsion. For a π-adic input algebra this means the same functor, with its subsequently specified V-topology, not a new flat lift.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedWittArbitraryAlgebras`.

**Hypotheses.** E characteristic zero as in §1.2.1; arbitrary O_E-algebra A. Ghost injectivity is only used on universal torsion-free polynomial rings.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials](#relativefarguesfontaine-rf0-integral-y-ramified-witt-polynomials), [RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion](#relativefarguesfontaine-rf0-integral-y-ramified-dwork-criterion).

**Proof/construction outline.**

1. Apply Dwork to O_E[X_i,Y_i,…] with the coefficient-fixing Frobenius lift X_i↦X_i^q.
2. Solve addition, multiplication and scalar ghost equations there and establish integral coefficient polynomials.
3. Transfer the identities by natural evaluation to every A, including π-torsion.

**API.**

- `ramifiedWitt` (data): Carrier A^N with polynomial-defined O_E-algebra operations.
- `ramifiedWitt_map` (functoriality): A coefficient algebra map f induces coordinatewise W(f).
- `ramifiedWitt_ghost_hom` (structure): Every w_n is an O_E-algebra homomorphism.
- `ramifiedWitt_p_typical` (compatibility): At E=Q_p,π=p the functor canonically agrees with Mathlib WittVector p on Z_p-algebras.
- `ramifiedCoeffs` (data): The Witt-coordinate function W(A)→A^N, distinct from ghost coordinates.
- `ramifiedMk` (constructor): Coordinate equivalence A^N≃W(A).
- `ramifiedWitt_ext` (extensionality): Equality of every Witt coordinate implies equality of vectors, including on torsion algebras.
- `ramifiedWitt_coeff_mk` (simp): The nth coordinate of the vector constructed from x is x_n.
- `ramifiedWitt_map_coeff` (simp): The nth coordinate of W(f)(x) is f(x_n).
- `ramifiedWitt_map_id` (functoriality): W(id)=id.
- `ramifiedWitt_map_comp` (functoriality): W(g∘f)=W(g)∘W(f).

**Distinguishing examples.**

- `witt_zero_algebra` (degenerate): W(0) is the zero ring.
- `witt_ghost_operations` (computation): w_n(x+y)=w_n(x)+w_n(y), w_n(xy)=w_n(x)w_n(y).
- `witt_torsion_not_strict` (non-example): For imperfect A=F_p[t], W(A)/p is not A via the zeroth coordinate; the arbitrary functor must not assert the perfect strict-lift property.

**Acceptance properties.**

- Check naturality on A→A/π^m and uniqueness of operations by testing the universal polynomial algebra.

**Uses.** FF18 §1.2.4 and local divisor equations: The twisted functor and coefficient comparison must apply before specializing to perfect R^+.

**Sources.**

- [FF18-courbes, Lemme 1.2.1, printed p. 53](#source-rf0-ff18-courbes): The statement is a functor on all O_E-algebras, not only perfect residue algebras.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-witt-uniformizer-change"></a>

#### 4. Uniformizer-independent ramified Witt vectors

**Construction.** For uniformizers π,π′ of O_E there is a unique natural algebra isomorphism u_(π,π′):W_(O_E,π)→W_(O_E,π′) preserving the ghost maps. The maps satisfy u_(π′,π″)u_(π,π′)=u_(π,π″). Define W_OE as the compatible limit over all uniformizers; evaluation at a chosen uniformizer is an algebra isomorphism.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedWittUniformizerChange`.

**Hypotheses.** E characteristic zero; comparison of functors, not coordinatewise identity.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion](#relativefarguesfontaine-rf0-integral-y-ramified-dwork-criterion), [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras](#relativefarguesfontaine-rf0-integral-y-ramified-witt-arbitrary-algebras).

**Proof/construction outline.**

1. Dwork image congruences depend on (π), not its generator.
2. Construct the universal coordinate change on torsion-free polynomial rings and specialize.
3. The ghost uniqueness gives identity, inverse and cocycle laws; form the canonically identified limit.

**API.**

- `uniformizerChange` (data): Canonical W_π(A)≃W_π′(A), natural in A.
- `uniformizerChange_ghost` (characterisation): w_π′∘u_(π,π′)=w_π.
- `uniformizerChange_cocycle` (characterisation): u_(π′,π″)∘u_(π,π′)=u_(π,π″).
- `uniformizerChange_teich` (compatibility): u_(π,π′)([a])=[a].

**Distinguishing examples.**

- `uniformizer_same` (degenerate): u_(π,π)=id.
- `uniformizer_inverse` (computation): u_(π′,π)u_(π,π′)=id.
- `uniformizer_coordinates` (non-example): The change preserves ghosts and [a], but V_π′=(π′/π)V_π; it does not preserve V without the scalar.

**Acceptance properties.**

- Compare operations before and after π′=uπ; do not leave coordinates unchanged.

**Uses.** RF0:integral-Y charts and RF2 local equations: Transfers rings, topologies and primitive presentations under a choice change.

**Sources.**

- [FF18-courbes, §1.2.1 and Définition 1.2.2, printed pp. 53–54](#source-rf0-ff18-courbes): The preceding comparison identifies the functors and Definition 1.2.2 removes the uniformizer choice.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-teich-frobenius-verschiebung"></a>

#### 5. Teichmuller, Frobenius and Verschiebung

**Construction.** On W_OE(A), [a] has Witt coordinates (a,0,…); it is a natural multiplicative section of coordinate zero. F is the algebra endomorphism shifting ghosts. V_π is the additive coordinate shift transported from W_π. F and [−] are independent of π, V_π depends on π. FV_π=π and V_π(F(x)y)=xV_π(y). For F_q-algebras also V_πF=π and F acts by q-powers on V-expansion coefficients.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedTeichFrobeniusVerschiebung`.

**Hypotheses.** Arbitrary O_E-algebra A, E characteristic zero; VF=π only for F_q-algebras. Multiplication by π uses the W_OE-algebra structure.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras](#relativefarguesfontaine-rf0-integral-y-ramified-witt-arbitrary-algebras), [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change](#relativefarguesfontaine-rf0-integral-y-ramified-witt-uniformizer-change), `mathlib:WittVector.frobenius`.

**Proof/construction outline.**

1. Construct F by ghost shift on universal rings using the Dwork image condition.
2. Use the coordinate shift for V_π and compute ghost identities.
3. Extend identities naturally to torsion algebras; use q-power Frobenius on an F_q-algebra for the additional formula.

**API.**

- `ramifiedTeich` (data): Natural multiplicative map A→W_OE(A).
- `ramifiedFrobenius` (data): F with w_n(Fx)=w_(n+1)(x).
- `ramifiedVerschiebung` (data): V_π is the additive coordinate shift.
- `ramifiedFV` (characterisation): F(V_π(x))=πx.
- `ramifiedVProjection` (characterisation): V_π(F(x)y)=xV_π(y).
- `ramifiedVF_residue` (compatibility): For an F_q-algebra A, V_π(F(x))=πx.

**Distinguishing examples.**

- `teich_product` (computation): [ab]=[a][b] and [0]=0, [1]=1.
- `teich_not_additive` (non-example): For Q_2 and A=F_2, [1]+[1]=2≠[0] in W(F_2).
- `fv_not_vf_general` (compatibility): F(V_π(1))=π; VF=π is tested only on residue-algebra inputs.

**Acceptance properties.**

- Recover p-typical Teichmuller and Frobenius after the canonical ring comparison.

**Uses.** FS II.1.1 and VI.1.2: [ϖ] supplies chart denominators and primitive equations; F supplies the q-Frobenius quotient. VectorBundlesAndIsocrystals:VB0: Provides the coefficient Frobenius for general-E isocrystals.

**Sources.**

- [FF18-courbes, §1.2.1, printed p. 54](#source-rf0-ff18-courbes): The displayed F/V relations include the projection formula and separate the residue-algebra case.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-v-adic-expansion"></a>

#### 6. V-adic expansion and truncated ramified Witt vectors

**Theorem.** For arbitrary O_E-algebra A, W_OE(A)≅lim_n W_OE(A)/V_π^nW_OE(A), and each element has a unique convergent expansion Σ_{n≥0}V_π^n[a_n]. Each V_π^n image is an ideal independent of π. This is V-adic completeness; without perfectness it is not the assertion V^nW=π^nW.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedVAdicExpansion`.

**Hypotheses.** n≥1 for the inverse system; E characteristic zero; no torsion or perfectness assumption on A.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung](#relativefarguesfontaine-rf0-integral-y-ramified-teich-frobenius-verschiebung), [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change](#relativefarguesfontaine-rf0-integral-y-ramified-witt-uniformizer-change).

**Proof/construction outline.**

1. The n-truncation remembers precisely the first n Witt coordinates.
2. Use the F/V projection formula to make V^nW an ideal.
3. Recursively remove [a_0] then divide by V; coordinatewise inverse limits give completeness and uniqueness.

**Acceptance properties.**

- An imperfect residue algebra has V-adic completeness without V=π.

**Sources.**

- [FF18-courbes, §1.2.1, printed p. 54](#source-rf0-ff18-courbes): The expansion and inverse-limit completeness are stated before any perfectness assumption.

<a id="relativefarguesfontaine-rf0-ramified-witt-universal-property"></a>

#### 7. Perfect ramified strict lift

**Construction.** For every nonarchimedean local E with finite residue F_q and perfect F_q-algebra R, W_OE(R) is the unique π-adically complete π-torsion-free (hence O_E-flat) O_E-algebra with specified reduction W_OE(R)/π≅R. It has unique multiplicative Teichmuller representatives and unique π-adic expansions Σπ^n[r_n]; q-Frobenius lifts r↦r^q. In characteristic zero it is canonically W(R)⊗_(W(F_q))O_E, already complete because O_E is finite free. In equal characteristic it is R[[π]]. Uniqueness is in the category of complete lifts with the fixed residue identification.

Identifier: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedWittUniversalProperty`.

**Hypotheses.** E mixed or equal characteristic; R perfect. Arbitrary-algebra ghost theory above is only claimed in its source range, E characteristic zero.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung](#relativefarguesfontaine-rf0-integral-y-ramified-teich-frobenius-verschiebung), [RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion](#relativefarguesfontaine-rf0-integral-y-ramified-v-adic-expansion), `mathlib:PerfectRing`, `mathlib:IsAdicComplete`, `mathlib:WittVector.teichmuller`.

**Proof/construction outline.**

1. In mixed characteristic use VF=π and invertibility of F for perfect R to identify V^nW with π^nW; the expansion proves completeness and torsion-freeness.
2. Use Teichmuller limits to construct the unique residue-lifting map between two strict lifts.
3. Compare with scalar extension through the unramified coefficient subring; a finite basis preserves π-adic completeness.
4. In equal characteristic the coefficient embedding gives R[[π]], with coefficientwise q-Frobenius.

**API.**

- `strictLift_reduce` (compatibility): W_OE(R)/π≃R, natural in perfect R.
- `strictLift_expansion` (characterisation): Each element has exactly one Σπ^n[r_n] expansion.
- `strictLift_complete` (structure): W_OE(R) is π-adically complete and O_E-flat.
- `strictLift_frobenius` (characterisation): φ(Σπ^n[r_n])=Σπ^n[r_n^q].
- `strictLift_equalChar` (compatibility): For E=F_q((π)), W_OE(R)≃R[[π]], preserving π and coefficients.
- `strictLift_pTypical` (compatibility): For E=Q_p, W_OE(R)≃WittVector p R, preserving [−],φ and reduction.

**Distinguishing examples.**

- `strict_lift_fq` (computation): W_OE(F_q)≃O_E.
- `strict_lift_zero` (degenerate): W_OE(0)=0.
- `strict_lift_equal_char` (compatibility): In equal characteristic [a]+[b]=[a+b] in R[[π]]; the nonadditivity test for mixed characteristic must not be universal.
- `strict_lift_perfect_required` (non-example): For R=F_p[t], Frobenius is not bijective and reduction modulo p of W(R) does not recover R.

**Acceptance properties.**

- The reduction isomorphism and flatness require perfectness; E=Q_p agrees with Mathlib WittVector p via a ring isomorphism.

**Uses.** RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition: Supplies the actual ring and coefficient topology before defining Spa. Zhu17 §0.5 and BS17 §9: Identifies their WO coefficient rings for loop functors without constructing a second ring theory.

**Atlas landmark.** Ramified strict lift.

**Sources.**

- [FF18-courbes, §1.2.1, perfect case and Lemme 1.2.3, printed pp. 54–55](#source-rf0-ff18-courbes): Inverting F converts the V-adic expansion into the π-adic strict lift.
- [FS-geometrization, II.1 opening, printed p. 47](#source-rf0-fs-geometrization): The introductory coefficient convention includes both characteristics; FF §1.3.2 gives the equal-characteristic power-series model.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-coefficient-comparison"></a>

#### 8. Change of coefficient field

**Construction.** For a finite extension E′/E of characteristic-zero local fields with residue degree f, the natural O_E-algebra map u:W_OE(A)→W_OE′(A), for every O_E′-algebra A, has w_n^E′(u(x))=w_(fn)^E(x). It preserves Teichmuller lifts and satisfies uF_E^f=F_E′u and uV_π=(π/π′)V_π′uF_E^(f−1).

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedCoefficientComparison`.

**Hypotheses.** The scalar π/π′ belongs to O_E′; the Frobenius on the right of the V formula is F_E before u, not F_E′ after u.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras](#relativefarguesfontaine-rf0-integral-y-ramified-witt-arbitrary-algebras), [RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung](#relativefarguesfontaine-rf0-integral-y-ramified-teich-frobenius-verschiebung).

**Proof/construction outline.**

1. Use the Dwork congruences for the subsequence of ghosts with indices fn.
2. Construct the universal coordinate polynomials and extend to torsion inputs.
3. Check the F and V formulas on universal ghost coordinates; record the printed V-formula correction.

**API.**

- `coefficientMap` (data): Natural algebra map with ghost index fn.
- `coefficientMap_teich` (characterisation): u([a])=[a].
- `coefficientMap_frobenius` (compatibility): u(F_E^f x)=F_E′u(x).
- `coefficientMap_verschiebung` (compatibility): u(V_πx)=(π/π′)V_π′u(F_E^(f−1)x).

**Distinguishing examples.**

- `coefficient_identity` (degenerate): For E′=E the map is the identity.
- `coefficient_ghost_one` (computation): The first nonconstant E′ ghost is the fth E ghost.
- `coefficient_unramified_frobenius` (non-example): For residue degree f>1, uF_E^f=F_E′u; uF_E=F_E′u is not the required identity.

**Acceptance properties.**

- For f=1 the V comparison reduces to the uniformizer-scaling formula.

**Uses.** RF2:untilts coefficient change: Matches the ramified theta map, divisor generator and coefficient Frobenius.

**Sources.**

- [FF18-courbes, Lemme 1.2.3, printed p. 55](#source-rf0-ff18-courbes): The ghost diagram defines coefficient comparison; the following V formula requires the corrected Frobenius index.
- [FF18-corrected, §1.2.1 Lemme 1.2.3, printed p. 7](#source-rf0-ff18-corrected): The Frobenius iterate lies inside u, confirming the corrected Verschiebung coefficient formula in E2.

<a id="relativefarguesfontaine-rf0-integral-y-ramified-witt-diagonal"></a>

#### 9. Witt diagonal and unramified coefficient action

**Construction.** The natural map Δ:W_OE(A)→W_OE(W_OE(A)) is characterized by outer ghosts w_n(Δx)=F_E^n(x). If E″ is the maximal unramified subextension of E′/E, the identification W_OE(F_q′)=O_E″ and Δ induce the O_E″-algebra structure on W_OE(A) used in coefficient base change.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `ramifiedWittDiagonal`.

**Hypotheses.** E characteristic zero; A an O_E′-algebra for the coefficient-action assertion.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison](#relativefarguesfontaine-rf0-integral-y-ramified-coefficient-comparison), [RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung](#relativefarguesfontaine-rf0-integral-y-ramified-teich-frobenius-verschiebung), [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property).

**Proof/construction outline.**

1. Apply Dwork to the Frobenius sequence on the universal Witt algebra.
2. Specialize the natural map from W_OE(F_q′) through Δ and the coefficient inclusion.
3. Ghost uniqueness gives compatibility of this coefficient action with u.

**API.**

- `ramifiedDiagonal` (data): Δ with outer nth ghost F_E^n.
- `ramifiedDiagonal_ghost` (characterisation): w_n(Δx)=F_E^n x.
- `unramifiedCoefficientAction` (structure): O_E″ acts through Δ on W_OE(A).

**Distinguishing examples.**

- `diagonal_ghost_zero` (computation): w_0(Δx)=x.
- `diagonal_ghost_one` (computation): w_1(Δx)=F_E x.
- `diagonal_unramified_action` (compatibility): For A=F_q′, the coefficient action identifies W_OE(A) with O_E″.

**Acceptance properties.**

- The tensor product in coefficient base change is over O_E″ with this action.

**Uses.** FF18 coefficient base change: Provides the exact tensor-product base, rather than silently tensoring over O_E.

**Sources.**

- [FF18-courbes, §1.2.1 following Lemme 1.2.3, printed p. 55](#source-rf0-ff18-courbes): The diagonal supplies the otherwise missing unramified scalar structure.

<a id="relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change"></a>

#### 10. Perfect coefficient base change

**Theorem.** For perfect F_q′-algebra R and E′/E finite, W_OE(R)⊗_(O_E″)O_E′≃W_OE′(R), carrying [r]⊗1 to [r] and F_E^f⊗id to F_E′. In equal characteristic the same comparison follows from R[[π]] and finite coefficient extension. The tensor product is complete because the coefficient module is finite free; its base is the maximal unramified subextension, not O_E when f>1.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `perfectCoefficientBaseChange`.

**Hypotheses.** Perfect R with specified F_q′ action; the mixed-characteristic action is the one defined by Δ.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal](#relativefarguesfontaine-rf0-integral-y-ramified-witt-diagonal), [RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison](#relativefarguesfontaine-rf0-integral-y-ramified-coefficient-comparison).

**Proof/construction outline.**

1. Compute reduction modulo π′ and identify it with R.
2. Show π′-completeness and flatness by a finite O_E″ basis of O_E′.
3. Apply strict-lift uniqueness; check the coefficient Frobenius on Teichmuller expansions.
4. Use the explicit power-series model in equal characteristic.

**Acceptance properties.**

- At E=Q_p this is W(R)⊗_(W(F_q′))O_E′; a naive tensor over Z_p has the wrong residue algebra.

**Sources.**

- [FF18-courbes, §1.2.1, printed pp. 55–56](#source-rf0-ff18-courbes): The comparison is an isomorphism exactly after imposing perfectness and using the unramified scalar action.

<a id="relativefarguesfontaine-rf0-integral-y-q-twisted-witt-functor"></a>

#### 11. Q-twisted Witt vectors

**Construction.** For Q∈O_E[X] with Q≡X^q modulo π, set Q_0=X and Q_n=Q iterated n times, and w_(n,Q)(x)=Σ_(i≤n)π^i Q_(n−i)(x_i). There is a unique natural algebra structure on A^N with these ghost homomorphisms, and a canonical ghost-preserving isomorphism W_(O_E,Q,π)(A)≃W_(O_E,π)(A), for every O_E-algebra A.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `qTwistedWittFunctor`.

**Hypotheses.** E characteristic zero; no perfectness, completeness or π-torsion-free assumption on A.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion](#relativefarguesfontaine-rf0-integral-y-ramified-dwork-criterion), [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras](#relativefarguesfontaine-rf0-integral-y-ramified-witt-arbitrary-algebras).

**Proof/construction outline.**

1. Prove the congruence Q(x)≡Q(y) modulo π^(i+1) when x≡y modulo π^i, i≥1.
2. Apply the twisted Dwork criterion on universal torsion-free polynomial algebras.
3. Transfer integral operations and the unique ghost-preserving comparison to arbitrary A.

**API.**

- `twistedGhost` (data): w_(n,Q)=Σ_(i≤n)π^i Q_(n−i)(x_i).
- `twistedWitt` (data): Polynomial-defined natural O_E-algebra on A^N.
- `twistedWittEquiv` (equivalence): Canonical ghost-preserving algebra isomorphism to ordinary ramified Witt vectors.

**Distinguishing examples.**

- `twist_first_ghost` (computation): w_(1,Q)(x)=Q(x_0)+πx_1.
- `twist_ordinary` (compatibility): Q=X^q recovers ordinary ramified Witt vectors.
- `twist_torsion` (non-example): The functor and comparison exist on A=O_E/π²; their definition cannot require ghost injectivity there.

**Acceptance properties.**

- Evaluate w_(0,Q) and w_(1,Q); do not assume Q is additive or multiplicative.

**Uses.** FF18 §1.2.2 and RF3 Lubin–Tate divisor sections: Separates the twisted coordinate functor from the ordinary multiplicative Teichmuller map.

**Sources.**

- [FF18-courbes, Proposition 1.2.4 and Lemmes 1.2.5–1.2.6, printed pp. 56–57](#source-rf0-ff18-courbes): The proposition constructs the twisted functor for arbitrary coefficient algebras.

<a id="relativefarguesfontaine-rf0-integral-y-q-teichmuller-lift"></a>

#### 12. Q-Teichmuller lift

**Construction.** Transport (a,0,…) through the twisted Witt comparison to define [a]_Q∈W_OE(A). Its ghosts are Q_n(a), it satisfies Q([a]_Q)=[Q(a)]_Q, and every element has a unique V_π expansion ΣV_π^n[a_n]_Q. For perfect F_q-algebra A the π expansion is unique and [a]_Q=lim_n Q_n(â_n), for any lifts â_n of a^(q^(−n)). The map is not generally multiplicative.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `qTeichmullerLift`.

**Hypotheses.** Arbitrary O_E-algebra A for the ghosts and V expansion; perfect residue algebra for the π expansion and limit.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor](#relativefarguesfontaine-rf0-integral-y-q-twisted-witt-functor), [RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion](#relativefarguesfontaine-rf0-integral-y-ramified-v-adic-expansion), [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property).

**Proof/construction outline.**

1. Apply the twisted comparison to coordinate-zero representatives.
2. Use universal ghosts for the Q identity and coordinate induction for the V expansion.
3. Use contraction modulo successive powers of π for the perfect-residue limit and its independence of chosen lifts.

**API.**

- `qTeich` (data): Natural lift A→W_OE(A).
- `qTeich_ghost` (characterisation): w_n([a]_Q)=Q_n(a).
- `qTeich_equation` (characterisation): Q([a]_Q)=[Q(a)]_Q.
- `qTeich_limit` (characterisation): For perfect residue A, [a]_Q=lim_n Q_n(â_n).

**Distinguishing examples.**

- `q_teich_ordinary` (compatibility): For Q=X^q, [a]_Q=[a].
- `q_teich_multiplicative_group` (computation): For E=Q_p and Q=(1+X)^p−1, [a]_Q=[1+a]−1.
- `q_teich_not_multiplicative` (non-example): At p=2 and a=b=1 in F_2, [1]_Q=−1, so [ab]_Q≠[a]_Q[b]_Q.

**Acceptance properties.**

- For Q=(1+X)^p−1 over Q_p obtain [a]_Q=[1+a]−1.

**Uses.** FF18 Chapter 2 points y_ε and RF3 divisor section: Provides the formal-group-adapted coefficients of period functions.

**Sources.**

- [FF18-courbes, Proposition 1.2.7 and Exemple 1.2.8, printed pp. 57–58](#source-rf0-ff18-courbes): The natural lift has a functional equation; Example 1.2.8 distinguishes it from the multiplicative lift.

<a id="relativefarguesfontaine-rf0-integral-y-coefficient-weak-topology"></a>

#### 13. Weak coefficient topology

**Theorem.** For a perfect complete valued field F/F_q and A=W_OE(O_F), the product topology on Teichmuller expansion coefficients equals the (π,[ϖ])-adic topology for a topologically nilpotent ϖ∈O_F. A is separated complete in this topology. For 0<ρ<1 the Gauss norm |Σπ^n[x_n]|_ρ=sup_n|x_n|ρ^n induces it; at ρ=1 the mixed-characteristic Teichmuller map need not be continuous.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `coefficientWeakTopology`.

**Hypotheses.** This field case is FF Proposition 1.4.11. The relative uniform-Banach version is separately proved by period-ring estimates below.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property).

**Proof/construction outline.**

1. The finite coefficient seminorms bound tails uniformly by powers of ρ.
2. Compare finite coefficient neighborhoods with powers of (π,[ϖ]).
3. Use completeness of F coefficientwise; the source example at ρ=1 prevents extending the assertion to that endpoint.

**Acceptance properties.**

- The LT construction uses this topology; π-adic and weak topologies are separately named.

**Sources.**

- [FF18-courbes, Définition 1.4.10, Proposition 1.4.11 and Remarque 1.4.12, printed pp. 64–65](#source-rf0-ff18-courbes): The comparison explicitly excludes the endpoint norm from continuity of Teichmuller representatives.

<a id="relativefarguesfontaine-rf0-integral-y-lubin-tate-teichmuller-lift"></a>

#### 14. Lubin–Tate Teichmuller lift

**Construction.** If Q≡πX mod X² and Q≡X^q mod π, its Lubin–Tate formal group satisfies LT_Q([x]_Q,[y]_Q)=[LT_Q(x,y)]_Q when perfect A is complete for (x,y). For a perfect complete valued field F of characteristic p and any Lubin–Tate formal group LT over O_E, the weak limit [x]_LT=lim_n[π^n]_LT([x^(q^(−n))]) gives an injective O_E-module map (m_F,+_LT)→(W_OE(m_F),+_LT). This is a module map for the formal-group law, not for ordinary addition.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `lubinTateTeichmullerLift`.

**Hypotheses.** E characteristic zero for this cited arbitrary Witt functor; x,y topologically nilpotent. The general formal power series require the weak topology, not solely π-adic convergence.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift](#relativefarguesfontaine-rf0-integral-y-q-teichmuller-lift), [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), [RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology](#relativefarguesfontaine-rf0-integral-y-coefficient-weak-topology).

**Proof/construction outline.**

1. Identify ([x]_Q,[y]_Q,π) with ([x],[y],π) and prove the needed complete topology.
2. Evaluate the formal group using completeness and commute it with Q iterations.
3. Apply the limit characterization of [−]_Q, then the identical contraction argument for a general LT formal power series.
4. The residue map proves injectivity and scalar compatibility.

**API.**

- `ltTeich` (data): Injective map m_F→W_OE(m_F), with LT laws on source and target.
- `ltTeich_add` (characterisation): LT([x]_LT,[y]_LT)=[LT(x,y)]_LT.
- `ltTeich_scalar` (characterisation): [a]_LT([x]_LT)=[[a]_LT(x)]_LT for a∈O_E.
- `ltTeich_limit` (characterisation): The weak limit of the displayed π iterates is [x]_LT.

**Distinguishing examples.**

- `lt_teich_zero` (degenerate): [0]_LT=0.
- `lt_teich_multiplicative` (computation): For the multiplicative formal group, [x]_LT=[1+x]−1.
- `lt_teich_injective` (compatibility): Reduction of [x]_LT is x, so a nonzero x∈m_F has nonzero lift.

**Acceptance properties.**

- State the coefficient field, formal group and topology in the limit; no ordinary additive-map assertion.

**Uses.** FS II.2.3: The logarithm of the compatible Lubin–Tate tower supplies the section with a simple untilt zero.

**Sources.**

- [FF18-courbes, Lemme 1.2.9 and Corollaire 1.2.10, printed p. 58](#source-rf0-ff18-courbes): The formal-group lift converges weakly and intertwines the Lubin–Tate module law.

<a id="relativefarguesfontaine-rf0-integral-y-integral-rational-chart-rings"></a>

#### 15. Integral period chart rings

**Construction.** Put W=W_OE(R^+) with ideal of definition (π,[ϖ]). For n=p^m>0, C_n=W⟨π^n/[ϖ]⟩ is the completed rational ring of definition; B_n=C_n[1/[ϖ]], and B_n^+ is the integral closure of C_n in B_n. The rational subset is |π|^n≤|[ϖ]|≠0. Its Tate unit is [ϖ]; π is allowed to vanish. The completion topology is the rational-localisation topology induced from W, not solely π-adic.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `integralRationalChartRings`.

**Hypotheses.** S=Spa(R,R^+) affinoid perfectoid over F_q; R^+ open integrally closed bounded; ϖ a topologically nilpotent unit of R.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), `AdicSpacesPartII:R0`, `tauceti:TauCeti.Huber.Pair`.

**Proof/construction outline.**

1. Form the rational localisation using the Huber-pair construction imported from the adic roadmap.
2. Use [ϖ] as the inverted denominator and complete the ring of definition.
3. Take the integral closure plus ring; the universal property describes maps with the stated valuation inequality.

**API.**

- `integralChartRing` (data): B_n=W⟨π^n/[ϖ]⟩[1/[ϖ]], with its completed topology.
- `integralChartPlus` (data): Integral closure of C_n in B_n.
- `integralChart_universal` (universal-property): Continuous W-maps to complete pairs satisfying the rational bounds factor uniquely through B_n.
- `integralChart_frobenius` (functoriality): φ compares n=p^m charts through q-power Teichmuller coefficients.

**Distinguishing examples.**

- `chart_special_fibre` (degenerate): π=0 is allowed and [ϖ] is invertible on each chart.
- `chart_unit_denominator` (computation): [ϖ] is a topologically nilpotent unit in B_n.
- `chart_not_witt_tate` (non-example): W with its (π,[ϖ])-adic topology is not asserted Tate; Tate-ness is obtained after the chart localisation.

**Acceptance properties.**

- Track both the topology and the plus ring, including the characteristic-p fibre.

**Uses.** FS II.1.1: Supplies the actual affinoid rings for the sheaf and perfectoid comparison.

**Sources.**

- [FS-geometrization, II.1.1 proof, printed p. 48](#source-rf0-fs-geometrization): The displayed rings define the chart and its plus ring before sheafiness is proved.

<a id="relativefarguesfontaine-rf0-integral-y-root-extension-chart-model"></a>

#### 16. Root-extension chart model

**Construction.** Let E_root∞ be the completion of E(π^(1/p^∞)). On the n=1 chart let π_m=π^(1/p^m), v_m=[ϖ]^(1/p^m), s_m=π_m/v_m. In the completed base extension, set A_0^+=(W⊗̂_OE O_(E_root∞))[s_m:m≥0]^∧_[ϖ], with π_m=v_m s_m and s_(m+1)^p=s_m. Then A=A_0^+[1/[ϖ]], and A^+ is the integral closure of the extended chart plus ring. Reduction gives A_0^+/[ϖ]≃(R^+/ϖ)[t_1^(1/p^∞)]. The quotient in s_m roots the entire ratio π/[ϖ].

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `rootExtensionChartModel`.

**Hypotheses.** Choose compatible roots; R^+ is perfect, so v_m exists. E_root∞ is distinct from the Lubin–Tate torsion extension used for divisor sections.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings](#relativefarguesfontaine-rf0-integral-y-integral-rational-chart-rings), [RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change](#relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change), `AdicSpacesPartII:R0`.

**Proof/construction outline.**

1. Use successive finite coefficient extensions and the rational relation π=[ϖ]s_0 to construct the completed presentation.
2. Adjoin compatible roots of that relation; retain all π_m=v_ms_m equations.
3. Reduce modulo [ϖ] and eliminate the coefficient-root relations, leaving the perfected polynomial variable.

**API.**

- `rootChartModel` (data): Completed presentation with π_m=v_ms_m.
- `rootChart_reduce` (compatibility): A_0^+/[ϖ]≃(R^+/ϖ)[t_1^(1/p^∞)].
- `rootChart_roots` (characterisation): s_(m+1)^p=s_m.
- `rootChart_tiltCoordinate` (compatibility): t_1^sharp=π/[ϖ], so |t_1|≤1 on the n=1 chart.
- `rootChartRatio` (constructor): The specified compatible whole-ratio sequence s_m in the completed chart; rootChart_roots applies to this sequence.

**Distinguishing examples.**

- `root_boundary_norm` (computation): On the common boundary |s_m|=1.
- `root_special_fibre` (degenerate): π=0 maps t_1^sharp to 0 while [ϖ] remains invertible.
- `root_wrong_fraction` (non-example): Rooting only the numerator fails the boundary norm at every m>0.
- `root_reciprocal` (non-example): [ϖ]/π is undefined on π=0 and cannot be this chart coordinate.

**Acceptance properties.**

- On |π|=|[ϖ]|=c<1, every s_m has norm 1; π^(1/p^m)/[ϖ] would have norm c^(1/p^m−1)>1.

**Uses.** FS II.1.1 and FarguesFontaineDiamonds:F4/root_annulus_tilt: Gives the integral model before importing the fixed-field generic comparison.

**Atlas landmark.** Root-extension period chart.

**Sources.**

- [FS-geometrization, II.1.1 root-extension presentation, printed p. 48](#source-rf0-fs-geometrization): The displayed root presentation roots the entire ratio. Its tilt-coordinate reciprocal in the MPIM copy is corrected as source finding E1; the Fargues author copy has the correct coordinate.

<a id="relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness"></a>

#### 17. Perfectoid root extension and split sheaf descent

**Theorem.** The charts B_n are sheafy. Their completed extension to E_root∞ is perfectoid; the associated perfected disc charts glue to S×_(F_q)Spa F_q[[t^(1/p^∞)]]. Hence curly-Y_S is an analytic adic space over O_E. In mixed characteristic the charts are sousperfectoid; in equal characteristic perfection after the root extension and the split-module argument give the same sheaf conclusion.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `chartCoverPerfectoidnessAndSheafiness`.

**Hypotheses.** B_n as defined above; plus rings are integral closures. The splitting is a continuous B_n-linear retraction, not a ring retraction.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model), `PerfectoidSpaces:P1`, `PerfectoidSpaces:P3`, `AdicSpacesPartII:R5/split-injection-completed-base-change`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`.

**Proof/construction outline.**

1. Reduce to n=1 using coefficient perfection and Frobenius.
2. For A_0^+, use u=[ϖ]^(1/p): u^p divides p in mixed characteristic because π=[ϖ]s_0 and p is a unit times a power of π; the root presentation proves u is regular and Frob:A_0^+/u→A_0^+/u^p is bijective. Apply the integral-perfectoid criterion (BMS 3.10(ii)); in equal characteristic apply the perfect characteristic-p criterion.
3. Identify the tilt from the reduction presentation and t_1^sharp=π/[ϖ]. Normalize the global disc coordinate so these are the corresponding nested disc charts.
4. The coefficient-root extension admits a topological module splitting; transport it through the completed chart tensor product. Apply sousperfectoid sheaf descent, then glue the rational chart cover.

**Acceptance properties.**

- Verify the chosen u and both quotient ideals in the criterion; establish a continuous splitting before invoking the imported theorem.

**Atlas landmark.** Perfectoid period chart comparison.

**Sources.**

- [FS-geometrization, Proposition II.1.1 and proof, printed pp. 48–49](#source-rf0-fs-geometrization): The actual topological direct-summand argument establishes sheafiness; the root presentation checks the integral criterion.
- [BMS18-integral, Lemma 3.10(ii), printed pp. 22–23](#source-rf0-bms18-integral): The criterion requires regularity, divisibility and the Frobenius quotient isomorphism, not merely surjectivity.

<a id="relativefarguesfontaine-rf0-integral-y-curly-y-affinoid-definition"></a>

#### 18. Integral relative period domain

**Construction.** For affinoid S define curly-Y_S=Spa(W_OE(R^+),W_OE(R^+))∖V([ϖ]), with the (π,[ϖ])-adic coefficient topology and the sheaf structure glued from the integral charts. It retains V(π), is independent of the pseudouniformizer, and q-Frobenius on R^+ induces an analytic automorphism. Its special fibre is the open period domain in characteristic p.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `curlyYAffinoidDefinition`.

**Hypotheses.** All E with finite residue F_q; S affinoid perfectoid over F_q. Spa here includes structure sheaves from the adic roadmap, whereas pinned TauCeti.ValuationSpectrum.spa supplies only the valuation subset.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings](#relativefarguesfontaine-rf0-integral-y-integral-rational-chart-rings), [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness), `tauceti:TauCeti.ValuationSpectrum.spa`.

**Proof/construction outline.**

1. Use the rational chart cover and sheafiness theorem to attach the adic structure.
2. For ϖ,ϖ′ find n with ϖ|ϖ′^n and ϖ′|ϖ^n; the topologies and nonvanishing opens coincide.
3. Apply q-Frobenius and its inverse on the coefficient ring and glue charts.

**API.**

- `integralPeriodDomain` (data): Analytic curly-Y_S built from B_n charts.
- `integralPeriodDomain_independent` (equivalence): Canonical comparison for ϖ and ϖ′.
- `integralPeriodDomain_frobenius` (structure): q-Frobenius induces an analytic automorphism.
- `integralPeriodDomain_chart` (compatibility): The charts identify with |π|^n≤|[ϖ]|≠0.

**Distinguishing examples.**

- `integral_equal_char_disc` (compatibility): For E=F_q((π)) and S=Spa C, curly-Y_C is the open unit disc, including π=0.
- `integral_zero_fibre` (degenerate): The characteristic-p untilt gives a point on V(π).
- `integral_not_generic` (non-example): Removing V(π) in the definition fails the special-fibre test.

**Acceptance properties.**

- Specialisation at π=0 must survive; the generic open is defined separately.

**Uses.** GeometricSatakeAndFusion:GS0:loop-geometry: The integral period domain supplies the degeneration to ramified Witt coefficients.

**Atlas landmark.** Integral relative period domain.

**Sources.**

- [FS-geometrization, II.1 opening and Proposition II.1.1, printed pp. 47–48](#source-rf0-fs-geometrization): The topology and nonvanishing locus are both independent of the chosen pseudouniformizer.

<a id="relativefarguesfontaine-rf0-integral-y-untilt-functor-of-points"></a>

#### 19. Integral period diamond comparison

**Theorem.** For perfectoid T/F_q, maps from an untilt T^sharp to curly-Y_S are naturally pairs of an O_E-untilt of T and a map T→S. Thus curly-Y_S^diamond≃S×Spd O_E. The diamond of a pre-adic space is formed using untilt pairs; the non-Tate coefficient object Spd O_E is not replaced by Spd E.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `untiltFunctorOfPoints`.

**Hypotheses.** Affinoid and subsequently general S; maps to O_E require π topologically nilpotent in the untilt, and the image of [ϖ] invertible in its Tate ring.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), [RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition](#relativefarguesfontaine-rf0-integral-y-curly-y-affinoid-definition), `DiamondsAndVStacks:D6`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

**Proof/construction outline.**

1. A map from an affinoid untilt is a continuous W_OE(R^+)→A^+ map whose Teichmuller pseudouniformizer is invertible in A.
2. Use the perfect strict-lift universal property and theta to identify it with R^+→(A^+)^flat, preserving plus rings.
3. This is precisely a map T→S; descend the equivalence on affinoid covers.

**Acceptance properties.**

- Use the pre-adic diamond interface from D6; do not presume the non-Tate coefficient ring is a Tate pair.

**Sources.**

- [FS-geometrization, Proposition II.1.2, printed p. 49](#source-rf0-fs-geometrization): The asserted integral product includes the whole O_E-untilt functor.

<a id="relativefarguesfontaine-rf0-integral-y-gluing-for-general-base"></a>

#### 20. Gluing integral period spaces

**Theorem.** For an affinoid open S′⊂S, curly-Y_S′→curly-Y_S is an open immersion and |curly-Y_S′|=|curly-Y_S|×_|S||S′|. The affinoid construction therefore glues for every perfectoid S/F_q, compatibly with the integral diamond product and Frobenius.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `gluingForGeneralBase`.

**Hypotheses.** An open immersion of bases, not an unrestricted ordinary fibre product of adic spaces over S.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points](#relativefarguesfontaine-rf0-integral-y-untilt-functor-of-points), [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness), `DiamondsAndVStacks:D6/etale-site-comparison`.

**Proof/construction outline.**

1. Take the inverse image open in the diamond product.
2. Compare its adic structure with curly-Y_S′ after O_E→O_E_root∞, where both spaces are perfectoid and diamonds detect the isomorphism.
3. Use the split injections on structure sheaves to descend the isomorphism; cocycle identities follow from naturality.

**Acceptance properties.**

- Check the intersection of two affinoid base opens; the identification is canonical.

**Sources.**

- [FS-geometrization, Proposition II.1.3 and proof, printed p. 49](#source-rf0-fs-geometrization): The split base extension proves the open comparison before global gluing.

<a id="relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-locus"></a>

#### 21. Whole analytic A-inf locus

**Construction.** For E=Q_p put W=W(R^+). With its (p,[ϖ])-adic topology, define Z_S=Spa(W,W)∖V(p,[ϖ]), the union of D(p) and D([ϖ]). It contains curly-Y_S=D([ϖ]) and the end where [ϖ]=0,p≠0. Use the two rational charts |[ϖ]|≤|p|≠0 and |p|≤|[ϖ]|≠0 with their distinct completed Tate topologies; their overlap is the equal-boundary localisation.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `wholeAnalyticAinfLocus`.

**Hypotheses.** Perfect Tate Huber R of characteristic p with integral-element subring R^+; this additional comparison is explicitly p-typical.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), `AdicSpacesPartII:R0`.

**Proof/construction outline.**

1. Cover the complement of simultaneous vanishing by the two rational inequalities.
2. Use Kedlaya Definition 3.5 for B_1,B_2,B_12 and their plus rings.
3. Attach the sheaf structure from the stable-uniformity theorem below.

**API.**

- `wholeAnalyticAinf` (data): The complement of V(p,[ϖ]).
- `wholeAnalyticAinf_cover` (characterisation): Two inequality charts cover Z_S.
- `wholeAnalyticAinf_overlap` (compatibility): Their intersection is Spa(B_12,B_12^+).

**Distinguishing examples.**

- `analytic_crystalline_end` (computation): A valuation through W(k)[1/p], killing [ϖ], lies in Z_S.
- `analytic_special_end` (degenerate): p=0,[ϖ]≠0 is in Z_S and in curly-Y_S.
- `analytic_not_generic_union` (non-example): Removing V(p)∪V([ϖ]) would omit both ends.

**Acceptance properties.**

- Retain the crystalline end [ϖ]=0 and compare the generic part with the appropriate p-adic topology.

**Uses.** GR24 Theorem 4.15 proof and SW20 Proposition 13.1.1: Provides the precise analytic domain used in the added-source algebraicity statement.

**Atlas landmark.** Whole analytic A-inf locus.

**Sources.**

- [Ked-Ainf, Hypothesis 3.4, Definition 3.5 and Theorem 3.8](#source-rf0-ked-ainf): The locus removes simultaneous vanishing, not each divisor separately.

<a id="relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-sheafiness"></a>

#### 22. Sheafiness at both analytic ends

**Theorem.** The whole analytic A_inf locus Z_S is sheafy on the specified charts, including the end [ϖ]=0,p≠0. For any discrete perfect F_p-algebra R_0, W(R_0)[1/p] with its p-adic Tate topology is sheafy. This is distinct from strong noetherianity of the field-case Y_[0,∞), requested from the classification owner; no relative noetherianity is asserted.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `wholeAnalyticAinfSheafiness`.

**Hypotheses.** Kedlaya Hypothesis 3.4 for Z_S; discrete R_0 for the separate Witt assertion; field case only for strong noetherianity.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-locus), [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model), `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/split-injection-completed-base-change`.

**Proof/construction outline.**

1. Use the stable uniformity of A_1,A_12,B_1,B_2,B_12,B_2′ in Kedlaya 3.6; do not assert the stronger unproved property of A_2.
2. For the p-adic end, complete the coefficient-root extension and identify its perfectoid reduction; a split module retraction descends sheafiness.

**Acceptance properties.**

- Distinguish equal underlying rings with different p-adic and [ϖ]-adic topologies; no general relative noetherianity conclusion.

**Sources.**

- [SW20-berkeley, Proposition 13.1.1, Remark 13.1.2 and Theorem 13.1.3](#source-rf0-sw20-berkeley): The endpoint sheafiness and perfect discrete input are broader than the relative integral open.
- [Ked-Ainf, Proposition 3.6](#source-rf0-ked-ainf): The exact chart list suffices; A_2 is only proved uniform.

<a id="relativefarguesfontaine-rf0-integral-y-punctured-ainf-bundle-algebraicity"></a>

#### 23. Whole-locus algebraicity import interface

**Comparison.** For E=Q_p, identify RF0’s Z_S=Spa(W(R^+),W(R^+)) minus V(p,[ϖ]) and its canonical morphism to Spec W(R^+) minus V(p,[ϖ]) with Y-ad, X-sch and the pullback functor in RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles, using x=ϖ. The algebraicity equivalence used on this presentation is exactly that RF4-owned equivalence. This node supplies the presentation comparison and an exact import; it does not construct or prove a second algebraicity theorem. Extension to a finite free W(R^+)-module is imported only under RF4’s valued-field hypotheses, and not for general R.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `puncturedAinfBundleAlgebraicity`.

**Hypotheses.** Kedlaya Hypothesis 3.4. The analytic-to-scheme map is the punctured A_inf comparison, not RF3’s global Proj map.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-locus), [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-sheafiness), [RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles](#relativefarguesfontaine-rf4-vector-bundles-kedlaya-algebraicity-of-punctured-bundles).

**Proof/construction outline.**

1. Identify the defining complements, both inequality charts and the canonical locally ringed-space map with the RF4 presentation, substituting x=ϖ.
2. Transport the pullback functor across these presentation identifications and import the RF4-owned Kedlaya Theorem 3.8 equivalence.
3. For the extension corollary, retain the valued-field hypotheses of RF4 and the general-base restriction witnessed by Kedlaya Example 3.14.

**Acceptance properties.**

- Check both analytic ends and retain the field/general-ring distinction.

**Sources.**

- [Ked-Ainf, Theorem 3.8 and Example 3.14](#source-rf0-ked-ainf): The theorem is on the punctured spectrum; the example prevents a general global freeness assertion.
- [GR24-prismatic, Theorem 4.15 proof, printed pp. 74–75](#source-rf0-gr24-prismatic): Guo–Reinecke applies this precise algebraicity theorem, while product φ-module freeness has the RF4 owner.

<a id="relativefarguesfontaine-rf0-integral-y-classical-points-of-integral-period-disc"></a>

#### 24. Classical integral period points

**Definition.** For C algebraically closed perfectoid over F_q, a point of curly-Y_C is classical precisely when it is the closed Cartier point of an O_E-untilt C^sharp with a specified identification (C^sharp)^flat≃C. The completed residue field and induced theta map recover this marking. In equal characteristic curly-Y_C is an open unit disc and its classical points are a∈C with |a|<1, including a=0.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `classicalPointsOfIntegralPeriodDisc`.

**Hypotheses.** Closed points arising from marked untilts; the assertion that all maximal ideals or all closed points have this form is a separate VB2-classification theorem.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition](#relativefarguesfontaine-rf0-integral-y-curly-y-affinoid-definition), [RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points](#relativefarguesfontaine-rf0-integral-y-untilt-functor-of-points), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate).

**Proof/construction outline.**

1. Use the integral Cartier construction below to attach a point to an untilt.
2. Recover the untilt and its marking from the completed residue map.
3. For equal characteristic evaluate the coefficient π at a topologically nilpotent a.

**API.**

- `classicalIntegralPoint` (data): The Cartier point attached to a marked O_E-untilt.
- `classicalIntegralPoint_injective` (characterisation): The completed residue field and theta recover the marked untilt.
- `classicalIntegralPoint_equalChar` (compatibility): Classical points identify with {a∈C:|a|<1}.

**Distinguishing examples.**

- `classical_zero` (degenerate): In equal characteristic a=0 is classical on the special fibre.
- `classical_small_nonzero` (computation): A nonzero a with |a|<1 gives a generic classical point.
- `classical_gauss_nonexample` (non-example): A positive-radius Gauss point is not a classical point.

**Acceptance properties.**

- The marking is part of the data; maximal-ideal/PID characterization is not used in the definition.

**Uses.** FS II.1.8–II.1.14 and VB2:classification: Separates the early untilt characterization from PID and bundle classification.

**Sources.**

- [FS-geometrization, Example II.1.6 and Definition/Proposition II.1.7, printed p. 51](#source-rf0-fs-geometrization): The definition uses untilts and retains the equal-characteristic zero point.

<a id="relativefarguesfontaine-rf0-integral-y-tilting-map-of-period-disc"></a>

#### 25. Tilting map of the period disc

**Construction.** Root extension and tilting give a continuous surjective map |D_C|≃|D_C,perf|≃|curly-Y_C×O_E O_E_root∞|→|curly-Y_C|. Its inverse image of the classical locus is exactly the classical locus. On a classical a∈C, |a|<1, its image is cut out by π−[a]. The map is topological; ordinary ring structure is not transported through tilting.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `tiltingMapOfPeriodDisc`.

**Hypotheses.** C algebraically closed; D_C the ordinary open disc. Compatible root extension and the tilt convention from the root chart.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness), [RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc](#relativefarguesfontaine-rf0-integral-y-classical-points-of-integral-period-disc), `PerfectoidSpaces:P2`.

**Proof/construction outline.**

1. Use the homeomorphism between the disc and its perfection.
2. Identify the perfected disc with the tilt of the root-extended integral period space.
3. Project the coefficient extension; evaluate θ on π−[a] for classical points.

**API.**

- `periodDiscTiltMap` (data): Continuous surjective map of underlying disc/period spaces.
- `periodDiscTiltMap_classical` (characterisation): Preimage of the classical locus is the classical disc locus.
- `periodDiscTiltMap_equation` (compatibility): The classical point a maps to the Cartier ideal (π−[a]).

**Distinguishing examples.**

- `tilting_zero` (degenerate): a=0 maps to the special-fibre ideal (π).
- `tilting_equation` (computation): For 0<|a|<1 the image satisfies π=[a].
- `tilting_not_additive` (non-example): For mixed-characteristic E the topological map is not induced by an additive embedding C→W_OE(C).

**Acceptance properties.**

- At a=0 the equation is π; surjectivity does not turn tilting into an additive ring map.

**Uses.** FS II.1.9 and II.1.14: Reduces base extension and inertia to ordinary disc Gauss points.

**Sources.**

- [FS-geometrization, Proposition II.1.8 and preceding construction, printed p. 51](#source-rf0-fs-geometrization): The displayed map sends classical x to (π−[x]) and detects the classical locus.

<a id="relativefarguesfontaine-rf0-integral-y-gauss-disc-fibre"></a>

#### 26. Gauss-point disc in the base-extension fibre

**Theorem.** Let x∈D_C(C), 0<ρ<1 with the closed ρ-disc contained in D_C, and x_ρ its Gauss point. After base change to its completed residue field C(x_ρ), the fibre of x_ρ contains the open disc of radius ρ around the tautological point. For power series f, |u−t|<ρ implies |f(u)−f(t)|<|f(x_ρ)| when f is nonzero, so the restricted valuations agree.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `gaussDiscFibre`.

**Hypotheses.** Use a disc genuinely contained in the open unit disc. The printed membership condition x_ρ∈|D_C| already excludes ρ=1; 0<ρ<1 is an explicit equivalent range here, not a source misprint.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc](#relativefarguesfontaine-rf0-integral-y-classical-points-of-integral-period-disc), `AdicSpacesPartII:R0/affinoid-maximum-modulus`.

**Proof/construction outline.**

1. Translate the centre to zero and use |u^n−t^n|<ρ^n.
2. Bound each coefficient term strictly below the attained Gauss maximum.
3. Convergence of the power series ensures the maximum is attained and proves the valuation equality.

**Acceptance properties.**

- A zero-radius point is classical and is not an instance of this positive-radius theorem.

**Sources.**

- [FS-geometrization, Lemma II.1.10 and proof, printed p. 52](#source-rf0-fs-geometrization): The Gauss-point calculation is used only for discs lying in D_C; the endpoint in the printed hypothesis is restricted.

<a id="relativefarguesfontaine-rf0-integral-y-classical-base-change-and-nonclassical-fibres"></a>

#### 27. Classical base change and nonclassical fibres

**Theorem.** For C′/C complete algebraically closed, a point x of curly-Y_C is classical iff its fibre in curly-Y_C′ consists of a classical point. A nonclassical rank-one point has, after some such extension, a fibre containing a nonempty open subset. No corresponding claim is made for arbitrary higher-rank points.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `classicalBaseChangeAndNonclassicalFibres`.

**Hypotheses.** The phrase “is a classical point” refers to the whole fibre, not just the existence of a classical point in it.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc](#relativefarguesfontaine-rf0-integral-y-tilting-map-of-period-disc), [RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre](#relativefarguesfontaine-rf0-integral-y-gauss-disc-fibre), `DiamondsAndVStacks:D2/v-descent-of-functions`.

**Proof/construction outline.**

1. For classical points use marked-untilt base extension.
2. For the converse, descend the isomorphism of the corresponding residue-field diamond along the v-cover Spa C′→Spa C.
3. For nonclassical rank-one points reduce through the tilting map to a Gauss disc or decreasing balls with positive limiting radius, and apply the Gauss-fibre theorem.

**Acceptance properties.**

- The nonclassical fibre can contain classical points; merely finding one does not characterize classical x.

**Sources.**

- [FS-geometrization, Proposition II.1.9 and proof, printed pp. 51–52](#source-rf0-fs-geometrization): The dichotomy is specifically for nonclassical rank-one points.

<a id="relativefarguesfontaine-rf0-integral-y-inertia-at-a-period-gauss-point"></a>

#### 28. Inertia at a period Gauss point

**Theorem.** On the generic period domain Y_C there is a nonclassical rank-one point x with completed residue field K(x) such that Gal(K(x)^sep/K(x))→I_E is surjective. The image of any origin-centred Gauss point of radius 0<r<1 under the punctured disc tilting map works.

Identifier: `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`. Parent: `RelativeFarguesFontaine:RF0:integral-Y`.

Proposed declaration: `inertiaAtAPeriodGaussPoint`.

**Hypotheses.** C algebraically closed over F_q with the coefficient embedding used to identify the unramified completion in K(x); this is the early input to VS1’s Drinfeld argument.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc](#relativefarguesfontaine-rf0-integral-y-tilting-map-of-period-disc), [RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre](#relativefarguesfontaine-rf0-integral-y-gauss-disc-fibre), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Proof/construction outline.**

1. The residue field contains the unramified coefficient completion, so the Galois image lies in inertia.
2. For every finite extension of that coefficient completion, the Gauss locus lifts uniquely with its radius.
3. Connectedness of the fibre of each finite extension forces the map onto every finite inertia quotient; pass to the inverse limit.

**Acceptance properties.**

- Export the exact residue-field inertia statement to VStackSheavesAndLisseCategories:VS1, without importing Drinfeld’s lemma back.

**Sources.**

- [FS-geometrization, Lemma II.1.14 and proof, printed p. 54](#source-rf0-fs-geometrization): The nonclassical Gauss-point calculation gives the surjection onto inertia.

### RF0 — annuli and relative period-ring interfaces

Construct the generic domain and rational radius windows, then the normed ring variants and their restriction maps. The presheaf, sheaf, Kiehl, Stein and finite-étale theorems retain their exact lists and topological hypotheses. The fixed ℚ_p field specialization is a comparison with upstream Adic Spaces; all-E norm transport is a separate proof interface.

<a id="relativefarguesfontaine-rf0-annuli-generic-period-domain"></a>

#### 29. Generic relative period domain

**Construction.** Define Y_S=curly-Y_S∖V(π)=Spa W_OE(R^+)∖V(π[ϖ]) in the affinoid case. It is the generic open of the integral period space, with the inherited sheaf and Frobenius. Its points have both |π| and |[ϖ]| nonzero. Functoriality is induced from coefficient maps and gluing.

Identifier: `RelativeFarguesFontaine:RF0:annuli/generic-period-domain`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `genericPeriodDomain`.

**Hypotheses.** S perfectoid over F_q; the integral construction already supplies sheafiness.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition](#relativefarguesfontaine-rf0-integral-y-curly-y-affinoid-definition), [RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base](#relativefarguesfontaine-rf0-integral-y-gluing-for-general-base).

**Proof/construction outline.**

1. Take the nonvanishing open of π and restrict the structure sheaf.
2. Use coefficient functoriality and the independence of ϖ to identify this with the displayed affine open.
3. Glue along base opens.

**API.**

- `genericPeriodDomain` (data): The generic open Y_S.
- `genericPeriodDomain_open` (characterisation): The inclusion Y_S→curly-Y_S is open.
- `genericPeriodDomain_functorial` (functoriality): A map T→S induces Y_T→Y_S; identities and composition agree.

**Distinguishing examples.**

- `generic_equal_char` (compatibility): For E=F_q((π)),Y_C is the punctured open unit disc.
- `generic_special_absent` (degenerate): The point π=0 is excluded.
- `generic_both_invertible` (computation): Both π and [ϖ] are nonzero at every generic point.

**Acceptance properties.**

- The special-fibre Cartier point is absent here, while it remains present in curly-Y.

**Uses.** RF1 quotient and RF2 generic divisors: Supplies the actual adic domain on which Frobenius acts discontinuously.

**Atlas landmark.** Generic relative period domain.

**Sources.**

- [FS-geometrization, Definition II.1.15, printed p. 54](#source-rf0-fs-geometrization): The generic period domain removes precisely the π=0 fibre from curly-Y.

<a id="relativefarguesfontaine-rf0-annuli-radius-function-and-rational-annuli"></a>

#### 30. Radius and relative period annuli

**Construction.** For x∈|Y_S| let x̃ be its unique rank-one generalization and rad_ϖ(x)=log|\[ϖ\](x̃)|/log|π(x̃)|∈(0,∞). For rational 0<a≤b define the rational open Y_[a,b] by |π|^b≤|[ϖ]|≤|π|^a, using integer-power inequalities to interpret rational exponents. Its ring B_[a,b] is the completed rational localisation of W_OE(R^+), with integral-closure plus ring. Equal endpoints are allowed. The radius factors through the Berkovich quotient and rad_ϖ(φx)=q rad_ϖ(x). Changing ϖ changes the radius function but gives cofinal annular exhaustions of the same Y_S.

Identifier: `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `radiusFunctionAndRationalAnnuli`.

**Hypotheses.** Affinoid S; fixed ϖ for this radius, a,b positive rational. The rational open may differ from the entire set rad^−1([a,b]) at higher-rank points.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/generic-period-domain](#relativefarguesfontaine-rf0-annuli-generic-period-domain), `DiamondsAndVStacks:D5/berkovich-quotient`, `AdicSpacesPartII:R0`.

**Proof/construction outline.**

1. Use the maximal/rank-one generalization of analytic points; logarithm ratios are independent of rescaling the real valuation.
2. Clear denominators in the rational inequalities and use Huber rational localisation.
3. q-Frobenius fixes π and raises [ϖ] to the qth power.
4. Compare powers of two pseudouniformizers for cofinality; do not assert their radii equal.

**API.**

- `periodRadius` (data): The logarithm ratio at the rank-one generalization.
- `periodAnnulus` (data): The completed rational chart for [a,b].
- `periodRadius_frobenius` (characterisation): rad_ϖ(φx)=q rad_ϖ(x).
- `periodAnnulus_restrict` (functoriality): I⊂J induces the continuous rational restriction B_J→B_I.
- `periodAnnulus_plus` (compatibility): B_I^+ is the integral closure of its ring of definition.

**Distinguishing examples.**

- `radius_scale` (computation): If |[ϖ]|=|π|^a at a rank-one point, rad_ϖ=a.
- `annulus_equal_ends` (degenerate): [a,a] gives a boundary annulus and is not discarded as empty.
- `radius_varpi_power` (non-example): Replacing ϖ by ϖ^m multiplies rad by m, while preserving the generic domain.

**Acceptance properties.**

- For a=b the affinoid boundary is used in the fundamental-domain gluing.

**Uses.** RF1 fundamental annulus and RF3 eigenvector restrictions: Provides the q-scaled annular cover and its transition rings.

**Atlas landmark.** Relative period annuli.

**Sources.**

- [FS-geometrization, Proposition II.1.16, printed pp. 54–55](#source-rf0-fs-geometrization): The source allows boundary circles and distinguishes the rational open from the radius inverse image.

<a id="relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu"></a>

#### 31. Witt seminorm extension and restriction

**Construction.** For a perfect F_p-algebra with a power-multiplicative seminorm α bounded by the trivial norm, define λ(α)(Σp^i[x_i])=max_i p^(−i)α(x_i), and μ(β)(x)=β([x]). They preserve multiplicative seminorms. The maps on their Berkovich spectra are continuous, μλ=id and λμ≥id. The same formulas extend to the relative integral and interval rings with the domination conditions of KL5.1.2.

Identifier: `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `wittSeminormLambdaMu`.

**Hypotheses.** The initial ring need not be a field or Banach. The later analytic relative version uses a perfect uniform Banach pair over an analytic field and 0<s≤r.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), `mathlib:Valuation`.

**Proof/construction outline.**

1. Use homogeneous Witt addition polynomials to prove the ultrametric bound.
2. A leading maximal coefficient gives multiplicativity when α is multiplicative; iterate for power multiplicativity.
3. Prove μ is subadditive despite the nonadditivity of Teichmuller representatives.
4. Use stable Witt presentations to prove continuity and μλ=id; extend bounded seminorms to completions.

**API.**

- `wittLambda` (data): Extends a bounded multiplicative seminorm by the coefficient maximum.
- `wittMu` (data): Restricts a seminorm along the multiplicative Teichmuller section.
- `wittMu_lambda` (characterisation): μ(λ(α))=α.
- `wittLambda_mu` (characterisation): λ(μ(β))≥β.
- `wittLambda_continuous` (compatibility): The spectrum map is continuous.

**Distinguishing examples.**

- `lambda_teich` (computation): λ(α)([x])=α(x).
- `lambda_p` (computation): λ(α)(p)=p^−1 for a nonzero seminorm.
- `lambda_mu_not_identity` (non-example): For a primitive quotient seminorm killing p−[ϖ], λμ need not kill that element.

**Acceptance properties.**

- Distinguish a ring homomorphism from this construction on seminorms.

**Uses.** KL5.1–5.4: Defines relative annular norms, radius and the Berkovich retraction.

**Atlas landmark.** Witt seminorm retraction.

**Sources.**

- [KL15-foundations, Definition 3.3.2, Lemma 3.3.3 and Proposition 5.1.2](#source-rf0-kl15-foundations): The first construction is on general perfect rings; the later estimates state the analytic domination conditions.
- [Ked-Witt, §4, Theorem 4.5](#source-rf0-ked-witt): The theorem gives continuity and the retraction inequalities, without calling the Teichmuller map additive.

<a id="relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings"></a>

#### 32. Relative extended Robba rings

**Construction.** For a perfect uniform Banach pair (R,R^+) over an analytic field of characteristic p with spectral norm α, define Ẽ^int=W(R), Ẽ=Ẽ^int[1/p], R̃^(int,r)={Σ_(i≥0)p^i[x_i]:p^(−i)α(x_i)^r→0}, R̃^(bd,r)=R̃^(int,r)[1/p], R̃^r its Frechet completion for λ(α^s), 0<s≤r, and R̃^[s,r] its Banach completion for max(λ(α^s),λ(α^r)). Dropping r takes the union over r>0. Define each plus-input variant by R^+ instead of R. Its integral/bounded variants are W(R^+) and W(R^+)[1/p]; R̃^+ is the completion for all s>0, whereas R̃^∞=∩_rR̃^r is a different ring. Record p-adic, weak, Banach, Frechet and inductive limit topologies separately.

Identifier: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `relativeExtendedRobbaRings`.

**Hypotheses.** KL Hypothesis 5.0.1. These are extended relative rings. The paper does not construct the arithmetic relative Robba rings. For all E replace p by π and p-Frobenius by q-Frobenius and prove the stated extension.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), [RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu](#relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu).

**Proof/construction outline.**

1. Use the coefficient norm estimates to show the growth subsets are subrings.
2. Localize integral growth rings and complete in the indicated families of norms.
3. Use log convexity to identify the interval norm with its two endpoint maximum.
4. Construct inclusions, their topologies and Frobenius φ:R̃^[s,r]≃R̃^[s/q,r/q].

**API.**

- `relativeRobbaIntegral` (data): The coefficient-growth subring at r>0.
- `relativeRobbaInterval` (data): The complete interval ring at 0<s≤r.
- `relativeRobbaPlus` (data): The all-positive-radii completion of W(R^+)[1/p].
- `relativeRobba_restrict` (functoriality): Continuous interval restrictions for interval inclusion.
- `relativeRobba_frobenius` (compatibility): φ transports [s,r] to [s/q,r/q], with λ_t(φx)=λ_(qt)(x).

**Distinguishing examples.**

- `robba_teich` (computation): Every [x] belongs to every integral growth ring.
- `robba_singleton_interval` (degenerate): At s=r the interval completion uses a single endpoint norm.
- `robba_plus_infinity` (non-example): A Teichmuller element [x] with α(x)>1 belongs to R̃^∞ and fails the R̃^+ growth criterion when R^+=R°; equality of these two rings is false.

**Acceptance properties.**

- Never identify R̃^∞ with R̃^+ or complete every ring in a single norm.

**Uses.** RF0 rational annuli: Provides the actual rings of analytic functions and their restriction maps. RF4 Frobenius modules: Supplies rings, topologies and exact interval restrictions without prematurely importing module classification.

**Atlas landmark.** Relative extended Robba rings.

**Sources.**

- [KL15-foundations, Hypothesis 5.0.1; Definitions 5.1.1 and 5.1.3](#source-rf0-kl15-foundations): The source retains a general Banach base and distinguishes the several completions and topologies.

<a id="relativefarguesfontaine-rf0-annuli-robba-growth-units-and-invariants"></a>

#### 33. Robba growth, units and Frobenius invariants

**Theorem.** For nonzero x, t↦log λ(α^t)(x) is convex. In R̃^r, boundedness as t→0 characterizes R̃^(bd,r). Every unit of R̃ is already a unit in R̃^bd by KL5.2.3. The φ^d-invariant ring is W(R^(φ^d))[1/p], retaining idempotents and disconnected constants. For R^+=R°, membership x∈R̃^+ within R̃^∞ is equivalent to limsup_(t→∞)λ_t(x)^(1/t)≤1.

Identifier: `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `robbaGrowthUnitsAndInvariants`.

**Hypotheses.** Use exactly the bounded or completed ring in each criterion. Frobenius invariants are not asserted to be Q_p when the base is disconnected.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu](#relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu).

**Proof/construction outline.**

1. Prove convexity first on finite Witt sums and then by completion.
2. Use bounded endpoint norms to recover bounded Witt coefficients.
3. For a unit x with inverse y, use affine residue-field log norms and a uniform two-radius bound to show both x and y have bounded growth near zero.
4. For invariants compare each coefficient under φ^d; for the plus criterion use the integral/fractional splitting and the asymptotic coefficient maximum.

**Acceptance properties.**

- Check the invariant formula on R=F_p×F_p before using a scalar fixed-field simplification.

**Sources.**

- [KL15-foundations, Lemmas 5.2.1–5.2.4 and Lemma 5.2.11](#source-rf0-kl15-foundations): The norm estimates and coefficient criteria retain the relative base, and the last result distinguishes plus from infinity.

<a id="relativefarguesfontaine-rf0-annuli-robba-controlled-splittings"></a>

#### 34. Controlled Robba splittings and intersections

**Theorem.** For 0<s≤r and n∈Z every x∈R̃^[s,r] splits x=y+z with y∈p^nR̃^(int,r), z extending to every [s,r′], r′≥r, and λ_t(z)≤p^((1−n)(1−t/r))λ_r(x)^(t/r) for t≥r. For 0<c<1 there is the second splitting of KL5.2.9 into bounded and plus parts with endpoint norm bounds and its φ estimates. Consequently R̃^[s,r]∩R̃^[s′,r′]=R̃^[s,r′] inside R̃^[s′,r] for 0<s≤s′≤r≤r′. Intersection preservation for a base ring square requires strict inclusions and, for completions, a strict difference map.

Identifier: `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `robbaControlledSplittings`.

**Hypotheses.** The interval intersection specifies its common ambient ring. The strictness conditions of Remark 5.2.13 cannot be removed.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants](#relativefarguesfontaine-rf0-annuli-robba-growth-units-and-invariants), `AdicSpacesPartII:R0/strict-complex-completion-exact`.

**Proof/construction outline.**

1. Split finite Witt sums at their p-adic index, or by α(x_i)>c.
2. Approximate a completed element by a geometrically convergent sequence of bounded sums.
3. Sum the split pieces using the displayed estimates.
4. Apply the integral-ring intersection lemma and strict completion exactness to the interval and base-square intersections.

**Acceptance properties.**

- Do not use the naive coefficient-series formula for an arbitrary interval-completed element.

**Sources.**

- [KL15-foundations, Lemmas 5.2.6–5.2.10 and Remark 5.2.13](#source-rf0-kl15-foundations): The source expressly warns that even injectivity may fail without the strictness assumptions.

<a id="relativefarguesfontaine-rf0-annuli-relative-period-presheaves"></a>

#### 35. Relative period presheaves

**Construction.** On Spa(R,R^+) define the period presheaf for each of the twelve variants Ẽ^int,Ẽ,R̃^(int,r),R̃^(int,+),R̃^int,R̃^(bd,r),R̃^(bd,+),R̃^bd,R̃^[s,r],R̃^r,R̃^+,R̃ by the inverse limit of its values on rational affinoids contained in an open U. Restrictions and base maps are induced by the coefficient maps and completions. The plus-input and positive-radii-completion variants keep their distinct topologies.

Identifier: `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `relativePeriodPresheaves`.

**Hypotheses.** Perfect uniform Banach base as in KL5.0.1; bounds and radii must be adjusted for a bounded coefficient map before taking the union.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), `AdicSpacesPartII:R3`.

**Proof/construction outline.**

1. Construct the functor on the rational basis from Witt naturality and bounded norm estimates.
2. Use restriction coherence to define the limit on all opens.
3. Prove its value on a rational affinoid is its original period ring once the basis sheaf condition is established.

**API.**

- `relativePeriodPresheaf` (data): The twelve rational-basis presheaves and their limits on opens.
- `relativePeriodPresheaf_restrict` (functoriality): Compatible restriction maps for open inclusion.
- `relativePeriodPresheaf_affinoid` (characterisation): Its rational-affinoid value agrees with the relevant period ring after the sheaf theorem.
- `relativePeriodPresheaf_phi` (compatibility): Frobenius acts with the indicated radius transport.

**Distinguishing examples.**

- `period_empty` (degenerate): The value on the empty open is the terminal zero ring.
- `period_restriction_chain` (compatibility): Restriction through two rational subopens equals their composite.
- `period_plus_distinction` (non-example): The presheaves R̃^+ and R̃ need not agree on an affinoid with a coefficient of norm greater than one.

**Acceptance properties.**

- Keep the sheaf claim separate from the definition.

**Uses.** KL8.3.4 and relative curves: Globalizes period functions over nonaffinoid bases and the etale site.

**Sources.**

- [KL15-foundations, Definition 5.3.1](#source-rf0-kl15-foundations): The definition is on the rational basis and lists twelve variants rather than a single unspecified period sheaf.

<a id="relativefarguesfontaine-rf0-annuli-relative-period-sheaf-and-acyclicity"></a>

#### 36. Period sheaves and rational acyclicity

**Theorem.** Every period presheaf of KL5.3.1 is a sheaf. Rational Tate acyclicity is asserted for Ẽ^int,Ẽ,R̃^(int,r),R̃^int,R̃^(bd,r),R̃^bd,R̃^[s,r],R̃^r,R̃, exactly the nine variants of Theorem5.3.3. The Kiehl property is proved for Ẽ^int and R̃^(int,r), and separately for R̃^[s,r]; it is not automatically asserted for all twelve variants.

Identifier: `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `relativePeriodSheafAndAcyclicity`.

**Hypotheses.** Use continuous strict rational covering sequences and the norm assigned to each variant. The plus variants are sheaves without the extra acyclicity claim in this theorem.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves](#relativefarguesfontaine-rf0-annuli-relative-period-presheaves), [RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings](#relativefarguesfontaine-rf0-annuli-robba-controlled-splittings), `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`.

**Proof/construction outline.**

1. Lift the elementary Laurent covering sequence coefficientwise in Witt expansions.
2. Apply the controlled splitting to preserve its strictness under each completion.
3. For R̃^r choose a convergent correction sequence over the shrinking radii, eliminating the lim^1 term.
4. Apply the imported rational-basis sheaf and Kiehl descent criteria only to the cases proved in KL5.3.3 and5.3.6.

**Acceptance properties.**

- The final plan must retain the exact nine acyclic variants and avoid a blanket Kiehl assertion.

**Atlas landmark.** Relative period sheaf theorem.

**Sources.**

- [KL15-foundations, Lemma 5.3.2, Theorems 5.3.3 and5.3.6](#source-rf0-kl15-foundations): The all-variant sheaf statement and restricted acyclicity/Kiehl lists are separate source assertions.

<a id="relativefarguesfontaine-rf0-annuli-interval-rings-relatively-perfectoid"></a>

#### 37. Relatively perfectoid interval rings

**Theorem.** For 0<s≤r the Banach rings Ẽ, R̃^(bd,r) and R̃^[s,r] are relatively perfectoid. For any compatible adic plus extension they are stably uniform, sheafy, rationally acyclic and satisfy finite-projective Kiehl gluing. After scalar extension to the completed p-power-root tower the interval norm is power multiplicative and the ring is perfectoid. In all-E annular charts use the specified whole root relations and prove the coefficient extension of these norm estimates.

Identifier: `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `intervalRingsRelativelyPerfectoid`.

**Hypotheses.** No field assumption on R. Relative perfectoidness is the imported sousperfectoid/relative-perfectoid condition, not an unproved designation for every Frechet or integral ring.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants](#relativefarguesfontaine-rf0-annuli-robba-growth-units-and-invariants), [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model), `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/split-injection-completed-base-change`, `PerfectoidSpaces:P3`.

**Proof/construction outline.**

1. Compute scalar tensor norms using fractional p-power exponents and their orthogonal basis.
2. Prove power multiplicativity away from the finitely many norm-crossing radii and use convex continuity at crossings.
3. Frobenius-compatible Teichmuller representatives generate a dense perfect subring after tensor extension.
4. Apply the R5 split completed-base-change and sheafiness criterion to the listed Banach rings.
5. Use the corrected perfectoid completed-tensor comparison of KLII Theorem 3.3.13 (including injectivity), requested from P3, when invoking Lemma 5.3.14; the old KL3.6.11 proof is incomplete.

**Acceptance properties.**

- The integral period disc uses its own chart theorem; it is not one of the three rings in this assertion.

**Sources.**

- [KL15-foundations, Theorem 5.3.9 and Lemma5.3.14](#source-rf0-kl15-foundations): The theorem concerns three Banach rings; its proof verifies the tensor norm rather than assuming its exactness.

<a id="relativefarguesfontaine-rf0-annuli-interval-adic-pair-and-base-projection"></a>

#### 38. Interval adic pairs and base projection

**Construction.** Give R̃^[s,r] the plus ring obtained by completing the subring generated by elements of endpoint norm <1 and [R^+]. A semivaluation first determines its unique exponent t∈[s,r], then a seminorm γ=μ(β)^(1/t) of R. Extending to H(γ) and using {x:v([x])≤1} yields the valuation on R. This defines μ_ad:Spa(R̃^[s,r],R̃^[s,r],+)→Spa(R,R^+) as a continuous map of adic topological spaces, without a structural ring homomorphism R→R̃^[s,r].

Identifier: `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `intervalAdicPairAndBaseProjection`.

**Hypotheses.** Teichmuller representatives are multiplicative; their nonadditivity must be handled through the valuation-ring criterion. The pair uses the specified completed plus ring.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid](#relativefarguesfontaine-rf0-annuli-interval-rings-relatively-perfectoid), [RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu](#relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu), `tauceti:TauCeti.ValuationSpectrum.spa`.

**Proof/construction outline.**

1. Determine t by evaluating a topologically nilpotent unit from the analytic coefficient field.
2. Use domination to extend the seminorm to the completed residue field.
3. Prove the bounded Teichmuller representatives form a valuation ring.
4. Check the plus condition and continuity on rational inequalities.

**API.**

- `relativeAnnulusPair` (data): The interval Banach ring with its completed plus ring.
- `relativeAnnulus_exponent` (characterisation): The unique t∈[s,r] determined by the coefficient valuation.
- `relativeAnnulus_toBase` (data): The continuous adic-spectrum map μ_ad.
- `relativeAnnulus_baseValuation` (characterisation): Its valuation ring consists of the bounded Teichmuller representatives.

**Distinguishing examples.**

- `annulus_projection_teich` (computation): The pullback valuation measures [x] by the corresponding coefficient valuation.
- `annulus_endpoint` (degenerate): Both t=s and t=r occur; a singleton interval is allowed.
- `annulus_no_additive_teich` (non-example): The projection is defined by valuations although [x+y] need not equal [x]+[y].

**Acceptance properties.**

- Use the source plus ring and normalized exponent in the projection.

**Uses.** KL5.3.11–5.3.13: Pulls rational base domains back to genuine rational annular domains.

**Sources.**

- [KL15-foundations, Lemma5.3.4 and Definition5.3.10](#source-rf0-kl15-foundations): The adic projection is built from a valuation ring, not a nonexistent additive Teichmuller ring map.

<a id="relativefarguesfontaine-rf0-annuli-annular-rational-base-change"></a>

#### 39. Rational base change and interval descent

**Theorem.** A rational localization (R,R^+)→(S,S^+) induces the rational localization of interval pairs representing μ_ad^−1Spa(S,S^+). Rational base coverings therefore induce annular coverings and the interval period sheaf satisfies Kiehl gluing. For a finite covering I=⋃I_j of a compact interval in (0,∞), R̃^I→∏R̃^I_j is effective descent for finite projective modules. After the scalar extension of KL5.3.14, each subinterval restriction is itself a rational localization; before that extension use the proven gluing square, rather than asserting rationality.

Identifier: `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `annularRationalBaseChange`.

**Hypotheses.** The interval cover is finite and uses closed intervals; the Banach base is perfect uniform over an analytic field. General base maps give functorial maps, not a universal uncompleted tensor identity.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection](#relativefarguesfontaine-rf0-annuli-interval-adic-pair-and-base-projection), [RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings](#relativefarguesfontaine-rf0-annuli-robba-controlled-splittings), [RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid](#relativefarguesfontaine-rf0-annuli-interval-rings-relatively-perfectoid), `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

**Proof/construction outline.**

1. Lift rational inequalities by Teichmuller representatives.
2. Apply stable uniformity and the spectral-norm isometry criterion to the map from the rational localization.
3. The dense coefficient subring proves surjectivity and the rational base-cover assertion.
4. For interval covers use controlled splitting/intersections to check the gluing square, or descend the rational-cover argument after the specified perfectoid scalar extension.

**Acceptance properties.**

- Do not call every interval restriction a rational localization over Q_p before the required scalar extension.

**Sources.**

- [KL15-foundations, Lemma5.3.11, Corollary5.3.12, Theorems5.3.13 and5.3.16](#source-rf0-kl15-foundations): Rational localization in the base and descent along interval covers are distinct comparisons.

<a id="relativefarguesfontaine-rf0-annuli-berkovich-period-deformation"></a>

#### 40. Berkovich period deformation

**Construction.** On M(R̃^(int,r)) the stable-presentation construction defines H(β,u), u∈[0,1], with H(β,0)=β, H(β,1)=λμ(β), μH(β,u)=μ(β), and H(H(β,u),v)=H(β,max(u,v)). It is continuous. On T_R=⋃_(0<s<r)M(R̃^[s,r]) it gives a strong deformation retract to M(R)×(0,∞). The properly discontinuous φ^d action scales the exponent by q=p^d, has compact Hausdorff quotient X_R, and descends the retraction to M(R)×(R_>0/q^Z)≃M(R)×S^1.

Identifier: `RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `berkovichPeriodDeformation`.

**Hypotheses.** These are Berkovich spaces and their maximal Hausdorff quotient. Neither the deformation nor the circle description asserts an adic ringed-space product.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu](#relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu), [RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection](#relativefarguesfontaine-rf0-annuli-interval-adic-pair-and-base-projection), [RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants](#relativefarguesfontaine-rf0-annuli-robba-growth-units-and-invariants), `DiamondsAndVStacks:D5/berkovich-quotient`.

**Proof/construction outline.**

1. Extend to the residue valued field and define H using stable Witt presentations.
2. Check the endpoint, restriction and max-semigroup formulas.
3. Embed into a Witt spectrum for the trivially normed integral ring to prove joint continuity.
4. Use the exponent and a compact fundamental annulus to prove discontinuity and compactness; descend the compatible deformation.

**API.**

- `periodHomotopy` (data): The jointly continuous H on integral period seminorms.
- `periodHomotopy_zero` (characterisation): H(β,0)=β.
- `periodHomotopy_one` (characterisation): H(β,1)=λμ(β).
- `periodHomotopy_max` (characterisation): H(H(β,u),v)=H(β,max(u,v)).
- `periodBerkovichQuotient` (data): The compact quotient and its circle-valued exponent.

**Distinguishing examples.**

- `homotopy_fixed` (compatibility): H(λ(α),u)=λ(α) for all u.
- `homotopy_mu` (computation): μ remains constant along each homotopy path.
- `circle_disconnected_base` (non-example): For a disconnected R, X_R retains the corresponding components; it is not a single circle.

**Acceptance properties.**

- The topological circle statement supplies no adic structural map to the base.

**Uses.** RF1 topology and KL8.7: Identifies the maximal Hausdorff quotient and the topological exponent map.

**Sources.**

- [KL15-foundations, Theorem5.4.1, Definition5.4.3, Theorem5.4.4 and Proposition5.4.6](#source-rf0-kl15-foundations): The source proves a topological retraction on Berkovich spectra and their quotient.

<a id="relativefarguesfontaine-rf0-annuli-period-spectrum-surjectivity"></a>

#### 41. Surjectivity of relative period spectra

**Theorem.** If R→S is bounded between perfect uniform Banach F_p-algebras and M(S)→M(R) is surjective, then M(R̃_S^(int,r))→M(R̃_R^(int,r)) is surjective for every r>0. The proof extends a seminorm using a perfected auxiliary variable, a primitive quotient and a lift from M(S). No faithfully flat tensor-product hypothesis is substituted for the given spectral surjectivity.

Identifier: `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `periodSpectrumSurjectivity`.

**Hypotheses.** R,S retain their Banach topology; use exactly KL5.4.2’s hypothesis on Berkovich spectra.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu](#relativefarguesfontaine-rf0-annuli-witt-seminorm-lambda-mu), [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation](#relativefarguesfontaine-rf2-integral-divisors-ramified-primitive-untilt-equation), `AdicSpacesPartII:R0`, `PerfectoidSpaces:P3`.

**Proof/construction outline.**

1. Adjoin and perfect a variable with its p^−1-Gauss norm.
2. Extend the given Witt seminorm so p−T is killed and read it as a primitive-quotient norm.
3. Lift the base seminorm through M(S) and the residue-field completed tensor extension.
4. Restrict the lifted norm back to the original integral growth ring.
5. Use the corrected primitive perfectoid quotient input requested from P3, as in KLII Theorem 3.3.13 rather than the incomplete proof of KL3.6.11 (source finding E10).

**Acceptance properties.**

- Do not broaden the conclusion to an adic-cover or tensor isomorphism without another comparison.

**Sources.**

- [KL15-foundations, Lemma5.4.2](#source-rf0-kl15-foundations): The conclusion is spectral surjectivity, with an explicit auxiliary-variable proof.

<a id="relativefarguesfontaine-rf0-annuli-period-rings-finite-etale-compatibility"></a>

#### 42. Finite etale compatibility of period rings

**Theorem.** Finite etale S/R lifts to the relative Witt and extended period rings. FÉt(R̃^int)→FÉt(W(R))→FÉt(R) are tensor equivalences; at a fixed r the category is φ^−1-equivariant FÉt(R̃^(int,r)), with quasi-inverse S↦R̃_S^(int,r). The bounded and completed period-ring extensions of KL5.5.4 are finite etale and satisfy its finite-module base-change comparisons. For a normalized degree-one primitive z with z_0∈R× and z−[z_0]∈pW(R^+)×, r≥1 and intervals containing 1, the listed period-ring maps become isomorphisms modulo z^m, m>0. Consequently the lifted finite-etale correspondence agrees with the imported perfectoid tilting correspondence.

Identifier: `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `periodRingsFiniteEtaleCompatibility`.

**Hypotheses.** The fixed-radius integral category requires Frobenius descent. The primitive quotient is normalized and is taken at a window containing its radius. Use the corrected primitive definition in KLII Appendix A: z_0 is a unit of R. This concerns the generic quotient comparison and does not remove the π=0 integral leg.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings](#relativefarguesfontaine-rf0-annuli-robba-controlled-splittings), [RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation](#relativefarguesfontaine-rf2-integral-divisors-ramified-primitive-untilt-equation), `AdicSpacesPartII:R3/finite-projective-etale-descent`, `PerfectoidSpaces:P3`.

**Proof/construction outline.**

1. Lift a finite residue-module generating set and use a strict norm bound to obtain generators at sufficiently small radii. In the iterative proof of Lemma 5.5.2 initialize the residual with z_0=z, not the printed z_0=0 (source finding E11). Also use the S-period ring for the final arbitrary element in Lemma5.5.2 (E13), and read the scalar ring of Proposition5.5.3 without the printed FÉt wrapper (E14).
2. Use henselian lifting for the integral union and Frobenius iteration for each fixed radius.
3. Lift a finite-projective splitting and prove the completed tensor map is isometric.
4. Use the primitive relation to exchange p and [z_0] in the finite quotients; induct on m via regularity. Use the corrected x_0 coefficient and spectral coefficient norm in the final estimate of KL5.5.5 (KLII Appendix A).
5. Compare the finite-etale equivalence with the P3 almost-purity supplier, without rebuilding almost purity.

**Acceptance properties.**

- Record the finite module tensor comparisons from Proposition5.5.4, not a general tensor-limit interchange.

**Sources.**

- [KL15-foundations, Lemma 5.5.2 (printed pp. 128–129), Propositions 5.5.3–5.5.4, Lemma 5.5.5 and Corollary 5.5.6](#source-rf0-kl15-foundations): The fixed-radius integral category has Frobenius descent, and the primitive quotient theorem keeps its normalization.

<a id="relativefarguesfontaine-rf0-annuli-stein-exhaustion-and-higher-acyclicity"></a>

#### 43. Stein exhaustion of the generic period space

**Theorem.** For affinoid perfectoid S, the generic Y_S admits a countable increasing exhaustion by compact rational annuli. Each annulus is sheafy and O-acyclic. Restriction maps on analytic functions have dense image, and the controlled annular approximations imply lim^1=0 for the countable inverse system. Hence H^i(Y_S,O)=0 for i>0 and O(Y_S) is its Frechet inverse limit. For general S this is applied on affinoid base charts, rather than asserting global acyclicity over a nonaffinoid base.

Identifier: `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `steinExhaustionAndHigherAcyclicity`.

**Hypotheses.** Affinoid base and a countable cofinal annular exhaustion. The topological inverse-limit argument uses dense restrictions and complete Banach spaces, not algebraic Mittag–Leffler surjectivity.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid](#relativefarguesfontaine-rf0-annuli-interval-rings-relatively-perfectoid), [RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity](#relativefarguesfontaine-rf0-annuli-relative-period-sheaf-and-acyclicity), [RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings](#relativefarguesfontaine-rf0-annuli-robba-controlled-splittings), `AdicSpacesPartII:R0/strict-complex-completion-exact`.

**Proof/construction outline.**

1. Choose cofinal intervals tending to both ends of the generic radius range.
2. Apply relatively perfectoid annular sheafiness and Tate acyclicity.
3. Approximate restrictions by the common dense bounded period subring.
4. Use a geometrically convergent correction sequence to kill the lim^1 obstruction, and the covering spectral sequence to conclude higher O-acyclicity.

**Acceptance properties.**

- No unproved vanishing for an arbitrary nonaffinoid base, and no automatic surjectivity of dense restrictions.

**Sources.**

- [FS-geometrization, II.2 opening, printed p. 57](#source-rf0-fs-geometrization): The source assertion concerns generic Y_S for affinoid S; the annular proof explains the scope.

<a id="relativefarguesfontaine-rf0-annuli-annular-coefficient-choice-and-anchor-comparisons"></a>

#### 44. Annular coefficient and anchor comparisons

**Comparison.** Uniformizer and topologically nilpotent-unit choices give canonical identifications of Y_S and its sheaf; the annular coverings change by cofinal refinement with the transformed radius convention. Finite coefficient-field change is computed from the perfect unramified-base Witt tensor comparison, then rational localization, completion and integral closure of plus rings. In the specialization E=Q_p,S=Spa(F,O_F), identify each closed interval ring and plus ring with the absolute B^I,B^{I,+} of upstream AdicSpaces layer6, respecting all rational restriction maps, complete topologies and Frobenius. These comparisons commute with the fixed-field diamond presentation; a homeomorphism of spectra is insufficient.

Identifier: `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `annularCoefficientChoiceAndAnchorComparisons`.

**Hypotheses.** For coefficient change choose the residue embedding and corresponding q-power Frobenius. For a general completed coefficient extension use the integral coefficient-tensor interface requested from R0; no tensor product over R of nonadditive Teichmuller maps is formed.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change](#relativefarguesfontaine-rf0-integral-y-ramified-witt-uniformizer-change), [RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change](#relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change), [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change](#relativefarguesfontaine-rf0-annuli-annular-rational-base-change), [RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli](#relativefarguesfontaine-rf0-annuli-radius-function-and-rational-annuli), `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `FarguesFontaineDiamonds:F0/choice_transport`, `AdicSpacesPartII:R0`.

**Proof/construction outline.**

1. Use ghost-preserving Witt uniformizer transport and the unit change in each primitive equation.
2. Compare the valuations defining the two annular bases and obtain cofinal rational refinements.
3. Carry the finite unramified-base scalar comparison through the finite completed chart operations and plus-ring integral closure.
4. At the fixed-field anchor match the same Witt coefficient norms and dense subrings; the completion universal property identifies the rings, not merely their Spa sets.
5. Check each comparison commutes with restrictions, the transported Frobenius and the F0 choice transport.

**Acceptance properties.**

- A field-specialization check must give an isomorphism of complete Huber pairs compatible with the coefficient Frobenius.

**Sources.**

- [FS-geometrization, II.1.1 and generic-open convention, printed pp.48–49](#source-rf0-fs-geometrization): The relative construction retains canonical choice transport; the fixed-field ring comparison matches the imported absolute period charts.
- [KL15-foundations, Definitions5.1.1–5.1.3 and Remark5.1.6](#source-rf0-kl15-foundations): The comparison must preserve the named topologies and restriction maps.

<a id="relativefarguesfontaine-rf0-annuli-local-generation-on-period-annuli"></a>

#### 45. Local generation on period annuli

**Theorem.** Let M be finite projective over R̃^[s,r],0<s≤r. If elements e_1,…,e_n generate its base change to R̃_(H(β))^[s,r] for β∈M(R), then they generate M after a rational localization of the base (R,R^+) encircling β. This is a local neighborhood conclusion and does not assert that M is free or that the same generators work over the whole base.

Identifier: `RelativeFarguesFontaine:RF0:annuli/local-generation-on-period-annuli`. Parent: `RelativeFarguesFontaine:RF0:annuli`.

Proposed declaration: `localGenerationOnPeriodAnnuli`.

**Hypotheses.** Finite projective interval module, a finite proposed generating set and generation over the completed coefficient residue field.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection](#relativefarguesfontaine-rf0-annuli-interval-adic-pair-and-base-projection), [RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change](#relativefarguesfontaine-rf0-annuli-annular-rational-base-change), `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`.

**Proof/construction outline.**

1. Apply Nakayama at each point of the residue-field period annulus.
2. Cover that compact annulus by finitely many rational neighborhoods where the elements generate.
3. Spread this finite covering to a rational base neighborhood of β.
4. Use the residue-point detection criterion for surjectivity of finite modules to conclude generation.

**Acceptance properties.**

- This supplies the exact PAPER-KEDLAYA-LIU-15/191 target. Global sections generating every interval are the separate VB1-owned Lemma6.1.4.

**Sources.**

- [KL15-foundations, Lemma5.1.7 and proof](#source-rf0-kl15-foundations): The relative residue-field generation criterion spreads over a neighborhood, without a global freeness assertion.

### RF1 — the relative curve and global period sheaves

The radius calculation supplies the free discontinuous Frobenius action; wandering charts construct the analytic quotient. The product formula supplies a diamond presentation and a continuous topological projection to the base. Global period sheaves use these constructions and their étale restriction interfaces. The field-case Lubin–Tate presentation uses its own tower supplier.

<a id="relativefarguesfontaine-rf1-frobenius-quotient-and-presentation"></a>

#### 46. Relative Fargues–Fontaine curve

**Construction.** q-Frobenius acts freely and totally discontinuously on Y_S. Define X_S=Y_S/φ^Z as the analytic adic quotient, gluing open sets disjoint from their nontrivial translates. For affinoid S it is qcqs and is presented by the fundamental annulus Y_[1,q] with its two boundary annuli identified by φ:Y_[1,1]≃Y_[q,q].

Identifier: `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`. Parent: `RelativeFarguesFontaine:RF1`.

Proposed declaration: `frobeniusQuotientAndPresentation`.

**Hypotheses.** All perfectoid S/F_q; use the adic quotient supplied by the anchor/adic-space roadmap, not a mere quotient set.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/generic-period-domain](#relativefarguesfontaine-rf0-annuli-generic-period-domain), [RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli](#relativefarguesfontaine-rf0-annuli-radius-function-and-rational-annuli), `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`.

**Proof/construction outline.**

1. The positive radius and rad(φx)=q rad(x) exclude nonzero stabilizers.
2. Shrink radius intervals to avoid their q-power translates; these give local quotient charts.
3. Glue local charts by Frobenius identifications and use the compact fundamental annulus to prove qcqs.

**API.**

- `relativeCurve` (data): The analytic adic quotient X_S.
- `relativeCurve_localChart` (characterisation): A translate-disjoint open embeds openly in X_S.
- `relativeCurve_fundamental` (characterisation): Y_[1,q] presents X_S with φ-identification of the endpoints.
- `relativeCurve_qcqs` (structure): Affinoid S implies X_S qcqs.

**Distinguishing examples.**

- `quotient_frobenius_orbit` (computation): x and φx have the same image in X_S.
- `quotient_boundary` (compatibility): Radius 1 and radius q boundary charts are identified.
- `quotient_no_special` (non-example): π=0 belongs to curly-Y and cannot enter the free-action quotient construction.

**Acceptance properties.**

- Both boundary annuli survive, and q is the residue cardinality rather than necessarily p.

**Uses.** RF2 curve divisors and RF3 rank-one descent: Provides the actual quotient space and local trivialisations for descent.

**Atlas landmark.** Relative Fargues–Fontaine curve.

**Sources.**

- [FS-geometrization, Definition II.1.15 and Proposition II.1.16, printed pp. 54–55](#source-rf0-fs-geometrization): The local quotient and the boundary identification define the relative adic curve.

<a id="relativefarguesfontaine-rf1-diamond-formula-and-map-to-base"></a>

#### 47. Period diamonds and the topological map to the base

**Theorem.** There are canonical isomorphisms Y_S^diamond≃S×Spd E and X_S^diamond≃(S×Spd E)/(φ_S^Z×id). Since absolute Frobenius φ_S×φ_E acts trivially on the product topology, the second presentation can topologically move the action to the coefficient factor. It gives a qcqs continuous map |X_S|→|S|. This is not an adic structural morphism X_S→S.

Identifier: `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`. Parent: `RelativeFarguesFontaine:RF1`.

Proposed declaration: `diamondFormulaAndMapToBase`.

**Hypotheses.** The coefficient base is Perf_(F_q), with a chosen embedding when changing to an algebraically closed residue base.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points](#relativefarguesfontaine-rf0-integral-y-untilt-functor-of-points), [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `FarguesFontaineDiamonds:F1/affinoid_product`, `FarguesFontaineDiamonds:F2/quotient_iso`.

**Proof/construction outline.**

1. Restrict the integral product comparison to the generic open.
2. Identify the actual equivariant action and apply effective sheaf quotient descent.
3. Use simultaneous absolute Frobenius on topology to transfer the action; on affinoid opens the compact fundamental annulus proves the map qcqs.
4. At the fixed-field Q_p specialization identify the ring maps defining the existing F1 and F2 comparisons.

**Acceptance properties.**

- Check equivariance on maps of marked untilts, not only a homeomorphism of quotient sets.

**Atlas landmark.** Relative curve diamond comparison.

**Sources.**

- [FS-geometrization, Proposition II.1.17 and preceding paragraph, printed p. 55](#source-rf0-fs-geometrization): The topological map exists through diamond presentations; it is not the ordinary adic projection.

<a id="relativefarguesfontaine-rf1-relative-curve-functoriality"></a>

#### 48. Functoriality of relative period curves

**Theorem.** A map of perfectoid bases T→S over F_q induces analytic maps curly-Y_T→curly-Y_S, Y_T→Y_S and X_T→X_S, preserving Frobenius, quotient charts and pullback of locally free sheaves. Composition and identity hold. For an open base immersion these are the open inverse images on topology. The diamond square Y_T^diamond→Y_S^diamond over T→S is cartesian; curve diamonds compare through the equivariant quotient presentation, with the Frobenius action on the varying base.

Identifier: `RelativeFarguesFontaine:RF1/relative-curve-functoriality`. Parent: `RelativeFarguesFontaine:RF1`.

Proposed declaration: `relativeCurveFunctoriality`.

**Hypotheses.** General morphisms have no ordinary cartesian square X_T→X_S over T→S in adic spaces, since there is no structural X_S→S.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base](#relativefarguesfontaine-rf0-integral-y-gluing-for-general-base), [RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison](#relativefarguesfontaine-rf0-integral-y-ramified-coefficient-comparison), [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), `AdicSpacesPartII:R0/completed-tensor-product`.

**Proof/construction outline.**

1. Construct maps by coefficient functoriality, compatible rational inequalities and completed localisations.
2. Use the already established integral open comparison on base opens.
3. q-Frobenius equivariance descends maps to quotient charts; descent cocycles prove composition.
4. Check products and quotients on the actual untilt functors.

**Acceptance properties.**

- A geometric point s→S gives X_(K(s),K(s)^+)→X_S with the correct marking.

**Sources.**

- [FS-geometrization, II.1.3 and paragraph after II.1.16, printed pp. 49 and 55](#source-rf0-fs-geometrization): The source supplies base maps and fibre curves without an adic projection onto S.

<a id="relativefarguesfontaine-rf1-global-period-sheaves-and-etale-functoriality"></a>

#### 49. Global period sheaves and etale curve maps

**Construction.** Glue the twelve rational period sheaves over any perfect adic base; their etale sheafifications have the same values on perfect uniform affinoids. The relative-curve functor carries etale, finite etale and faithfully finite etale base morphisms to morphisms with the same property. The projection of underlying topological spaces upgrades to a morphism of etale topoi. This does not supply a structural adic map X_S→S.

Identifier: `RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality`. Parent: `RelativeFarguesFontaine:RF1`.

Proposed declaration: `globalPeriodSheavesAndEtaleFunctoriality`.

**Hypotheses.** Use the etale comparison for the exact affinoid class; a general nonuniform affinoid is not covered.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity](#relativefarguesfontaine-rf0-annuli-relative-period-sheaf-and-acyclicity), [RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility](#relativefarguesfontaine-rf0-annuli-period-rings-finite-etale-compatibility), [RelativeFarguesFontaine:RF1/relative-curve-functoriality](#relativefarguesfontaine-rf1-relative-curve-functoriality), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), `DiamondsAndVStacks:D6/etale-site-comparison`.

**Proof/construction outline.**

1. Glue rational period sheaves by functoriality on overlaps.
2. Use the R3 etale comparison and KL8.2.21 to identify etale values.
3. Apply period-ring finite-etale compatibility on annuli and descend along Frobenius.
4. Reduce general etale morphisms to finite-etale affinoid neighborhoods and compose the induced maps of sites.
5. Use the corrected factorization in KL8.2.20: Z_ij→Y is finite etale and Y_ij→Z_ij is an open immersion (KLII Appendix A, p. 191).

**API.**

- `globalRelativePeriodSheaf` (data): The glued period sheaves on a perfect adic base.
- `globalRelativePeriodSheaf_affinoid` (characterisation): Affinoid values equal the specified relative period rings.
- `relativeCurve_etale` (functoriality): Etale base maps induce etale curve maps.
- `relativeCurve_finiteEtale` (characterisation): Finite etale and faithfully finite etale base maps retain those properties.
- `relativeCurve_etaleTopos` (data): The underlying projection induces a morphism of etale topoi.

**Distinguishing examples.**

- `global_period_affinoid` (compatibility): Restriction to an affinoid recovers the rational period sheaf.
- `curve_split_etale` (computation): A disjoint union of two copies of S gives two copies of X_S.
- `curve_etale_not_structural` (non-example): The topos projection and continuous projection do not imply an adic structural ring map.

**Acceptance properties.**

- The all-E extension of the p-typical period sheaf statements is proved in the coefficient comparison.

**Uses.** RF4 bundle descent: Supplies actual etale sites and compatible period sheaves before the later bundle classification.

**Sources.**

- [KL15-foundations, Definition8.3.4; Lemma8.7.15 and Remark8.7.16](#source-rf0-kl15-foundations): The conclusion is a site/topos morphism, rather than a missing map of structure rings.

<a id="relativefarguesfontaine-rf1-lubin-tate-diamond-presentation"></a>

#### 50. Lubin–Tate diamond presentation

**Comparison.** For the perfect characteristic-p field F tilt of the Lubin–Tate tower E_LT∞, the associated classical generic period space has diamond Y_F^◇≃Spd(F)×Spd(E), equivalently the punctured perfectoid open-disc presentation of FF18 Remark3.19. The relative curve is its φ^Z quotient. The LT-tower presentation uses the O_E× action supplied by Lubin–Tate theory and local reciprocity; it is separate from the whole π/[ϖ] root extension used to prove integral chart perfectoidness.

Identifier: `RelativeFarguesFontaine:RF1/lubin-tate-diamond-presentation`. Parent: `RelativeFarguesFontaine:RF1`.

Proposed declaration: `lubinTateDiamondPresentation`.

**Hypotheses.** This is the field-case comparison in the source. The LT torsion tower, its tilt and reciprocity are precise missing upstream inputs; no universal base or root/LT tower identification is assumed.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift](#relativefarguesfontaine-rf0-integral-y-lubin-tate-teichmuller-lift), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model).

**Proof/construction outline.**

1. Use the formal-group torsion tower and its tilted open-disc coordinate.
2. Apply the diamond product description to the field pair.
3. Track the coefficient action and Frobenius orbit on both presentations.
4. Compare the resulting quotient with the RF1 curve presentation.

**Acceptance properties.**

- Keep E_LT∞ and E_root∞ as distinct named extensions.

**Sources.**

- [FF18-courbes, Preface Remark 3.19, printed p. 38](#source-rf0-ff18-courbes): The remark records the punctured perfectoid-disc/diamond picture arising from the LT field; the all-base product theorem is supplied separately.

### RF2 — integral effective divisors and ambient completions

Begin with a regular primitive untilt equation and ordinary descent of its invertible ideal. Products retain repeated legs, and symmetric orbit sheaves supply Div^d. Ambient ideal-adic completion and puncturing define the two period rings used by RF4. Chinese-remainder decompositions apply only on the disjoint-divisor locus.

<a id="relativefarguesfontaine-rf2-integral-divisors-ramified-primitive-untilt-equation"></a>

#### 51. Ramified primitive untilt equations

**Theorem.** An O_E-untilt (R^sharp,R^sharp+) of the marked perfectoid pair (R,R^+) gives a continuous surjection θ_E:W_OE(R^+)→R^sharp+ with principal regular kernel (ξ). Locally choose ϖ with ϖ^sharp dividing π and a lift a of π/ϖ^sharp; then ξ=π−a[ϖ] is a primitive generator. This includes a characteristic-p untilt with ξ=π. For E=Q_p the construction and primitive ideal agree with the imported P1 correspondence. An arbitrary element of W_OE(R^+) is not asserted primitive.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `ramifiedPrimitiveUntiltEquation`.

**Hypotheses.** All E, specified coefficient embedding and marked untilt; characteristic-p leg allowed on the integral domain. The q-Teichmuller formal-group lifts are not substituted for multiplicative [ϖ] in this equation.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property), [RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change](#relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change), `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P1/distinguished-element-criterion`.

**Proof/construction outline.**

1. In mixed characteristic obtain the coefficient theta by the p-typical theta and the O_E action, using the unramified scalar comparison; in equal characteristic evaluate the power-series variable at the coefficient π.
2. Apply the ramified strict-lift quotient argument to identify the untilt plus ring and its regular primitive kernel.
3. Choose ϖ^sharp|π, lift the quotient through θ_E, and compare with the primitive generator using reduction and the coefficient of π.
4. Check the p-typical specialization on theta and its kernel, not only on the quotient carrier.

**Acceptance properties.**

- Prove the ramified regularity/quotient comparison before the integral closed-image argument; do not infer it from generic invertibility of π.

**Atlas landmark.** Ramified primitive untilt equation.

**Sources.**

- [FS-geometrization, Proposition II.1.4 proof, printed p. 50](#source-rf0-fs-geometrization): The source first identifies the regular primitive quotient and then chooses this convenient equation.

<a id="relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate"></a>

#### 52. Untilts as integral closed Cartier divisors

**Theorem.** The marked O_E-untilt embeds into curly-Y_S as a relative closed Cartier divisor. On a neighborhood U={|ξ|≤|[ϖ]|^n}, give each completed residue field the normalization |[ϖ]|=q^−1 and A=O(U) its spectral norm. Multiplication by ξ satisfies ||ξa||≥q^−n||a||. Therefore it is injective with closed image, and the completed untilt quotient is already A/ξ; 0→O→O→i_*O_(S^sharp)→0 is exact. This remains valid at π=0 and on every geometric-base fibre.

Identifier: `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `closedCartierDivisorNormEstimate`.

**Hypotheses.** ξ the ramified primitive equation just constructed; after localisation the untilt pullback is all of S^sharp. The normalization and common neighborhood are part of the assertion.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation](#relativefarguesfontaine-rf2-integral-divisors-ramified-primitive-untilt-equation), [RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition](#relativefarguesfontaine-rf0-integral-y-curly-y-affinoid-definition), [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness), `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`.

**Proof/construction outline.**

1. Any neighborhood of the Cartier zero contains one of the displayed U.
2. Reduce to a geometric fibre and its perfected disc using the root extension and tilt. Approximate by finite-level ordinary rational-disc functions. Apply the R0 strict finite-type affinoid maximum-modulus theorem only at those finite levels, where the Shilov boundary lies on |ξ|=|[ϖ]|^n.
3. Take the supremum of the finite-level boundary estimates |ξf|=q^−n|f|, then pass through the norm-controlled approximations to the perfected disc. This proves the lower bound without assuming a general perfected affinoid has a point attaining the spectral supremum.
4. The lower bound gives regularity and closed image by completeness. Since the untilt is the separated completion of A/ξ, closedness identifies the algebraic quotient with the complete ring.
5. Check fibrewise Cartier exactness using the same construction.

**Acceptance properties.**

- Use the reciprocal/root-corrected disc model; the zero section is included, and no generic-only divisor theorem is an input.

**Atlas landmark.** Integral untilt Cartier divisor.

**Sources.**

- [FS-geometrization, Proposition II.1.4 and Remark II.1.5, printed p. 50](#source-rf0-fs-geometrization): The norm estimate proves the complete quotient; this integral argument precedes products.

<a id="relativefarguesfontaine-rf2-integral-divisors-ordinary-v-descent-of-period-line-bundles"></a>

#### 53. Ordinary descent of period line bundles

**Theorem.** Invertible O-modules on curly-Y_S, with their maps into O, satisfy effective v-descent in the perfectoid base S. The descended object is an ordinary invertible sheaf and its inclusion, not only an almost module. The generic and curve-local versions follow by restriction and Frobenius descent.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `ordinaryVDescentOfPeriodLineBundles`.

**Hypotheses.** Use affinoid period charts with topological-module root splitting; descent includes cocycles and maps. A global generator need not descend.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model), [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness), `DiamondsAndVStacks:D3`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

**Proof/construction outline.**

1. Apply perfectoid vector-bundle v-descent on the root-extended charts.
2. Use the continuous split-module comparison to descend the finite projective module, as in SW 19.5.3; use rational Kiehl glueing on overlaps.
3. Descend the map to O and verify the invertible ideal condition v-locally.
4. For a degree-one leg the locally chosen generators can change by units; their ideals descend canonically.

**Acceptance properties.**

- Record the missing general perfectoid vector-bundle descent interface in D3; no incoming VB1 dependency.

**Sources.**

- [SW20-berkeley, Proposition 19.5.3 and proof, printed pp. 180–181](#source-rf0-sw20-berkeley): The general torsor statement uses ordinary vector-bundle descent and a split-module argument; only its GL_1 consequence is needed here.
- [FS-geometrization, VI.1.2 proof, printed p. 191](#source-rf0-fs-geometrization): The source descends the invertible ideal itself.

<a id="relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf"></a>

#### 54. Effective divisor moduli

**Definition.** For d≥0 define the small v-sheaves Div^d_curlyY=(Spd O_E)^d/Σ_d, Div^d_Y=(Spd E)^d/Σ_d and Div^d_X=(Spd E/φ^Z)^d/Σ_d. Each quotient is the sheafification of orbit classes, not the quotient stack. Coincident legs have multiplicity and must not be deleted. At d=0 the sheaf is final and its divisor is empty.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `divDModuliVSheaf`.

**Hypotheses.** On Perf_(F_q); coefficient base and Frobenius action are fixed. Formation of Div_X requires the actual RF1 curve quotient, while the integral product definition only needs curly-Y.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points](#relativefarguesfontaine-rf0-integral-y-untilt-functor-of-points), [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`.

**Proof/construction outline.**

1. Form finite products of the specified small v-sheaves.
2. Use the small sheaf quotient interface and compare with the sheaf of isomorphism classes of the action groupoid.
3. Restrict the integral coefficient factor to E; use the curve quotient on each individual leg for Div_X.

**API.**

- `effectiveDivisors` (data): The three symmetric v-sheaf quotients.
- `effectiveDivisors_zero` (characterisation): Div^0 is the final sheaf and gives the empty divisor.
- `effectiveDivisors_orderedCover` (universal-property): The ordered product→Div^d is an epimorphism of v-sheaves.
- `effectiveDivisors_generic` (compatibility): The coefficient-open restriction gives Div^d_Y⊂Div^d_curlyY.

**Distinguishing examples.**

- `divisor_degree_zero` (degenerate): Div^0(S) has one element.
- `divisor_double` (computation): The ordered tuple (D,D) maps to the multiplicity-two divisor.
- `divisor_not_stack` (non-example): A repeated tuple has a Σ_d stabilizer in the action stack, while Div^d is the sheaf of orbit classes.

**Acceptance properties.**

- For d=2, (D,D) is a legitimate ordered lift of 2D; its presence is independent of a global ordering obstruction for other divisors.

**Uses.** FS VI.1.2 and GeometricSatakeAndFusion:GS0:loop-geometry: Supplies integral, generic and curve leg bases for the corresponding completed rings.

**Atlas landmark.** Effective divisor moduli.

**Sources.**

- [FS-geometrization, Definition VI.1.1, printed p. 190](#source-rf0-fs-geometrization): The symmetric quotients are sheaf quotients, retaining repeated entries.

<a id="relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness"></a>

#### 55. Product Cartier equations and affineness

**Theorem.** An ordered tuple of d O_E-untilts cuts out a closed Cartier divisor on curly-Y_S with equation ξ=∏_i ξ_i. For affinoid S its ring is W_OE(R^+)[1/[ϖ]]/(ξ), with plus ring the integral closure of W_OE(R^+)/(ξ). Multiplication by the product is regular with closed image on a common suitable neighborhood, including repeated ξ_i. After ordinary ideal descent an unordered divisor is also affinoid for affinoid S. Generic divisors are affine by restriction; divisors on X_S are affine only locally in the analytic topology of S.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `productEquationAndAffineness`.

**Hypotheses.** d≥0, with ξ=1 for d=0; generators exist after ordering/localisation, not necessarily globally.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles](#relativefarguesfontaine-rf2-integral-divisors-ordinary-v-descent-of-period-line-bundles), [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), [RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings](#relativefarguesfontaine-rf0-integral-y-integral-rational-chart-rings), [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation).

**Proof/construction outline.**

1. Apply the degree-one Cartier lower bounds successively on a common chart; the product lower bound is the product of the constants.
2. Identify the complete product quotient and the integral-closure plus ring.
3. Descend the invertible ideal along the ordered cover, preserving regularity and its inclusion into O.
4. Quasicompactness over affinoid S places the support in one integral chart; identify its complete quotient there.
5. Use Frobenius local charts for X; do not infer a global affinoid presentation on X.

**Acceptance properties.**

- At repeated legs the local ring is A/(ξ_1²), not A/(ξ_1); the zero divisor has ring 0.

**Atlas landmark.** Product Cartier divisor.

**Sources.**

- [FS-geometrization, Proposition VI.1.2 and proof, printed p. 191](#source-rf0-fs-geometrization): The product equation, ideal descent and chart containment yield the three affine assertions.

<a id="relativefarguesfontaine-rf2-integral-divisors-relative-degree-criterion"></a>

#### 56. Geometric degree criterion

**Theorem.** Div^d_curlyY(S), Div^d_Y(S) and Div^d_X(S) identify with relative effective closed Cartier divisors whose pullback to every geometric Spa(C,C^+) has total degree d, counting lengths and repeated points. In the integral case the characteristic-p point is included. For a pre-existing Cartier divisor, this criterion supplies local ordered presentations rather than assuming an ordering in the definition.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `relativeDegreeCriterion`.

**Hypotheses.** The integral extension of the family factorisation theorem is a recorded proof gap; the generic symmetric-power theorem is Far Proposition 2.18 in the edition read. d=0 is the empty divisor.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles](#relativefarguesfontaine-rf2-integral-divisors-ordinary-v-descent-of-period-line-bundles), `DiamondsAndVStacks:D3`.

**Proof/construction outline.**

1. The product equation proves the fibre degree of every tuple, including multiplicities.
2. For the converse use geometric factorisation of primitive period functions and the family lifting of their unordered roots.
3. In the generic case compare Far Definition 2.6 and Proposition 2.18 with the leg quotient.
4. For the integral endpoint and arbitrary base isolate the missing factorisation/descent bridge as a gap, rather than using Banach–Colmez properness or bundle classification as an early input.

**Acceptance properties.**

- The generic proof in the author preprint uses Picard/section theorems; the all-E integral extension needs an independent early proof, which is recorded explicitly.

**Sources.**

- [FS-geometrization, Remark VI.1.3, printed p. 191](#source-rf0-fs-geometrization): The remark asserts the fibrewise characterization.
- [Far-divisors, Definition 2.6 and Proposition 2.18, printed pp. 6 and 11](#source-rf0-far-divisors): The generic ordered sum is a surjective quasi-pro-etale diamond morphism and its symmetric sheaf quotient is Div^d.

<a id="relativefarguesfontaine-rf2-integral-divisors-v-descent-of-bundles-on-the-divisor"></a>

#### 57. Descent on divisors and their thickenings

**Theorem.** For a family D_S from Div^d, vector bundles on D_S and on each finite infinitesimal thickening V(I_D^n), n≥1, form v-stacks in S. Morphisms and descent data descend, and effectivity gives ordinary finite locally free modules. The limit of the finite quotient rings is a v-sheaf; the almost vanishing used in matrix correction is not the final descent conclusion.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `vDescentOfBundlesOnTheDivisor`.

**Hypotheses.** Affineness local on S for curve divisors; finite n. The separate completion-module algebraization is not asserted here.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D3`, `PerfectoidSpaces:P3`, `AdicSpacesPartII:R5/stable-basis-covering-reduction`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

**Proof/construction outline.**

1. Descend morphisms by function-sheaf descent and finite quotient exact sequences.
2. Over geometric bases induct on divisor degree and thickening length, reducing the reduced degree-one case to the untilt vector-bundle theorem.
3. Reduce étale covers to rational and finite étale covers on the stable affinoid basis; use ordinary finite projective descent.
4. For a general v-cover approximate the geometric invariant basis so the cocycle is in 1+[ϖ]M_r(O^+/ξ).
5. Root-chart module splitting transfers almost H^1 vanishing from the perfectoid cover. Correct the cocycle successively with shrinking norm; completeness gives an invariant basis and an ordinary descended bundle.

**Acceptance properties.**

- Check ξ² and every ξ^n; a double leg is not treated as a reduced degree-one divisor.

**Atlas landmark.** Descent on infinitesimal divisors.

**Sources.**

- [FS-geometrization, Proposition VI.1.4 and proof, printed pp. 191–192](#source-rf0-fs-geometrization): The matrix-improvement argument proves ordinary effectivity using almost H^1 as a tool.
- [SW20-berkeley, Lemma 17.1.8 and Corollary 17.1.9](#source-rf0-sw20-berkeley): The same filtration/limit method treats finite local de Rham thickenings and their rings.

<a id="relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b"></a>

#### 58. Completed divisor period rings

**Construction.** For the invertible Cartier ideal I_D⊂O_Z, Z=curly-Y_S,Y_S or X_S, define the sheaf B_D^+=lim_(n≥1)O_Z/I_D^n on the formal divisor and B_D by locally inverting a generator of its completed ideal. If D is affine, take global sections; on X use the analytic local affine presentation. A generator ξ identifies this with ξ-adic completion and localization, but ξ′=uξ changes only the trivialization. The construction is intrinsic to I_D and descends under permutations and v-covers.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `completedRingsBPlusAndB`.

**Hypotheses.** Completion is of the ambient sheaf, not of O_D with its zero divisor ideal. The zero divisor gives the zero ring. A general completed base change must use continuous completed maps; ordinary tensor products need not commute with the inverse limit.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor](#relativefarguesfontaine-rf2-integral-divisors-v-descent-of-bundles-on-the-divisor), `mathlib:AdicCompletion`, `mathlib:IsLocalization`, `mathlib:Ideal.span`, `mathlib:Ideal.span_singleton_mul_left_unit`.

**Proof/construction outline.**

1. Apply existing adic completion on each affine neighborhood with its actual ideal, then glue by the ideal-independent quotient system.
2. Use regularity to identify the completed ideal locally as a line and invert its local generator.
3. The unit-change comparison makes the localizations glue canonically.
4. Function descent on all finite thickenings and limits proves the v-sheaf property; order is irrelevant after ideal descent.

**API.**

- `divisorCompletion` (data): Intrinsic inverse-limit ring/sheaf B_D^+.
- `divisorPuncturedCompletion` (data): Local inversion of the completed invertible ideal.
- `divisorCompletion_generator` (compatibility): A generator identifies B_D^+ with its adic completion.
- `divisorCompletion_changeGenerator` (equivalence): Replacing ξ by uξ induces the canonical identical ideal-adic ring.
- `divisorCompletion_residue` (characterisation): B_D^+→O_D has kernel the completed ideal.
- `divisorCompletion_complete` (universal-property): For a finitely generated ideal I (locally principal for the Cartier input), the completion is complete for the extended ideal; B_D^+≃lim_n B_D^+/I_D^n.

**Distinguishing examples.**

- `completion_empty` (degenerate): D=∅ gives B_D^+=0.
- `completion_double` (computation): Completion along (ξ²) and along (ξ) have cofinal filtrations, but A/ξ² and A/ξ differ.
- `completion_special` (compatibility): At the characteristic-p leg ξ=π the integral completion is W_OE(R), rather than the absolute characteristic-p input of Mathlib BDeRhamPlus.
- `completion_unit_change` (compatibility): ξ and uξ generate identical powers of ideals.

**Acceptance properties.**

- A repeated leg is completed along (ξ²), which has a cofinal power filtration with (ξ); its finite quotient modulo (ξ²) still retains multiplicity.

**Uses.** RF2:untilts, RF4 and GS0 loop geometry: Supplies residue, filtration and punctured-completion rings while preserving the integral special fibre.

**Atlas landmark.** Completed divisor period rings.

**Sources.**

- [FS-geometrization, VI.1 after Proposition VI.1.4, printed p. 192](#source-rf0-fs-geometrization): The positive and punctured rings are defined from the invertible ideal in all three period domains.

<a id="relativefarguesfontaine-rf2-integral-divisors-addition-and-disjoint-divisor-loci"></a>

#### 59. Addition and disjoint divisor loci

**Construction.** Concatenation of ordered tuples descends to Div^d×Div^e→Div^(d+e), associative and commutative with the empty-divisor unit. Its Cartier ideal is I_(D+E)=I_D I_E. The disjoint locus consists of pairs with disjoint supports, equivalently I_D+I_E=O locally, and there the positive completed ring splits B_(D+E)^+≃B_D^+×B_E^+ by the Chinese remainder theorem. At colliding legs this product splitting is not asserted.

Identifier: `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`. Parent: `RelativeFarguesFontaine:RF2:integral-divisors`.

Proposed declaration: `additionAndDisjointDivisorLoci`.

**Hypotheses.** All three divisor domains; disjointness is local in the analytic space. Quotienting does not discard equal entries.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b).

**Proof/construction outline.**

1. Use block concatenation and permutation invariance on the ordered covers.
2. Multiply the descended Cartier ideals.
3. For disjoint supports apply CRT to every power of the comaximal ideals and pass to inverse limits.

**API.**

- `divisorAdd` (data): Degree-additive concatenation of symmetric leg quotients.
- `divisorAdd_ideal` (characterisation): I_(D+E)=I_D I_E.
- `divisorAdd_assoc` (characterisation): (D+E)+F=D+(E+F).
- `divisorAdd_disjointCompletion` (compatibility): Comaximal supports give the completed CRT product.

**Distinguishing examples.**

- `addition_empty` (degenerate): D+0=D.
- `addition_repeat` (computation): D+D=2D with ideal I_D².
- `addition_no_crt_collision` (non-example): For a geometric leg, A/ξ² is a length-two local thickening and is not (A/ξ)×(A/ξ).

**Acceptance properties.**

- The repeated divisor 2D has equation ξ² and does not satisfy the disjoint CRT hypothesis.

**Uses.** HeckeStacksAndLocalShtukas and GS0 factorisation: Distinguishes disjoint factorisation from coincident-leg geometry.

**Sources.**

- [FS-geometrization, Definition VI.1.1 and VI.1.2 product proof, printed pp. 190–191](#source-rf0-fs-geometrization): Concatenation and product equations give addition including repeated legs.
- [Far-divisors, §2.4 preceding Proposition 2.18, printed p. 11](#source-rf0-far-divisors): The source explicitly records the divisor addition monoid.

### RF2 — untilts and local de Rham geometry

The closed Cartier norm estimate, marked primitive correspondence and degree-one presentations retain the integral characteristic-p leg. Comparisons with existing periods first identify the marking, theta and ideal, and then the chosen coefficient factor. Filtration pieces are conormal tensor powers; the complete-DVR statement is for one geometric generic leg.

<a id="relativefarguesfontaine-rf2-untilts-primitive-untilt-correspondence"></a>

#### 60. Generic marked untilt comparison

**Comparison.** Restrict the all-E integral theta/primitive presentation to O_E-untilts in which π is invertible. The marked untilt is a Cartier divisor on Y_S and then on X_S; the latter depends only on its Frobenius orbit. In the E=Q_p case the marking, theta map, primitive ideal and quotient plus ring identify with P1/marked-untilt and P1/untilts-classified-by-primitive-ideals. This imports that correspondence rather than constructing another p-typical primitive-ideal theory.

Identifier: `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `primitiveUntiltCorrespondence`.

**Hypotheses.** An E-untilt, not merely an O_E-untilt; geometric residue and plus-ring markings are retained.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation](#relativefarguesfontaine-rf2-integral-divisors-ramified-primitive-untilt-equation), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), `PerfectoidSpaces:P1/marked-untilt`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`.

**Proof/construction outline.**

1. Use the integral ramified presentation and closed Cartier estimate.
2. Restrict to the generic open, then descend through the local Frobenius quotient.
3. Match the p-typical coefficient ring and theta on the marked pair, including the ideal and plus ring.
4. Frobenius translates give the same curve divisor; local inverse charts recover the orbit.

**Acceptance properties.**

- A special-fibre leg is outside this comparison; its integral presentation remains valid.

**Sources.**

- [FS-geometrization, Proposition II.1.18, printed p. 55](#source-rf0-fs-geometrization): The generic curve divisor depends on the Frobenius orbit of the marked untilt.

<a id="relativefarguesfontaine-rf2-untilts-div1-moduli-and-properness"></a>

#### 61. Degree-one divisor moduli and coefficient base

**Construction.** The degree-one Cartier-divisor moduli on Perf_(F_q) is Div^1=Spd E/φ^Z, canonically the d=1 curve-leg quotient. Its points locally on the analytic base come from an E-untilt. After base change to Perf_k, k an algebraic closure of F_q with fixed coefficient embedding, it is Spd Ĕ/φ^Z, where Ĕ=W_OE(k)[1/π]. The two coefficient bases must not be identified before this base change. This node constructs the moduli only; its properness, spatial representability and cohomological smoothness have the accepted VB3:general-BC owner.

Identifier: `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `div1ModuliAndProperness`.

**Hypotheses.** Sheaf quotient, not the diamond of one fixed curve. The legacy node id is preserved while the late property payload is forwarded.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), [RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence](#relativefarguesfontaine-rf2-untilts-primitive-untilt-correspondence), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), [RelativeFarguesFontaine:RF0/ramified-witt-universal-property](#relativefarguesfontaine-rf0-ramified-witt-universal-property).

**Proof/construction outline.**

1. Take the degree-one specialization of the symmetric quotient and compare with generic marked-untilt orbits.
2. Use the local quotient charts to see open-cover and v-cover quotients agree here.
3. Compute the coefficient-base extension using the strict-lift/unramified completion and track φ.

**API.**

- `degreeOneDivisors` (data): Div^1 on Perf_(F_q) with its curve-divisor comparison.
- `degreeOneDivisors_localUntilts` (characterisation): Degree-one divisors come from untilts locally on the analytic base.
- `degreeOneDivisors_baseChange` (compatibility): On Perf_k, Div^1≃Spd Ĕ/φ^Z.

**Distinguishing examples.**

- `divone_fq_base` (compatibility): Over Perf_(F_q) the coefficient object is Spd E.
- `divone_algebraic_closure` (computation): After Perf_k base change it is Spd Ĕ/φ^Z.
- `divone_not_fixed_curve` (non-example): Div^1 is a moduli v-sheaf over the coefficient base, not X_C^diamond for a fixed C.

**Acceptance properties.**

- Do not import C4, S5 or VB3 back into the early divisor construction.

**Uses.** HeckeStacksAndLocalShtukas:HS0 and GS0: Provides degree-one leg data before any properness/smoothness theorem. VectorBundlesAndIsocrystals:VB3:general-BC: Supplies the moduli input for the separately owned FS II.1.21 theorem.

**Atlas landmark.** Degree-one divisor moduli.

**Sources.**

- [FS-geometrization, Definition II.1.19 and following paragraph, printed p. 56](#source-rf0-fs-geometrization): The source’s Perf_Fq formula precedes the Perf_k unramified-completion formula after II.2.4.

<a id="relativefarguesfontaine-rf2-untilts-p-typical-affinoid-completion-comparison"></a>

#### 62. P-typical affinoid de Rham comparison

**Comparison.** For a characteristic-zero perfectoid field K with an open bounded valuation subring K^+ and a perfectoid affinoid (K,K^+)-algebra (A,A^+), put S=Spa(A^flat,A^flat+), take its Q_p-untilt divisor D and J=ker(θ:W(A^flat+)[1/p]→A). Then B_D^+≃lim_n W(A^flat+)[1/p]/J^n, preserving θ, J, the residue map and filtration. Under the checked P1 comparison PreTilt A^+ p≃A^flat+, this is the pinned Mathlib BDeRhamPlus A^+ p. Only after this actual identification import R06.1’s affinoid theorem and its local generator.

Identifier: `RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `pTypicalAffinoidCompletionComparison`.

**Hypotheses.** K and K^+ satisfy the exact R06.1/bdr-plus-of-perfectoid-affinoid-algebras hypotheses. K need not be C_p. The primitive generator from K has nonzero image in every affinoid input; A^+ is p-adically complete with p nonunit.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence](#relativefarguesfontaine-rf2-untilts-primitive-untilt-correspondence), `PerfectoidSpaces:P1/tilt-comparison-with-mathlib-pretilt`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:BDeRhamPlus`, `mathlib:WittVector.fontaineTheta`, `mathlib:PreTilt`, `mathlib:PreTilt.untilt`.

**Proof/construction outline.**

1. Match the geometric tilt to Mathlib PreTilt through the P1 comparison.
2. Match Mathlib fontaineTheta, localization away from p and its extended kernel with the divisor theta map.
3. Use a Cartier neighborhood and the cofinal ideal-power quotient system to identify the two completions.
4. Map the chosen primitive generator from the field and check that it generates the same ideal. Invoke the R06.1 theorem with this comparison, retaining its residue and filtration.

**Acceptance properties.**

- The comparison precedes supplier reuse and includes the actual ideal and residue map. Characteristic-p inputs are outside this theorem.

**Sources.**

- [Sch13-periods, §6 period-ring definitions, Lemma 6.3 and Corollary 6.4](#source-rf0-sch13-periods): The exact affinoid range and theta-adic ring are the supplier’s statement.
- [FS-geometrization, VI.1 completion definition, printed p. 192](#source-rf0-fs-geometrization): The divisor-completion notation is identified with the same theta-adic object.

<a id="relativefarguesfontaine-rf2-untilts-coefficient-field-de-rham-comparison"></a>

#### 63. Ramified de Rham coefficient comparison

**Theorem.** For finite E/Q_p and a marked E-untilt A over a characteristic-zero perfectoid field, the θ_E-adic completion of W_OE(A^flat+)[1/π] is canonically the p-typical B_D^+ of A, with the chosen E action lifted from the residue ring. It preserves residue, the completed Cartier ideal, filtration and localization. For E′/E the comparison is compatible with a specified E′ action on the same untilt; a tensor product over the smaller coefficient field before selecting that action can have extra factors.

Identifier: `RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `coefficientFieldDeRhamComparison`.

**Hypotheses.** Perfect residue coefficient ring with F_q action; the chosen embedding E→A selects the completion factor. This comparison is only mixed characteristic.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change](#relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change), [RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison](#relativefarguesfontaine-rf2-untilts-p-typical-affinoid-completion-comparison), `mathlib:Algebra.FormallyEtale.comp_bijective`, `mathlib:Algebra.FormallyEtale.of_isSeparable`, `mathlib:IsAdicComplete.liftRingHom`.

**Proof/construction outline.**

1. Identify the ramified Witt ring with its p-typical scalar extension over the maximal unramified coefficient ring.
2. After inverting p the coefficient extension is finite separable. Lift the chosen residue action uniquely through each square-zero step J^n/J^(n+1) by formal etaleness; lift the compatible sequence to the complete ring.
3. The corresponding finite-etale factor has residue A and is isomorphic to the completed p-typical ring; the selected factor gives the θ_E completion.
4. Identify the two completed invertible ideals and their unit-related local generators; this gives filtration and punctured-localization compatibility.

**Acceptance properties.**

- Preserve the selected embedding; do not claim the entire finite scalar extension is a single de Rham ring.

**Sources.**

- [FF18-courbes, Lemme 1.2.3 and coefficient base change, printed pp. 55–56](#source-rf0-ff18-courbes): The coefficient comparison is the starting ring map; the completion factor is selected by the untilt coefficient embedding.
- [Stacks-finite-etale, Tags 09XI and 09ZL, accessed 7 October 2026](#source-rf0-stacks-finite-etale): Finite etale lifting selects the unique residue-compatible factor of the complete coefficient extension.

<a id="relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration"></a>

#### 64. Generic divisor de Rham rings

**Comparison.** For a generic degree-one leg, write B_dR^+=B_D^+ and B_dR=B_D, using the intrinsic completed Cartier ideal. The p-typical affinoid object is identified by the explicit affinoid comparison and its R06.1 theorem; finite mixed-characteristic coefficients are compared by the selected-factor theorem. Equal-characteristic E and arbitrary perfectoid bases retain the intrinsic all-E ideal-adic construction and v-descent. For d>1 the same notation denotes a divisor ring and is not automatically a DVR.

Identifier: `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `BdRCompletionAndFiltration`.

**Hypotheses.** The completion and punctured ring were constructed once in integral-divisors. This node is their generic de Rham interpretation, not another independent completion.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison](#relativefarguesfontaine-rf2-untilts-p-typical-affinoid-completion-comparison), [RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison](#relativefarguesfontaine-rf2-untilts-coefficient-field-de-rham-comparison), [RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence](#relativefarguesfontaine-rf2-untilts-primitive-untilt-correspondence).

**Proof/construction outline.**

1. Restrict the integral completion to Div^1_Y and Div^1_X.
2. Apply the p-typical and finite-coefficient comparisons exactly in their hypotheses.
3. For equal characteristic use the power-series coefficient ring and the local Cartier ideal directly.
4. Glue the generic identifications and compare them with the integral construction on common quotient systems.

**Acceptance properties.**

- Absolute Mathlib BDeRhamPlus on a characteristic-p input is zero; it cannot replace the equal-characteristic E divisor completion.

**Sources.**

- [FS-geometrization, VI.1 after Proposition VI.1.4, printed p. 192](#source-rf0-fs-geometrization): The de Rham name is attached to the already defined divisor completion.

<a id="relativefarguesfontaine-rf2-untilts-cartier-filtration-and-breuil-kisin-lines"></a>

#### 65. Cartier filtration and Breuil–Kisin lines

**Theorem.** Let J be the completed Cartier ideal in B_D^+. The residue map has B_D^+/J≃O_D. For m≥0, gr^m B_D^+=J^m/J^(m+1)≃(I_D/I_D²)^(⊗m), a line bundle on D. On B_D set Fil^m=J^m B_D^+ for m∈Z using the invertible fractional ideal. A chosen generator ξ identifies each graded piece with ξ^m O_D and the graded ring with O_D[T,T^−1]; replacing ξ by uξ scales the degree-m trivialization by (u mod I_D)^m. The intrinsic line need not be globally free.

Identifier: `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `cartierFiltrationAndBreuilKisinLines`.

**Hypotheses.** Regular invertible Cartier ideal and complete sheaf from the integral construction; no choice of generator is retained in the intrinsic statement.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration).

**Proof/construction outline.**

1. Use the cofinal quotient presentation to identify the completed ideal and residue map.
2. For a local regular generator multiply by ξ^m to identify O_D with J^m/J^(m+1).
3. Check the unit-change transition functions and glue to tensor powers of the conormal line.
4. Invert the local ideal for negative powers and check graded multiplication.

**Acceptance properties.**

- Use ξ² versus ξ tests for finite thickenings; preserve potentially nontrivial conormal transition functions.

**Atlas landmark.** Breuil–Kisin conormal lines.

**Sources.**

- [FS-geometrization, Proposition VI.1.11 and preceding VI.1.10, printed pp. 194–195](#source-rf0-fs-geometrization): The source identifies Breuil–Kisin twists intrinsically; the local scalar presentation depends on a generator.

<a id="relativefarguesfontaine-rf2-untilts-geometric-divisor-complete-dvr"></a>

#### 66. Geometric untilt DVR

**Theorem.** For a geometric marked E-untilt C^sharp, the generic degree-one completion B_D^+ is a complete discrete valuation ring with maximal ideal the completed Cartier ideal and residue field C^sharp. A local primitive generator is a uniformizer, and B_D is its fraction field. This includes equal-characteristic E via its Cartier completion; the p-typical characteristic-zero case agrees with the R06.1 geometric theorem.

Identifier: `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `geometricDivisorCompleteDvr`.

**Hypotheses.** One geometric degree-one leg. A degree-d divisor with several geometric supports has a product of such local rings, and a finite thickening is not itself a DVR.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines](#relativefarguesfontaine-rf2-untilts-cartier-filtration-and-breuil-kisin-lines), `mathlib:IsDiscreteValuationRing`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

**Proof/construction outline.**

1. The completed quotient modulo the Cartier ideal is the field C^sharp.
2. A local regular generator and completeness show every residue-nonzero element is a unit by geometric-series lifting.
3. Successive Cartier quotients give associated graded C^sharp[T]; separated completeness makes each nonzero element a uniformizer power times a unit.
4. Conclude domain, discrete valuation and fraction-field localization; check against the supplier only in its geometric characteristic-zero hypotheses.

**Acceptance properties.**

- No DVR assertion for a non-field affinoid base or a disconnected multi-leg divisor.

**Atlas landmark.** Geometric untilt DVR.

**Sources.**

- [FS-geometrization, VI.1 degree-one ring convention, printed p. 192](#source-rf0-fs-geometrization): The local ring is the completion at a geometric degree-one Cartier point.
- [Sch13-periods, §6, geometric specialization of Lemma 6.3](#source-rf0-sch13-periods): The primitive theta generator supplies the maximal ideal in the matching characteristic-zero case.

<a id="relativefarguesfontaine-rf2-untilts-divisor-completion-base-change"></a>

#### 67. Divisor completion and coefficient base change

**Theorem.** Base maps of marked perfectoid pairs induce continuous maps on finite Cartier quotient rings and hence on B_D^+, B_D, residue and filtration. For rational restrictions and finite etale base maps satisfying the strict quotient comparison, these identify the completed base changes. Under finite coefficient-field change use the unramified Witt comparison and, in mixed characteristic, the selected embedding in the de Rham completion. For arbitrary v-covers the assertion is sheaf descent of the quotient systems and their limit; no uncompleted tensor product is claimed to commute with that limit.

Identifier: `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`. Parent: `RelativeFarguesFontaine:RF2:untilts`.

Proposed declaration: `divisorCompletionBaseChange`.

**Hypotheses.** Specify the complete tensor topology, plus integral closure and finite-quotient compatibility for a base-change isomorphism. Arbitrary nonflat or nonsplit tensor operations are not included.

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor](#relativefarguesfontaine-rf2-integral-divisors-v-descent-of-bundles-on-the-divisor), [RelativeFarguesFontaine:RF1/relative-curve-functoriality](#relativefarguesfontaine-rf1-relative-curve-functoriality), [RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change](#relativefarguesfontaine-rf0-integral-y-perfect-coefficient-base-change), [RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison](#relativefarguesfontaine-rf2-untilts-coefficient-field-de-rham-comparison), `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

**Proof/construction outline.**

1. Functoriality of primitive ideals gives maps on every quotient by I_D^n.
2. Use rational/finite-etale exactness on the actual complete quotient rings to prove the finite-level comparisons.
3. Pass to the compatible inverse limit with its completion topology and localize the ideal.
4. For general v-covers use the already proved ring/sheaf descent; the maps on graded lines are pullbacks of the conormal line.

**Acceptance properties.**

- State and check the strict finite-quotient comparison instead of treating all completed tensor products as exact.

**Sources.**

- [FS-geometrization, VI.1 completion v-sheaves, printed p. 192](#source-rf0-fs-geometrization): The source gives functorial descent, while tensor-limit exchange needs the separately stated hypotheses.

### RF3 — twists, sections and the algebraic curve interface

Fix slope/degree signs before forming the section algebra. The crystalline-boundary Čech argument supplies the input to the LT section construction. The projective spectrum and its standard algebraic charts are existing Mathlib geometry. The analytic morphism is defined on the section-covered open; global generation and the global comparison are VB2 outputs.

<a id="relativefarguesfontaine-rf3-isocrystal-line-bundles-and-sign"></a>

#### 68. Integral rank-one Frobenius twists

**Construction.** For n∈Z, descend the trivial line on Y_S with semilinear Frobenius operator Φ_n=π^(−n)φ to define O_X(n). The tensor comparison O(m)⊗O(n)≃O(m+n) and dual comparison O(n)^∨≃O(−n) preserve the descent trivializations. Its sections are exactly f∈O(Y_S) with φ(f)=π^n f. The rank-one coefficient operator π^(−n)σ has isocrystal slope −n; the geometric twist has degree n. The arbitrary-rank exact tensor functor has the sole VB1 owner.

Identifier: `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `isocrystalLineBundlesAndSign`.

**Hypotheses.** Use the actual RF1 quotient and analytic invertible O-modules. No use of an arbitrary-rank isocrystal classification or a completed VB1 stage is required to define this rank-one descent.

**Direct prerequisites.** [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base), `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

**Proof/construction outline.**

1. Use local translate-disjoint opens in Y_S to descend the trivial line and its integral-power cocycle.
2. Multiplying the coefficients π^(−m)π^(−n) gives tensor and dual identifications.
3. A descended section is Φ_n-invariant, equivalently φ(f)=π^n f.
4. Compare the coefficient rank-one normalization with VB0’s isocrystal convention; export agreement to VB1 without importing the full functor.

**API.**

- `curveTwist` (data): The descended line O_X(n), n∈Z.
- `curveTwist_tensor` (equivalence): O(m)⊗O(n)≃O(m+n).
- `curveTwist_dual` (equivalence): O(n)^∨≃O(−n).
- `curveTwist_sections` (characterisation): H^0(X_S,O(n))≃{f∈O(Y_S):φ(f)=π^n f}.
- `curveTwist_transition` (compatibility): Between lifts differing by φ^k the frame cocycle is π^(−nk), satisfying the additive k-cocycle relation.

**Distinguishing examples.**

- `twist_zero` (degenerate): O(0) is the structure line with descent φ.
- `twist_one_sign` (computation): O(1) has multiplier π^−1 and sections with φ(f)=πf.
- `twist_negative_sign` (non-example): O(−1) has multiplier π and sections with φ(f)=π^−1 f.
- `twist_inverse` (compatibility): O(n)⊗O(−n)≃O.

**Acceptance properties.**

- Use n=1 and n=−1 to test the sign; the full functor payload of the legacy id is forwarded.

**Uses.** VB1 isocrystal-to-bundle functor: Provides the rank-one normalization to which the full functor must agree. RF3 section algebra: Supplies the tensor multiplication and explicit local frames.

**Atlas landmark.** Integral Frobenius twists.

**Sources.**

- [FS-geometrization, II.2 opening after Proposition II.2.1, printed p. 58](#source-rf0-fs-geometrization): The chosen coefficient multiplier fixes both the section eigenvalue and the slope sign.

<a id="relativefarguesfontaine-rf3-graded-algebra-and-algebraic-curve-map"></a>

#### 69. Graded section algebra and projective scheme

**Construction.** For affinoid S let P_S=⊕_(n≥0)H^0(X_S,O(n)), with multiplication from the twist tensor comparison. Form X_S^alg=Proj(P_S) using Mathlib’s projective spectrum/scheme construction and its affine charts Spec(P_S[g^−1]_0), g homogeneous of positive degree. The analytic chart maps are constructed separately on U=⋃_gD(g). This node does not assert U=X_S or define an invertible degree-one Proj twist; both need the VB2:ampleness theorem.

Identifier: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `gradedAlgebraAndAlgebraicCurveMap`.

**Hypotheses.** The nonnegative grading is by N; O(n) exists for integral n. Proj need not be covered by degree-one generators.

**Direct prerequisites.** [RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign](#relativefarguesfontaine-rf3-isocrystal-line-bundles-and-sign), `mathlib:GradedAlgebra`, `mathlib:ProjectiveSpectrum`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.projIsoSpec`.

**Proof/construction outline.**

1. Define the direct sum and multiplication using coherent tensor associativity of rank-one twists.
2. Use the existing graded-ring and ProjectiveSpectrum construction.
3. Identify standard degree-zero localization charts and their overlap maps.
4. Preserve the legacy id while moving the global-map and tautological-twist payload to the exact VB2 node.

**API.**

- `curveSectionAlgebra` (data): Nonnegatively graded direct sum of twist sections.
- `curveSectionAlgebra_mul` (characterisation): Degree m,n multiplication lands in degree m+n.
- `curveProj` (data): Mathlib Proj of P_S.
- `curveProj_chart` (compatibility): D_+(g)≃Spec(P_S[g^−1]_0) for positive-degree g.

**Distinguishing examples.**

- `graded_zero_degree` (degenerate): P_0=H^0(X_S,O).
- `graded_product` (computation): An eigenvector of eigenvalue π^m times one of eigenvalue π^n has eigenvalue π^(m+n).
- `proj_not_degree_one_cover` (non-example): For a graded ring generated only in degree two, degree-one standard opens cannot be assumed to cover Proj.

**Acceptance properties.**

- The existing VB2:ampleness/global-proj-map-and-twists is the sole owner of the global map and invertible twists.

**Uses.** VB2:ampleness: Supplies the Proj object and standard charts before global-generation/GAGA comparison.

**Atlas landmark.** Graded period section algebra.

**Sources.**

- [FS-geometrization, II.2.3 opening and proof of Proposition II.2.7, printed pp. 64–67](#source-rf0-fs-geometrization): The source’s chart construction is used; the preceding generation theorem is required to extend it to all X_S.

<a id="relativefarguesfontaine-rf3-section-covered-proj-chart-map"></a>

#### 70. Section-covered Proj comparison

**Theorem.** For g∈H^0(X_S,O(n)), n>0, its nonvanishing locus D(g) trivializes O(n). Fractions a/g^k with deg a=kn define a ring map P_S[g^−1]_0→O(D(g)) and a morphism of locally ringed spaces D(g)→D_+(g). On D(g)∩D(h)=D(gh) these maps agree. They glue to U=⋃_(g positive degree)D(g)→Proj(P_S). Global coverage U=X_S and tautological-twist pullback are not asserted at this stage.

Identifier: `RelativeFarguesFontaine:RF3/section-covered-proj-chart-map`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `sectionCoveredProjChartMap`.

**Hypotheses.** Actual nonvanishing of a section of an invertible sheaf; n need not be 1.

**Direct prerequisites.** [RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map](#relativefarguesfontaine-rf3-graded-algebra-and-algebraic-curve-map), [RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign](#relativefarguesfontaine-rf3-isocrystal-line-bundles-and-sign), `mathlib:AlgebraicGeometry.LocallyRingedSpace`, `mathlib:IsLocalization`.

**Proof/construction outline.**

1. Use g as a frame and send a/g^k to its ratio in the local trivialization.
2. Check multiplication, equal fractions and localization on smaller standard opens.
3. The local ring map at each point respects maximal ideals, giving the locally ringed morphism.
4. Use D(g)∩D(h)=D(gh) to glue the chart maps only over U.

**Acceptance properties.**

- On P^1 with L=O(−1), positive-power global sections vanish and U=∅. Quasicompactness cannot supply a cover that does not exist.

**Atlas landmark.** Section-covered Proj morphism.

**Sources.**

- [FS-geometrization, Proposition II.2.7 proof, printed p. 67](#source-rf0-fs-geometrization): The proof constructs maps on nonvanishing opens; the generation input determines whether their union covers.

<a id="relativefarguesfontaine-rf3-positive-frobenius-eigenvector-restriction"></a>

#### 71. Positive Frobenius eigenvectors on a window

**Theorem.** For n≥0,d>0,q=p^d and r>0, restriction identifies {x∈R̃^+:φ^d x=p^n x}, {x∈R̃:φ^d x=p^n x}, and compatible eigenvectors on the fundamental window R̃^[r/q,r]. The window equality is interpreted by agreement after restriction to the overlap on which x and φ^d x are both defined. The all-E version has multiplier π^n and q-Frobenius. This is the concrete period-ring presentation of nonnegative-degree sections, without a finite-dimensionality assertion.

Identifier: `RelativeFarguesFontaine:RF3/positive-frobenius-eigenvector-restriction`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `positiveFrobeniusEigenvectorRestriction`.

**Hypotheses.** The displayed KL result has n nonnegative. Negative twists and geometric vanishing need their own arguments and cannot be inferred by changing this sign.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants](#relativefarguesfontaine-rf0-annuli-robba-growth-units-and-invariants), [RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings](#relativefarguesfontaine-rf0-annuli-robba-controlled-splittings), [RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign](#relativefarguesfontaine-rf3-isocrystal-line-bundles-and-sign).

**Proof/construction outline.**

1. Iterate Frobenius and use interval intersections to extend a window eigenvector across all radii.
2. The eigenvalue gives the plus growth bound.
3. For a general R^+ use the residue projection in the final paragraph of KL5.2.12, rather than replacing R^+ by R°.
4. Compare the extended eigenvector with the invariant descent equation defining O(n).
5. In the growth estimate use an iteration index m distinct from the eigenweight n, as corrected in KLII Appendix A, printed p. 190.

**Acceptance properties.**

- The statement is a restriction bijection and has no cohomological finiteness conclusion.

**Sources.**

- [KL15-foundations, Corollary 5.2.12 and proof](#source-rf0-kl15-foundations): The restriction result applies to nonnegative eigenweights and general relative R^+.

<a id="relativefarguesfontaine-rf3-crystalline-boundary-and-cech-section-input"></a>

#### 72. Crystalline boundary and twist section input

**Theorem.** In FSII.2.5 put Y_[1,∞]={|[ϖ]|≤|π|≠0}, including the end [ϖ]=0,π≠0, and Y_[0,a]={|π|^a≤|[ϖ]|≠0}, retaining the end π=0. Write B_[a,b] for the rings of functions with the specified rational completion. The two-chart Cech sequences are 0→W_OE(R^+)[1/π]→B_[1,∞]⊕B_[0,q][1/π]→B_[1,q]→0 and the same sequence with q replaced by1. The coefficient ring on the left has its π-adic Tate topology, distinct from the (π,[ϖ])-adic topology of the integral period space. For n>0 the contracting Frobenius series used in FSII.2.5 give the restriction quasi-isomorphism of the two φ−π^n complexes. This provides the section input for the rank-one twists; general bundle cohomology and global generation remain at VB1/VB2.

Identifier: `RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `crystallineBoundaryAndCechSectionInput`.

**Hypotheses.** Affinoid perfectoid base, actual boundary charts and their complete topologies. The notation [1,∞] does not mean a subset of generic Y. The displayed rational inequality for general a is interpreted by integer powers for rational a.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-locus), [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-sheafiness), [RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity](#relativefarguesfontaine-rf0-annuli-relative-period-sheaf-and-acyclicity).

**Proof/construction outline.**

1. Apply sheafiness of the π-adic Tate ring W_OE(R^+)[1/π] to its two rational charts.
2. Use the exact two-chart covering sequences with q and with1.
3. On the integral-end term invert φ−π^n using Σ_(j≥1)π^(n(j−1))φ^(−j); on the [ϖ]-divisible crystalline-end term use −Σ_(j≥0)π^(−n(j+1))φ^j.
4. Check convergence in the actual interval norms and deduce the restriction quasi-isomorphism.

**Acceptance properties.**

- This records the boundary chart calculation without importing VB2 global generation into RF3.

**Sources.**

- [FS-geometrization, Proof of PropositionII.2.5, printed p. 63](#source-rf0-fs-geometrization): The source uses the boundary analytic chart in proving a later generation theorem.

<a id="relativefarguesfontaine-rf3-lubin-tate-divisor-section"></a>

#### 73. Lubin–Tate divisor section

**Theorem.** Let E_LT∞ be the completion of the Lubin–Tate torsion tower, and S^sharp an untilt over it. A compatible nonzero torsion parameter X̃ gives a convergent period function f=Σ_(i∈Z)π^i[X̃^(q^(−i))] satisfying φ(f)=πf. Its zero on X_S is exactly the untilt divisor, with multiplicity one. Hence 0→O_X→O_X(1)→O_(S^sharp)→0, with the last map interpreted through the chosen divisor trivialization. Tensoring gives the corresponding consecutive-twist exact sequences.

Identifier: `RelativeFarguesFontaine:RF3/lubin-tate-divisor-section`. Parent: `RelativeFarguesFontaine:RF3`.

Proposed declaration: `lubinTateDivisorSection`.

**Hypotheses.** The chosen LT tower is distinct from E_root∞. The all-E functional construction uses the LT logarithm; its mixed-characteristic period comparison has the precise SW13 input recorded as a gap.

**Direct prerequisites.** [RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift](#relativefarguesfontaine-rf0-integral-y-lubin-tate-teichmuller-lift), [RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign](#relativefarguesfontaine-rf3-isocrystal-line-bundles-and-sign), [RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence](#relativefarguesfontaine-rf2-untilts-primitive-untilt-correspondence), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli](#relativefarguesfontaine-rf0-annuli-radius-function-and-rational-annuli), [RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input](#relativefarguesfontaine-rf3-crystalline-boundary-and-cech-section-input).

**Proof/construction outline.**

1. Use the LT Teichmuller lift and compatible torsion sequence to form the convergent bilateral sum. In mixed characteristic use the crystalline-boundary/Cech comparison first, together with the separately requested Lubin–Tate logarithm exact sequence; it does not depend on the resulting LT section.
2. Shift the summation index to prove the Frobenius eigenvalue.
3. Identify the function with the LT logarithm on the universal cover; the logarithm’s torsion zeros are simple.
4. Apply the generic Cartier ideal comparison to identify I_D(1) with O and deduce exactness.

**Acceptance properties.**

- The product of two such sections at the same leg has a double zero; the one-section theorem is genuinely simple.

**Atlas landmark.** Lubin–Tate divisor section.

**Sources.**

- [FS-geometrization, Proposition II.2.3 and proof, printed pp. 60–61](#source-rf0-fs-geometrization): The exact sequence is obtained over the Lubin–Tate tower by the logarithm zero calculation.

## Part II — patching and modifications

### RF4 — linear patching and vector-bundle modifications

Exact-square descent and the Stacks glueing-pair theorem supply the algebra used in formal patching. The general-E lattice case starts from a global reference bundle; arbitrary-complement effectivity is an additional target. Unramified schematic B-pairs use the precise VB2 scheme comparison. Lattice modifications and p-typical punctured-Witt algebraicity give the stated AI.2 essential-surjectivity exports.

<a id="relativefarguesfontaine-rf4-vector-bundles-glueing-datum-over-exact-square"></a>

#### 74. Exact squares of rings and glueing data over them (Kedlaya-Liu 1.3.7)

**Definition.** An exact square of commutative rings is a commuting square R -> R_1, R -> R_2, R_1 -> R_12, R_2 -> R_12 such that the sequence of R-modules 0 -> R -> R_1 (+) R_2 -> R_12 -> 0, whose last arrow is the difference (r_1, r_2) |-> r_1 - r_2 of the two maps, is exact. A glueing datum over it is a triple of modules M_1, M_2, M_12 over R_1, R_2, R_12 with isomorphisms psi_1 : M_1 (x)_{R_1} R_12 = M_12 and psi_2 : M_2 (x)_{R_2} R_12 = M_12; a morphism of glueing data is a triple of linear maps commuting with psi_1 and psi_2. The datum is finite, resp. finite projective, when M_1, M_2, M_12 are finite, resp. finite projective, over their rings. Its module of sections is M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), with natural R-linear maps M -> M_i adjoint to M (x)_R R_i -> M_i. Every R-module N gives the glueing datum Can(N) = (N (x) R_1, N (x) R_2, N (x) R_12, can, can). No topology is involved.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** The rings are commutative and the square commutes; nothing is assumed about flatness of R -> R_1 or R -> R_2 Exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0 is required at all three places; surjectivity on the right is part of the definition A glueing datum carries no cocycle over R_1 (x)_R R_1: the square replaces fpqc descent data

**Direct prerequisites.** `AdicSpacesPartII:R3/glueing-square`, `mathlib:TensorProduct`, `mathlib:LinearEquiv`, `mathlib:Module.Flat`, `mathlib:Module.Finite`, `mathlib:Module.Projective`.

**Proof/construction outline.**

1. Kedlaya-Liu Definition 1.3.7 states the definition; the Stacks project's category Glue(R -> R', f) (before Theorem 15.92.16) is the case R_1 = R', R_2 = R_f, R_12 = R'_f.
2. Can is a functor, and the sections functor is right adjoint to it on the level of R-modules: Hom(N, sections(D)) = Hom(Can(N), D).
3. For flat N the sequence 0 -> N -> N (x) R_1 (+) N (x) R_2 -> N (x) R_12 -> 0 is exact (tensor the exact square with N), so sections(Can N) = N.

**API.**

- `ExactSquare` (data): An exact square: four commutative rings, the four ring maps, commutativity, and exactness of 0 -> R -> R_1 (+) R_2 -> R_12 -> 0.
- `ExactSquare.exact` (characterisation): An element of R_1 (+) R_2 lies in the image of R iff its two images in R_12 agree, R -> R_1 (+) R_2 is injective, and R_1 (+) R_2 -> R_12 is surjective.
- `GlueingDatum` (constructor): A glueing datum (M_1, M_2, M_12, psi_1, psi_2) over an exact square, with morphisms the compatible triples of linear maps.
- `GlueingDatum.sections` (data): The module of sections M = ker(psi_1 - psi_2 : M_1 (+) M_2 -> M_12), an R-module, functorial in the datum.
- `GlueingDatum.sectionsCompare` (projection): The natural maps M (x)_R R_i -> M_i (i = 1, 2), compatible with psi_1, psi_2 after base change to R_12.
- `GlueingDatum.can` (functoriality): The functor Can : R-modules -> glueing data, N |-> (N (x) R_1, N (x) R_2, N (x) R_12, can, can), with map_id and map_comp.
- `GlueingDatum.can_sections_adjunction` (universal-property): Hom_R(N, sections(D)) = Hom(Can(N), D) naturally in N and D.
- `GlueingDatum.sections_can_of_flat` (characterisation): For a flat R-module N the unit N -> sections(Can N) is an isomorphism.
- `GlueingDatum.tensor` (structure): Tensor product and dual of finite projective glueing data, componentwise, with sections(Can N (x) Can N') compatible with N (x) N' for finite projective N, N'.
- `GlueingDatum.baseChange` (functoriality): For a map of exact squares (R -> R_1, R_2 -> R_12) -> (R' -> R'_1, R'_2 -> R'_12), base change of glueing data, compatible with Can.
- `ExactSquare.ofGlueingSquare` (compatibility): Every glueing square of complete Tate rings (AdicSpacesPartII:R3/glueing-square) is an exact square, its finite glueing data are glueing data here, and its module of sections is the module of sections here.
- `ExactSquare.zariski` (example): For f, g in R generating the unit ideal, R -> R_f, R_g -> R_fg is an exact square.

**Distinguishing examples.**

- `GlueingDatum.sections_zariski_Z` (computation): For R = Z, f = 2, g = 3, the glueing datum (Z[1/2], Z[1/3], Z[1/6], id, multiplication by 3) has module of sections {(k, k/3) : k in Z}, free of rank one with generator (1, 1/3).
- `GlueingDatum.sections_identitySquare` (degenerate): For the identity square R = R_1 = R_2 = R_12 and a datum (M, M, M, id, id), the module of sections is the diagonal, isomorphic to M.
- `ExactSquare.zariski_sections_can` (compatibility): For the Zariski square of D(f), D(g) with (f, g) = R and any R-module N, sections(Can N) = N; this is gluing of quasicoherent sheaves on Spec R = D(f) u D(g).
- `ExactSquare.not_exact_double_localization` (non-example): For R = k[x] and R_1 = R_2 = R_12 = k[x, 1/x], the square is not exact: the kernel of the difference is the diagonal k[x, 1/x], and sections(Can R) = k[x, 1/x] is not R.

**Acceptance properties.**

- The Zariski square of D(f), D(g) for comaximal f, g is exact and its glueing data are quasicoherent gluing data
- Every glueing square of complete Tate rings of AdicSpacesPartII:R3/glueing-square is an exact square in this sense, with the same glueing data and module of sections
- The identity square is exact and its glueing data are modules

**Uses.** Kedlaya-Liu Remark 2.7.9: the Beauville-Laszlo square R -> R-hat, R[1/t] -> R-hat[1/t] is an exact square, and Proposition 1.3.6 is derived from Lemma 1.3.9 for it Kedlaya-Liu Theorem 8.9.6, proof: vector bundles on Proj(P_R) are glueing data over the square with pieces B_e(A), B^+_dR(A), B_dR(A) Scholze-Weinstein Lemma 14.2.3, proof: vector bundles on Spec A_inf minus the closed point are glueing data over A_inf[1/p], A_inf[1/[p-flat]], A_inf[1/p[p-flat]] Kedlaya, Some ring-theoretic properties of A_inf, proof of Theorem 3.8: the adic and schematic bundles are compared through fibre products of categories of glueing data over rational coverings RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: the local step of the relative gluing is a glueing datum over the Beauville-Laszlo square of an affinoid chart around D

**Sources.**

- [KL15-foundations, Definition 1.3.7, p. 17](#source-rf0-kl15-foundations): The definition verbatim (diagram omitted).
- [KL15-foundations, Definition 1.3.7, p. 17](#source-rf0-kl15-foundations): The module of sections and its comparison maps.
- [Stacks-BL, Section 15.92, before Theorem 15.92.16 (tag 0BP2)](#source-rf4-stacks-bl): The Beauville-Laszlo instance of the same notion.

<a id="relativefarguesfontaine-rf4-vector-bundles-finite-projective-glueing-over-exact-square"></a>

#### 75. Finite projective glueing data over an exact square are effective (Kedlaya-Liu 1.3.8-1.3.9)

**Theorem.** Let R -> R_1, R_2 -> R_12 be an exact square. (i) For a finite glueing datum with module of sections M such that M (x)_R R_1 -> M_1 is surjective: psi_1 - psi_2 : M_1 (+) M_2 -> M_12 is surjective, M (x)_R R_2 -> M_2 is surjective, and a finitely generated submodule M_0 of M already surjects onto M_1 and M_2. (ii) Suppose M (x)_R R_1 -> M_1 is surjective for every finite projective glueing datum. Then for every finite projective glueing datum M is finitely presented and M (x)_R R_i -> M_i is bijective for i = 1, 2. (iii) If moreover the image of Spec(R_1 (+) R_2) -> Spec(R) contains every maximal ideal, M is finite projective; hence Can is an equivalence from finite projective R-modules to finite projective glueing data, with quasi-inverse the module of sections.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** The surjectivity hypothesis of (ii) is for EVERY finite projective glueing datum; it is verified separately in each application (density for complete Tate rings, the Beauville-Laszlo argument for completions) The maximal-ideal condition of (iii) cannot be dropped: it is what makes the rank of M locally constant and the Fitting ideal Fitt_n(M) equal to R No flatness of R -> R_1 or R -> R_2 is assumed

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-glueing-datum-over-exact-square), `mathlib:Module.FinitePresentation`, `mathlib:Module.Projective`, `mathlib:Module.Finite`.

**Proof/construction outline.**

1. (i) The surjection M (x) R_1 -> M_1 gives a surjection M (x) R_12 -> M_12 and hence the surjectivity of psi_1 - psi_2; an element v of M_2 is reached by correcting with a preimage, and finitely many generators give M_0 (KL Lemma 1.3.8).
2. (ii) Choose a finite free F -> M_0 and compare the exact rows 0 -> N -> F -> M, 0 -> N_i -> F_i -> M_i; the kernels N_i are finite projective and form a glueing datum, so (i) applies to it and a diagram chase gives finite generation, then finite presentation, of M, and the five lemma gives bijectivity of M (x) R_i -> M_i (KL Lemma 1.3.9(a)).
3. (iii) Split by the rank idempotents, compute Fitting ideals: Fitt_i(M) = 0 for i < n because R -> R_1 (+) R_2 is injective, and Fitt_n(M) = R because every maximal ideal comes from a point of Spec(R_1 (+) R_2) where the rank is n (KL Lemma 1.3.9(b)).
4. Full faithfulness of Can on finite projective modules is V1's sections_can_of_flat.

**Acceptance properties.**

- Recover Zariski gluing of finite projective modules from the square R -> R_f, R_g -> R_fg
- Recover AdicSpacesPartII:R3/glueing-square-finite-projective-descent for a glueing square of complete Tate rings, whose density hypothesis gives the surjectivity of (ii)
- Recover finite projective descent for the Beauville-Laszlo square (RF4:vector-bundles/beauville-laszlo-module-gluing)

**Sources.**

- [KL15-foundations, Lemma 1.3.8, p. 17](#source-rf0-kl15-foundations): Part (i) verbatim.
- [KL15-foundations, Lemma 1.3.9, p. 18](#source-rf0-kl15-foundations): Part (ii).
- [KL15-foundations, Lemma 1.3.9(b), p. 18](#source-rf0-kl15-foundations): Part (iii).

<a id="relativefarguesfontaine-rf4-vector-bundles-finite-etale-glueing-over-exact-square"></a>

#### 76. Finite etale algebras glue over an exact square (Kedlaya-Liu 1.3.10)

**Theorem.** Under the hypotheses of RF4:vector-bundles/finite-projective-glueing-over-exact-square (iii), the base change functor FEt(R) -> FEt(R_1) x_{FEt(R_12)} FEt(R_2) from finite etale R-algebras to compatible pairs of finite etale algebras is an equivalence of categories.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/finite-etale-glueing-over-exact-square`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** Same hypotheses as the finite projective glueing theorem: surjectivity for all finite projective glueing data and the maximal-ideal condition The algebra structure is glued from the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0; etaleness is checked through the trace pairing, not through flat descent

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-finite-projective-glueing-over-exact-square), `mathlib:CommAlgCat.FiniteEtale`, `mathlib:Algebra.Etale`, `mathlib:Module.Dual`.

**Proof/construction outline.**

1. View (A_1, A_2, A_12) as a finite projective glueing datum; the module of sections A is finite projective with A (x) R_i = A_i.
2. The multiplications of A_1, A_2, A_12 restrict to A through the exact sequence 0 -> A -> A_1 (+) A_2 -> A_12 -> 0, so A is a finite flat R-algebra.
3. Applying the glueing theorem to the duals gives 0 -> Hom_R(A, R) -> Hom(A_1, R_1) (+) Hom(A_2, R_2) -> Hom(A_12, R_12) -> 0, and the snake lemma shows the trace pairing of A is perfect, so A is finite etale (KL Corollary 1.3.10).

**Acceptance properties.**

- For the Zariski square this is gluing of finite etale covers
- The trace pairing argument shows that unramifiedness is not checked by a flatness argument

**Sources.**

- [KL15-foundations, Corollary 1.3.10, p. 19](#source-rf0-kl15-foundations): The statement verbatim.
- [KL15-foundations, Proof of Corollary 1.3.10, p. 19](#source-rf0-kl15-foundations): The trace pairing step.

<a id="relativefarguesfontaine-rf4-vector-bundles-glueing-pair"></a>

#### 77. Glueing pairs and glueable modules (Stacks 15.92)

**Definition.** Let R be a ring, f in R, and R -> R' a ring map inducing isomorphisms R/f^n R = R'/f^n R' for all n >= 1 (for example R' = R-hat = lim R/f^n R). (R -> R', f) is a glueing pair if 0 -> R -> R' (+) R_f -> R'_f -> 0 (last arrow the difference) is exact; equivalently R[f^oo] -> R'[f^oo] is bijective, where M[f^oo] is the f-power torsion. (R, f) is a glueing pair if (R -> R-hat, f) is one. An R-module M is glueable for (R -> R', f) if 0 -> M -> (M (x)_R R') (+) M_f -> M (x)_R R'_f -> 0 is exact, equivalently M[f^oo] -> (M (x)_R R')[f^oo] is bijective. A glueing pair is in particular an exact square R -> R', R_f -> R'_f.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** R -> R' must induce R/f^n = R'/f^n for EVERY n, not only n = 1 If f is a nonzerodivisor of R then (R, f) is a glueing pair; no noetherian hypothesis Glueability is a condition on the module; flat modules are glueable, and a non-glueable module exists already for a nonzerodivisor f

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-glueing-datum-over-exact-square), `mathlib:AdicCompletion`, `mathlib:AdicCompletion.of`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Flat`.

**Proof/construction outline.**

1. Lemma 15.92.6: the sequence is always exact on the right; exactness on the left and in the middle are injectivity and surjectivity of R[f^oo] -> R'[f^oo].
2. Remark 15.92.7: for f a nonzerodivisor, f is a nonzerodivisor in R-hat (Stacks Algebra Lemma 10.96.4), so both torsion modules vanish.
3. Lemma 15.92.10 and Remark 15.92.11: the same criterion for modules, and flat modules are glueable.

**API.**

- `GlueingPair` (data): A ring map R -> R' and f in R with R/f^n = R'/f^n for all n and the exact sequence 0 -> R -> R' (+) R_f -> R'_f -> 0.
- `GlueingPair.iff_torsion_bijective` (characterisation): Assuming the ring map induces R/f^n R = R'/f^n R' for all positive n, (R -> R', f) is a glueing pair iff R[f^oo] -> R'[f^oo] is bijective (Stacks 15.92.6).
- `GlueingPair.of_nonZeroDivisor` (constructor): If f is a nonzerodivisor of R then (R -> R-hat, f) is a glueing pair (Stacks 15.92.7).
- `GlueingPair.of_flat` (constructor): If R -> R-hat is flat (for example R noetherian) then (R, f) is a glueing pair (Stacks 15.92.8).
- `GlueingPair.toExactSquare` (coercion): A glueing pair is an exact square R -> R', R_f -> R'_f (RF4:vector-bundles/glueing-datum-over-exact-square).
- `GlueingPair.quotient_equiv` (simp): For a glueing pair (R -> R',f), the canonical map R/f^n R -> R'/f^n R' is an isomorphism for every n. In the completion case R'=R-hat these quotient isomorphisms hold without assuming the pair condition (Stacks 15.92.1).
- `GlueingPair.spec_surjective` (other): Spec(R') u Spec(R_f) -> Spec(R) is surjective (Stacks 15.92.3), the maximal-ideal condition of the exact-square glueing theorem.
- `Glueable` (data): The predicate: 0 -> M -> (M (x) R') (+) M_f -> M (x) R'_f -> 0 is exact.
- `Glueable.iff_torsion` (characterisation): For a glueing pair, M is glueable iff M[f^oo] -> (M (x) R')[f^oo] is injective (Stacks 15.92.10).
- `Glueable.of_flat` (constructor): Flat R-modules are glueable (Stacks 15.92.11).

**Distinguishing examples.**

- `GlueingPair.int_p` (computation): For R = Z and f = p, R-hat = Z_p and 0 -> Z -> Z_p (+) Z[1/p] -> Q_p -> 0 is exact; (Z, p) is a glueing pair.
- `GlueingPair.of_isUnit` (degenerate): If f is a unit then R-hat = 0, R_f = R, the sequence is 0 -> R -> R -> 0 -> 0, every module is glueable and glueing data are R-modules.
- `GlueingPair.noetherian_compat` (compatibility): For R noetherian, Mathlib's AdicCompletion (Ideal.span {f}) R is flat over R, so (R, f) is a glueing pair and every R-module is glueable (Stacks 15.92.8, 15.92.11).
- `GlueingPair.not_stacks_example` (non-example): For R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...), (R, f) is not a glueing pair: T_1 is f-power torsion and nonzero in R but its image in R-hat is f-divisible, hence zero (Stacks Example 15.92.9).
- `Glueable.not_smooth_germs` (non-example): For R the germs of smooth functions at 0 on the real line and f = x, the module R/phi R with phi = exp(-1/x^2) is not glueable although f is a nonzerodivisor (Stacks Example 15.92.12).

**Acceptance properties.**

- Check the criterion R[f^oo] -> R'[f^oo] bijective on the two examples of Stacks Example 15.92.9
- Check that a nonzerodivisor gives a glueing pair without any noetherian hypothesis
- Check that the henselization of R along f, which also satisfies R/f^n = R^h/f^n, gives a glueing pair whenever f is a nonzerodivisor of it

**Uses.** Stacks Theorem 15.92.16: the Beauville-Laszlo equivalence is stated for a glueing pair and glueable modules Scholze-Weinstein Lemma 5.2.9: the case R' = R-hat with f a nonzerodivisor RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor: (A, xi) for an affinoid chart A around D and a local equation xi of D is a glueing pair because xi is a nonzerodivisor (RF2:untilts/closed-cartier-divisor-norm-estimate)

**Sources.**

- [Stacks-BL, Section 15.92, Glueing pairs, before Lemma 15.92.6](#source-rf4-stacks-bl): The definition.
- [Stacks-BL, Lemma 15.92.6 (tag 0BNR) and Remark 15.92.7 (tag 0BNS)](#source-rf4-stacks-bl): The torsion criterion and the nonzerodivisor case.
- [Stacks-BL, Lemma 15.92.10 (tag 0BNW)](#source-rf4-stacks-bl): Glueable modules.

<a id="relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing"></a>

#### 78. The Beauville-Laszlo theorem for non-noetherian rings

**Theorem.** Let (R -> R', f) be a glueing pair (for instance R' = R-hat, the f-adic completion, with f a nonzerodivisor of R). (a) The functor Can : M |-> (M (x)_R R', M_f, can) is an equivalence from the category of R-modules glueable for (R -> R', f) to the category of glueing data (M', M_1, alpha_1 : (M')_f = M_1 (x)_R R'), with quasi-inverse the module of sections. In particular (Scholze-Weinstein 5.2.9) for f a nonzerodivisor, R-modules M on which f is a nonzerodivisor are equivalent to triples (M_{R-hat}, M_{R[1/f]}, beta) with f a nonzerodivisor on the R-hat-module M_{R-hat} and beta : M_{R-hat}[1/f] = M_{R[1/f]} (x)_R R-hat. (b) An R-module M is flat, resp. finite projective, iff M (x)_R R' and M_f are flat, resp. finite projective; hence every finite projective glueing datum is Can of a finite projective R-module, unique up to unique isomorphism, and R -> R' x R_f is an effective descent morphism for finite projective modules. (c) For a flat M the sequence 0 -> M -> (M (x)_R R_f) (+) (M (x)_R R-hat) -> M (x)_R R-hat_f -> 0 is exact. The statement is not a case of fpqc descent: R -> R-hat need not be flat when R is not noetherian, and no descent datum over R-hat (x)_R R-hat is part of the data.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** f is a nonzerodivisor of R, or more generally (R -> R', f) is a glueing pair; no noetherian, flatness or separatedness hypothesis is needed (Kedlaya-Liu's 't-adically separated' in Proposition 1.3.6 is not used by the Stacks proof) In (a) the modules must be glueable; for f a nonzerodivisor every module on which f is a nonzerodivisor is glueable The finite projectivity criterion of (b) is part of the theorem and is what makes the gluing of vector bundles possible Scholze-Weinstein point out that the statement does NOT follow from fpqc descent, for the two reasons in the statement

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair](#relativefarguesfontaine-rf4-vector-bundles-glueing-pair), [RelativeFarguesFontaine:RF4:vector-bundles/glueing-datum-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-glueing-datum-over-exact-square), [RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-finite-projective-glueing-over-exact-square), `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`, `mathlib:IsLocalization.Away`, `mathlib:nonZeroDivisors`, `mathlib:Module.Projective`, `mathlib:Module.Flat`, `mathlib:Module.FinitePresentation`, `mathlib:Module.FaithfullyFlat`.

**Proof/construction outline.**

1. Surjectivity of d : M' (+) M_1 -> (M')_f for any glueing datum, by writing a target element with a common denominator f^n and splitting coefficients of R' as R + f^n R' (Stacks proof of 15.92.16).
2. With M = ker d, the sequence 0 -> M/M[f^oo] -> M_1 -> (M')_f/M' -> 0 is exact; tensoring with the flat R_f gives M_f = M_1.
3. Tor_1^R(R', Coker(M' -> M'_f)) = 0 (Stacks 15.92.13-15.92.15) keeps that sequence exact after tensoring with R', and the five lemma gives M (x) R' = M'; so Can is essentially surjective and H^0 o Can = id on glueable modules gives full faithfulness.
4. Flatness and finite projectivity descend: Stacks 15.92.18 (Tor computation from the exact square) and 15.92.19 (finite generation from 15.92.4, then finite presentation).
5. Alternatively, for f a nonzerodivisor and finite projective data, Kedlaya-Liu Remark 2.7.9 verifies the surjectivity hypothesis of RF4:vector-bundles/finite-projective-glueing-over-exact-square for the square R -> R-hat, R[1/t] -> R-hat[1/t] using the t-adic density of R[1/t] in R-hat[1/t], and concludes from Lemma 1.3.9.

**Acceptance properties.**

- Run the gluing for R = A_inf[1/p] and f = xi, where R-hat = B^+_dR(C): a B^+_dR-lattice in T (x) B_dR glues with T (x) A_inf[1/p][1/xi] to a finite projective A_inf[1/p]-module (the step used in SW20 Proposition 12.4.6)
- Exhibit, for a non-noetherian R, a module M with f a nonzerodivisor on M whose completion M (x) R-hat is computed by the gluing although R -> R-hat is not flat
- Verify finite projectivity in both directions of (b)
- Check the necessity of glueability with Stacks Example 15.92.12

**Atlas landmark.** Beauville–Laszlo lemma.

**Sources.**

- [SW20-berkeley, Lemma 5.2.9, printed p. 38](#source-rf0-sw20-berkeley): The statement used throughout the atlas; read again in this session.
- [SW20-berkeley, After Lemma 5.2.9, printed p. 38](#source-rf0-sw20-berkeley): The two non-noetherian subtleties the stage asks to retain.
- [Stacks-BL, Theorem 15.92.16 (tag 0BP2)](#source-rf4-stacks-bl): Part (a), with a complete non-noetherian proof; this replaces the unread Beauville-Laszlo note.
- [Stacks-BL, Lemma 15.92.19](#source-rf4-stacks-bl): Part (b), finite projective case.
- [KL15-foundations, Proposition 1.3.6, pp. 16-17](#source-rf0-kl15-foundations): Parts (b) effective descent and (c).

<a id="relativefarguesfontaine-rf4-vector-bundles-modification-of-vector-bundles"></a>

#### 79. Modifications of vector bundles at a relative Cartier divisor

**Definition.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let X-cal be one of Y-curly_S, Y_S, X_S and D a closed Cartier divisor of X-cal attached to a map S -> Div^d_(-), with ideal sheaf I_D and E(kD) = E (x) I_D^(-k). For vector bundles E, E' on X-cal, a modification of E' at D is a pair (E, beta) with beta : E|_{X-cal minus D} = E'|_{X-cal minus D} an isomorphism of vector bundles on the open complement which is meromorphic along D: locally on S and X-cal there is some k >= 0 such that beta extends to a morphism E -> E'(kD) and beta^(-1) extends to a morphism E' -> E(kD) (through the inclusions E' -> E'(kD), E -> E(kD)). Such a k is a bound of the modification. A morphism (E_1, beta_1) -> (E_2, beta_2) is an isomorphism E_1 -> E_2 whose restriction off D is beta_2^(-1) beta_1; modifications of E' at D form a groupoid Mod_D(E').

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** D must be a closed Cartier divisor (I_D invertible); this is what makes O(kD) defined and what makes restriction to the complement injective on sections beta must be an isomorphism on all of X-cal minus D, not only near D Both beta and beta^(-1) are required to be meromorphic; Fargues-Scholze require one direction for every representation of G, which for GL_n includes the dual representation and so gives the other direction The definition is local on S and on X-cal; for d = 0 (D empty) a modification is an isomorphism

**Direct prerequisites.** [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `AdicSpacesPartII:R3/locally-free-sheaf`, [RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation](#relativefarguesfontaine-rf1-frobenius-quotient-and-presentation), `mathlib:Module.Invertible`, `mathlib:Module.Projective`.

**Proof/construction outline.**

1. The definition is Fargues-Scholze's meromorphic modification at D, specialised to GL_n (FS III.3, printed p. 97), and the datum beta of Scholze-Weinstein Theorem 14.1.1(3).
2. Composition and inverses: if beta_1 is bounded by k and beta_2 by l then beta_2 beta_1 is bounded by k + l, and beta^(-1) is a modification of E at D with the same bound.
3. Because I_D is invertible and locally generated by a nonzerodivisor, a morphism of vector bundles is determined by its restriction off D; so isomorphisms of modifications are unique when they exist. The groupoid Mod_D(E') is therefore equivalent to the discrete set of its isomorphism classes. Allowing arbitrary bundle maps here would give a category with noninvertible arrows, for example O(-D) -> O for nonempty D.

**API.**

- `Modification` (data): A modification of E' at D: a vector bundle E with an isomorphism beta : E|_{X minus D} = E'|_{X minus D} meromorphic along D in both directions.
- `Modification.extend` (projection): For a bound k, the unique morphism E -> E'(kD) extending beta, and E' -> E(kD) extending beta^(-1).
- `Modification.refl` (constructor): (E', id) is a modification of E' at D with bound 0.
- `Modification.symm` (constructor): (E', beta^(-1)) is a modification of E at D with the same bound.
- `Modification.trans` (constructor): Modifications bounded by k and l compose to one bounded by k + l.
- `Modification.tensor` (structure): The tensor product of modifications of E'_1 and E'_2 bounded by k and l is a modification of E'_1 (x) E'_2 bounded by k + l; the dual of a modification bounded by k is bounded by k.
- `Modification.pullback` (functoriality): For T -> S, pullback of (E, beta) along X-cal_T -> X-cal_S is a modification at D_T; pullback along the identity is the identity and pullbacks compose.
- `Modification.ext` (extensionality): Two morphisms of modifications are equal iff they agree off D; (E_1, beta_1) and (E_2, beta_2) are isomorphic iff beta_2^(-1) beta_1 extends to an isomorphism E_1 = E_2.
- `Modification.ofSubbundle` (constructor): An injective morphism E -> E' that is an isomorphism off D and whose image contains E'(-kD) defines a modification bounded by k.

**Distinguishing examples.**

- `Modification.ideal_inclusion` (computation): For D nonempty, the inclusion I_D = O(-D) -> O_X-cal restricts to an isomorphism off D and is a modification of O at D bounded by 1, not bounded by 0.
- `Modification.empty_divisor` (degenerate): For d = 0 (D empty) a modification of E' at D is an isomorphism E = E', and every bound works.
- `Modification.ff_absolute` (compatibility): For S = Spa(C^flat) a geometric point and D = infinity on X_FF, modifications of E' at D are exactly Fargues-Fontaine's modifications of E' supported at {infinity} (5.6.4.2): bundles E with E|_{X minus infinity} = E'|_{X minus infinity}.
- `Modification.not_iso_off_D` (non-example): For a second degree-one divisor D' disjoint from D, the inclusion O -> O(D') is not a modification of O(D') at D: it is not an isomorphism on X-cal minus D.

**Acceptance properties.**

- The inclusion I_D = O(-D) -> O is a modification of O at D bounded by 1
- For d = 0 the groupoid is the set of bundles isomorphic to E'
- At a geometric point, modifications of E' at the point infinity of X_FF are Fargues-Fontaine's modifications supported at {infinity}

**Uses.** Fargues-Scholze III.3: Gr_G / phi^Z -> Div^1 is the moduli of a modification between the trivial G-bundle and E at D Scholze-Weinstein Theorem 14.1.1, (2) <=> (3): the datum (F', beta) is equivalent to a B^+_dR-lattice by Beauville-Laszlo Howe-Klevdal, Section 4.3: the modification E_L of E by a lattice L on its G(B_dR)-local system RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification: a G-modification is a compatible family of modifications of the vector bundles attached to all representations BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo uniformization modifies a G-bundle at an untilt divisor

**Sources.**

- [FS-geometrization, III.3, printed p. 97](#source-rf0-fs-geometrization): The definition for G-bundles; for G = GL_n with the standard and dual representation it is this node.
- [SW20-berkeley, Theorem 14.1.1(3), printed p. 115](#source-rf0-sw20-berkeley): The modification datum beta at a degree-one divisor of the absolute curve.
- [FF18-courbe, 5.3, before Proposition 5.3.1, p. 208](#source-rf0-ff18-courbes): The absolute picture: a bundle off finitely many points, bundles on formal discs and gluing on punctured discs.

<a id="relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor"></a>

#### 80. Beauville-Laszlo gluing on the relative curve: modifications are B^+-lattices

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let X-cal be Y-curly_S, Y_S or X_S, D the divisor of a map S -> Div^d_(-), assumed affinoid, and E' a vector bundle on X-cal with completion E'-hat_D = Gamma(D, completion of E' along D), a finite projective B^+_D(S)-module. Then (E, beta) |-> Xi(E, beta) := beta(E-hat_D) is an equivalence from the groupoid Mod_D(E') of modifications of E' at D to the set of B^+_D(S)-lattices in E'-hat_D[1/I_D], i.e. finite projective B^+_D(S)-submodules Xi with Xi[1/I_D] = E'-hat_D[1/I_D]. A modification is bounded by k iff I_D^k E'-hat_D is contained in Xi and Xi in I_D^(-k) E'-hat_D. In particular the restriction E'|_{X-cal minus D} of this globally given reference bundle, a vector bundle on the formal neighbourhood (Xi) and an isomorphism on the punctured formal neighbourhood (Xi[1/I_D] = E'-hat_D[1/I_D]) determine a vector bundle on X-cal, and this fixed-reference gluing functor is fully faithful and essentially surjective. This does not assert effectivity for an arbitrary bundle given only off D; that stage target is recorded separately as a gap. Locally: on each sheafy affinoid chart U = Spa(A, A^+) meeting D on which I_D = xi A, the ring of completion along D intersect U is the xi-adic completion of A and the statement is RF4:vector-bundles/beauville-laszlo-module-gluing for the glueing pair (A, xi) combined with finite projective A-modules = vector bundles on U.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** D affinoid, which holds locally on S (RF2:integral-divisors/product-equation-and-affineness); the result globalises over S by gluing I_D is invertible and locally generated by a nonzerodivisor xi of the chart ring A (RF2:untilts/closed-cartier-divisor-norm-estimate, RF2:integral-divisors/product-equation-and-affineness); this makes (A, xi) a glueing pair The charts are sheafy (sousperfectoid) affinoids, so vector bundles on U are finite projective A-modules (AdicSpacesPartII:R3); on X_S the charts come from Y_S through the phi-quotient (RF1) The punctured formal neighbourhood is not an open subspace of X-cal; the gluing is formulated through modifications of a given E', which is how Scholze-Weinstein and Fargues-Scholze use it The theorem is linear: G-valued and Grassmannian statements are RF4:G-torsors and GeometricSatakeAndFusion:GS0:loop-geometry

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing](#relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing), [RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles](#relativefarguesfontaine-rf4-vector-bundles-modification-of-vector-bundles), [RelativeFarguesFontaine:RF4:vector-bundles/glueing-pair](#relativefarguesfontaine-rf4-vector-bundles-glueing-pair), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/vector-bundle-global-generation`, `AdicSpacesPartII:R3/locally-free-sheaf`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `mathlib:AdicCompletion`, `mathlib:Module.Projective`, `mathlib:Module.Invertible`.

**Proof/construction outline.**

1. Use a cover of a neighbourhood of D by sheafy affinoid charts U = Spa(A, A^+) on which I_D|_U = xi A, xi a nonzerodivisor of A; the completion along D intersect U has section ring A-hat (the xi-adic completion) because A/xi^n = O(D_n intersect U) for every n, and this is independent of U (RF2:integral-divisors/completed-rings-B-plus-and-B). On overlaps the canonical constructions agree by full faithfulness. Glue the formal finite projective modules on this cover; for affinoid D their global sections give the lattice over B^+_D(S). Affineness of D alone does not assert a single chart U containing it with a principal ideal.
2. Given a lattice Xi with xi^k E'-hat_D in Xi in xi^(-k) E'-hat_D, let M' = E'(U), a finite projective A-module (AdicSpacesPartII:R3/vector-bundle-global-generation). The glueing datum (M'[1/xi], Xi, can) is finite projective, so the Beauville-Laszlo theorem gives a finite projective A-module M with M[1/xi] = M'[1/xi] and M tensor_A A-hat = Xi|_{D intersect U}; the inclusions xi^k M' in M in xi^(-k) M' hold because they hold after completion and after inverting xi (exactness of 0 -> M -> M[1/xi] (+) M-hat -> M-hat[1/xi] -> 0).
3. The bundle E_U on U attached to M agrees with E' on U minus D through these inclusions (xi is invertible there); glue all E_U with E'|_{X-cal minus D} along their overlaps and U minus D (vector bundles form a sheaf: AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing). The result is a modification bounded by k with Xi(E, beta) = Xi.
4. Conversely a modification bounded by k gives xi^k M' in E(U) in xi^(-k) M' and Xi(E, beta) = E(U)-hat is a lattice; morphisms are determined off D (RF4:vector-bundles/modification-of-vector-bundles), giving full faithfulness.
5. This is the argument of Scholze-Weinstein in the proofs of Proposition 19.1.2 and Theorem 14.1.1 and of Howe-Klevdal 4.3 ('Beauville-Laszlo gluing using the equivalence of vector bundles and finite projective modules on affinoids').

**Acceptance properties.**

- For S a geometric point, d = 1 and E' trivial of rank n, recover the classical bijection between rank-n bundles with a trivialisation off infinity and B^+_dR-lattices in B_dR^n
- Minuscule case: modifications bounded by 1 with I_D E'-hat in Xi in E'-hat correspond to finite projective O(D)-module quotients of E'|_D
- Independence of the chart U and of the local generator xi
- The schematic triple description of RF4:vector-bundles/vector-bundles-as-relative-B-pairs agrees with this one under GAGA

**Atlas landmark.** Beauville–Laszlo gluing on the curve.

**Sources.**

- [SW20-berkeley, Proof of Proposition 19.1.2, printed p. 170](#source-rf0-sw20-berkeley): The gluing of bundles off a Cartier divisor with lattices on its completion.
- [SW20-berkeley, Proof of Theorem 14.1.1, printed p. 116](#source-rf0-sw20-berkeley): Modifications at a degree-one divisor are lattices in the completion.
- [HK-admissible, Section 4.3, p. 29](#source-rf4-hk-admissible): The relative construction over a perfectoid base S, by exactly this proof.
- [FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192](#source-rf0-fs-geometrization): The completed rings B^+_D(S) of arbitrary degree d.

<a id="relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change"></a>

#### 81. The gluing is an exact tensor equivalence and commutes with base change

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). In the setting of RF4:vector-bundles/meromorphic-modification-at-a-divisor: (a) the lattice functor commutes with tensor products, duals and internal Hom: Xi(E_1 (x) E_2) = Xi(E_1) (x) Xi(E_2) inside (E'_1 (x) E'_2)-hat_D[1/I_D] and Xi(E^dual) = Xi(E)^dual; (b) it is exact: a sequence of modifications 0 -> E_1 -> E -> E_2 -> 0 of a short exact sequence 0 -> E'_1 -> E' -> E'_2 -> 0 is exact iff the sequence of lattices 0 -> Xi_1 -> Xi -> Xi_2 -> 0 is exact, and every exact sequence of lattices compatible with the completed sequence of the E' glues to an exact sequence of vector bundles; (c) it commutes with base change: for a map T -> S of affinoid perfectoid spaces with pulled-back divisor D_T, the pullback of (E, beta) corresponds to Xi (x)_{B^+_D(S)} B^+_{D_T}(T), compatibly with composition of base changes; (d) on the algebraic side, for a map of glueing pairs (R, f) -> (R_2, f_2) (a ring map with f |-> f_2 up to a unit), Can and the module of sections commute with base change of finite projective glueing data (coefficient change).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** Bundles and lattices are finite projective; exactness is for sequences of finite projective modules Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B), so B^+_D(S) -> B^+_{D_T}(T) is defined Coefficient change in (d) requires f_2 to be a nonzerodivisor (or (R_2, f_2) a glueing pair); otherwise the base-changed datum need not glue

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), [RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing](#relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing), [RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-finite-projective-glueing-over-exact-square), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), `mathlib:TensorProduct`, `mathlib:Module.Dual`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Proof/construction outline.**

1. (a) On a chart U with I_D = xi A, the gluing of RF4:vector-bundles/beauville-laszlo-module-gluing commutes with tensor products and duals of finite projective glueing data, because Can is a tensor functor and the module of sections of a finite projective datum is finite projective with M (x) R' = M' (RF4:vector-bundles/finite-projective-glueing-over-exact-square).
2. (b) Exact sequences of finite projective modules are split, so scalar extension preserves them. For reflection, the cokernel vanishes if it vanishes on both pieces (Stacks 15.92.2). Surjectivity onto the right finite projective module then splits; its kernel is finite projective and its scalar extensions are the kernels on the pieces. Apply the same cokernel detection to the map from the left module to that kernel, split again, and detect its remaining kernel by the sections exact sequence. This proves exactness reflection for finite projective sequences without claiming it for arbitrary modules. Caraiani-Scholze 3.5.1 records this compatibility.
3. (c) Pullback of the chart: A -> A_T with xi |-> xi_T a local generator of I_{D_T}, so A-hat (x) ... -> A_T-hat; the gluing of the base change is the base change of the gluing by (d).
4. (d) Let R -> A be the coefficient map of glueing pairs, with compatible maps R' -> A' and their localizations. If M glues the old finite projective datum, M tensor_R A is finite projective; tensor associativity identifies its canonical datum over (A,A') with the datum extended piecewise from the old one. Beauville-Laszlo over the new glueing pair identifies its sections with M tensor_R A. This does not assert that tensoring the original ring exact sequence stays exact, or that R' tensor_R A equals A'.

**Acceptance properties.**

- The tensor product of modifications bounded by k and l is bounded by k + l, and the lattice of the determinant is the determinant of the lattice
- Base change to the geometric points of S recovers the fibrewise lattices
- Exactness is asserted only for sequences of lattices, which are finite projective: the sequence 0 -> I_D B^+ -> B^+ -> B^+/I_D -> 0 has a torsion last term and is not the lattice sequence of a short exact sequence of modifications

**Sources.**

- [CS17-generic, Theorem 3.5.1](#source-rf4-cs17-generic): The tensor and exactness compatibility of the gluing, stated by Caraiani-Scholze for Kedlaya-Liu's equivalence.
- [FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192](#source-rf0-fs-geometrization): The completed rings are v-sheaves, so the gluing is compatible with base change in S.
- [Stacks-BL, Section 15.92, introduction](#source-rf4-stacks-bl): Coefficient change along maps of glueing pairs.

<a id="relativefarguesfontaine-rf4-vector-bundles-disjoint-and-colliding-legs"></a>

#### 82. Gluing along several disjoint or colliding legs

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). Let D_1, D_2 be divisors attached to S -> Div^{d_1}_(-), S -> Div^{d_2}_(-) and D = D_1 + D_2 the divisor attached to their sum in Div^{d_1 + d_2}, so I_D = I_{D_1} I_{D_2}. (a) Disjoint legs: if D_1 and D_2 are disjoint then B^+_D(S) = B^+_{D_1}(S) x B^+_{D_2}(S) and B_D(S) = B_{D_1}(S) x B_{D_2}(S); a lattice at D is a pair of lattices, and modifications of E' at D are equivalent to pairs consisting of a modification (E_1, beta_1) of E' at D_1 and a modification of E_1 at D_2 (iterated gluing, in either order, canonically independent of the order). (b) Colliding legs: if D = m D_1 (all legs equal, m >= 1) then I_D = I_{D_1}^m, B^+_D(S) = B^+_{D_1}(S) and B_D(S) = B_{D_1}(S), and a modification is bounded by l at D iff it is bounded by m*l at D_1. A k-bound at D_1 implies a ceiling(k/m)-bound at D, while that bound at D implies only an m*ceiling(k/m)-bound at D_1. When a least global bound k_min exists, the least bound at D is ceiling(k_min/m). (c) For a locally finite family (D_n) of pairwise disjoint degree-one divisors of Y_S (for instance the Frobenius translates phi^n(D_0), n >= 1, on Y_{[0,oo)}), modifications of E' with locally finite support along the union and meromorphy bounded on each chart (no single global bound imposed) are equivalent to families of lattices (Xi_n) at each D_n.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** Disjointness in (a) is of the closed subspaces D_1, D_2 of X-cal; then I_{D_1} + I_{D_2} = O and the Chinese remainder theorem applies on affinoid charts In (b) the legs may coincide; FS VI.1.2 constructs the degree-d divisor of an ordered tuple by the product equation xi = xi_1 ... xi_d, which is a nonzerodivisor also at coincident legs In (c) local finiteness is what lets the gluing be performed chart by chart; the family is infinite in Scholze-Weinstein Proposition 12.4.6

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

**Proof/construction outline.**

1. (a) Work on an affinoid chart cover near D with I_{D_i} = xi_i A, the ideals xi_1^n A and xi_2^n A are comaximal for every n, so A/(xi_1 xi_2)^n = A/xi_1^n x A/xi_2^n and the completions split; a lattice at D is then a pair, and RF4:vector-bundles/meromorphic-modification-at-a-divisor glues one factor at a time.
2. (b) For D = m D_1 one has I_D = I_{D_1}^m, so the I_D-adic and I_{D_1}-adic filtrations are cofinal and the completions and their localisations coincide; E -> E'(l D) is exactly E -> E'(m*l D_1); the same applies to beta^(-1), so meromorphy along D and along D_1 are the same condition.
3. (c) Apply the gluing on a cover of Y_S by charts each meeting finitely many D_n, as in the proof of Scholze-Weinstein Proposition 12.4.6 ('We can repeat this at phi^n(x_C) for all n >= 1'), and glue (AdicSpacesPartII:R3).
4. Fargues-Fontaine Proposition 5.3.1 is the absolute case: a bundle on X, finitely many points x_i, completions O-hat_{X,x_i}.

**Acceptance properties.**

- For S a geometric point and finitely many distinct classical points x_1, ..., x_r of X_FF, recover Fargues-Fontaine Proposition 5.3.1
- For two colliding legs at the same untilt, the Beilinson-Drinfeld ring B^+_{Div^2} at the diagonal is B^+_dR, not B^+_dR x B^+_dR
- The iterated gluing at D_1 then D_2 and at D_2 then D_1 give canonically isomorphic modifications
- For m = 2, the modification O(-2D_1) -> O is bounded by 1 at 2D_1 but not by 1 at nonempty D_1. Thus k-bounded and ceiling(k/m)-bounded loci are not identified in general.

**Sources.**

- [FS-geometrization, Definition VI.1.6 and the remark after it, printed p. 193](#source-rf0-fs-geometrization): Modifications along degree-d divisors, whose legs may collide.
- [SW20-berkeley, Proof of Proposition 12.4.6, printed pp. 106-107](#source-rf0-sw20-berkeley): Gluing along an infinite locally finite family of disjoint degree-one divisors.
- [FF18-courbe, Proposition 5.3.1, p. 209](#source-rf0-ff18-courbes): The absolute gluing at finitely many points.

<a id="relativefarguesfontaine-rf4-vector-bundles-untilt-divisor-complement-affine"></a>

#### 83. The complement of the untilt divisor in Proj(P_R) is affine (Kedlaya-Liu 8.9.3)

**Theorem.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). Then (a) the open subscheme Proj(P_R) minus Z is affine; (b) the closed subscheme Z is a Cartier divisor contained in an open affine subscheme of Proj(P_R).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** The base X = Spa(A, A^+) is affinoid perfectoid over Q_p; the source works with phi^a-modules over Q_p, which is the unramified coefficient field E = W(F_q)[1/p] (a) uses that Z is the zero locus of a section t_X of the ample line bundle L_X; Kedlaya-Liu state that L_X is pure of slope 1, and the corrected slope is 1/a (PAPER-KEDLAYA-LIU-15/E78), which does not affect ampleness (b) uses an element t_L of P_{L,1} over an auxiliary perfect analytic field L whose Newton polygon avoids slope 1

**Direct prerequisites.** [RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map](#relativefarguesfontaine-rf3-graded-algebra-and-algebraic-curve-map), `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`, `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, [RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate](#relativefarguesfontaine-rf2-untilts-closed-cartier-divisor-norm-estimate), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration).

**Proof/construction outline.**

1. (a) Z is the divisor of the section t_X of L_X. By KL Lemma 8.8.19 the phi^a-module of L_X is M(1) with M globally etale, so L_X is globally ample by KL Corollary 8.8.7 (VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness); the nonvanishing locus of a section of a globally ample line bundle is affine (KL Lemma 8.8.8; VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness).
2. (b) Following the proof of KL Proposition 6.2.4 choose t_L in P_{L,1} whose Newton polygon does not have slope 1; then Z is contained in the affine open D_+(t_L), on which Z is cut out by one equation.

**Acceptance properties.**

- At a geometric point (A = C) recover Fargues-Fontaine: X minus {infinity} = Spec(B_e) with B_e = B[1/t]^{phi = 1} for t in P_1 with V^+(t) = {infinity}
- The open D_+(t_L) of (b) contains Z and is affine, so the completion of Proj(P_R) along Z is an affine formal scheme

**Sources.**

- [KL15-foundations, Lemma 8.9.3, p. 187](#source-rf0-kl15-foundations): The statement verbatim.
- [KL15-foundations, Proof of Lemma 8.9.3, p. 187](#source-rf0-kl15-foundations): The proof route.

<a id="relativefarguesfontaine-rf4-vector-bundles-relative-period-rings-be-bdr"></a>

#### 84. The relative period rings B_e(A), B^+_dR(A), B_dR(A) (Kedlaya-Liu 8.9.4)

**Construction.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). Define R_1 = B_e(A) by Spec(R_1) = Proj(P_R) minus Z (affine by RF4:vector-bundles/untilt-divisor-complement-affine (a)); R_2 = B^+_dR(A) by Spec(R_2) = the completion of Proj(P_R) along Z (affine by (b)); and R_3 = B_dR(A) by Spec(R_3) = Spec(R_1) x_{Proj(P_R)} Spec(R_2). Then R_2 is the ker(theta)-adic completion of R-tilde^{int,1}_R and R_3 = R_2[1/z] for any generator z of ker(theta); R_2 and R_3 are the rings B^+_D(S), B_D(S) of the degree-one untilt divisor D of RF2:untilts, and the triple is a relative version of Fontaine's (B_e, B^+_dR, B_dR).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** Hypotheses of Kedlaya-Liu 8.9.1 (affinoid perfectoid base over Q_p, unramified coefficients) R_1 is the ring of the AFFINE scheme Proj(P_R) minus Z; it is not B[1/t]: the phi-invariance is built into P_R R_3 = R_2[1/z] is independent of the generator z of ker(theta) because any two differ by a unit of R_2

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine](#relativefarguesfontaine-rf4-vector-bundles-untilt-divisor-complement-affine), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map](#relativefarguesfontaine-rf3-graded-algebra-and-algebraic-curve-map), `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:BDeRhamPlus`, `mathlib:BDeRham`, `mathlib:IsLocalization.Away`, `mathlib:AdicCompletion`.

**Proof/construction outline.**

1. Lemma 8.9.3 makes all three schemes affine; the fibre product of affine schemes over a separated scheme is affine.
2. The identification of R_2 with the ker(theta)-adic completion of R-tilde^{int,1}_R uses that Z = Spec(A) and the completion along Z only sees the rings A/ker(theta)^n (KL Definition 8.9.4).
3. Compatibility with RF2:untilts: both rings are the completion of the structure sheaf along the same Cartier divisor, transported by GAGA (VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence).
4. In the p-typical case, compare R_2 with Mathlib's BDeRhamPlus A^+ p through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras, which identifies the theta-kernel-adic completions.

**API.**

- `RelativeBe` (data): R_1 = B_e(A) = O(Proj(P_R) minus Z), a Q_p-algebra functorial in (A, A^+).
- `RelativeBdRPlus` (data): R_2 = B^+_dR(A), the ring of the completion of Proj(P_R) along Z.
- `RelativeBdR` (data): R_3 = B_dR(A) = O(Spec R_1 x_{Proj} Spec R_2).
- `RelativeBdR.eq_localization` (characterisation): R_3 = R_2[1/z] for every generator z of ker(theta), and the localisation does not depend on z.
- `RelativeBdRPlus.equiv_completedRing` (compatibility): R_2 = B^+_D(S) and R_3 = B_D(S) for the degree-one divisor D of the untilt (RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration), compatibly with theta and the I_D-adic filtration.
- `RelativeBdRPlus.equiv_mathlib` (compatibility): In the p-typical case R_2 is canonically isomorphic to Mathlib's BDeRhamPlus A^+ p and R_3 to BDeRham A^+ p, through PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
- `RelativeBe.restrict` (projection): The restriction maps R_1 -> R_3 and R_2 -> R_3, and the localisation R_2 -> R_3.
- `RelativeBe.map` (functoriality): A morphism of perfectoid pairs (A, A^+) -> (A', A'^+) induces compatible maps R_i(A) -> R_i(A'), with map_id and map_comp.
- `RelativeBe.atGeometricPoint` (example): For A = C complete algebraically closed, R_1 = B[1/t]^{phi = 1} = B_e for t in P_1 with V^+(t) = {infinity}.

**Distinguishing examples.**

- `RelativeBe.fundamental_exact_sequence` (computation): For A = C and a = 1: ker(R_1 (+) R_2 -> R_3) = Q_p and R_1 (+) R_2 -> R_3 is surjective; this is Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 (PadicHodgeTheory:R06.1/fundamental-exact-sequence).
- `RelativeBdR.localization_unit_invariant` (degenerate): Replacing the generator z of ker(theta) by uz with u a unit of R_2 gives the same subring R_2[1/z] = R_2[1/(uz)] of R_3.
- `RelativeBdRPlus.mathlib_compat` (compatibility): For (A, A^+) = (C, O_C) with C/Q_p complete algebraically closed, R_2 is isomorphic to BDeRhamPlus O_C p and R_3 to BDeRham O_C p, compatibly with theta.
- `RelativeBe.not_B_invert_t` (non-example): R_1 is not B[1/t]: at A = C the element 1/t of B[1/t] is not phi-invariant (phi(1/t) = p^(-1) t^(-1)), so it does not lie in B_e.

**Acceptance properties.**

- At A = C: R_1 = B_e = B_crys^{phi = 1}, R_2 = B^+_dR(C), R_3 = B_dR(C), and Fontaine's fundamental exact sequence 0 -> Q_p -> B_e -> B_dR/B^+_dR -> 0 holds
- Changing the generator z of ker(theta) by a unit does not change R_3

**Uses.** Kedlaya-Liu Theorem 8.9.6: vector bundles on Proj(P_R) are triples over R_1, R_2 with an isomorphism over R_3, and the B-pair complex over these rings computes cohomology Caraiani-Scholze Theorem 3.5.1 and Corollary 3.5.2: gluing a B^+_dR,R-lattice in B_dR,R^n to the trivial bundle on X(R-flat) minus Z, giving the map from the affine Grassmannian to G-bundles Fargues-Fontaine 8.2.1.1: at a geometric point, X minus {infinity} = Spec(B_e), O-hat_{X,infinity} = B^+_dR, and bundles are pairs (M, N) Kedlaya-Liu Definition 9.3.11: the sheafified rings B_{e,X}, B^+_{dR,X}, B_{dR,X} of B-pairs over a general base

**Sources.**

- [KL15-foundations, Definition 8.9.4, p. 187](#source-rf0-kl15-foundations): The construction verbatim.
- [KL15-foundations, Definition 8.9.4, p. 187](#source-rf0-kl15-foundations): The identification with B^+_dR and B_dR.
- [CS17-generic, Before Theorem 3.5.1](#source-rf4-cs17-generic): Caraiani-Scholze's naming of R_2, R_3 as B^+_dR,R and B_dR,R.

<a id="relativefarguesfontaine-rf4-vector-bundles-b-pair-cohomology"></a>

#### 85. B-pair cohomology computes quasicoherent cohomology (Kedlaya-Liu 8.9.6(a))

**Theorem.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). With R_1, R_2, R_3 as in RF4:vector-bundles/relative-period-rings-Be-BdR, for every flat quasicoherent sheaf V on Proj(P_R) the cohomology of the complex 0 -> Gamma(Spec R_1, V) (+) Gamma(Spec R_2, V) -> Gamma(Spec R_3, V) -> 0, whose arrow is the difference of the two restriction maps, is naturally identified with H^i(Proj(P_R), V) (so H^i = 0 for i >= 2). At a geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle E with M = Gamma(X minus {infinity}, E) and N = E-hat_infinity: H^0(X, E) = M intersect N and H^1(X, E) = N[1/t]/(M + N).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/B-pair-cohomology`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** V flat and quasicoherent; for non-flat V the Beauville-Laszlo sequence need not be exact Spec(R_2) -> Proj(P_R) is not known to be flat in general (Kedlaya-Liu Remark 8.9.5), so the statement is not obtained by faithfully flat descent Same hypotheses as RF4:vector-bundles/untilt-divisor-complement-affine

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR](#relativefarguesfontaine-rf4-vector-bundles-relative-period-rings-be-bdr), [RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine](#relativefarguesfontaine-rf4-vector-bundles-untilt-divisor-complement-affine), [RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing](#relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing), `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `mathlib:Module.Flat`.

**Proof/construction outline.**

1. Cover Proj(P_R) by Spec(R_1) and an affine open Spec(B) containing Z on which Z = V(z) (Lemma 8.9.3(b)); Proj(P_R) is separated, so the Cech complex of this cover computes cohomology of quasicoherent sheaves and cohomology vanishes above degree 1 (KL Remark 8.7.6(b); VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension).
2. On Spec(B), Beauville-Laszlo for the glueing pair (B, z) and the flat module V(B) gives the exact sequence 0 -> V(B) -> V(B)[1/z] (+) (V(B) tensor_B B-hat) -> (V(B) tensor_B B-hat)[1/z] -> 0 (RF4:vector-bundles/beauville-laszlo-module-gluing (c)). This is extension of scalars, not the z-adic completion of V(B): those differ for infinite flat modules.
3. Combine the two by a diagram chase: Spec(B) minus Z = Spec(B[1/z]) is contained in Spec(R_1), and (V(B) tensor_B B-hat) = Gamma(Spec R_2, V), (V(B) tensor_B B-hat)[1/z] = Gamma(Spec R_3, V) (KL: 'This follows from Proposition 1.3.6').

**Acceptance properties.**

- For V = O and A = C recover H^0(X, O) = Q_p and H^1(X, O) = 0 from Fontaine's fundamental exact sequence
- For V = O(1) at a geometric point recover H^1(X, O(1)) = 0 from B_e^{phi = p}-surjectivity onto B_dR/B^+_dR
- Check that the complex has length two, matching the cohomological dimension one of Proj(P_R)

**Sources.**

- [KL15-foundations, Theorem 8.9.6(a), p. 188](#source-rf0-kl15-foundations): The statement verbatim.
- [KL15-foundations, Remark 8.9.5, p. 187](#source-rf0-kl15-foundations): Why Beauville-Laszlo, not flat descent, is used.
- [FF18-courbe, Proposition 5.3.3, p. 209](#source-rf0-ff18-courbes): The absolute case at a geometric point.

<a id="relativefarguesfontaine-rf4-vector-bundles-vector-bundles-as-relative-b-pairs"></a>

#### 86. Vector bundles on the relative curve are relative B-pairs (Kedlaya-Liu 8.9.6(b),(c))

**Theorem.** Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: a >= 1 an integer and q = p^a; (A, A^+) a perfectoid adic Banach algebra over Q_p, X = Spa(A, A^+), and (R, R^+) the perfect uniform adic Banach algebra over F_p corresponding to it; P_R = sum_{n >= 0} P_{R,n} the graded ring of phi^a-invariants (H^0 of O(n)), Proj(P_R) the schematic relative curve, FF_R -> Proj(P_R) the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and Z the image of the canonical section Spec(A) -> Proj(P_R) given by the untilt A of R. For S = Spa(R, R^+) over F_q and E = W(F_q)[1/p] this is the schematic curve X_S^alg = Proj(P) of RF3 and the degree-one divisor of the untilt; L_X denotes the line bundle O(Z) (KL Definition 8.8.18, Convention 8.9.2). (b) The morphism Spec(R_1 (+) R_2) -> Proj(P_R) is an effective descent morphism for quasicoherent finite locally free sheaves. (c) The category of vector bundles on Proj(P_R) is equivalent to the category of triples (V_1, V_2, iota) with V_1 a finite projective R_1 = B_e(A)-module, V_2 a finite projective R_2 = B^+_dR(A)-module and iota : V_1 (x)_{R_1} R_3 = V_2 (x)_{R_2} R_3 an isomorphism of R_3 = B_dR(A)-modules; the equivalence is compatible with tensor products and short exact sequences. By GAGA the same holds for vector bundles on the adic relative curve FF_R = X_S (Caraiani-Scholze Theorem 3.5.1). At a geometric point S = Spa(C^flat), where B_e is a principal ideal domain, vector bundles on X_FF are triples of finite free modules (Fargues-Fontaine Corollaire 5.3.2) and isomorphism classes of rank-n bundles are GL_n(B_e) \ GL_n(B_dR) / GL_n(B^+_dR).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/vector-bundles-as-relative-B-pairs`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** Hypotheses of Kedlaya-Liu 8.9.1: affinoid perfectoid base over Q_p and unramified coefficients; the general-E relative version is RF4:vector-bundles/meromorphic-modification-at-a-divisor, formulated through modifications The triples are of finite projective modules; finite free in the field case only because Pic(Spec B_e) = 0 The compatibility with short exact sequences is stated by Caraiani-Scholze for this equivalence

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/relative-period-rings-Be-BdR](#relativefarguesfontaine-rf4-vector-bundles-relative-period-rings-be-bdr), [RelativeFarguesFontaine:RF4:vector-bundles/untilt-divisor-complement-affine](#relativefarguesfontaine-rf4-vector-bundles-untilt-divisor-complement-affine), [RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing](#relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `mathlib:Module.Projective`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Equivalence`.

**Proof/construction outline.**

1. (b), (c): Kedlaya-Liu deduce both from Proposition 1.3.6: on an affine open Spec(B) containing Z with Z = V(z), the glueing pair (B, z) glues finite projective B[1/z]- and B-hat-modules; glue the result with V_1 on Spec(R_1) along Spec(B[1/z]) (RF4:vector-bundles/beauville-laszlo-module-gluing, RF4:vector-bundles/untilt-divisor-complement-affine).
2. Transport to FF_R by GAGA (KL Theorem 8.7.7; VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence), as Caraiani-Scholze do.
3. Tensor and exactness compatibility as in RF4:vector-bundles/gluing-exactness-tensor-and-base-change.
4. Field case: B_e is a principal ideal domain (Fargues-Fontaine; VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point), so finite projective B_e-modules are free; choosing bases gives the double coset description (FF Corollaire 5.3.2).

**Acceptance properties.**

- Gluing a B^+_dR(A)-lattice in B_dR(A)^n to the trivial bundle on Proj(P_R) minus Z gives a vector bundle (the 'in particular' of Caraiani-Scholze 3.5.1)
- At a geometric point the trivial lattice gives O^n and the lattice t^(-1) B^+_dR (+) B^+_dR^(n-1) gives O(1) (+) O^(n-1)
- Rank one at a geometric point: GL_1(B_e) \ B_dR^x / (B^+_dR)^x = Z, the degree

**Atlas landmark.** Vector bundles as relative B-pairs.

**Sources.**

- [KL15-foundations, Theorem 8.9.6(b),(c), p. 188](#source-rf0-kl15-foundations): The statement; KL's proof is 'This follows from Proposition 1.3.6'.
- [CS17-generic, Theorem 3.5.1](#source-rf4-cs17-generic): The adic curve via GAGA, and the tensor and exactness compatibility.
- [FF18-courbe, Corollaire 5.3.2, p. 209](#source-rf0-ff18-courbes): The absolute case with the double coset description.

<a id="relativefarguesfontaine-rf4-vector-bundles-lattices-and-modifications-of-trivial-bundles"></a>

#### 87. Lattices (T, Xi) and modifications of trivial bundles (Scholze-Weinstein 12.4.6, 14.1.1)

**Comparison.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). (a) For S affinoid perfectoid with an untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S, fix a finite free O_E-module T and the reference bundle F = T (x)_{O_E} O_{X_S}. The gluing of RF4:vector-bundles/meromorphic-modification-at-a-divisor gives an equivalence between B^+_dR(S^sharp)-lattices Xi in T (x)_{O_E} B_dR(S^sharp) and modifications (F', beta^(-1)) of this fixed F at D, where beta : F|_{X_S minus D} -> F'|_{X_S minus D} is meromorphic along D. If T varies, the output retains T and its identification with the reference bundle; forgetting this integral data does not give an equivalence of categories. (b) For S = Spa(C^flat) and E = Q_p, using the locally finite family of disjoint divisors phi^n(x_C), n >= 1, of Y_{[0,oo)}: the pairs (T, Xi) are equivalent to shtukas over Spa(C^flat) with one leg at phi^(-1)(x_C) (Scholze-Weinstein Proposition 12.4.6), and to quadruples (F, F', beta, T) with F trivial and T a Z_p-lattice in H^0(X_FF, F) (Theorem 14.1.1, (2) <=> (3)). (c) Minuscule case (Fargues-Fontaine 8.3.1): lattices with t Xi_0 in Xi in Xi_0, Xi_0 = T (x) B^+_dR, correspond to C-subspaces of T (x) C, i.e. to modifications whose cokernel is killed by t.

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** E = Q_p and S a geometric point in (b), as in the source; (a) is the relative statement and needs no more than the linear gluing The equivalence of 'F trivial with a Z_p-lattice T in H^0(X_FF, F)' and 'T finite free over Z_p' uses H^0(X_FF, O) = Q_p (VectorBundlesAndIsocrystals:VB1/cohomology-of-twists), not the classification of bundles This node is the curve input of the ESSENTIAL SURJECTIVITY of Fargues' theorem (BKF modules <-> (T, Xi)); full faithfulness uses no curve input (BMS1 Remark 4.29), so it is exported to the essential-surjectivity part of AInfCohomology AI.2 only (RT-AREA-padic-1/19) The one-leg shtuka assertion additionally needs SW Theorem 12.3.4, Proposition 12.3.5 and Corollary 12.4.1. The owner of these contracts must be assigned; they are not supplied by the vector-bundle cohomology prerequisite.

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), [RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs](#relativefarguesfontaine-rf4-vector-bundles-disjoint-and-colliding-legs), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `mathlib:Module.Free`.

**Proof/construction outline.**

1. (a) Apply RF4:vector-bundles/meromorphic-modification-at-a-divisor with E' = F: F-hat_D = T (x) B^+_dR(S^sharp), so modifications of F at D are lattices in T (x) B_dR.
2. (b) Scholze-Weinstein, proof of Proposition 12.4.6: from (T, Xi) take the shtuka with no legs T (x) O_{Y[0,oo)}, glue Xi at x_C by Beauville-Laszlo, and repeat at phi^n(x_C) for n >= 1 (RF4:vector-bundles/disjoint-and-colliding-legs (c)) to get a meromorphic Frobenius; conversely Corollary 12.4.1 recovers (T, Xi).
3. (b) Proof of Theorem 14.1.1, (2) <=> (3): 'By Corollary 13.5.5, the datum of a trivial vector bundle F is equivalent to the datum of a finite-dimensional Q_p-vector space; together with T, this data is equivalent to a finite free Z_p-module T. Now by the Beauville-Laszlo lemma, the datum of F' and beta is equivalent to the datum of a B^+_dR-lattice.'
4. (c) A modification with t Xi_0 in Xi in Xi_0 is determined by Xi / t Xi_0, a C-subspace of Xi_0 / t Xi_0 = T (x) C (Fargues-Fontaine 8.3.1).

**Acceptance properties.**

- p-divisible group range: T (x) B^+_dR in Xi in xi^(-1)(T (x) B^+_dR) (Scholze-Weinstein Theorem 14.1.1, last sentence; Remark 12.4.7)
- Rank one: Xi = xi^k B^+_dR with k in Z gives F' = O(-k), compatible with the sign convention O(infinity) = O(1)
- The functor (T, Xi) |-> (F, F', beta, T) commutes with tensor products and duals (RF4:vector-bundles/gluing-exactness-tensor-and-base-change)

**Sources.**

- [SW20-berkeley, Proposition 12.4.6, printed p. 106](#source-rf0-sw20-berkeley): Part (b), first equivalence.
- [SW20-berkeley, Proof of Proposition 12.4.6, printed pp. 106-107](#source-rf0-sw20-berkeley): The gluing step.
- [SW20-berkeley, Proof of Theorem 14.1.1, printed p. 116](#source-rf0-sw20-berkeley): Part (b), second equivalence.
- [BMS18-integral, Remark 4.29, p. 43](#source-rf0-bms18-integral): Why this node feeds only the essential-surjectivity half of Fargues' theorem.

<a id="relativefarguesfontaine-rf4-vector-bundles-kedlaya-algebraicity-of-punctured-bundles"></a>

#### 88. Kedlaya's algebraicity of vector bundles on the punctured Witt spectrum

**Theorem.** Let R be a perfect Tate Huber ring of characteristic p, R^+ a ring of integral elements, x in R a topologically nilpotent unit (so x in R^+), and A = W(R^+) (p-typical Witt vectors). Let X-sch = Spec(A) minus V(p, [x]) and Y-ad = Spa(A, A) minus V(p, [x]), the analytic locus. Then pullback along the morphism of locally ringed spaces Y-ad -> X-sch is an equivalence Vec(X-sch) = Vec(Y-ad) (Kedlaya, Theorem 3.8). If moreover R^+ = o_K for a perfectoid field K of characteristic p, then finite free A-modules, vector bundles on Spa(A, A) and vector bundles on Spa(A, A) minus the closed point are equivalent (Kedlaya Theorem 3.9; Scholze-Weinstein Theorem 14.2.1), and so are vector bundles on Spec(A) minus the closed point (Scholze-Weinstein Lemma 14.2.3). For general R^+ a vector bundle on Spec(A) minus {p = [x] = 0} need not extend to Spec(A) (Kedlaya Example 3.14).

Identifier: `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`. Parent: `RelativeFarguesFontaine:RF4:vector-bundles`.

**Hypotheses.** p-typical: A = W(R^+), coefficient field Q_p, as in the source; the ramified W_{O_E}(R^+) and equal-characteristic versions are proof obligations not covered by a read source The adic space Y-ad contains the locus [x] = 0 (the 'crystalline end'), outside Y-curly_S; its rational charts are those of Kedlaya Definition 3.5 The extension over the closed point in the field case uses that A_inf is a 'two-dimensional regular local ring'-like ring (Kedlaya Hypothesis 2.1); it fails for general R^+

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/finite-projective-glueing-over-exact-square](#relativefarguesfontaine-rf4-vector-bundles-finite-projective-glueing-over-exact-square), [RelativeFarguesFontaine:RF4:vector-bundles/beauville-laszlo-module-gluing](#relativefarguesfontaine-rf4-vector-bundles-beauville-laszlo-module-gluing), `AdicSpacesPartII:R3/simple-laurent-glueing-square`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R5/sousperfectoid-stably-uniform`, [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-locus), [RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness](#relativefarguesfontaine-rf0-integral-y-whole-analytic-ainf-sheafiness), `PerfectoidSpaces:P1/witt-vectors-of-perfect-plus-ring`, `mathlib:WittVector`, `mathlib:Module.Projective`, `mathlib:Module.Free`.

**Proof/construction outline.**

1. Cover Y-ad by the rational subsets U = {|[x]| <= |p| != 0} = Spa(B_1) and V = {|p| <= |[x]| != 0} = Spa(B_2) with intersection Spa(B_12), where B_1 = A_1<[x]/p>, B_2 = A_2<p/[x]>, A_1 = A[1/p], A_2 = A[1/[x]], A_12 = A[1/p[x]] (Kedlaya Definition 3.5). These charts are supplied by RF0:integral-Y/whole-analytic-ainf-locus, rather than by the smaller curly-Y open.
2. Import the exact chart sheafiness/stable-uniformity input of RF0:integral-Y/whole-analytic-ainf-sheafiness: A_1,A_12,B_1,B_2,B_12,B_2-prime are stably uniform, whereas A_2 is only asserted uniform (Kedlaya Proposition 3.6). Use the completed coefficient-root extension and continuous module splitting of the R5 supplier. Do not infer stable uniformity of A_2 or treat an underlying-ring isomorphism involving a primed chart as a topological isomorphism.
3. On each sheafy chart, vector bundles are finite projective modules (Kedlaya Proposition 3.2(c); AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing), and the simple Laurent squares are glueing squares (Proposition 3.2(a,b); AdicSpacesPartII:R3/simple-laurent-glueing-square, AdicSpacesPartII:R3/glueing-square-finite-projective-descent).
4. Compare the Zariski cover {Spec A_1, Spec A_2} of X-sch with the adic cover through the exact-square gluing of RF4:vector-bundles/finite-projective-glueing-over-exact-square; in the resulting 2-commutative square every functor but Vec(X-sch) -> Vec(Y-ad) is an equivalence (proof of Kedlaya Theorem 3.8).
5. Field case: Kedlaya Theorem 2.7 (vector bundles on the punctured Spec of A_inf extend uniquely: the gluing stack uses A_inf[1/p] and W(K) over W(K)[1/p], where W(K) is the p-adic completion of A_inf[1/[x]]; Lemma 2.6 proves that its sections are finite free and Lemma 2.3(c) recovers the bundle) combined with Theorem 3.8; Scholze-Weinstein give the same proof (Lemmas 14.2.3, 14.3.1).

**Acceptance properties.**

- Field case: every vector bundle on Spa(A_inf) minus {x_k} is free, recovering the input of Breuil-Kisin-Fargues module theory
- Kedlaya Example 3.14: for R^+ the (y, z)-adic completion of the perfection of k[[y, z]] and x = yz, the kernel of (a, b, c) |-> a[y] + b[z] + cp is a bundle on Spec W(R^+) minus the closed point that does not extend
- Compatibility with the Beauville-Laszlo square used in the field case

**Atlas landmark.** Kedlaya algebraicity of vector bundles.

**Sources.**

- [Kedlaya-Ainf, Theorem 3.8](#source-rf0-ked-ainf): The statement verbatim.
- [Kedlaya-Ainf, Theorem 3.9](#source-rf0-ked-ainf): The field case.
- [SW20-berkeley, Theorem 14.2.1, printed p. 116](#source-rf0-sw20-berkeley): The field case as used in Fargues' theorem.
- [GR24-prismatic, Proof of Theorem 4.15, p. 43](#source-rf4-gr24-prismatic): The use routed to this layer by the Guo-Reinecke extraction (item 129).

### RF4 — G-torsor modifications

Import the BG0 torsor dictionary in its required field, scheme and integral forms. Apply the linear gluing to representations, prove the faithful-representation meromorphy criterion, and establish functoriality and divisor compatibilities. Descent and local triviality preserve their smooth/reductive scopes and henselian hypotheses. The resulting lattice modification is the output consumed by loop and Hecke geometry.

<a id="relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification"></a>

#### 89. Modifications of G-bundles at a relative Cartier divisor

**Definition.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let X-cal be Y_S or X_S, D the divisor of a map S -> Div^d_(-) and P, P' G-bundles on X-cal. A modification between P and P' at D is an isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of exact tensor functors on X-cal minus D such that for every V in Rep_E G the induced isomorphism beta_V : P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D} is meromorphic along D, i.e. extends to a morphism P(V) -> P'(V)(kD) for k >> 0 (Fargues-Scholze III.3). Applying this to V^dual shows that each beta_V is a modification of vector bundles in the sense of RF4:vector-bundles/modification-of-vector-bundles. Modifications between G-bundles at D form a groupoid, and G-modifications of a fixed P' at D form a groupoid Mod^G_D(P').

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** G linear algebraic over E for X-cal = Y_S, X_S (on Y-curly_S with G over O_E the integral statements are formulated over the completed rings, see RF4:G-torsors/tannakian-transfer-of-gluing (ii)) Meromorphy is required for EVERY representation; by RF4:G-torsors/faithful-representation-criterion it suffices to test one faithful representation and its dual beta is an isomorphism of tensor functors, so the beta_V are compatible with tensor products, duals and morphisms of representations

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles](#relativefarguesfontaine-rf4-vector-bundles-modification-of-vector-bundles), `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`.

**Proof/construction outline.**

1. Fargues-Scholze define the notion in III.3 for D in Div^1; the definition is the same for D of any degree, the meromorphy being along the Cartier divisor D.
2. Scholze-Weinstein Remark 19.1.3: in the Tannakian language a trivialisation off S^sharp is meromorphic iff it is so for the vector bundles of all algebraic representations.
3. Composition, inverse and pullback are inherited representation by representation from the vector-bundle notion.

**API.**

- `GModification` (data): A modification between G-bundles P and P' at D: an isomorphism of exact tensor functors off D, meromorphic on every representation.
- `GModification.toModification` (projection): For V in Rep_E G, beta_V is a modification of P'(V) at D (RF4:vector-bundles/modification-of-vector-bundles), natural in V and compatible with tensor products and duals.
- `GModification.ofGL` (equivalence): For G = GL_n, G-modifications are the modifications of the rank-n vector bundles P(std).
- `GModification.refl` (constructor): The identity of P is a modification between P and P.
- `GModification.symm` (constructor): The inverse of a modification is a modification.
- `GModification.trans` (constructor): The composite of modifications at D is a modification at D.
- `GModification.pushforward` (functoriality): For rho : G -> H, rho_* beta (precomposition with Res : Rep H -> Rep G) is a modification between rho_* P and rho_* P'.
- `GModification.pullback` (functoriality): Pullback along T -> S of affinoid perfectoid spaces, with map_id and map_comp.
- `GModification.ext` (extensionality): Two modifications between P and P' are equal iff they agree on one faithful representation (equivalently off D on all representations).

**Distinguishing examples.**

- `GModification.gl_eq_modification` (compatibility): For G = GL_n, the map beta |-> beta_std is a bijection from modifications between P and P' at D to modifications of the vector bundles P(std), P'(std) at D.
- `GModification.gm_geometric_point` (computation): For G = G_m, S = Spa(C^flat) and D = infinity, the modifications of the trivial G_m-bundle at D are the line bundles O(-k), k in Z, with the lattice xi^k B^+_dR (xi a uniformiser of B^+_dR).
- `GModification.identity_degenerate` (degenerate): For d = 0 (D empty) a modification between P and P' is an isomorphism of G-bundles P = P'.
- `GModification.not_iso_extension` (non-example): Meromorphy is not extension to an isomorphism over D: for G = G_m the inclusion O(-D) -> O is a modification between O(-D) and O at D, although it does not extend to an isomorphism of G_m-bundles on X-cal.

**Acceptance properties.**

- For G = GL_n with the standard representation the notion is RF4:vector-bundles/modification-of-vector-bundles
- For G = G_m and S a geometric point, the modifications of the trivial bundle at infinity are the O(-k), k in Z
- Meromorphy is preserved under pushforward along homomorphisms G -> H

**Uses.** Fargues-Scholze III.3: Gr_G/phi^Z -> Div^1 is the moduli of D, E in Bun_G(X_S) and a modification between the trivial G-bundle and E at D, giving Gr_G -> Bun_G Fargues-Scholze Definition VI.1.6: the local Hecke stack parametrises pairs of G-bundles over B^+_{Div^d} with an isomorphism over B_{Div^d}, the completed form of a modification Caraiani-Scholze Corollary 3.5.2: the G-bundle E(x) of a point x of the B^+_dR-affine Grassmannian BunGAndNewtonStrata:BG2:uniformization: the Beauville-Laszlo morphism Gr_G -> Bun_G is surjective HeckeStacksAndLocalShtukas:HS0: both projections of the Hecke correspondence are G-bundles related by a modification at the legs

**Sources.**

- [FS-geometrization, III.3, printed p. 97](#source-rf0-fs-geometrization): The definition verbatim (abridged).
- [SW20-berkeley, Remark 19.1.3, printed p. 170](#source-rf0-sw20-berkeley): Meromorphy is tested on all representations.
- [HK-admissible, Section 4.3, p. 29](#source-rf4-hk-admissible): The relative Tannakian notion over a perfectoid base.

<a id="relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing"></a>

#### 90. Beauville-Laszlo gluing for G-bundles (Tannakian transfer)

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (i) Let G be a linear algebraic group over E, X-cal = Y_S or X_S, D the affinoid divisor of S -> Div^d_(-), and P' a G-bundle on X-cal with completion P'-hat_D (the exact tensor functor V |-> P'(V)-hat_D to finite projective B^+_D(S)-modules). Then P |-> P-hat_D gives an equivalence between the groupoid of pairs (P, beta), beta a modification between P and P' at D (RF4:G-torsors/meromorphic-G-modification), and the groupoid of pairs (Q, alpha) with Q a G-torsor on Spec B^+_D(S) and alpha : Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}. In particular every such (Q, alpha) is effective. For d = 1, S over Spd E with untilt S^sharp and P' trivial: G-torsors on Spec B^+_dR(R^sharp) with a trivialisation over B_dR(R^sharp) correspond to G-bundles on X_S with a modification of the trivial G-bundle at S^sharp (Fargues-Scholze III.3, Scholze-Weinstein Proposition 19.1.2). (ii) For G smooth affine over O_E and X-cal = Y-curly_S (or an open subset of S x Spa O_E as in Scholze-Weinstein 19.1.2) the same holds, with the O_E-integral Tannakian description of torsors.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** The tensor functors are exact; exactness of the glued functor is what the exactness half of RF4:vector-bundles/gluing-exactness-tensor-and-base-change provides Torsors on the affine schemes Spec B^+_D(S), Spec B_D(S) are taken in the Tannakian sense, via the scheme-theoretic three-descriptions theorem (Scholze-Weinstein 19.5.1, Broshi), requested from BG0 D affinoid, which holds locally on S; the statement globalises by the base-change compatibility (ii) uses the O_E-version of BG0's comparison; Fargues-Scholze note that the reference is for Z_p and 'extends verbatim to O_E'

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification](#relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification), [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`, [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), `tauceti:TauCeti.AffineGroupSchemeCat`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.Equivalence`.

**Proof/construction outline.**

1. For each V in Rep_E G apply RF4:vector-bundles/meromorphic-modification-at-a-divisor to E' = P'(V) and the lattice Q(V) in P'(V)-hat_D[1/I_D] given by alpha: this gives a vector bundle P(V) with a modification beta_V.
2. Functoriality in V and compatibility with tensor products, duals and exact sequences (RF4:vector-bundles/gluing-exactness-tensor-and-base-change) make V |-> P(V) an exact tensor functor, i.e. a G-bundle (BunGAndNewtonStrata:BG0/g-torsors-three-descriptions), and beta a modification between G-bundles.
3. Full faithfulness from full faithfulness of the linear gluing representation by representation.
4. Scholze-Weinstein, proof of 19.1.2: 'the identification with G-torsors over this locus follows from the Tannakian formalism and the Beauville-Laszlo lemma'; Caraiani-Scholze 3.5.2: 'If G = GL_n, this follows from the discussion above. In general, it follows from the Tannakian formalism.'

**Acceptance properties.**

- For G = GL_n recover RF4:vector-bundles/meromorphic-modification-at-a-divisor
- For P' trivial and d = 1, (Q, alpha) is a point of LG/L^+G before sheafification; its image is the Beauville-Laszlo map on S-points
- The construction is independent of the faithful representation used to bound the modification (RF4:G-torsors/faithful-representation-criterion)

**Atlas landmark.** Beauville–Laszlo gluing for G-bundles.

**Sources.**

- [SW20-berkeley, Proposition 19.1.2, printed p. 170](#source-rf0-sw20-berkeley): The torsor-modification description of the B^+_dR-affine Grassmannian.
- [FS-geometrization, III.3, printed pp. 97-98](#source-rf0-fs-geometrization): The relative identification over Spd E.
- [CS17-generic, Corollary 3.5.2 and proof](#source-rf4-cs17-generic): The Tannakian transfer of the linear gluing.

<a id="relativefarguesfontaine-rf4-g-torsors-faithful-representation-criterion"></a>

#### 91. Meromorphy can be tested on one faithful representation

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let G be a linear algebraic group over E and V in Rep_E G faithful. (a) An isomorphism beta : P|_{X-cal minus D} = P'|_{X-cal minus D} of G-bundles is a modification at D iff beta_V is a modification of the vector bundles P(V), P'(V) at D (both beta_V and beta_V^(-1) meromorphic). (b) Consequently the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing and its bounds may be computed with any faithful representation: if beta_V is bounded by k then for every tensor construction W = V^(x a) (x) (V^dual)^(x b) and every subquotient of a direct sum of copies of that tensor word, beta_W is bounded by (a + b) k. For a finite sum of tensor words of differing bidegrees (a_i,b_i), the bound is max_i(a_i + b_i) k.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** V faithful: G -> GL(V) a closed immersion (Tau Ceti's TauCeti.Comodule.IsFaithful); a non-faithful V does not suffice Both directions of meromorphy are needed for V; equivalently one direction for V and for V^dual The subquotient step uses that P and P' are EXACT tensor functors, so subrepresentations go to local direct summands

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification](#relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification), [RelativeFarguesFontaine:RF4:vector-bundles/modification-of-vector-bundles](#relativefarguesfontaine-rf4-vector-bundles-modification-of-vector-bundles), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.Comodule.IsFaithful`, `tauceti:TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom`.

**Proof/construction outline.**

1. Deligne-Milne Proposition 2.20(b): for G algebraic with faithful V, V (+) V^dual is a tensor generator of Rep_E G, i.e. every W is a subquotient of P(V, V^dual) for a polynomial P with natural coefficients. The general faithful-representation independence is BG0's ('faithful-representation independence'); this node adds the meromorphy statement.
2. Meromorphy with bound k is preserved by tensor products (bounds add), duals, and direct sums (RF4:vector-bundles/modification-of-vector-bundles API).
3. Subobjects: if W in W' then P(W) in P(W') and P'(W) in P'(W') are local direct summands; the extension P(W') -> P'(W')(kD) maps P(W) into P'(W)(kD) because it does so off D and P'(W)(kD) is saturated in P'(W')(kD) (sections are determined off D since I_D is invertible). Quotients similarly.
4. Hence meromorphy on V and V^dual gives meromorphy on every W, which is the definition of a G-modification (Fargues-Scholze III.3).

**Acceptance properties.**

- For G = GL_n and V the standard representation, (a) is the definition
- For a torus T with faithful character lattice generators, meromorphy on finitely many characters suffices
- A non-faithful V (e.g. the trivial representation) does not detect meromorphy

**Sources.**

- [DM82-tannakian, Proposition 2.20(b) and its proof](#source-rf4-dm82-tannakian): The tensor-generator property of a faithful representation.
- [DM82-tannakian, Footnote 11 to Proposition 2.20](#source-rf4-dm82-tannakian): What 'tensor generator' means.
- [FS-geometrization, III.3, printed p. 97](#source-rf0-fs-geometrization): The definition reduced here to one faithful representation.

<a id="relativefarguesfontaine-rf4-g-torsors-change-of-structure-group"></a>

#### 92. Gluing commutes with change of structure group

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let rho : G -> H be a homomorphism of linear algebraic groups over E (resp. of smooth affine group schemes over O_E). (a) Pushforward rho_* (precomposition with the restriction functor Res_rho : Rep H -> Rep G) carries G-modifications at D to H-modifications at D, and commutes with the gluing of RF4:G-torsors/tannakian-transfer-of-gluing: rho_*(glue(Q, alpha)) = glue(rho_* Q, rho_* alpha), compatibly with composition (rho' rho)_* = rho'_* rho_*. (b) Over E, if rho is a closed immersion, an isomorphism of G-bundles off D is meromorphic along D iff its pushforward to H is.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** (a) needs no hypothesis on rho; (b) needs rho a closed immersion (equivalently every G-representation is a subquotient of restrictions of H-representations) Extension of structure group of torsors itself is BG0's; this node is its compatibility with gluing and meromorphy Part (b) is over the field E. Deligne-Milne 2.21(b) does not justify the same claim over O_E; the integral extension requires a separate representation theorem and is not asserted here.

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing](#relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing), [RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion](#relativefarguesfontaine-rf4-g-torsors-faithful-representation-criterion), [RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification](#relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification), `BunGAndNewtonStrata:BG0`, `tauceti:TauCeti.Comodule.IsFaithful`.

**Proof/construction outline.**

1. (a) For W in Rep H, (rho_* P)(W) = P(Res W); the gluing of RF4:G-torsors/tannakian-transfer-of-gluing is computed representation by representation, so it commutes with precomposition by Res.
2. (b) Deligne-Milne Proposition 2.21(b): rho is a closed immersion iff every object of Rep G is a subquotient of an object Res(W'); meromorphy passes to subquotients as in RF4:G-torsors/faithful-representation-criterion. Equivalently, the restriction of a faithful H-representation is a faithful G-representation.
3. For reductive groups this is the linear-algebra input to Scholze-Weinstein Lemma 19.1.5 (Gr_G -> Gr_H is a closed embedding for a closed embedding G -> H), whose Grassmannian statement is GeometricSatakeAndFusion's.

**Acceptance properties.**

- G = GL_n -> GL_n x GL_m, g |-> (g, det g): the pushforward of a modification of rank-n bundles is the pair (modification, its determinant)
- For a closed immersion rho the restriction of a faithful H-representation is a faithful G-representation, so (b) also follows from RF4:G-torsors/faithful-representation-criterion

**Sources.**

- [DM82-tannakian, Proposition 2.21(b)](#source-rf4-dm82-tannakian): The criterion used for (b).
- [SW20-berkeley, Lemma 19.1.5, printed p. 171](#source-rf0-sw20-berkeley): The Grassmannian consumer of the change-of-group compatibility.

<a id="relativefarguesfontaine-rf4-g-torsors-base-change-and-divisor-compatibility"></a>

#### 93. G-gluing commutes with base change and with addition of legs

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a) For a map f : T -> S of affinoid perfectoid spaces over F_q and D the divisor of S -> Div^d_(-), the G-gluing of RF4:G-torsors/tannakian-transfer-of-gluing commutes with pullback: f^* glue(Q, alpha) = glue(Q (x)_{B^+_D(S)} B^+_{D_T}(T), alpha_T), compatibly with composition of base changes. (b) For D = D_1 + D_2 with D_1, D_2 disjoint, G-torsors on Spec B^+_D(S) with an isomorphism over B_D(S) are pairs of such data at D_1 and D_2, and the gluing at D is the iterated gluing at D_1 and D_2; for colliding legs D = m D_1 the data at D and at D_1 coincide. (c) For arbitrary D_1, D_2, a chain of modifications at D_1 then D_2 has a composite meromorphic at D_1 + D_2: representationwise the local equations multiply, and the two finite pole bounds give a bound at the sum. This construction commutes with base change. An equivalence with pairs of independent lattice data is asserted only on the disjoint locus; on a collision locus the chain retains extra intermediate data.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** Base change uses that B^+_{Div^d} and B_{Div^d} are v-sheaves over Div^d (RF2:integral-divisors/completed-rings-B-plus-and-B) Disjointness is of the closed subspaces D_1, D_2; the product decomposition of the completed rings is RF4:vector-bundles/disjoint-and-colliding-legs

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing](#relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), [RelativeFarguesFontaine:RF4:vector-bundles/disjoint-and-colliding-legs](#relativefarguesfontaine-rf4-vector-bundles-disjoint-and-colliding-legs), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf](#relativefarguesfontaine-rf2-integral-divisors-div-d-moduli-v-sheaf), [RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness](#relativefarguesfontaine-rf2-integral-divisors-product-equation-and-affineness).

**Proof/construction outline.**

1. (a) Apply RF4:vector-bundles/gluing-exactness-tensor-and-base-change (c) representation by representation.
2. (b) A G-torsor on Spec(B_1 x B_2) is a pair of torsors; combine with RF4:vector-bundles/disjoint-and-colliding-legs (a), (b) representation by representation.
3. (c) Work representationwise on charts with local equations xi_1, xi_2. If the bounds are k,l, the composite and its inverse have poles at most kD_1+lD_2, hence at most max(k,l)(D_1+D_2). The product equation and pullback of divisors are RF2:integral-divisors/product-equation-and-affineness. Disjoint product decomposition and diagonal cofinality do not prove a factorisation for partially overlapping divisors.

**Acceptance properties.**

- Pullback to geometric points recovers the fibrewise Beauville-Laszlo modifications of Fargues-Scholze III.3
- On the diagonal of Div^1 x Div^1 the two legs collide and the datum is a single modification at the common leg

**Sources.**

- [FS-geometrization, VI.1, before Definition VI.1.5, printed p. 192](#source-rf0-fs-geometrization): Base change in S.
- [FS-geometrization, Definition VI.1.6, printed p. 193](#source-rf0-fs-geometrization): Data over degree-d divisors with possibly colliding legs.

<a id="relativefarguesfontaine-rf4-g-torsors-v-descent-and-local-triviality"></a>

#### 94. v-descent of G-torsors and etale-local triviality over the completed divisor rings

**Theorem.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). (a) For S in Perf over F_q, U an open subset of S x Spa O_E (for example of Y-curly_S) and G smooth affine over O_E, the functor S' |-> {G-torsors on U x_{S x Spa O_E} (S' x Spa O_E)} is a v-stack on Perf_S (Scholze-Weinstein Proposition 19.5.3; Fargues-Scholze's footnote extends it from Z_p to O_E). (b) For S -> Div^d_(-) with D_S affinoid, vector bundles and G-bundles over B^+_{Div^d}(S) (G reductive over O_E, resp. over E) satisfy v-descent in S, and so do isomorphisms between two of them over B_{Div^d}(S). (c) Every G-bundle over B^+_{Div^d_{Y-curly}}(S), G reductive over O_E, is trivial etale-locally on S. The quotient presentations Hck = L^+G \ LG / L^+G and Gr = LG / L^+G that Fargues-Scholze deduce from (b) and (c) are GeometricSatakeAndFusion:GS0:loop-geometry's and are not planned here.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** G smooth affine for (a); G reductive for (b) and (c), as in Fargues-Scholze VI.1.6-1.7 (a) uses sousperfectoidness: U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^ is perfectoid and U -> it splits as topological modules (c) is etale-local on S, not merely v-local; the presentation of Hck is one of ETALE stacks The affineness of the target scheme is what makes loop spaces v-sheaves (FS before Definition VI.1.6)

**Direct prerequisites.** `BunGAndNewtonStrata:BG0/g-torsors-three-descriptions`, `BunGAndNewtonStrata:BG0`, [RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor](#relativefarguesfontaine-rf2-integral-divisors-v-descent-of-bundles-on-the-divisor), [RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B](#relativefarguesfontaine-rf2-integral-divisors-completed-rings-b-plus-and-b), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks`, `AdicSpacesPartII:R5/sousperfectoid-adic-space`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `mathlib:Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `mathlib:Algebra.Smooth`, `mathlib:HenselianRing`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`, `mathlib:Module.Projective`, `tauceti:TauCeti.ReductiveAffineGroupSchemeCat`.

**Proof/construction outline.**

1. (a) Scholze-Weinstein, proof of 19.5.3: by the Tannakian description reduce to GL_n; base change to the perfectoid U' = U x_{Spa Z_p} Spa Z_p[p^(1/p^oo)]^; vector bundles on perfectoid spaces satisfy v-descent (SW Proposition 17.1.8, requested from DiamondsAndVStacks D2); descend back along A -> A' split as topological A-modules (finite projectivity descends, Stacks 08XD).
2. (b) Fargues-Scholze, proof of VI.1.7: vector bundles over B^+_{Div^d} satisfy v-descent, checked modulo powers of I_S where it is Proposition VI.1.4 (RF2:integral-divisors/v-descent-of-bundles-on-the-divisor); by the Tannakian formalism so do G-bundles; an isomorphism over B_{Div^d}(S) is a section of an affine scheme, which again satisfies v-descent.
3. (c) At a geometric point B^+_{Div^d_{Y-curly}}(S) is a finite product of complete discrete valuation rings with algebraically closed residue field, so torsors under smooth G are trivial. In general, triviality modulo I_S implies triviality: the torsor's coordinate ring is smooth over B^+ and B^+ is I_S-adically complete, so a section modulo I_S lifts (Mathlib Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete).
4. (c) Triviality modulo I_S holds etale-locally on S by Gabber-Ramero Proposition 5.4.21 (in arXiv v3: for (R, tI) henselian and X smooth quasi-projective over R[1/t], X(R[1/t]) is dense in X(R^[1/t])), applied to the torsor over the henselian pair; for d = 1 Scholze-Weinstein give an alternative: the reduction to Spec R^sharp is etale-locally trivial and trivialisations lift along B^+_dR/xi^n because H^1_et(S^sharp, O) = 0. The arXiv approximation statement has been matched, but specifying R,t,I, the smooth quasi-projective scheme, and the passage from a dense image to an etale neighbourhood on S is a nonroutine step, recorded as a gap; merely citing henselianity of the completed B^+ ring is insufficient.

**Acceptance properties.**

- The presentation obtained by trivialising etale-locally is one of etale stacks, not merely v-stacks
- At a geometric point check triviality directly from the product-of-complete-DVRs description
- Without affineness of Z, L^+Z and LZ need not be v-sheaves; the Tannakian reduction to GL_n is where affineness enters

**Atlas landmark.** v-descent and étale-local triviality.

**Sources.**

- [SW20-berkeley, Proposition 19.5.3 and proof, printed pp. 180-181](#source-rf0-sw20-berkeley): Part (a).
- [FS-geometrization, Proof of Proposition VI.1.7, printed p. 193](#source-rf0-fs-geometrization): Part (b).
- [FS-geometrization, Proof of Proposition VI.1.7, printed p. 193](#source-rf0-fs-geometrization): Part (c), geometric points.
- [FS-geometrization, Proof of Proposition VI.1.7, printed p. 193](#source-rf0-fs-geometrization): Part (c), the general step and its citation.
- [GR02-almost, Proposition 5.4.21 (arXiv v3)](#source-rf4-gr02-almost): The henselian approximation statement; in the arXiv numbering it is the tool FS's citation needs.
- [SW20-berkeley, Proof of Proposition 19.1.2, printed p. 170](#source-rf0-sw20-berkeley): The degree-one argument.

<a id="relativefarguesfontaine-rf4-g-torsors-modification-of-g-bundle-by-lattice"></a>

#### 95. The modification of a G-bundle by a B^+_dR-lattice

**Construction.** Conventions of this layer: E is a nonarchimedean local field with residue field F_q and uniformizer pi; S = Spa(R, R^+) is an affinoid perfectoid space over F_q with pseudouniformizer varpi; Y-curly_S = Spa W_{O_E}(R^+) minus V([varpi]), Y_S = Y-curly_S minus V(pi) and X_S = Y_S / phi^Z (RF0, RF1). For a map S -> Div^d_(-) the associated closed Cartier divisor D = D_S of Y-curly_S, Y_S or X_S has invertible ideal sheaf I_D (RF2:integral-divisors); when D is affinoid (always locally on S) B^+_D(S) denotes the global sections of the I_D-adic completion of the structure sheaf along D and B_D(S) = B^+_D(S)[1/I_D] (FS's B^+_{Div^d}(S), B_{Div^d}(S); B^+_dR, B_dR when d = 1). G-bundles are taken in the Tannakian sense of BunGAndNewtonStrata:BG0: for G a linear algebraic group over E (affine of finite type), Rep_E G its finite-dimensional representations, a G-bundle on an adic space or scheme X over E is an exact tensor functor Rep_E G -> Bun(X); BG0 proves this equivalent to geometric and cohomological torsors on sousperfectoid spaces. For G smooth affine over O_E the same with representations on finite free O_E-modules (Scholze-Weinstein 19.5). Over an affine scheme Spec(B), Bun means finite projective B-modules. The general equivalence of the three descriptions is BG0's and is not proved here (RS-20). Let S be a perfectoid space over Spd E (untilt S^sharp over E, D = S^sharp the degree-one divisor of X_S), G a linear algebraic group over E, P a G-bundle on X_S and L a G(B^+_dR)-lattice on the G(B_dR)-torsor P|_{B_dR}: a G-torsor Q on Spec B^+_dR(R^sharp), given etale-locally on S, with alpha : Q|_{B_dR} = P-hat_D|_{B_dR}. The modification P_L of P by L is the G-bundle on X_S glued from (P, Q, alpha) by RF4:G-torsors/tannakian-transfer-of-gluing, with its canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}. It is functorial in (P, L), compatible with pullback in S and with pushforward along homomorphisms of groups. For P trivial it is the map E from G-torsors on Spec B^+_dR trivialised over B_dR to G-bundles on X_S of Caraiani-Scholze Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with Gr_G(S) is GeometricSatakeAndFusion:GS0:loop-geometry's, and the resulting Beauville-Laszlo morphism Gr_G -> Bun_G is exported to BG2:uniformization, HS0 and HS2.

Identifier: `RelativeFarguesFontaine:RF4:G-torsors/modification-of-G-bundle-by-lattice`. Parent: `RelativeFarguesFontaine:RF4:G-torsors`.

**Hypotheses.** The lattice is a G(B^+_dR)-lattice, i.e. a G-torsor over B^+_dR, not merely a B^+_dR-lattice in one representation L is given etale-locally on S; the construction descends by RF4:G-torsors/v-descent-and-local-triviality Degree one here; several or colliding legs are RF4:G-torsors/base-change-and-divisor-compatibility

**Direct prerequisites.** [RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing](#relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing), [RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality](#relativefarguesfontaine-rf4-g-torsors-v-descent-and-local-triviality), [RelativeFarguesFontaine:RF4:G-torsors/base-change-and-divisor-compatibility](#relativefarguesfontaine-rf4-g-torsors-base-change-and-divisor-compatibility), [RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group](#relativefarguesfontaine-rf4-g-torsors-change-of-structure-group), [RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification](#relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification), [RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration](#relativefarguesfontaine-rf2-untilts-bdr-completion-and-filtration), `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

**Proof/construction outline.**

1. Howe-Klevdal 4.3: completion along I_infinity is an exact tensor functor Vect(FF_S) -> Loc_{B^+_dR}(S); a lattice L on E|_{B_dR} defines E_L by the Tannakian formalism and Beauville-Laszlo gluing.
2. Glue with RF4:G-torsors/tannakian-transfer-of-gluing etale-locally on S where L is a torsor with alpha, and descend by RF4:G-torsors/v-descent-and-local-triviality (a).
3. Functoriality, base change and pushforward from RF4:G-torsors/base-change-and-divisor-compatibility and RF4:G-torsors/change-of-structure-group.

**API.**

- `modify` (constructor): The G-bundle P_L on X_S attached to a G-bundle P and a G(B^+_dR)-lattice L on P|_{B_dR}.
- `modify.modification` (projection): The canonical modification P_L|_{X_S minus D} = P|_{X_S minus D}, meromorphic along D.
- `modify_tautological` (simp): For the tautological lattice L = P-hat_D, P_L = P with the identity modification.
- `modify_comp` (relation): For L a lattice on P|_{B_dR} and L' a lattice on P_L|_{B_dR} = P|_{B_dR}, (P_L)_{L'} = P_{L'}.
- `modify.pullback` (functoriality): For T -> S, (P_L)_T = (P_T)_{L_T}; compatible with composition.
- `modify.pushforward` (functoriality): For rho : G -> H, rho_*(P_L) = (rho_* P)_{rho_* L}.
- `modify_gl` (compatibility): For G = GL_n, P_L is the bundle glued by RF4:vector-bundles/meromorphic-modification-at-a-divisor from P(std) and the lattice L(std).
- `modify.characterisation` (characterisation): P_L is the unique G-bundle with a modification to P at D whose completion at D is L (RF4:G-torsors/tannakian-transfer-of-gluing).

**Distinguishing examples.**

- `modify_gl_compat` (compatibility): For G = GL_n and P trivial, P_L is the rank-n vector bundle obtained by gluing the B^+_dR-lattice L in B_dR^n to the trivial bundle off D, as in Caraiani-Scholze 3.5.1.
- `modify_gm_degree` (computation): For G = G_m, S = Spa(C^flat), P trivial and L = xi^k B^+_dR, P_L = O(-k), of degree -k.
- `modify_tautological_eq` (degenerate): For the tautological lattice L = P-hat_D the modification P_L is P, with the identity modification.
- `modify_SL2_nonlattice` (non-example): For G = SL_2 and P trivial, the B^+_dR-lattice xi B^+_dR (+) B^+_dR of B_dR^2 has determinant lattice xi B^+_dR, so it is not an SL_2(B^+_dR)-lattice of the trivial SL_2-torsor and does not define an SL_2-modification, although it defines a GL_2-modification.

**Acceptance properties.**

- For G = GL_n the construction is RF4:vector-bundles/meromorphic-modification-at-a-divisor
- Sign convention: for G = G_m and the lattice xi^k B^+_dR the modified bundle is O(-k), as fixed by O(infinity) = O(1)
- Modifying first by L and then by L' (a lattice in P_L|_{B_dR} = P|_{B_dR}) is modifying by L'

**Uses.** Fargues-Scholze Proposition III.3.1: the Beauville-Laszlo morphism Gr_G -> Bun_G is a surjection of pro-etale stacks (BunGAndNewtonStrata:BG2:uniformization) Caraiani-Scholze Corollary 3.5.2 and Proposition 3.5.3: the map b(.) : Gr_G(C, O_C) -> B(G), x |-> b(E(x)), and its compatibility with mu Howe-Klevdal, Section 4.3: modifications E_L interpolating the modifications at geometric points HeckeStacksAndLocalShtukas:HS2: local shtuka moduli parametrise modifications of G-bundles at the legs GeometricSatakeAndFusion:GS0:loop-geometry: the torsor-modification description of the Beilinson-Drinfeld Grassmannian is compared with the loop quotient

**Atlas landmark.** Modification of a G-bundle by a lattice.

**Sources.**

- [HK-admissible, Section 4.3, p. 29](#source-rf4-hk-admissible): The construction verbatim.
- [CS17-generic, Corollary 3.5.2](#source-rf4-cs17-generic): The trivial-P case.
- [FS-geometrization, III.3, printed p. 98](#source-rf0-fs-geometrization): The Beauville-Laszlo morphism, owned on the Grassmannian side by GS0.

## Closure interfaces

The target statements above retain the following exact proof obligations. A planned supplier is not an implemented declaration. Each obligation names its consuming nodes, and external requests retain their direction and scope in the handoff. No layer is asserted closed.

### Integral coefficient tensor interface

The all-E source computation is read, but its O_E coefficient map into the (π,[ϖ])-adic ring need not satisfy R0’s adic-map hypothesis. The precise R0 request must be implemented or extended before the completed tensor and topological module splitting can be invoked.

Consumed by: [RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model](#relativefarguesfontaine-rf0-integral-y-root-extension-chart-model), [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness).

### Integral perfectoid criterion supplied at P1

The root relation verifies u^p=[ϖ] divides p in mixed characteristic and the displayed quotient Frobenius is bijective; complete the regularity and completion-topology comparison against the requested integral criterion. Existing P1 distinguished regularity is not that criterion.

Consumed by: [RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness](#relativefarguesfontaine-rf0-integral-y-chart-cover-perfectoidness-and-sheafiness).

### All-E relative period norm extension

KL’s relative estimates are p-typical. Carry each uniform estimate through the finite unramified-base coefficient tensor in mixed characteristic and through R^+[[π]] in equal characteristic, tracking |π| and q. A syntactic replacement p↦π is not a proof. The explicit targets, rings and source proof steps are present.

Consumed by: [RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings](#relativefarguesfontaine-rf0-annuli-relative-extended-robba-rings), [RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid](#relativefarguesfontaine-rf0-annuli-interval-rings-relatively-perfectoid), [RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons](#relativefarguesfontaine-rf0-annuli-annular-coefficient-choice-and-anchor-comparisons).

### Early all-E degree criterion without bundle circularity

Fargues Proposition2.18 proves the generic degree criterion using Pic and Banach–Colmez theorems, which RS-20 places at a subsequent owner. The early integral criterion requires an independent local Weierstrass/factorization argument with fibre lengths and v-local ordered legs, including π=0; establish it without importing VB2/VB3. The forward map, product regularity and line descent are independent targets already written.

Consumed by: [RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion](#relativefarguesfontaine-rf2-integral-divisors-relative-degree-criterion).

### Ordinary bundle correction on divisor thickenings

FSVI.1.4 uses almost vanishing and a convergent matrix correction to obtain ordinary effective descent. The norm-controlled correction across all finite I^n quotient rings remains to be formalized; neither an almost vector bundle nor an almost H^1 conclusion is adequate.

Consumed by: [RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor](#relativefarguesfontaine-rf2-integral-divisors-v-descent-of-bundles-on-the-divisor).

### Lubin–Tate formal groups and logarithm input

No callable existing atlas node was found for the needed formal-group law, torsion tower, its tilt and the logarithm exact sequence with simple torsion zeros over every E. Upstream ClassFieldTheory explicitly excludes Lubin–Tate theory. Propose the input as LocalFieldsRamification, Part II; no nonexistent LocalFields:LF2 edge is used.

Consumed by: [RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift](#relativefarguesfontaine-rf0-integral-y-lubin-tate-teichmuller-lift), [RelativeFarguesFontaine:RF3/lubin-tate-divisor-section](#relativefarguesfontaine-rf3-lubin-tate-divisor-section), [RelativeFarguesFontaine:RF1/lubin-tate-diamond-presentation](#relativefarguesfontaine-rf1-lubin-tate-diamond-presentation).

### Completion base-change exactness

The statement separates functorial maps and v-sheaf descent from a completed tensor isomorphism. Verify strict finite-quotient comparisons for the stated rational and finite-etale cases, then the inverse-limit comparison; arbitrary tensor-limit exchange is not asserted.

Consumed by: [RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change](#relativefarguesfontaine-rf2-untilts-divisor-completion-base-change).

### Geometric completion comparison interfaces

The algebraic pinned constructions exist and R06.1 supplies matching p-typical affinoid periods. Establish the marked tilt/PreTilt identification, localized theta-kernel and analytic Cartier quotient before applying it; select the E embedding/factor after finite separable coefficient extension. R06.1 is not a theorem for every ramified/equal-characteristic coefficient presentation.

Consumed by: [RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison](#relativefarguesfontaine-rf2-untilts-p-typical-affinoid-completion-comparison), [RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison](#relativefarguesfontaine-rf2-untilts-coefficient-field-de-rham-comparison).

### Global Proj and Div1 properties have outward owners

The later nodes/stage are requested, not early prerequisites: VB2 extends U→Proj globally and supplies twists; VB3 supplies Div1 properness/smoothness and hence openness/closedness of the projection. This is an ownership boundary rather than an unproved global claim in the early packet.

Consumed by: [RelativeFarguesFontaine:RF3/section-covered-proj-chart-map](#relativefarguesfontaine-rf3-section-covered-proj-chart-map), [RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness](#relativefarguesfontaine-rf2-untilts-div1-moduli-and-properness), [RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base](#relativefarguesfontaine-rf1-diamond-formula-and-map-to-base).

### Arbitrary complement data in general-E adic gluing

The stage target asks for an arbitrary vector bundle on X-cal minus D, a finite projective module on the formal completion, and a compatible punctured-formal identification. Node meromorphic-modification-at-a-divisor proves the fixed-global-reference lattice case. Prove the local algebraisation/complement-to-localization comparison for arbitrary complement data on Y-curly_S, Y_S and X_S, or provide a precise supplier contract and public proof with hypotheses. CS 3.5.1 and KL 8.9.6 cover the unramified schematic degree-one case, not this full target.

Consumed by: [RelativeFarguesFontaine:RF4:vector-bundles/meromorphic-modification-at-a-divisor](#relativefarguesfontaine-rf4-vector-bundles-meromorphic-modification-at-a-divisor), [RelativeFarguesFontaine:RF4:vector-bundles/gluing-exactness-tensor-and-base-change](#relativefarguesfontaine-rf4-vector-bundles-gluing-exactness-tensor-and-base-change), [RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing](#relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing).

### BG0 suppliers in the generality required and the RS-20 cycle

BG0/g-torsors-three-descriptions currently supplies only reductive G over E on sousperfectoid X over E, and itself requires RF4:vector-bundles and RF4:G-torsors. The exact scheme and smooth O_E-integral versions, and the field tensor-generator/restriction statements, are requested explicitly in requests[0]. Until those statements and the acyclic BG0 supplier contract are present, this is not a closed import. Do not recreate the torsor dictionary in RF4.

Consumed by: [RelativeFarguesFontaine:RF4:G-torsors/meromorphic-G-modification](#relativefarguesfontaine-rf4-g-torsors-meromorphic-g-modification), [RelativeFarguesFontaine:RF4:G-torsors/tannakian-transfer-of-gluing](#relativefarguesfontaine-rf4-g-torsors-tannakian-transfer-of-gluing), [RelativeFarguesFontaine:RF4:G-torsors/faithful-representation-criterion](#relativefarguesfontaine-rf4-g-torsors-faithful-representation-criterion), [RelativeFarguesFontaine:RF4:G-torsors/change-of-structure-group](#relativefarguesfontaine-rf4-g-torsors-change-of-structure-group), [RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality](#relativefarguesfontaine-rf4-g-torsors-v-descent-and-local-triviality).

### No-leg shtukas and recovery of a one-leg shtuka

Assign a foundation owner and supply SW Theorem 12.3.4 (phi-modules over the integral Robba ring, W(C-flat), finite free Z_p-modules), Proposition 12.3.5 (no-leg shtukas -> integral Robba phi-modules), and Corollary 12.4.1 (unique meromorphic phi^(-1)-equivariant tail identification and recovery). These are used in node lattices-and-modifications-of-trivial-bundles(b); VB1/cohomology-of-twists supplies only H^0 of trivial curve bundles. HS2 is a downstream consumer of RF4 and cannot be imported as the foundation without a cycle. The fixed-T lattice/modification equivalence and (2)<->(3) of SW 14.1.1 are independently justified.

Consumed by: [RelativeFarguesFontaine:RF4:vector-bundles/lattices-and-modifications-of-trivial-bundles](#relativefarguesfontaine-rf4-vector-bundles-lattices-and-modifications-of-trivial-bundles).

### Henselian approximation specialized to a relative divisor

For FS VI.1.7 etale-local triviality in arbitrary degree, specialize GR arXiv v3 Proposition 5.4.21: give R,t,I with t regular and (R,tI) henselian, identify its completion and the smooth quasi-projective torsor scheme, and derive the etale neighbourhood on S from approximation and the geometric fibre. Confirm the published GR03 locator or cite only the read arXiv statement. Smooth-affine nonreductive G is an additional extension requiring proof, not a consequence of the cited reductive statement.

Consumed by: [RelativeFarguesFontaine:RF4:G-torsors/v-descent-and-local-triviality](#relativefarguesfontaine-rf4-g-torsors-v-descent-and-local-triviality).

## Bibliography

The part-qualified source identifiers below share an entry when their recorded PDF hashes agree. Different source versions keep separate entries. Detailed access records, SHA-256 fingerprints, source findings and item routes remain in the two part packets. Numbered passages at each target refer to the indicated edition.

<a id="source-rf0-fs-geometrization"></a>

### Geometrization of the local Langlands correspondence

Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf).

- `RF0/FS-geometrization`: MPIM author copy, PDF created 27 November 2024, 356 pages; locators refer to this copy, not Astérisque 466 (2026)
- `RF4/FS-geometrization`: Author-hosted 356-page PDF (MPIM Bonn); corresponds to arXiv:2102.13459v4 by contents

<a id="source-rf0-sw20-berkeley"></a>

### Berkeley Lectures on p-adic Geometry

Peter Scholze, Jared Weinstein. [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf).

- `RF0/SW20-berkeley`: Annals of Mathematics Studies 207; PDF dated 'March 27, 2020' on every page header
- `RF4/SW20-berkeley`: Annals of Mathematics Studies 207; author PDF dated 'March 27, 2020' on every page header

<a id="source-rf0-bms18-integral"></a>

### Integral p-adic Hodge theory

Bhargav Bhatt, Matthew Morrow, Peter Scholze. [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148).

- `RF0/BMS18-integral`: Publications IHES 128 (2018) 219-397; library PDF, section 3 inspected 2026-09-15
- `RF4/BMS18-integral`: arXiv:1602.03148v3; published in Publications mathematiques de l'IHES 128 (2018)

<a id="source-rf0-stacks-finite-etale"></a>

### Henselian pairs and finite etale algebras

The Stacks Project Authors. [Henselian pairs and finite etale algebras](https://stacks.math.columbia.edu/tag/09ZL).

- `RF0/Stacks-finite-etale`: Tags 09XI and09ZL, accessed7 October2026

<a id="source-rf0-klii-errata"></a>

### Relative p-adic Hodge theory II: imperfect period rings

Kiran Kedlaya, Ruochuan Liu. [Relative p-adic Hodge theory II: imperfect period rings](https://arxiv.org/abs/1602.06899).

- `RF0/KLII-errata`: arXiv:1602.06899v3 (2019), Appendix A only

<a id="source-rf0-ff18-courbes"></a>

### Courbes et fibres vectoriels en theorie de Hodge p-adique

Laurent Fargues, Jean-Marc Fontaine. [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf).

- `RF0/FF18-courbes`: Author copy, 16 April 2017, 399 pages; Astérisque 406 (2018)
- `RF4/FF18-courbe`: Asterisque 406 (2018); author copy courbe.pdf dated 16 avril 2017

<a id="source-rf0-kl15-foundations"></a>

### Relative p-adic Hodge theory: foundations

Kiran Kedlaya, Ruochuan Liu. [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792).

- `RF0/KL15-foundations`: arXiv:1301.0792v5, 9 May 2015 (PDF dated 2 May 2015); preprint of Astérisque 371 (2015)
- `RF4/KL15-foundations`: arXiv:1301.0792v5 (9 May 2015, version to appear in Asterisque 371); the published Asterisque text was not read

<a id="source-rf0-far-divisors"></a>

### Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local

Laurent Fargues. [Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf).

- `RF0/Far-divisors`: Author preprint dated 24 October 2017; source cited as Far20b by FS, numbering checked in this edition

<a id="source-rf0-hk-sheafiness"></a>

### Sheafiness criteria for Huber rings

David Hansen, Kiran Kedlaya. [Sheafiness criteria for Huber rings](https://kskedlaya.org/papers/criteria.pdf).

- `RF0/HK-sheafiness`: Author-hosted criteria.pdf, version 6 August 2026, accessed 7 October 2026

<a id="source-rf0-ked-ainf"></a>

### Some ring-theoretic properties of A_inf

Kiran Kedlaya. [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016).

- `RF0/Ked-Ainf`: arXiv:1602.09016v5, 11 June 2019
- `RF4/Kedlaya-Ainf`: arXiv:1602.09016v5 (11 June 2019); published in p-adic Hodge theory, Simons Symposia, Springer 2020 ([Ked20] of Guo-Reinecke; cited by SW20 as [Ked19b, Theorem 3.6], whereas the statements used are Theorems 3.8-3.9 of arXiv v5; the published numbering was not checked)

<a id="source-rf0-ked-witt"></a>

### Nonarchimedean geometry of Witt vectors

Kiran Kedlaya. [Nonarchimedean geometry of Witt vectors](https://arxiv.org/abs/1004.0466).

- `RF0/Ked-Witt`: arXiv:1004.0466 author copy

<a id="source-rf0-zhu17"></a>

### Affine Grassmannians and the geometric Satake in mixed characteristic

Xinwen Zhu. [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/2017/185-2/p02).

- `RF0/Zhu17`: Annals of Mathematics 185 (2017), no. 2, §0.5

<a id="source-rf0-bs17"></a>

### Projectivity of the Witt vector affine Grassmannian

Bhargav Bhatt, Peter Scholze. [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf).

- `RF0/BS17`: Author copy Witt.pdf, §9

<a id="source-rf0-gr24-prismatic"></a>

### A prismatic approach to crystalline local systems

Haoyang Guo, Emanuel Reinecke. [A prismatic approach to crystalline local systems](https://par.nsf.gov/servlets/purl/10534610).

- `RF0/GR24-prismatic`: Inventiones mathematicae 236 (2024), 17–164; publisher article from NSF PAR

<a id="source-rf0-sch13-periods"></a>

### p-adic Hodge theory for rigid-analytic varieties

Peter Scholze. [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf).

- `RF0/Sch13-periods`: Author-hosted pAdicHodgeTheory.pdf

<a id="source-rf0-ff18-corrected"></a>

### Courbes et fibres vectoriels en theorie de Hodge p-adique, corrected author copy

Laurent Fargues, Jean-Marc Fontaine. [Courbes et fibres vectoriels en theorie de Hodge p-adique, corrected author copy](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf).

- `RF0/FF18-corrected`: Author-hosted PDF created 13 November 2018, 404 pages; checked §1.2.1 Lemme 1.2.3, printed p. 7

<a id="source-rf0-fs21-fargues"></a>

### Geometrization of the local Langlands correspondence, Fargues author copy

Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence, Fargues author copy](https://webusers.imj-prg.fr/~laurent.fargues/Geometrization.pdf).

- `RF0/FS21-fargues`: Author-hosted PDF created 26 February 2021, 348 pages; comparison of II.1.1 and II.1.10 only

<a id="source-rf4-stacks-bl"></a>

### The Stacks project, More on Algebra, Section 15.92 The Beauville-Laszlo theorem (tag 0BNI), with Sections 15.9 and 15.11

The Stacks project authors. [The Stacks project, More on Algebra, Section 15.92 The Beauville-Laszlo theorem (tag 0BNI), with Sections 15.9 and 15.11](https://stacks.math.columbia.edu/tag/0BNI).

- `RF4/Stacks-BL`: Online version, tags 0BNI, 0BNR, 0BNS, 0BNW, 0BP2, 07M7 and 0ALJ, accessed 2026-10-06

<a id="source-rf4-cs17-generic"></a>

### On the generic part of the cohomology of compact unitary Shimura varieties

Ana Caraiani, Peter Scholze. [On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1).

- `RF4/CS17-generic`: arXiv:1511.02418v1 (8 November 2015); published in Annals of Mathematics 186 (2017), where Theorem 3.5.1 is on p. 687

<a id="source-rf4-hk-admissible"></a>

### Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem

Sean Howe, Christian Klevdal. [Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem](https://arxiv.org/abs/2308.11064v2).

- `RF4/HK-admissible`: arXiv:2308.11064v2 (28 February 2025)

<a id="source-rf4-gr24-prismatic"></a>

### A prismatic approach to crystalline local systems

Haoyang Guo, Emanuel Reinecke. [A prismatic approach to crystalline local systems](https://arxiv.org/abs/2203.09490v3).

- `RF4/GR24-prismatic`: arXiv:2203.09490v3 (27 October 2023); published in Inventiones Mathematicae 236 (2024)

<a id="source-rf4-gr02-almost"></a>

### Almost ring theory

Ofer Gabber, Lorenzo Ramero. [Almost ring theory](https://arxiv.org/abs/math/0201175v3).

- `RF4/GR02-almost`: arXiv:math/0201175v3, sixth and final release (2002); Fargues-Scholze cite the Springer LNM 1800 (2003) edition as [GR03], whose numbering was not checked

<a id="source-rf4-dm82-tannakian"></a>

### Tannakian categories

Pierre Deligne, James S. Milne. [Tannakian categories](https://www.jmilne.org/math/xnotes/tc2018.pdf).

- `RF4/DM82-tannakian`: Revised version of LNM 900 (1982), dated November 4, 2018, author-hosted
