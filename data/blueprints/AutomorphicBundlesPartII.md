# Automorphic bundles and classical automorphic forms, Part II

This roadmap passes from the parent’s automorphic coefficient bundles and section operators to integral coherent cohomology, equivariant perfect complexes and higher-degree Hecke operators. It then compares canonical and interior coherent cohomology with automorphic forms, calculates the singular Siegel weight ranges, and isolates the boundary and classification inputs needed for cuspidal descriptions. The eight layers organize the construction, rather than follow the order of a source.

The planning pass is complete: 70 targets account for all 99 items routed from six papers. There are 22 definitions or constructions, each with five API clauses and three definition checks, and 39 atlas planets. All layers are **planned**, none is closed or implemented. Six named gaps and 33 precise supplier requests remain. Those are mathematical obligations, not implicit assumptions that the suggested Lean file has discharged.

The companion [packet](../packets/AutomorphicBundlesPartII.json) records the target graph, sources, coverage and findings; the [definition](../roadmaps/AutomorphicBundlesPartII.json) records its atlas layers. The [suggested file](../suggested/AutomorphicBundlesPartII.lean) states only the small part whose genuine carriers exist at the pins. The reader is the full target specification.

## Starting point and ownership

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The declarations below were read at those commits. The current upstream roadmap tree was additionally checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current upstream takes precedence over the older atlas snapshot when assigning ownership. ModularForms and ModularCurves supplied nearby examples of roadmap density and style.

| Input | Existing owner and the boundary of this roadmap |
| --- | --- |
| Associated bundles, principal frames, coefficient tensors and extensions | AutomorphicBundles B0–B4. IC.1 adds the graded integral Levi realization on the supplied models, not another generic associated-bundle construction. Current upstream AlgebraicVectorBundles L0A–L0C already owns scheme-module tensor, dual and finite locally free operations. |
| Section Hecke operators and convolution | AutomorphicBundles B5, especially `hecke-section-operator` and `hecke-convolution`. IC.3 constructs the higher-degree operator and compares H⁰ with that existing operator. |
| Relative coherent duality, Čech cohomology, Cousin resolutions and depth | SchemeAndStackFoundations SF.2, with fine nodes for smooth-proper and finite duality, sheafified duality, affine Čech comparison, Kempf resolutions and local cohomology. A field-only Serre-duality theorem does not provide the finite-DVR-coefficient pairing. |
| Perfect complexes, duals, retracts and finite derived local factors | DeformationAndDerivedPatchingAlgebra P7. Fine nodes are imported for perfectness, dual models, completion and finite derived-action localization. IC.2 supplies geometric group-ring models; IC.4 applies existing K-projective lifting. |
| Toroidal and minimal models, fan independence, boundary charts and p-correspondences | ShimuraCompactifications C4–C5 and its Part II C13–C14. Deep Siegel models are already planned there, including models that need not be smooth. The totally real genus-two geometry has no registered supplier and is G-models. |
| Integral Weyl and dual-Weyl representations | LanglandsParameterStacks LP3 already plans the integral theory. Tau Ceti’s current rational Young-symmetrizer construction does not replace it. |
| Spherical spin polynomial and residual non-Eisenstein predicate | Current upstream IntegralHeckeAndGaloisDeterminants §3a–3b, linked through IHG.3, already owns these and their residual twist/dual transport. IC.4 identifies the actual geometric generators and normalizations. |
| Archimedean coherent realization | AutomorphicFormsOnReductiveGroups AF.4, including `bhr-coherent-cohomology` and `harris-limits-gsp2g`. Its full compact-group component extension is still an obligation; this roadmap does not redo local representation theory. |
| Relative cochains, spectral decomposition and analytic regularization | AF.1a and AutomorphicSpectralTheory AS.4–AS.5. IC.6 assembles the geometric comparisons and keeps their image spaces distinct. |
| GAGA, Satake, residual recognition and global packets | ComplexComparisonPartII C2–C3; SmoothRepresentations SR.0–SR.4; ArithmeticGaloisRepresentations R01.1/R01.5; AutomorphicGaloisRepresentations R19.1–R19.3; ModularityAndLanglandsExtensions ML.0/ML.4. Their exact interfaces are listed after the targets. |

The reviewed coverage audit for B0–B5, SF.2 and P7 was read. Parent bundles and section operators do not supply higher coherent perfect models. Generic cohomology and K-projectivity already exist and are imported as follows.

- `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`: Underlying abelian-sheaf cohomology for a sheaf of O_X-modules, with no properness or finite-dimensionality assertion.
- `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`: Additive coefficient-sheaf functor to AddCommGrpCat in every degree.
- `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`: Canonical additive equivalence H⁰(X,M)≃Γ(M,⊤).
- `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv_naturality` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`: Naturality of H⁰/global sections for a sheaf-of-modules morphism.
- `mathlib:CochainComplex.isKProjective_of_projective` in `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean`: Bounded-above complexes of projective objects are K-projective.
- `mathlib:CochainComplex.IsKProjective.Qh_map_bijective` in `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean`: For a K-projective source the homotopy-to-derived map on morphisms is bijective.

## Conventions and hypotheses

O is a complete discrete valuation ring, ϖ a fixed uniformizer, E its fraction field, k its residue field of characteristic p, and Aₙ=O/ϖⁿ for n≥1. Coherent homology uses O-linear Matlis duality into E/O. On an Aₙ-module, the identification Aₙ≃(E/O)[ϖⁿ] sends x to x/ϖⁿ modulo O; use this when comparing an Aₙ-linear dual complex with Matlis homology. An unqualified Pontryagin dual into Qₚ/Zₚ is not the same datum over a ramified coefficient ring.

A supplied toroidal model has its chosen polarization, dual degeneration and logarithmic Hodge factors. Smoothness, properness and flatness are imposed in each theorem that uses them; a normalized bad-level model is not declared smooth merely because the generic fibre is smooth. D is the boundary, F_can the canonical extension, and F_sub=F_can⊗I_D the subcanonical extension. At a smooth Cartier boundary I_D=O(−D). H̄ⁱ always denotes the image of Hⁱ_sub→Hⁱ_can. Tensor products and coefficient reductions in a derived statement are derived unless the specified flatness removes higher Tor.

For genus two, ω(a,b)=Sym^(a−b)(E_Hdg)⊗det(E_Hdg)^b, with a≥b; Pilloni’s Ω^(k,r) is ω(k+r,r). The natural W coefficient has central coordinate −a−b. The arithmetic action twists by ν⁻³, giving W_(a,b;3−a−b) and V_(−b,−a;6−a−b); a scalar xI₄ acts by x^(a+b−6). These identify underlying bundles only after the Hecke linearization has been recorded. For a unit shift of the central coordinate, the W/V comparison uses the adelic central correction `sgn(ν(x)) |ν(h)|_f⁻¹`, with x and h the real and finite components; the finite norm must not be suppressed. Frobenius is geometric, so ε(Frob_v)=q_v⁻¹.

For a cohomological correspondence the legs are p₁,p₂:C⇒X and the coefficient arrow is Lp₂*F→p₁!G, where the exclamation mark denotes **upper shriek**. Its adjoint under proper p₁ is Rp₁*Lp₂*F→G. In a general six-operation setting its adjoint instead uses **lower shriek** (p₁)!. Properness of the joint map to X×X alone does not justify using Rp₁* on unrestricted global cohomology. The global action targets below explicitly require proper p₁. Discrete coherent base change has Tor-independence and boundedness hypotheses; it is not inferred from finiteness of the base change. BP26 §2.6.12 itself assumes Tor-independence of X and S′ and flatness of F.

The integral construction first supplies individual Hecke endomorphisms in IC.3 and their normalization and lifts in IC.4. IC.5 proves the hyperspecial integral convolution relations before constructing local perfect factors and residual or complex congruence localization. Agreement on H⁰ or after inverting p alone does not supply those relations.

The Q and totally real boundary arguments have different ranges. Over Q, CG20’s characteristic-zero nerve argument applies at neat prime-to-p level to all weights and all degrees, as stated immediately before Lemma 7.10 (pp. 852–853). Over a general totally real F, BCGP21 proves the degree-zero boundary vanishing used here. Its “reasonable” level means K=K^p∏_(v|p)K_v, with K^p neat and K_v hyperspecial, paramodular, Siegel parahoric, Klingen parahoric or Iwahori (Definition 3.3.3, pp. 204–205). The integral EO relation theorem additionally requires hyperspecial p-level. When passing from the G model to its G₁ quotient, retain p∤#Δ(K^p), or supply the exact direct-factor descent theorem. Freeness on the open model does not prove freeness on the compactified boundary.

Su’s comparison uses a connected Shimura group, a neat level, a smooth toroidal fan and the condition that the maximal Q-split central torus A_G is also maximal R-split in the centre. Its relative pair is (p_o,K_o), formed after the central split factor is removed, with p_o=Lie(P_h)∩m_G. It is not the unrestricted (g,K) pair. The tower coefficient V_o carries the inverse action of the removed central factor. Harris’s separate cusp/subcanonical map is needed to compare cusp and interior cohomology; Su’s canonical-extension theorem does not assert that comparison.

Every final cuspidal sum includes the actual spectral multiplicity space, the fixed central character, level invariants and residual congruence condition. The global classification and full compact-group packet statements are explicit conditional inputs. The proposed six-operation solid enhancement, Hilbert–Siegel geometry and full Harris verification are recorded gaps; none is replaced by a nominal structure in Lean.

## Layers and build order

| Layer | Targets | Planets | Entry and output |
| --- | ---: | ---: | --- |
| [IC.1: Integral coefficients and coherent duality](#ic1) | 6 | 5 | Start with the parent’s coefficient and compactification constructions. Extend the graded de Rham Levi torsor and its integral dual-Weyl coefficients. Fix all Siegel weight and multiplier conventions. Form canonical/subcanonical derived cohomology and Matlis-dual coherent homology; establish the finite-coefficient Serre pairing without identifying the whole dualizing cohomology complex with its trace target. |
| [IC.2: Equivariant coherent perfect complexes](#ic2) | 5 | 4 | For finite étale abelian p-group covers, use an equivariant affine Čech complex, étale projectivity and nilpotent lifting to construct finite perfect group-ring models. Distinguish infinite free Čech terms from finite perfect replacements. Prove derived coefficient compatibility, deck descent and the correctly indexed homological Hochschild–Serre edge sequence. |
| [IC.3: Cohomological correspondences and filtrations](#ic3) | 13 | 6 | Construct coefficient correspondences p₂*F→p₁!G and their proper derived global actions, composition, coefficient tensor/coinvariants, Tor-independent base change, coefficient twists and transpose. Establish rational isogeny transport. Treat BP26’s completed-locale/compact-support spectral sequence separately from the ordinary local-cohomology Kempf resolution used in IC.5. Retain the missing solid/discrete enhancement explicitly. |
| [IC.4: Hecke lifts, normalization and comparison](#ic4) | 5 | 3 | Lift individual geometric derived endomorphisms to homotopy classes on finite projective models. Fix the ν⁻³ arithmetic action, integral divisibility criterion, rational p-level operators and the geometric-generator/spin-polynomial dictionary. Import the current IHG.3 spin-polynomial API. Prove proper GAGA and characteristic-zero tower compatibility. |
| [IC.5: Integral vanishing, Hecke relations and localization](#ic5) | 16 | 6 | Verify Lan’s formal-canonical criterion and toroidal-to-minimal relative vanishing on the actual models. Specialize Lan–Suh’s corrected integral BGG/small-weight theorem to the three explicit GSp₄ ranges, then derive dual singular-weight vanishing and large-twist section reduction. Compute subcanonical cohomology by ordinary EO Cousin resolutions and detect integral prime-to-p Hecke relations on the interior at hyperspecial p-level. After these relations supply the commuting action, split finite Hecke local factors and transport residual non-Eisenstein systems; define complex congruence localization through the integral Hecke image. Retain quotient, model and boundary-regularity obligations. |
| [IC.6: Coherent cohomology and automorphic forms](#ic6) | 9 | 5 | Define the interior image and its tower. Compare canonical cohomology with automorphic forms using the logarithmic growth resolution, regularization and Su’s theorem. Keep Harris’s separate cusp/subcanonical map, cusp/L²/tempered image subspaces and actual spectral multiplicity spaces. Compare W and V coefficient conventions, holomorphic cusp forms in degree zero and product relative cohomology. |
| [IC.7: Siegel chambers and singular weights](#ic7) | 7 | 5 | Use closed coherent chambers with their wall overlaps, the ρ shift and spin-transfer infinitesimal characters. Import the archimedean coherent realization from AF.4, and derive tempered-image degree restrictions and large singular-weight interior descriptions. State the holomorphic–generic packet pairing conditionally on the exact global classification, purity, local packet and multiplicity inputs. |
| [IC.8: Boundary localization and cuspidal decomposition](#ic8) | 9 | 5 | Specialize the Q boundary nerve calculation and prove all-degree non-Eisenstein boundary vanishing there. Separately compute totally real degree-zero boundary vanishing through coefficient pushforward and normalized Satake factorization. Deduce localized subcanonical/interior comparisons only in justified degrees. Obtain multiplicity-counted cuspidal injections and large-gap equalities; under conditional packet pairing, prove dim H¹=l₀ dim H⁰. |

Within a layer the order below follows prerequisites. Cross-layer references within this roadmap point to earlier layers; the integral Hecke localization constructions now follow the relation theorem within IC.5. A requested supplier stage is an imported obligation, not a second plan for its mathematics. Each definition or construction includes three checks selected to distinguish an incorrect definition; theorem checks record a boundary, normalization or comparison that its proof must preserve.

<a id="ic1"></a>
## IC.1. Integral coefficients and coherent duality

Start with the parent’s coefficient and compactification constructions. Extend the graded de Rham Levi torsor and its integral dual-Weyl coefficients. Fix all Siegel weight and multiplier conventions. Form canonical/subcanonical derived cohomology and Matlis-dual coherent homology; establish the finite-coefficient Serre pairing without identifying the whole dualizing cohomology complex with its trace target.

<a id="integral-graded-frame-torsor"></a>
### The integral de Rham Levi torsor

`AutomorphicBundlesPartII:integral-graded-frame-torsor` — definition.

On a supplied toroidal Siegel model over O with finite locally free logarithmic Hodge factors and its polarized degenerating abelian family and logarithmic Hodge sequence, let M_dR be the torsor of triples (ψ₁,ψ₂,c), with ψ₁:O^g≃Lie(A), ψ₂:O^g≃ω_(Aᵗ), c a unit, and ψ₂=c(ψ₁ᵗ)⁻¹ after the polarization identifies the Hodge factors. It is a right torsor under the Siegel Levi M≃GL_g×G_m. The family, its dual and polarization are the extensions supplied by the compactification model; arbitrary semi-abelian schemes are not asserted to admit this datum.

**Build.** 1. Use the extended logarithmic Hodge sequence and polarization from C4–C5 and the deep-level models from C13. 2. Trivialize Lie(A) locally and construct ψ₂ from ψ₁ and c; verify the Levi change-of-frame law. 3. Identify the generic fibre with the parent principal bundle reduced to its Hodge Levi.

**Inputs.** `AutomorphicBundles:B1/principal-hecke-pullback`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `ShimuraCompactificationsPartII:C13`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.3.1, p. 46.

**API outline.**

- `integral-graded-frame-torsor.frame_action` (structure): Specify the right GL_g×G_m action, including the multiplier on ψ₂.
- `integral-graded-frame-torsor.local_trivial` (characterisation): A local basis of Lie(A) gives an M-equivariant trivialization of the torsor.
- `integral-graded-frame-torsor.generic_comparison` (compatibility): After inverting p, the associated bundles agree with B1–B3 through the Hodge filtration.

- `integral-graded-frame-torsor.action_laws` (functoriality): The frame action preserves ψ₂=c(ψ₁ᵗ)⁻¹ and obeys identity and multiplication laws.
- `integral-graded-frame-torsor.base_change` (compatibility): Pulling back the model and polarization pulls back this torsor with its action and frame trivializations.

**Definition checks.**

1. **computation.** For g=1, scaling the Lie frame by u scales the dual frame by c/u.
2. **degenerate.** A rank-zero graded Hodge bundle leaves exactly the multiplier G_m torsor.
3. **non-example.** Changing ψ₂ independently of ψ₁ and c does not define a point of M_dR.

**Uses.** BP26 §4.3.1: Supplies integral automorphic coefficients for all weights.; IC.3 coefficient correspondences: A polarized quasi-isogeny acts on these frames after inverting p.

**Check.** Compare both Hodge factors, including the multiplier, on an ordinary split chart.

**Atlas planet:** De Rham Levi torsor.

<a id="integral-automorphic-coefficients"></a>
### Integral dual-Weyl automorphic coefficients

`AutomorphicBundlesPartII:integral-automorphic-coefficients` — construction.

For a dominant Levi weight κ and an integral dual-Weyl module V_κ imported from LP3, define ω^κ=M_dR×^M V_κ using B0’s associated-bundle functor. With right B-equivariance f(mb)=(w₀,Mκ)(b⁻¹)f(m), left translation is (m′f)(m)=f(m′⁻¹m). Thus ω^κ is π_*O_(M_dR)[−w₀,Mκ], with this action. Use its canonical and boundary-ideal subcanonical extensions on the supplied integral model; do not replace an integral dual-Weyl module by its characteristic-zero semisimplification.

**Build.** 1. Import the integral induced representation and its base-change API from LP3. 2. Apply B0’s associated-bundle functor to M_dR and compare local equivariant functions. 3. Identify extensions through their toroidal charts and boundary ideal; preserve the left action order.

**Inputs.** [The integral de Rham Levi torsor](#integral-graded-frame-torsor), `AutomorphicBundles:B0`, `AutomorphicBundles:B3`, `LanglandsParameterStacks:LP3`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.3.1 and Remark 4.3.2, pp. 46–47.

**API outline.**

- `integral-automorphic-coefficients.trivialization` (equivalence): In a frame, ω^κ identifies with O⊗V_κ with the stated transition law.
- `integral-automorphic-coefficients.base_change` (compatibility): Allowed coefficient base change commutes with the associated bundle and with its integral lattice.
- `integral-automorphic-coefficients.sub_to_can` (constructor): The boundary ideal inclusion gives ω^κ_sub→ω^κ_can, functorially in the coefficient.

- `integral-automorphic-coefficients.coefficient_map` (functoriality): An M-equivariant integral module map induces a bundle map; identities and composites are preserved.
- `integral-automorphic-coefficients.tensor_transport` (compatibility): Use B0’s tensor/dual comparisons with the integral representation maps and boundary twists; do not identify a dual-Weyl dual with the same weight in positive characteristic.

**Definition checks.**

1. **computation.** Weight zero gives O and its subcanonical counterpart I_D.
2. **compatibility.** In characteristic zero the construction agrees with B3’s automorphic extension.
3. **non-example.** The formula f(m⁻¹m′) for left translation fails the required action law in a noncommutative Levi.

**Uses.** CG20 §5.3: Provides W_μ for the Lan–Suh weight calculation.; BP26 §4.3: Supplies coefficient lattices before rational Hecke normalization.

**Check.** The left translation is a representation and commutes with the right B law.

**Atlas planet:** Integral automorphic sheaves.

<a id="siegel-weight-dictionary"></a>
### The Siegel weight dictionary

`AutomorphicBundlesPartII:siegel-weight-dictionary` — comparison.

For g=2 and integers a≥b, set ω(a,b)=Sym^(a−b)(E)⊗det(E)^b, E the rank-two Hodge bundle. Pilloni’s Ω^(k,r) is ω(k+r,r). In CG20’s Levi coordinates the natural coefficient is W_(a,b;−a−b); changing the central coordinate preserves the underlying bundle and changes its Hecke linearization. In BP26’s coordinates Lie(A) has weight ((0,…,−1);1) and ω_A weight ((1,0,…);−1). The dictionary must identify the actual multiplier characters rather than identify differently named central coordinates by notation.

**Build.** 1. Evaluate the standard, dual and determinant representations on the diagonal Levi. 2. Use the logarithmic sequence 0→W_(1,0;0)→H¹_dR→W_(0,−1;1)→0 and O(1)=W_(0,0;1). 3. Compare on a frame; record the change of central linearization separately from the underlying sheaf isomorphism.

**Inputs.** [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), `AutomorphicBundles:B4`, `AutomorphicBundles:B2/coefficient-tensor-hecke`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, pp. 823, 826–827; compare BP26 Remark 4.3.3, p. 47 and P20 §5.3, p. 24.

**Check.** Check (a,b)=(1,0),(1,1),(0,0) and Ω^(0,2)=det(E)²; the Lie and Hodge weights are dual with the multiplier specified.

<a id="coherent-cohomology-complexes"></a>
### Integral coherent cohomology complexes

`AutomorphicBundlesPartII:coherent-cohomology-complexes` — construction.

For a proper toroidal O-model X and finite locally free F, let C_can(F)=RΓ(X,F_can) and C_sub(F)=RΓ(X,F_sub) in D(O); their reductions are derived coefficient tensors. Retain the canonical arrow C_sub→C_can. Under proper flat finite-presentation and perfect-coefficient hypotheses these objects are perfect over O. They are not automatically perfect over a deck-group ring.

**Build.** 1. Use native derived sheaf cohomology and the boundary ideal inclusion. 2. Apply proper perfect pushforward with all its flatness and support hypotheses. 3. Identify cohomology with Tau Ceti’s underlying abelian-sheaf cohomology, retaining the coefficient module structure as a requested comparison.

**Inputs.** [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`, `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §1.1, p. 2; CG18 §7.2, pp. 395–398.

**API outline.**

- `coherent-cohomology-complexes.cohomology` (compatibility): H^i(C_*(F)) is H^i(X,F_*); forgetting scalars agrees with Scheme.Modules.Cohomology.
- `coherent-cohomology-complexes.reduction` (compatibility): Derived base change to A_n gives RΓ(X_(A_n),F_*(A_n)) under the proper perfect base-change hypotheses.
- `coherent-cohomology-complexes.boundary_arrow` (functoriality): Coefficient morphisms commute with C_sub→C_can.

- `coherent-cohomology-complexes.coefficient_functor` (functoriality): RΓ sends identity and composite coefficient maps to identity and composites, additively and O-linearly.
- `coherent-cohomology-complexes.triangle` (compatibility): The boundary ideal sequence gives the full derived triangle and long exact cohomology sequence, naturally for coefficient maps.

**Definition checks.**

1. **degenerate.** For empty D, the boundary arrow is the identity.
2. **computation.** On Spec O with F=O and empty D, both complexes are O in degree zero.
3. **non-example.** Reduction of H^i need not equal H^i of the reduced complex when H^(i+1) has torsion.

**Uses.** CG18 §7.2: Input to finite-level equivariant perfect models.; BP26 §1.1: Classical complexes underlying the higher Hida comparison.

**Check.** Distinguish perfectness over O from the stronger equivariant claim of IC.2.

**Atlas planet:** Coherent cohomology complexes.

<a id="coherent-homology"></a>
### Coherent homology over a DVR

`AutomorphicBundlesPartII:coherent-homology` — definition.

Let O be a complete DVR with uniformizer ϖ, fraction field E, residue characteristic p, A_n=O/ϖ^n with n≥1, and Y/O smooth proper of pure relative dimension d. For finite locally free F define H_i(Y,F⊗A_n)=Hom_O(H^i(Y,F^∨⊗ω_(Y/O)⊗A_n),E/O). Deck transformations act contragrediently. The coefficient dual is Matlis dual over O; identifying it with Z_p-Pontryagin dual requires a chosen character and the inverse different.

**Build.** 1. Form the coherent dual coefficient F^∨⊗ω and take its cohomology. 2. Apply Hom_O(−,E/O), using injectivity over a DVR and inverse deck action. 3. Construct comparison maps under finite étale pullback by dualizing trace.

**Inputs.** `DeformationAndDerivedPatchingAlgebra:P7/elementary-coefficient-dual`, `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`, [Integral coherent cohomology complexes](#coherent-cohomology-complexes).

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, pp. 395–396; CG20 §7.2, p. 851.

**API outline.**

- `coherent-homology.coefficient_dual` (characterisation): Specify evaluation into E/O and its functorial O-linear duality.
- `coherent-homology.deck_inverse` (simp): On a functional λ, δ acts by λ∘δ⁻¹.
- `coherent-homology.finite_coefficients` (equivalence): A_n≃Hom_O(A_n,E/O) through a↦(b↦ab/ϖ^n mod O), with the chosen uniformizer.

- `coherent-homology.coefficient_functor` (functoriality): A map F→G induces H_i(F)→H_i(G) by dualizing the contravariant dual-coefficient map; identity and composition are preserved.
- `coherent-homology.pairing_equivariance` (compatibility): Evaluation satisfies ⟨δλ,δx⟩=⟨λ,x⟩ and is O-balanced; finite étale pullback and trace are adjoint under it.

**Definition checks.**

1. **computation.** For Y=Spec O and F=O, H_0(Y,A_n)≃A_n.
2. **degenerate.** H_i is zero when the defining coherent cohomology group is zero.
3. **non-example.** For p odd, O=Z_p[ϖ] with ϖ²=p has different (2ϖ). The trace character identifies the Z_p-dual lattice with (2ϖ)⁻¹O, whereas the definition evaluates in E/O. A claimed canonical identification using O itself and no inverse different fails this ramified example.

**Uses.** CG18 §7.2: The chain complex C_n computes this covariant homology.; CG20 Theorem 7.11 proof: L=ω(1,3−a) is dual to the weight-(a,2) cusp coefficient.

**Check.** The action convention must turn pullback on the dual coefficient into covariant homology.

**Atlas planet:** Coherent homology.

<a id="finite-coefficient-serre-duality"></a>
### Finite-coefficient Serre duality

`AutomorphicBundlesPartII:finite-coefficient-serre-duality` — theorem.

Under the preceding smooth proper relative-dimension-d assumptions, duality over A_n identifies H_i(Y,F⊗A_n) with H^(d−i)(Y_(A_n),F⊗A_n), using the self-duality A_n→Hom_O(A_n,E/O). The perfect derived pairing is RΓ(F)⊗^L RΓ(F^∨⊗ω)[d]→A_n. Its trace is a morphism; it is not an isomorphism RΓ(ω)[d]≃A_n. Deck and coefficient maps are adjoint with the inverse-action convention.

**Build.** 1. Use the smooth dualizing identification f!A_n=ω[d] and proper coherent duality. 2. Apply the chosen self-duality of the Artinian Gorenstein coefficient ring and exact Matlis duality. 3. Check the evaluation trace on Čech representatives and the inverse deck action.

**Inputs.** [Coherent homology over a DVR](#coherent-homology), `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`, `SchemeAndStackFoundations:SF.2/smooth-proper`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`.

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, pp. 395–396, 399–400.

**Check.** For a smooth proper curve with nonzero H¹(O), RΓ(ω)[1] has an additional cohomology group, disproving the overly strong trace-isomorphism formulation.

**Atlas planet:** Coherent Serre duality.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- AutomorphicBundles:B0: Import the associated-bundle functor, tensor/dual/base-change and local-frame API. Generic Scheme.Modules vector bundle operations are already owned by current upstream AlgebraicVectorBundles L0A–L0C; this is an import, not new work here.
- AutomorphicBundles:B3: Integral canonical/subcanonical coefficient extensions on the supplied PEL charts, and their generic comparison with the existing characteristic-zero extension; no second generic extension construction is planned here.
- AutomorphicBundles:B4: Highest-weight, determinant and logarithmic canonical-bundle identifications with the exact GSp₄ central coordinates used by CG20 and BP26.
- SchemeAndStackFoundations:SF.2: Coefficient-linear/derived cohomology comparison with the existing abelian-sheaf H^i, including scalar action and naturality of degree-zero sections; existing smooth-proper duality is imported by its fine node.
- ShimuraCompactifications:C4: Logarithmic Hodge sequence, polarization/dual semi-abelian extension and formal boundary charts on the smooth toroidal integral model.
- ShimuraCompactifications:C5: Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models.
- ShimuraCompactificationsPartII:C13: Use the existing all-genus deep Siegel toroidal model target and its polarized logarithmic Hodge data; do not construct these integral models in this roadmap.
- LanglandsParameterStacks:LP3: Integral Weyl/dual-Weyl modules, the right-B-equivariant function realization with left translation, and allowed base change. The current Tau Ceti Young-symmetrizer construction over Q-algebras does not supply integral dual-Weyl lattices.

<a id="ic2"></a>
## IC.2. Equivariant coherent perfect complexes

For finite étale abelian p-group covers, use an equivariant affine Čech complex, étale projectivity and nilpotent lifting to construct finite perfect group-ring models. Distinguish infinite free Čech terms from finite perfect replacements. Prove derived coefficient compatibility, deck descent and the correctly indexed homological Hochschild–Serre edge sequence.

<a id="equivariant-cech"></a>
### The equivariant Čech model

`AutomorphicBundlesPartII:equivariant-cech` — construction.

Let f:Y→X be a finite étale Galois cover of smooth proper O-schemes with finite abelian p-group Δ, and let F be finite locally free on X. Choose a finite affine cover of separated X; its inverse-image cover gives a bounded alternating Čech complex for f*F⊗A_n with its actual Δ action, computing RΓ(Y,f*F⊗A_n). Its terms may have infinite rank over A_n[Δ]. Refinements give the same derived object.

**Build.** 1. Pull back the affine cover; finite étale maps and finite intersections preserve affineness. 2. Apply affine quasi-coherent acyclicity and Čech comparison. 3. Write each coefficient term as N⊗_A B and preserve all deck operators in the differentials.

**Inputs.** [Integral coherent cohomology complexes](#coherent-cohomology-complexes), `SchemeAndStackFoundations:SF.2/cech-to-cohomology`.

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, pp. 397–398.

**API outline.**

- `equivariant-cech.cover_model` (constructor): Build the complex with alternating restrictions and the natural deck action.
- `equivariant-cech.cohomology` (equivalence): Identify its cohomology with coherent cohomology naturally in F and n.
- `equivariant-cech.refinement` (functoriality): Cover refinement induces the canonical derived isomorphism compatible with Δ and coefficient reduction.

- `equivariant-cech.coefficient_maps` (functoriality): A coefficient map induces the termwise Δ-equivariant cochain map, preserving identity and composition.
- `equivariant-cech.coefficient_reduction` (compatibility): Derived A_n→A_m reduction, m≤n, agrees with the corresponding geometric derived coefficient comparison and commutes with cover refinement.

**Definition checks.**

1. **computation.** For a trivial Δ-torsor over an affine X with the single-open cover, the degree-zero term is (Γ(X,F)⊗_O A_n)⊗_(A_n) A_n[Δ], with the regular deck action; no integral O[Δ] coefficient remains.
2. **degenerate.** For Δ=1 this is the ordinary affine Čech construction.
3. **non-example.** Replacing the group-ring terms by their Δ-invariants loses the upstairs cohomology object.

**Uses.** CG18 Lemma 7.7: Gives the concrete modules whose projectivity must be established.; IC.2 perfect models: Provides bounded flat amplitude over A_n[Δ].

**Check.** The model is equivariant before passing to cohomology, and no finite-generation claim is made for its terms.

**Atlas planet:** Equivariant Čech complex.

<a id="galois-projectivity"></a>
### Étale Galois projectivity

`AutomorphicBundlesPartII:galois-projectivity` — theorem.

For a finite étale Galois cover f:Y→X with finite group Δ, f_*O_Y is locally projective as an O_X[Δ]-module. If X is flat over A, it is A[Δ]-flat. For a Δ-pulled-back finite locally free coefficient the same flatness holds. For an affine torsor in characteristic p with Δ a p-group, its coefficient module is free over k[Δ], possibly of infinite rank; local projectivity does not in general give a global integral normal basis over O_X[Δ].

**Build.** 1. After an étale trivialization of the torsor, the regular representation gives a free O_X[Δ]-module. 2. Descend finite projectivity and use flatness of the base algebra over A. 3. For the affine characteristic-p assertion use Nakajima’s theorem and the local Artinian structure of k[Δ], not averaging by |Δ|.

**Inputs.** [The equivariant Čech model](#equivariant-cech), `SchemeAndStackFoundations:SF.1`, `SmoothRepresentationsOfLocalGroups:SR.1`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 2.6.11, p. 22; CG18 proof of Lemma 7.7, p. 398.

**Check.** Test a trivial torsor with p dividing |Δ|; the result must survive without dividing by |Δ|.

**Atlas planet:** Galois cover projectivity.

<a id="integral-cech-freeness"></a>
### Integral Čech freeness

`AutomorphicBundlesPartII:integral-cech-freeness` — theorem.

In the CG18 setting, on affine X=Spec A with inverse image Spec B and finite projective A-module N, the module (N⊗_A B)/ϖ^n is free over A_n[Δ] for each n≥1. This allows infinite rank. O-flatness of N⊗_A B, characteristic-p Galois projectivity and the nilpotent coefficient-lifting criterion are essential.

**Build.** 1. Use O-torsion-freeness to identify successive ϖ-adic quotients. 2. Apply the characteristic-p affine projectivity theorem to reduction modulo ϖ. 3. Lift a free k[Δ]-basis through the nilpotent ideal (ϖ), using CG18 Lemmas 7.5–7.6; the needed general module-lifting interface is requested of P7.

**Inputs.** [Étale Galois projectivity](#galois-projectivity), `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Lemmas 7.5–7.7, pp. 397–398.

**Check.** A proof relying on finite rank of the affine section module fails the intended input.

<a id="equivariant-perfect-model"></a>
### Perfect models for coherent cohomology and homology

`AutomorphicBundlesPartII:equivariant-perfect-model` — construction.

For the cover and coefficient of equivariant-cech, there is a bounded finite projective A_n[Δ]-complex representing RΓ(Y,f*F⊗A_n). Apply this to f*F^∨⊗ω_(Y/O) to obtain C_n^∨. Its A_n-linear derived dual, with inverse Δ action, gives C_n with H_i(C_n)=H_i(Y,f*F⊗A_n), after the Serre-dual coefficient is used on the cochain side. Choose the convention C_n^∨ represents RΓ(F^∨⊗ω), so C_n is its coefficient-dual chain model. Group-ring coefficient reduction means A_m[Δ]⊗^L_(A_n[Δ])C_n^∨, equivalently derived reduction of its termwise A_n-free model. Models and Hecke lifts are canonical only in the derived category or up to homotopy.

**Build.** 1. Bounded free Čech terms give finite Tor amplitude over the Noetherian ring A_n[Δ]. 2. Properness gives finite cohomology over A_n and hence A_n[Δ]; apply the Noetherian perfectness criterion. 3. Take the imported finite-projective dual model and use evaluation to identify its chain homology.

**Inputs.** [Integral Čech freeness](#integral-cech-freeness), [Finite-coefficient Serre duality](#finite-coefficient-serre-duality), `DeformationAndDerivedPatchingAlgebra:P7/p7ii-noetherian-perfect-criterion`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual-model`.

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, p. 398 and pp. 399–400.

**API outline.**

- `equivariant-perfect-model.derived_iso` (equivalence): C_n^∨ identifies with the specified coherent dual-coefficient complex.
- `equivariant-perfect-model.chain_homology` (compatibility): C_n computes the coherent homology defined in IC.1, with inverse deck action.
- `equivariant-perfect-model.model_change` (equivalence): Two finite projective models carry a homotopy equivalence inducing the same derived identification.

- `equivariant-perfect-model.transport_morphism` (functoriality): Transport geometric morphisms through the chosen derived identifications, independent up to homotopy of projective representatives.
- `equivariant-perfect-model.coefficient_descent` (compatibility): The model comparisons commute with derived deck coinvariants and coefficient reduction as proved by coefficient-descent.

**Definition checks.**

1. **computation.** For the trivial torsor over Spec O, the model is A_n[Δ] in degree zero.
2. **degenerate.** For Δ=1 the conclusion reduces to proper perfect coherent pushforward.
3. **non-example.** A bounded complex of infinitely generated free Čech terms is not itself a finite perfect representative.

**Uses.** CG18 §7.2: Models on which coherent Hecke endomorphisms admit chain lifts.; CG20 §7.2: Feeds finite-level complexes into the separate patching-algebra roadmap.

**Check.** Both representations must specify the dual coefficient; one cannot call a complex and its unshifted dual models of the same coefficient.

**Atlas planet:** Coherent perfect complexes.

<a id="coefficient-descent"></a>
### Derived coefficient change and deck descent

`AutomorphicBundlesPartII:coefficient-descent` — theorem.

The equivariant models have derived coefficient compatibility A_m⊗^L_(A_n)C_n^∨≃C_m^∨ for 1≤m≤n, and homological deck descent C_n⊗^L_(A_n[Δ])A_n≃C_n(X,F). Thus Tor_i^(A_n[Δ])(H_j(C_n),A_n)⇒H_(i+j)(X,F⊗A_n). In degree zero H_0(Y,F)_Δ≃H_0(X,F); the five-term edge sequence includes Tor₂(H_0(Y,F),A_n)→H_1(Y,F)_Δ→H_1(X,F)→Tor₁(H_0(Y,F),A_n)→0. No injectivity of the second arrow is asserted without extra Tor vanishing.

**Build.** 1. Use the affine torsor descent equivalence and the termwise free group-ring Čech model. 2. Apply derived tensor and its hyper-Tor spectral sequence with homological indexing. 3. Read the low-degree filtration before imposing any concentration or projectivity of homology groups.

**Inputs.** [Perfect models for coherent cohomology and homology](#equivariant-perfect-model), [Étale Galois projectivity](#galois-projectivity), `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §7.2, proof of Theorem 7.11, p. 853; CG18 §7.2, pp. 398–400.

**Check.** An upstairs nonprojective H_0 can contribute a nonzero Tor₂ edge; test this before shortening the sequence.

**Atlas planet:** Coherent Hochschild–Serre sequence.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- SchemeAndStackFoundations:SF.1: Finite étale torsor descent, affine quasi-coherent module descent and projectivity/flatness descent; apply Nakajima’s affine coefficient projectivity without dividing by the group order.
- SmoothRepresentationsOfLocalGroups:SR.1: Integral Hecke convolution and opposite-algebra conventions; apply to the actual geometric coherent correspondence operators.
- DeformationAndDerivedPatchingAlgebra:P7: General nilpotent lifting criterion used by CG18 Lemmas 7.5–7.6, including infinite free rank, and the hyper-Tor/derived tensor spectral sequence with its five-term edge maps. Generic perfect objects, duals and retracts are already imported through finer nodes.

<a id="ic3"></a>
## IC.3. Cohomological correspondences and filtrations

Construct coefficient correspondences p₂*F→p₁!G and their proper derived global actions, composition, coefficient tensor/coinvariants, Tor-independent base change, coefficient twists and transpose. Establish rational isogeny transport. Treat BP26’s completed-locale/compact-support spectral sequence separately from the ordinary local-cohomology Kempf resolution used in IC.5. Retain the missing solid/discrete enhancement explicitly.

<a id="coherent-correspondence"></a>
### Cohomological correspondences

`AutomorphicBundlesPartII:coherent-correspondence` — definition.

For separated finite-type S-schemes C,X with (p₁,p₂):C→X×_S X proper, and coefficient complexes F,G on X, a cohomological correspondence is a morphism T:Lp₂*F→p₁!G in the coherent/discrete derived category when the indicated operations and boundedness exist. When p₁ is proper its adjoint is Rp₁*Lp₂*F→G; in the solid six-operation setting the general adjoint uses lower shriek (p₁)!, not unrestricted Rp₁*. The solid version uses the stable solid O-module category and its upper shriek; this enhancement is an explicit missing supplier, not an alternative definition of ordinary coherent cohomology.

**Build.** 1. Use the imported coherent pullback/upper-shriek adjunction in its permitted derived categories. 2. Specify the coefficient morphism and the proper support of the geometric correspondence. 3. Compare the discrete embedding with the solid envelope only after the missing six-operation comparison is supplied.

**Inputs.** `SchemeAndStackFoundations:key/coherent-duality`, `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.1.7, Definition 2.1.8, p. 7; §2.2.9, p. 14; §2.3.12, p. 17; P20 Definition 4.3.1, p. 19.

**API outline.**

- `coherent-correspondence.adjoint` (equivalence): For proper p₁ identify T with Rp₁*Lp₂*F→G by coherent duality.
- `coherent-correspondence.identity` (constructor): The diagonal correspondence and identity coefficient morphism give the identity correspondence.
- `coherent-correspondence.coefficient_map` (functoriality): Precomposition in F and postcomposition in G act functorially on correspondences.

- `coherent-correspondence.ext` (extensionality): On fixed legs two correspondences agree exactly when their coefficient arrows Lp₂*F→p₁!G agree.
- `coherent-correspondence.linear` (structure): For fixed legs the coefficient arrows form an O-module; coefficient pre/postcomposition is O-linear.

**Definition checks.**

1. **degenerate.** For p₁=p₂=id the correspondence is exactly a morphism F→G.
2. **compatibility.** For finite étale p₁ the standard trace turns a coefficient isomorphism into the B5 degree-zero pull–trace map.
3. **non-example.** Reversing p₁ and p₂ without dualizing coefficients does not define the same adjoint morphism.

**Uses.** P20 §4.3 and BCGP21 §3.9: Uniform language for higher-degree coherent Hecke operators.; BP26 Proposition 2.9.9: Filters cohomology by correspondence-stable support.

**Check.** Check the direction p₂*→p₁! and the precise domain of the adjunction.

**Atlas planet:** Cohomological correspondences.

<a id="correspondence-action"></a>
### The map on derived global sections

`AutomorphicBundlesPartII:correspondence-action` — construction.

If p₁ is proper and T:Lp₂*F→p₁!G, define RΓ(T) as RΓ(X,F)→RΓ(C,Lp₂*F)→RΓ(C,p₁!G)→RΓ(X,G), using the pullback unit, T and the proper trace counit. It induces all degree-i maps. Proper support alone is insufficient for this unqualified global formula unless an appropriate supported pushforward is used.

**Build.** 1. Form the unit for p₂ and the adjoint of T under proper p₁ duality. 2. Apply derived global sections and the trace counit. 3. Compare degree zero with the existing section operator when p₁ is finite locally free.

**Inputs.** [Cohomological correspondences](#coherent-correspondence), `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Definition 4.3.1 and Remark 4.3.2, p. 19; BP26 §§2.2.9, 2.3.12, pp. 14, 17.

**API outline.**

- `correspondence-action.on_cohomology` (projection): Extract H^i(T) from the single derived operator.
- `correspondence-action.identity_action` (simp): The identity correspondence acts by the identity on RΓ.
- `correspondence-action.degree_zero` (compatibility): For the B5 finite-flat correspondence and its trace, H⁰(T) is B5/hecke-section-operator.

- `correspondence-action.linear` (compatibility): The global-action map for fixed legs preserves zero, addition and O-scaling of coefficient arrows.
- `correspondence-action.composition` (functoriality): With the properness and base-change assumptions of correspondence-composition, convolution acts by composition of the two derived global maps.

**Definition checks.**

1. **computation.** For a finite étale degree-r map f and trivial coefficient, f_*f* acts by r on H⁰(O).
2. **degenerate.** The zero coefficient correspondence acts by zero in all degrees.
3. **compatibility.** A morphism of coefficient short exact sequences gives a commuting long exact cohomology diagram.

**Uses.** CG18 §7.2: A derived endomorphism to lift to C_n^∨.; BCGP21 §3.9.3: Constructs [K^pgK^p] in every degree.

**Check.** Every degree is induced by one derived morphism, so coefficient exact sequences are respected.

<a id="correspondence-composition"></a>
### Composition of cohomological correspondences

`AutomorphicBundlesPartII:correspondence-composition` — theorem.

For two correspondences with proper first legs and coefficient morphisms T,S, form their fibre-product composition using proper upper-shriek base change and the projection formula. In a derived enhancement the composite acts on RΓ by RΓ(S)∘RΓ(T). In the discrete coherent category impose the required Tor-independence/perfectness hypotheses. This is a statement about the actual six-operation composition, not arbitrary chosen maps between cones.

**Build.** 1. Use the fibre-product correspondence and the base-change transformation for the middle legs. 2. Compose the coefficient morphisms through the upper-shriek projection formula. 3. Use adjunction coherence to identify global actions; retain the missing solid coherence input as a gap.

**Inputs.** [The map on derived global sections](#correspondence-action), `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`, `SchemeAndStackFoundations:key/coherent-duality`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.2.9 and §2.3.12, pp. 14, 17; P20 §4.3, p. 19.

**Check.** For graphs, recover composition of the associated pullback/trace maps, with the declared leg orientation.

<a id="fundamental-class-correspondence"></a>
### Correspondences from a fundamental class

`AutomorphicBundlesPartII:fundamental-class-correspondence` — construction.

Let C and X be S-schemes of the same pure relative dimension, p₁,p₂:C⇒X, with p₁ projectively embeddable and satisfying the SF.2 fundamental-class hypotheses. Fix the resulting degree-zero class O_C→p₁!O_X. For perfect G (in particular finite locally free G) and a coefficient arrow Lp₂*F→Lp₁*G, tensoring this class with G and using the projection formula defines Lp₂*F→p₁!G. Equal dimensions alone do not supply the class. For finite locally free p₁ its adjoint is the algebra trace. Boundary twists use the reduced-relative-Cartier and inverse-image boundary hypotheses of A0/fundamental-class-boundary; its determinant route additionally retains the normal/smooth dense-open and relative normal-crossings hypotheses of P20 Lemma 4.2.4.1(1).

**Build.** 1. Import the fundamental class and its transitivity/base-change statements from A0. 2. Tensor the class with the coefficient map under the allowed projection formula. 3. Check the boundary ideal map using the exact Cartier hypotheses, before applying RΓ.

**Inputs.** [Cohomological correspondences](#coherent-correspondence), `AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary`, `SchemeAndStackFoundations:SF.2/finite-formula`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §4.3.1, p. 19; BCGP21 Definitions 3.9.1–3.9.2, p. 226.

**API outline.**

- `fundamental-class-correspondence.coefficient_class` (constructor): Compose the sheaf coefficient map with the pulled-back fundamental class.
- `fundamental-class-correspondence.finite_flat` (compatibility): For finite locally free p₁, the adjoint uses the trace from the finite-duality algebra.
- `fundamental-class-correspondence.boundary` (compatibility): Under the A0 boundary hypotheses the same construction sends subcanonical coefficients to subcanonical coefficients.

- `fundamental-class-correspondence.coefficient_naturality` (functoriality): Perfect coefficient maps commute with tensoring the fixed fundamental class; zero and sums of input coefficient arrows are preserved.
- `fundamental-class-correspondence.base_change` (compatibility): The boundary class commutes with open base change, and in the finite-flat case with base changes retaining the Cartier conditions, exactly as in A0.

**Definition checks.**

1. **computation.** For identity maps with identity coefficient morphism the fundamental class is identity.
2. **compatibility.** For a finite étale cover this construction recovers the standard trace.
3. **non-example.** A boundary divisor whose inverse-image supports differ on the two legs is not accepted by the subcanonical construction.

**Uses.** P20 §4.3.1: Produces the integral geometric operators before normalization.; BCGP21 §3.9: Supplies the Hecke coefficient map on toroidal correspondences.

**Check.** Check the existence hypotheses for the degree-zero fundamental class and the perfect-coefficient projection formula separately; the relative dimensions here belong to C/S and X/S.

**Atlas planet:** Coherent fundamental-class correspondence.

<a id="correspondence-tensor"></a>
### Tensor coefficients and deck coinvariants

`AutomorphicBundlesPartII:correspondence-tensor` — construction.

For a correspondence over Spec A with F A-flat, a finitely generated A-module M gives the base-changed operator T⊗^L1 on F⊗^L_A M, by projection formula and upper-shriek comparison. Ordinary tensors agree only under the stated flatness. If a finite abelian group Δ acts equivariantly and F is A[Δ]-flat, derived coinvariants produce a correspondence on F⊗^L_(A[Δ])A, agreeing with ordinary coinvariants in this flat case. No averaging projector is used when |Δ| is not invertible.

**Build.** 1. Apply derived tensor in the coefficient variable and use the upper-shriek projection formula. 2. View coinvariants as derived tensor with A over A[Δ]. 3. Use the group-ring flatness statement to compare ordinary and derived coefficients.

**Inputs.** [Composition of cohomological correspondences](#correspondence-composition), [Étale Galois projectivity](#galois-projectivity), `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-tensor-hom`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.6.1 and §2.6.9, pp. 21–22.

**API outline.**

- `correspondence-tensor.tensor_action` (compatibility): The induced global morphism is RΓ(T)⊗^L1 whenever coherent derived base change applies.
- `correspondence-tensor.coinvariant_action` (constructor): An equivariant T induces T_Δ on derived deck coinvariants.
- `correspondence-tensor.flat_comparison` (equivalence): For A[Δ]-flat F the derived coinvariant coefficient equals its ordinary quotient.

- `correspondence-tensor.associativity` (functoriality): Iterated derived scalar extension agrees with extension along the composite coefficient map, with the same T action.
- `correspondence-tensor.augmentation` (compatibility): The A[Δ]→A augmentation comparison is compatible with coefficient reduction and subgroup descent, using derived coinvariants throughout.

**Definition checks.**

1. **degenerate.** M=A leaves T unchanged.
2. **computation.** For F=A[Δ], coinvariants give A and the identity endomorphism descends to identity.
3. **non-example.** For the trivial F_p[C_p]-module F_p, higher derived coinvariants are nonzero, so ordinary coinvariants cannot replace them.

**Uses.** BP26 Lemma 2.6.11: Enables the flat coefficient case on Galois covers.; IC.2 deck descent: Makes the Hochschild–Serre maps Hecke-equivariant.

**Check.** In residue characteristic p the construction must work for Δ=C_p.

<a id="correspondence-base-change"></a>
### Base change for cohomological correspondences

`AutomorphicBundlesPartII:correspondence-base-change` — theorem.

Under a base change S′→S, coherent upper-shriek base change transports T if the relevant Cartesian squares are Tor-independent and the imported duality hypotheses hold. A flat base change satisfies these conditions. Finiteness of S′→S alone is not sufficient. The derived solid version has its own base-change theorem and must be compared with this coherent statement before applying it to ordinary coefficient reduction.

**Build.** 1. Write both base-change squares, including the one for C and p₁, and impose Tor-independence. 2. Use the coherent base-change transformation for upper shriek and pullback. 3. Identify global operators by proper base change, separately from underived sheaf base change.

**Inputs.** [Cohomological correspondences](#coherent-correspondence), `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.6.12, pp. 22–23.

**Check.** A nonflat finite reduction with nonzero Tor is a rejection test for an unconditional upper-shriek isomorphism.

<a id="correspondence-twist"></a>
### Twisting by an automorphic coefficient

`AutomorphicBundlesPartII:correspondence-twist` — construction.

For finite locally free E on X and a coefficient transport α:p₂*E→p₁*E, tensor a correspondence T:F→G with α to obtain T_E:p₂*(F⊗E)→p₁!(G⊗E). The isomorphism p₁!G⊗p₁*E≃p₁!(G⊗E) is the finite-perfect projection formula. α need not be invertible; invertibility is proved separately for a rational isogeny transport.

**Build.** 1. Use the imported coefficient tensor structure and the projection formula for locally free E. 2. Compose T⊗α with this comparison. 3. Check identity and transitivity using the coefficient cocycle.

**Inputs.** [Cohomological correspondences](#coherent-correspondence), [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), `AutomorphicBundles:B2/coefficient-tensor-hecke`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.6, pp. 21–23 and §4.3.1, p. 47.

**API outline.**

- `correspondence-twist.twist` (constructor): Construct the coefficient morphism T_E.
- `correspondence-twist.unit_twist` (simp): Twisting by O with identity transport returns T.
- `correspondence-twist.tensor_cocycle` (functoriality): Successive twists agree with the tensor product transport.

- `correspondence-twist.coefficient_naturality` (functoriality): A map between coefficient transports commuting with the two legs intertwines the twisted correspondences.
- `correspondence-twist.composition` (compatibility): A transport satisfying the cocycle law for composed correspondences makes twisting commute with convolution.

**Definition checks.**

1. **computation.** A rank-one scalar transport u multiplies the global operator by u.
2. **degenerate.** A zero transport gives a zero twisted operator.
3. **non-example.** An isogeny with p-power degree need not give an integral isomorphism of Hodge lattices.

**Uses.** BP26 p. 47: Transports arbitrary weight sheaves along p-isogenies rationally.; CG20 §5.5: Carries the central-character twist of the Hecke action.

**Check.** The coefficient transport must specify both its direction and integral or rational domain.

<a id="rational-isogeny-transport"></a>
### Rational isogeny transport of weight sheaves

`AutomorphicBundlesPartII:rational-isogeny-transport` — theorem.

A polarized quasi-isogeny along a toroidal Siegel correspondence, with its specified multiplier, induces p₂*ω^κ[1/p]≃p₁*ω^κ[1/p], compatible with composition and the generic parent Hecke pullback. Invertibility comes from the rational logarithmic Hodge isogeny. The integral map and any divisibility bound must be proved independently.

**Build.** 1. Apply the quasi-isogeny to both graded logarithmic Hodge factors and its polarization multiplier. 2. Invert p to obtain the Levi frame torsor isomorphism. 3. Apply the parent associated-coefficient functor and check composition.

**Inputs.** [The integral de Rham Levi torsor](#integral-graded-frame-torsor), [Twisting by an automorphic coefficient](#correspondence-twist), `AutomorphicBundles:B1/principal-hecke-pullback`, `ShimuraCompactificationsPartII:C13`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.3.1, paragraph after Remark 4.3.3, p. 47.

**Check.** For multiplication by p, the rational transport is invertible while its Hodge-lattice map need not be an integral isomorphism.

<a id="transpose-correspondence"></a>
### The transpose correspondence

`AutomorphicBundlesPartII:transpose-correspondence` — theorem.

For smooth X,C over S and finite locally free legs p₁,p₂, coherent duality transposes T:p₂*F→p₁!G into Tᵗ:p₁*D_XG→p₂!D_XF, where D_X=RHom(−,f!O_S), for dualizable coefficients in the stated bounded categories. With X proper, its RΓ action is adjoint to RΓ(T). Swapping the legs also swaps and dualizes the coefficient; a Hecke double coset need not be self-adjoint.

**Build.** 1. Dualize the coefficient morphism and identify the duals of pullback and upper shriek. 2. Use biduality and finite-flat duality to put it in the reversed-leg form. 3. Apply proper global duality to prove the pairing identity; evaluate the inverse double coset and central character separately.

**Inputs.** [The map on derived global sections](#correspondence-action), `SchemeAndStackFoundations:SF.2/sheafified-grothendieck-duality`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-dual`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Proposition 2.7.3, pp. 23–24; CG20 Appendix A.3.2, pp. 886–888.

**Check.** For graphs of an automorphism, the transpose involves its inverse; determinant/cyclotomic twists must be retained.

**Atlas planet:** Transpose correspondence.

<a id="contracted-filtration"></a>
### Contracted support filtrations

`AutomorphicBundlesPartII:contracted-filtration` — definition.

For a correspondence (C,X,p₁,p₂), a closed subset Z is contracted when p₁⁻¹Z⊆p₂⁻¹Z, and expanded when the reverse inclusion holds. These are set-theoretic conditions. A finite increasing closed filtration (Z_l) is contracted when every Z_l is contracted, with strata U_l=Z_l∖Z_(l−1). The resulting maps of support objects are constructed as a coherent filtered diagram in a stable enhancement; no functorial cone in a bare triangulated category is assumed.

**Build.** 1. Read inverse images as subsets, independently of scheme multiplicities. 2. Pass to the complementary inclusion p₂⁻¹U⊆p₁⁻¹U. 3. Separate this set-theoretic definition from the completion/compact-support filtered construction, whose solid enhancement is G-solid.

**Inputs.** [Cohomological correspondences](#coherent-correspondence).

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Definition 2.1.19 and Remark 2.1.20, p. 9; §2.9.8, p. 28.

**API outline.**

- `contracted-filtration.complement` (characterisation): Contraction of Z is equivalent to p₂⁻¹(X∖Z)⊆p₁⁻¹(X∖Z).
- `contracted-filtration.filtration` (constructor): Specify a finite indexed filtration and contraction proofs for every closed term.
- `contracted-filtration.nilpotent_invariance` (compatibility): Changing the closed subscheme structure without changing its support preserves contraction.

- `contracted-filtration.restriction` (compatibility): Intersecting each Z_l with a correspondence-stable open preserves contraction.
- `contracted-filtration.transpose` (relation): Transposing the legs exchanges contracted and expanded filtrations, including the empty and total closed sets.

**Definition checks.**

1. **degenerate.** The empty set and X are contracted.
2. **computation.** For p₁=id and p₂=Frobenius over F_p every closed subset is contracted.
3. **non-example.** On {0,1}, p₁=id, p₂ constant 0 and Z={1} is not contracted; this distinguishes the two orientations.

**Uses.** BP26 Proposition 2.9.9: Produces the Hecke action on a Cousin spectral sequence.; IC.5 EO filtration: The prime-to-p correspondence preserves each EO stratum.

**Check.** Set-theoretic contraction must not be strengthened to scheme-theoretic ideal containment.

**Atlas planet:** Contracted support filtration.

<a id="formal-completion-comparison"></a>
### Derived formal completion of coherent coefficients

`AutomorphicBundlesPartII:formal-completion-comparison` — theorem.

For a qcqs Noetherian model X, a coherent ideal I defining Z, and a pseudo-coherent solid coefficient F in the BP26 setting, the completion locale î:Ẑ→X satisfies î_*î*F≃Rlim_n(F⊗^L_(O_X)O_X/Iⁿ), and RΓ(X,î_*î*F)≃Rlim_n RΓ(X,F⊗^L O_X/Iⁿ). The I=(p) case is the p-adic specialization. The comparison with ordinary discrete coherent formal functions is a separate SF.4/P7 input under properness and coherent boundedness assumptions. Integral correspondence maps and traces extending to the completion must commute with these comparison maps; the solid/discrete identification remains G-solid.

**Build.** 1. Apply BP26 Lemma 2.9.3 to the closed locale and its solid completed algebra; use pseudo-coherence in commuting tensor with the inverse limit. 2. For the discrete proper model import formal functions and derived p-completion from SF.4/P7, rather than identifying the two coefficient categories without G-solid. 3. Compare the extended integral coefficient morphism, projection formula and trace before taking the inverse limit.

**Inputs.** [Base change for cohomological correspondences](#correspondence-base-change), [Integral coherent cohomology complexes](#coherent-cohomology-complexes), `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`, `SchemeAndStackFoundations:SF.4`.

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Lemma 2.9.3 and proof, pp. 27–28 (solid completion); SF.4/P7 supply the separate discrete formal-functions comparison.

**Check.** A coefficient with p-torsion must be reduced derivedly; the solid/discrete comparison remains a named gap.

<a id="filtered-correspondence-action"></a>
### Equivariance of the completion and compact-support filtration

`AutomorphicBundlesPartII:filtered-correspondence-action` — theorem.

Let X be qcqs over the fixed base, F∈D⁻(O_(X,solid)), and ∅=Z_(−1)⊆Z₀⊆⋯⊆Z_d=X a finite closed filtration contracted by a cohomological correspondence T with proper p₁. Write U_l=X∖Z_l and Ẑ_l for the closed locale with I_l-adically completed algebra. The triangles RΓ_c(U_l,F)→RΓ(X,F)→RΓ(Ẑ_l,F) form a T-equivariant filtered object, with graded terms RΓ_c(Ẑ_l∖Ẑ_(l−1),F). Thus E₁^(s,t)=H_c^(s+t)(Ẑ_s∖Ẑ_(s−1),F)⇒H^(s+t)(X,F) is T-equivariant on every page. Its j! term belongs to the completion triangle j!j*F→F→î_*î*F. Ordinary local cohomology instead uses î_*î!F→F→Rj_*j*F; identifying these two filtrations is not asserted.

**Build.** 1. Use the complementary inclusion of inverse-image opens to construct the j! transformation through unit, T and the shriek counit. 2. Use the solid completion localization triangles to assemble one filtered transformation; retain G-solid for the stable enhancement and its coherences. 3. Apply the filtered-complex spectral-sequence construction of BP26 Theorem 2.9.7; this is the completion/compact-support spectral sequence, rather than the ordinary Kempf resolution.

**Inputs.** [Contracted support filtrations](#contracted-filtration), [The map on derived global sections](#correspondence-action), [Derived formal completion of coherent coefficients](#formal-completion-comparison).

**Source.** [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §2.9.1, Lemmas 2.9.3 and 2.9.6, Theorem 2.9.7 and Proposition 2.9.9, pp. 27–29.

**Check.** A single filtered map must induce all differentials and the abutment; do not replace the ordinary local-cohomology triangle by a j! triangle.

**Atlas planet:** Equivariant completion spectral sequence.

<a id="coherent-hecke-action"></a>
### Coherent Hecke operators in every degree

`AutomorphicBundlesPartII:coherent-hecke-action` — construction.

For the toroidal Hecke correspondence at neat tame level with a common fan refinement, compatible coefficient transport and fundamental class, define [KgK] on RΓ(F_can) and RΓ(F_sub) using correspondence-action. Prime-to-p integral operators require the geometric smoothness/boundary hypotheses. At this stage construct the individual double-coset endomorphisms and their fan comparisons. They form an algebra action only after the integral convolution relations of IC.5 (or a separately supplied characteristic-zero convolution proof) are verified. Degree zero agrees with B5. The operators are derived morphisms, without a chosen strict chain action.

**Build.** 1. Extend the geometric correspondence on a common fan refinement with its coefficient map. 2. Use the fundamental class and trace to obtain a derived endomorphism. 3. Compare compositions using the fibre-product decomposition and prove fan independence before declaring the algebra action.

**Inputs.** [Correspondences from a fundamental class](#fundamental-class-correspondence), [Rational isogeny transport of weight sheaves](#rational-isogeny-transport), [Composition of cohomological correspondences](#correspondence-composition), `AutomorphicBundles:B5/hecke-section-operator`, `AutomorphicBundles:B5/hecke-convolution`, `ShimuraCompactifications:C5`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), §3.9.3 and Remark 3.9.4, pp. 226–227; CG18 §7.2, pp. 398–400; P20 §5.3, p. 24.

**API outline.**

- `coherent-hecke-action.double_coset` (constructor): Construct the endomorphism for a double coset with its chosen coefficient normalization.
- `coherent-hecke-action.refinement_independent` (equivalence): Common refinements give the same RΓ morphism through the toroidal cohomology comparisons.
- `coherent-hecke-action.degree_zero` (compatibility): The induced H⁰ action equals the parent B5 pull–trace/convolution action.

- `coherent-hecke-action.coefficient_naturality` (functoriality): Maps of Hecke-linearized coefficients intertwine the individual derived operators and the boundary arrow.
- `coherent-hecke-action.relations_boundary` (compatibility): The degree-zero comparison does not assert higher integral convolution; use integral-hecke-relations for the hyperspecial integral algebra action.

**Definition checks.**

1. **degenerate.** The unit double coset acts by identity.
2. **computation.** For a central scalar double coset, the action is the scalar of the declared central coefficient character.
3. **non-example.** Equality of operators after inverting p does not imply equality of integral derived morphisms without a torsion-detection argument.

**Uses.** CG18 §7.2: Gives Hecke maps for finite perfect complexes.; BCGP21 Proposition 3.9.15: Verifies integral relations through EO Cousin complexes.

**Check.** The higher-degree integral algebra relations are supplied by IC.5, rather than inferred just from agreement on H⁰.

**Atlas planet:** Coherent Hecke operators.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- ShimuraCompactifications:C5: Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models.
- ShimuraCompactificationsPartII:C13: Use the existing all-genus deep Siegel toroidal model target and its polarized logarithmic Hodge data; do not construct these integral models in this roadmap.
- SchemeAndStackFoundations:SF.4: Proper formal functions and pseudo-coherent derived p-adic completion, with correspondence and trace compatibility. The separate solid comparison is G-solid.
- AutomorphicBundlesPartII/G-solid: The proposed AnalyticStacks and SolidAnalyticRings owners are absent from the atlas, new-roadmap directory and reserved ids. Supply a stable solid O-module six-operation package, discrete embedding/upper-shriek comparison and natural filtered support functors with BC/projection-formula coherence before claiming the BP26 solid statements. Ordinary coherent proper duality is imported from SF.2 and remains the executable discrete route. No nonexistent supplier stage is cited.

<a id="ic4"></a>
## IC.4. Hecke lifts, normalization and comparison

Lift individual geometric derived endomorphisms to homotopy classes on finite projective models. Fix the ν⁻³ arithmetic action, integral divisibility criterion, rational p-level operators and the geometric-generator/spin-polynomial dictionary. Import the current IHG.3 spin-polynomial API. Prove proper GAGA and characteristic-zero tower compatibility.

<a id="chain-lifts"></a>
### Homotopy classes of coherent Hecke chain lifts

`AutomorphicBundlesPartII:chain-lifts` — theorem.

For a finite projective coherent model C_n^∨, each derived Hecke endomorphism has a chain-map representative unique up to chain homotopy. Equality, commutation and the Hecke relations lift to homotopies. A strict action of the Hecke algebra on one chosen chain complex is additional data and is not claimed.

**Build.** 1. A bounded finite projective model is K-projective by the baseline theorem. 2. Use the baseline bijection from homotopy-category morphisms to derived morphisms. 3. Transport each geometric Hecke morphism and its algebra relations through that bijection.

**Inputs.** [Perfect models for coherent cohomology and homology](#equivariant-perfect-model), [Coherent Hecke operators in every degree](#coherent-hecke-action), `mathlib:CochainComplex.IsKProjective.Qh_map_bijective`, `mathlib:CochainComplex.isKProjective_of_projective`.

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, pp. 399–400.

**Check.** For a zero derived morphism its chain representative is null-homotopic, and need not be zero as a chain map.

**Atlas planet:** Coherent Hecke chain lifts.

<a id="normalized-coefficient-action"></a>
### The arithmetic normalization of the Siegel Hecke action

`AutomorphicBundlesPartII:normalized-coefficient-action` — definition.

For a Siegel threefold, replace the natural Hecke action on ω(a,b) by its ν⁻³ twist. The coefficient is then W_(a,b;3−a−b), whose analytic counterpart is V_(−b,−a;6−a−b). A central element xI₄ acts by x^(a+b−6). With geometric Frobenius, ε(Frob_ℓ)=ℓ⁻¹. If T′_(ℓ,i) are the geometric operators, set T_(ℓ,2)=ℓ⁻³T′_(ℓ,2) and T_(ℓ,i)=ℓ⁻⁶T′_(ℓ,i) for i=0,1, according to their similitudes.

**Build.** 1. Calculate the multiplier on each chosen Hecke matrix. 2. Twist the actual geometric action by ν⁻³ and compare its coefficient characters. 3. Compare the central scalar and Frobenius conventions before passing to Hecke polynomials.

**Inputs.** [The Siegel weight dictionary](#siegel-weight-dictionary), [Coherent Hecke operators in every degree](#coherent-hecke-action), `ModularityAndLanglandsExtensions:ML.0`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Remark 5.10 and Remark 5.12, pp. 833–834; P20 §5.3, pp. 24–25.

**API outline.**

- `normalized-coefficient-action.central_scalar` (simp): The normalized action of xI₄ is x^(a+b−6).
- `normalized-coefficient-action.operator_scaling` (compatibility): The three normalized geometric generators obey the displayed ℓ-power formulas.
- `normalized-coefficient-action.coefficient_dictionary` (equivalence): The normalized W and V realizations agree with their stated central parameters.

- `normalized-coefficient-action.twist_composition` (functoriality): Successive multiplier twists add their exponents and transport composite coefficient correspondences compatibly.
- `normalized-coefficient-action.boundary_arrow` (compatibility): The ν⁻³ twist uses the same scalar on canonical and subcanonical coefficients, so their comparison arrow remains equivariant.

**Definition checks.**

1. **computation.** Weight (a,b)=(4,2) has trivial normalized central scalar.
2. **computation.** The T_(ℓ,2) similitude ℓ gives factor ℓ⁻³, while similitude ℓ² gives ℓ⁻⁶.
3. **non-example.** Twisting by ν³ reverses both normalizing exponents and fails the central-scalar test.

**Uses.** CG20 §5.5: Fixes the Galois/Hecke polynomial convention.; BCGP21 §3.10: Matches the polynomial convention imported from IHG.3.

**Check.** The same underlying sheaf carries two different actions; the finite Hecke algebra map is part of the dictionary.

**Atlas planet:** Arithmetic Hecke normalization.

<a id="integral-normalization"></a>
### Integral divisibility and rational p-operators

`AutomorphicBundlesPartII:integral-normalization` — construction.

Given an integral coefficient correspondence T and a proved factorization T=ϖ^k U into a ϖ-torsion-free target, define the normalized integral correspondence ϖ⁻kT=U; its uniqueness uses torsion-freeness. A rational operator alone supplies no integral division. At Klingen and paramodular level the geometric T_(p,2) and U_(Kli(p),2) are defined with p⁻³ after inverting p, using the C14 correspondences; no integral p-operator or ordinary projector is asserted here.

**Build.** 1. State the actual integral divisibility of the coefficient map, rather than divide a cohomology class. 2. Use ϖ-torsion-freeness to make the integral normalization unique. 3. For p-level correspondences invert p first, apply rational isogeny transport and the declared p⁻³ normalization.

**Inputs.** [Correspondences from a fundamental class](#fundamental-class-correspondence), [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action), `ShimuraCompactificationsPartII:C14`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Remark 4.3.3, p. 19; §14.9.1–14.9.2, pp. 102–105.

**API outline.**

- `integral-normalization.integral_division` (constructor): Construct U from divisibility and torsion-freeness.
- `integral-normalization.unique_division` (characterisation): Two normalized maps with the same ϖ^k multiple coincide in a torsion-free target.
- `integral-normalization.rational_comparison` (compatibility): After inverting ϖ the integral U equals ϖ⁻kT; the p-level operators use only this rational formula.

- `integral-normalization.coefficient_naturality` (functoriality): Maps between torsion-free factorizations intertwine their divided maps by uniqueness after multiplication by ϖ^k.
- `integral-normalization.flat_base_change` (compatibility): A flat coefficient extension preserving the divisibility factorization carries U to the normalized extended map; arbitrary torsion reduction is not a uniqueness argument.

**Definition checks.**

1. **computation.** On the rank-one O-module, T=ϖ^k·id normalizes to id.
2. **non-example.** Multiplication by ϖ^k is not injective on O/ϖ, so division there is not unique.
3. **compatibility.** When k=0 the construction returns the original correspondence.

**Uses.** P20 Remark 4.3.3: Controls when renormalization stays integral.; P20 §14.9: Supplies rational T_(p,2) and U_(Kli(p),2) to the higher-Hida consumer.

**Check.** The type of the operator must record whether it is integral or rational.

<a id="hecke-polynomial-dictionary"></a>
### Geometric Hecke generators and the spin polynomial

`AutomorphicBundlesPartII:hecke-polynomial-dictionary` — comparison.

Set β_(x,0)=diag(x,x,x,x), β_(x,1)=diag(1,1,x,x), β_(x,2)=diag(1,x,x,x²), and S_x=T_(x,0) in CG20’s convention. P20’s T_(ℓ,2),T_(ℓ,1),T_(ℓ,0) correspond to CG20’s T_(x,1),T_(x,2),S_x after the declared normalization. Identify these with the normalized spherical generators in IHG.3, preserving coefficient central character and opposite-algebra convention. For BCGP21, T_(v,1),T_(v,2),T_(v,0) correspond to T_(ℓ,2),T_(ℓ,1),T_(ℓ,0). The resulting characteristic polynomial is X⁴−T_(v,1)X³+(q_vT_(v,2)+(q_v³+q_v)T_(v,0))X²−q_v³T_(v,0)T_(v,1)X+q_v⁶T_(v,0)². Import its generic spin-polynomial API from current IHG.3/SR.4, rather than re-own it.

**Build.** 1. Read the actual diagonal matrices and double-coset measures in each source. 2. Compare their similitude twists and opposite-algebra actions using the normalized coefficient. 3. Evaluate the imported spin polynomial on the identified generators; distinguish det(X−ρ) from det(1−Xρ).

**Inputs.** [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action), `IntegralHeckeAndGaloisDeterminants:IHG.3`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), §3.10, p. 236; CG20 §5.5, p. 833; P20 §5.3, pp. 24–25.

**Check.** The constant coefficient q_v⁶T_(v,0)² and the reciprocal polynomial must match the same Frobenius orientation.

<a id="gaga-and-tower-comparison"></a>
### GAGA and the coherent tower

`AutomorphicBundlesPartII:gaga-and-tower-comparison` — theorem.

For proper toroidal complex models, algebraic coherent cohomology agrees with analytic coherent cohomology in all degrees, naturally for Hecke pullback, trace, coefficient maps and boundary arrows. At characteristic-zero neat finite levels, passage to the direct-limit tower gives a smooth representation whose K-invariants recover finite-level cohomology under finite-level étale descent; finite-dimensional finite-level cohomology implies admissibility. The invariant functor used for descent is exact over characteristic zero. No analogous integral invariant equality is claimed when deck-group order is divisible by p.

**Build.** 1. Apply proper/projective GAGA on the actual compactification and coherent sheaves. 2. Check compatibility of the duality counit as well as pullback and the boundary map. 3. Use finite étale characteristic-zero descent, exact finite-group invariants and the finite-level/tower action.

**Inputs.** [Coherent Hecke operators in every degree](#coherent-hecke-action), `ComplexComparisonPartII:C2`, `ComplexComparisonPartII:C3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `ShimuraCompactifications:C5`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, pp. 824–825; BP26 §1.1, p. 2.

**Check.** A finite group of order divisible by p must trigger derived descent over O/p, rather than the characteristic-zero invariants argument.

**Atlas planet:** Coherent GAGA and tower comparison.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- ComplexComparisonPartII:C2: Projective coherent GAGA with every-degree cohomology comparison and naturality for pullback, proper pushforward and boundary coefficient maps.
- ComplexComparisonPartII:C3: Proper coherent GAGA when the chosen toroidal model is proper without a projectivity assumption; comparison of the coherent duality counit and Hecke traces.
- ShimuraCompactifications:C5: Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models.
- ShimuraCompactificationsPartII:C14: Use the compactified Klingen/paramodular p-correspondences and Cartier boundary; verify precisely the formal canonical coefficient criterion required for Lan relative vanishing.
- SmoothRepresentationsOfLocalGroups:SR.0: Smooth tower action and exact finite-deck invariants in characteristic zero; no integral invariant exactness when p divides the deck order.
- SmoothRepresentationsOfLocalGroups:SR.4: Exact normalized Satake restriction of the degree-four spin polynomial to the Klingen boundary Levi, including all q-powers and the character χ in ρ₂⊕ρ₂χ. Compare the corrected four monomials; abstract Satake alone does not fix normalization.
- IntegralHeckeAndGaloisDeterminants:IHG.3: Import current upstream §3a–3b’s GSp₄ spin polynomial, Galois-type/non-Eisenstein predicate and residual twist/dual polynomial transport. Atlas stage prose is older; identify the current upstream targets rather than duplicate them here.
- ModularityAndLanglandsExtensions:ML.0: Registry for ν⁻³, central scalars, geometric Frobenius ε(Frob_v)=q_v⁻¹ and reciprocal spin-polynomial conventions.

<a id="ic5"></a>
## IC.5. Integral vanishing, Hecke relations and localization

Verify Lan’s formal-canonical criterion and toroidal-to-minimal relative vanishing on the actual models. Specialize Lan–Suh’s corrected integral BGG/small-weight theorem to the three explicit GSp₄ ranges, then derive dual singular-weight vanishing and large-twist section reduction. Compute subcanonical cohomology by ordinary EO Cousin resolutions and detect integral prime-to-p Hecke relations on the interior at hyperspecial p-level. After these relations supply the commuting action, split finite Hecke local factors and transport residual non-Eisenstein systems; define complex congruence localization through the integral Hecke image. Retain quotient, model and boundary-regularity obligations.

<a id="formally-canonical-coefficients"></a>
### Formally canonical and subcanonical coefficients

`AutomorphicBundlesPartII:formally-canonical-coefficients` — definition.

On Lan’s normalized toroidal PEL models, an extension is formally canonical (respectively subcanonical) when on every formal boundary chart it is the completed monomial expansion with indices in σ∨ (respectively σ∨_+=⋂_(τ a face of σ in Σ, including σ)τ∨_0, using the boundary-chart monoids τ∨_0 fixed by the compactification supplier), with coefficient sheaf E₀ on the completed boundary base admitting a finite exhaustive filtration whose graded factors are pulled back from quasi-coherent sheaves on Spec O_(F₀,(p)) associated with finite R-modules as in Lan17 Definition 8.5 and §7. The monoid and coefficient-filtration condition are part of the definition, not merely local freeness on the abelian boundary base.

**Build.** 1. Import the formal boundary charts and monomial indexing from the compactification owner. 2. Specify the completed expansion and finite base-module filtration from §7. 3. Verify the condition for canonical and boundary-ideal subcanonical automorphic coefficients on each required model.

**Inputs.** [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), `ShimuraCompactifications:C4`, `ShimuraCompactificationsPartII:C13`, `ShimuraCompactificationsPartII:C14`.

**Source.** [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Definition 8.5, p. 34, with Propositions 7.5 and 7.15, pp. 28–32.

**API outline.**

- `formally-canonical-coefficients.boundary_chart` (characterisation): Give the chartwise completed expansion with its exact monoid.
- `formally-canonical-coefficients.subcanonical` (compatibility): The boundary-ideal twist replaces σ∨ by the positive submonoid in the permitted charts.
- `formally-canonical-coefficients.coefficient_base_change` (functoriality): The specified finite filtrations and monomial expansions commute with the base changes allowed in Lan17.

- `formally-canonical-coefficients.restriction` (functoriality): Restriction to a boundary chart and an allowed fan refinement preserves the completed expansion and its finite filtration.
- `formally-canonical-coefficients.isomorphism_invariant` (characterisation): A coefficient isomorphism carrying the chart filtrations and monomial expansions transports the formally canonical property.

**Definition checks.**

1. **degenerate.** On an empty-boundary chart the canonical and subcanonical conditions coincide.
2. **computation.** On a one-dimensional toric chart, canonical expansions permit the constant term while subcanonical expansions have positive exponent.
3. **non-example.** An arbitrary bundle on the boundary abelian base without the prescribed finite filtration is not accepted as formally canonical.

**Uses.** Lan17 Theorem 8.6: This is the hypothesis of relative vanishing.; BCGP21 §3.9.10: Applies relative vanishing after twisting by powers of a boundary-supported relatively ample divisor.

**Check.** Verification on ramified or quotient models is an explicit obligation, not a consequence of the definition alone.

<a id="relative-subcanonical-vanishing"></a>
### Toroidal-to-minimal relative vanishing

`AutomorphicBundlesPartII:relative-subcanonical-vanishing` — theorem.

For a Lan17 normalized PEL toroidal-to-minimal map π over an allowed O_(F₀,(p))-algebra R, and a quasi-coherent extension E satisfying the preceding formal criterion, R^iπ_*(E(−nD′))=0 for i>0 and n>0 in the formally canonical case, and for i>0 and n≥0 in the formally subcanonical case. Here D′ is the boundary-supported relatively ample Cartier divisor of Lan17 Corollary 6.7. In particular subcanonical automorphic coefficients have no positive higher direct images once the chart criterion is verified; canonical coefficients at n=0 are not included. The same assertion holds over an open U of the minimal model for a coefficient defined on π⁻¹U with the chart criterion there; it also applies over finite coefficient algebras after verifying that criterion under base change. Analytic adic generic-fibre comparisons are imported by the higher-Hida consumer from its adic-space owner, rather than asserted as algebraic base change here.

**Build.** 1. Reduce locally on the minimal compactification to the formal chart calculation of Lan17 §7. 2. Apply the positive-monomial argument and the relatively ample divisor D′ with the indicated range of n. 3. Use formal functions and refinement descent; verify separately the ramified/quotient model inputs requested below.

**Inputs.** [Formally canonical and subcanonical coefficients](#formally-canonical-coefficients), `ShimuraCompactifications:C5`, `ShimuraCompactificationsPartII:C14`.

**Source.** [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 8.6 and Remark 8.9, pp. 34–35; P20 Theorem 6.2.2.1, p. 30; BP26 proof of Proposition 5.6.3, p. 58.

**Check.** A canonical sheaf without the positive twist is outside the theorem; a subcanonical coefficient at n=0 is inside.

**Atlas planet:** Lan relative vanishing.

<a id="lan-suh-gsp4-weights"></a>
### Lan–Suh’s small-weight specialization for GSp₄

`AutomorphicBundlesPartII:lan-suh-gsp4-weights` — theorem.

For the smooth hyperspecial Siegel threefold over k of characteristic p, specialize Lan–Suh Corollary 7.24(2) to μ=(α,β;c) with α≥β≥0, α+β<p−3 and ν=(t,t;0), t>0. For a Kostant representative w with length ℓ(w), it gives vanishing of H^(i−ℓ(w))(W^∨_(w·μ−ν),sub) when i>3, under the source’s smallness hypotheses; in this specialization these include a−b+1≤p and 2<p. The three resulting weights are (β+2+t,−α+t), (α+3+t,1−β+t) and (α+3+t,β+3+t). The generic integral BGG and logarithmic Deligne–Illusie inputs remain with their suppliers.

**Build.** 1. Use the integral dual BGG decomposition with its exact small-weight and logarithmic lifting hypotheses. 2. Compute the three dot-action weights and the lengths 1,2,3 on the GSp₄ root datum. 3. Solve for α,β,t for each desired (a,b), checking all inequalities over integers rather than discarding endpoint conditions.

**Inputs.** [The Siegel weight dictionary](#siegel-weight-dictionary), `DerivedDeRhamCohomology:DD.6`, `CrystallineCohomology:CR.5`, `LanglandsParameterStacks:LP3`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 5.1, pp. 822–824; LanSuh Corollary 7.24(2), manuscript p. 43.

**Check.** The source’s relative coefficient/logarithmic splitting theorem is an explicit extension request, not inferred from an ordinary de Rham comparison.

**Atlas planet:** Lan–Suh weight calculation.

<a id="vanishing-above-two"></a>
### Vanishing above degree two

`AutomorphicBundlesPartII:vanishing-above-two` — theorem.

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if a≥3 and 2≤a−b≤p−2, then H^i(X_k,ω(a,b)(−D))=0 for i>2. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

**Build.** 1. Use the length-1 Lan–Suh representative and its explicit weight formula. 2. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. 3. Translate W into ω and read the cohomological shift i−ℓ(w).

**Inputs.** [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.1(1) and proof, pp. 822–824.

**Check.** Check the endpoints in a≥3 and 2≤a−b≤p−2 and reject weights one step beyond the p-small bound.

<a id="vanishing-above-one"></a>
### Vanishing above degree one

`AutomorphicBundlesPartII:vanishing-above-one` — theorem.

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if a+b≥6 and 2≤a−b≤p−2, then H^i(X_k,ω(a,b)(−D))=0 for i>1. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

**Build.** 1. Use the length-2 Lan–Suh representative and its explicit weight formula. 2. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. 3. Translate W into ω and read the cohomological shift i−ℓ(w).

**Inputs.** [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.1(2) and proof, pp. 822–824.

**Check.** Check the endpoints in a+b≥6 and 2≤a−b≤p−2 and reject weights one step beyond the p-small bound.

<a id="positive-degree-vanishing"></a>
### Positive-degree vanishing

`AutomorphicBundlesPartII:positive-degree-vanishing` — theorem.

On the smooth hyperspecial integral Siegel threefold with residue field k of characteristic p, if b≥4 and 0≤a−b≤p−4, then H^i(X_k,ω(a,b)(−D))=0 for i>0. The lower boundary of each displayed weight range is included. The level is neat and prime to p, and the finite field may be extended without changing the conclusion.

**Build.** 1. Use the length-3 Lan–Suh representative and its explicit weight formula. 2. Choose integral α,β,t realizing (a,b) and check dominance, positivity and p-smallness. 3. Translate W into ω and read the cohomological shift i−ℓ(w).

**Inputs.** [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.1(3) and proof, pp. 822–824.

**Check.** Check the endpoints in b≥4 and 0≤a−b≤p−4 and reject weights one step beyond the p-small bound.

<a id="siegel-serre-dual-weight"></a>
### Serre duality and the dual Siegel weight

`AutomorphicBundlesPartII:siegel-serre-dual-weight` — comparison.

For a smooth proper toroidal Siegel threefold in characteristic zero, or in characteristic p with 0≤a−b≤p−1 so the symmetric-power dual identification is valid, the Serre dual of ω(a,b) is ω(3−b,3−a)(−D), and H^i_can(ω(a,b))^∨≃H^(3−i)_sub(ω(3−b,3−a)). The normalized Hecke equivariance includes inverse double cosets and the determinant/cyclotomic twist from CG20 Appendix A.3.2. For larger weights use the actual divided-power dual rather than this symmetric-power formula.

**Build.** 1. Use the logarithmic Kodaira–Spencer formula ω_X≃det(E)³(−D). 2. Dualize Sym^(a−b) only under the indicated factorial-invertibility bound. 3. Apply coherent Serre duality and transpose the geometric normalized correspondence, retaining its twist.

**Inputs.** [Finite-coefficient Serre duality](#finite-coefficient-serre-duality), [The transpose correspondence](#transpose-correspondence), [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action), `AutomorphicBundles:B4`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, pp. 830–831; Appendix A.3.2, pp. 886–888.

**Check.** The dual weight transformation is involutive; the same symmetric-power formula is not accepted beyond the small-weight range.

<a id="singular-weight-modp-vanishing"></a>
### Mod-p singular-weight vanishing

`AutomorphicBundlesPartII:singular-weight-modp-vanishing` — theorem.

On the hyperspecial Siegel threefold over k, H²_sub(ω(a,2))=H³_sub(ω(a,2))=0 for 4≤a≤p. For 3≤a≤(p+1)/2, H⁰_can(ω(a,3−a))=H³_sub(ω(a,3−a))=0. The canonical/subcanonical tags in the second assertion are different and essential.

**Build.** 1. Substitute the first weight into Theorem 5.1(2) and check its p-small inequalities. 2. Use Serre duality and Theorem 5.1 on the transformed singular weight for the second range. 3. Keep the cohomological degree and boundary twist through each duality.

**Inputs.** [Vanishing above degree one](#vanishing-above-one), [Serre duality and the dual Siegel weight](#siegel-serre-dual-weight).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Corollary 5.8 and proof, pp. 830–831.

**Check.** Check a=4,p=5 in the first range and a=3,p=5 in the second; do not infer H⁰_sub=H⁰_can in the second range.

**Atlas planet:** Singular-weight vanishing.

<a id="large-parallel-twist"></a>
### Large parallel twists and reduction of sections

`AutomorphicBundlesPartII:large-parallel-twist` — theorem.

Fix a dominant weight μ and a finite set of neat toroidal levels among X,X₀(Q),X₁(Q) for which relative subcanonical vanishing and an ample Hodge line on the minimal model hold. There is N(μ,levels) such that every parallel twist μ+t with t≥N has H^i_sub(X_k,ω_(μ+t))=0 for i>0. Consequently reduction H⁰_sub(O)→H⁰_sub(k) and the quotient map H⁰_sub(E)→H⁰_sub(E/O) are surjective, with their coefficient exact-sequence interpretation. No bound uniform over all levels is asserted.

**Build.** 1. Push subcanonical coefficients to the minimal model using relative vanishing. 2. Use Serre vanishing after ample Hodge twisting, and take the maximum bound over the fixed finite set of levels. 3. Use the ϖ-adic and E/O coefficient long exact sequences, proper finite cohomology and Nakayama to get the two surjections.

**Inputs.** [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing), `SchemeAndStackFoundations:SF.2/ample-serre-vanishing`, [Integral coherent cohomology complexes](#coherent-cohomology-complexes).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §6.1, p. 836; proof of Theorem 6.13, p. 843.

**Check.** Both surjections must be derived from H¹ vanishing; a bound depending only on μ while Q varies is not claimed.

<a id="eo-cousin-computation"></a>
### The EO Cousin computation

`AutomorphicBundlesPartII:eo-cousin-computation` — theorem.

At hyperspecial p-level on the smooth Hilbert–Siegel toroidal model, filter by closures of Ekedahl–Oort strata of codimension at least i. For subcanonical locally free automorphic coefficients modulo pⁿ, n≥1, the Kempf Cousin resolution computes the sheaf, and its global-section complex computes RΓ once the following acyclicity is proved. The canonical-coefficient algebra action is obtained separately by coherent duality, not by assuming the same untwisted canonical Cousin acyclicity. Prove acyclicity using the affine stratum image on the minimal compactification, cofinal regular-sequence thickenings, Koszul resolutions and Lan relative vanishing. Affineness of the stratum itself is not assumed in place of this argument.

**Build.** 1. Import the EO geometric codimension, affine-image and regular-immersion results; their Hilbert–Siegel model owner is a recorded gap. 2. Apply the general Kempf resolution to the MCM coefficient and identify the support terms by cofinal Koszul thickenings. 3. Use relative vanishing over the affine minimal stratum image to prove the required term acyclicity.

**Inputs.** `SchemeAndStackFoundations:SF.2/kempf-cousin-resolution`, `SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing`, [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing), `ShimuraCompactifications:C5`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 3.9.11, pp. 229–230.

**Check.** The cofinal thickenings and regular sequences are checked, rather than equating set-theoretic codimension with a chosen complete intersection.

**Atlas planet:** Ekedahl–Oort Cousin complex.

<a id="boundary-interior-injection"></a>
### Injecting the Cousin complex into the interior

`AutomorphicBundlesPartII:boundary-interior-injection` — theorem.

For the preceding EO filtration, restriction of every Cousin term of a subcanonical coefficient to the open Shimura variety is injective, provided the boundary equation is a non-zero-divisor on every relevant regular-sequence quotient. Verify this using that no component of the relevant EO stratum is contained in the boundary and the Cohen–Macaulay thickening argument. The omitted geometric verification is recorded as a gap. This is a termwise detection statement, not an assertion that global coherent cohomology injects into open cohomology in every degree.

**Build.** 1. Express the Cousin term as the filtered colimit of Ext groups for the regular thickenings. 2. Prove boundary regularity on each quotient from the geometric non-containment and CM hypotheses. 3. Localize at the boundary equation and use the resulting injection in every term.

**Inputs.** [The EO Cousin computation](#eo-cousin-computation), `SchemeAndStackFoundations:SF.2/depth-local-cohomology-vanishing`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 3.9.12 and its proof, p. 230.

**Check.** Restriction of an arbitrary coherent cohomology group is not substituted for the termwise injection.

<a id="cousin-hecke-map"></a>
### Hecke maps on the EO Cousin complex

`AutomorphicBundlesPartII:cousin-hecke-map` — theorem.

For a prime-to-p Hecke correspondence preserving each EO stratum, coherent pullback and finite-duality upper shriek induce compatible maps on the Ext systems defining the Cousin terms, hence a map of Cousin complexes. Use pulled-back regular sequences, the explicit finite duality formula and cofinal systems of powers to obtain compatibility with the Cousin differential. These maps agree with the derived global Hecke action on the interior.

**Build.** 1. Pull back the EO regular sequences and check the finite-flat or duality hypotheses for both legs. 2. Construct the maps on local Ext/Koszul representatives, with cofinal powers when generators change. 3. Use the natural maps of ordinary local-cohomology support sequences and their Ext/Koszul representatives to prove compatibility with incidence differentials and augmentation; compare on the interior. BP26’s completion/compact-support filtration is a separate construction.

**Inputs.** [The EO Cousin computation](#eo-cousin-computation), `SchemeAndStackFoundations:SF.2/finite-formula`, `AlgebraicModuliForArithmeticGeometry:A0-extension/fundamental-class-boundary`, `SchemeAndStackFoundations:SF.2/supports-localization-triangle`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 3.9.13 and Remark 3.9.14, pp. 230–231.

**Check.** A map on Cousin terms alone is insufficient; the incidence/boundary differentials must commute.

<a id="integral-hecke-relations"></a>
### Integral prime-to-p Hecke relations at hyperspecial level

`AutomorphicBundlesPartII:integral-hecke-relations` — theorem.

For the BCGP21 Hilbert–Siegel models with p split completely in F and K_p=∏_(v|p)GSp₄(O_(F_v)), prime-to-p Hecke operators act through the abstract integral Hecke algebra on RΓ of canonical and subcanonical automorphic coefficients. For the G₁ quotient model, retain the prime-to-p component-group order or prove the direct-factor descent of Proposition 3.8.3. The integral algebra relations are detected termwise on the EO Cousin complex by restriction to the interior. Arbitrary p-level integral relations are outside this statement.

**Build.** 1. On the open Shimura variety use finite étale correspondences and the known convolution relations. 2. Use termwise interior injection to prove those same relations on the integral Cousin complex. 3. Pass from the modulo-pⁿ models through derived formal completion to RΓ. Obtain the canonical-coefficient result by duality using the actual integral dual coefficient (divided powers where required), and descend to G₁ only under the explicit component-group condition.

**Inputs.** [Hecke maps on the EO Cousin complex](#cousin-hecke-map), [Injecting the Cousin complex into the interior](#boundary-interior-injection), [Coherent Hecke operators in every degree](#coherent-hecke-action), `SmoothRepresentationsOfLocalGroups:SR.1`, `SchemeAndStackFoundations:SF.4`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-derived-completion-comparison`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proposition 3.9.15 and Remark 3.9.16, pp. 231–232.

**Check.** The p-level must remain hyperspecial; equality after tensoring with E alone is inadequate.

**Atlas planet:** Integral coherent Hecke action.

<a id="localized-perfect-model"></a>
### Localized coherent perfect complexes

`AutomorphicBundlesPartII:localized-perfect-model` — construction.

Assume a commuting Hecke-algebra action on C_n^∨ has been supplied (for the integral geometric application use integral-hecke-relations, not merely the individual IC.3 operators). Let T_n be its finite A_n-algebra image in End_D(C_n^∨). For a maximal ideal m, its Artinian local-factor idempotent splits C_n^∨ into a perfect summand C_(n,m)^∨ and its complement, with H^i(C_(n,m)^∨)=H^i(C_n^∨)_m. The dual chain summand localizes at the transposed Hecke ideal, with character twists transported explicitly. This is not localization at an arbitrary prime by an idempotent over an arbitrary base.

**Build.** 1. Use finiteness of derived endomorphism groups of a perfect finite-coefficient complex to get finite T_n. 2. Apply the imported Artinian idempotent decomposition and perfect retract theorem. 3. Identify cohomology and transport the dual action via the transpose pairing.

**Inputs.** [Homotopy classes of coherent Hecke chain lifts](#chain-lifts), `DeformationAndDerivedPatchingAlgebra:P7/finite-derived-action-localization`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-perfect-retract`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations).

**Source.** [CG18](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), §7.2, p. 400.

**API outline.**

- `localized-perfect-model.projector` (constructor): Produce the local-factor idempotent and its perfect image.
- `localized-perfect-model.localized_cohomology` (equivalence): Cohomology of the summand is the ordinary T_n-localized cohomology.
- `localized-perfect-model.dual_ideal` (compatibility): The dual summand uses the ideal pulled back by transpose and the specified central twist.
- `localized-perfect-model.orthogonal_factors` (structure): Local-factor projectors sum to identity and are mutually orthogonal; the resulting perfect decomposition is functorial for maps commuting with T_n.
- `localized-perfect-model.model_independence` (compatibility): A Hecke-equivariant derived equivalence of perfect models identifies their local factors and the coefficient-descent comparisons whenever the idempotents correspond.

**Definition checks.**

1. **computation.** For T_n=A_n×A_n acting on C⊕D, the first maximal factor selects C.
2. **degenerate.** An ideal outside the support gives the zero perfect complex.
3. **non-example.** Over Z, localization at (p) is not in general obtained from an idempotent in Z.

**Uses.** CG18 §7.2: Output handed to patching, whose algebra remains in P7–P9.; P20 §15.2.3: Provides the finite integral Hecke algebra through which complex localization is interpreted.

**Check.** The localization projector is an endomorphism in the derived category and is represented up to homotopy.

**Atlas planet:** Localized coherent perfect complex.

<a id="coherent-non-eisenstein-specialization"></a>
### Non-Eisenstein coherent localization

`AutomorphicBundlesPartII:coherent-non-eisenstein-specialization` — comparison.

Use current IHG.3’s Galois-type/non-Eisenstein predicates for the normalized geometric Hecke algebra: after finite residue-field extension the spherical degree-four polynomials agree with a continuous absolutely irreducible residual representation. When the application requires a representation into GSp₄ with specified multiplier, retain its alternating form and multiplier as additional hypotheses. Transport residual systems through the actual coefficient-normalization algebra map and transpose involution; generic residual polynomial transport is imported from IHG.3.

**Build.** 1. Pull the imported residual polynomial system through the geometric algebra identification. 2. Extend the residue field when needed and retain absolute irreducibility and the symplectic multiplier. 3. Compare ideals on dual cohomology via the transposed geometric operators and their cyclotomic twist.

**Inputs.** [Geometric Hecke generators and the spin polynomial](#hecke-polynomial-dictionary), [Localized coherent perfect complexes](#localized-perfect-model), `IntegralHeckeAndGaloisDeterminants:IHG.3`, `ArithmeticGaloisRepresentations:R01.1`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), §3.10, p. 236; CG20 §7.2, pp. 852–855.

**Check.** An arbitrary GL₄ residual witness does not itself supply a symplectic form or a GSp₄ multiplier.

<a id="complex-hecke-localization"></a>
### Congruence localization of complex coherent cohomology

`AutomorphicBundlesPartII:complex-hecke-localization` — definition.

Fix a finite O-Hecke image T and an embedding of its characteristic-zero coefficient field into C. For a residual maximal ideal m, define M_(m,C) as the sum of the generalized characteristic-zero Hecke eigenspaces whose integral characters reduce to m after passing to a common finite coefficient extension. This is (M_O)_m⊗_O C for a finite integral lattice with that action, through the product decomposition of T⊗E. A maximal ideal of T⊗C alone does not encode residual congruence.

**Build.** 1. Use the finite integral algebra and its local factor at m. 2. Decompose its generic fibre into generalized character factors, allowing finite field extension. 3. Compare with localization of the integral lattice and scalar extension to C.

**Inputs.** [Localized coherent perfect complexes](#localized-perfect-model), [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization), `IntegralHeckeAndGaloisDeterminants:IHG.2`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2.3, p. 108.

**API outline.**

- `complex-hecke-localization.character_criterion` (characterisation): A characteristic-zero eigenspace lies in M_(m,C) exactly when its integral character reduces to m.
- `complex-hecke-localization.lattice_independence` (equivalence): Compatible finite stable lattices give the same generic localized summand.
- `complex-hecke-localization.coefficient_extension` (compatibility): Finite extension of O and compatible embeddings transport the congruence summand as expected.
- `complex-hecke-localization.functorial` (functoriality): A map commuting with the fixed finite integral Hecke image preserves each residual congruence summand and respects identity and composition.
- `complex-hecke-localization.direct_sum` (structure): The residual local-factor projectors are orthogonal and sum to identity; retain generalized generic eigenspaces without assuming semisimplicity.

**Definition checks.**

1. **computation.** Take T=O[t]/(t(t−ϖ)), with generic characters t↦0 and t↦ϖ acting on E⊕E. Both reduce to m=(ϖ,t); hence M_(m,C)=C⊕C, although T⊗C has two distinct maximal ideals.
2. **degenerate.** If no character reduces to m the complex localized space is zero.
3. **non-example.** Localizing only at one maximal ideal of T⊗C can discard a second congruent characteristic-zero character.

**Uses.** P20 Corollary 15.2.3.1: Selects all automorphic representations congruent to the residual system.; CG20 Theorem 7.11 proof: Interprets non-Eisenstein localization of complex cohomology.

**Check.** The residual ideal and chosen embeddings must remain visible in the notation.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- AutomorphicBundles:B4: Highest-weight, determinant and logarithmic canonical-bundle identifications with the exact GSp₄ central coordinates used by CG20 and BP26.
- ShimuraCompactifications:C4: Logarithmic Hodge sequence, polarization/dual semi-abelian extension and formal boundary charts on the smooth toroidal integral model.
- ShimuraCompactifications:C5: Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models.
- ShimuraCompactificationsPartII:C13: Use the existing all-genus deep Siegel toroidal model target and its polarized logarithmic Hodge data; do not construct these integral models in this roadmap.
- ShimuraCompactificationsPartII:C14: Use the compactified Klingen/paramodular p-correspondences and Cartier boundary; verify precisely the formal canonical coefficient criterion required for Lan relative vanishing.
- LanglandsParameterStacks:LP3: Integral Weyl/dual-Weyl modules, the right-B-equivariant function realization with left translation, and allowed base change. The current Tau Ceti Young-symmetrizer construction over Q-algebras does not supply integral dual-Weyl lattices.
- SchemeAndStackFoundations:SF.4: Proper formal functions and pseudo-coherent derived p-adic completion, with correspondence and trace compatibility. The separate solid comparison is G-solid.
- SmoothRepresentationsOfLocalGroups:SR.1: Integral Hecke convolution and opposite-algebra conventions; apply to the actual geometric coherent correspondence operators.
- IntegralHeckeAndGaloisDeterminants:IHG.2: Finite Hecke image in derived endomorphisms, commuting local factors and their coefficient/base-change compatibility; strict chain-level action is not requested.
- IntegralHeckeAndGaloisDeterminants:IHG.3: Import current upstream §3a–3b’s GSp₄ spin polynomial, Galois-type/non-Eisenstein predicate and residual twist/dual polynomial transport. Atlas stage prose is older; identify the current upstream targets rather than duplicate them here.
- DerivedDeRhamCohomology:DD.6: Extend the logarithmic comparison direction with the coefficient logarithmic Deligne–Illusie splitting used by Lan–Suh: W₂ lift, Cartier type, nilpotent residues, dimension/p and small-weight conditions, and the integral dual BGG graded decomposition. Ordinary de Rham comparison does not supply this theorem.
- CrystallineCohomology:CR.5: Provide the logarithmic crystalline/de Rham coefficient comparison and W₂ logarithmic lift inputs underlying Lan–Suh Theorem 7.22 and Corollary 7.24; retain the residue and dimension restrictions.
- ArithmeticGaloisRepresentations:R01.1: Continuous residual representation and scalar-extension/semisimplification API; retain symplectic form/multiplier when required.
- AutomorphicBundlesPartII/G-models: There is no HilbertSiegelModularVarieties supplier in the current atlas. The genus-two Res_(F/Q)GSp₄ models, EO strata, their affine images and codimension/regular-sequence properties must be supplied, together with the G₁ quotient direct-factor statement under p∤#Δ(K^p). H1’s Hilbert modular varieties have genus one and do not supply these inputs. C13/C14 supply the stated Siegel models over Q only.
- AutomorphicBundlesPartII/G-boundary-regular: BCGP21 Lemma 3.9.12 uses injectivity after inverting a boundary equation. Check that each relevant EO component meets the interior and prove the boundary equation is regular on every cofinal CM regular-sequence quotient. The source proof does not spell out this geometric input; dimension alone is not a proof for an arbitrary thickening.
- AutomorphicBundlesPartII/G-formal-models: Verify Lan17 Definition 8.5 chart by chart for the C14 Klingen/paramodular model and the G₁ quotient. A deck group free on the open variety need not be free on the boundary; retain the prime-to-p stabilizer condition or prove local exact descent. Lan17 Remark 8.9 allows singular fans by refinement, but does not remove these coefficient/model hypotheses.

<a id="ic6"></a>
## IC.6. Coherent cohomology and automorphic forms

Define the interior image and its tower. Compare canonical cohomology with automorphic forms using the logarithmic growth resolution, regularization and Su’s theorem. Keep Harris’s separate cusp/subcanonical map, cusp/L²/tempered image subspaces and actual spectral multiplicity spaces. Compare W and V coefficient conventions, holomorphic cusp forms in degree zero and product relative cohomology.

<a id="interior-cohomology"></a>
### Interior coherent cohomology and towers

`AutomorphicBundlesPartII:interior-cohomology` — definition.

For a canonical coefficient F_can with subcanonical F_sub=F_can⊗I_D, define H̄^i(X,F)=im(H^i(X,F_sub)→H^i(X,F_can)). Define H̃^i_* as the filtered colimit over neat levels and compatible fans, with pullback transition maps. This is the image of the boundary-ideal map; it is not defined as compactly supported topological cohomology. The underlying additive image uses the pinned Scheme.Modules.cohomologyFunctor.

**Build.** 1. Apply the existing cohomology functor to the boundary ideal inclusion. 2. Take its image as a coefficient submodule; in the prototype take its underlying additive subgroup. 3. Use Hecke compatibility and exact filtered colimits to give the image tower its action.

**Inputs.** [Integral coherent cohomology complexes](#coherent-cohomology-complexes), [GAGA and the coherent tower](#gaga-and-tower-comparison), `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyFunctor`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, pp. 824–825; P20 §15.2.3, p. 108.

**API outline.**

- `interior-cohomology.membership` (characterisation): A canonical class is interior exactly when it has a subcanonical lift.
- `interior-cohomology.tower_map` (functoriality): Level pullbacks preserve the image and give the direct-limit action.
- `interior-cohomology.hecke_stability` (compatibility): Commuting coefficient Hecke squares induce endomorphisms of H̄^i.

- `interior-cohomology.linear_structure` (structure): The image is an O-submodule (or complex subspace), with its canonical inclusion; it is the range rather than the source modulo an unspecified kernel.
- `interior-cohomology.coefficient_functor` (functoriality): A commuting canonical/subcanonical square induces a unique image map; these maps preserve identity, composition, addition and scalars.

**Definition checks.**

1. **degenerate.** If D is empty, H̄^i=H^i_can.
2. **computation.** If the degree-i boundary-ideal map is zero, its interior image is zero.
3. **compatibility.** In degree zero, cohomologyZeroEquiv identifies the image with sections admitting a subcanonical lift.

**Uses.** CG20 Theorem 5.2: Target of cusp comparison and subspace of L²-image cohomology.; BCGP21 Theorem 3.10.1: The space compared with localized subcanonical cohomology in degrees zero and one.

**Check.** The image definition is tested independently of the still-unproved automorphic comparisons.

**Atlas planet:** Interior coherent cohomology.

<a id="growth-dolbeault-comparison"></a>
### The canonical-extension growth resolution

`AutomorphicBundlesPartII:growth-dolbeault-comparison` — theorem.

Let (G,X) be a connected Shimura datum satisfying Su’s condition that the maximal Q-split central torus A_G is also maximal R-split in Z_G, K neat, Σ a smooth toroidal fan and V a finite-dimensional holomorphic P_h-representation. The logarithmic differentiably-moderate-growth Dolbeault complex is a fine resolution of V_can on the toroidal compactification; its global sections identify with the relative (p_o,K_o) Chevalley–Eilenberg complex of C∞_dmg(G)^K⊗V. The central A_G factor and the finite-adelic action on V_o are retained.

**Build.** 1. Identify the canonical coefficient on a toroidal chart using its holomorphic frame and logarithmic boundary coordinates. 2. Use the growth Dolbeault lemma and fine-sheaf partitions of unity; the generic analytic input is requested from AS.5. 3. Compare the Dolbeault differential with the imported relative Chevalley–Eilenberg differential and track finite-adelic coefficient transport.

**Inputs.** [GAGA and the coherent tower](#gaga-and-tower-comparison), `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`, `AutomorphicSpectralTheory:AS.5`, `AutomorphicBundles:B3`.

**Source.** [Su24](https://arxiv.org/abs/1810.12056), Propositions 3.14 and 3.16, pp. 36–38; conventions §1.1, pp. 6–10.

**Check.** The theorem concerns canonical extension, not subcanonical extension; check the central splitness and P_h rather than full g cohomology.

**Atlas planet:** Canonical-extension Dolbeault comparison.

<a id="su-canonical-comparison"></a>
### Su’s automorphic comparison

`AutomorphicBundlesPartII:su-canonical-comparison` — theorem.

Under the preceding Su hypotheses, H^i(X_(K,Σ),V_can)≃H^i(p_o,K_o;A(G)^(A_G(R)^0K)⊗V), naturally in V and finite-level Hecke operators. At the tower level the isomorphism is G(A_f)-equivariant with the modified coefficient V_o on which the central A_G component acts inversely. The map is induced by inclusion of automorphic forms into uniformly moderate growth functions. This theorem does not identify all canonical cohomology with cusp cohomology.

**Build.** 1. Import the regularization quasi-isomorphism C∞_umg→C∞_dmg and its coefficient compatibility from AS.5. 2. Use Fin_J acyclicity, the finite-dimensional central-annihilator ideal and the relative cohomology spectral sequences as in Lemmas 5.1–5.5. 3. Compose with the canonical-extension growth resolution and check the tower action on V_o.

**Inputs.** [The canonical-extension growth resolution](#growth-dolbeault-comparison), `AutomorphicSpectralTheory:AS.5`.

**Source.** [Su24](https://arxiv.org/abs/1810.12056), Proposition 4.1, p. 38; Theorem 5.7 and proof, pp. 54–55.

**Check.** All automorphic forms appear on the right; replacing A(G) by A_cusp(G) is not accepted.

**Atlas planet:** Su automorphic comparison.

<a id="harris-cusp-interior-comparison"></a>
### Harris’s cusp and interior comparison

`AutomorphicBundlesPartII:harris-cusp-interior-comparison` — theorem.

In the characteristic-zero toroidal Siegel setting, relative (p^−,K_h)-cohomology of cuspidal automorphic forms maps injectively into interior coherent cohomology, and interior cohomology lies in the image of the L² automorphic comparison in canonical cohomology. The cusp map is an isomorphism in degrees 0 and 3 for the Siegel threefold. The totally real product version gives cusp→interior→L²-image inclusions, with central character and multiplicities retained. The full comparison diagram uses a separate cusp/subcanonical map; Su’s theorem alone does not supply it.

**Build.** 1. Construct the rapid-decay and slow-growth Dolbeault comparisons using H90 Theorems 2.4.1 and 2.4.4, pp. 56–57. 2. Use H90 Theorem 2.7, p. 58, and the harmonic/relative-cohomology identification (3.0.1), p. 59, for the injection and L²-image containment. 3. Apply Proposition 2.7.2, p. 59, in end degrees; retain the precise full-group and product conventions as G-Harris.

**Inputs.** [Su’s automorphic comparison](#su-canonical-comparison), [Interior coherent cohomology and towers](#interior-cohomology), `AutomorphicSpectralTheory:AS.4`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.2, p. 825; BCGP21 proof of Theorem 3.10.1, pp. 239–240; [H90](https://www.jmilne.org/math/Books/AA1988b.pdf), Theorems 2.4.4 and 2.7, pp. 57–58; Proposition 2.7.2 and (3.0.1), p. 59.

**Check.** Do not turn the L²-image containment into equality with the entire canonical space, and do not discard residual multiplicity.

**Atlas planet:** Harris cusp–interior comparison.

<a id="automorphic-image-subspaces"></a>
### Cuspidal, L² and tempered image subspaces

`AutomorphicBundlesPartII:automorphic-image-subspaces` — definition.

Define H^i_cusp and H^i_(2) inside canonical coherent cohomology as images of the corresponding relative-cohomology maps. Define the tempered part by first summing the relevant cuspidal or discrete L² irreducible automorphic summands whose archimedean factors are essentially tempered, then applying the comparison map. Keep these images distinct from the source relative cohomology and from H̄^i; a quotient map can have a kernel.

**Build.** 1. Use the spectral owner’s discrete automorphic summands with their finite multiplicities. 2. Form the specified relative cohomology and image in canonical cohomology. 3. Select essentially tempered archimedean factors before mapping; compare nested image subspaces.

**Inputs.** [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), `AutomorphicSpectralTheory:AS.4`, `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, pp. 825–826.

**API outline.**

- `automorphic-image-subspaces.image_membership` (characterisation): A class belongs exactly when it is the image of a relative class in the specified automorphic source.
- `automorphic-image-subspaces.inclusions` (relation): Cusp images lie in L² images, and tempered cusp images lie in tempered L² images.
- `automorphic-image-subspaces.hecke` (functoriality): Each image is stable under the compatible finite Hecke action.

- `automorphic-image-subspaces.linear_image` (structure): Use the linear range of the named relative-cohomology comparison map with its kernel quotient; finite sums and scalars stay in the image.
- `automorphic-image-subspaces.level_maps` (functoriality): Compatible level changes preserve each cusp, L² and tempered image and commute with inclusion into canonical cohomology.

**Definition checks.**

1. **degenerate.** The zero automorphic source has zero image.
2. **non-example.** A kernel element of the comparison source is not a nonzero canonical coherent class.
3. **compatibility.** In end degrees the cusp image agrees with interior cohomology by Harris’s comparison, without asserting it equals all canonical cohomology.

**Uses.** CG20 Theorem 5.5: States chamber vanishing only for the tempered L² image.; IC.8 boundary localization: Uses cusp/interior comparison after eliminating the relevant boundary groups.

**Check.** The notation must say whether cusp, L² or tempered images are intended.

<a id="coherent-isotypic-contribution"></a>
### Isotypic contribution to coherent cohomology

`AutomorphicBundlesPartII:coherent-isotypic-contribution` — definition.

For an irreducible finite-adelic representation π_f in the discrete automorphic source, define its degree-i coherent contribution as the image of its multiplicity space tensored with H^i(p^−,K_h;π_∞⊗V)⊗π_f in the specified coherent image. Say π contributes when this image is nonzero. At a finite level replace π_f by π_f^K. A spectral isotypic multiplicity is counted explicitly; it is not silently set to one.

**Build.** 1. Decompose the discrete source with its actual multiplicity spaces. 2. Apply relative cohomology on each admissible coefficient summand and the coherent comparison map. 3. Define contribution using its image and prove the finite-level invariant formula under characteristic-zero descent.

**Inputs.** [Cuspidal, L² and tempered image subspaces](#automorphic-image-subspaces), `AutomorphicSpectralTheory:AS.4`, `SmoothRepresentationsOfLocalGroups:SR.3`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 5.5, p. 828; Theorem 5.6, p. 829; BCGP21 Theorem 3.10.1, p. 236.

**API outline.**

- `coherent-isotypic-contribution.finite_level` (compatibility): The finite-level contribution has π_f^K in place of π_f.
- `coherent-isotypic-contribution.multiplicity` (projection): Retain the spectral multiplicity space in every summand.
- `coherent-isotypic-contribution.nonzero` (characterisation): Contribution is equivalent to nonzero image, not merely occurrence in the spectral decomposition.

- `coherent-isotypic-contribution.comparison_kernel` (characterisation): Its image is the source summand divided by the actual comparison kernel; the dimension equals the source dimension only if that restriction is injective.
- `coherent-isotypic-contribution.level_functor` (functoriality): Finite-level maps and Hecke operators preserve the contribution and its multiplicity space through the same spectral comparison.

**Definition checks.**

1. **degenerate.** If π_f^K=0 the finite-level contribution is zero.
2. **computation.** A one-dimensional relative cohomology and multiplicity m give m copies of π_f^K before any comparison kernel.
3. **non-example.** A spectral summand with zero relative cohomology in degree i has zero degree-i contribution.

**Uses.** CG20 Theorem 5.6: Constrains archimedean parameters of a contributing π.; BCGP21 Corollary 3.10.5: Counts one-factor nonholomorphic choices with automorphic multiplicities.

**Check.** A representation present in L² with zero relative cohomology does not contribute.

<a id="W-V-comparison"></a>
### Algebraic and analytic coefficient conventions

`AutomorphicBundlesPartII:W-V-comparison` — comparison.

For GSp₄, W_(a,b;c)≃V_(−b,−a;a+b+2c) as Hecke-linearized coefficient bundles over C, with the declared finite-adelic central transport. Changing the central parameter preserves the underlying holomorphic bundle but not its full Hecke linearization. The comparison is made on G(R)×G(A_f) with the correcting central factor; the naive compact-dual G(Q)-equivariant multiplication by ν(g)⁻¹ is not valid without this correction.

**Build.** 1. Compute the rank-two standard and determinant coefficients from the de Rham homology sequence. 2. Compare the highest weights on the compact dual. 3. Insert the finite-adelic norm/sign factor that corrects the rational central action, and verify the Hecke cocycle.

**Inputs.** [The Siegel weight dictionary](#siegel-weight-dictionary), [GAGA and the coherent tower](#gaga-and-tower-comparison), `AutomorphicBundles:B2/coefficient-tensor-hecke`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Definition 5.3 and Lemma 5.4, pp. 826–827.

**Check.** The underlying trivial central twist may have nontrivial Hecke action; test a central rational scalar.

<a id="holomorphic-cusp-eigensystems"></a>
### Holomorphic cusp eigensystems

`AutomorphicBundlesPartII:holomorphic-cusp-eigensystems` — theorem.

For Ω^(k,r)=ω(k+r,r), k≥0 and r≥2 over C, subcanonical H⁰ is the multiplicity-counted sum of cuspidal finite-adelic representations with holomorphic discrete-series or holomorphic-limit archimedean factor. In P20’s coordinates the factor has parameter (1−k−r,2−r;k+2r). A simultaneous unramified Hecke eigencharacter determines a cuspidal automorphic summand after choosing a nonzero spectral projection; it need not determine a unique global representation before multiplicity-one input. In Scholze’s symplectic/unitary scalar-weight setting, with k>n in the totally real symplectic case and k≥n in the CM unitary case of Corollary V.1.7, the Petersson adjoint relation makes the commuting spherical Hecke image a product of copies of C.

**Build.** 1. Identify holomorphic cusp functions with subcanonical sections by the degree-zero cusp comparison. 2. Use the spectral decomposition with the holomorphic archimedean coefficient and its multiplicity. 3. For scalar weights use the positive Petersson pairing, closure of adjoints in the Hecke algebra and simultaneous diagonalization; project an eigencharacter to a cuspidal summand.

**Inputs.** [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution), [Algebraic and analytic coefficient conventions](#W-V-comparison), `AutomorphicSpectralTheory:AS.4`, `AutomorphicFormsOnReductiveGroups:AF.4/bhr-large-weight`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §5.3, pp. 24–25; CG20 proof of Proposition 6.8, p. 839; Sch15 Corollary V.1.7, manuscript p. 83 (published pp. 1035–1036).

**Check.** The r=2 limit case uses the same holomorphic cusp dictionary, and no global multiplicity-one conclusion is inferred merely from an eigenform.

**Atlas planet:** Holomorphic cusp-form dictionary.

<a id="coherent-kunneth"></a>
### Products and relative-cohomology degree counts

`AutomorphicBundlesPartII:coherent-kunneth` — theorem.

For the finite product of archimedean pairs of Res_(F/Q)GSp₄ and tensor-product coefficient V, relative cohomology of a discrete automorphic tensor factor decomposes by the Künneth sum over tuples of nonnegative degrees with total i. When each local factor has a single one-dimensional coherent group in degree 0 or 1, the global degree-i multiplicity counts exactly those i-element subsets of the degree-one choices. Retain full compact-group component actions before taking invariants.

**Build.** 1. Identify the product relative cochain complex with the tensor product of the local complexes over C. 2. Apply the field Künneth theorem and the imported local coherent-degree calculation. 3. Take the actual compact component-group invariants; record any missing full-group calculation as a gap.

**Inputs.** `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`, `AutomorphicFormsOnReductiveGroups:AF.4/bhr-coherent-cohomology`, [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution).

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Theorem 3.10.1, pp. 239–240.

**Check.** For d factors with two packet choices each, degree one counts d local changes only when the component-group constraints permit all those changes.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- AutomorphicBundles:B3: Integral canonical/subcanonical coefficient extensions on the supplied PEL charts, and their generic comparison with the existing characteristic-zero extension; no second generic extension construction is planned here.
- SmoothRepresentationsOfLocalGroups:SR.3: Admissible finite-adelic representations and finite-level invariant spaces with finite multiplicity.
- AutomorphicSpectralTheory:AS.4: Multiplicity-counted discrete cusp/L² spectral decomposition and Petersson adjoint relations for commuting spherical Hecke operators; no unproved multiplicity-one simplification.
- AutomorphicSpectralTheory:AS.5: Growth Dolbeault analytic inputs, regularization C∞_umg→C∞_dmg for the parabolic pair, finite-central-character functor Fin_J acyclicity and the relative cohomology spectral sequences in Su24 §5, with Hecke equivariance.
- AutomorphicBundlesPartII/G-Harris: H90 Theorem 2.7 and Proposition 2.7.2, pp. 58–59, now verify the cusp/interior comparison directly, with the growth resolution in Theorem 2.4.4, p. 57. H90 Theorem 3.4, p. 63, does not justify arbitrary other-degree vanishing: GK19 Remark 10.1.3, p. 962, records a published correction. Use AF.4’s specified Hodge-pair and component conventions. The singular large-weight classification is the separate AF.4/bhr-large-weight contract, reported by P20 Theorem 15.2.2.1 and BCGP21 Theorem 3.10.1; its original BHR proof remains uninspected. H90 Theorem 3.6.3, p. 64, has a regular all-root bound and cannot replace that singular-wall input. Verify full-group transport before applying concentration or packet counts.

<a id="ic7"></a>
## IC.7. Siegel chambers and singular weights

Use closed coherent chambers with their wall overlaps, the ρ shift and spin-transfer infinitesimal characters. Import the archimedean coherent realization from AF.4, and derive tempered-image degree restrictions and large singular-weight interior descriptions. State the holomorphic–generic packet pairing conditionally on the exact global classification, purity, local packet and multiplicity inputs.

<a id="siegel-chambers"></a>
### The four Siegel coherent chambers

`AutomorphicBundlesPartII:siegel-chambers` — definition.

For an infinitesimal-character pair (x,y), define C₀ by x≥y≥0, C₁ by x≥−y≥0, C₂ by −y≥x≥0 and C₃ by −y≥−x≥0. Walls belong to every chamber whose weak inequalities they satisfy. For ω(a,b) the relevant pair is (a−1,b−2). Keep the central coordinate separate. These are closed chambers used for coherent-degree tests, not a disjoint partition on singular weights.

**Build.** 1. Write the four rank-two Weyl chamber inequalities using the fixed positive-root convention. 2. Substitute the ρ shift for the W/V coefficient dictionary. 3. Prove wall overlaps and identify the regular interior chamber.

**Inputs.** [Algebraic and analytic coefficient conventions](#W-V-comparison), `AutomorphicFormsOnReductiveGroups:AF.4/harris-limits-gsp2g`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, Theorem 5.5 and its chamber display, p. 828.

**API outline.**

- `siegel-chambers.membership` (characterisation): Expose the two inequalities for each chamber.
- `siegel-chambers.shifted_weight` (compatibility): Use (a−1,b−2), not the unshifted pair (a,b), for ω(a,b).
- `siegel-chambers.wall_overlap` (relation): The intersection of C₀ and C₁ contains precisely x≥0,y=0 on that common wall.

- `siegel-chambers.inequality_congruence` (extensionality): Replacing coordinates by equal integers preserves chamber membership; each predicate is the conjunction of its two displayed inequalities.
- `siegel-chambers.wall_specialization` (compatibility): For a≥2, the shifted weights of ω(a,2) and ω(a,3−a) lie on the respective C₀/C₁ and C₁/C₂ common walls; retain both memberships.

**Definition checks.**

1. **computation.** (2,1) lies in C₀, (2,−1) in C₁, (1,−2) in C₂ and (−1,−2) in C₃.
2. **degenerate.** (0,0) lies in all four chambers.
3. **non-example.** (2,0) lies in both C₀ and C₁, so assigning a unique chamber to every weight is false.

**Uses.** CG20 Theorem 5.5: Bounds the degree of tempered coherent contributions.; CG20 Corollary 5.8: Locates the singular families after the ρ shift.

**Check.** On y=0 and x>0, both C₀ and C₁ hold.

**Atlas planet:** Siegel coherent chambers.

<a id="infinitesimal-character"></a>
### Infinitesimal characters and Kostant representatives

`AutomorphicBundlesPartII:infinitesimal-character` — theorem.

For a contributing GSp₄ representation in coefficient W_(a,b;c), write w=−(a+b+2c). Its archimedean infinitesimal character is (a−1,b−2;−w). In the general Siegel notation, for dominant Levi κ and w in C(κ), ν+ρ=−w⁻¹w₀,M(κ+ρ); regularity makes w unique. The generic Harris theorem identifying the corresponding nondegenerate limit of discrete series and degree ℓ(w) is imported from AF.4, including its compact-group hypotheses.

**Build.** 1. Apply the coefficient/Harish–Chandra shift to the declared W/V coordinates. 2. Identify the dominant Weyl representative using the imported root datum and Kostant convention. 3. Use AF.4’s coherent realization in degree ℓ(w), with the full-group comparison still requested where absent.

**Inputs.** [The four Siegel coherent chambers](#siegel-chambers), `AutomorphicFormsOnReductiveGroups:AF.4/harris-limits-gsp2g`, [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.6(1), p. 829; BP26 §1.3.3 and Theorem 1.3.8, pp. 3–4.

**Check.** For normalized coefficients w=a+b−6, the central infinitesimal character is 6−a−b.

**Atlas planet:** Coherent infinitesimal character.

<a id="GL4-archimedean-transfer"></a>
### The GL₄ archimedean parameter

`AutomorphicBundlesPartII:GL4-archimedean-transfer` — comparison.

With the preceding w convention, the GL₄ transfer has infinitesimal-character entries ((a+b−3−w)/2,(a−b+1−w)/2,(−a+b−1−w)/2,(−a−b+3−w)/2). For the arithmetic normalization w=a+b−6 this is (0,−(b−2),−(a−1),−(a+b−3))+(3/2,3/2,3/2,3/2), as a Weyl orbit. This identifies the spin-transfer normalization; it does not prove existence of the global transfer.

**Build.** 1. Evaluate the four spin weights on the GSp₄ Harish–Chandra parameter. 2. Apply the central shift with the chosen normalization. 3. Compare the multisets and ordering through the Weyl action.

**Inputs.** [Infinitesimal characters and Kostant representatives](#infinitesimal-character), [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action), `ModularityAndLanglandsExtensions:ML.4`, `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.6(2), p. 829; Remark 5.12, p. 834.

**Check.** For a=4,b=2 the normalized entries are the multiset {3/2,3/2,−3/2,−3/2}; switching Frobenius convention must be accompanied by the corresponding dual shift.

<a id="tempered-chamber-vanishing"></a>
### Tempered coherent chamber vanishing

`AutomorphicBundlesPartII:tempered-chamber-vanishing` — theorem.

The tempered L²-image part of H^i_can(X_C,ω(a,b)) is zero unless (a−1,b−2;c) lies in C_i with the central coordinate ignored by the chamber inequalities. A tempered archimedean contributor is the discrete-series or limit representation π((a−1,b−2;−w),C_i). This constrains the tempered image, and does not assert the vanishing of arbitrary canonical coherent cohomology. This degree restriction uses the fixed Siegel Hodge pair and its specified extension across components, as in AF.4/bhr-large-weight; it is conditional on that full-group transport and is not deduced from the general other-degree vanishing assertion in H90 Theorem 3.4.

**Build.** 1. Use the discrete L² decomposition and the imported local tempered coherent-cohomology calculation. 2. Use the chamber condition to select the possible coherent degree. 3. Apply the comparison map to obtain image vanishing; carry compact components as required by AF.4.

**Inputs.** [The four Siegel coherent chambers](#siegel-chambers), [Infinitesimal characters and Kostant representatives](#infinitesimal-character), [Cuspidal, L² and tempered image subspaces](#automorphic-image-subspaces), `AutomorphicFormsOnReductiveGroups:AF.4/bhr-coherent-cohomology`, `AutomorphicFormsOnReductiveGroups:AF.4/harris-limits-gsp2g`, `AutomorphicFormsOnReductiveGroups:AF.4/bhr-large-weight`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Theorem 5.5 and Theorem 5.6(3), pp. 828–829; [GK19](https://link.springer.com/article/10.1007/s00222-019-00882-5), Remark 10.1.3, p. 962.

**Check.** At a singular wall more than one degree can occur; tempered image is not replaced by the full coherent group. Keep the Hodge-pair/full-group hypothesis: the published general other-degree vanishing claim is not an unconditional substitute.

**Atlas planet:** Tempered chamber vanishing.

<a id="singular-char0-ranges"></a>
### Characteristic-zero singular-weight ranges

`AutomorphicBundlesPartII:singular-char0-ranges` — theorem.

For the essentially tempered L²-image in characteristic zero, the limit families (a,2), a≥2; (a,3−a), a≥2; and (1,b), b≤1 have possible degrees given by their closed chamber memberships. Thus (a,2) allows degrees 0 and 1, while (a,3−a) allows degrees 1 and 2. The family (1,b), b≤1, allows degrees 2 and 3. Serre duality exchanges the first and third families. Any claim for full subcanonical or interior groups needs the corresponding cusp/interior or non-Eisenstein argument.

**Build.** 1. Substitute the shifted weights into all four closed-chamber predicates. 2. Retain all chambers containing a wall point. 3. Translate through Serre duality and retain the specified automorphic image.

**Inputs.** [Tempered coherent chamber vanishing](#tempered-chamber-vanishing), [Serre duality and the dual Siegel weight](#siegel-serre-dual-weight).

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), §5.3, discussion after Theorem 5.6, p. 830.

**Check.** At (a,b)=(2,1), the shifted pair (1,−1) belongs to C₁ and C₂, as the full family predicts.

<a id="large-singular-interior"></a>
### Large singular-weight interior decomposition

`AutomorphicBundlesPartII:large-singular-interior` — theorem.

For the Siegel threefold, choose R from the AF.4/bhr-large-weight singular classification and let k≥R−1 with parameter λ₁=−k−1<0, c=k+4. The interior H⁰ and H¹ for Ω^(k,2) decompose into holomorphic and generic archimedean-limit contributions, respectively, with their actual cuspidal multiplicities. The local one-dimensionality in these two degrees is imported from AF.4; the large-weight bound is −λ₁≥R. The full compact-group convention must be verified before asserting vanishing in every other degree.

**Build.** 1. Use the AF.4 singular large-weight contract as reported in P20 Theorem 15.2.2.1; retain −λ₁≥R. H90’s regular all-root criterion is not this result. 2. Use Harris’s interior comparison and the local holomorphic/generic one-dimensional groups. 3. Keep the spectral multiplicity and compact component actions; only assert the two checked degrees.

**Inputs.** [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Products and relative-cohomology degree counts](#coherent-kunneth), `AutomorphicFormsOnReductiveGroups:AF.4/bhr-coherent-cohomology`, `AutomorphicFormsOnReductiveGroups:AF.4/bhr-large-weight`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §15.2.2.1–15.2.3.1, p. 108.

**Check.** The inequality λ₁≥R with λ₁<0 is not accepted for positive R.

**Atlas planet:** Large singular-weight decomposition.

<a id="conditional-packet-pairing"></a>
### Conditional holomorphic–generic packet pairing

`AutomorphicBundlesPartII:conditional-packet-pairing` — theorem.

Assume the precise classical-group global classification, local packet description, multiplicity formula, Galois compatibility and purity statements requested from ML.4. A non-Eisenstein degree-four system excludes the reducible endoscopic/CAP character systems in CG20’s classification list. For the Siegel weights (a,2), a≥2, the remaining general-type packet pairs the holomorphic and generic archimedean limits with the same finite part and equal cuspidal multiplicities (one in the multiplicity-one case), subject to its component-group conditions. This is conditional, and no assertion that every local factor of every global packet is tempered is made.

**Build.** 1. Use the classification and compatible Galois representations to eliminate the systems whose spin Galois representation is reducible. 2. Apply purity and the archimedean local packet description to the surviving general-type system. 3. Evaluate the actual component-group multiplicity formula for the two archimedean choices; apply multiplicity one only under its stated hypotheses.

**Inputs.** [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization), [Characteristic-zero singular-weight ranges](#singular-char0-ranges), [Products and relative-cohomology degree counts](#coherent-kunneth), `ModularityAndLanglandsExtensions:ML.4`, `AutomorphicGaloisRepresentations:R19.3`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Proposition 15.2.4.1, pp. 109–110; CG20 §7.2, pp. 854–855.

**Check.** The conclusion remains labeled conditional until the exact classification package and full-group archimedean input are supplied.

**Atlas planet:** Holomorphic–generic packet pairing.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- SmoothRepresentationsOfLocalGroups:SR.4: Exact normalized Satake restriction of the degree-four spin polynomial to the Klingen boundary Levi, including all q-powers and the character χ in ρ₂⊕ρ₂χ. Compare the corrected four monomials; abstract Satake alone does not fix normalization.
- ModularityAndLanglandsExtensions:ML.4: Conditional GSp₄ global classification list, archimedean local packets and component-group multiplicity formula as used in CG20 pp. 854–855/P20 §15.2.4; compatible reducible Galois systems for excluded types, purity and the exact general-type multiplicity-one/pairing statement.
- AutomorphicGaloisRepresentations:R19.3: Purity and compatible-system input for the conditional classification step excluding non-general-type GSp₄ systems.
- AutomorphicBundlesPartII/G-Harris: H90 Theorem 2.7 and Proposition 2.7.2, pp. 58–59, now verify the cusp/interior comparison directly, with the growth resolution in Theorem 2.4.4, p. 57. H90 Theorem 3.4, p. 63, does not justify arbitrary other-degree vanishing: GK19 Remark 10.1.3, p. 962, records a published correction. Use AF.4’s specified Hodge-pair and component conventions. The singular large-weight classification is the separate AF.4/bhr-large-weight contract, reported by P20 Theorem 15.2.2.1 and BCGP21 Theorem 3.10.1; its original BHR proof remains uninspected. H90 Theorem 3.6.3, p. 64, has a regular all-root bound and cannot replace that singular-wall input. Verify full-group transport before applying concentration or packet counts.

<a id="ic8"></a>
## IC.8. Boundary localization and cuspidal decomposition

Specialize the Q boundary nerve calculation and prove all-degree non-Eisenstein boundary vanishing there. Separately compute totally real degree-zero boundary vanishing through coefficient pushforward and normalized Satake factorization. Deduce localized subcanonical/interior comparisons only in justified degrees. Obtain multiplicity-counted cuspidal injections and large-gap equalities; under conditional packet pairing, prove dim H¹=l₀ dim H⁰.

<a id="boundary-nerve-specialization"></a>
### The Siegel boundary nerve calculation

`AutomorphicBundlesPartII:boundary-nerve-specialization` — theorem.

For the GSp₄/Q toroidal boundary in characteristic zero, specialize the Harris–Zucker nerve spectral sequence E₁^(r,s)=⊕_(rank(R)=r+1)H^s(Z(R),F|Z(R))⇒H^(r+s)(D,F|D). Its adelic E₁ terms are parabolically induced from products of lower-rank coherent cohomology and cohomology of the associated Levi locally symmetric spaces, with the finite component corrections and Kostant shifts of HZ01 (3.2.8)–Corollary 3.2.9. Use this geometry only for the Q case; the HZ hypotheses used here do not automatically extend to Res_(F/Q)GSp₄ for F≠Q.

**Build.** 1. Use the finite closed cover of the boundary by maximal-parabolic strata and its alternating restriction complex. 2. Specialize the HZ induced-term formula, including Δ₀,R and Δ₁,R corrections. 3. Identify the GL₂ and GL₁ factors controlling the unramified Hecke eigensystems; the general nerve-to-Levi input is requested from AF.2/C5.

**Inputs.** [GAGA and the coherent tower](#gaga-and-tower-comparison), `ShimuraCompactifications:C5`, `AutomorphicFormsOnReductiveGroups:AF.2`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source.** [HZ01](https://numdam.org/item/MSMF_2001_2_85__1_0/), §3.2, (3.2.4)–(3.2.8) and Corollary 3.2.9, pp. 62–63; CG20 Lemma 7.10 proof, pp. 852–853.

**Check.** No all-degree totally real boundary vanishing is inferred from this Q-specific specialization.

**Atlas planet:** Boundary nerve spectral sequence.

<a id="Q-boundary-localized-vanishing"></a>
### Non-Eisenstein boundary vanishing over Q

`AutomorphicBundlesPartII:Q-boundary-localized-vanishing` — theorem.

For the Siegel threefold over Q and a non-Eisenstein residual maximal ideal in the normalized degree-four Hecke convention, H^i(D_C,ω(a,b)|D)_m=0 for every i, for any dominant (a,b) with its canonical coefficient at a neat prime-to-p level, as stated immediately before CG20 Lemma 7.10. The boundary nerve terms give only reducible four-dimensional residual polynomial systems built from GL₂/GL₁ data, contradicting the absolutely irreducible witness. Consequently H^i_sub→H^i_can is an isomorphism at m in every degree.

**Build.** 1. Compute the Hecke polynomial on every boundary E₁ term from its parabolic Levi factors. 2. Use the compatible GL₂/GL₁ Galois systems and Frobenius recognition to show residual reducibility. 3. Localize the nerve spectral sequence and then the boundary ideal long exact sequence.

**Inputs.** [The Siegel boundary nerve calculation](#boundary-nerve-specialization), [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization), `ArithmeticGaloisRepresentations:R01.5`, `AutomorphicGaloisRepresentations:R19.1`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Lemma 7.10 and proof, pp. 852–853.

**Check.** The all-degree isomorphism uses all-degree boundary vanishing, rather than just its H⁰ case.

**Atlas planet:** Non-Eisenstein boundary vanishing.

<a id="Q-boundary-phi-calculation"></a>
### The genus-two boundary Φ calculation

`AutomorphicBundlesPartII:Q-boundary-phi-calculation` — comparison.

For Ω^(k,2) on a characteristic-zero Siegel toroidal compactification, push its boundary restriction to the compactified modular-curve boundary. For k>0 this is the elliptic coefficient ω^(k+2)(−cusps); for k=0 it is ω² without the cusp twist. In P20’s normalized Hecke convention the claimed boundary identity is T_(ℓ,2)=2T_ℓ. The geometric coefficient pushforward and this exact vector-weight Hecke normalization must be verified separately; the latter remains a primary-source gap in this packet.

**Build.** 1. Use the boundary Fourier–Jacobi constant term and identify the compactified elliptic coefficient. 2. Distinguish the k=0 constant-term case from k>0. 3. Compute the Hecke pull–trace on the boundary or verify a source with exactly this vector-valued normalization; Freitag IV Satz 4.4 was not available for inspection.

**Inputs.** [The Siegel weight dictionary](#siegel-weight-dictionary), [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action), `ShimuraCompactifications:C5`, `AutomorphicBundles:B5/hecke-convolution`.

**Source.** [P20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Proof of Corollary 15.2.3.1, pp. 108–109.

**Check.** At k=0 a cusp twist is not silently added, and the factor 2 is not presumed invertible modulo p.

<a id="hilbert-boundary-degree-zero"></a>
### Degree-zero Hilbert–Siegel boundary vanishing

`AutomorphicBundlesPartII:hilbert-boundary-degree-zero` — theorem.

Let F be totally real, p totally split, K=K^p∏_(v|p)K_v with K^p neat and K_v hyperspecial, paramodular, Siegel parahoric, Klingen parahoric or Iwahori (BCGP21 Definition 3.3.3, pp. 204–205), κ=(k_v,l_v)_v with k_v≥l_v≥2 and k_v≡l_v mod 2, and normalized central diamond |·|². For a non-Eisenstein residual ideal, H⁰(D_C,ω_κ|D)_m=0. Decompose the minimal boundary into zero-dimensional and Hilbert modular pieces. The point contribution vanishes for nonparallel weights; the curve-type contribution vanishes unless the l_v are parallel, then has Hilbert weight (k_v). In the parallel scalar case use π_*O_D=O_∂ via π_*I_D=I_∂ and R¹π_*I_D=0. No positive-degree boundary vanishing is asserted.

**Build.** 1. Compute the boundary coefficient pushforward by Fourier–Jacobi expansion, using the exact characteristic-zero weight restriction. 2. Handle the scalar parallel case with the projection formula and the boundary ideal exact sequence. 3. Use the boundary Satake reducibility statement to eliminate every residual eigensystem at m.

**Inputs.** [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing), [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization), [The boundary Satake polynomial factorization](#boundary-Satake-reducibility), `ShimuraCompactifications:C5`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Lemma 3.10.7 and Remark 3.10.6, pp. 237–239; BR16 Theorem 1.12 and Proposition 1.14, pp. 10–12.

**Check.** The output is H⁰ boundary vanishing over C; it does not supply integral or all-degree vanishing.

**Atlas planet:** Hilbert–Siegel boundary vanishing.

<a id="boundary-Satake-reducibility"></a>
### The boundary Satake polynomial factorization

`AutomorphicBundlesPartII:boundary-Satake-reducibility` — theorem.

On a Hilbert modular boundary component, the normalized degree-four spherical Hecke polynomial factors as the characteristic polynomial of ρ₂⊕(ρ₂⊗χ), for the appropriate boundary two-dimensional Galois representation and normalized character χ; include the Eisenstein decomposition into characters when the Hilbert form is Eisenstein. The four spin monomials must be distinct: diag(1,1,ϖ,ϖ), diag(1,ϖ,1,ϖ), diag(ϖ,1,ϖ,1), diag(ϖ,ϖ,1,1). Exact q-powers and χ are determined by the SR.4 normalization comparison, recorded as a request, before invoking the factorization. Absolute irreducibility of the residual degree-four witness contradicts this full-polynomial equality by Chebotarev and Brauer–Nesbitt; a trace identity alone is not substituted in small characteristic.

**Build.** 1. Compute the Satake restriction to the Klingen Levi with the corrected four monomials. 2. Match the lower-rank Hecke polynomial and central character, including normalized q-powers, to the Galois direct sum. 3. Compare full characteristic polynomials on a dense Frobenius set and use semisimple recognition after residue-field extension.

**Inputs.** [Geometric Hecke generators and the spin polynomial](#hecke-polynomial-dictionary), `SmoothRepresentationsOfLocalGroups:SR.4`, `AutomorphicGaloisRepresentations:R19.2`, `ArithmeticGaloisRepresentations:R01.5`.

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Lemma 3.10.7, pp. 238–239; P20 pp. 108–109.

**Check.** No division by 2 is used, and a repeated Satake monomial in the display is corrected before the comparison.

<a id="localized-degree-zero-one"></a>
### Localized degrees zero and one

`AutomorphicBundlesPartII:localized-degree-zero-one` — theorem.

In the totally real setting of hilbert-boundary-degree-zero, H⁰_sub→H⁰_can is an isomorphism after localization, and H¹_sub→H¹_can is injective with image H̄¹. Thus H^i_sub,m≃H̄^i_m for i=0,1. This does not identify H¹_sub,m with all H¹_can,m. For the Q case, all-degree boundary vanishing gives H^i_sub,m≃H^i_can,m in every degree. Apply these statements also to P20’s large Ω^(k,2) range with the corrected localized H¹ notation.

**Build.** 1. Localize the long exact sequence for 0→F_sub→F_can→F|D→0. 2. Use only the vanishing degrees actually proved; at H¹ the missing H¹(D) remains on the right. 3. Identify the injection image with the defining interior image and compose with the automorphic comparison.

**Inputs.** [Degree-zero Hilbert–Siegel boundary vanishing](#hilbert-boundary-degree-zero), [Non-Eisenstein boundary vanishing over Q](#Q-boundary-localized-vanishing), [Interior coherent cohomology and towers](#interior-cohomology), [Congruence localization of complex coherent cohomology](#complex-hecke-localization).

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Proof of Theorem 3.10.1, p. 239; P20 Corollary 15.2.3.1 and proof, pp. 108–109.

**Check.** A nonzero H¹ boundary class is consistent with the totally real conclusion; surjectivity onto all H¹_can is not inferred.

<a id="Q-singular-cuspidal-exhaustion"></a>
### Cuspidal exhaustion for all rational singular weights

`AutomorphicBundlesPartII:Q-singular-cuspidal-exhaustion` — theorem.

For GSp₄/Q, weight (a,2) with a≥2, neat prime-to-p level and a non-Eisenstein residual ideal, assume the exact classification, purity, full-group local coherent calculation and packet multiplicity hypotheses of conditional-packet-pairing. In degrees j=0,1, localized interior cohomology is exactly the multiplicity-counted cuspidal sum with the holomorphic (j=0) or generic (j=1) archimedean limit and the same finite level and residual congruence. Boundary vanishing identifies this with localized subcanonical cohomology. No large-weight lower bound on a is required for this conditional rational result.

**Build.** 1. Place interior cohomology between the injective cusp image and the L² relative-cohomology source. 2. Exclude nongeneral-type L² contributions with the residual Galois witness; purity makes the remaining archimedean factor essentially tempered, and Wallach makes the global representation cuspidal. 3. The same cuspidal sum bounds both sides. Use the full compact-group degree calculation and actual multiplicity spaces to identify degrees zero and one.

**Inputs.** [Non-Eisenstein boundary vanishing over Q](#Q-boundary-localized-vanishing), [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Tempered coherent chamber vanishing](#tempered-chamber-vanishing), [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing), `AutomorphicFormsOnReductiveGroups:AF.4/bhr-coherent-cohomology`.

**Source.** [CG20](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Theorem 7.11, pp. 854–855, using Theorem 5.2 and Theorem 5.6.

**Check.** The conditional conclusion includes a=2; do not replace it by the separate large-weight theorem.

<a id="localized-cuspidal-decomposition"></a>
### Localized coherent cohomology and cuspidal representations

`AutomorphicBundlesPartII:localized-cuspidal-decomposition` — theorem.

Under BCGP21’s totally real hypotheses and non-Eisenstein localization, for i=0,1 there is a Hecke-equivariant injection from the multiplicity-counted sum of π_f^K into H^i_sub(X_C,ω_κ)_m, where π is cuspidal, congruent to m, holomorphic at real v with l_v>2 and nonholomorphic at exactly i places among those with l_v=2. For degree zero the holomorphic cusp dictionary gives equality. For degrees zero and one, the large-gap assumptions k_v−l_v>R and either l_v=2 or l_v>R give equality with the stated cuspidal sum. Multiplicity-free indexing additionally uses the conditional classification package; no unconditional multiplicity-one statement is claimed.

**Build.** 1. Use the cusp→interior comparison and the localized subcanonical/interior identification. 2. Apply local coherent-degree calculations and Künneth with finite-level invariant spaces. 3. Use the precise large-weight comparison for surjectivity, preserving multiplicity spaces until the separate classification input is imposed.

**Inputs.** [Localized degrees zero and one](#localized-degree-zero-one), [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Products and relative-cohomology degree counts](#coherent-kunneth), [Large singular-weight interior decomposition](#large-singular-interior), [Congruence localization of complex coherent cohomology](#complex-hecke-localization).

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Theorem 3.10.1 and Remark 3.10.4, pp. 236–237; proof pp. 239–240.

**Check.** The right-hand coefficient level, central character and residual congruence are fixed throughout; degree-one equality requires the large-gap assumptions.

**Atlas planet:** Localized cuspidal decomposition.

<a id="coherent-dimension-equality"></a>
### Conditional coherent dimension equality

`AutomorphicBundlesPartII:coherent-dimension-equality` — theorem.

Assume the large-gap hypotheses of localized-cuspidal-decomposition and the conditional general-type packet pairing/multiplicity formula. Let l₀ be the number of real places with l_v=2. Then dim_C H¹_sub(X_C,ω_κ)_m=l₀·dim_C H⁰_sub(X_C,ω_κ)_m. Independently, over Q the conditional all-weight exhaustion and packet pairing give h¹=h⁰ for every a≥2 in weight (a,2), with no large-gap hypothesis, at neat prime-to-p level and non-Eisenstein localization. The factor l₀ counts permitted single archimedean changes within each packet with the same finite part.

**Build.** 1. Group the multiplicity-counted cuspidal summands by their finite part and global parameter. 2. Use the conditional packet formula to pair holomorphic with each permitted single generic archimedean change. 3. Multiply the equal finite-level dimensions by l₀ and sum over the residual congruence summand.

**Inputs.** [Localized coherent cohomology and cuspidal representations](#localized-cuspidal-decomposition), [Cuspidal exhaustion for all rational singular weights](#Q-singular-cuspidal-exhaustion), [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing), [Products and relative-cohomology degree counts](#coherent-kunneth).

**Source.** [BCGP21](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf), Corollary 3.10.5, p. 237; CG20 proof of Theorem 7.11, pp. 854–855; P20 Proposition 15.2.4.1, pp. 109–110.

**Check.** If l₀=0 the formula predicts zero degree-one cohomology under the same large-weight and classification hypotheses.

**Atlas planet:** Coherent dimension equality.

**Layer coverage:** planned; every implementation status is unchecked. Outstanding interfaces and verification obligations:

- ShimuraCompactifications:C5: Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models.
- SmoothRepresentationsOfLocalGroups:SR.2: Parabolic induction and the boundary Levi modules in the Q Harris–Zucker nerve terms, retaining component corrections.
- SmoothRepresentationsOfLocalGroups:SR.4: Exact normalized Satake restriction of the degree-four spin polynomial to the Klingen boundary Levi, including all q-powers and the character χ in ρ₂⊕ρ₂χ. Compare the corrected four monomials; abstract Satake alone does not fix normalization.
- AutomorphicFormsOnReductiveGroups:AF.2: General boundary nerve-to-parabolic-induction and lower-rank coherent/Lie cohomology interface used by HZ01 Corollary 3.2.9; keep the Q and component-group hypotheses.
- ArithmeticGaloisRepresentations:R01.5: Chebotarev and Brauer–Nesbitt recognition from full Frobenius characteristic polynomials after coefficient extension, valid in the residual characteristic including p=2.
- AutomorphicGaloisRepresentations:R19.1: GL₂/Q cusp and Eisenstein Galois polynomial systems used to recognize Q boundary eigensystems as reducible degree-four systems.
- AutomorphicGaloisRepresentations:R19.2: Hilbert modular cusp/Eisenstein Galois polynomial systems, including their normalized central characters, for the totally real boundary calculation.
- AutomorphicBundlesPartII/G-models: There is no HilbertSiegelModularVarieties supplier in the current atlas. The genus-two Res_(F/Q)GSp₄ models, EO strata, their affine images and codimension/regular-sequence properties must be supplied, together with the G₁ quotient direct-factor statement under p∤#Δ(K^p). H1’s Hilbert modular varieties have genus one and do not supply these inputs. C13/C14 supply the stated Siegel models over Q only.
- AutomorphicBundlesPartII/G-Harris: H90 Theorem 2.7 and Proposition 2.7.2, pp. 58–59, now verify the cusp/interior comparison directly, with the growth resolution in Theorem 2.4.4, p. 57. H90 Theorem 3.4, p. 63, does not justify arbitrary other-degree vanishing: GK19 Remark 10.1.3, p. 962, records a published correction. Use AF.4’s specified Hodge-pair and component conventions. The singular large-weight classification is the separate AF.4/bhr-large-weight contract, reported by P20 Theorem 15.2.2.1 and BCGP21 Theorem 3.10.1; its original BHR proof remains uninspected. H90 Theorem 3.6.3, p. 64, has a regular all-root bound and cannot replace that singular-wall input. Verify full-group transport before applying concentration or packet counts.
- AutomorphicBundlesPartII/G-Phi: P20 p. 109 cites Freitag IV Satz 4.4 for T_(ℓ,2)=2T_ℓ on the boundary. Freitag was not available for inspection, and coverage of the vector-valued coefficient and this normalization is unverified. Give a direct boundary correspondence calculation or inspect a cleared primary source; do not infer the residual contradiction by dividing this trace identity by 2. The full Satake-polynomial route is requested independently.

## Worked comparisons and endpoint checks

**Finite coefficient duality and reduction.** For the trivial Δ-torsor over Spec O and coefficient O, the cochain model is Aₙ[Δ] in degree zero, with the regular deck action. Its Aₙ-linear dual has the inverse deck action and identifies with the Matlis-dual chain model using x↦x/ϖⁿ. Derived coinvariants give Aₙ in degree zero. This test simultaneously checks the group ring, the dual action and the downstairs coefficient. In contrast, the trivial Fₚ[Cₚ]-module Fₚ has higher Tor; substituting its ordinary coinvariants for derived descent discards information. In the Hochschild–Serre edge sequence the possible Tor₂(H₀) contribution must remain until an actual vanishing theorem removes it.

For another reduction check, take the two-term O-complex O→O in cohomological degrees 0 and 1 with differential multiplication by ϖ. Its H⁰ is zero and H¹ is k. Derived reduction to k has zero differential, hence H⁰=k as well as H¹=k. Thus H⁰(C)⊗k→H⁰(C⊗ᴸk) is not an isomorphism. The coherent base-change theorem is a theorem about derived complexes, not an automatic termwise statement about cohomology modules.

**Small weights at the endpoint.** Set p=7 and (a,b)=(4,2). The hypotheses a≥3 and 2≤a−b≤p−2 hold, giving subcanonical vanishing above degree two. Since a+b=6, the second range applies at its lower endpoint and gives vanishing above degree one. The third range does not apply because b<4. The dual weight is (1,−1). The shifted characteristic is (3,0), lying in both C₀ and C₁, and the normalized scalar exponent a+b−6 is zero. The GL₄ transfer has entries {3/2,3/2,−3/2,−3/2}. These checks keep the mod-p theorem, characteristic-zero chamber statement and arithmetic normalization distinct.

The explicit Lan–Suh substitutions can be used to discharge the integer-range proof step. For the length-one weight choose t=max(1,b,ceil((a+b−2)/2)), α=t−b, β=a−2−t. For length two choose t=max(1,b−1), α=a−3−t, β=1+t−b. For length three choose t=b−3, α=a−b, β=0. In the respective displayed ranges, verify α≥β≥0, t>0 and α+β<p−3. The first two have α+β=a−b−2; the third has α+β=a−b. The exact smallness and logarithmic lifting assumptions remain supplier obligations; solving the arithmetic does not prove the integral BGG theorem.

**Chamber walls.** For (a,2) with a≥2 the shifted pair is (a−1,0), so C₀ and C₁ both hold, and C₂,C₃ fail. For (a,3−a) with a≥2 it is (a−1,1−a), so C₁ and C₂ both hold, including a=2. There is no extra C₀ contribution at that endpoint. The origin belongs to all four closed chambers. A definition that assigns a unique chamber to every singular parameter fails these tests.

**Boundary exactness and packet counts.** Localizing the long exact sequence of 0→F_sub→F_can→F|D→0 after proving only H⁰(D,F|D)_m=0 gives an H⁰ isomorphism and an H¹ injection. Its image is H̄¹_m; H¹(D,F|D)_m can still obstruct surjectivity. Over Q the all-degree boundary theorem removes that obstruction in every degree. The all-weight Q cuspidal exhaustion and dimension equality are conditional on the exact packet/classification input and include a=2; they do not rely on the separate large-weight theorem.

For a totally real field with two real places, suppose both weights have l_v=2 and satisfy the required large gaps, and impose the exact conditional general-type packet formula. Each finite part has one holomorphic choice contributing to H⁰ and two permitted single generic changes contributing to H¹. With equal multiplicities this gives h¹=2h⁰. If exactly one l_v is 2 and the other is >R, the count is h¹=h⁰. This counts permitted global packet members, not a formal tensor-product dimension without component-group constraints.

## Supplier interfaces

Fine prerequisite nodes in the targets above are imports. The following stage-level requests specify the additional interface where a finer accepted node does not yet settle the need. A request can confirm an already planned interface; it does not authorize replanning its owner’s theory.

1. **`AutomorphicBundles:B0`.** Import the associated-bundle functor, tensor/dual/base-change and local-frame API. Generic Scheme.Modules vector bundle operations are already owned by current upstream AlgebraicVectorBundles L0A–L0C; this is an import, not new work here. Consumers: [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients).
2. **`AutomorphicBundles:B3`.** Integral canonical/subcanonical coefficient extensions on the supplied PEL charts, and their generic comparison with the existing characteristic-zero extension; no second generic extension construction is planned here. Consumers: [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), [The canonical-extension growth resolution](#growth-dolbeault-comparison).
3. **`AutomorphicBundles:B4`.** Highest-weight, determinant and logarithmic canonical-bundle identifications with the exact GSp₄ central coordinates used by CG20 and BP26. Consumers: [The Siegel weight dictionary](#siegel-weight-dictionary), [Serre duality and the dual Siegel weight](#siegel-serre-dual-weight).
4. **`SchemeAndStackFoundations:SF.2`.** Coefficient-linear/derived cohomology comparison with the existing abelian-sheaf H^i, including scalar action and naturality of degree-zero sections; existing smooth-proper duality is imported by its fine node. Consumers: [Integral coherent cohomology complexes](#coherent-cohomology-complexes).
5. **`ComplexComparisonPartII:C2`.** Projective coherent GAGA with every-degree cohomology comparison and naturality for pullback, proper pushforward and boundary coefficient maps. Consumers: [GAGA and the coherent tower](#gaga-and-tower-comparison).
6. **`ComplexComparisonPartII:C3`.** Proper coherent GAGA when the chosen toroidal model is proper without a projectivity assumption; comparison of the coherent duality counit and Hecke traces. Consumers: [GAGA and the coherent tower](#gaga-and-tower-comparison).
7. **`ShimuraCompactifications:C4`.** Logarithmic Hodge sequence, polarization/dual semi-abelian extension and formal boundary charts on the smooth toroidal integral model. Consumers: [The integral de Rham Levi torsor](#integral-graded-frame-torsor), [Formally canonical and subcanonical coefficients](#formally-canonical-coefficients).
8. **`ShimuraCompactifications:C5`.** Toroidal cohomology/fan independence, coherent Hecke correspondences with boundary pullback, and toroidal-to-minimal geometry. Extend with the exact Q-boundary nerve and totally real boundary coefficient calculations needed here; the missing Hilbert–Siegel model itself is G-models. Consumers: [The integral de Rham Levi torsor](#integral-graded-frame-torsor), [Coherent Hecke operators in every degree](#coherent-hecke-action), [GAGA and the coherent tower](#gaga-and-tower-comparison), [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing), [The EO Cousin computation](#eo-cousin-computation), [The Siegel boundary nerve calculation](#boundary-nerve-specialization), [The genus-two boundary Φ calculation](#Q-boundary-phi-calculation), [Degree-zero Hilbert–Siegel boundary vanishing](#hilbert-boundary-degree-zero).
9. **`ShimuraCompactificationsPartII:C13`.** Use the existing all-genus deep Siegel toroidal model target and its polarized logarithmic Hodge data; do not construct these integral models in this roadmap. Consumers: [The integral de Rham Levi torsor](#integral-graded-frame-torsor), [Rational isogeny transport of weight sheaves](#rational-isogeny-transport), [Formally canonical and subcanonical coefficients](#formally-canonical-coefficients).
10. **`ShimuraCompactificationsPartII:C14`.** Use the compactified Klingen/paramodular p-correspondences and Cartier boundary; verify precisely the formal canonical coefficient criterion required for Lan relative vanishing. Consumers: [Integral divisibility and rational p-operators](#integral-normalization), [Formally canonical and subcanonical coefficients](#formally-canonical-coefficients), [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing).
11. **`LanglandsParameterStacks:LP3`.** Integral Weyl/dual-Weyl modules, the right-B-equivariant function realization with left translation, and allowed base change. The current Tau Ceti Young-symmetrizer construction over Q-algebras does not supply integral dual-Weyl lattices. Consumers: [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients), [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).
12. **`SchemeAndStackFoundations:SF.1`.** Finite étale torsor descent, affine quasi-coherent module descent and projectivity/flatness descent; apply Nakajima’s affine coefficient projectivity without dividing by the group order. Consumers: [Étale Galois projectivity](#galois-projectivity).
13. **`SchemeAndStackFoundations:SF.4`.** Proper formal functions and pseudo-coherent derived p-adic completion, with correspondence and trace compatibility. The separate solid comparison is G-solid. Consumers: [Derived formal completion of coherent coefficients](#formal-completion-comparison), [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations).
14. **`SmoothRepresentationsOfLocalGroups:SR.0`.** Smooth tower action and exact finite-deck invariants in characteristic zero; no integral invariant exactness when p divides the deck order. Consumers: [GAGA and the coherent tower](#gaga-and-tower-comparison).
15. **`SmoothRepresentationsOfLocalGroups:SR.1`.** Integral Hecke convolution and opposite-algebra conventions; apply to the actual geometric coherent correspondence operators. Consumers: [Étale Galois projectivity](#galois-projectivity), [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations).
16. **`SmoothRepresentationsOfLocalGroups:SR.2`.** Parabolic induction and the boundary Levi modules in the Q Harris–Zucker nerve terms, retaining component corrections. Consumers: [The Siegel boundary nerve calculation](#boundary-nerve-specialization).
17. **`SmoothRepresentationsOfLocalGroups:SR.3`.** Admissible finite-adelic representations and finite-level invariant spaces with finite multiplicity. Consumers: [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution).
18. **`SmoothRepresentationsOfLocalGroups:SR.4`.** Exact normalized Satake restriction of the degree-four spin polynomial to the Klingen boundary Levi, including all q-powers and the character χ in ρ₂⊕ρ₂χ. Compare the corrected four monomials; abstract Satake alone does not fix normalization. Consumers: [Geometric Hecke generators and the spin polynomial](#hecke-polynomial-dictionary), [The GL₄ archimedean parameter](#GL4-archimedean-transfer), [The boundary Satake polynomial factorization](#boundary-Satake-reducibility).
19. **`IntegralHeckeAndGaloisDeterminants:IHG.2`.** Finite Hecke image in derived endomorphisms, commuting local factors and their coefficient/base-change compatibility; strict chain-level action is not requested. Consumers: [Localized coherent perfect complexes](#localized-perfect-model), [Congruence localization of complex coherent cohomology](#complex-hecke-localization).
20. **`IntegralHeckeAndGaloisDeterminants:IHG.3`.** Import current upstream §3a–3b’s GSp₄ spin polynomial, Galois-type/non-Eisenstein predicate and residual twist/dual polynomial transport. Atlas stage prose is older; identify the current upstream targets rather than duplicate them here. Consumers: [Geometric Hecke generators and the spin polynomial](#hecke-polynomial-dictionary), [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization).
21. **`DeformationAndDerivedPatchingAlgebra:P7`.** General nilpotent lifting criterion used by CG18 Lemmas 7.5–7.6, including infinite free rank, and the hyper-Tor/derived tensor spectral sequence with its five-term edge maps. Generic perfect objects, duals and retracts are already imported through finer nodes. Consumers: [Integral Čech freeness](#integral-cech-freeness), [Derived coefficient change and deck descent](#coefficient-descent).
22. **`DerivedDeRhamCohomology:DD.6`.** Extend the logarithmic comparison direction with the coefficient logarithmic Deligne–Illusie splitting used by Lan–Suh: W₂ lift, Cartier type, nilpotent residues, dimension/p and small-weight conditions, and the integral dual BGG graded decomposition. Ordinary de Rham comparison does not supply this theorem. Consumers: [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).
23. **`CrystallineCohomology:CR.5`.** Provide the logarithmic crystalline/de Rham coefficient comparison and W₂ logarithmic lift inputs underlying Lan–Suh Theorem 7.22 and Corollary 7.24; retain the residue and dimension restrictions. Consumers: [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights).
24. **`AutomorphicSpectralTheory:AS.4`.** Multiplicity-counted discrete cusp/L² spectral decomposition and Petersson adjoint relations for commuting spherical Hecke operators; no unproved multiplicity-one simplification. Consumers: [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Cuspidal, L² and tempered image subspaces](#automorphic-image-subspaces), [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution), [Holomorphic cusp eigensystems](#holomorphic-cusp-eigensystems).
25. **`AutomorphicSpectralTheory:AS.5`.** Growth Dolbeault analytic inputs, regularization C∞_umg→C∞_dmg for the parabolic pair, finite-central-character functor Fin_J acyclicity and the relative cohomology spectral sequences in Su24 §5, with Hecke equivariance. Consumers: [The canonical-extension growth resolution](#growth-dolbeault-comparison), [Su’s automorphic comparison](#su-canonical-comparison).
26. **`AutomorphicFormsOnReductiveGroups:AF.2`.** General boundary nerve-to-parabolic-induction and lower-rank coherent/Lie cohomology interface used by HZ01 Corollary 3.2.9; keep the Q and component-group hypotheses. Consumers: [The Siegel boundary nerve calculation](#boundary-nerve-specialization).
27. **`ModularityAndLanglandsExtensions:ML.0`.** Registry for ν⁻³, central scalars, geometric Frobenius ε(Frob_v)=q_v⁻¹ and reciprocal spin-polynomial conventions. Consumers: [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action).
28. **`ModularityAndLanglandsExtensions:ML.4`.** Conditional GSp₄ global classification list, archimedean local packets and component-group multiplicity formula as used in CG20 pp. 854–855/P20 §15.2.4; compatible reducible Galois systems for excluded types, purity and the exact general-type multiplicity-one/pairing statement. Consumers: [The GL₄ archimedean parameter](#GL4-archimedean-transfer), [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing).
29. **`ArithmeticGaloisRepresentations:R01.1`.** Continuous residual representation and scalar-extension/semisimplification API; retain symplectic form/multiplier when required. Consumers: [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization).
30. **`ArithmeticGaloisRepresentations:R01.5`.** Chebotarev and Brauer–Nesbitt recognition from full Frobenius characteristic polynomials after coefficient extension, valid in the residual characteristic including p=2. Consumers: [Non-Eisenstein boundary vanishing over Q](#Q-boundary-localized-vanishing), [The boundary Satake polynomial factorization](#boundary-Satake-reducibility).
31. **`AutomorphicGaloisRepresentations:R19.1`.** GL₂/Q cusp and Eisenstein Galois polynomial systems used to recognize Q boundary eigensystems as reducible degree-four systems. Consumers: [Non-Eisenstein boundary vanishing over Q](#Q-boundary-localized-vanishing).
32. **`AutomorphicGaloisRepresentations:R19.2`.** Hilbert modular cusp/Eisenstein Galois polynomial systems, including their normalized central characters, for the totally real boundary calculation. Consumers: [The boundary Satake polynomial factorization](#boundary-Satake-reducibility).
33. **`AutomorphicGaloisRepresentations:R19.3`.** Purity and compatible-system input for the conditional classification step excluding non-general-type GSp₄ systems. Consumers: [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing).

## Gaps and ownership changes

### G-solid: Solid/discrete six operations and filtered coherence

The proposed AnalyticStacks and SolidAnalyticRings owners are absent from the atlas, new-roadmap directory and reserved ids. Supply a stable solid O-module six-operation package, discrete embedding/upper-shriek comparison and natural filtered support functors with BC/projection-formula coherence before claiming the BP26 solid statements. Ordinary coherent proper duality is imported from SF.2 and remains the executable discrete route. No nonexistent supplier stage is cited.

Affected targets: [Cohomological correspondences](#coherent-correspondence), [Composition of cohomological correspondences](#correspondence-composition), [Base change for cohomological correspondences](#correspondence-base-change), [Equivariance of the completion and compact-support filtration](#filtered-correspondence-action), [Derived formal completion of coherent coefficients](#formal-completion-comparison).

### G-models: Hilbert–Siegel geometry and quotient descent

There is no HilbertSiegelModularVarieties supplier in the current atlas. The genus-two Res_(F/Q)GSp₄ models, EO strata, their affine images and codimension/regular-sequence properties must be supplied, together with the G₁ quotient direct-factor statement under p∤#Δ(K^p). H1’s Hilbert modular varieties have genus one and do not supply these inputs. C13/C14 supply the stated Siegel models over Q only.

Affected targets: [The EO Cousin computation](#eo-cousin-computation), [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations), [Degree-zero Hilbert–Siegel boundary vanishing](#hilbert-boundary-degree-zero).

### G-boundary-regular: Boundary regularity on EO thickenings

BCGP21 Lemma 3.9.12 uses injectivity after inverting a boundary equation. Check that each relevant EO component meets the interior and prove the boundary equation is regular on every cofinal CM regular-sequence quotient. The source proof does not spell out this geometric input; dimension alone is not a proof for an arbitrary thickening.

Affected targets: [Injecting the Cousin complex into the interior](#boundary-interior-injection), [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations).

### G-Harris: Full-group coherent comparison and singular large-weight input

H90 Theorem 2.7 and Proposition 2.7.2, pp. 58–59, now verify the cusp/interior comparison directly, with the growth resolution in Theorem 2.4.4, p. 57. H90 Theorem 3.4, p. 63, does not justify arbitrary other-degree vanishing: GK19 Remark 10.1.3, p. 962, records a published correction. Use AF.4’s specified Hodge-pair and component conventions. The singular large-weight classification is the separate AF.4/bhr-large-weight contract, reported by P20 Theorem 15.2.2.1 and BCGP21 Theorem 3.10.1; its original BHR proof remains uninspected. H90 Theorem 3.6.3, p. 64, has a regular all-root bound and cannot replace that singular-wall input. Verify full-group transport before applying concentration or packet counts.

Affected targets: [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison), [Products and relative-cohomology degree counts](#coherent-kunneth), [Large singular-weight interior decomposition](#large-singular-interior), [Cuspidal exhaustion for all rational singular weights](#Q-singular-cuspidal-exhaustion), [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing), [Localized coherent cohomology and cuspidal representations](#localized-cuspidal-decomposition), [Tempered coherent chamber vanishing](#tempered-chamber-vanishing).

### G-Phi: Vector-weight boundary Hecke normalization

P20 p. 109 cites Freitag IV Satz 4.4 for T_(ℓ,2)=2T_ℓ on the boundary. Freitag was not available for inspection, and coverage of the vector-valued coefficient and this normalization is unverified. Give a direct boundary correspondence calculation or inspect a cleared primary source; do not infer the residual contradiction by dividing this trace identity by 2. The full Satake-polynomial route is requested independently.

Affected targets: [The genus-two boundary Φ calculation](#Q-boundary-phi-calculation), [The boundary Satake polynomial factorization](#boundary-Satake-reducibility).

### G-formal-models: Formal-canonical condition at quotient and bad level

Verify Lan17 Definition 8.5 chart by chart for the C14 Klingen/paramodular model and the G₁ quotient. A deck group free on the open variety need not be free on the boundary; retain the prime-to-p stabilizer condition or prove local exact descent. Lan17 Remark 8.9 allows singular fans by refinement, but does not remove these coefficient/model hypotheses.

Affected targets: [Formally canonical and subcanonical coefficients](#formally-canonical-coefficients), [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing), [Large parallel twists and reduction of sections](#large-parallel-twist).

The following ownership proposals are recorded for the maintainer; no supplier file is edited here.

- The solid analytic six-operation and stable filtered-support prerequisites proposed by BP26 have no owner registered in this atlas. Register a separate Analytic stacks/solid coherent operations direction for the generic stable six operations and discrete comparison. IC.3 owns only the coefficient-correspondence applications and their coherent/Hecke comparisons; retain G-solid until that owner exists.
- Genus-two Hilbert–Siegel models and EO geometry over totally real fields are not supplied by the genus-one Hilbert roadmap or by the Q Siegel C13–C14 layers. Add a Hilbert–Siegel moduli and compactification continuation, supplying the Res_(F/Q)GSp₄/G₁ models, EO geometric inputs and boundary charts. IC.5 and IC.8 import that geometry and own the coherent calculations. Do not manufacture an unregistered stage id.
- The logarithmic coefficient splitting and integral dual BGG theorem required by Lan–Suh are stronger than the current general comparison descriptions. Extend the logarithmic de Rham/crystalline direction, as a Part II if needed, with the exact Lan–Suh coefficient, lifting, residue and small-weight hypotheses. IC.5 owns only the GSp₄ arithmetic specialization.

## Source versions and corrections

All mathematical statements and source findings here are paraphrases, with locators in the version actually read. Public author manuscripts were checked directly. P20 and Sch15 were read only from the maintainer-cleared local library; no source file or extracted passage is included. P20’s author manuscript was not collated with the Duke version of record. Findings against that manuscript are scoped to it. Harris’s chapter and Freitag’s book were not inspected and are named verification gaps, rather than sources silently treated as read.

- **CG18.** F. Calegari and D. Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf). Invent. Math. 211 (2018), 297–433; author PDF, 137 pages. Read: §7.2, pp. 395–401 (PDF pp. 99–105).
- **CG20.** F. Calegari and D. Geraghty, [Minimal modularity lifting for non-regular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), 801–896; author PDF, 96 pages. Read: §5.3, pp. 822–831; §5.5, pp. 833–834; §6.1–6.2, pp. 836, 839; §7.2, pp. 851–855; Appendix A.3.2, pp. 886–888.
- **P20.** V. Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; cleared author manuscript, 17 June 2019, 113 pages. Locators below use manuscript pagination.. Read: §4.3, p. 19; §5.3, pp. 24–25; §6.2.2, p. 30; §14.8–14.9, pp. 101–105; §15.2, pp. 108–110.
- **BP26.** G. Boxer and V. Pilloni, [Higher Hida theory for Siegel modular forms](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf). Invent. Math. 244 (2026), 45–141; author manuscript dated 5 November 2025, 65 pages; locators use manuscript pages. Read: §1.1, p. 2; §1.3.3–1.3.8, pp. 3–4; §2.1.7–2.1.22, pp. 7–9; §2.2.9 and §2.3.12, pp. 14, 17; §2.6–2.7, pp. 21–24; §2.9.1–2.9.9, pp. 27–29; §4.3.1, pp. 46–47; §5.6, p. 58.
- **BCGP21.** G. Boxer, F. Calegari, T. Gee and V. Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publ. Math. IHÉS 134 (2021), 153–501; publisher PDF; locators use printed pagination. Read: §3.9, pp. 226–232; §3.10, pp. 236–240.
- **Sch15.** P. Scholze, [On torsion in the cohomology of locally symmetric varieties](https://www.math.uni-bonn.de/people/scholze/Torsion.pdf). Ann. of Math. 182 (2015), 945–1066; cleared arXiv manuscript uses chapter V and Corollary V.1.7, p. 83; published §5.1, pp. 1035–1036. Read: Corollary V.1.7 and its proof, manuscript p. 83; published Corollary 5.1.7 and preceding paragraph, pp. 1035–1036.
- **Su24.** J. Su, [Coherent cohomology of Shimura varieties and automorphic forms](https://arxiv.org/abs/1810.12056). Ann. Sci. ENS 57 (2024), 1039–1099; arXiv:1810.12056v2, 29 July 2024; locators use preprint pages. Read: §1.1–1.1.2, pp. 6–10; Propositions 3.14 and 3.16, pp. 36–38; Proposition 4.1, p. 38; §5, Lemmas 5.1–5.5 and Theorem 5.7, pp. 54–55.
- **Lan17.** K.-W. Lan, [Integral models of toroidal compactifications with projective cone decompositions](https://www.kwlan.org/articles/cpt-ram-nbl.pdf). Int. Math. Res. Not. 2017, no. 11, 3237–3280; corrected author manuscript, 35 pages; published errata inspected. Read: §7, Propositions 7.5 and 7.15, manuscript pp. 28–32; Definition 8.5, Theorem 8.6 and Remarks 8.9–8.10, manuscript pp. 34–35.
- **LanSuh.** K.-W. Lan and J. Suh, [Vanishing theorems for torsion automorphic sheaves on general PEL-type Shimura varieties](https://www.kwlan.org/articles/van-tor-aut-gen.pdf). Adv. Math. 242 (2013), 228–286; author manuscript, 57 pages. Read: §7.2–7.4, Propositions 7.16–7.21, Theorem 7.22 and Corollaries 7.23–7.25, manuscript pp. 40–44.
- **HZ01.** M. Harris and S. Zucker, [Boundary cohomology of Shimura varieties, III: coherent cohomology on higher-rank boundary strata and applications to Hodge theory](https://numdam.org/item/MSMF_2001_2_85__1_0/). Mém. Soc. Math. France (N.S.) 85 (2001); doi:10.24033/msmf.398. Read: §3.2, equations (3.2.1)–(3.2.8) and Corollary 3.2.9, pp. 61–63.
- **BR16.** R. Brasca and G. Rosso, [Eigenvarieties for non-cuspidal modular forms over certain PEL Shimura varieties](https://arxiv.org/abs/1605.05065v1). arXiv:1605.05065v1, 17 May 2016; Proposition 1.14 is numbered 1.5.8 in the version cited by BCGP21. Read: Definition 1.9, Theorem 1.12 and Proposition 1.14, manuscript pp. 9–12.
- **Lan17err.** K.-W. Lan, [Errata to Integral models of toroidal compactifications with projective cone decompositions](https://www.kwlan.org/articles/cpt-ram-nbl-err.pdf). Author’s one-page published errata, linked from the author publication list. Read: Items (1)–(3), p. 1.
- **LanSuhErr.** K.-W. Lan and J. Suh, [Errata to Vanishing theorems for torsion automorphic sheaves on general PEL-type Shimura varieties](https://www.kwlan.org/articles/van-tor-aut-gen-err.pdf). Authors’ two-page published errata, linked from the author publication list. Read: Items (1)–(9), pp. 1–2.

- **H90.** M. Harris, [Automorphic forms and the cohomology of vector bundles on Shimura varieties](https://www.jmilne.org/math/Books/AA1988b.pdf). Automorphic Forms, Shimura Varieties, and L-functions II, Perspectives in Mathematics 11 (1990), pp. 41–91; public scan hosted by J. S. Milne; printed pagination. Read: Proposition 2.2 and §§2.3–2.7, pp. 53–59; §§3.0–3.6, pp. 59–64.
- **GK19.** W. Goldring and J.-S. Koskivirta, [Strata Hasse invariants, Hecke algebras and Galois representations](https://link.springer.com/article/10.1007/s00222-019-00882-5). Invent. Math. 217 (2019), 887–984; published open-access PDF; printed pagination. Read: Theorem 10.1.2, Remark 10.1.3 and Corollary 10.1.4, pp. 962–963.

Lan’s corrected author manuscript incorporates the published errata: finite étale group-scheme descent must precede averaging, and the Koecher assertion has its dimension-one exception. Lan–Suh’s published errata distinguish the symplectic dual at p=2, weaken an asserted square-trivial line bundle to torsion, and correct several §8 vanishing intervals. IC.5 uses the p>2 Corollary 7.24 specialization, not an uncorrected general §8 bound. The reader and packet retain the following additional findings for independent verification; they are not advertised as newly discovered corrections.

- **AutomorphicBundlesPartII/E1 (error), CG18 §7.2, p. 400.** The trace is presented as an isomorphism from the whole shifted dualizing cohomology complex to the coefficient ring. Correction: Use the trace counit RΓ(ω)[d]→A_n; only an appropriate top-cohomology trace can be an isomorphism under connectedness hypotheses. Check: A positive-genus proper curve has additional cohomology in the shifted complex. Affects: a stated result. **Independent verdict: confirmed.** On printed p. 400 the whole dualizing cohomology complex is identified with the trace target. A smooth proper positive-genus curve has extra cohomology, so the counit rather than a whole-complex isomorphism is needed.
- **AutomorphicBundlesPartII/E2 (misprint), CG20 Theorem 5.5 and chamber display, p. 828.** The parameter is assigned twice and the final chamber is labeled with an index outside the four-degree range. Correction: Use μ=(a−1,b−2;c) for the chamber and labels C₀,C₁,C₂,C₃. Check: The four displayed inequalities correspond to degrees 0 through 3 on a threefold. Affects: nothing. **Independent verdict: confirmed.** Theorem 5.5 reuses λ for its shifted parameter and its fourth chamber label repeats C₄; the four inequalities fix μ and C₀ through C₃.
- **AutomorphicBundlesPartII/E3 (error), CG20 §5.3, central-coordinate discussion, p. 826.** The proposed compact-dual comparison uses a central similitude factor as though it were G(Q)-equivariant. Correction: Correct the adelic central action with its finite norm/sign factor; identify underlying bundles separately from their Hecke linearizations. Check: A rational central scalar changes the proposed factor, so equivariance fails on the compact dual alone. Affects: the proof. **Independent verdict: confirmed.** For q∈G(Q) the real multiplier alone is not invariant. The sign and finite adelic norm restore the product-formula identity; the underlying bundle identification is separate.
- **AutomorphicBundlesPartII/E4 (misprint), BP26 §4.3.1, p. 46.** The stated left-translation formula reverses the variable and acting element. Correction: Use (m′f)(m)=f(m′⁻¹m). Check: This formula obeys the left action law and preserves the stated right B-equivariance; the printed order does not. Affects: nothing. **Independent verdict: confirmed.** The displayed right-B function model requires left translation by m′⁻¹m; the printed argument reverses the two variables.
- **AutomorphicBundlesPartII/E5 (misprint), BP26 proof of Proposition 2.9.9, p. 29.** The later explanatory chain in the proof uses j_* where the completion-triangle construction needs j!, and writes inverse-image open immersions with codomain X instead of C. The initial triangle display has the correct j! term. Correction: Retain j! throughout that completion-triangle chain and the appropriate adjunctions, and place inverse-image opens in C. The ordinary local-cohomology triangle with Rj_* is a distinct triangle. Check: BP26 §2.9.1 supplies two triangles; Proposition 2.9.9 is acting on the completion/compact-support one. Affects: nothing. **Independent verdict: confirmed.** Narrowed to the later explanatory chain and open codomains. The initial triangle is already correct; the two localization triangles in §2.9.1 must remain distinct.
- **AutomorphicBundlesPartII/E6 (gap), BCGP21 Lemma 3.9.12, p. 230.** Boundary localization is asserted injective for the Cousin terms without a complete check of boundary regularity on the chosen thickenings. Correction: Prove non-containment of relevant EO components in the boundary and regularity on every CM regular-sequence quotient. Check: Localization is injective only when the boundary equation is a non-zero-divisor on those modules. Affects: the proof. **Independent verdict: rejected.** The short proof refers to the preceding regular-sequence description. An omitted formalization detail does not establish a published proof gap. Retain G-boundary-regular as a verification obligation until the actual EO geometry is supplied.
- **AutomorphicBundlesPartII/E7 (misprint), BCGP21 proof of Lemma 3.10.7, p. 238.** The four-term Satake display repeats diagonal monomials. Correction: Use diag(1,1,ϖ,ϖ), diag(1,ϖ,1,ϖ), diag(ϖ,1,ϖ,1), diag(ϖ,ϖ,1,1). Check: The four spin weights are distinct; repeating a weight loses part of the degree-four parameter. Affects: the proof. **Independent verdict: confirmed.** The four spin monomials require the four distinct diagonal representatives stated in the correction; the duplicated printed entries cannot list these four weights.
- **AutomorphicBundlesPartII/E8 (misprint), P20 §5.3, p. 24.** The first coordinate of the holomorphic parameter has the sign of the determinant weight reversed. Correction: For Ω^(k,r), use (1−k−r,2−r;k+2r). Check: Its shifted highest weight must match ω(k+r,r) under the W/V dictionary. Affects: nothing. **Independent verdict: confirmed.** Substitution of λ₁=−k−r+1 into the holomorphic parameter gives 1−k−r; the opposite sign conflicts with the conventions on the same page.
- **AutomorphicBundlesPartII/E9 (misprint), P20 §5.3, p. 25, coefficient target of the Hecke map.** The upper-shriek target in the coefficient correspondence is written with the structure sheaf. Correction: Use p₁!Ω^(k,r) for the coefficient target. Check: The morphism must act on the weight sheaf whose cohomology defines the operator. Affects: nothing. **Independent verdict: confirmed.** A coefficient correspondence has target p₁! of its target coefficient, not of the structure sheaf; the preceding correspondence convention fixes this type.
- **AutomorphicBundlesPartII/E10 (misprint), P20 §15.2.2.1, p. 108.** The large-weight inequality is written for λ₁ with the wrong sign although λ₁ is negative. Correction: Use −λ₁≥R, equivalently k≥R−1. Check: Here k=−λ₁−1, so the printed inequality has the opposite direction of large weight. Affects: nothing. **Independent verdict: confirmed.** With k=−λ₁−1, the large-positive-k range is −λ₁≥R. The following theorem uses exactly k≥R−1.
- **AutomorphicBundlesPartII/E11 (misprint), P20 Corollary 15.2.3.1, p. 108.** The degree-one cohomology group lacks the residual localization applied in the argument. Correction: Put the subscript m on H¹ as well as on the degree-zero group. Check: The boundary vanishing and cuspidal congruence restriction only hold on that residual summand. Affects: a stated result. **Independent verdict: confirmed.** The H¹ summands are restricted to characters congruent to m, while the left hand side omits the localization subscript. Add it as for H⁰.
- **AutomorphicBundlesPartII/E12 (misprint), P20 proof of Corollary 15.2.3.1, p. 109.** The exceptional boundary coefficient is assigned to the wrong value of k. Correction: The untwisted ω² exception occurs at k=0; for k>0 use ω^(k+2)(−cusps). Check: At zero symmetric-power weight the constant-term contribution survives. Affects: nothing. **Independent verdict: confirmed.** The preceding pushforward formula distinguishes k=0; the later parenthetical k=2 contradicts that formula.
- **AutomorphicBundlesPartII/E13 (misprint), P20 proof of Corollary 15.2.3.1, pp. 108–109.** A three-term segment of the boundary long exact sequence is called short exact, although no endpoint zeros are displayed. Correction: Use its long exact sequence; H⁰ boundary vanishing gives H⁰ isomorphism and H¹ injection into the canonical group. Check: The proof needs exactness at the middle term to obtain an H¹ injection after H⁰ boundary vanishing; it does not need either endpoint to vanish. Affects: nothing. **Independent verdict: confirmed.** Confirmed as a label misprint, not a substantive proof error. The displayed three terms are a long-exact-sequence segment and suffice for the injection the proof requests.
- **AutomorphicBundlesPartII/E14 (misprint), P20 Proposition 15.2.4.1, p. 109.** The sign of λ₁ in the standing singular-weight hypothesis conflicts with the preceding parametrization. Correction: Keep λ₁<0 as in §15.2.2–15.2.3. Check: The associated k=−λ₁−1 is a nonnegative symmetric-power weight. Affects: nothing. **Independent verdict: confirmed.** The large-k range and λ₁=−k−1 require negative λ₁; the proposition reverses this sign.
- **AutomorphicBundlesPartII/E15 (gap), P20 proof of Corollary 15.2.3.1, p. 109.** The boundary Hecke relation is justified by a source whose coverage of these vector-valued coefficients and normalizations was not established. Correction: Inspect the exact source or give a direct normalized boundary-correspondence calculation; use the full Satake factorization for the residual contradiction. Check: A scalar-weight citation or a trace factor of 2 does not settle the vector-weight or characteristic-2 polynomial comparison. Affects: the proof. **Independent verdict: rejected.** Freitag IV Satz 4.4 was not inspected, so its failure to cover vector weights has not been established. Keep G-Phi and a full normalized characteristic-polynomial comparison; an unverified citation is not itself a proven source error.
- **AutomorphicBundlesPartII/E-Lan17 (error), Lan17 Lemma 8.1 and Theorem 8.7; published errata items (1)–(3), p. 1.** The original argument treats a finite étale commutative group scheme as a constant group and omits descent; the Koecher assertion misses a dimension-one boundary exception. Correction: Use the corrected author manuscript: descend before averaging over the finite étale prime-to-p group scheme, and retain the exception when the dimension is one and the indicated minimal-boundary complement is nonempty. Check: The author’s published correction supplies these hypotheses. Theorem 8.6 remains the relative-vanishing input used here. Affects: the proof. **Independent verdict: confirmed.** The author’s one-page errata explicitly repairs finite étale group-scheme descent and the dimension-one Koecher exception; the corrected manuscript and retained conditions are required.
- **AutomorphicBundlesPartII/E-LanSuh (error), LanSuh §6.2, Proposition 7.2 and §8; published errata items (3), (5)–(9), pp. 1–2.** The original text conflates a symplectic dual at p=2, overstates a torsion line-bundle bound and gives some general vanishing degrees without the required shifted weights. Correction: Use p>2 for the symplectic specialization; retain only torsion in the indicated Picard-group statement. For the general §8 bounds use both shifted weights and their two-sided degree interval, and require the stated representation-small and cohomological conditions. Check: These are the authors’ published corrections. The present threefold calculation uses the corrected Corollary 7.24 specialization, not the uncorrected general §8 degree assertion. Affects: a stated result. **Independent verdict: confirmed.** The author’s two-page errata requires the corrected symplectic-dual restrictions, torsion Picard statement and shifted two-sided §8 bounds; the p>2 specialization retains those corrections.

- **AutomorphicBundlesPartII/E-Harris90 (error), Theorem 3.4(i), printed p. 63; corrected by GK19 Remark 10.1.3, printed p. 962.** The general coherent-cohomology theorem asserts vanishing outside its distinguished degree. Correction: Retain the one-dimensional distinguished contribution; verify other degrees with the exact group and relative pair. Check: Goldring–Koskivirta give a GL₂ obstruction and restrict the general concentration assertion. **Independent verdict: confirmed.** Published correction: Goldring–Koskivirta, Invent. Math. 217 (2019), Remark 10.1.3, p. 962; also recorded by the AF.4 supplier.

## Routed coverage ledger

The ledger accounts for each input item once. Several source items belong to a single target, and generic inputs remain owned by its explicit prerequisites. Item identifiers are routing keys, not theorem names.

| Routed source | Item | Target |
| --- | --- | --- |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-setup` | [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients) |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-homology` | [Coherent homology over a DVR](#coherent-homology) |
| PAPER-CALEGARI-GERAGHTY-18 | `nakajima-cech-complex` | [The equivariant Čech model](#equivariant-cech) |
| PAPER-CALEGARI-GERAGHTY-18 | `nakajima-lemma-1` | [Étale Galois projectivity](#galois-projectivity) |
| PAPER-CALEGARI-GERAGHTY-18 | `lemma-7-7` | [Integral Čech freeness](#integral-cech-freeness) |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-perfect-complex-C-n` | [Perfect models for coherent cohomology and homology](#equivariant-perfect-model) |
| PAPER-CALEGARI-GERAGHTY-18 | `lan-automorphic-bundle-hecke-iso` | [Rational isogeny transport of weight sheaves](#rational-isogeny-transport) |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-hecke-operator-T-gamma` | [Coherent Hecke operators in every degree](#coherent-hecke-action) |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-hecke-derived-lift` | [Homotopy classes of coherent Hecke chain lifts](#chain-lifts) |
| PAPER-CALEGARI-GERAGHTY-18 | `coherent-localized-complex` | [Localized coherent perfect complexes](#localized-perfect-model) |
| PAPER-CALEGARI-GERAGHTY-20 | `ext-lan-suh-vanishing` | [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights) |
| PAPER-CALEGARI-GERAGHTY-20 | `lan-suh-weight-sets-gsp4` | [Lan–Suh’s small-weight specialization for GSp₄](#lan-suh-gsp4-weights) |
| PAPER-CALEGARI-GERAGHTY-20 | `lan-suh-automorphic-bundles` | [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients) |
| PAPER-CALEGARI-GERAGHTY-20 | `W-can-is-omega` | [The Siegel weight dictionary](#siegel-weight-dictionary) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-1-1` | [Vanishing above degree two](#vanishing-above-two) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-1-2` | [Vanishing above degree one](#vanishing-above-one) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-1-3` | [Positive-degree vanishing](#positive-degree-vanishing) |
| PAPER-CALEGARI-GERAGHTY-20 | `interior-cohomology-and-limits` | [Interior coherent cohomology and towers](#interior-cohomology) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-2-harris-diagram` | [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-2-1` | [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-2-2` | [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison) |
| PAPER-CALEGARI-GERAGHTY-20 | `cusp-and-L2-image-subspaces` | [Cuspidal, L² and tempered image subspaces](#automorphic-image-subspaces) |
| PAPER-CALEGARI-GERAGHTY-20 | `tempered-subspaces` | [Cuspidal, L² and tempered image subspaces](#automorphic-image-subspaces) |
| PAPER-CALEGARI-GERAGHTY-20 | `V-sigma-independent-of-c` | [Algebraic and analytic coefficient conventions](#W-V-comparison) |
| PAPER-CALEGARI-GERAGHTY-20 | `def-5-3-W-mu` | [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients) |
| PAPER-CALEGARI-GERAGHTY-20 | `ext-de-rham-sequences-automorphic` | [The Siegel weight dictionary](#siegel-weight-dictionary) |
| PAPER-CALEGARI-GERAGHTY-20 | `lemma-5-4` | [Algebraic and analytic coefficient conventions](#W-V-comparison) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-5` | [Tempered coherent chamber vanishing](#tempered-chamber-vanishing) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-6-1` | [Infinitesimal characters and Kostant representatives](#infinitesimal-character) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-6-2` | [The GL₄ archimedean parameter](#GL4-archimedean-transfer) |
| PAPER-CALEGARI-GERAGHTY-20 | `thm-5-6-3` | [Tempered coherent chamber vanishing](#tempered-chamber-vanishing) |
| PAPER-CALEGARI-GERAGHTY-20 | `serre-duality-automorphic-bundles` | [Serre duality and the dual Siegel weight](#siegel-serre-dual-weight) |
| PAPER-CALEGARI-GERAGHTY-20 | `char0-vanishing-lds-weights` | [Characteristic-zero singular-weight ranges](#singular-char0-ranges) |
| PAPER-CALEGARI-GERAGHTY-20 | `cor-5-8-1` | [Mod-p singular-weight vanishing](#singular-weight-modp-vanishing) |
| PAPER-CALEGARI-GERAGHTY-20 | `cor-5-8-2` | [Mod-p singular-weight vanishing](#singular-weight-modp-vanishing) |
| PAPER-CALEGARI-GERAGHTY-20 | `hecke-matrices-beta` | [Geometric Hecke generators and the spin polynomial](#hecke-polynomial-dictionary) |
| PAPER-CALEGARI-GERAGHTY-20 | `hecke-operators-T-x-i` | [Coherent Hecke operators in every degree](#coherent-hecke-action) |
| PAPER-CALEGARI-GERAGHTY-20 | `rem-5-10-hecke-normalization` | [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action) |
| PAPER-CALEGARI-GERAGHTY-20 | `rem-5-12-central-infinitesimal-character` | [The GL₄ archimedean parameter](#GL4-archimedean-transfer) |
| PAPER-CALEGARI-GERAGHTY-20 | `ext-pilloni-vanishing-large-parallel-weight` | [Large parallel twists and reduction of sections](#large-parallel-twist) |
| PAPER-CALEGARI-GERAGHTY-20 | `base-change-surjectivity-high-weight` | [Large parallel twists and reduction of sections](#large-parallel-twist) |
| PAPER-CALEGARI-GERAGHTY-20 | `coherent-homology-H-i` | [Coherent homology over a DVR](#coherent-homology) |
| PAPER-CALEGARI-GERAGHTY-20 | `ext-harris-zucker-nerve-spectral-sequence` | [The Siegel boundary nerve calculation](#boundary-nerve-specialization) |
| PAPER-CALEGARI-GERAGHTY-20 | `hochschild-serre-homology` | [Derived coefficient change and deck descent](#coefficient-descent) |
| PAPER-CALEGARI-GERAGHTY-20 | `interior-cohomology-automorphic-description` | [Localized coherent cohomology and cuspidal representations](#localized-cuspidal-decomposition) |
| PAPER-CALEGARI-GERAGHTY-20 | `serre-duality-coherent-hecke-twist` | [Serre duality and the dual Siegel weight](#siegel-serre-dual-weight) |
| PAPER-CALEGARI-GERAGHTY-20 | `automorphic-representation-of-eigenform` | [Holomorphic cusp eigensystems](#holomorphic-cusp-eigensystems) |
| PAPER-CALEGARI-GERAGHTY-20 | `coherent-contribution-isotypic` | [Isotypic contribution to coherent cohomology](#coherent-isotypic-contribution) |
| PAPER-PILLONI-20 | `ext-harris-coherent-realization` | [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison) |
| PAPER-PILLONI-20 | `cohomological-correspondence-and-induced-map` | [Cohomological correspondences](#coherent-correspondence) |
| PAPER-PILLONI-20 | `cohomological-correspondence-adjoint-form` | [Cohomological correspondences](#coherent-correspondence) |
| PAPER-PILLONI-20 | `cohomological-correspondence-from-fundamental-class` | [Correspondences from a fundamental class](#fundamental-class-correspondence) |
| PAPER-PILLONI-20 | `normalized-cohomological-correspondence` | [Integral divisibility and rational p-operators](#integral-normalization) |
| PAPER-PILLONI-20 | `holomorphic-cusp-forms-embed-in-H0` | [Holomorphic cusp eigensystems](#holomorphic-cusp-eigensystems) |
| PAPER-PILLONI-20 | `H0-cuspidal-decomposition-holomorphic` | [Holomorphic cusp eigensystems](#holomorphic-cusp-eigensystems) |
| PAPER-PILLONI-20 | `hecke-algebra-action-on-coherent-cohomology` | [Coherent Hecke operators in every degree](#coherent-hecke-action) |
| PAPER-PILLONI-20 | `normalized-hecke-operators-T-ell-i-coherent` | [The arithmetic normalization of the Siegel Hecke action](#normalized-coefficient-action) |
| PAPER-PILLONI-20 | `vanishing-higher-direct-images-to-minimal-compactification` | [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing) |
| PAPER-PILLONI-20 | `hecke-operators-T-p-2-and-U-Kli-p-2` | [Integral divisibility and rational p-operators](#integral-normalization) |
| PAPER-PILLONI-20 | `external-lan-higher-direct-images-to-minimal-compactification` | [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing) |
| PAPER-PILLONI-20 | `def-interior-coherent-cohomology` | [Interior coherent cohomology and towers](#interior-cohomology) |
| PAPER-PILLONI-20 | `ext-harris-interior-cohomology-automorphic-description` | [Large singular-weight interior decomposition](#large-singular-interior) |
| PAPER-PILLONI-20 | `def-localised-complex-coherent-cohomology` | [Congruence localization of complex coherent cohomology](#complex-hecke-localization) |
| PAPER-PILLONI-20 | `cor-15-2-3-1-degree-0` | [Localized degrees zero and one](#localized-degree-zero-one) |
| PAPER-PILLONI-20 | `cor-15-2-3-1-degree-1` | [Localized degrees zero and one](#localized-degree-zero-one) |
| PAPER-PILLONI-20 | `boundary-restriction-pushforward-to-modular-curves` | [The genus-two boundary Φ calculation](#Q-boundary-phi-calculation) |
| PAPER-PILLONI-20 | `ext-freitag-phi-operator-hecke-relation` | [The genus-two boundary Φ calculation](#Q-boundary-phi-calculation) |
| PAPER-PILLONI-20 | `boundary-coherent-cohomology-is-eisenstein` | [Non-Eisenstein boundary vanishing over Q](#Q-boundary-localized-vanishing) |
| PAPER-PILLONI-20 | `prop-15-2-4-1-h-g-symmetry-and-multiplicity-one` | [Conditional holomorphic–generic packet pairing](#conditional-packet-pairing) |
| PAPER-BOXER-PILLONI-26 | `coherent-cohomology-complexes-siegel` | [Integral coherent cohomology complexes](#coherent-cohomology-complexes) |
| PAPER-BOXER-PILLONI-26 | `su24-coherent-cohomology-via-automorphic-forms` | [Su’s automorphic comparison](#su-canonical-comparison) |
| PAPER-BOXER-PILLONI-26 | `nu-plus-rho-infinitesimal-character` | [Infinitesimal characters and Kostant representatives](#infinitesimal-character) |
| PAPER-BOXER-PILLONI-26 | `cuspidal-limits-contribute-to-coherent-cohomology` | [Infinitesimal characters and Kostant representatives](#infinitesimal-character) |
| PAPER-BOXER-PILLONI-26 | `expanded-and-contracted-subschemes` | [Contracted support filtrations](#contracted-filtration) |
| PAPER-BOXER-PILLONI-26 | `cohomological-correspondence` | [Cohomological correspondences](#coherent-correspondence) |
| PAPER-BOXER-PILLONI-26 | `construction-2-6-1-correspondence-tensor-module` | [Tensor coefficients and deck coinvariants](#correspondence-tensor) |
| PAPER-BOXER-PILLONI-26 | `construction-2-6-9-group-action-and-coinvariant-correspondence` | [Tensor coefficients and deck coinvariants](#correspondence-tensor) |
| PAPER-BOXER-PILLONI-26 | `lemma-2-6-11-a-galois-cover-pushforward-locally-projective` | [Étale Galois projectivity](#galois-projectivity) |
| PAPER-BOXER-PILLONI-26 | `lemma-2-6-11-b-galois-cover-pushforward-flat-over-group-ring` | [Étale Galois projectivity](#galois-projectivity) |
| PAPER-BOXER-PILLONI-26 | `construction-2-6-12-finite-base-change-of-correspondence` | [Base change for cohomological correspondences](#correspondence-base-change) |
| PAPER-BOXER-PILLONI-26 | `prop-2-7-3-transpose-cohomological-correspondence` | [The transpose correspondence](#transpose-correspondence) |
| PAPER-BOXER-PILLONI-26 | `correspondence-and-filtration-setting` | [Contracted support filtrations](#contracted-filtration) |
| PAPER-BOXER-PILLONI-26 | `correspondence-map-of-localization-triangles` | [Equivariance of localization triangles and Cousin sequences](#filtered-correspondence-action) |
| PAPER-BOXER-PILLONI-26 | `cousin-spectral-sequence-T-equivariance` | [Equivariance of localization triangles and Cousin sequences](#filtered-correspondence-action) |
| PAPER-BOXER-PILLONI-26 | `de-rham-M-torsor-M-dR` | [The integral de Rham Levi torsor](#integral-graded-frame-torsor) |
| PAPER-BOXER-PILLONI-26 | `representation-V-kappa-and-automorphic-sheaf-omega-kappa` | [Integral dual-Weyl automorphic coefficients](#integral-automorphic-coefficients) |
| PAPER-BOXER-PILLONI-26 | `normalization-standard-representation-is-Lie-A` | [The Siegel weight dictionary](#siegel-weight-dictionary) |
| PAPER-BOXER-PILLONI-26 | `rational-isomorphism-p2-omega-to-p1-omega` | [Rational isogeny transport of weight sheaves](#rational-isogeny-transport) |
| PAPER-BOXER-PILLONI-26 | `relative-vanishing-toroidal-to-minimal` | [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `48` | [Cohomological correspondences](#coherent-correspondence) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `50` | [Integral prime-to-p Hecke relations at hyperspecial level](#integral-hecke-relations) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `52` | [Localized coherent cohomology and cuspidal representations](#localized-cuspidal-decomposition) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `219` | [Coherent Hecke operators in every degree](#coherent-hecke-action) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `223` | [Conditional coherent dimension equality](#coherent-dimension-equality) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `224` | [Degree-zero Hilbert–Siegel boundary vanishing](#hilbert-boundary-degree-zero) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `225` | [Non-Eisenstein coherent localization](#coherent-non-eisenstein-specialization) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `226` | [Harris’s cusp and interior comparison](#harris-cusp-interior-comparison) |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | `235` | [Toroidal-to-minimal relative vanishing](#relative-subcanonical-vanishing) |
| PAPER-SCHOLZE-15 | `81` | [Holomorphic cusp eigensystems](#holomorphic-cusp-eigensystems) |

## Suggested Lean and validation

The suggested file has two light real-bodied definitions: the additive image of the existing native cohomology map, and the four integer chamber predicates. It states their API targets, native H⁰ compatibility, wall tests and a K-projective baseline example. Integral torsors, stable solid operations, derived coherent coefficient categories, global automorphic comparisons and packet theory have no artificial stand-ins. Their genuine constructions belong to the targets above.

`lean-check research/blueprint/suggested/AutomorphicBundlesPartII.lean` succeeds at the pinned shared build with only admitted-proof warnings. Concrete chamber examples and the imported K-projective example are checked terms; all admitted theorem statements remain proposed targets. The blueprint checker reports no errors or warnings, and the data-definition and source-issue/version checks pass. This establishes the shape and elaboration of a plan, not implementation of its mathematical targets.

## Independent review

The [REV-DESIGN review](../reviews/REV-DESIGN-AutomorphicBundlesPartII.md) checks all 70 targets. The corrected pass distinguishes solid completion from ordinary Cousin local cohomology and places integral localization after the hyperspecial relation theorem. Every definition/construction now has five API clauses and three discriminating checks. Source findings E6 and E15 are rejected as established errors in the cited papers: their underlying verification obligations remain G-boundary-regular and G-Phi. E13 is a label misprint with no effect on the injection used by its proof. These verdicts do not close any of the six recorded gaps.
