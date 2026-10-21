# Modularity, automorphy and Langlands endpoint extensions, Part II: the proof of symmetric power functoriality

This roadmap is the Part II of ModularityAndLanglandsExtensions (TauCetiRoadmap pull request #1180). That roadmap registers symmetric power functoriality as an endpoint: it states Newton–Thorne's theorems for modular forms (Theorems A–E of Newton–Thorne I, Theorem A of Newton–Thorne II), for Hilbert modular forms (Newton–Thorne 2026, Theorems 4.1, 5.9, 6.4 and A) and Clozel–Thorne's sixth and eighth symmetric powers, together with the steps of their proofs as import contracts (its §§4.5–4.11 and 4.23), and gives each a one-line proof route. Its packet records that the methods behind those statements belong to this Part II. This roadmap starts there: it plans the proofs.
There are four methods, and all four are needed for the parent's statements as they stand. **Analytic continuation along eigenvarieties** (SP.0–SP.3, Newton–Thorne I Part I): automorphy of Sym^{n−1} is constant on irreducible components of the eigencurve, and ping-pong on Buzzard–Kilford's annuli connects all level-one forms (Theorem D). **Level raising on definite unitary groups** (SP.4–SP.7, Newton–Thorne I Part II and Clozel–Thorne III): types at auxiliary places, a trace-formula count, level raising to Steinberg by residually reducible deformation theory, and a CM seed aim to give one level-one form with automorphic Sym^{n−1} (Theorem E), with the odd-rank CM seed obstruction recorded as G2, and Clozel–Thorne's Sym^{l+1} for l = 5, 7. **Automorphy lifting for symmetric powers** (SP.8–SP.10, Newton–Thorne I §8 and Newton–Thorne II): killing ramification with n-regular refinements, a lifting theorem driven by the regularity of a pseudodeformation ring at an automorphic point rather than by control of a dual Selmer group, and an induction on supercuspidal primes through seasoned representations. **Tensor-product functoriality lifting** (SP.11–SP.13, Newton–Thorne 2026 with Thorne 2024 §7): the untwisted tensor r_π ⊗ Sym^{r−1}r_σ by comparing deformation problems with congruent special fibres, a functoriality lifting theorem for tensor products, residual witnesses for the coefficient-Frobenius twisted tensor, and the Bertrand induction proving SP_n for every n over every totally real field.

## Scope

**What the parent owns and this roadmap imports.** The automorphy predicate and normalisations of Newton–Thorne (ML.0, nodes ML.0/nt26-automorphy-predicate and ML.0/nt26-normalisation-bridge); accessible and n-regular refinements, the symmetric power lift, the statement SP_n and the low-rank cases SP_n for n ≤ 5 (ML.3 nodes accessible-regular-refinement, symmetric-power-lift-over-number-fields, sp-statement, low-rank-symmetric-powers); the finite-field projective image sandwich (ML.3/projective-image-sandwich); the eigenvariety machinery of the package's §4.3 (definite-unitary eigenvarieties with closed realization, Emerton's Jacquet functor, family triangulations, trianguline deformations and the global trianguline tangent bound, the symmetric-power character maps, classicality at non-critical points); Anastassiades–Thorne's level raising for GL_{2n} (§4.4); the one-prime criterion (§4.15); the Clozel–Thorne reductions with Newton–Thorne 2026 Proposition 6.1 and Thorne 2024 §8 (§4.22); Mok's and Kaletha–Mínguez–Shin–White's classifications (ML.4); cyclic and soluble base change for GL_n (ML.5).
**What neighbouring roadmaps own.** PotentialAutomorphyInfrastructurePartII (PL.0–PL.9) owns ι-ordinarity, soluble descent, potential diagonalisability and the relation ∼, definite unitary groups with their algebraic modular forms, Hecke algebras and ordinary parts, Taylor–Wiles data, the ordinary and potentially diagonalisable lifting theorems (BLGGT Theorem 4.2.1), the residually reducible theory of Thorne and Allen–Newton–Thorne (generic primes, generic R = T, Thorne 2024 Theorem 7.5), and the pseudodeformation rings P with the vanishing of adjoint Bloch–Kato Selmer groups and the regularity of P at automorphic points. PadicFamilies owns the eigencurve and eigenvariety gluing; AdicSpacesPartIIPartII owns irreducible components of rigid spaces; SmoothRepresentationsOfLocalGroups (a Tau Ceti roadmap) owns Iwahori–Hecke algebras with their presentations, compact induction, Jacquet modules and cuspidal support; SmoothRepresentationsOfLocalGroupsPartII owns the Kazhdan–Lusztig classification; EndoscopicTransferAndUnitaryTraceComparison owns transfer factors, fundamental lemmas, the unitary trace formulas and unitary base change; GlobalGaloisDeformations, LocalGaloisDeformationRings and DeformationAndDerivedPatchingAlgebra own deformation problems, local rings and the commutative algebra of patching; GL2ModularityLifting owns quaternionic Taylor–Wiles modules and patching for GL_2; ArithmeticGaloisRepresentations owns adequacy (with the threshold a_0(p)), the mod-p semisimplified Clebsch–Gordan decompositions and characteristic-zero Pieri splittings and enormous subgroups.
**What this roadmap does not plan.** Level-one change of weight and the cuspidal cohomology of GL_n(ℤ) (Boxer–Calegari–Gee) and the explicit local theory and Galois representations of GSp_4 (BCGP 2018, 2025) were routed to the same design brief; they are independent directions and are proposed as separate Part IIs (restructure entry R1). Equidistribution consequences (Sato–Tate) stay with the parent. The Bianchi and CM-field potential-automorphy results of the parent's §§4.19–4.21, 4.24–4.28, 4.33, 4.38–4.43 use other methods and are not touched.

## Conventions

We follow the parent's conventions (its Conventions section and ML.0/nt26-normalisation-bridge): geometric Frobenius, local reciprocity sending uniformisers to geometric Frobenius, rec^T(π_v) = rec(π_v ⊗ |det|^{(1−n)/2}), the cyclotomic character ε with Hodge–Tate weight −1. RAESDC, RACSDC, RAECSDC and ι-ordinary are as in PotentialAutomorphyInfrastructurePartII PL.0. For a cuspidal π of GL_2, r_{π,ι} is its p-adic Galois representation; 'Sym^{n−1}r_{π,ι} is automorphic' means it is r_{Π,ι} for a RAESDC (over totally real fields) or RACSDC (over CM fields) Π of GL_n, as in ML.0/nt26-automorphy-predicate. SP_n is the parent's statement ML.3/sp-statement; TP_r is tensor functoriality GL_2 × GL_r → GL_{2r} for RAECSDC representations with irreducible Hodge–Tate regular tensor (Clozel–Thorne I Conjecture 3.2).
𝒢_n is the group of Clozel–Harris–Taylor, (GL_n × GL_1) ⋊ {1, j}, with multiplier ν; polarized representations take values in 𝒢_n. Pseudocharacters are Chenevier determinants (IntegralHeckeAndGaloisDeterminants IHG.0). φ_p ∈ G_{ℚ_p} is a lift of arithmetic Frobenius acting on coefficients; ^{φ_p}r̄ denotes the coefficient twist, not evaluation at a Frobenius element. a_0(p) ≥ 3 is the adequacy threshold of Newton–Thorne 2026 Lemma 2.3 = Thorne 2024 Lemma 7.3 (ArithmeticGaloisRepresentations G7).
Locators are to the arXiv versions named under Sources, by PDF page; Clozel–Thorne III is cited by the page numbers of the accepted manuscript. Where the paper extractions recorded a mistake, the nodes use the corrected statement and cite the extraction's E-number (PAPER-NEWTON-THORNE-21/E…, PAPER-NEWTON-THORNE-21-B/E…, PAPER-CLOZEL-THORNE-17/E…, PAPER-NEWTON-THORNE-26/E…).


## Planning status after independent review

This is a finished target-level pass: 105 targets in 14 planned layers, with no closed layer and no implementation claim. The review accepts the corrected plan with its explicit proof boundaries under PROTOCOL §0. G1, G3–G5 and G7 name missing owners or supplier extensions. G2 is the unresolved conjugate-self-duality failure in the NTI odd-rank CM seed construction, including rank three; only the powers-of-two seed construction avoids it. Known low-rank endpoint functoriality does not supply all of that seed data. The NT26 SP.13 induction is a separate route to the endpoint. Former G6 is resolved in the tensor-companion proof using a perfect product subgroup on cyclotomic restriction and a finite auxiliary-place avoidance set.

In residually reducible lifting arguments, primitivity is the weak source notion tested over the algebraic closure of the residual field. Fix a common finite splitting field for all subgroups of the residual image before fixing coefficient rings. Use the current PL.6/PL.7 weak-source continuations and their exact auxiliary-place boundary. Stage requests do not assert that an unplanned extension is already available. All source findings below concern the exact public versions read; no claim of collation with an unread journal text is made.


## Sources

- **James Newton and Jack A. Thorne**, *Symmetric power functoriality for holomorphic modular forms*. Publ. Math. IHÉS 134 (2021), 1–116; read in arXiv:1912.11261v3 (27 September 2021, 101 pp.), whose PDF page numbers are used throughout (the paper extraction PAPER-NEWTON-THORNE-21 used the published pagination) [Public source](https://arxiv.org/abs/1912.11261). Read: Introduction and the sketch of Part II (pp. 1–8, 57–59); §1, definite unitary groups, types and L-packets (pp. 8–23); §2.1, §2.3.1, §2.11.1, §2.18.1, §2.31 (pp. 24, 30–31, 40–52); §3, ping pong (pp. 53–57); §4, Theorem 4.1 and its proof (pp. 59–65); §6, Theorem 6.1 and Lemmas 6.2–6.7 (pp. 75–82); §7, Theorems 7.1, 7.6, Lemma 7.2, Corollary 7.3, Proposition 7.4 (pp. 82–91); §8, Propositions 8.2–8.3, Lemma 8.4 (pp. 91–96).
- **James Newton and Jack A. Thorne**, *Symmetric power functoriality for holomorphic modular forms, II*. Publ. Math. IHÉS 134 (2021), 117–152; read in arXiv:2009.07180v2 (27 September 2021, 30 pp.), PDF page numbers [Public source](https://arxiv.org/abs/2009.07180). Read: §1 (pp. 1–4); §2, Theorem 2.1, Lemma 2.2, Propositions 2.5–2.8, Lemmas 2.4, 2.7, 2.9 and the proof of Theorem 2.1 (pp. 5–19); §3, Definitions 3.2, 3.6, Lemmas 3.3–3.5, Propositions 3.7–3.11, Theorem 3.1 and its proof (pp. 20–27).
- **James Newton and Jack A. Thorne**, *Symmetric power functoriality for Hilbert modular forms*. Ann. of Math. 203 (2026), no. 1; read in arXiv:2212.03595v2 (19 February 2025, 52 pp.), PDF page numbers [Public source](https://arxiv.org/abs/2212.03595). Read: §§1–2 (pp. 1–12); §3, Lemma 3.1, Theorem 3.2, Lemmas 3.3–3.8, Propositions 3.9–3.14 (pp. 13–25); §4, Theorem 4.1, Lemmas 4.2, 4.5, 4.7, Corollary 4.3, Propositions 4.6, 4.8, 4.9 and the proof of Theorem 4.1 (pp. 25–37); §5, Lemmas 5.3, 5.6–5.8, Proposition 5.4, Theorems 5.5, 5.9 (pp. 38–45); §6, Propositions 6.1, 6.3, Corollary 6.2, Theorems 6.4, 6.5 (pp. 45–50).
- **Laurent Clozel and Jack A. Thorne**, *Level-raising and symmetric power functoriality, III*. Duke Math. J. 166 (2017), no. 2, 325–402; read in the accepted manuscript on the second author's web page (lrspiii.pdf), whose page numbers are used [Public source](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf). Read: §2, the Iwahori–Hecke algebra of U\_{2k+1}, Theorems 2.3, 2.5, Propositions 2.2, 2.6, 2.9, Corollary 2.8 (pp. 4–18); §3, Theorems 3.3, 3.8, 3.10, Lemmas 3.4, 3.6, Proposition 3.7 (pp. 19–32); §4, Propositions 4.1, 4.3, Lemma 4.4, Theorem 4.2 (pp. 33–37); §5, Theorems 5.1, 5.7, Lemmas 5.3–5.6 (pp. 37–44); §6, Theorems 6.1–6.2 (pp. 44–46).
- **Jack A. Thorne**, *A p-adic approach to the existence of level-raising congruences*. Proc. Lond. Math. Soc. (3) 128 (2024), no. 2, e12584; read in arXiv:2212.03591v2 (22 December 2022, 52 pp.), PDF page numbers [Public source](https://arxiv.org/abs/2212.03591). Read: §6, Lemma 6.10 and Theorem 6.11 with its proof (pp. 38–41); §7, Theorem 7.1, Corollary 7.2, Lemma 7.3, Proposition 7.4, Theorems 7.5–7.6 (pp. 42–47); §8, Theorem 8.1 (statement, p. 48).
- **Konstantinos Anastassiades and Jack A. Thorne**, *Raising the level of automorphic representations of GL\_{2n} of unitary type*. J. Inst. Math. Jussieu (2021); read in arXiv:1912.11267 (22 pp.), PDF page numbers [Public source](https://arxiv.org/abs/1912.11267). Read: Theorem 5.1 (p. 19).
- **Kevin Buzzard and L. J. P. Kilford**, *The 2-adic eigencurve at the boundary of weight space*. Compositio Math. 141 (2005), 605–619; cited through Newton–Thorne I Theorem 3.2, which states the result in the form used; not read directly [Public source](https://doi.org/10.1112/S0010437X05001314). Read: Theorem B, as recorded in Newton–Thorne I §3, Theorem 3.2 (p. 53).
- **Brian Conrad**, *Irreducible components of rigid spaces*. Ann. Inst. Fourier 49 (1999), author copy; internal printed pagination [Public source](https://math.stanford.edu/~conrad/papers/irredpaper.pdf). Read: Theorem 3.4.2 and proof, pp.26–27.

## Layer overview

| Layer | Title | Planets |
|---|---|---|
| SP.0 | Rigid spaces of pseudocharacters and analytic continuation along components | Rigid space of pseudocharacters 𝒳\_ps |
| SP.1 | Analytic continuation of symmetric power functoriality between unitary eigenvarieties | Analytic continuation of functoriality; Symmetric power automorphy along components |
| SP.2 | From the eigencurve to definite unitary eigenvarieties | Theorem 2.33: propagation on the eigencurve |
| SP.3 | Level one: the 2-adic boundary of weight space and ping-pong | Buzzard–Kilford boundary annuli; Theorem D: propagation through level one |
| SP.4 | Local representation theory for unitary level raising |  |
| SP.5 | Level raising to prescribed types on definite unitary groups | Level raising to types (NT I Theorem 4.1); Clozel–Thorne level raising (Theorem 4.2) |
| SP.6 | Level raising to Steinberg by residually reducible deformation theory | Level raising to Steinberg (NT I Theorem 6.1); Thorne's p-adic level raising (Theorem 6.11) |
| SP.7 | Seeds: residually CM symmetric powers and one level-one form | Theorem E: a level-one seed; Sym^6 and Sym^8 by level raising (CT Theorem 6.2) |
| SP.8 | Killing ramification with n-regular refinements | Killing ramification (NT I Proposition 8.2) |
| SP.9 | Automorphy lifting for symmetric powers | Regularity of P transfers automorphy; Automorphy lifting for Sym^{n−1} (NT II 2.1) |
| SP.10 | Seasoned representations and the removal of supercuspidal primes | Theorem A for non-CM modular forms |
| SP.11 | The untwisted tensor product of Newton–Thorne 2026 | Untwisted tensor automorphy (NT 2026 Theorem 3.2) |
| SP.12 | Functoriality lifting for tensor products | Tensor functoriality lifting (NT 2026 Theorem 4.1) |
| SP.13 | Residual twisted tensors and the induction on n | Residual twisted tensor witness (Theorem 5.9); Sym^{p+r−1} from two residual blocks; SP\_n for all n (NT 2026 Theorem 6.4) |

## Layer SP.0: Rigid spaces of pseudocharacters and analytic continuation along components

**Targets.** The analytic continuation lemma for rigid spaces (Newton–Thorne I, Lemma 2.2): a morphism that sends an affinoid neighbourhood of a point into a Zariski closed subspace sends every irreducible component through the point into it; Conrad's base-change behaviour of irreducible components; the rigid generic fibres 𝒳\_ps and 𝒳\_{ps,v} of the global conjugate-self-dual and unrestricted local pseudodeformation rings with their absolutely irreducible loci, Azumaya algebras and local splitting (Lemma 2.13); the bijection between polarized lifts and conjugate self-dual traces (Lemma 2.12, with the corrections E10–E11 of the extraction); and the identification of their tangent spaces with Galois cohomology (Lemma 2.14).

**Sources.** Newton–Thorne I (arXiv:1912.11261v3) §2.1, §2.11.1, pp. 24, 30–31.

*Requires:* `AdicSpacesPartII:R1`, `AdicSpacesPartII:R2`, `AdicSpacesPartIIPartII:RZ.1`, `GlobalGaloisDeformations:G7`, `GlobalGaloisDeformations:R04.1`, `IntegralHeckeAndGaloisDeterminants:IHG.0`, `PotentialAutomorphyInfrastructurePartII:PL.6`.

<a id="sp-0-analytic-continuation-lemma"></a>
### SP.0.1 Analytic continuation along irreducible components of rigid spaces

`ModularityAndLanglandsExtensionsPartII:SP.0/analytic-continuation-lemma` · theorem

Let E be a finite extension of ℚ\_p, α : 𝒳 → 𝒢 a closed immersion and β : 𝒴 → 𝒢 a morphism of rigid analytic spaces over E, and y ∈ 𝒴 with β(y) ∈ 𝒳. If β^{−1}(𝒳) contains an affinoid open neighbourhood of y, then β(𝒞) ⊂ 𝒳 for every irreducible component 𝒞 of 𝒴 containing y. Moreover, every irreducible component of 𝒴\_{ℂ\_p} lies in the base change of an irreducible component of 𝒴, and if 𝒴 is quasi-separated and has finitely many irreducible components, there is a finite extension E′/E such that the irreducible components of 𝒴\_{E′} are geometrically irreducible (Conrad, Theorem 3.4.2).


*Hypotheses and conventions.*

- 𝒴 and 𝒢 are rigid analytic spaces over a finite extension E of ℚ\_p; 𝒳 → 𝒢 is a closed immersion.
- The neighbourhood must be an affinoid open of 𝒴 containing y, not just a sequence of points accumulating at y.
- For the base-change assertions use quasi-separated rigid spaces; finite extension making all components geometrically irreducible is asserted for a finite set of components, in particular an affinoid. For a selected component first restrict to that component as in NTI.


*Proof route.*

- β^{−1}(𝒳) is a Zariski closed analytic subspace of 𝒴 (pullback of a closed immersion).
- Let 𝒞 be an irreducible component through y and 𝒞̃ → 𝒞 its normalization, which is connected (irreducible components are images of connected components of the normalization, AdicSpacesPartIIPartII RZ.1).
- The preimage of β^{−1}(𝒳) ∩ 𝒞 in 𝒞̃ is Zariski closed and contains a non-empty admissible open (the preimage of the affinoid neighbourhood meets 𝒞̃ in a set of full dimension at a point over y); by the irreducibility criterion of RZ.1 a proper Zariski closed subset of an irreducible space is nowhere dense, so it is all of 𝒞̃.
- Conrad's Theorem 3.4.2 on irreducible components under base change of the ground field gives the second sentence; it is used to pass between components over E, over finite extensions and over ℂ\_p in SP.1 and SP.2.


*Checks.*

- Take 𝒴 = 𝒢 the closed unit disc and 𝒳 = {0}: β = id does not send an affinoid neighbourhood of 0 into 𝒳, and the conclusion fails, so the neighbourhood hypothesis is necessary.
- Take 𝒢 = 𝒴 = two closed discs meeting at one point (the union of the axes in the bidisc) and 𝒳 one axis: the hypothesis holds at a point of that axis away from the crossing, and only that component is forced into 𝒳.


*Source.*

- [nt21] Lemma 2.2, §2.1, p. 24: States and proves the analytic continuation lemma for a closed immersion and a morphism of E-rigid spaces, using Conrad's irreducible components.
- [nt21] proof of Theorem 2.24, p. 41; Corollary 2.28 and footnote, pp. 43–44; proof of Theorem 2.33, pp. 50–51: Applies Conrad's Theorem 3.4.2 to pass from components over E to components over ℂ\_p.
- [con99] §3.4, Theorem 3.4.2, internal pp.26–27: Quasi-separated spaces have the stated component behavior under base extension; the simultaneous finite extension assertion requires finitely many components.


*Needs.* `AdicSpacesPartIIPartII:RZ.1/irreducible-components`, `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartII:R1/rigid-identity-principle`.

<a id="sp-0-pseudocharacter-rigid-spaces"></a>
### SP.0.2 Rigid spaces of conjugate self-dual pseudocharacters and their absolutely irreducible loci

`ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-rigid-spaces` · construction · planet: Rigid space of pseudocharacters 𝒳\_ps

Fix a CM field F with maximal totally real subfield F⁺, a finite set S of places of F⁺ containing the p-adic places, a residual conjugate self-dual pseudocharacter τ̄ of G\_{F,S} of dimension n over a finite field k, and for each v ∈ S\_p a place ṽ of F above v. Let R\_ps (resp. R\_{ps,v}) be the universal deformation ring of τ̄ as a conjugate self-dual pseudocharacter of G\_{F,S} (resp. unrestricted pseudodeformations of τ̄|\_{G\_{F\_ṽ}}), a complete Noetherian local W(k)-algebra. Define 𝒳\_ps and 𝒳\_{ps,v} as their rigid generic fibres, with the restriction morphism 𝒳\_ps → 𝒳\_{ps,p} = ∏\_{v∈S\_p} 𝒳\_{ps,v}. The locus 𝒳\_{ps,v}^{v-irr} where the universal pseudocharacter is absolutely irreducible is Zariski open and carries an Azumaya algebra 𝒜 of rank n² with a continuous ρ^u\_v : G\_{F\_ṽ} → 𝒜^× whose reduced trace is the universal pseudocharacter (Chenevier §4.2); 𝒳\_ps^{p-irr} is the preimage of ∏\_v 𝒳\_{ps,v}^{v-irr}. Local splitting (Lemma 2.13): if ρ\_v : G\_{F\_ṽ} → GL\_n(E) is absolutely irreducible over E and z = tr ρ\_v, then 𝒜 is isomorphic to M\_n(𝒪\_𝒰) on some affinoid neighbourhood 𝒰 of z.


*Hypotheses and conventions.*

- Pseudocharacters are Chenevier determinants (IntegralHeckeAndGaloisDeterminants IHG.0); when n! is invertible in k they are determined by traces.
- Lemma 2.13 needs ρ\_v defined over E; an E-point of the irreducible locus alone does not split the fibre of 𝒜.


*Proof route.*

- Pro-representability of conjugate self-dual determinant deformations of τ̄ (GlobalGaloisDeformations R04.1, determinant deformation functor), with the conjugate self-duality condition closed.
- Pass to rigid generic fibres by Berthelot's construction (AdicSpacesPartII R2).
- Chenevier §4.2: over the absolutely irreducible locus the Cayley–Hamilton quotient of 𝒪[G] is an Azumaya algebra of rank n², and the reduced trace recovers the universal determinant.
- Lemma 2.13: the stalk of 𝒜 at z is an Azumaya algebra over a Henselian local ring whose fibre is split by ρ\_v, hence split; spread the splitting to an affinoid neighbourhood.


*API.*

- `PseudocharSpace` (constructor): The rigid generic fibre 𝒳\_ps of the conjugate self-dual pseudodeformation ring of τ̄, with its universal pseudocharacter.
- `PseudocharSpace.local` (constructor): The unrestricted local pseudodeformation space 𝒳\_{ps,v} for a p-adic place v and the restriction morphism 𝒳\_ps → ∏\_v 𝒳\_{ps,v}.
- `PseudocharSpace.absIrrLocus` (data): The Zariski open absolutely irreducible locus, with its Azumaya algebra 𝒜 and universal representation ρ^u into 𝒜^×.
- `PseudocharSpace.trace_universalRep` (characterisation): The reduced trace of ρ^u is the universal pseudocharacter on the irreducible locus.
- `PseudocharSpace.split_near` (other): Lemma 2.13: at a point given by an absolutely irreducible representation over E the Azumaya algebra is a matrix algebra on an affinoid neighbourhood.
- `PseudocharSpace.points` (characterisation): E-points of 𝒳\_ps correspond to conjugate self-dual E-valued pseudocharacters (Chenevier determinants) of G\_{F,S} reducing to τ̄.
- `PseudocharSpace.restriction_trace` (compatibility): At every E-point, the local universal determinant is the restriction of the global determinant to the chosen local decomposition group. The local functor is unrestricted even though the global determinant is polarized.


*Unit tests.*

- `PseudocharSpace.dim_one` (computation): For n = 1 and G\_{F\_ṽ} with F\_ṽ = ℚ\_p, p odd, the local space has dimension 2 (the characters of ℤ\_p^× × ℤ\_p lifting a fixed residual character form a two-dimensional open polydisc after fixing the torsion part).
- `PseudocharSpace.absIrr_residual` (degenerate): If the fixed local residual pseudocharacter is absolutely irreducible, its entire characteristic-zero deformation space is absolutely irreducible. Openness therefore does not imply that this locus is nonclosed; an ordinary upper triangular representation is reducible, even when the extension is nonsplit.
- `PseudocharSpace.split_needs_E_point` (non-example): If the fibre of 𝒜 at an E-point is a non-split quaternion algebra over E (the pseudocharacter is the reduced trace of a representation into a division algebra), Lemma 2.13 does not apply; splitting needs ρ\_v over E.
- `PseudocharSpace.trace_eq_classical` (compatibility): At a point given by ρ : G\_{F,S} → GL\_n(E), the universal pseudocharacter specialises to the Chenevier determinant of ρ (IHG.0, determinant of a matrix representation).


*Checks.*

- For n = 1, 𝒳\_{ps,v} is the rigid space of continuous characters of G\_{F\_ṽ} lifting a given residual character: a finite union of open polydiscs of dimension [F\_ṽ : ℚ\_p] + 1.
- At a point given by an absolutely irreducible ρ\_v over E, Lemma 2.13 gives a universal matrix representation G\_{F\_ṽ} → GL\_n(𝒪(𝒰)) lifting ρ\_v.


*Uses.*

- Newton–Thorne I, Theorem 2.24 and its proof, pp. 40–42: the closed realization ℰ\_n(τ̄\_n) → 𝒳\_{ps,n} × 𝒯\_n and the trianguline locus 𝒵 are built over 𝒳\_ps^{p-irr}
- Newton–Thorne I, §2.18.1, p. 40: σ\_{n,g} : 𝒳\_{ps,2} → 𝒳\_{ps,n} takes symmetric powers of pseudocharacters
- Newton–Thorne I, Lemma 2.35, p. 52: reducibility of the universal pseudocharacter defines a Zariski closed locus of ℰ\_0


*Source.*

- [nt21] §2.11.1, definitions of 𝒳\_ps, 𝒳\_{ps,v} and Lemma 2.13, pp. 30–31: Defines the rigid generic fibres of the global and local pseudodeformation rings, the absolutely irreducible loci with the Azumaya algebra and universal representation (after Chenevier), and proves local splitting at a point given by an absolutely irreducible representation over E.


*Needs.* `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`, `GlobalGaloisDeformations:R04.1/determinant-deformation-functor`, `AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base`, `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring`.

<a id="sp-0-polarized-lifts-and-traces"></a>
### SP.0.3 Polarized lifts correspond to conjugate self-dual traces

`ModularityAndLanglandsExtensionsPartII:SP.0/polarized-lifts-and-traces` · theorem

Let ρ : G\_{F,S} → GL\_n(E) be absolutely irreducible with ρ^c ≅ ρ^∨ ⊗ ε^{1−n}, extended to ρ\_1 : G\_{F⁺,S} → 𝒢\_n(E) with multiplier ν ∘ ρ\_1 = ε^{1−n}δ\_{F/F⁺}^a, where a ∈ {0, 1} is determined by ρ. For every complete Noetherian local E-algebra A with residue field E (in particular every Artinian one), conjugacy classes of lifts ρ′ : G\_{F,S} → GL\_n(A) of ρ whose trace satisfies tr ρ′ ∘ c = tr(ρ′^∨) · ε^{1−n} correspond bijectively to conjugacy classes (by 1 + M\_n(𝔪\_A)) of lifts ρ′\_1 : G\_{F⁺,S} → 𝒢\_n(A) of ρ\_1 with ν ∘ ρ′\_1 = ε^{1−n}δ^a, the map being restriction to G\_{F,S}.


*Hypotheses and conventions.*

- ρ absolutely irreducible over E; the multiplier character is fixed.
- The category is the complete Noetherian local E-algebras with residue field E, as used on p. 43 of the source (correction E11 of the extraction).


*Proof route.*

- Surjectivity: the trace condition and absolute irreducibility give an isomorphism ρ′^c ≅ ρ′^∨ε^{1−n} over A (Carayol–Serre for absolutely irreducible residual representation of the E-algebra), whose matrix J′ extends ρ′ to 𝒢\_n (Clozel–Harris–Taylor Lemmas 2.1.1, 2.1.4).
- Two extensions of the same restriction with the prescribed multiplier differ at complex conjugation by a scalar λ in 1+𝔪\_A. Since 2 is invertible in E, Hensel gives α in 1+𝔪\_A with α²=λ^{-1}; conjugation by (α,1) identifies the extensions. This proves uniqueness up to strict conjugacy, rather than equality of the chosen matrices.
- Fix ν=ε^{1−n}δ^a as part of the deformation problem. Its value on the odd coset and hence a are not recovered from the trace on G\_F alone. The chosen extension of the residual representation fixes the polarization sign.


*Checks.*

- For n = 1 the lemma says a character χ of G\_F with χχ^c = ε^0 · 1 lifted with χ′χ′^c = 1 extends uniquely up to conjugacy to 𝒢\_1 = (GL\_1 × GL\_1) ⋊ {1, j}.
- With A = E[ε]/(ε²) the bijection identifies the tangent space of the polarized deformation functor with H¹(G\_{F⁺,S}, ad ρ\_1), as used in SP.0/pseudocharacter-tangent-spaces.


*Source.*

- [nt21] Lemma 2.12, §2.11.1, p. 30: States the bijection between conjugacy classes of polarized lifts and lifts with conjugate self-dual trace, for absolutely irreducible ρ, citing Clozel–Harris–Taylor and Chenevier.


*Needs.* `GlobalGaloisDeformations:G7/polarized-deformation-problem`, `GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-injective`.

<a id="sp-0-pseudocharacter-tangent-spaces"></a>
### SP.0.4 Tangent spaces of pseudocharacter spaces at absolutely irreducible points

`ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-tangent-spaces` · theorem

(1) At an E-point z of 𝒳\_{ps,p}^{p-irr} given by absolutely irreducible ρ\_v : G\_{F\_ṽ} → GL\_n(E) (v ∈ S\_p), the tangent space is ⊕\_{v∈S\_p} H¹(F\_ṽ, ad ρ\_v). (2) At an E-point z of 𝒳\_ps^{p-irr} given by ρ : G\_{F⁺,S} → 𝒢\_n(E) with each ρ|\_{G\_{F\_ṽ}} absolutely irreducible, the tangent space is H¹(G\_{F⁺,S}, ad ρ), and the differential of 𝒳\_ps → 𝒳\_{ps,p} is the restriction map to ⊕\_v H¹(F\_ṽ, ad ρ\_v).


*Hypotheses and conventions.*

- Points with absolutely irreducible local restrictions; ad ρ carries the conjugation action of 𝒢\_n through the polarization.


*Proof route.*

- On the absolutely irreducible locus pseudodeformations are deformations of representations (Chenevier §4.1; SP.0/pseudocharacter-rigid-spaces).
- Deformations of an absolutely irreducible representation over E[ε] are classified by H¹ of the adjoint (GlobalGaloisDeformations R04.1, tangent spaces).
- For (2), SP.0/polarized-lifts-and-traces identifies conjugate self-dual pseudodeformations with polarized deformations, whose tangent space is H¹(G\_{F⁺,S}, ad ρ) (GlobalGaloisDeformations G7).


*Checks.*

- For n = 1 and F\_ṽ = ℚ\_p, dim H¹(ℚ\_p, E) = 2, matching the dimension of 𝒳\_{ps,v} for characters.
- For n = 2 and ρ\_v absolutely irreducible with H²(ℚ\_p, ad ρ\_v) = 0, the local Euler characteristic gives dim H¹ = 4 + 1 = 5, the dimension of the local pseudocharacter space at that point.


*Source.*

- [nt21] Lemma 2.14, §2.11.1, p. 31: Computes the tangent spaces of the local and global pseudocharacter spaces at absolutely irreducible points as H¹ of the adjoint, compatibly with restriction.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-rigid-spaces`, `ModularityAndLanglandsExtensionsPartII:SP.0/polarized-lifts-and-traces`, `GlobalGaloisDeformations:R04.1/tangent-spaces`, `GlobalGaloisDeformations:G7/polarized-tangent-obstruction`.

## Layer SP.1: Analytic continuation of symmetric power functoriality between unitary eigenvarieties

**Targets.** On the definite unitary eigenvarieties ℰ\_2(τ̄\_2) and ℰ\_n(τ̄\_n) of the parent's §4.3, with the symmetric power maps σ\_n = σ\_{n,g} × σ\_{n,p} into 𝒳\_{ps,n} × 𝒯\_n: Theorem 2.24 (non-critical case) and Theorem 2.27 (ordinary case), which carry the image of every irreducible component through a symmetric-power point into ℰ\_n(τ̄\_n); Lemma 2.29 (non-criticality of all triangulations passes to Sym^{n−1} when the Weil–Deligne ratio is not a root of unity of order < n); and Corollary 2.28, automorphy of Sym^{n−1} along a whole irreducible component.

**Sources.** Newton–Thorne I §2.18.1, pp. 40–46.

*Requires:* `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.0`, `PadicFamilies:L2a`, `PadicHodgeTheory:R06.3`, `PhiGammaModulesAndIwasawaCohomology:PG.7`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `PotentialAutomorphyInfrastructurePartII:PL.8`.

<a id="sp-1-continuation-noncritical"></a>
### SP.1.1 Analytic continuation of symmetric power functoriality: the non-critical case

`ModularityAndLanglandsExtensionsPartII:SP.1/continuation-noncritical` · theorem · planet: Analytic continuation of functoriality

Let n ≥ 3 and τ̄\_2 a residual conjugate self-dual pseudocharacter of dimension 2 with τ̄\_n = Sym^{n−1}τ̄\_2. Let (π\_2, χ\_2) be a refined automorphic representation of the definite unitary group G\_2 with tr r̄\_{π\_2,ι} = τ̄\_2 and point z\_2 = γ\_2(π\_2, χ\_2) of ℰ\_2(τ̄\_2). Suppose (1) χ\_2 is numerically non-critical and n-regular; (2) there is a refined automorphic (π\_n, χ\_n) of G\_n with (σ\_n ∘ i\_2)(z\_2) = i\_n(z\_n); (3) for every v ∈ S\_p the Zariski closure of r\_{π\_2,ι}(G\_{F\_ṽ}) contains SL\_2. Then every irreducible component 𝒞 of ℰ\_2(τ̄\_2)\_{ℂ\_p} through z\_2 satisfies (σ\_n ∘ i\_2)(𝒞) ⊂ i\_n(ℰ\_n(τ̄\_n)\_{ℂ\_p}).


*Hypotheses and conventions.*

- n ≥ 3 (standing assumption of §2.18.1); ℰ\_m(τ̄\_m) the eigenvariety of the definite unitary group G\_m with closed realization i\_m : ℰ\_m → 𝒳\_{ps,m} × 𝒯\_m (parent §4.3).
- Numerically non-critical: the slopes of the refinement are small relative to the gaps between Hodge–Tate weights, so the attached triangulation is non-critical.


*Proof route.*

- r\_{π\_n,ι}|\_{G\_{F\_ṽ}} is trianguline with parameter σ\_{n,p}(δ\_2), which is regular and non-critical by (1) and (3) (Remark 2.25: (3) keeps all symmetric powers locally irreducible).
- Choose an affinoid U around z\_n in the absolutely irreducible, regular parameter locus. Define 𝒵 to be the Zariski closure in U of the points whose local representations are trianguline with the prescribed parameters. Family triangulation on the dense classical locus puts the eigenvariety in this closure near z\_n; it does not assert a triangulation over every point of an arbitrary neighbourhood.
- The trianguline tangent bound (parent §4.3, NTI Proposition 2.11), generic local Weil–Deligne parameters and adjoint Selmer vanishing give dim T\_{z\_n}𝒵≤dim 𝒲\_n. The eigenvariety is equidimensional of this dimension, so its closed realization equals 𝒵 near z\_n and is smooth there.
- Apply family triangulation to the rank-two eigenvariety at its accumulating classical points and take symmetric powers. Their image lies in the pointwise trianguline locus, hence in 𝒵. Zariski density and closedness give the required containment of an affinoid neighbourhood; SP.0/analytic-continuation-lemma then treats every component through z\_2.


*Checks.*

- For n = 3 and a refinement with α/β not a root of unity of order 1 or 2, condition (1) is the non-critical slope condition plus α ≠ ±β.
- If H¹\_f(F⁺, ad r\_{π\_n,ι}) ≠ 0 the dimension bound fails and the proof gives nothing (the hypothesis enters through PL.8).


*Source.*

- [nt21] Theorem 2.24 and proof, §2.18.1, pp. 40–42; Remark 2.25, p. 42: States and proves that under non-criticality, n-regularity and large local image the symmetric power map sends every component of ℰ\_2 through a symmetric-power point into ℰ\_n, by the tangent-space bound on the trianguline locus.


*Needs.* `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`, `PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-selmer-vanishing`, `PotentialAutomorphyInfrastructurePartII:PL.8/generic-weil-deligne`, `PotentialAutomorphyInfrastructurePartII:PL.8/bloch-kato-at-generic-places`, `PadicFamilies:L2a/equidimensional-components`, `ModularityAndLanglandsExtensionsPartII:SP.0/analytic-continuation-lemma`, `ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-tangent-spaces`.

<a id="sp-1-continuation-ordinary"></a>
### SP.1.2 Analytic continuation of symmetric power functoriality: the ordinary case

`ModularityAndLanglandsExtensionsPartII:SP.1/continuation-ordinary` · theorem

Let n ≥ 3 and (π\_2, χ\_2), z\_2 be as in SP.1/continuation-noncritical. Suppose (1) χ\_2 is ordinary; (2) there is a refined automorphic (π\_n, χ\_n) of G\_n with (σ\_n ∘ i\_2)(z\_2) = i\_n(z\_n); (3) the Zariski closure of r\_{π\_2,ι}(G\_F) contains SL\_2. Then every irreducible component 𝒞 of ℰ\_2(τ̄\_2)\_{ℂ\_p} through z\_2 satisfies (σ\_n ∘ i\_2)(𝒞) ⊂ i\_n(ℰ\_n(τ̄\_n)\_{ℂ\_p}).


*Hypotheses and conventions.*

- Ordinary refinement: the U\_p-eigenvalues are p-adic units after the normalization of the parent's §4.3.
- In the proof the affinoid neighbourhood U must be chosen inside 𝒳^{irr}\_{ps,n} × (𝒯^{reg}\_n ∩ 𝒯^{HT-reg}\_n), which is Zariski open and contains δ\_n (correction E12 of the extraction).


*Proof route.*

- Replace the trianguline locus by the closed subspace 𝒵^{ord} of the flag variety of G\_{F\_ṽ}-stable flags in the universal representation over U whose graded pieces are the characters δ\_{z,v,i}.
- The map 𝒵^{ord} → U is a closed immersion once U is shrunk as in the hypothesis (correction E12); tangent vectors of 𝒵^{ord} at z\_n with fixed weight lie in H¹\_g (PotentialAutomorphyInfrastructurePartII PL.8, ordinary tangent vectors, after Geraghty Lemma 3.9).
- H¹\_f(F⁺, ad r\_{π\_n,ι}) = 0 (PL.8) gives dim T\_{z\_n}𝒵^{ord} ≤ dim 𝒲\_n; conclude as in the non-critical case with SP.0/analytic-continuation-lemma.


*Checks.*

- A CM form fails (3): its image has Zariski closure a torus normaliser, not containing SL\_2.
- For an ordinary point the theorem needs no slope condition, in contrast to SP.1/continuation-noncritical.


*Source.*

- [nt21] Theorem 2.27 and proof, §2.18.1, pp. 42–43: States and proves the ordinary analogue: the symmetric power map sends every component of ℰ\_2 through an ordinary symmetric-power point into ℰ\_n, using the closed space of ordinary flags.


*Needs.* `ModularityAndLanglandsExtensions:ML.3`, `PotentialAutomorphyInfrastructurePartII:PL.8/ordinary-tangent-vectors-h1g`, `PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-selmer-vanishing`, `PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-of-weight`, `PadicFamilies:L2a/equidimensional-components`, `ModularityAndLanglandsExtensionsPartII:SP.0/analytic-continuation-lemma`, `ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-rigid-spaces`.

<a id="sp-1-noncritical-symmetric-powers"></a>
### SP.1.3 Non-criticality passes to symmetric powers

`ModularityAndLanglandsExtensionsPartII:SP.1/noncritical-symmetric-powers` · theorem

Let ρ\_v : G\_{F\_ṽ} → GL\_2(Q̄\_p) be continuous, regular and de Rham, such that WD(ρ\_v) has distinct Jordan–Hölder characters χ\_1, χ\_2 with (χ\_1/χ\_2)^i ≠ 1 for 1 ≤ i ≤ n − 1, and suppose every triangulation of ρ\_v is non-critical. Then every triangulation of Sym^{n−1}ρ\_v is non-critical.


*Hypotheses and conventions.*

- ρ\_v regular de Rham (distinct Hodge–Tate weights at every embedding).
- The ratio condition is n-regularity of the Weil–Deligne parameter.


*Proof route.*

- Work with the filtered (φ, N, Gal(L/K))-module of ρ\_v (PadicHodgeTheory R06.3). If N ≠ 0 the triangulation is unique and non-criticality is read off directly.
- If N = 0 the refinements of Sym^{n−1} are orderings of the monomials χ\_1^aχ\_2^b, which are distinct by n-regularity; the Hodge filtration of Sym^{n−1} at each embedding τ is spanned by powers of the line l\_τ = ⟨e\_1 + a\_τe\_2⟩.
- Non-criticality of every triangulation of ρ\_v means a\_τ ≠ 0, ∞ for all τ; a Vandermonde determinant in the powers of a\_τ shows every flag of φ-stable lines in Sym^{n−1} is in general position with the Hodge filtration (Chenevier 2011, Example 3.26).


*Checks.*

- For n = 2 the statement is the hypothesis itself.
- If χ\_1/χ\_2 has order 2 and n = 3, the monomials χ\_1², χ\_1χ\_2, χ\_2² have χ\_1² = χ\_2², two refinements of Sym² coincide in parameter and the argument breaks down; n-regularity is necessary.


*Source.*

- [nt21] Lemma 2.29 and proof, §2.18.1, pp. 44–45: States that non-criticality of all triangulations of a regular de Rham ρ\_v with n-regular Weil–Deligne parameter passes to Sym^{n−1}, proved with a Vandermonde determinant.


*Needs.* `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PhiGammaModulesAndIwasawaCohomology:PG.7/triangulation`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`.

<a id="sp-1-automorphy-along-components"></a>
### SP.1.4 Symmetric power automorphy along an irreducible component of ℰ\_2

`ModularityAndLanglandsExtensionsPartII:SP.1/automorphy-along-components` · theorem · planet: Symmetric power automorphy along components

Let n ≥ 3 and (π\_2, χ\_2), (π′\_2, χ′\_2) refined automorphic representations of G\_2 with points z\_2, z′\_2 ∈ ℰ\_2(Q̄\_p). Suppose either (non-critical case) χ\_2 is numerically non-critical and n-regular; every triangulation of r\_{π′\_2,ι}|\_{G\_{F\_ṽ}} (v ∈ S\_p) is non-critical and χ′\_2 is n-regular; the Zariski closures of r\_{π\_2,ι}(G\_{F\_ṽ}) and r\_{π′\_2,ι}(G\_{F\_ṽ}) contain SL\_2; Sym^{n−1}r\_{π\_2,ι} ≅ r\_{π\_n,ι} for an automorphic π\_n of G\_n; and z\_2, z′\_2 lie on a common irreducible component of ℰ\_{2,ℂ\_p}; or (ordinary case) χ\_2 is ordinary, the Zariski closure of r\_{π\_2,ι}(G\_F) contains SL\_2, Sym^{n−1}r\_{π\_2,ι} ≅ r\_{π\_n,ι}, and z\_2, z′\_2 lie on a common component. Then Sym^{n−1}r\_{π′\_2,ι} ≅ r\_{π′\_n,ι} for an automorphic representation π′\_n of G\_n(𝔸\_{F⁺}).


*Hypotheses and conventions.*

- n ≥ 3; refinements accessible in the sense of the parent's §1.1.


*Proof route.*

- The refinement χ\_n = (χ\_{2,v,1}^{n−1} ⊗ χ\_{2,v,1}^{n−2}χ\_{2,v,2} ⊗ ⋯ ⊗ χ\_{2,v,2}^{n−1}) of π\_n is accessible (Zelevinsky Theorem 9.7, Rodier §4.4), so z\_n exists and (σ\_n ∘ i\_2)(z\_2) = i\_n(z\_n).
- SP.1/continuation-noncritical or SP.1/continuation-ordinary puts σ\_n ∘ i\_2 of the common component into i\_n(ℰ\_n); Conrad's base change of components (SP.0/analytic-continuation-lemma) handles the passage to ℂ\_p.
- The image point z′\_n of z′\_2 is classical: in the ordinary case by Hida classicality (PL.2), in the non-critical case because Sym^{n−1} of every triangulation of r\_{π′\_2,ι} is non-critical (SP.1/noncritical-symmetric-powers) and non-critical points with n-regular refinement are classical (parent §4.3, Newton–Thorne I Lemma 2.30).
- A classical point of ℰ\_n is attached to an automorphic π′\_n of G\_n with r\_{π′\_n,ι} ≅ Sym^{n−1}r\_{π′\_2,ι}.


*Checks.*

- Taking z′\_2 = z\_2 recovers the hypothesis.
- The ordinary case applies to two Hida families on one component; the non-critical case needs both refinements n-regular.


*Source.*

- [nt21] Corollary 2.28 and proof with its footnote, §2.18.1, pp. 43–44: Deduces from Theorems 2.24 and 2.27 that automorphy of Sym^{n−1} propagates along an irreducible component of ℰ\_2, with classicality from Lemmas 2.26, 2.29 and 2.30.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.1/continuation-noncritical`, `ModularityAndLanglandsExtensionsPartII:SP.1/continuation-ordinary`, `ModularityAndLanglandsExtensionsPartII:SP.1/noncritical-symmetric-powers`, `ModularityAndLanglandsExtensionsPartII:SP.0/analytic-continuation-lemma`, `PotentialAutomorphyInfrastructurePartII:PL.2/hida-classicality`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-constituent-galois-representation`.

## Layer SP.2: From the eigencurve to definite unitary eigenvarieties

**Targets.** The twin involution on the eigencurve and its slope and weight identities (Lemma 2.32, with E9); trivialising a family of characters over a CM field (Lemma 2.34, with Chevalley's congruence subgroup theorem); the base-change morphism b from the tame-level-N eigencurve ℰ\_0 to the definite unitary eigenvariety ℰ\_2 of a soluble CM extension; Theorem 2.33, automorphy of Sym^{n−1} is constant on irreducible components of ℰ\_0 under the non-critical or ordinary hypotheses (the theorem the parent states in §4.5 as an import contract); and Lemma 2.35, the locus where those hypotheses fail is Zariski closed.

**Sources.** Newton–Thorne I §2.31, pp. 49–52.

*Requires:* `ArithmeticGaloisRepresentations:G7`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `ModularityAndLanglandsExtensions:ML.0`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensionsPartII:SP.0`, `ModularityAndLanglandsExtensionsPartII:SP.1`, `PadicFamilies:L2`, `PadicFamilies:L2a`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="sp-2-twin-map"></a>
### SP.2.1 The twin involution on the eigencurve

`ModularityAndLanglandsExtensionsPartII:SP.2/twin-map` · construction

Let ℰ\_0 be the Coleman–Mazur–Buzzard eigencurve of tame level N at p, and Z\_0^{pc} ⊂ ℰ\_0 the set of classical points z attached to (π\_0, χ\_{0,1} ⊗ χ\_{0,2}) with π\_{0,p} not a twist of Steinberg. Let ψ be the finite-order Hecke character of ℚ unramified outside p whose p-component restricts on ℤ\_p^× to χ\_{0,2}^{−1}|\_{ℤ\_p^×}. The twin of z is τ(z) ∈ Z\_0^{pc}, the point attached to π\_0 ⊗ ιψ with refinement χ\_{0,2}ψ\_p ⊗ χ\_{0,1}ψ\_p, where ψ\_p = ψ|\_{ℚ\_p^×} is the p-component of ψ (correction E9 of the extraction). Then τ² = 1; for π\_{0,p} unramified the twin is the companion point of the other refinement. Lemma 2.32: the slopes satisfy s(z) + s(τ(z)) = k − 1, and v\_p(κ(z)(1 + q) − 1) = v\_p(κ(τ(z))(1 + q) − 1), with q = p for p odd and q = 4 for p = 2.


*Hypotheses and conventions.*

- π\_{0,p} not a twist of Steinberg (so both refinements are accessible).
- k is the weight of π\_0; κ is the weight map to the weight space 𝒲\_0.


*Proof route.*

- Both χ\_{0,2}ψ\_p ⊗ χ\_{0,1}ψ\_p and the original refinement are accessible refinements of the twisted representation (π\_{0,p} is a principal series).
- The product of the two normalized U\_p eigenvalues has valuation k−1, which gives the slope sum. Write the weight character on 1+q as (1+q)^{k−2}η, with η of p-power order. The twin replaces η by η^{-1}. If η=1 the valuations coincide. If η≠1, v\_p(η(1+q)−1)=v\_p(η−1) is strictly below v\_p((1+q)^{k−2}−1) (when the latter is nonzero), and the same holds for η^{-1}; the two weight valuations therefore coincide. A finite-order twist is not in general invisible to valuation.


*API.*

- `Eigencurve.twin` (constructor): The twin τ : Z\_0^{pc} → Z\_0^{pc} of a classical non-Steinberg point.
- `Eigencurve.twin_twin` (simp): τ(τ(z)) = z.
- `Eigencurve.slope_add_slope_twin` (relation): s(z) + s(τ(z)) = k − 1 for z of weight k.
- `Eigencurve.weight_valuation_twin` (relation): v\_p(κ(z)(1+q) − 1) = v\_p(κ(τ(z))(1+q) − 1).
- `Eigencurve.twin_same_rep` (compatibility): r\_{τ(z)} ≅ r\_z ⊗ ψ: the twin has the same Galois representation up to a finite-order twist.


*Unit tests.*

- `Eigencurve.twin_unramified` (computation): For a level-one form of weight 12 at p = 2 with U\_2-roots α, β, the twin of (Δ, α) is (Δ, β) and s(α) + s(β) = 11.
- `Eigencurve.twin_ne_self` (non-example): A point is never its own twin when s ≠ (k − 1)/2: the slopes of z and τ(z) differ.
- `Eigencurve.twin_slope_sum_degenerate` (degenerate): For k = 2 the slopes of z and τ(z) sum to 1.
- `Eigencurve.twin_Qp_component` (non-example): A restriction ψ|\_{ℤ\_p^×} has no assigned value on p and is not a character of ℚ\_p^×. Substituting it into the refinement is ill-typed; the full local component ψ\_p is required.


*Checks.*

- For π\_{0,p} unramified with U\_p-roots α, β, the twin exchanges α and β (ψ trivial), and s(α) + s(β) = k − 1.
- Twins of points of the boundary annuli are located by SP.3/twin-on-boundary-annulus.


*Uses.*

- Newton–Thorne I, Lemma 3.3, p. 54: locates the twin of a point of X\_i on X\_{i′} with i + i′ = (k − 1)/v\_p(w)
- Newton–Thorne I, Lemma 3.7, p. 56: the ping-pong move passes from a point to its twin on another annulus


*Source.*

- [nt21] §2.31, definition of the twin and Lemma 2.32, p. 49: Defines the twin of a point of Z\_0^{pc} by twisting with ψ and exchanging the refinement, and proves the slope sum and weight valuation identities.


*Needs.* `PadicFamilies:L2/coleman-mazur-comparison`, `PadicFamilies:L2a/eigenpacket-points`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`.

<a id="sp-2-trivialising-character-families"></a>
### SP.2.2 Trivialising a family of characters over a CM field

`ModularityAndLanglandsExtensionsPartII:SP.2/trivialising-character-families` · theorem

Let F be a CM field in which every p-adic place of F⁺ splits, S̃\_p a set of p-adic places of F with S̃\_p ⊔ S̃\_p^c the set of all p-adic places, W a connected rigid space over E and χ : G\_ℚ → 𝒪(W)^× a continuous character unramified almost everywhere. Then there are a finite étale morphism η : W̃ → W and a continuous character ψ : G\_F → 𝒪(W̃)^×, unramified almost everywhere and at every ṽ ∈ S̃\_p, with ψψ^c = η^*(χ)|\_{G\_F}. Chevalley's theorem is used: every finite-index subgroup of 𝒪\_F^× contains the units congruent to 1 modulo some non-zero ideal.


*Hypotheses and conventions.*

- F CM with all p-adic places of F⁺ split; W connected.


*Proof route.*

- On the p-adic units prescribe a character L equal to χ^{-1} on the conjugates of the chosen places and trivial on the chosen places. Its restriction to global units is trivial on a finite-index subgroup, by the CM norm-one-unit calculation.
- Chevalley supplies a compact open subgroup U^p of the units away from p such that L is trivial on Γ(U^p)=𝒪\_F^×∩(U^p×∏\_{w|p}𝒪\_{F\_w}^×). In the idele-class quotient by U^p, the image of the p-adic units has finite index, by class-group finiteness. This is not a finite-index assertion for the closure of all global units in all p-adic units.
- Restriction between rigid character spaces for that finite-index inclusion is finite étale. Pull back to extend L and obtain λ; χλλ^c is finite order because it is unramified at p and outside finitely many places. After a constant coefficient extension write it as φφ^c using the finite-order auxiliary-character theorem and put ψ=φλ^{-1}.


*Checks.*

- For W a point the lemma is the existence of a continuous character ψ with ψψ^c = χ|\_{G\_F} unramified at S̃\_p (PL.0, auxiliary characters).
- If some p-adic place of F⁺ is inert in F, S̃\_p cannot be chosen and the lemma is not claimed.


*Source.*

- [nt21] Lemma 2.34 and proof, §2.31, pp. 51–52: Constructs, after a finite étale cover of the parameter space, a family of characters of G\_F whose product with its conjugate is a given family of characters of G\_ℚ, using Chevalley's theorem on units.


*Needs.* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`.

<a id="sp-2-eigencurve-base-change-morphism"></a>
### SP.2.3 The base-change morphism from the eigencurve to a unitary eigenvariety

`ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-base-change-morphism` · construction

Let F′ be an abelian CM field in which the primes dividing Np split, with [F′⁺ : ℚ] even and F′/F′⁺ everywhere unramified, F ⊃ F′ a soluble Galois CM extension of ℚ in which every prime dividing Np splits and F/F⁺ is everywhere unramified, ψ the family of characters of SP.2/trivialising-character-families over W̃ → 𝒲\_0, and 𝒯̃ = 𝒯\_0 ×\_{𝒲\_0} W̃. With b\_p : 𝒯̃ → 𝒯\_2 the twist of the refinement parameter by ψ^{−1} at the places of S̃\_p, define b : 𝒳\_{0,ps} × 𝒯̃ → 𝒳\_{2,ps} × 𝒯\_2, (τ, μ) ↦ (τ|\_{G\_F} ⊗ ψ^{−1}, b\_p(μ)). Then b maps the classical points of the lift of ℰ\_0 into i\_2(ℰ\_2), by Labesse's descent of the base change to the definite unitary group G\_2.


*Hypotheses and conventions.*

- F, F′ as above; G\_2 the definite unitary group of PotentialAutomorphyInfrastructurePartII PL.2 over F⁺.
- Choose F so that ψ|\_{G\_F} is unramified away from p. All primes dividing Np split in F, so no imaginary quadratic inducing field of a classical tame-level-N point lies in F: that field ramifies at some prime dividing Np.


*Proof route.*

- At a classical point (π\_0, χ\_0) the base change π\_{0,F} ⊗ ψ^{−1} to GL\_2(𝔸\_F) is conjugate self-dual (ψψ^c = det twist), cuspidal: failure would make π\_0 induced from an imaginary quadratic subfield of F ramified at a prime dividing Np, contrary to complete splitting there.
- Labesse's Théorème 5.4 (EndoscopicTransferAndUnitaryTraceComparison ET.7a, unitary descent) descends it to an automorphic representation of G\_2 with the twisted refinement b\_p(χ\_0), so b sends the point into i\_2(ℰ\_2).
- b is a morphism of rigid spaces because restriction of pseudocharacters and twisting by the family ψ are.


*API.*

- `Eigencurve.baseChange` (constructor): The morphism b : 𝒳\_{0,ps} × 𝒯̃ → 𝒳\_{2,ps} × 𝒯\_2.
- `Eigencurve.baseChange_classical` (characterisation): b sends classical points of ℰ\_0 into i\_2(ℰ\_2) with the twisted refinement.
- `Eigencurve.baseChange_trace` (simp): The pseudocharacter component of b(τ, μ) is τ|\_{G\_F} ⊗ ψ^{−1}.
- `Eigencurve.baseChange_components` (functoriality): b maps each irreducible component of the lift of ℰ\_0 into a single irreducible component of the Zariski closure of its classical image.


*Unit tests.*

- `Eigencurve.baseChange_weights` (computation): At a classical point of weight k the image point has labelled Hodge–Tate weights {0, k − 1} at every embedding of F, before the ψ^{−1} twist.
- `Eigencurve.baseChange_trivial_extension` (degenerate): If ψ is trivial on the relevant point, the pseudocharacter part is simply the restriction τ|\_{G\_F}.
- `Eigencurve.baseChange_CM_excluded` (non-example): If the splitting condition is dropped and F contains the imaginary quadratic inducing field, the base change decomposes as two characters and cannot give the claimed cuspidal point.


*Checks.*

- At a classical point of weight k the image has parallel Hodge–Tate weights {0, k − 1} at every embedding of F (before the ψ-twist).
- Base change of a form induced from an imaginary quadratic field K is not cuspidal when K⊂F. The splitting condition on F rules out this case; a CM form whose inducing field is not contained in F is not excluded merely for being CM.


*Uses.*

- Newton–Thorne I, proof of Theorem 2.33, pp. 50–51: transports a component of ℰ\_0 into ℰ\_2, where Corollary 2.28 applies


*Source.*

- [nt21] proof of Theorem 2.33, §2.31, pp. 50–51: Builds the field F, the family ψ and the morphism b from the eigencurve to the unitary eigenvariety, and checks it on classical points with Labesse's descent.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.2/trivialising-character-families`, `ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-rigid-spaces`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/weak-unitary-base-change`, `PadicFamilies:L2/coleman-mazur-comparison`, `ModularityAndLanglandsExtensions:ML.3`.

<a id="sp-2-eigencurve-propagation"></a>
### SP.2.4 Automorphy of symmetric powers is constant on components of the eigencurve

`ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-propagation` · theorem · planet: Theorem 2.33: propagation on the eigencurve

Let n ≥ 2 and (π\_0, χ\_0), (π′\_0, χ′\_0) refined cuspidal automorphic representations of GL\_2(𝔸\_ℚ) whose points z\_0, z′\_0 of the eigencurve ℰ\_0 (tame level N) lie on a common irreducible component of ℰ\_{0,ℂ\_p}. Suppose either (1) χ\_0 is numerically non-critical and n-regular, (2) χ′\_0 is n-regular, (3) the Zariski closures of r\_{π\_0,ι}(G\_{ℚ\_p}) and r\_{π′\_0,ι}(G\_{ℚ\_p}) contain SL\_2, and (4) Sym^{n−1}r\_{π\_0,ι} is automorphic; or (1ord) χ\_0 is ordinary, (2ord) π\_0 and π′\_0 are not CM, and (3ord) Sym^{n−1}r\_{π\_0,ι} is automorphic. Then Sym^{n−1}r\_{π′\_0,ι} is automorphic. This proves the statement the parent records in §4.5 (node ML.3/eigenvariety-propagation).


*Hypotheses and conventions.*

- Automorphy of Sym^{n−1}r\_{π,ι} in the sense of the parent's §0.2 (node ML.0/nt26-automorphy-predicate).
- For n = 2 the statement is trivial; the work is for n ≥ 3.


*Proof route.*

- Choose F′, F, ψ and b as in SP.2/eigencurve-base-change-morphism.
- After a finite coefficient extension the selected component is geometrically irreducible. Its pullback along W̃→W is finite étale, and each irreducible component of that pullback maps onto it. Thus lifts of both points can be chosen on one geometrically irreducible component. The accumulating classical locus and closedness put the image of this component inside the unitary eigenvariety.
- Large local image at p (3) gives non-criticality of all triangulations (Newton–Thorne I Example 2.10), so the hypotheses of SP.1/automorphy-along-components hold for the base-changed points; in the ordinary case (2ord) gives large global image.
- b maps the common component into a component of ℰ\_2 through b(z\_0) and b(z′\_0) (SP.0/analytic-continuation-lemma); Sym^{n−1} of the base change of π\_0 is automorphic on G\_n by (4) and Labesse descent.
- SP.1/automorphy-along-components gives automorphy of Sym^{n−1}r\_{π′\_0,ι}|\_{G\_F} on G\_n, hence on GL\_n(𝔸\_F) by base change; soluble descent for GL\_n (parent ML.5, cyclic base change and descent) returns to ℚ.


*Checks.*

- n = 2: the conclusion holds for every z′\_0 (Sym^1 is r itself, automorphic by modularity).
- Two points on a common Hida family with non-CM forms satisfy the ordinary hypotheses.


*Source.*

- [nt21] Theorem 2.33 and proof, §2.31, pp. 50–51: States and proves that automorphy of Sym^{n−1} propagates along irreducible components of the eigencurve, through base change to a definite unitary eigenvariety and Corollary 2.28.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-base-change-morphism`, `ModularityAndLanglandsExtensionsPartII:SP.1/automorphy-along-components`, `ModularityAndLanglandsExtensionsPartII:SP.0/analytic-continuation-lemma`, `ModularityAndLanglandsExtensions:ML.0/nt26-automorphy-predicate`, `ModularityAndLanglandsExtensions:ML.5/cyclic-base-change-gln`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

<a id="sp-2-bad-locus-closed"></a>
### SP.2.5 The locus where the hypotheses of Theorem 2.33 fail is Zariski closed

`ModularityAndLanglandsExtensionsPartII:SP.2/bad-locus-closed` · theorem

Fix n ≥ 1. The set Z ⊂ ℰ\_0 of points x whose pseudocharacter t\_x is absolutely reducible, or is the trace of an absolutely irreducible ρ\_x whose image has Zariski closure not containing SL\_2, or satisfies t\_x|\_{G\_{ℚ\_l}} = χ\_1 + χ\_2 with (χ\_1/χ\_2)^i = 1 for some prime l | N and some 1 ≤ i ≤ n − 1, is Zariski closed in ℰ\_0.


*Hypotheses and conventions.*

- ℰ\_0 of tame level N; t\_x the specialised universal pseudocharacter.


*Proof route.*

- Absolute reducibility is a Zariski closed condition on the pseudocharacter space (Chenevier §4.2; SP.0/pseudocharacter-rigid-spaces).
- For absolutely irreducible ρ\_x, the Zariski closure of the image contains SL\_2 iff Sym^6ρ\_x is absolutely irreducible (finite subgroups of PGL\_2 and normalisers of tori have no irreducible Sym^6); this is again a reducibility condition on the pseudocharacter Sym^6 t\_x.
- At l|N choose finitely many local Galois elements whose character values detect the ratio conditions. The discriminants of the characteristic polynomials of Sym^{n−1} at these elements are analytic functions. Their common vanishing cuts out the specified finite-order-ratio locus, as in NTI pp. 52–53, without depending on the later SP.8 argument.


*Checks.*

- The CM points of a CM family form part of Z (their images have Zariski closure a torus normaliser).
- For n = 1 the ratio condition is empty and Z is the reducible-or-small-image locus.


*Source.*

- [nt21] Lemma 2.35 and proof, §2.31, pp. 52–53: Proves that reducibility, small Zariski closure of the image, and non-regularity at primes dividing the level define a Zariski closed subset of the eigencurve.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.0/pseudocharacter-rigid-spaces`, `ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`, `PadicFamilies:L2/coleman-mazur-comparison`.

## Layer SP.3: Level one: the 2-adic boundary of weight space and ping-pong

**Targets.** Buzzard–Kilford's description of the tame-level-one 2-adic eigencurve over the boundary annulus |8| < |w| < 1 as a disjoint union of annuli X\_i on which the slope is i·v\_2(w) (Newton–Thorne I Theorem 3.2); the classical weights in the boundary annulus; the position of twins (Lemma 3.3, with E1); refinements of level-one forms at 2 are numerically non-critical and n-regular (Lemma 3.4, with the mod 5 and mod 7 congruences); the local image criteria of Lemma 3.5 (with Sen's theorem); moving within one annulus (Lemma 3.6); the ping-pong move (Lemma 3.7); and Theorem 3.1 = Theorem D, symmetric power functoriality for one level-one form gives it for all (the theorem the parent states in §4.7).

**Sources.** Newton–Thorne I §3, pp. 53–57; Buzzard–Kilford, Compositio Math. 141 (2005).

*Requires:* `ArithmeticGaloisRepresentations:G7`, `AutomorphicGaloisRepresentations:R19.1`, `ModularityAndLanglandsExtensions:ML.0`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.2`, `PadicFamilies:L2`, `PadicFamilies:L2a`, `PadicHodgeTheory:R06.3`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `mathlib:padicValNat.pow_two_sub_one`.

<a id="sp-3-buzzard-kilford-boundary"></a>
### SP.3.1 Buzzard–Kilford: the 2-adic eigencurve of tame level one over the boundary annulus

`ModularityAndLanglandsExtensionsPartII:SP.3/buzzard-kilford-boundary` · theorem · planet: Buzzard–Kilford boundary annuli

Take p = 2 and N = 1. Then ℰ\_0 lies over the component 𝒲\_0⁺ of weight space where χ(−1) = 1, and w = χ(5) − 1 identifies 𝒲\_0⁺ with the open unit disc {|w| < 1}. Over the annulus 𝒲\_0(b) = {|8| < |w| < 1}, the preimage ℰ\_0(b) = κ^{−1}(𝒲\_0(b)) is a disjoint union ⊔\_{i≥1} X\_i of admissible opens, each κ|\_{X\_i} : X\_i → 𝒲\_0(b) is an isomorphism, and on X\_i the slope is i·v\_2(w). Buzzard–Kilford also deduce that there are no newforms of level 4 and odd slope (used in the proof of Newton–Thorne I Theorem 7.6, p. 90). This proves the statement the parent records in §4.6 (node ML.3/buzzard-kilford-eigencurve).


*Hypotheses and conventions.*

- The cuspidal eigencurve: over the boundary annulus the ordinary part of the full eigencurve is the Eisenstein family, removed here (Pilloni §6; Buzzard–Calegari Lemma 7.4).


*Proof route.*

- Buzzard–Kilford compute the U\_2 operator on overconvergent forms of weight χ with |8| < |w(χ)| < 1 in the basis of powers of the 2-adic Hauptmodul and show its Newton polygon has slopes v\_2(w), 2v\_2(w), 3v\_2(w), … each with multiplicity one (Buzzard–Kilford, Theorem B).
- Hence the spectral curve over 𝒲\_0(b) splits into components of degree one over weight space, the X\_i.
- Remove the Eisenstein component to pass to the cuspidal eigencurve (Pilloni; Buzzard–Calegari).


*Checks.*

- At w with v\_2(w) = 1/2 (a weight with m = 2 in SP.3/boundary-annulus-weights) the slopes are 1/2, 1, 3/2, …
- No classical point of odd slope and level 4 exists over the annulus.


*Source.*

- [nt21] Theorem 3.2, §3, pp. 53–54: Records Buzzard–Kilford's theorem in the form used: the boundary annulus, the decomposition into annuli X\_i mapping isomorphically to weight space, and slope i·v\_2(w) on X\_i.
- [nt21] proof of Theorem 7.6, p. 90: Uses the consequence of Buzzard–Kilford that there are no newforms of level 4 and odd slope.
- [bk05] Theorem B and its proof, §§2–4: Computes the slopes of U\_2 on overconvergent 2-adic forms of tame level one near the boundary of weight space.


*Needs.* `PadicFamilies:L2/coleman-mazur-comparison`, `PadicFamilies:L2a/newton-degree-loci`, `PadicFamilies:L2a/strict-slope-neighborhoods`, `ModularityAndLanglandsExtensions:ML.3/buzzard-kilford-eigencurve`.

<a id="sp-3-boundary-annulus-weights"></a>
### SP.3.2 Classical weights in the 2-adic boundary annulus

`ModularityAndLanglandsExtensionsPartII:SP.3/boundary-annulus-weights` · theorem

Let z be a classical point of weight k whose weight character satisfies κ(z)(5) = 5^{k−2}ζ with ζ a primitive 2^m-th root of unity (m ≥ 0). Then κ(z) ∈ 𝒲\_0(b) iff k is odd or m ≥ 1; v\_2(w(z)) = 2^{1−m} for m ≥ 1, and v\_2(w(z)) = 2 for m = 0 with k odd; and in all these cases (k − 1)/v\_2(w(z)) is an integer.


*Hypotheses and conventions.*

- p = 2; w = κ(5) − 1.


*Proof route.*

- For j=k−2>0, lifting the exponent gives v₂(5^j−1)=2+v₂(j). If m=0 and k is odd this is 2; if k is even and k>2 it is at least 3. For k=2,m=0 one has w=0, outside the boundary annulus; do not apply the nonzero-j formula there.
- For m ≥ 1, v\_2(ζ − 1) = 2^{1−m} < 2 ≤ v\_2(5^{k−2} − 1), so v\_2(5^{k−2}ζ − 1) = 2^{1−m}.
- For m = 0, k odd: (k − 1)/2 is an integer; for m ≥ 1: (k − 1)·2^{m−1} is an integer.


*Checks.*

- k = 3, m = 0: w = 5 − 1 = 4, v\_2(w) = 2, (k − 1)/v\_2(w) = 1.
- k = 4, m = 0: w = 24, v\_2(w) = 3, not in the annulus.
- k = 2, m = 1: w = −2, v\_2(w) = 1, (k − 1)/v\_2(w) = 1.


*Source.*

- [nt21] remark after Lemma 3.3, §3, p. 54: Describes the classical weights lying over the boundary annulus and the valuation of w at them, and notes the integrality used in Lemma 3.3.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.3/buzzard-kilford-boundary`, `mathlib:padicValNat.pow_two_sub_one`.

<a id="sp-3-twin-on-boundary-annulus"></a>
### SP.3.3 The twin of a point on a boundary annulus

`ModularityAndLanglandsExtensionsPartII:SP.3/twin-on-boundary-annulus` · theorem

Let z ∈ Z\_0^{pc} ∩ ℰ\_0(b) be of weight k with z ∈ X\_i, and z′ = τ(z) its twin. Then z′ ∈ X\_{i′}, where i + i′ = (k − 1)/v\_2(w(z)). (The source prints z ∈ X\_{i′}; correction E1 of the extraction.)


*Hypotheses and conventions.*

- p = 2, N = 1; z classical with π\_{0,2} not a twist of Steinberg.


*Proof route.*

- By SP.2/twin-map, v\_2(w(z′)) = v\_2(w(z)), so z′ also lies over 𝒲\_0(b), on some X\_{i′}.
- By SP.3/buzzard-kilford-boundary the slopes are s(z) = i·v\_2(w(z)) and s(z′) = i′·v\_2(w(z)).
- Lemma 2.32 gives s(z) + s(z′) = k − 1; divide by v\_2(w(z)), an integer quotient by SP.3/boundary-annulus-weights.


*Checks.*

- Weight 3 at m = 0: v\_2(w) = 2, so i + i′ = 1, impossible for i, i′ ≥ 1; hence no classical non-Steinberg point of weight 3 and trivial character lies over the annulus with both refinements there, consistent with Buzzard–Kilford.
- Weight 2, m = 1: i + i′ = 1 likewise forbids such points.


*Source.*

- [nt21] Lemma 3.3 and proof, §3, p. 54: Locates the twin of a point on X\_i on the annulus X\_{i′} with i + i′ = (k − 1)/v\_p(w(z)).


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.2/twin-map`, `ModularityAndLanglandsExtensionsPartII:SP.3/buzzard-kilford-boundary`, `ModularityAndLanglandsExtensionsPartII:SP.3/boundary-annulus-weights`.

<a id="sp-3-level-one-refinements-at-two"></a>
### SP.3.4 Refinements of level-one forms at 2 are non-critical and regular

`ModularityAndLanglandsExtensionsPartII:SP.3/level-one-refinements-at-two` · theorem

Let π be an everywhere unramified cuspidal automorphic representation of GL\_2(𝔸\_ℚ) of weight k ≥ 2. Every accessible refinement of π at 2 is numerically non-critical and n-regular for every n ≥ 2. Ingredients: no level-one cusp form is 2-ordinary; and for l ∈ {5, 7} the semisimplified mod-l representation of a level-one eigenform is a twist of that of E\_4 or E\_6 (l = 5) or of E\_4, E\_6 or E\_8 (l = 7), so ι\_5^{−1}(α/β) ≡ 2³ or 2⁵ and ι\_7^{−1}(α/β) ≡ 2³, 2⁵ or 2⁷ modulo the maximal ideal, where α, β are the roots of the T\_2-polynomial.


*Hypotheses and conventions.*

- π of level one; refinements at p = 2 given by the roots α, β of X² − a\_2X + 2^{k−1}.


*Proof route.*

- No cusp form of level one is ordinary at 2, so both slopes are positive; since they add up to k − 1, both are less than k − 1, which gives numerical non-criticality.
- If α/β were a root of unity ζ, the mod 5 congruence with E\_4 or E\_6 gives ι\_5^{−1}(ζ) ≡ 2³ or 2⁵, so ζ is a 5-power root of unity times ±i (2 has order 4 in 𝔽\_5^×); the mod 7 congruence with E\_4, E\_6 or E\_8 makes ζ a 7-power root of unity times a cube root of unity; these are incompatible (argument of F. Diamond, avoiding Hatada's congruence).


*Checks.*

- For Δ (k = 12), a\_2 = −24, so v\_2(a\_2) = 3 and the slopes are 3 and 8, both in (0, 11).
- The argument would fail at level Γ\_0(2), where forms can be 2-ordinary.


*Source.*

- [nt21] Lemma 3.4 and proof, §3, pp. 54–55: Proves that refinements at 2 of level-one forms are numerically non-critical and n-regular for all n, by non-ordinarity at 2 and congruences modulo 5 and 7 with Eisenstein series.


*Needs.* `AutomorphicGaloisRepresentations:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`.

<a id="sp-3-local-image-criteria"></a>
### SP.3.5 Local reducibility and local image criteria for modular forms

`ModularityAndLanglandsExtensionsPartII:SP.3/local-image-criteria` · theorem

Let π be cuspidal on GL\_2(𝔸\_ℚ) of weight k ≥ 2 and p a prime. (1) r\_{π,ι}|\_{G\_{ℚ\_p}} is reducible iff π is ι-ordinary. (2) If either r\_{π,ι}|\_{G\_{ℚ\_p}} is irreducible and π\_p admits a 3-regular refinement, or k > 2 and r\_{π,ι}|\_{G\_{ℚ\_p}} is not potentially crystalline, then the Zariski closure of r\_{π,ι}(G\_{ℚ\_p}) in GL\_2 contains SL\_2. (3) If p = 2 and π is everywhere unramified, the Zariski closure of r\_{π,ι}(G\_{ℚ\_2}) contains SL\_2. Sen's theorem is used: a Hodge–Tate representation of G\_{ℚ\_p} with distinct weights has a regular maximal torus in the Zariski closure of its image.


*Hypotheses and conventions.*

- π cuspidal of weight k ≥ 2.


*Proof route.*

- (1): Thorne 2015, Theorem 2.4 and Lemma 2.3 (ordinary forms have reducible local representation and conversely, via the weight filtration).
- (2): by Sen the Zariski closure H of the image contains a regular torus; if H does not contain SL\_2, its identity component is a torus, so r is potentially abelian, induced or a sum of characters; the 3-regularity or non-potentially-crystalline hypothesis excludes both.
- (3): an induced local representation at 2 would force the T\_2-eigenvalue to vanish, which is excluded as in SP.3/level-one-refinements-at-two; reducibility is excluded by non-ordinarity.


*Checks.*

- A CM form at a prime inert in the CM field has induced local representation; its Zariski closure is a torus normaliser, and π\_p has refinement ratio −1, failing 3-regularity, consistent with (2).
- A weight-2 form with good supersingular reduction is potentially crystalline; (2) then needs the 3-regular hypothesis.


*Source.*

- [nt21] Lemma 3.5 and proof, §3, pp. 55–56: Proves the three local criteria: reducibility iff ordinarity, large Zariski closure under 3-regularity or non-potential crystallinity, and large Zariski closure at 2 in level one, using Sen's theorem.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.3/level-one-refinements-at-two`, `PotentialAutomorphyInfrastructurePartII:PL.0/iota-ordinary-implies-ordinary`, `PotentialAutomorphyInfrastructurePartII:PL.0/ordinary-implies-iota-ordinary`, `ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`.

<a id="sp-3-annulus-propagation"></a>
### SP.3.6 Moving within one annulus

`ModularityAndLanglandsExtensionsPartII:SP.3/annulus-propagation` · theorem

Let z, z′ be classical points of X\_i (for some i ≥ 1) attached to (π, χ), (π′, χ′) with χ and χ′ n-regular. If Sym^{n−1}r\_{π,ι} is automorphic, then so is Sym^{n−1}r\_{π′,ι}.


*Hypotheses and conventions.*

- p = 2, N = 1; X\_i a Buzzard–Kilford annulus.


*Proof route.*

- For n=2 automorphy is already given by the forms themselves. Assume n≥3. The annulus X\_i is geometrically irreducible, so the two points lie on a common component.
- There are no ordinary cuspidal points over this boundary annulus. The original refinement and, in the potentially crystalline case, its twin therefore have positive slopes. Since the slope sum is k−1, both are numerically noncritical. In the Steinberg case the same conclusion follows from the Steinberg slope (k−2)/2.
- Nonordinarity gives local irreducibility. An n-regular refinement with n≥3 is 3-regular, so SP.3/local-image-criteria gives large local image. Apply SP.2/eigencurve-propagation.


*Checks.*

- Two classical points of X\_1 of different weights with n-regular refinements are linked.


*Source.*

- [nt21] Lemma 3.6 and proof, §3, p. 56: Shows automorphy of Sym^{n−1} propagates between n-regular classical points of one annulus X\_i, by Theorem 2.33.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.3/buzzard-kilford-boundary`, `ModularityAndLanglandsExtensionsPartII:SP.3/local-image-criteria`.

<a id="sp-3-ping-pong-move"></a>
### SP.3.7 The ping-pong move

`ModularityAndLanglandsExtensionsPartII:SP.3/ping-pong-move` · theorem

Let π be everywhere unramified of weight k ≥ 2 with an accessible refinement χ at 2. There is m\_π ≥ 1 such that for every m ≥ m\_π there is a cuspidal π′ of GL\_2(𝔸\_ℚ), unramified outside 2, with two accessible refinements of distinct slopes, and a refinement χ′ of π′ such that (π, χ) and (π′, χ′) lie on one irreducible component of ℰ\_{0,ℂ\_p}, the point z′ of (π′, χ′) lies over 𝒲\_0(b), its twin z″ = τ(z′), attached to the twisted representation denoted π″, lies on X\_{2^m−1}, and automorphy of any one of Sym^{n−1}r\_{π,ι}, Sym^{n−1}r\_{π′,ι}, Sym^{n−1}r\_{π″,ι} implies all three.


*Hypotheses and conventions.*

- p = 2, N = 1.


*Proof route.*

- The component of (π, χ) meets ℰ\_0(b) in some X\_i (every component meets the boundary annulus, parent §4.6).
- Let m\_π be the least integer m ≥ 1 with (2i + 2^{m+1} − 3)/2 > 2i. For m ≥ m\_π put k′ = 2i + 2^{m+1} − 1 (odd) and let z′ ∈ X\_i be the point with κ(z′)(5) = 5^{k′−2}; then v\_2(w(z′)) = 2, s(z′) = 2i < (k′ − 2)/2, so z′ is classical by Coleman's small-slope criterion (PadicFamilies L2) and not 2-Steinberg (a Steinberg point would have slope (k′ − 2)/2); its two refinements have the distinct slopes 2i and k′ − 1 − 2i.
- SP.3/twin-on-boundary-annulus places the twin z″ on X\_{i′} with i′ = (k′ − 1)/2 − i = 2^m − 1 (SP.3/boundary-annulus-weights).
- The two refinements of π′ have unequal slopes, so their ratio is not a root of unity and they are n-regular for every n. They are nonordinary, so local-image-criteria gives large local image. The original level-one point uses level-one-refinements-at-two. Apply eigencurve-propagation between z and z′; twisting by the finite-order character defining the twin preserves symmetric-power automorphy and gives the equivalence with z″.


*Checks.*

- The index 2^m − 1 depends only on m, so two level-one forms can be connected through a common annulus by choosing the same m (this is the 'ping-pong').


*Source.*

- [nt21] Lemma 3.7 and proof, §3, pp. 56–57: Constructs from a level-one form a form of 2-power level on the same component whose twin lies on the annulus X\_{2^m−1}, with automorphy of symmetric powers equivalent for all three.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.3/twin-on-boundary-annulus`, `ModularityAndLanglandsExtensionsPartII:SP.3/boundary-annulus-weights`, `ModularityAndLanglandsExtensionsPartII:SP.3/annulus-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-propagation`, `PadicFamilies:L2/small-slope-classicality`.

<a id="sp-3-level-one-propagation"></a>
### SP.3.8 Theorem D: symmetric powers for one level-one form give them for all

`ModularityAndLanglandsExtensionsPartII:SP.3/level-one-propagation` · theorem · planet: Theorem D: propagation through level one

Fix n ≥ 2. If π\_0 is an everywhere unramified cuspidal automorphic representation of GL\_2(𝔸\_ℚ) of weight k ≥ 2 with Sym^{n−1}r\_{π\_0,ι} automorphic for some (equivalently any) prime p and ι, then Sym^{n−1}r\_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2. This proves the statement the parent records in §4.7 (node ML.3/level-one-ping-pong).


*Hypotheses and conventions.*

- Automorphy in the sense of ML.0/nt26-automorphy-predicate; independence of p and ι by the parent's one-prime criterion (§4.15).


*Proof route.*

- Work at p = 2. For π\_0 and π choose refinements; by SP.3/ping-pong-move with a common m ≥ max(m\_{π\_0}, m\_π) both are linked to points z″\_0, z″ on X\_{2^m−1}.
- The new points z″\_0 and z″ have unequal refinement slopes by the construction of ping-pong-move, hence n-regular refinements. Apply annulus-propagation on X\_{2^m−1}. The level-one regularity lemma is used only for the original forms.
- Chain the equivalences; pass between primes with the one-prime criterion (ML.3/one-prime-criterion).


*Checks.*

- n = 2 is trivial; for n = 3, 4, 5 the conclusion is also given by the known low-rank lifts (parent ML.3/low-rank-symmetric-powers), a consistency check.


*Source.*

- [nt21] Theorem 3.1 and proof, §3, pp. 53, 57; Introduction, Theorem D, p. 3: States Theorem D and proves it by ping-pong on the Buzzard–Kilford annuli using Theorem 2.33.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.3/ping-pong-move`, `ModularityAndLanglandsExtensionsPartII:SP.3/annulus-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.3/level-one-refinements-at-two`, `ModularityAndLanglandsExtensions:ML.3/one-prime-criterion`, `ModularityAndLanglandsExtensions:ML.0/nt26-automorphy-predicate`.

## Layer SP.4: Local representation theory for unitary level raising

**Targets.** At an inert place of a definite unitary group (Newton–Thorne I §1): the quasi-split unitary groups U\_n with their Levi subgroups and the pure inner twist of the definite group with its Whittaker normalisation; the archimedean, unramified and split endoscopic character identities (Propositions 1.6–1.7); stable base change BC from tempered representations of U\_n to conjugate self-dual parameters extending to ^LU\_n, with Mœglin's extended cuspidal support, the L-packets Π(π) and the twisted character identity (Propositions 1.9–1.11); the depth-zero cuspidal representations τ(v) and λ(v, θ) = −R\_C^{U\_3}θ of U\_3(k(v)) and λ̃(ṽ, θ̃) of GL\_3(k(ṽ)), their compact inductions and base changes (Proposition 1.12, Corollary 1.13); the types τ(v, n), λ(v, θ, n) of the parahoric p\_v with modular irreducibility and the congruence of types (Proposition 1.15); the endoscopic transfer of the test function φ(v, θ, n) (Proposition 1.16, with Kazhdan–Varshavsky); and the fixed-type local lifting rings (Lemma 1.21, Proposition 1.22(3)–(4), with E7). At a ramified place (Clozel–Thorne III §§2–3): the isomorphism of the Iwahori–Hecke algebra of U\_{2k+1} with that of Sp\_{2k} (Proposition 2.2); the Kazhdan–Lusztig modules X, Y, Z in the L-packet of St\_{n−4} ⊞ St\_3 ⊞ St\_1 with their Iwahori dimensions and Jacquet exponents (Theorems 2.3, 2.5); their integral structures, localisations and duality (Propositions 2.6, 2.9, Corollary 2.8, with E7 of that extraction); and the identification with the Mœglin–Mok packet and its signs (Theorem 3.3, Lemma 3.6, Proposition 3.7).

**Sources.** Newton–Thorne I §1, pp. 8–23; Clozel–Thorne III §§2–3, pp. 4–28.

*Requires:* `ArithmeticGaloisRepresentations:R01.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.4`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `ReductiveGroupsPartII:RG2.4`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-9-the-representation-theory-of-gl₂𝔽_q`.

<a id="sp-4-unitary-groups-and-inner-twist"></a>
### SP.4.1 Quasi-split unitary groups and the pure inner twist of the definite group

`ModularityAndLanglandsExtensionsPartII:SP.4/unitary-groups-and-inner-twist` · construction

For a quadratic extension E/F of local or global fields with conjugation c, let Φ\_n be the antidiagonal matrix with entries 1, −1, …, (−1)^{n−1} and θ\_n(g) = Φ\_n c(g)^{−t} Φ\_n^{−1}. The quasi-split unitary group U\_n is the fixed subgroup of θ\_n in Res\_{E/F} GL\_n, with its θ-stable standard pinning and L-group ^LU\_n = GL\_n(ℂ) ⋊ W\_F (w\_c acting by g ↦ Φ\_n g^{−t}Φ\_n^{−1}); for 2(n\_1 + ⋯ + n\_{k−1}) + n\_k = n its standard Levi subgroups are Res GL\_{n\_1} × ⋯ × Res GL\_{n\_{k−1}} × U\_{n\_k}. Under the standard assumptions (F/F⁺ CM and everywhere unramified, [F⁺ : ℚ] even, S ⊇ S\_p split), the definite unitary group G\_n over F⁺ (compact at infinity, quasi-split at finite places) is an inner form of U\_n via ξ(g\_1, g\_2) = (g\_1, Φ\_n^{−1}g\_2Φ\_n), lifted to a pure inner twist (ξ, u) with u\_c = (Φ\_n, Φ\_n) for n odd; a character μ of F^×\𝔸\_F^× restricting to the quadratic character of F/F⁺ fixes the L-embeddings. This gives isomorphisms ι\_v : G\_n(F⁺\_v) ≅ U\_n(F⁺\_v) at finite places and the canonical ι\_w : G\_n(F⁺\_v) ≅ GL\_n(F\_w) at split v = ww^c, compatible with base change to totally real L⁺/F⁺.


*Hypotheses and conventions.*

- Standard assumptions of Newton–Thorne I §1; for n even the twist uses (ζΦ\_n, ζ^{−1}Φ\_n) with tr ζ = 0.


*Proof route.*

- Define U\_n and its pinning; the Levi description is the block-diagonal computation.
- The class of u is trivial in H¹(F⁺\_v, U\_n) at finite places (Hilbert 90 and Rogawski §1.9), so ι\_v exists; at infinity the twist realises the compact form.
- The definite group itself and its algebraic modular forms are PotentialAutomorphyInfrastructurePartII PL.2; this node adds the pure inner twist data used to normalise transfer factors (Kaletha).


*API.*

- `UnitaryGroup.quasiSplit` (constructor): U\_n as the θ\_n-fixed subgroup of Res\_{E/F} GL\_n with its standard pinning.
- `UnitaryGroup.levi` (data): The standard Levi subgroups Res GL\_{n\_1} × ⋯ × U\_{n\_k} and parabolic induction π\_1 × ⋯ × π\_k.
- `DefiniteUnitaryGroup.pureInnerTwist` (data): The pure inner twist (ξ, u) of U\_n to G\_n and the character μ.
- `DefiniteUnitaryGroup.localIso` (projection): The isomorphisms ι\_v (inert or ramified v) and ι\_w (split v = ww^c).
- `DefiniteUnitaryGroup.localIso_baseChange` (compatibility): Compatibility of ι\_v, ι\_w with base change to a totally real L⁺/F⁺.


*Unit tests.*

- `UnitaryGroup.rank_one` (degenerate): U\_1 is the norm-one torus: its F-points are {x ∈ E^× : x c(x) = 1}.
- `UnitaryGroup.Phi_two` (computation): For n = 2, Φ\_2 = antidiag(1, −1) satisfies Φ\_2^t = −Φ\_2 = Φ\_2^{−1}, the two signs cancel in θ\_2², so θ\_2 is an involution, and its fixed group is the quasi-split U(1, 1).
- `UnitaryGroup.split_place` (compatibility): At a split place v = ww^c, U\_n(F⁺\_v) ≅ GL\_n(F\_w) via projection to the w-factor.
- `UnitaryGroup.definite_not_quasisplit` (non-example): At an infinite place G\_n(ℝ) is the compact U(n), not the quasi-split U(⌈n/2⌉, ⌊n/2⌋) for n ≥ 2.


*Checks.*

- For n = 1, U\_1 is the norm-one torus E^{N=1} and G\_1 = U\_1.
- For n = 3 the Levi subgroups are U\_3 and Res GL\_1 × U\_1.


*Uses.*

- Newton–Thorne I, §1.5, pp. 12–13: transfer factors for the endoscopic character identities are normalised by the pure inner twist (ξ, u) and μ
- Newton–Thorne I, §4, p. 59–60: the level-raising theorem works on G\_n with the identifications ι\_v at T\_1 and ι\_w at T\_2 ∪ T\_3


*Source.*

- [nt21] Notation, pp. 8–9; §1, standard assumptions and the pure inner twist, pp. 9–10: Defines U\_n, its Levi subgroups and L-group, the definite unitary group G\_n with its pure inner twist and the character μ, and the local isomorphisms ι\_v, ι\_w.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.2/definite-unitary-group`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/twisted-transfer-factor`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`.

<a id="sp-4-endoscopic-character-identities"></a>
### SP.4.2 Archimedean, unramified and split endoscopic character identities

`ModularityAndLanglandsExtensionsPartII:SP.4/endoscopic-character-identities` · theorem

Let n be odd and E = (H, s, η) an extended endoscopic triple for the definite group G = G\_n. (Archimedean) For v | ∞ and a Langlands parameter φ\_H with η ∘ φ\_H the parameter of an irreducible σ\_v of G(F⁺\_v), with π the tempered θ-invariant representation of H(F\_ṽ) of parameter φ\_H|\_{W\_{F\_v}} and f\_v a coefficient of σ\_v, there is a sign ϵ(v, E, φ\_H) ∈ {±1} with π̃(f̃\_v^H) = ϵ(v, E, φ\_H)σ\_v(f\_v) = ϵ(v, E, φ\_H) for the Whittaker-normalised twisted trace, compatible with totally real base change. (Unramified inert) For f\_v unramified and an unramified parameter φ\_H, π̃(f̃\_v^H) = σ\_{v,H}(f\_v^H) = σ\_v(f\_v), with the twisted trace normalised to fix the spherical vector. (Split) The same identities hold at split v for bounded parameters with the Whittaker normalisation.


*Hypotheses and conventions.*

- n odd; transfer factors normalised by the pure inner twist of SP.4/unitary-groups-and-inner-twist.


*Proof route.*

- Archimedean: Clozel 1982 and Kaletha 2016 Proposition 5.10; the sign depends on the pure inner twist.
- Unramified: the fundamental lemmas for stable base change (Clozel 1990) and standard endoscopy (Laumon–Ngô) with Hales's normalisation (EndoscopicTransferAndUnitaryTraceComparison ET.3).
- Split: constant terms reduce to GL\_n (Rogawski Lemma 4.13.1, Proposition 4.13.2; Shin §§3.3–3.4).


*Checks.*

- Under a totally real base extension the archimedean sign at a lifted real place equals the sign at the original place (NTI Proposition 1.6). The unramified identity uses spherical normalization; the split identity uses Whittaker normalization.


*Source.*

- [nt21] Propositions 1.6 and 1.7, §1.5, pp. 12–13: States the archimedean identity with a sign, and the unramified and split identities on the nose, for odd n with the normalisations of §1.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/unitary-groups-and-inner-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/real-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/pseudocoefficients`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`.

<a id="sp-4-stable-base-change-packets"></a>
### SP.4.3 Stable base change and L-packets of U\_n at an inert place

`ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets` · construction

Let v be a place of F⁺ inert in F. Identify irreducible admissible representations of GL\_n(F\_ṽ) with parameters W\_{F\_ṽ} × SL\_2(ℂ) → GL\_n(ℂ); let A^θ\_t(GL\_n(F\_ṽ))⁺ be the tempered conjugate self-dual ones whose parameter extends to W\_{F⁺\_v} × SL\_2(ℂ) → ^LU\_n (unique up to conjugacy, Gan–Gross–Prasad Theorem 8.1). Writing φ = ⊕ρ\_i^{l\_i} ⊕ σ\_j^{m\_j} ⊕ (τ\_k ⊕ τ\_k^{w\_c,∨})^{n\_k} with ρ\_i conjugate self-dual of sign (−1)^{n−1} and σ\_j of sign (−1)^n, the extension exists iff every m\_j is even. Mœglin's extended cuspidal support esc(τ) of a tempered τ of U\_n(F⁺\_v) equals sc(π\_τ) for a unique π\_τ ∈ A^θ\_t(GL\_n(F\_ṽ))⁺ (Proposition 1.9); BC : τ ↦ π\_τ is surjective with finite fibres, and the L-packets Π(π) = BC^{−1}(π) partition the tempered dual (Proposition 1.10); and for an extension π̃ to GL\_n ⋊ θ there are constants c\_τ ≠ 0 with π̃(f) = Σ\_{τ∈Π(π)} c\_τ τ(f^{U\_n}) (Proposition 1.11).


*Hypotheses and conventions.*

- v inert in F; tempered representations; Whittaker-normalised intertwining operator for π̃.


*Proof route.*

- Mœglin 2007, Lemme 5.4 and Théorème 5.7 for θ-discrete π (all l\_i = 1, J and K empty), extended to all tempered π by Waldspurger's Proposition III.4.1 and parabolic induction.
- The twisted character identity: Mœglin 2007 Proposition 5.5 for θ-discrete π, constant terms (Morel Lemma 6.3.4) and disjointness of Jordan–Hölder factors otherwise.
- These are the local statements of Mok's classification at inert places (parent ML.4), with Mœglin's explicit cuspidal-support description.


*API.*

- `StableBaseChange.extendsToLU` (characterisation): φ ∈ A^θ\_t(GL\_n(F\_ṽ))⁺ iff every conjugate self-dual summand of the wrong sign has even multiplicity.
- `StableBaseChange.esc` (data): Mœglin's extended cuspidal support esc(τ) of a tempered τ of U\_n(F⁺\_v).
- `StableBaseChange.BC` (constructor): BC(τ) = π\_τ, the unique element of A^θ\_t(GL\_n)⁺ with sc(π\_τ) = esc(τ).
- `StableBaseChange.BC_surjective_finite` (other): BC is surjective with finite fibres; Π(π) = BC^{−1}(π) partition the tempered dual.
- `StableBaseChange.twistedCharacterIdentity` (relation): π̃(f) = Σ\_{τ∈Π(π)} c\_τ τ(f^{U\_n}) with nonzero constants.


*Unit tests.*

- `StableBaseChange.rank_one` (degenerate): For n = 1 BC sends a character χ of U\_1(F⁺\_v) to the character z ↦ χ(z/c(z)) of F\_ṽ^×, and packets are singletons.
- `StableBaseChange.sign_condition` (non-example): For n = 2 a parameter σ ⊕ σ′ with σ, σ′ distinct conjugate self-dual characters of sign (−1)^n = +1 does not extend to ^LU\_2 (multiplicities 1 are odd).
- `StableBaseChange.tau_v` (computation): BC(τ\_v) = St\_2(χ) ⊞ 1 for the depth-zero supercuspidal τ\_v of U\_3 (SP.4/depth-zero-cuspidals).


*Checks.*

- The trivial representation of U\_1 has base change the trivial character of F\_ṽ^×; for n = 1 every packet is a singleton.
- St\_2(χ) ⊞ 1 with χ the nontrivial unramified quadratic character lies in A^θ\_t(GL\_3(F\_ṽ))⁺ (SP.4/depth-zero-cuspidals).


*Uses.*

- Newton–Thorne I, Proposition 1.16, pp. 18–19: the transfer of φ(v, θ, n) is computed through the twisted character identity
- Newton–Thorne I, Lemma 4.3, p. 61: local components of RACSDC representations at inert places lie in A^θ\_t(GL\_n)⁺


*Source.*

- [nt21] §1.8, definitions and Propositions 1.9–1.11, pp. 14–15: Defines the conjugate self-dual tempered parameters extending to the L-group of U\_n, Mœglin's extended cuspidal support, stable base change with its L-packets, and the twisted character identity.


*Needs.* `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`, `ModularityAndLanglandsExtensions:ML.4/local-arthur-packets`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `ModularityAndLanglandsExtensionsPartII:SP.4/unitary-groups-and-inner-twist`.

<a id="sp-4-depth-zero-cuspidals"></a>
### SP.4.4 Depth-zero cuspidal representations of U\_3 and GL\_3 and their base change

`ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals` · construction

Let v be inert with odd residue characteristic, k(v) its residue field and k(ṽ) the quadratic extension. τ(v) is the unique cuspidal unipotent representation of U\_3(k(v)) (Lusztig). For k\_3/k(v) cubic let C = ker(N : Res\_{k\_3k(ṽ)/k(v)}𝔾\_m → Res\_{k\_3/k(v)}𝔾\_m), an anisotropic torus embedded in U\_3 uniquely up to conjugacy; for a prime p with q\_v a primitive 6th root of unity mod p and θ : C(k(v)) → ℂ^× of order p, λ(v, θ) = −R\_C^{U\_3}θ is irreducible cuspidal. With C̃ = Res\_{k\_3k(ṽ)/k(ṽ)}𝔾\_m and θ̃(z) = θ(z/z^c), λ̃(ṽ, θ̃) = R\_{C̃}^{GL\_3}θ̃ is irreducible cuspidal. Their compact inductions τ\_v = c-Ind\_{U\_3(𝒪)}^{U\_3(F⁺\_v)} τ(v), λ\_v(θ) and λ̃\_ṽ(θ̃) = c-Ind\_{F\_ṽ^×GL\_3(𝒪)}^{GL\_3(F\_ṽ)} λ̃(ṽ, θ̃), where the finite type is extended by trivial action of F\_ṽ^× are irreducible supercuspidal, with BC(τ\_v) = St\_2(χ) ⊞ 1 (χ the nontrivial unramified quadratic character) and BC(λ\_v(θ)) = λ̃\_ṽ(θ̃) (Proposition 1.12). For n = 2k + 1 and π = St\_2(χ) ⊞ 1 ⊞ (⊞\_{i=1}^{2k−2}χ\_i) with χ\_i|\_{𝒪^×} of order 2, after relabelling χ\_i = χ\_{2k−1−i}^{w\_c,∨}, the packet Π(π) contains every irreducible subquotient of χ\_1 × ⋯ × χ\_{k−1} × τ\_v (Corollary 1.13).


*Hypotheses and conventions.*

- Odd residue characteristic; q\_v a primitive 6th root of unity mod p for λ(v, θ).
- Deligne–Lusztig induction R\_C is used only for the anisotropic tori C ⊂ U\_3 and C̃ ⊂ GL\_3 (no atlas roadmap owns general Deligne–Lusztig theory; gap recorded).
- For Corollary 1.13 require π∈A\_t^θ(GL\_n)⁺, including the correct conjugate-self-duality sign and multiplicities, before relabelling its characters. Arbitrary quadratic-on-units characters need not satisfy this.


*Proof route.*

- Deligne–Lusztig: −R\_C^{U\_3}θ is irreducible cuspidal for θ in general position (θ of order p is in general position because q\_v has order 6 mod p), since C lies in no proper rational parabolic.
- Supercuspidality of depth-zero compact inductions: Moy–Prasad Proposition 6.6.
- BC(τ\_v): the reducibility points of depth-zero supercuspidals (Lust–Stevens §8, odd residue characteristic) give two possibilities; the sign condition BC(τ\_v) ∈ A^θ\_t⁺ selects St\_2(χ) ⊞ 1.
- BC(λ\_v(θ)) = λ̃\_ṽ(θ̃) by the same reducibility computation; Corollary 1.13 by Jacquet modules and SP.4/stable-base-change-packets.


*API.*

- `DepthZero.cuspidalUnipotentU3` (constructor): τ(v), the cuspidal unipotent representation of U\_3(k(v)).
- `DepthZero.deligneLusztigU3` (constructor): λ(v, θ) = −R\_C^{U\_3}θ for θ of order p with q\_v of order 6 mod p.
- `DepthZero.deligneLusztigGL3` (constructor): λ̃(ṽ, θ̃) = R\_{C̃}^{GL\_3}θ̃ with θ̃(z) = θ(z/z^c).
- `DepthZero.compactInduction_supercuspidal` (other): The compact inductions τ\_v, λ\_v(θ), λ̃\_ṽ(θ̃) are irreducible supercuspidal.
- `DepthZero.baseChange_tau` (relation): BC(τ\_v) = St\_2(χ) ⊞ 1.
- `DepthZero.baseChange_lambda` (relation): BC(λ\_v(θ)) = λ̃\_ṽ(θ̃).


*Unit tests.*

- `DepthZero.dim_tau_q3` (computation): For k(v) = 𝔽\_3, dim τ(v) = 6.
- `DepthZero.dim_lambda` (computation): dim λ(v, θ) = (q + 1)(q² − 1), e.g. 32 for q = 3.
- `DepthZero.theta_general_position` (non-example): For θ trivial, −R\_C^{U\_3}(1) is the virtual character −1 + τ(v) + St (degrees −1 + q(q − 1) + q³ = (q + 1)(q² − 1)), not an irreducible character, so the order-p hypothesis is needed.
- `DepthZero.gl3_compatibility` (compatibility): λ̃(ṽ, θ̃) is the cuspidal representation of GL\_3(k(ṽ)) attached to the regular character θ̃ of k\_3k(ṽ)^× by Green's parametrisation.


*Checks.*

- For q\_v = 3 (so k(v) = 𝔽\_3), dim τ(v) = q(q − 1) = 6, the cuspidal unipotent degree of U\_3(𝔽\_q).
- dim λ(v, θ) = |U\_3(𝔽\_q)|\_{ℓ′}, where ℓ=char 𝔽\_q,/|C(𝔽\_q)| = (q + 1)(q² − 1) (C is the anisotropic torus of order q³ + 1).


*Uses.*

- Newton–Thorne I, §1.8, types, pp. 17–18: τ(v) and λ(v, θ) inflate to the types τ(v, n), λ(v, θ, n) of the parahoric p\_v
- Newton–Thorne I, Lemma 4.3 and Theorem 4.1, pp. 59–61: the T\_1 local components St\_2(χ) ⊞ 1 ⊞ ⋯ are the base changes of these supercuspidals


*Source.*

- [nt21] §1.8, definitions of τ(v), λ(v, θ), λ̃(ṽ, θ̃); Proposition 1.12 and Corollary 1.13, pp. 15–16: Constructs the cuspidal unipotent and Deligne–Lusztig cuspidal representations of U\_3 and GL\_3 over the residue fields, their compact inductions, and computes their stable base changes.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.2`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-9-the-representation-theory-of-gl₂𝔽_q`.

<a id="sp-4-level-raising-types"></a>
### SP.4.5 The types τ(v, n) and λ(v, θ, n) and their congruence

`ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types` · construction

Let v be inert, of odd residue characteristic, n = 2k + 1, p\_v ⊂ U\_n(F⁺\_v) the parahoric with Levi quotient M\_{(1,…,1,3)}(k(v)) = (Res GL\_1)^{k−1} × U\_3, and ω(ṽ) the nontrivial quadratic character of k(ṽ)^×. τ(v, n) (resp. λ(v, θ, n)) is the representation of p\_v inflated from ω(ṽ) ⊗ ⋯ ⊗ ω(ṽ) ⊗ τ(v) (resp. ⊗ λ(v, θ)). The test function φ(v, θ, n) is supported on p\_v and inflated from the character of λ(v, θ, n)^∨, so π(φ) is a positive multiple of dim Hom\_{p\_v}(λ(v, θ, n), π|\_{p\_v}). When q\_v mod p is a primitive 6th root of unity: (1) the reduction τ̄(v, n) is irreducible (Dudas–Malle, modular irreducibility of cuspidal unipotent characters); (2) the semisimplified reduction of λ(v, θ, n) contains τ̄(v, n) with multiplicity one (a Brauer-character computation for U\_3(k(v)), Geck 1990 Theorem 4.2).


*Hypotheses and conventions.*

- char k(v) odd; q\_v of order 6 modulo p; θ of order p.


*Proof route.*

- Inflate from the Levi quotient through the pro-unipotent radical of p\_v.
- Modular irreducibility: Dudas–Malle 2018.
- Congruence: θ ≡ 1 mod p so R\_C θ ≡ R\_C 1 on p-regular classes; decompose R\_C 1 into unipotent characters and use Geck's decomposition numbers for U\_3 in non-defining characteristic with q of order 6 (the source notes a typo in Geck's proof).


*API.*

- `LevelRaisingType.tau` (constructor): τ(v, n), inflated from ω(ṽ)^{⊗(k−1)} ⊗ τ(v).
- `LevelRaisingType.lambda` (constructor): λ(v, θ, n), inflated from ω(ṽ)^{⊗(k−1)} ⊗ λ(v, θ).
- `LevelRaisingType.testFunction` (data): φ(v, θ, n) ∈ C\_c^∞(U\_n(F⁺\_v)), with π(φ) a positive multiple of the λ(v, θ, n)-multiplicity.
- `LevelRaisingType.tau_reduction_irreducible` (other): τ̄(v, n) is irreducible.
- `LevelRaisingType.congruence` (relation): τ̄(v, n) occurs in the semisimplified reduction of λ(v, θ, n) with multiplicity one.


*Unit tests.*

- `LevelRaisingType.n_three` (degenerate): For n = 3, τ(v, 3) = τ(v) and λ(v, θ, 3) = λ(v, θ) as representations of U\_3(𝒪) through U\_3(k(v)).
- `LevelRaisingType.dimension` (computation): dim λ(v, θ, n) = dim λ(v, θ) = (q + 1)(q² − 1), independent of n.
- `LevelRaisingType.order_six_needed` (non-example): If q\_v ≡ 1 mod p (p odd), then |C(k(v))| = q\_v³ + 1 ≡ 2 mod p, so no character θ of order p exists and the type λ(v, θ, n) is not defined.


*Checks.*

- For k = 1 (n = 3), p\_v = U\_3(𝒪) and τ(v, 3) = τ(v).


*Uses.*

- Newton–Thorne I, Proposition 4.6 and proof of Theorem 4.1, pp. 62–65: σ is found containing τ\_g; the congruence of types then gives Σ containing λ\_g with the same residual representation
- Newton–Thorne I, Proposition 1.16, pp. 18–19: the endoscopic transfer of φ(v, θ, n) controls the cuspidal support of contributing representations


*Source.*

- [nt21] §1.8, definition of p\_v, τ(v, n), λ(v, θ, n), φ(v, θ, n), and Proposition 1.15, pp. 17–18: Defines the types of the parahoric and the test function, and proves irreducibility of the reduction of τ(v, n) and the congruence placing it in the reduction of λ(v, θ, n) with multiplicity one.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.5`.

<a id="sp-4-type-transfer"></a>
### SP.4.6 Endoscopic transfer of the test function φ(v, θ, n)

`ModularityAndLanglandsExtensionsPartII:SP.4/type-transfer` · theorem

Assume char k(v) > n. Let φ = φ(v, θ, n), E = (H, s, η) with H = U\_p × U\_q, and π\_p ∈ A^θ\_t(GL\_p(F\_ṽ))⁺, π\_q ∈ A^θ\_t(GL\_q(F\_ṽ))⁺ with (π\_p ⊗ π\_q)~(φ̃^H) ≠ 0. Then sc(π\_p) + sc(π\_q) = λ̃\_ṽ(θ̃) + χ\_1 + ⋯ + χ\_{2k−2} with each χ\_i|\_{𝒪^×} = ω(ṽ). The input is Kazhdan–Varshavsky's theorem: for char k(v) > n the transfer φ^H can be taken to be a weighted sum of inflations to H(𝒪) of the Deligne–Lusztig characters R\_{C\_i}^{H\_{k(v)}}(θ^{−1} ⊗ ω(ṽ)^{⊗(k−1)}), one for each conjugacy class of embeddings C\_i of C × (Res 𝔾\_m)^{k−1} into H\_{k(v)}.


*Hypotheses and conventions.*

- char k(v) > n (needed for Kazhdan–Varshavsky).


*Proof route.*

- Kazhdan–Varshavsky 2012 Theorem 2.2.6 computes φ^H as above.
- Transitivity of Deligne–Lusztig induction and the cuspidality of λ̃(ṽ, θ̃) identify the depth-zero supercuspidal support of representations on which φ^H has nonzero twisted trace (Newton–Thorne I Proposition 1.14).
- Combine with the twisted character identity of SP.4/stable-base-change-packets.


*Checks.*

- In the stable case H=U\_n the supercuspidal support contains λ̃\_ṽ(θ̃), while the untwisted unipotent construction has the St₂(χ)⊞1 support. This distinguishes the supports used in level raising; it does not by itself prove that an arbitrary representation cannot contain both compact types.


*Source.*

- [nt21] Proposition 1.16 and proof, §1.8, pp. 18–19: Determines the cuspidal supports of endoscopic representations detected by the transfer of φ(v, θ, n), using Kazhdan–Varshavsky's transfer of Deligne–Lusztig functions.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets`, `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`.

<a id="sp-4-fixed-type-lifting-rings"></a>
### SP.4.7 Splitting of lifts and Frobenius on fixed-type lifting rings

`ModularityAndLanglandsExtensionsPartII:SP.4/fixed-type-lifting-rings` · theorem

Let ṽ be a place of F split over F⁺ with char k(ṽ) odd, 1 ≤ n\_1 ≤ n, n\_2 = n − n\_1, q\_ṽ mod p a primitive n\_1-th root of unity and Θ a character of k\_{n\_1}^× of order p. Let ρ̄\_ṽ = σ̄\_{ṽ,1} ⊕ σ̄\_{ṽ,2} with σ̄\_{ṽ,1} ≅ Ind\_{G\_{F\_{ṽ,n\_1}}}^{G\_{F\_ṽ}} ψ̄\_ṽ (ψ̄\_ṽ unramified) and σ̄\_{ṽ,2} ⊗ ω(ṽ)∘Art^{−1} unramified on inertia. (Lemma 1.21) Every lift of ρ̄\_ṽ to a complete Noetherian local 𝒪-algebra R is (1 + M\_n(𝔪\_R))-conjugate to σ\_{ṽ,1} ⊕ σ\_{ṽ,2} with σ\_{ṽ,i} lifting σ̄\_{ṽ,i}, each unique up to conjugacy. On the fixed-type lifting ring R(ṽ, Θ, ρ̄\_ṽ) (lifts of inertial type τ\_ṽ, with the Artin map of F\_{ṽ,n\_1} on the first summands, correction E6): (3) with α\_ṽ the reduction of (−1)^{n\_1+1} det σ\_{ṽ,1}(φ\_ṽ), one has det(X − σ\_{ṽ,1}(φ\_ṽ^{n\_1})) ≡ (X − α\_ṽ)^{n\_1} modulo ϖ, and α\_ṽ in R(ṽ, Θ, ρ̄\_ṽ)/(ϖ) is independent of the Frobenius lift φ\_ṽ (correction E7: the printed Hensel argument is replaced); (4) for L\_ṽ/F\_ṽ finite with τ\_ṽ|\_{I\_{L\_ṽ}} trivial, the map from the framed ring of L\_ṽ factors through its unramified quotient.


*Hypotheses and conventions.*

- The hypotheses make H⁰ and H¹ of Hom(σ̄\_1, σ̄\_2) and Hom(σ̄\_2, σ̄\_1) vanish (Shotton Lemma 2.3); they fail for p = char k(ṽ) or p = 2.
- The case n\_1 = 1 (q\_ṽ ≡ 1 mod p, λ̃ = Θ) is included (correction E19).
- The coefficient prime p is odd and different from the residue characteristic of F\_ṽ.


*Proof route.*

- Vanishing of the cross cohomology gives the splitting and uniqueness by deformation theory of extensions.
- For a fixed Frobenius lift, check at characteristic-zero points that the induced first block has scalar n₁-th Frobenius power and characteristic polynomial (X−(−1)^{n₁+1}det σ₁(φ))^{n₁}. Reducedness and p-torsion-freeness spread this polynomial identity. Reduce modulo ϖ. The determinant on inertia is then trivial because Θ has p-power order, so the reduced α is independent of the Frobenius lift. No Hensel root of α is needed, and no integral independence is claimed for n₁=1.
- (4): on restriction to G\_{L\_ṽ} the type becomes trivial, so lifts are unramified.


*Checks.*

- For n\_1 = n the second summand is zero and Lemma 1.21 is vacuous; (3) says the n-th Frobenius power is scalar on the induced summand.


*Source.*

- [nt21] §1.17, Lemma 1.21 and Proposition 1.22(3)–(4), pp. 20–21: Proves the splitting of lifts of σ̄\_1 ⊕ σ̄\_2 and the Frobenius and restriction properties of the fixed-type lifting ring.


*Needs.* `LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n`, `LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.1/local-tangent-obstruction`.

<a id="sp-4-iwahori-hecke-sp2k"></a>
### SP.4.8 The Iwahori–Hecke algebra of ramified U\_{2k+1} is that of Sp\_{2k}

`ModularityAndLanglandsExtensionsPartII:SP.4/iwahori-hecke-sp2k` · theorem

Let E/F be ramified quadratic of odd residue characteristic, U\_{2k+1} the ramified quasi-split unitary group, B an Iwahori subgroup with Iwahori–Hecke algebra H\_B, and B′ an Iwahori subgroup of split Sp\_{2k}(F) with Λ′ ≅ ℤ^k spanned by ε′\_i = diag(1, …, ϖ², …, ϖ^{−2}, …, 1). The identifications Λ ≅ Λ′ and W\_0 ≅ W′\_0 extend to an isomorphism of affine Weyl groups W ≅ W′ carrying the simple affine reflections s\_0, …, s\_k to those of Sp\_{2k}, and induce an isomorphism H\_B ≅ H\_{B′} with [Bε\_iB] ↦ [B′ε′\_iB′].


*Hypotheses and conventions.*

- E/F ramified, residue characteristic odd; both Hecke algebras with the same parameter q at every simple reflection.


*Proof route.*

- Compute the affine root system of ramified U\_{2k+1} (Tits) and check it matches that of Sp\_{2k} with equal parameters at all simple reflections.
- Use the Iwahori–Matsumoto multiplication rule T\_s²=(q−1)T\_s+q, equivalently (T\_s−q)(T\_s+1)=0, and braid relations on both sides. Over ℤ use the positive braid monoid presentation; a braid group presentation requires q invertible. This avoids the reversed quadratic relation and integral group-algebra presentation printed on CTIII p. 7.


*Checks.*

- For k = 1 both algebras are the affine Hecke algebra of type Ã\_1 with equal parameters q.
- The generic-parameter Iwahori–Hecke algebras of SR.1.5 specialise to H\_B and H\_{B′} at the same q.


*Source.*

- [ct17] Proposition 2.2, §2.1, p. 7: Identifies the Iwahori–Hecke algebra of the ramified unitary group in 2k + 1 variables with that of split Sp\_{2k}.


*Needs.* `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`, `ReductiveGroupsPartII:RG2.4`.

<a id="sp-4-kazhdan-lusztig-modules"></a>
### SP.4.9 The Kazhdan–Lusztig modules X, Y, Z in the packet of St\_{n−4} ⊞ St\_3 ⊞ St\_1

`ModularityAndLanglandsExtensionsPartII:SP.4/kazhdan-lusztig-modules` · construction

For n = 2k + 1 ≥ 7, let Π\_E = St\_{n−4,E} ⊞ St\_{3,E} ⊞ St\_{1,E}, a tempered representation of GL\_n(E) with conjugate orthogonal parameter φ\_E extending uniquely to a parameter φ of U\_n, and Π\_φ its L-packet. Exponents [m\_1, …, m\_k] denote characters |·|^{m\_1} ⊗ ⋯ ⊗ |·|^{m\_k} ⊗ 1 of the torus (E^×)^k × (E^×)^{N=1}. Through SP.4/iwahori-hecke-sp2k and the Kazhdan–Lusztig classification for PSp\_{2k} (the partition (n − 4) + 3 + 1 of the dual SO\_{2k+1}(ℂ), with component group {±1} for n = 7 and {±1}² otherwise, and the fixed-point variety B\_u^s smooth and projective by De Concini–Lusztig–Procesi, hence paved by affine spaces by Białynicki-Birula's theorem), there are irreducible tempered Iwahori-spherical modules X, Y (n = 7) and X, Y, Z (n ≥ 9) with: for n = 7, dim X^P = dim X^B = 1, dim Y^B = 7, X^{norm}\_{N\_0} = [1, 0, −1], (Y^{norm}\_{N\_0})^{ss} = [1, 0, −1] + 2[1, 0, 1] + 4[1, 1, 0]; for n=9, dim X^B=1, dim Y^B=11, dim Z^B=2, jX=[2,1,0,−1], jY=[2,1,0,−1]+2[2,1,0,1]+4[2,1,1,0]+[1,0,2,1]+[1,2,0,1]+2[1,2,1,0], and jZ=[1,0,2,1]+[1,2,0,1], where j denotes the semisimplified normalized Jacquet module. For k≥5 let L\_k be the multiset obtained by inserting 0 in positions 2 through k−1 of [1,k−2,k−3,…,1]. Then jX\_k=[k−2,k−3,…,0,−1], jY\_k=L\_k+2[1,k−2,k−3,…,0]+prepend(k−2,jY\_{k−1}), and jZ\_k=L\_k+prepend(k−2,jZ\_{k−1}); the dimensions satisfy dim Y\_k^B=dim Y\_{k−1}^B+k and dim Z\_k^B=dim Z\_{k−1}^B+k−2. The packet Π\_φ has exactly these members for n = 7 and one further non-Iwahori-spherical member W for n ≥ 9.


*Hypotheses and conventions.*

- E/F ramified, odd residue characteristic; P the maximal parahoric containing B with [P : B] = q + 1.
- Normalised Jacquet modules for the upper-triangular Borel.


*Proof route.*

- Kazhdan–Lusztig: irreducible Iwahori-spherical tempered modules of PSp\_{2k} ↔ pairs (u, ρ) with ρ a representation of the component group occurring in H\_*(B\_u^s); the Białynicki-Birula paving of the smooth projective variety B\_u^s (De Concini–Lusztig–Procesi; Reeder for n ≥ 9) gives the dimensions and exponents (SmoothRepresentationsOfLocalGroupsPartII SRU.7).
- For n = 7: B\_u^s = X\_1 ⊔ X\_2 ⊔ X\_3 with X\_1 two points (exponent [1, 0, −1]), X\_2 ≅ ℙ¹ ([1, 0, 1]) and X\_3 ≅ ℙ¹ × ℙ¹ ([1, 1, 0]); homology of dimension 8 = 1 + 7.
- Membership in Π\_φ: the stable base change of X, Y is semistable with θ-stable exponent forcing the parameter ⊕ sp(n\_i) ⊗ χ\_i to have trivial χ\_i and {n\_i} = {n − 4, 3, 1} (Clozel–Thorne III §3.5).


*API.*

- `KLModule.X` (constructor): The member X of Π\_φ with dim X^P = dim X^B = 1 and ε(X) = −1.
- `KLModule.Y` (constructor): The member Y, with dim Y^B = 7 (n = 7), 11 (n = 9), and dim Y\_k^B = dim Y\_{k−1}^B + k.
- `KLModule.Z` (constructor): The member Z for n ≥ 9, with dim Z^B = 2 (n = 9) and dim Z\_k^B = dim Z\_{k−1}^B + k − 2.
- `KLModule.jacquetExponents` (characterisation): The semisimplified normalised Jacquet modules as sums of exponents, as listed in Theorem 2.3.
- `KLModule.mem_packet` (compatibility): X, Y (and Z) are the Iwahori-spherical members of the Mœglin–Mok packet Π\_φ.


*Unit tests.*

- `KLModule.dims_n7` (computation): For n = 7, dim X^B = 1 and dim Y^B = 7, and the exponent multiset of Y has 1 + 2 + 4 = 7 terms.
- `KLModule.dims_recursion` (computation): dim Y\_5^B = 11 + 5 = 16 for n = 11, and dim Z\_5^B = 2 + 3 = 5.
- `KLModule.W_not_spherical` (non-example): For n ≥ 9 the fourth member W has W^B = 0 and is not semistable.
- `KLModule.generic_member` (compatibility): Y is the generic member of Π\_φ, consistent with ε\_1(Y) = 1 (Clozel–Thorne III p. 27); X is not generic although dim X^B = 1.


*Checks.*

- n = 7: dim X^B + dim Y^B = 8 = dim H\_*(B\_u^s).
- n = 9: dim X^B + dim Y^B + dim Z^B = 14.


*Uses.*

- Clozel–Thorne III, Proposition 2.6, p. 12: integral lattices in X^B, Y^B, Z^B with disjoint reductions
- Clozel–Thorne III, Lemma 4.4 and Theorem 4.2, pp. 35–37: M ⊗ ℂ ≅ (X^B)^a ⊕ (Y^B)^b ⊕ (Z^B)^c at the level-raising place, and the count of exponents ≡ [2, 1, 0, −1]


*Source.*

- [ct17] §2.2 and Theorem 2.3, pp. 8–9; Theorem 2.5 and proof, pp. 10–11: Defines the parameter φ\_E and the packet Π\_φ, states the Iwahori dimensions and Jacquet exponents of its members, and constructs X, Y, Z by Kazhdan–Lusztig through the Sp\_{2k} Hecke algebra.
- [ct17] §3.5, pp. 25–26: Shows the Kazhdan–Lusztig modules lie in the packet, and computes the Jacquet module of the U(4) packet.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/iwahori-hecke-sp2k`, `SmoothRepresentationsOfLocalGroupsPartII:SRU.7/kazhdan-lusztig-classification`, `SmoothRepresentationsOfLocalGroups:SR.2`, `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`.

<a id="sp-4-kl-integral-structures"></a>
### SP.4.10 Integral structures, localisations and duality for the Kazhdan–Lusztig modules

`ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures` · theorem

Let l = n − 2 be prime (n ∈ {7, 9}), K/ℚ\_l finite containing √q over which X, Y (and Z) are defined, with integers 𝒪 and residue field k. (Proposition 2.6) If q is a primitive root mod l there are H\_{B,𝒪}-lattices X^B\_𝒪, Y^B\_𝒪 (and Z^B\_𝒪) whose reductions have pairwise no common Jordan–Hölder factor; Y^B\_𝒪 ⊗ k is absolutely irreducible. (Corollary 2.8) If q is a primitive root mod l, a finite flat H\_{B,𝒪}-module M with M ⊗ K ≅ (X^B)^a ⊕ (Y^B)^b (⊕ (Z^B)^c) is the direct sum of its intersections with the isotypic parts. Let ȷ be the anti-involution [BgB] ↦ [Bg^{−1}B], 𝒪[Λ] the Bernstein subalgebra, and M(χ̄), M(χ̄ȷ) localisations at residual characters. (Proposition 2.9) If q ≡ −1 mod l, with χ̄ the reduction of the character of 𝒪[Λ] on X^B: X^B\_K = X^B\_K(χ̄) = X^B\_K(χ̄ȷ), dim Y^P\_K ∩ Y^B\_K(χ̄) = dim Y^P\_K ∩ Y^B\_K(χ̄ȷ) = 1, and Z^B\_K(χ̄) = 0 for n = 9. (Duality) Self-duality of Y\_K gives a perfect K-valued pairing on Y^B\_K with ⟨tx, y⟩ = ⟨x, ȷ(t)y⟩, under which Y^B\_K(χ̄ȷ) annihilates the other localisations and (1 − e\_P)Y^B\_K annihilates Y^P\_K; no integral perfect pairing is claimed.


*Hypotheses and conventions.*

- Proposition 2.6 needs q a primitive root mod l; Proposition 2.9 needs q ≡ −1 mod l: these are different places (v\_i and v\_0 in SP.5).
- e\_P = [P]/(q + 1) exists over K but is not integral when q ≡ −1 mod l.


*Proof route.*

- Proposition 2.6: write Y^B by explicit matrices for T\_{s\_i} and the Bernstein generators (Reeder's matrices); the n = 9 matrix T\_{s\_2} has a misprinted (10, 10) entry, which must be −1/(1 + q) (E7 of the extraction: the 2×2 block has trace q−1 and determinant −q after this correction, hence satisfies the Hecke quadratic relation; the remaining presentation relations are part of the explicit-matrix proof target); reduce and check irreducibility and disjointness.
- Corollary 2.8: Brauer–Nesbitt for H\_{B,𝒪}-lattices and disjointness of the reductions.
- Proposition 2.9: compute the Bernstein-character exponents modulo l with q ≡ −1; duality from Theorem 3.3 (self-duality of Y\_K).


*Checks.*

- For n = 7, Y^B has rank 7 and its reduction is absolutely irreducible of dimension 7.
- With q ≡ −1 mod l the X-isotypic part lies in both localisations; this asymmetry with Y (one-dimensional P-fixed parts) drives the count in SP.5/ct-level-raising.


*Source.*

- [ct17] Proposition 2.6, p. 12; Remark 2.7 and Corollary 2.8, p. 17; §2.3 and Proposition 2.9, pp. 17–18: Constructs lattices with disjoint reductions under the primitive-root hypothesis, splits lattices into isotypic parts, defines the anti-involution and localisations, and computes the localisations when q ≡ −1 mod l.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/kazhdan-lusztig-modules`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.5`, `ArithmeticGaloisRepresentations:R01.1/brauer-nesbitt`.

<a id="sp-4-ct-packet-signs"></a>
### SP.4.11 Identification of the packet members and their endoscopic signs

`ModularityAndLanglandsExtensionsPartII:SP.4/ct-packet-signs` · theorem

Suppose E/F ramified of odd residue characteristic and n = m + 4 with m ≥ 3 odd. The members X, Y (m = 3) or X, Y, Z (m ≥ 5) of Π\_φ are semistable with the Jacquet exponents of SP.4/kazhdan-lusztig-modules (for m = 3, X has exponent [1, 0, −1], correcting the printed [1, 0, 1], E3 of the extraction), and W is not semistable. For m≥5, with the characters ε\_1, ε\_2 of the component group S\_φ and ε = ε\_1ε\_2: ε(Y) = ε(Z) = 1, ε(X) = ε(W) = −1, ε\_1(X) = ε\_1(Y) = 1, ε\_1(Z) = ε\_1(W) = −1. For m=3 the component group has one nontrivial character ε, with ε(Y)=1 and ε(X)=−1; Z and W are absent.


*Hypotheses and conventions.*

- Transfer factors on the maximally split torus normalised as in Lemma 3.6: Δ(t\_H, t) = μ(z\_1)μ(z\_2)Δ\_IV(t\_H, t) for t\_H = (t\_0, z\_1, z\_2) ∈ U(m) × U(4).


*Proof route.*

- Compute transfer factors on the maximally split torus (Δ\_I = Δ\_{III,1} = 1, Δ\_II = 1 for trivial χ-data, Δ\_IV the discriminant ratio) (Lemma 3.6).
- Express traces through Jacquet modules on the regular part of the split torus ((3.8)) and compare the stable identity with the endoscopic identity Σ ε(π)⟨tr π, f⟩ = ⟨tr π\_H, f^H⟩ for H = U(m) × U(4) ((3.7)): the right side is 2Σ\_w w([k − 2, …, 1, 1, 0]) over shuffles, equal to jY − jX + jZ for m = 5; the U(4) packet of St\_3 ⊞ St\_1 has Jacquet module 2μ^{−1}(z\_1z\_2) ⊗ [1, 0].
- The ε₁ computation uses Mœglin’s hereditary Jacquet formula. The printed uniqueness claim used to identify Z is false: the same exponent also gives Y in the relevant induced socle. A complete socle-multiplicity argument, followed by packet counting, is still needed; this is recorded in gap G4 rather than called an immediate repair.


*Checks.*

- For m = 5 (n = 9, k = 4), Σ\_π ε(π) j(π) = jY − jX + jZ, and the shuffle sum 2Σ\_w w([2, 1, 1, 0]) matches it (the extraction's review checked k = 3, …, 8).


*Source.*

- [ct17] Theorem 3.3 and sign table, p. 21; §3.4, Lemma 3.6, pp. 23–24; §3.5, (3.7)–(3.8) and proof, pp. 24–27; Proposition 3.7, p. 27: Identifies the Kazhdan–Lusztig modules with the Mœglin–Mok packet members, fixes their semistability and Jacquet exponents and computes the endoscopic signs through transfer factors on the split torus.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/kazhdan-lusztig-modules`, `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/twisted-transfer-factor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `SmoothRepresentationsOfLocalGroups:SR.2`.

## Layer SP.5: Level raising to prescribed types on definite unitary groups

**Targets.** Newton–Thorne I §4: the data π = π\_2 ⊞ π\_{n−2} with the auxiliary place sets T\_1, T\_2, T\_3, the level U and the types τ\_g, λ\_g; local components at inert places (Lemma 4.3); box sums with the same residual representation are cuspidal or of shape (n − 2, 2) (Lemma 4.5); a form of the definite group with prescribed types by the trace formula (Proposition 4.6); and Theorem 4.1, level raising to a type (whose statement the parent records in §4.4). Clozel–Thorne III §§3–4: the conjugate-symplectic character μ (Lemma 3.4); the count of automorphic representations of the definite unitary group with given stable base change (Theorems 3.8, 3.10); the level-raising set-up with algebraic modular forms S(U, A) and their Hecke algebras; the local types of contributing representations (Proposition 4.1, with the corrected semistability argument); the pairing and the module structure (Proposition 4.3, Lemma 4.4); and Theorem 4.2, level raising for l = 5, 7.

**Sources.** Newton–Thorne I §4, pp. 59–65; Clozel–Thorne III §§3–4, pp. 21–37.

*Requires:* `AutomorphicGaloisRepresentationsPartII:AG2.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `ModularityAndLanglandsExtensions:ML.4`, `ModularityAndLanglandsExtensionsPartII:SP.4`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

<a id="sp-5-nt-level-raising-data"></a>
### SP.5.1 The data of Newton–Thorne I §4 for level raising to types

`ModularityAndLanglandsExtensionsPartII:SP.5/nt-level-raising-data` · definition

Fix n = 2k + 1 ≥ 3 odd, the standard assumptions, ι : Q̄\_p ≅ ℂ, and cuspidal conjugate self-dual π\_2 on GL\_2(𝔸\_F) and π\_{n−2} on GL\_{n−2}(𝔸\_F) with: (1) π = π\_2 ⊞ π\_{n−2} regular algebraic, with ρ̄ = r̄\_{π,ι} = ρ̄\_2 ⊕ ρ̄\_{n−2}, ρ̄\_2 = r̄\_{π\_2|·|^{(2−n)/2},ι}, ρ̄\_{n−2} = r̄\_{π\_{n−2}|·|^{−1},ι}; (2) π ι-ordinary; (3) pairwise disjoint non-empty sets T\_1, T\_2, T\_3 of places of F⁺ outside S of odd residue cardinality, π unramified outside S ∪ T: at v ∈ T\_1, v inert, q\_v of order 6 mod p, char k(v) > n, π\_{2,ṽ} ≅ St\_2(χ\_ṽ), π\_{n−2,ṽ} ≅ ⊞\_{i=0}^{2k−2}χ\_{ṽ,i} with χ\_ṽ, χ\_{ṽ,0} unramified and χ\_{ṽ,i}|\_{𝒪^×} = ω(ṽ) for i ≥ 1; at v ∈ T\_2, v split, q\_v ≡ −1 mod p, π\_{2,ṽ} ⊇ λ̃(ṽ, Θ\_ṽ) and π\_{n−2,ṽ} ⊇ ω(ṽ)∘det; at v ∈ T\_3, v split, q\_v of order n − 2 mod p, π\_{n−2,ṽ} ⊇ λ̃(ṽ, Θ\_ṽ) and π\_{2,ṽ} ⊇ ω(ṽ)∘det; and characters θ\_v of C(k(v)) of order p for v ∈ T\_1. The level is U = ∏U\_v with U\_v = ι\_v^{−1}p\_v (v ∈ T\_1), ι\_ṽ^{−1}𝔮\_ṽ (v ∈ T\_2 ∪ T\_3), the ordinary Iwahori level at S\_p and hyperspecial elsewhere outside S; the global types are τ\_g = ⊗\_{T\_1}τ(v, n) ⊗ ⊗\_{T\_2∪T\_3}λ̃(ṽ, Θ\_ṽ, n) and λ\_g = ⊗\_{T\_1}λ(v, θ\_v, n) ⊗ ⊗\_{T\_2∪T\_3}λ̃(ṽ, Θ\_ṽ, n), with 𝒪-lattices.


*Hypotheses and conventions.*

- Standard assumptions of SP.4/unitary-groups-and-inner-twist; π tempered at every place (π\_2, π\_{n−2} are).
- Choose the p-adic level sufficiently small that the finite double-coset stabilizers have order prime to p. This is the exactness hypothesis for changing integral coefficient types in the ordinary forms functor.


*Proof route.*

- The data are assembled from SP.4/level-raising-types at T\_1 and the split-place types λ̃(ṽ, Θ\_ṽ, n) of GL\_n (inflations of Deligne–Lusztig cuspidals of GL\_{n\_1}(k(ṽ)) for n\_1 = 2, n − 2, with ω(ṽ)∘det on the complement).


*API.*

- `NTLevelRaisingData.mk` (constructor): The tuple (π\_2, π\_{n−2}, T\_1, T\_2, T\_3, (θ\_v), (Θ\_ṽ)) with the conditions (1)–(3).
- `NTLevelRaisingData.level` (data): The level U with parahoric p\_v at T\_1 and 𝔮\_ṽ at T\_2 ∪ T\_3.
- `NTLevelRaisingData.tauG` (data): The global type τ\_g and its 𝒪-lattice.
- `NTLevelRaisingData.lambdaG` (data): The global type λ\_g and its 𝒪-lattice.
- `NTLevelRaisingData.residual` (projection): ρ̄ = ρ̄\_2 ⊕ ρ̄\_{n−2} with the stated twists.
- `NTLevelRaisingData.ext` (extensionality): Two choices with the same fields, places, local types, weight and chosen levels define equal level-raising data; equality does not identify auxiliary choices not listed as fields.


*Unit tests.*

- `NTLevelRaisingData.n_three` (degenerate): For n = 3, π\_{n−2} is a Hecke character and λ̃(ṽ, Θ\_ṽ) at T\_3 is an order-p character Θ\_ṽ of k(ṽ)^× with q\_v ≡ 1 mod p.
- `NTLevelRaisingData.residual_twist` (computation): For n = 5, ρ̄\_2 = r̄\_{π\_2|·|^{−3/2}} and ρ̄\_3 = r̄\_{π\_3|·|^{−1}}; the twists make ρ̄ = r̄\_{π,ι} for the isobaric sum.
- `NTLevelRaisingData.T2_order` (non-example): q\_v ≡ 1 mod p is not allowed at T\_2: the order-p character Θ\_ṽ of k\_2^× must be regular, which needs q\_v ≡ −1 mod p.


*Checks.*

- For n = 3, π\_{n−2} = π\_1 is a character and T\_3 imposes an order-p character at a place with q\_v ≡ 1 mod p (correction E19).


*Uses.*

- Newton–Thorne I, Theorem 4.1 and Proposition 4.6, pp. 60–65: the hypotheses and levels of level raising to types
- Newton–Thorne I, proof of Proposition 7.4, pp. 85–89: the inductive step constructs data of this shape from a GL\_2 form and the inductive GL\_{n−2} representation


*Source.*

- [nt21] §4, data and assumptions before Theorem 4.1, pp. 59–60; the level U and types τ\_g, λ\_g, p. 62: Fixes the isobaric sum π\_2 ⊞ π\_{n−2}, the auxiliary place sets T\_1, T\_2, T\_3 with their local conditions, the level U and the global types τ\_g and λ\_g.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/unitary-groups-and-inner-twist`, `PotentialAutomorphyInfrastructurePartII:PL.2/iwahori-ordinary-parts`, `PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation`.

<a id="sp-5-nt-local-components-and-box-sums"></a>
### SP.5.2 Local components at inert places and box sums with the same residual representation

`ModularityAndLanglandsExtensionsPartII:SP.5/nt-local-components-and-box-sums` · theorem

(Lemma 4.3) In the setting of SP.5/nt-level-raising-data, if v is inert in F then π\_ṽ ∈ A^θ\_t(GL\_n(F\_ṽ))⁺ (π\_ṽ is tempered because π\_{2,ṽ} and π\_{n−2,ṽ} are); consequently, for v ∈ T\_1, χ\_ṽ is the nontrivial unramified quadratic character and χ\_{ṽ,0} is trivial. (Lemma 4.5) In the setting of SP.5/nt-level-raising-data, let π′ = π′\_1 ⊞ ⋯ ⊞ π′\_r be regular algebraic with π′\_i cuspidal conjugate self-dual, r̄\_{π′,ι} ≅ r̄\_{π,ι}, and π′\_ṽ|\_{𝔮\_ṽ} ⊇ λ̃(ṽ, Θ\_ṽ, n) for v ∈ T\_2 ∪ T\_3. Then either π′ is cuspidal, or r = 2 and after reordering π′ has blocks of sizes n − 2 and 2 with the T\_2, T\_3 types distributed as for π and the same residual blocks ρ̄\_{n−2}, ρ̄\_2.


*Hypotheses and conventions.*

- Bellaïche–Chenevier's sign of r\_{π,ι} extends the local parameter to ^LU\_n.


*Proof route.*

- Lemma 4.3: the Galois representation of a conjugate self-dual π has the polarization sign that makes its parameter extend to ^LU\_n at inert places (Bellaïche–Chenevier 2011); combine with SP.4/stable-base-change-packets and the sign condition for St\_2(χ) ⊞ 1.
- At T₃ the regular induced local type forces an entire (n−2)-dimensional local block into one isobaric constituent. Compare semisimplified residual inertia: the two residual blocks have respectively the quadratic and trivial inertial characters there, so this constituent contains the prescribed residual (n−2)-block, whether or not that block is globally irreducible. At T₂ the analogous comparison forces the residual two-dimensional block into a constituent of rank at least two. Thus only a single cuspidal constituent or the ranks (n−2,2) can occur. The proof does not assume global irreducibility of either residual block.


*Checks.*

- A box sum with three blocks cannot carry both the T\_2 and T\_3 types and the residual representation ρ̄\_2 ⊕ ρ̄\_{n−2}.


*Source.*

- [nt21] Lemma 4.3 and Remark 4.4, p. 61; Lemma 4.5 and proof, p. 61: Places local components at inert places in the conjugate self-dual tempered set extending to the L-group, and shows that box sums congruent to π with the T\_2, T\_3 types are cuspidal or of shape (n − 2, 2).


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/nt-level-raising-data`, `ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets`, `AutomorphicGaloisRepresentationsPartII:AG2.3/automorphic-polarization-and-sign`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-constituent-galois-representation`.

<a id="sp-5-nt-prescribed-types"></a>
### SP.5.3 A form of the definite group with prescribed types, via the trace formula

`ModularityAndLanglandsExtensionsPartII:SP.5/nt-prescribed-types` · theorem

In the setting of SP.5/nt-level-raising-data, for every S ∪ T-split totally real quadratic L⁺/F⁺ (L = L⁺F), either there is an automorphic σ of G(𝔸\_{F⁺}) with base change π, σ\_v^{U\_v} ≠ 0 for v ∉ T and σ\_T|\_{U\_T} ⊇ τ\_g, or there is such a σ of G(𝔸\_{L⁺}) with base change π\_L, σ\_v^{U\_{L,v}} ≠ 0 for v ∉ T\_L and σ\_{T\_L}|\_{U\_{L,T\_L}} ⊇ τ\_{g,L}.


*Hypotheses and conventions.*

- Setting of SP.5/nt-level-raising-data.


*Proof route.*

- The stabilised trace formula for G gives Σ m(σ\_i)σ\_i(f) = ½(π̃(f̃) + (π\_{n−2} ⊗ (π\_2 ⊗ μ^{−1}∘det))~(f̃^{U\_{n−2}×U\_2})) for test functions f matching π (Shin Proposition 4.8, Mœglin–Waldspurger, Jacquet–Shalika, Hiraga Proposition 4.6; EndoscopicTransferAndUnitaryTraceComparison ET.4).
- With f built from τ\_g at T and SP.4/endoscopic-character-identities elsewhere, the multiplicity is m(σ) = ½(∏ϵ ∏c\_{τ\_v} + ∏ϵ ∏d\_{v,1}).
- If it vanishes over F⁺, quadratic base change to L⁺ squares the local constants and gives m(σ) = ∏c\_{τ\_v}² ≠ 0.


*Checks.*

- The multiplicity over F⁺ is the half-sum ½(∏ϵ ∏c\_{τ\_v} + ∏ϵ ∏d\_{v,1}), which can vanish whatever the signs; then ∏c\_{τ\_v}² = ∏d\_{v,1}², and over L⁺ the multiplicity is ∏c\_{τ\_v}² ≠ 0.


*Source.*

- [nt21] Proposition 4.6 and proof, pp. 62–64: Finds, by the stabilised trace formula and a quadratic base change if necessary, an automorphic representation of the definite group with base change π containing the type τ\_g.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/nt-level-raising-data`, `ModularityAndLanglandsExtensionsPartII:SP.4/endoscopic-character-identities`, `ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets`, `ModularityAndLanglandsExtensionsPartII:SP.4/type-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/cohomological-unitary-weak-base-change`, `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`.

<a id="sp-5-nt-level-raising-to-types"></a>
### SP.5.4 Level raising to a type on a definite unitary group (Newton–Thorne I Theorem 4.1)

`ModularityAndLanglandsExtensionsPartII:SP.5/nt-level-raising-to-types` · theorem · planet: Level raising to types (NT I Theorem 4.1)

In the setting of SP.5/nt-level-raising-data, for every S ∪ T-split totally real quadratic L⁺/F⁺ with L = L⁺F there is a RACSDC automorphic representation Π of GL\_n(𝔸\_L) with (1) Π ι-ordinary, of the weight of π, and unramified outside S ∪ T; (2) r̄\_{Π,ι} ≅ r̄\_{π,ι}|\_{G\_L}; (3) for v ∈ T\_{1,L}, Π\_ṽ restricted to r\_ṽ contains λ̃(ṽ, θ̃\_{v|\_{F⁺}}, n)|\_{r\_ṽ}; (4) for v ∈ T\_{2,L} ∪ T\_{3,L}, Π\_ṽ|\_{𝔮\_ṽ} contains λ̃(ṽ, Θ\_ṽ|\_F, n), with n\_1 = 2 on T\_{2,L} and n\_1 = n − 2 on T\_{3,L} (correction E14: the source prints n\_2). This proves the odd-rank level-raising statement the parent records in §4.4.


*Hypotheses and conventions.*

- The weight of Π is that of π (correction E23 makes this explicit).


*Proof route.*

- SP.5/nt-prescribed-types gives σ (over F⁺ or L⁺) containing τ\_g in σ\_T.
- The congruence of types (SP.4/level-raising-types) and exactness of the ordinary forms functor S^{ord}\_λ(U, −) at l-torsion-free level (PotentialAutomorphyInfrastructurePartII PL.2) give Σ with the same Hecke eigensystem mod p containing λ\_g.
- Its base change is cuspidal: SP.5/nt-local-components-and-box-sums allows only shape (n − 2, 2), which SP.4/type-transfer excludes at T\_1 (identities (4.6.4)–(4.6.5)); T\_2 ∪ T\_3 serve to force cuspidality (Remark 4.2).
- Ordinarity from the ordinary level at S\_p; local–global compatibility gives (3)–(4).


*Checks.*

- For n = 3 the conclusion produces a cuspidal RACSDC representation of GL\_3 congruent to a GL\_2 × GL\_1 isobaric sum.


*Source.*

- [nt21] Theorem 4.1, p. 60; Remark 4.2, p. 60; proof, pp. 64–65: States and proves level raising from π\_2 ⊞ π\_{n−2} to a cuspidal RACSDC representation over a quadratic extension with the prescribed types at T\_1, T\_2, T\_3.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/nt-prescribed-types`, `ModularityAndLanglandsExtensionsPartII:SP.5/nt-local-components-and-box-sums`, `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/type-transfer`, `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`, `PotentialAutomorphyInfrastructurePartII:PL.2/iwahori-ordinary-parts`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`.

<a id="sp-5-ct-conjugate-symplectic-character"></a>
### SP.5.5 A conjugate-symplectic Hecke character with prescribed archimedean components

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-conjugate-symplectic-character` · theorem

For a CM extension E/F of a totally real field there is a continuous character μ : E^×\𝔸\_E^× → ℂ^× with μ|\_{𝔸\_F^×} = ε\_{E/F} (the quadratic character) and μ(z) = (z/z̄)^{1/2} for z ∈ E\_w ≅ ℂ at every archimedean place w.


*Hypotheses and conventions.*

- E/F CM.


*Proof route.*

- On E^×𝔸\_F^×E\_∞^× prescribe the quadratic character on 𝔸\_F^× and z/|z| at each complex place. The restrictions agree on intersections; the CM unit calculation lets one choose a compact open finite-idelic subgroup on which the prescription is trivial. The resulting character on a subgroup of the discrete quotient extends to the whole quotient because ℂ^× is divisible. Pullback gives a continuous Hecke character with exactly the required restriction and infinity type (CTIII proof of Lemma 3.4, pp. 21–22).


*Checks.*

- For F = ℚ and E imaginary quadratic, μ is a Hecke character of ∞-type (1/2, −1/2) restricting to the quadratic character of E/ℚ.


*Source.*

- [ct17] Lemma 3.4, p. 21: Constructs a conjugate-symplectic Hecke character of E with archimedean components (z/z̄)^{1/2} restricting to the quadratic character of E/F.


*Needs.* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`.

<a id="sp-5-ct-definite-unitary-count"></a>
### SP.5.6 Counting automorphic representations of the definite unitary group with given base change

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-definite-unitary-count` · theorem

Let G be the unitary group in n = l + 2 variables over F (l > 5 prime for Theorem 3.8; l = 5 is Theorem 3.10), split by the CM field E, compact at infinity and quasi-split at finite places, [F : ℚ] even. (Theorem 3.8(1)) For σ\_1, σ\_2 conjugate self-dual cuspidal on GL\_4(𝔸\_E), GL\_m(𝔸\_E) (m = l − 2) with σ\_1 ⊞ σ\_2 regular algebraic of infinity type ((l + 1)/2, …, (−1 − l)/2) and ∏\_{v|∞}det(w\_v) = 1, places v\_0, …, v\_s ramified in E of odd residue characteristic with σ\_{1,w\_i} ≅ St\_3 ⊞ St\_1 and σ\_{2,w\_i} ≅ St\_m, and all other ramification split: there are exactly 4^{s+1}/2 automorphic representations of G(𝔸\_F) with stable base change σ\_1 ⊞ σ\_2, each of multiplicity one, in bijection with tuples (σ\_{v\_i}) ∈ ∏Π\_{φ\_{v\_i}} with ∏ε\_{v\_i}(σ\_{v\_i}) = 1. (Theorem 3.8(2)) For a RACSDC π with π\_{w\_i} ≅ St\_m ⊞ St\_3 ⊞ St\_1 there are exactly 4^{s+1}, in bijection with ∏Π\_{φ\_{v\_i}}. (Theorem 3.10) For l = 5 the counts are 2^s and 2^{s+1}. Stable base change holds for representations with trivial σ\_∞.


*Hypotheses and conventions.*

- The archimedean sign condition holds when every place above l splits in E with [F\_v : ℚ\_l] even and the representation is ι-ordinary (Remark 3.9).


*Proof route.*

- Stabilise the trace formula for G with test functions that are pseudo-coefficients at infinity and Iwahori-level at the v\_i (EndoscopicTransferAndUnitaryTraceComparison ET.4).
- Insert the stable and endoscopic local identities of SP.4/ct-packet-signs with the character μ of SP.5/ct-conjugate-symplectic-character in the L-embedding.
- Mok's multiplicity formula (parent ML.4) gives multiplicity one and the sign condition.


*Checks.*

- For s=0 and l>5 the endoscopic and cuspidal counts are respectively 2 and 4. For l=5 the corresponding two-member-packet counts are 1 and 2.


*Source.*

- [ct17] Theorem 3.8, pp. 28–29; Remark 3.9 and the remark after the proof, pp. 29–31; Theorem 3.10, pp. 31–32: Counts automorphic representations of the definite unitary group with endoscopic or cuspidal stable base change, with multiplicity one and the sign condition, and records strong base change.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.4/ct-packet-signs`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-conjugate-symplectic-character`, `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`, `ModularityAndLanglandsExtensions:ML.4/kmsw-inner-forms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`.

<a id="sp-5-ct-level-raising-setup"></a>
### SP.5.7 The set-up of Clozel–Thorne III §4: places, levels and algebraic modular forms

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-level-raising-setup` · definition

Let l ≥ 5 be prime, ι : Q̄\_l ≅ ℂ, E a CM field with totally real F such that every place v | l of F splits in E with [F\_v : ℚ\_l] even, and places v\_0, …, v\_s (s ≥ 1) of F ramified in E of odd residue characteristic with q\_{v\_0} ≡ −1 mod l and each q\_{v\_i} (i ≥ 1) a primitive root mod l, all other places unramified in E. Let n = l + 2, m = l − 2, G as in SP.5/ct-definite-unitary-count, and π\_1, π\_2 cuspidal conjugate self-dual on GL\_m(𝔸\_E), GL\_4(𝔸\_E) with π\_{1,w\_i} ≅ St\_m, π\_{2,w\_i} ≅ St\_3 ⊞ St\_1, π = π\_1 ⊞ π\_2 regular algebraic, ι-ordinary of infinity type ((n − 1)/2, …, (1 − n)/2), r̄\_ι(π) = ρ̄\_1 ⊕ ρ̄\_2 with ρ̄\_i absolutely irreducible and the tame inertia generator acting at w\_i as a regular unipotent on ρ̄\_1 and with Jordan type 3 + 1 on ρ̄\_2. Levels: U\_0 with P\_{v\_0} at v\_0 and B\_{v\_i} at v\_i (i ≥ 1), and U\_1 = U\_0 except B\_{v\_0} at v\_0, so [U\_0 : U\_1] = q\_{v\_0} + 1. S(U, A) is the module of A-valued functions on G(F)\G(𝔸\_F^∞)/U, with Hecke algebra T(U, 𝒪) generated by the spherical operators at split places and the U\_v^j at v | l; 𝔪 and 𝔪^∨ are the maximal ideals of σ and σ^∨.


*Hypotheses and conventions.*

- Weight zero; ordinary parts at the places above l as in PotentialAutomorphyInfrastructurePartII PL.2.
- Choose U away from v₀ sufficiently small for p-integral exactness and the unweighted double-coset pairing. Fix an ordinary automorphic σ with base change π₁⊞π₂, supplied by ct-definite-unitary-count, to define 𝔪; impose the prescribed local invariants at the other places.


*Proof route.*

- Assemble from PL.2 (algebraic modular forms and Hecke algebras on definite unitary groups) with Iwahori level at the ramified places.


*API.*

- `CTLevelRaising.levels` (data): The levels U\_0 ⊃ U\_1 with [U\_0 : U\_1] = q\_{v\_0} + 1.
- `CTLevelRaising.forms` (constructor): S(U, A) = functions on G(F)\G(𝔸\_F^∞)/U with values in A.
- `CTLevelRaising.hecke` (data): T(U, 𝒪) and the maximal ideals 𝔪, 𝔪^∨.
- `CTLevelRaising.contributes` (characterisation): Σ with trivial Σ\_∞ contributes to N ⊂ S(U, 𝒪) iff N ∩ ι^{−1}Σ^{∞,U,ord} ≠ 0.
- `CTLevelRaising.coefficientChange` (functoriality): For sufficiently small level, changing an O-lattice in the coefficient types commutes with the ordinary forms functor and localization; the dual pairing changes to the contragredient lattice.


*Unit tests.*

- `CTLevelRaising.index` (computation): [U\_0 : U\_1] = [P\_{v\_0} : B\_{v\_0}] = q\_{v\_0} + 1, divisible by l since q\_{v\_0} ≡ −1 mod l.
- `CTLevelRaising.l_five` (computation): For l = 5, n = 7 and m = 3: π\_1 on GL\_3 Steinberg at the w\_i, π\_2 on GL\_4 of type St\_3 ⊞ St\_1.
- `CTLevelRaising.primitive_root` (non-example): q\_{v\_i} ≡ 1 mod l is not allowed at v\_i (i ≥ 1): Proposition 2.6's lattices need a primitive root.


*Checks.*

- For l = 5: n = 7, m = 3, and q\_{v\_0} ≡ −1 mod 5 (e.g. q\_{v\_0} = 9, 19, 29 …).


*Uses.*

- Clozel–Thorne III, Theorem 4.2, p. 35: the level-raising argument compares S(U\_0, 𝒪)\_𝔪 and S(U\_1, 𝒪)\_𝔪
- Clozel–Thorne III, Proposition 4.3, p. 36: the perfect pairing on S(U\_1, 𝒪)


*Source.*

- [ct17] §4.1, pp. 33–34: Fixes the fields, the ramified places v\_0, …, v\_s with their congruence conditions, the isobaric sum π\_1 ⊞ π\_2, the levels U\_0 ⊃ U\_1 and the algebraic modular forms with their Hecke algebras and maximal ideals.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra`, `PotentialAutomorphyInfrastructurePartII:PL.2/iwahori-ordinary-parts`, `ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures`.

<a id="sp-5-ct-contributing-local-types"></a>
### SP.5.8 Local types of representations contributing to S(U\_1, 𝒪)\_𝔪

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-contributing-local-types` · theorem

In the set-up SP.5/ct-level-raising-setup, if Σ contributes to S(U\_1, 𝒪)\_𝔪 and Π is its stable base change to GL\_n(𝔸\_E), then Π is ι-ordinary and its components at the places above v\_0, …, v\_s are semistable; moreover either (1) Π\_{w\_i} ≅ St\_m ⊞ St\_3 ⊞ St\_1 for every i, or (2) for some i the monodromy of r\_ι(Π) at w\_i has Jordan type (n − 2) + 1 + 1 or n, and Π is cuspidal.


*Hypotheses and conventions.*

- Set-up of SP.5/ct-level-raising-setup.


*Proof route.*

- Semistability: from Σ c(σ)⟨tr σ, f\_v⟩ = ⟨tr π\_w × I\_c, f\_{E\_w}⟩ with c(σ) > 0 and the twisted Jacquet trace (correcting the proof of Clozel–Thorne II Lemma 4.3).
- Residual monodromy has Jordan types m and 3 + 1; the closure order on nilpotent classes (dim ker N^j ≤ dim ker N̄^j), Mok's parity condition and quadratic characters ≡ 1 mod λ leave only the listed possibilities.


*Checks.*

- The original π = π\_1 ⊞ π\_2 itself falls in case (1).


*Source.*

- [ct17] Proposition 4.1 and proof, pp. 34–35: Shows the base change of a contributing representation is ordinary and semistable at the v\_i, and either has the original local types everywhere or is cuspidal with a larger Jordan block at some w\_i.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/ct-level-raising-setup`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-definite-unitary-count`, `ModularityAndLanglandsExtensions:ML.4/mok-unitary-classification`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-constituent-galois-representation`.

<a id="sp-5-ct-pairing"></a>
### SP.5.9 The pairing on S(U\_1) and the module structure at the level-raising place

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-pairing` · theorem

The pairing ⟨f, g⟩ = Σ\_{x∈G(F)\G(𝔸\_F^∞)/U\_1} f(x)g(x) on S(U\_1, 𝒪) satisfies ⟨af, g⟩ = ⟨f, ȷ(a)g⟩ for a ∈ H\_{B\_{v\_0},𝒪} and induces (1) perfect pairings S(U\_1, 𝒪)\_𝔪 × S(U\_1, 𝒪)\_{𝔪^∨} → 𝒪 and mod l; (2) a pairing vanishing on S(U\_0, k)\_𝔪 × S(U\_0, k)\_{𝔪^∨}, because q\_{v\_0} ≡ −1 mod l; (3) a perfect pairing M × N → 𝒪 whose reduction vanishes on M^{U\_0} ⊗ k × N^{U\_0} ⊗ k, for M the intersection of the R\_i^{B\_{v\_i}}-isotypic parts of S(U\_1, 𝒪)\_𝔪 and N the intersection of the (R\_i^∨)^{B\_{v\_i}}-isotypic parts of S(U\_1, 𝒪)\_{𝔪^∨} (N is not defined in the source, E14). (Lemma 4.4) If no contributing representation falls in case (2) of SP.5/ct-contributing-local-types, then M ⊗ ℂ ≅ (X^B)^a ⊕ (Y^B)^b ⊕ (Z^B)^c ≅ N ⊗ ℂ as H\_{B\_{v\_0}}-modules with a > b = c ≥ 0. For l=5 omit Z and c; the conclusion is a>b≥0 for the X,Y multiplicities.


*Hypotheses and conventions.*

- l ∤ #U\_1-stabilisers (U\_1 sufficiently small).


*Proof route.*

- Perfectness from the finite double-coset sum and smallness of U\_1 (as in Clozel–Thorne II Proposition 4.5).
- Vanishing on U\_0-invariants: the P\_{v\_0}-averaging multiplies the pairing by [U\_0 : U\_1] = q\_{v\_0} + 1 ≡ 0 mod l.
- Lemma 4.4: endoscopic base changes contribute only X at v\_0 (SP.5/ct-definite-unitary-count), cuspidal ones X, Y, Z; the endoscopic set is non-empty because of π\_1 ⊞ π\_2.


*Checks.*

- If U\_1 = U\_0 (no level raising at v\_0), the pairing would not vanish mod l: the vanishing uses q\_{v\_0} + 1 ≡ 0 mod l.


*Source.*

- [ct17] Proposition 4.3, p. 36; Lemma 4.4, p. 36: Proves perfectness of the pairing on the localised forms of level U\_1 and its vanishing modulo l on U\_0-invariants, and describes M ⊗ ℂ as an Iwahori–Hecke module.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/ct-level-raising-setup`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-contributing-local-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-definite-unitary-count`, `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`.

<a id="sp-5-ct-level-raising"></a>
### SP.5.10 Level raising for l = 5 and l = 7 (Clozel–Thorne III Theorem 4.2)

`ModularityAndLanglandsExtensionsPartII:SP.5/ct-level-raising` · theorem · planet: Clozel–Thorne level raising (Theorem 4.2)

In the set-up SP.5/ct-level-raising-setup with l = 5 or l = 7, there is an automorphic representation Σ of G(𝔸\_F) contributing to S(U\_1, 𝒪)\_𝔪 whose stable base change is cuspidal with monodromy of Jordan type (n − 2) + 1 + 1 or n at some w\_i (case (2) of SP.5/ct-contributing-local-types).


*Hypotheses and conventions.*

- l ∈ {5, 7}; the count fails for l > 7 since Z(χ̄) ≠ 0 (Remark 4.5).


*Proof route.*

- Suppose every contributing base change has the original monodromy. Choose local packet members at v\_i (i≥1) with product of signs −1. For l=7 the endoscopic contributors supply X at v₀ and cuspidal contributors supply X⊕Y⊕Z, yielding multiplicities a>b=c. For l=5 the packet has X,Y only and gives a>b.
- Let M,N be the dual-type lattices of ct-pairing. The perfect pairing restricts to M(χ̄)×N(χ̄ȷ). Proposition 2.9 gives rank a+3b for each, and their P-fixed sublattices have rank a+b. For l=7 use the exponent [2,1,0,−1]; for l=5 use [1,0,−1]. Z contributes nothing to these localizations in the l=7 case.
- Modulo l the two P-fixed subspaces annihilate one another by ct-pairing. In a perfect pairing between spaces of dimension a+3b, this forces 2(a+b)≤a+3b, hence a≤b, a contradiction. No self-pairing or self-isotropic identification of M and N is used.


*Checks.*

- For l = 5 the count compares ranks a + b and a + 3b of modules over H\_{B\_{v\_0}} for n = 7.


*Source.*

- [ct17] Theorem 4.2, p. 35; proof, pp. 35–37; Remark 4.5, p. 37: Proves level raising at v\_0 for l = 5, 7 by an isotropy count in the localised Iwahori–Hecke module.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/ct-pairing`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-contributing-local-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-definite-unitary-count`.

## Layer SP.6: Level raising to Steinberg by residually reducible deformation theory

**Targets.** Newton–Thorne I §6: Schur and primitive residual representations after split extensions and cuspidality of soluble base changes (Lemma 6.2); auxiliary places with scalar residual Frobenius (Lemma 6.3); deformation data D with their dimension bound (Lemma 6.4); the map from the pseudodeformation ring to the ordinary Hecke algebra (Lemma 6.6); a generic prime unramified outside p (Lemma 6.7, with E22); and Theorem 6.1, level raising to Steinberg. Clozel–Thorne III §5: deformation data and preliminary reductions; the dimension of the reducible locus with Steinberg-type conditions (Lemma 5.3, restricted to unipotent conditions as in E21 of that extraction) and Lemma 5.4; changing characters and the characteristic-l prime giving a Steinberg lift (Lemmas 5.5–5.6); Theorem 5.1 (level raising to Steinberg for residually reducible representations, with E20) and Theorem 5.7 (automorphy lifting from a lift with a long Jordan block). Thorne 2024 Theorem 6.11: level raising to an ι-ordinary lift Steinberg at a q-adic place by p-adic methods.

**Sources.** Newton–Thorne I §6, pp. 75–82; Clozel–Thorne III §5, pp. 37–44; Thorne 2024 §6, pp. 38–41.

*Requires:* `ArithmeticGaloisDuality:R02.3`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensionsPartII:SP.4`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `PotentialAutomorphyInfrastructurePartII:PL.3`, `PotentialAutomorphyInfrastructurePartII:PL.6`, `PotentialAutomorphyInfrastructurePartII:PL.7`, `SmoothRepresentationsOfLocalGroups:SR.3`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-6-nt-schur-primitive-base-change"></a>
### SP.6.1 Schur and primitive residual representations after split extensions; cuspidal soluble base change

`ModularityAndLanglandsExtensionsPartII:SP.6/nt-schur-primitive-base-change` · theorem

In the setting of Newton–Thorne I §6 (r̄ = r̄\_{π,ι} a sum of characters χ\_1 ⊕ ⋯ ⊕ χ\_n as in SP.6/nt-steinberg-level-raising), choose Y\_a so that Y\_a-split finite CM extensions L/F are linearly disjoint from the field cut out by r̄|\_{G\_{F(ζ\_p)}}. Then for such L: (1) the polarized extension r̄^{pol}:G\_{F⁺}→𝒢\_n(k), restricted to G\_{L⁺(ζ\_p)}, is Schur; (2) r̄|\_{G\_L} is primitive; (3) if L/F is soluble the base change of π to L is cuspidal; (4) more generally, for L/F\_0/F with L/F\_0 soluble and Π RACSDC on GL\_n(𝔸\_{F\_0}) with r̄\_{Π,ι} ≅ r̄|\_{G\_{F\_0}}, the base change of Π to L is cuspidal. (Lemma 6.3) There are infinitely many places ṽ\_a of F prime to S, not split in F(ζ\_p), with r̄(Frob\_{ṽ\_a}) scalar.


*Hypotheses and conventions.*

- Hypotheses (1)–(5) of SP.6/nt-steinberg-level-raising.


*Proof route.*

- (1)–(2): the ratios χ\_i/χ\_j have large order on G\_{F(ζ\_p)} and stay distinct after disjoint extensions (PotentialAutomorphyInfrastructurePartII PL.6, Schur and primitive representations, sums of characters with large ratios).
- (3)–(4): a non-cuspidal cyclic base change would make the Galois representation induced (Arthur–Clozel Theorems 4.2, 5.1, Proposition 4.4; Clozel's purity lemma), contradicting primitivity.
- Lemma 6.3: Chebotarev with τ = τ\_0τ\_0^c where ε(τ\_0)² ≠ 1.


*Checks.*

- If two characters χ\_i, χ\_j agree on G\_{L(ζ\_p)}, r̄|\_{G\_L} fails to be Schur; the order hypothesis on χ\_i/χ\_j prevents this.


*Source.*

- [nt21] Lemma 6.2, p. 77; Lemma 6.3, p. 78: Proves Schur and primitivity properties after split extensions, cuspidality of soluble base changes, and the existence of auxiliary places with scalar residual Frobenius.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.6/schur-residual-representation`, `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`, `PotentialAutomorphyInfrastructurePartII:PL.6/character-sums-primitive`, `ModularityAndLanglandsExtensions:ML.5/cyclic-base-change-gln`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-6-steinberg-deformation-data"></a>
### SP.6.2 Deformation data with Steinberg and fixed-type local conditions

`ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data` · definition

A deformation datum D = (L, {R\_v}\_{v∈X}) consists of a soluble CM extension L/F, split at the auxiliary sets (Y\_a ∪ S̃\_a in Newton–Thorne I §6; the set V\_0 ∪ S\_a of a good extension in Clozel–Thorne III §5), a set X of places of L⁺ away from p, and for each v ∈ X a local lifting ring R\_v: the fixed-type ring R(ṽ, Θ\_ṽ, r̄|\_{G\_{L\_ṽ}}) of SP.4/fixed-type-lifting-rings, the unipotent ring R^1\_v, the Steinberg ring R^{St}\_v (q\_v ≡ 1 mod p and r̄ trivial at v), a ring R^{χ\_v}\_v of fixed characters, or the partition ring R^m\_v cut out by det(X−ρ(φ\_v))∈Pol\_n(m,q\_v): its Frobenius polynomial is a product of q\_v-strings of lengths given by m. This is a Frobenius-polynomial condition, not an upper bound on the Jordan type of monodromy; at pure points the monodromy partition is m. Attached are the global polarized deformation problem 𝒮\_D with ordinary conditions R^Δ\_v at p over the Iwasawa algebra Λ\_L, its universal ring R\_D, the pseudodeformation subring P\_D ⊂ R\_D (R\_D finite over P\_D), the localised ordinary Hecke algebra 𝕋\_D, the surjection P\_D → 𝕋\_D with kernel J\_D (and J\_D R\_D) when every R\_v is a fixed-type ring, R^1\_v or R^{χ\_v}\_v (in Newton–Thorne I: when no R\_v is R^{St}\_v; Clozel–Thorne III: when every R\_v is R^{χ\_v}\_v), and the reducible quotient R\_D^{red}. When every R\_v is a fixed-type, R^{χ\_v}\_v, unipotent or Steinberg ring (not a partition ring R^m\_v), every irreducible component of R\_D has dimension at least 1 + n[L⁺ : ℚ] = dim Λ\_L (Newton–Thorne I Lemma 6.4; Clozel–Thorne III §5.1); for partition rings only the bound on R\_D^{red} of SP.6/ct-reducible-locus is used.


*Hypotheses and conventions.*

- Newton–Thorne I: n ≥ 3 odd and p > 2n; Clozel–Thorne III: n ≥ 2, l > 3 with l ∤ n\_1n\_2n; X is a set of places of L⁺ (correction E26).


*Proof route.*

- The objects Λ\_L, 𝒮\_D, R\_D, P\_D, 𝕋\_D, J\_D, R\_D^{red} are those of Thorne 2015, planned in PotentialAutomorphyInfrastructurePartII PL.2 (ordinary deformation datum), PL.6 (pseudodeformation subring, reducibility ideal) and PL.7; this node packages the local conditions used for level raising.
- Dimension bound: Thorne 2015 Proposition 3.9 with Clozel–Harris–Taylor Lemma 2.1.7 and the dimensions of the local rings (LocalGaloisDeformationRings L7, partition rings).


*API.*

- `DeformationDatum.mk` (constructor): A soluble split CM extension L/F with local rings R\_v at a set X of places of L⁺.
- `DeformationDatum.ring` (data): The universal ring R\_D of the polarized ordinary problem 𝒮\_D over Λ\_L.
- `DeformationDatum.pseudoRing` (data): P\_D ⊂ R\_D generated by characteristic polynomial coefficients; R\_D is finite over P\_D.
- `DeformationDatum.heckeMap` (other): The surjection P\_D → 𝕋\_D with kernel J\_D when every R\_v is of fixed-type, unipotent or fixed-character type.
- `DeformationDatum.dim_ge` (other): Without partition rings, every irreducible component of R\_D has dimension ≥ 1 + n[L⁺ : ℚ].
- `DeformationDatum.baseChange` (functoriality): Restriction to a further soluble split extension L′/L gives a finite map R\_{D\_{L′}} → R\_D.
- `DeformationDatum.points` (universal-property): Continuous local coefficient-compatible maps from R\_D to A classify strict equivalence classes of lifts of the chosen polarized residual representation satisfying exactly the local ordinary, type or partition quotients in D.


*Unit tests.*

- `DeformationDatum.dim_bound_n3` (computation): For n = 3 and [L⁺ : ℚ] = 2 the bound is dimension ≥ 1 + 3·2 = 7 = dim Λ\_L.
- `DeformationDatum.empty_X` (degenerate): For X=∅ there are no extra listed partition/type conditions. The ordinary conditions at p, fixed polarization and the global unramified-outside-S restriction still apply, as do any standing auxiliary unrestricted conditions.
- `DeformationDatum.steinberg_no_hecke` (non-example): If some R\_v is the Steinberg ring R^{St}\_v, the map P\_D → 𝕋\_D is not asserted (the Hecke algebra is of level prime to v).


*Checks.*

- For X empty, R\_D is the ordinary deformation ring of r̄|\_{G\_{L⁺}} with no additional partition or type places in X; the global finite ramification set and its auxiliary unrestricted local conditions remain part of the datum.


*Uses.*

- Newton–Thorne I, Lemmas 6.6–6.7 and Theorem 6.1, pp. 79–82: the generic prime and the comparison of R\_{D\_{1,a}} and R\_{D\_{1,b}}
- Clozel–Thorne III, Lemmas 5.3–5.6 and Theorem 5.1, pp. 40–43: dimension of the reducible locus and the Steinberg prime


*Source.*

- [nt21] §6, deformation data and Lemma 6.4, pp. 78–79: Defines deformation data with fixed-type, unipotent and Steinberg local rings, the attached global problem and ring, and bounds the dimension of its components.
- [ct17] §5.1, deformation data, preliminary reductions and the objects of Thorne 2015, pp. 38–40: Defines deformation data with characters, unipotent, Steinberg and partition rings over good soluble extensions, after preliminary reductions.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-deformation-datum`, `PotentialAutomorphyInfrastructurePartII:PL.6/polarized-pseudodeformation-subring`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducibility-ideal`, `PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra`, `ModularityAndLanglandsExtensionsPartII:SP.4/fixed-type-lifting-rings`, `LocalGaloisDeformationRings:L7/partition-monodromy-rings`, `LocalGaloisDeformationRings:R08.2/steinberg-ring-domain`.

<a id="sp-6-nt-generic-prime"></a>
### SP.6.3 The Hecke comparison and a generic prime unramified outside p

`ModularityAndLanglandsExtensionsPartII:SP.6/nt-generic-prime` · theorem

(Lemma 6.6) With 𝕋\_D = 𝕋^{ord}(D)\_{𝔪\_D} and P\_D ⊂ R\_D as in SP.6/steinberg-deformation-data, if R\_v ≠ R^{St}\_v for all v ∈ X there is a natural surjection P\_D → 𝕋\_D of Λ\_L-algebras. (Lemma 6.7) There are a deformation datum D\_1 = (L\_1, ∅) with 𝕋\_{D\_1} ≠ 0 and a generic prime 𝔭\_1 ⊂ R\_{D\_1} of dimension 1 and characteristic p with J\_{D\_1} ⊂ 𝔭\_1 and r\_{𝔭\_1}|\_{G\_{L\_1,v\_{St}}} trivial. The auxiliary field is L\_0 = M\_d·F with M\_d/F⁺ cyclic totally real of odd degree d > n + n², split at R, Y\_a and S\_a and totally inert at S\_p.


*Hypotheses and conventions.*

- Setting of SP.6/nt-steinberg-level-raising.


*Proof route.*

- Lemma 6.6: Galois representations r\_σ over the rings A\_c (Clozel–Harris–Taylor Lemmas 2.1.5, 2.1.7), as in Thorne 2015 Proposition 4.12.
- Lemma 6.7: choose L\_0 so that the anti-cyclotomic unit rank at each R\_i exceeds n + n² (Allen–Newton–Thorne Theorem 7.1, Maire Proposition 19; the source's multiplicity-one claim must be applied to one place of R\_i, correction E22); then Newton–Thorne I Theorem 1.4 and the generic-prime theorem PL.7 (Theorem 5.7) at L\_0, then pass to L\_1 where the types become unramified (SP.4/fixed-type-lifting-rings (4)) and Thorne 2015 Proposition 4.18.


*Checks.*

- The chosen prime is in the characteristic-p special fibre by the generic-prime construction. Finiteness of the Hecke algebra over Λ alone would not force an arbitrary prime to have characteristic p.


*Source.*

- [nt21] Lemma 6.6, p. 79; Lemma 6.7 and proof, pp. 80–82: Constructs the surjection from the pseudodeformation ring to the ordinary Hecke algebra and finds a dimension-one generic prime of characteristic p, trivial at the Steinberg place.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`, `ModularityAndLanglandsExtensionsPartII:SP.6/nt-schur-primitive-base-change`, `ModularityAndLanglandsExtensionsPartII:SP.4/fixed-type-lifting-rings`, `PotentialAutomorphyInfrastructurePartII:PL.7/generic-primes-large-quotients`, `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime`, `PotentialAutomorphyInfrastructurePartII:PL.2/hecke-valued-galois-representation`, `ArithmeticGaloisDuality:R02.3/antiunit-class-field-rank`.

<a id="sp-6-nt-steinberg-level-raising"></a>
### SP.6.4 Level raising to Steinberg by Galois deformation theory (Newton–Thorne I Theorem 6.1)

`ModularityAndLanglandsExtensionsPartII:SP.6/nt-steinberg-level-raising` · theorem · planet: Level raising to Steinberg (NT I Theorem 6.1)

Under the standard assumptions, let n ≥ 3 be odd, p > 2n, and π RACSDC on GL\_n(𝔸\_F) with (1) π ι-ordinary; (2) [F(ζ\_p) : F] = p − 1; (3) r̄\_{π,ι} ≅ χ\_1 ⊕ ⋯ ⊕ χ\_n with χ\_i^c = χ\_i^∨ε^{1−n} and χ\_i/χ\_j|\_{G\_{F(ζ\_p)}} of order > 2n; (4) r̄\_{π,ι}|\_{G\_{F\_ṽ}} trivial and [F\_ṽ : ℚ\_p] > n(n − 1)/2 + 1 for v ∈ S\_p; (5) R = R\_1 ⊔ R\_2 ⊂ S − S\_p with R\_1 and R\_2 both non-empty and of odd residue characteristic, π\_ṽ|\_{𝔮\_ṽ} ⊇ λ̃(ṽ, Θ\_ṽ, n) (n\_1 = 3, q\_v of order 3 mod p, on R\_1; n\_1 = n − 2, q\_v of order n − 2, on R\_2), each Θ\_ṽ of order p, and (5)(d): for each non-trivial decomposition r̄\_{π,ι} = ρ̄\_1 ⊕ ρ̄\_2 there is i ∈ {1, 2} such that at every v ∈ R\_i both ρ̄\_1|\_{G\_{F\_ṽ}} and ρ̄\_2|\_{G\_{F\_ṽ}} have a non-trivial unramified subquotient. For a place v\_{St} above S − (S\_p ∪ R) with q\_{v\_{St}} ≡ 1 mod p and r̄ trivial there, there is a RACSDC ι-ordinary π′ on GL\_n(𝔸\_F) with r̄\_{π′,ι} ≅ r̄\_{π,ι}, HT\_τ(r\_{π′,ι}) = HT\_τ(r\_{π,ι}) for all τ, and π′\_{v\_{St}} an unramified twist of Steinberg.


*Hypotheses and conventions.*

- Standing assumptions of Newton–Thorne I §1 and §6; in applications R\_1, R\_2 are the sets T\_1, T\_3 of SP.5/nt-level-raising-data.
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- SP.6/nt-generic-prime gives a generic prime 𝔭\_1 of R\_{D\_1} containing J\_{D\_1}, trivial at v\_{St}.
- The source labels D\_{1,a} Steinberg at v\_{St} and D\_{1,b} unipotent there. Work first in the unipotent ambient problem, to which the generic Hecke-kernel theorem applies at the prime trivial at v\_{St}. The Steinberg quotient meets this prime, and the local dimension bound produces a component of the expected dimension in that quotient. Character-sum finiteness and generic propagation then produce an automorphic characteristic-zero point on the Steinberg component.
- Geraghty Lemma 2.25 and Theorem 1.2 (ordinary R = T) give an automorphic π″ on that component, Steinberg at v\_{St}; SP.6/nt-schur-primitive-base-change and the prescribed-type lifts of PL.7 (Proposition 5.8) descend to F.


*Checks.*

- For n = 3 the theorem raises the level of a residually reducible RACSDC representation of GL\_3 to Steinberg at a place with q ≡ 1 mod p.


*Source.*

- [nt21] Theorem 6.1, p. 76; proof, p. 82: States and proves level raising to Steinberg for an ordinary RACSDC representation whose residual representation is a sum of characters, through a generic prime of a residually reducible ordinary deformation ring.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/nt-generic-prime`, `ModularityAndLanglandsExtensionsPartII:SP.6/nt-schur-primitive-base-change`, `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-hecke-kernel`, `PotentialAutomorphyInfrastructurePartII:PL.7/sum-of-characters-finiteness`, `PotentialAutomorphyInfrastructurePartII:PL.7/prescribed-type-lifts`, `PotentialAutomorphyInfrastructurePartII:PL.3/ordinary-r-equals-t`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-6-ct-reducible-locus"></a>
### SP.6.5 The reducible locus with Steinberg-type conditions

`ModularityAndLanglandsExtensionsPartII:SP.6/ct-reducible-locus` · theorem

Under the standing hypotheses of Clozel–Thorne III §5.1, fix a partition m with m\_1 > n\_1 = dim ρ̄\_1 and a deformation datum D = (L, {R\_v}\_{v∈R\_0} ∪ {R^m\_v}\_{v∈R\_1}) with R\_v ∈ {R^1\_v, R^{St}\_v, R^m\_v} at every v ∈ R\_0 (v ∤ l, q\_v ≡ 1 mod l; this restriction to unipotent conditions is E21 of the extraction, and the only application has R\_0 = ∅). Let Δ (resp. Δ′) be the Galois group of the maximal abelian l-extension of L unramified outside l (resp. also split at R̃\_1 ∪ R̃\_1^c) and d = dim\_{ℚ\_l} ker(Δ ⊗ ℚ\_l → Δ′ ⊗ ℚ\_l)^{c=−1}. (Lemma 5.3) dim R\_D^{red} ≤ 1 + n[L⁺ : ℚ] − d, and R\_D^{red} is finite over Λ\_L. (Lemma 5.4) For D with R^m\_v at the places above v\_0 (m the Jordan type of N in rec^T(Π\_{w\_0})) and D′ with R^1\_v there, dim R\_D/J\_{D′}R\_D = dim Λ\_L.


*Hypotheses and conventions.*

- Standing hypotheses of §5.1, including potential ordinary automorphy of ρ̄\_1, ρ̄\_2 (hypothesis (4) of SP.6/ct-steinberg-level-raising).


*Proof route.*

- For every distribution of ordinary characters between the two residual blocks, the fixed-determinant ordinary block deformation rings are finite over their weight algebras. Let A be their completed tensor product and adjoin universal determinant-twist characters Ψ₁,Ψ₂ to parametrize reducible deformations. One cannot identify arbitrary block deformations with the residual blocks tensored by characters.
- After quotienting by the maximal ideal of A, the blocks become r̄₁⊗Ψ₁ and r̄₂⊗Ψ₂. The partition Frobenius-polynomial condition with m₁>n₁ forces a common eigenvalue of the two blocks, hence Ψ₁(Frob\_ṽ)−Ψ₂(Frob\_ṽ) is nilpotent at v∈R₁. The anti-invariant class-field rank d then gives the asserted dimension loss and finiteness.
- For Lemma 5.4, use the pure automorphic point furnished by Π and the unique-component assertion of Lemma 5.2: its local component is retained by the partition quotient. Combined with the Λ-finite ordinary Hecke algebra and the lower component-dimension bound, this gives dim R\_D/J\_{D′}R\_D=dim Λ\_L. Finiteness alone is only an upper bound.


*Checks.*

- If m = (1, …, 1) (unramified condition) the shared-eigenvalue argument gives nothing and the bound is not claimed.


*Source.*

- [ct17] Lemma 5.3, p. 40; Lemma 5.4, p. 41: Bounds the dimension of the reducible locus of a deformation ring with a partition condition by the rank of anti-cyclotomic units split at the chosen places, and computes the dimension of the quotient by J\_{D′}.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-locus-dimension`, `PotentialAutomorphyInfrastructurePartII:PL.7/reducible-locus-small`, `ArithmeticGaloisDuality:R02.3/exponent-two-ramification-field`.

<a id="sp-6-ct-steinberg-prime"></a>
### SP.6.6 Changing characters, and a characteristic-l prime giving a Steinberg lift

`ModularityAndLanglandsExtensionsPartII:SP.6/ct-steinberg-prime` · theorem

(Lemma 5.5) For D\_0^χ = (L\_0, {R^{χ\_v}\_v}\_{v∈R}) with pairwise distinct χ\_{v,1}, …, χ\_{v,n} at each v ∈ R, and a good L ⊃ L\_0 on which every χ\_{v,i} is unramified above R, the datum D = (L, ∅) has R\_D ← P\_D → 𝕋\_D compatible with R^{nil}\_{D\_0^χ} ← P^{nil}\_{D\_0^χ} → 𝕋\_{D\_0^χ}. (Lemma 5.6) Suppose D = (L, ∅) and a dimension-one prime 𝔭 ⊂ R\_D of characteristic l satisfy: (1) r\_𝔭 : G\_L → GL\_n(Frac A) absolutely irreducible (A the normalisation of R\_D/𝔭); (2) the characters ψ\_1^v, …, ψ\_n^v of I\_{L\_ṽ} (v ∈ S\_{l,L}) pairwise distinct; (3) for some v ∈ S\_{l,L} some σ ∈ I\_{L\_ṽ} with r\_𝔭(σ) having eigenvalues λ₁,…,λ\_n satisfying ∏λ\_i^{a\_i}=1 only when every a\_i=0 (multiplicative ℤ-independence); (4) J\_D ⊂ 𝔭; (5) r\_𝔭|\_{G\_{L\_ũ}} trivial for some u ∈ T\_L − (S\_{l,L} ∪ S\_{a,L}). Then there is an ι-ordinary RACSDC Π\_1 of GL\_n(𝔸\_L) with r̄\_ι(Π\_1) ≅ r̄\_ι(Π)|\_{G\_L} and Π\_{1,ũ} an unramified twist of Steinberg.


*Hypotheses and conventions.*

- n\_1 ≠ n\_2 and n\_1n\_2 even (needed for soluble base change and descent for G, Clozel–Thorne I Proposition 2.9).
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Lemma 5.5: soluble base change and descent for the definite group (Clozel–Thorne I Proposition 2.9; PL.6, twisting and base change for residually reducible rings).
- The independent inertial eigenvalues make 𝔭 a generic prime. Add a Steinberg condition at the place where r\_𝔭 is trivial and compare its components with the unipotent ambient problem. The generic Hecke-kernel theorem and the local dimension bound give an automorphic characteristic-zero point on a Steinberg component; independence does not assert uniqueness of that local component.


*Checks.*

- Without (5) the lift need not be Steinberg anywhere; (5) places the Steinberg condition at u.


*Source.*

- [ct17] Lemma 5.5, pp. 41–42; Lemma 5.6, p. 42: Compares deformation rings and Hecke algebras after removing characters by base change, and derives a Steinberg automorphic lift from a suitable characteristic-l prime containing J\_D.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-hecke-kernel`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-restriction`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-6-ct-steinberg-level-raising"></a>
### SP.6.7 Level raising to Steinberg for residually reducible representations (Clozel–Thorne III Theorem 5.1)

`ModularityAndLanglandsExtensionsPartII:SP.6/ct-steinberg-level-raising` · theorem

Let E be imaginary CM, n ≥ 2, and Π RACSDC on GL\_n(𝔸\_E) with r̄\_ι(Π) = ρ̄\_1 ⊕ ρ̄\_2, ρ̄\_i absolutely irreducible, non-isomorphic, ρ̄\_i^c ≅ ρ̄\_i^∨ε^{1−n}, n\_1 > n\_2, r̄\_ι(Π) primitive, and a place w\_0 where Π\_{w\_0} is Iwahori-spherical and the monodromy N of rec^T(Π\_{w\_0}) has a Jordan block of length > n\_1. Assume (1) Π ι-ordinary; (2) l > 3, l ∤ n\_1n\_2n, n\_1n\_2 even; (3) each ρ̄\_i|\_{G\_{E(ζ\_l)}} adequate and E(ζ\_l) ⊄ the fixed field of ad r̄\_ι(Π); (4) a CM E\_0/E linearly disjoint from the extension of E(ζ\_l) cut out by r̄\_ι(Π) and ι-ordinary RAECSDC (π\_i, χ\_i) of GL\_{n\_i}(𝔸\_{E\_0}) with r̄\_ι(π\_i) ≅ ρ̄\_i|\_{G\_{E\_0}}. Then there are a soluble CM E\_1/E linearly disjoint from that extension and an ι-ordinary RACSDC Π\_1 on GL\_n(𝔸\_{E\_1}) with r̄\_ι(Π\_1) ≅ r̄\_ι(Π)|\_{G\_{E\_1}} and Π\_{1,w\_1} an unramified twist of Steinberg at a place w\_1 | w\_0.


*Hypotheses and conventions.*

- Hypothesis (4) and the standing assumptions as corrected in the extraction.
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Preliminary reductions by soluble base change (SP.6/steinberg-deformation-data).
- The reducible-locus bound gives an absolutely irreducible generic representation r\_{𝔭₀}. Over a good Galois extension the two residual blocks remain absolutely irreducible. If r\_{𝔭₀} became reducible after that restriction, Clifford theory gives a transitive set of conjugate constituents of equal dimension. Their residual semisimplifications distribute the two residual irreducible blocks, and transitivity would force n₁=n₂. This contradicts the hypothesis. Thus the restricted generic representation is absolutely irreducible; no unproved primitivity of r\_{𝔭₀} is needed.
- SP.6/ct-steinberg-prime then gives the Steinberg lift.


*Checks.*

- The hypothesis n\_1 > n\_2 with a Jordan block longer than n\_1 excludes Π\_{w\_0} unramified.


*Source.*

- [ct17] Theorem 5.1, pp. 37–38; proof, pp. 38–43: States and proves level raising to Steinberg for an ordinary RACSDC representation with two residual constituents and a long Jordan block, by the dimension of the reducible locus and a generic prime.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/ct-reducible-locus`, `ModularityAndLanglandsExtensionsPartII:SP.6/ct-steinberg-prime`, `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-two-constituent-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-finiteness`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-6-ct-jordan-block-lifting"></a>
### SP.6.8 Automorphy lifting from a lift with a long Jordan block (Clozel–Thorne III Theorem 5.7)

`ModularityAndLanglandsExtensionsPartII:SP.6/ct-jordan-block-lifting` · theorem

Let E be CM and ρ : G\_E → GL\_n(Q̄\_l) continuous with (1) ρ^c ≅ ρ^∨ε^{1−n}; (2) finitely many ramified places; (3) ρ ordinary of weight λ; (4) l > 3 and E(ζ\_l) ⊄ the field cut out by ad ρ̄; (5) ρ̄ ≅ ρ̄\_1 ⊕ ρ̄\_2 with ρ̄\_i|\_{G\_{E(ζ\_l)}} adequate, n\_1 ≠ n\_2, n\_1n\_2 even, l ∤ n\_1n\_2(n\_1 + n\_2), ρ̄ primitive; (6) a place w\_0 ∤ l with ρ|^{ss}\_{G\_{E\_{w\_0}}} ≅ ⊕\_{i=1}^n ψε^{n−i}, ψ unramified; (7) an ι-ordinary RACSDC Π with r̄\_ι(Π) ≅ ρ̄ whose monodromy at w\_0 has a Jordan block of length > max(n\_1, n\_2); (8) hypothesis (4) of SP.6/ct-steinberg-level-raising. Then ρ ≅ r\_ι(π) for a RACSDC π on GL\_n(𝔸\_E).


*Hypotheses and conventions.*

- As in SP.6/ct-steinberg-level-raising.
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- SP.6/ct-steinberg-level-raising gives Π\_1 Steinberg at w\_1 | w\_0 over a soluble E\_1.
- Thorne's residually reducible automorphy lifting with a Steinberg place (Thorne 2015 Theorem 7.1; PotentialAutomorphyInfrastructurePartII PL.7) shows ρ|\_{G\_{E\_1}} automorphic; soluble descent returns to E.


*Checks.*

- The unramified direct sum ⊕\_{i=1}^nψε^{n−i} satisfies (6) with N=0. Thus (6) alone does not force Steinberg monodromy; the automorphic long-block witness (7) is essential.


*Source.*

- [ct17] Theorem 5.7, p. 44: Combines level raising to Steinberg with Thorne's residually reducible automorphy lifting to deduce automorphy of ρ from an automorphic lift with a long Jordan block.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/ct-steinberg-level-raising`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-two-constituent-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-6-thorne-steinberg-level-raising"></a>
### SP.6.9 Level raising to an ordinary Steinberg lift by p-adic methods (Thorne 2024 Theorem 6.11)

`ModularityAndLanglandsExtensionsPartII:SP.6/thorne-steinberg-level-raising` · theorem · planet: Thorne's p-adic level raising (Theorem 6.11)

Let F = F⁺F\_0 be CM with F\_0 imaginary quadratic and F/F⁺ everywhere unramified, p and q primes split in F\_0, v\_0 a q-adic place of F⁺ and ṽ\_0 the place of F above v\_0 and a fixed q-adic place u\_0 of F\_0, ι : Q̄\_p ≅ ℂ. Let n = n\_1 + n\_2 and π\_1, π\_2 cuspidal conjugate self-dual on GL\_{n\_1}(𝔸\_F), GL\_{n\_2}(𝔸\_F) with π = π\_1 ⊞ π\_2 regular algebraic and ι-ordinary, such that (1) π is ramified only at places split over F⁺; (2) writing λ\_{i,τ} for the dominant weight of π\_i|·|^{(n\_i−n)/2}, for each embedding τ₀:F₀→ℂ and each pair of dominant weights (μ₁,μ₂), the number of τ:F→ℂ restricting to τ₀ and satisfying (λ\_{1,τ},λ\_{2,τ})=(μ₁,μ₂) is even; (3) at some finite place w ∉ S split over F⁺, r̄\_ι(π)|^{ss}\_{G\_{F\_w}} ≅ ⊕χ̄\_i with unramified residual characters χ̄\_i and χ̄\_i/χ̄\_j ≠ ε̄ for i ≠ j; (4) π\_{1,ṽ\_0} ≅ St\_{n\_1}(ψ\_1), π\_{2,ṽ\_0} ≅ St\_{n\_2}(ψ\_2) with ψ\_1, ψ\_2 unramified and ι^{−1}(ψ\_1ψ\_2^{−1}|·|^{−n/2}) valued in 1 + 𝔪\_{ℤ̄\_p}; (5) π is unramified at the q-adic places not above v\_0. Then there is an ι-ordinary RACSDC Π on GL\_n(𝔸\_F) with r̄\_ι(Π) ≅ r̄\_ι(π) and Π\_{ṽ\_0} an unramified twist of St\_n, unramified at the other q-adic places and ramified only at places split over F⁺.


*Hypotheses and conventions.*

- S is a finite set of places of F⁺ containing S\_p, v₀ and the places below ramification of π, with no other q-adic places. Choose the genericity place w outside S.
- The missing §§3–5 input is concentration of the Hecke-localized derived tensor RΓ\_c(Ω^{n−1},k)⊗^L\_{k[GL\_n(F\_{w₀})^0]}A\_𝔪 in degree n−1 under residual genericity, together with Steinberg detection and the automorphic-forms comparison. It is not a concentration assertion for bare RΓ\_c(Ω^{n−1},k). Gap G3 names its owner boundary.


*Proof route.*

- Suppose not; Thorne's Proposition 6.5 gives a maximal ideal 𝔪 of the Hecke algebra in the support of the p-adic forms S(K^p, k) with the residual eigensystem of π.
- Theorem 5.2 gives concentration of the Hecke-localized derived tensor with the automorphic module, using the residual genericity place. Lifting to O and using Theorem 3.4 shows that a nonzero middle-degree part would detect a Steinberg constituent, contrary to the assumed absence. Hence the whole tensor vanishes, and Corollary 6.3 yields the twisted Hom-space vanishing (6.4) at every weight.
- Choose an anticyclotomic ψ≡1 with the Frobenius value in Lemma 6.10 and twist the first block only: (r\_{π₁|·|^{(n₁−n)/2}}⊗ψ)⊕r\_{π₂|·|^{(n₂−n)/2}}. Propositions 6.7 and 6.9 reduce its local constituents to Steinberg or the specified two-block constituent; either gives nonzero derived Hom in a degree forbidden by (6.4), completing the contradiction.


*Checks.*

- For n\_1 = n\_2 = 1 condition (4) says ψ\_1ψ\_2^{−1}|·|^{−1} ≡ 1 modulo 𝔪 at ṽ\_0, the classical level-raising congruence for GL\_2, in conjugate self-dual form.


*Source.*

- [th24] Theorem 6.11 and its assumptions, pp. 39–40; proof, pp. 40–41; Lemma 6.10, p. 39: States and proves level raising from an ordinary isobaric sum, Steinberg at ṽ\_0 on each block, to an ordinary RACSDC representation Steinberg at ṽ\_0, by the vanishing of a tensor product with the cohomology of the Drinfeld space.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms`, `PotentialAutomorphyInfrastructurePartII:PL.2/big-ordinary-hecke-algebra`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`, `SmoothRepresentationsOfLocalGroups:SR.3`, `ModularityAndLanglandsExtensionsPartII:SP.6/steinberg-deformation-data`.

## Layer SP.7: Seeds: residually CM symmetric powers and one level-one form

**Targets.** The CM newform σ\_0 of weight 5 and level Γ\_1(4) and the properties of its residual symmetric powers (Lemma 7.2); a weight-5 form with automorphic Sym^{n−1}, Steinberg at a prime q ≡ 3 mod 4 (Corollary 7.3, with level raising for GL\_2); Theorem 7.1, residually CM symmetric powers with a Steinberg place (whose statement the parent records in §4.8), with the odd case Proposition 7.4 and its gap E21; Theorem 7.6 = Theorem E, one everywhere unramified form with automorphic Sym^{n−1} (parent §4.9); and Clozel–Thorne III Theorem 6.2, automorphy of Sym^{l+1} for l ∈ {5, 7}.

**Sources.** Newton–Thorne I §7, pp. 82–91; Clozel–Thorne III §6, pp. 44–46.

The CM seed method is conditional on G2 outside powers of two, including its rank-three construction. Independently known low-rank endpoints do not fill that intermediate proof obligation.

*Requires:* `ArithmeticGaloisRepresentations:G7`, `AutomorphicGaloisRepresentations:R19.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`, `ModularityAndLanglandsExtensions:ML.1`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensions:ML.5`, `ModularityAndLanglandsExtensionsPartII:SP.2`, `ModularityAndLanglandsExtensionsPartII:SP.3`, `ModularityAndLanglandsExtensionsPartII:SP.5`, `ModularityAndLanglandsExtensionsPartII:SP.6`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.6`, `PotentialAutomorphyInfrastructurePartII:PL.7`, `SerreWeightAndLevelOptimisation:R20.2`, `mathlib:GaussianInt`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-7-cm-form-sigma0"></a>
### SP.7.1 The CM newform σ\_0 of weight 5 and level Γ\_1(4)

`ModularityAndLanglandsExtensionsPartII:SP.7/cm-form-sigma0` · definition

σ\_0 is the cuspidal automorphic representation of GL\_2(𝔸\_ℚ) attached to the normalised newform f\_0 = q − 4q² + 16q⁴ − 14q⁵ − 64q⁸ + ⋯ of level Γ\_1(4) and weight 5, the automorphic induction from K = ℚ(i) of the unramified Hecke character ψ\_∞ of ∞-type (4, 0) (on ideals, (α) ↦ α^4 for α ∈ ℤ[i], independent of the generator because units have fourth power 1). For p ≡ 1 mod 4, σ\_0 is ι-ordinary, r\_{σ\_0,ι} ≅ Ind\_{G\_K}^{G\_ℚ}ψ for the p-adic avatar ψ, and det r\_{σ\_0,ι} = δ\_{K/ℚ}ε^{−4}.


*Hypotheses and conventions.*

- K = ℚ(i); p ≡ 1 mod 4 for ordinarity.


*Proof route.*

- a\_ℓ(f\_0) = α^4 + ᾱ^4 for a prime ℓ = αᾱ ≡ 1 mod 4, a\_ℓ = 0 for ℓ ≡ 3 mod 4, a\_2 = (1 + i)^4 = −4.
- Automorphic induction of a Hecke character of an imaginary quadratic field (GL2AutomorphicRepresentationsAndTransfer, parent ML.5 automorphic induction register); ordinarity at split p because ψ\_∞ has ∞-type (4, 0).


*API.*

- `SigmaZero.heckeCharacter` (constructor): The Hecke character of ℚ(i) of ∞-type (4, 0): (α) ↦ α^4.
- `SigmaZero.coeff` (characterisation): a\_ℓ(f\_0) = α^4 + ᾱ^4 for ℓ = αᾱ ≡ 1 mod 4; a\_ℓ = 0 for ℓ ≡ 3 mod 4; a\_2 = −4.
- `SigmaZero.galois` (compatibility): r\_{σ\_0,ι} ≅ Ind\_{G\_K}^{G\_ℚ}ψ with det = δ\_{K/ℚ}ε^{−4}.
- `SigmaZero.ordinary` (other): σ\_0 is ι-ordinary for p ≡ 1 mod 4.


*Unit tests.*

- `SigmaZero.a2` (computation): a\_2(f\_0) = (1 + i)^4 = −4.
- `SigmaZero.a5` (computation): a\_5(f\_0) = (2 + i)^4 + (2 − i)^4 = −14.
- `SigmaZero.a3` (computation): a\_3(f\_0) = 0, since 3 is inert in ℚ(i).
- `SigmaZero.not_level_one` (non-example): f\_0 is not of level one: its level is 4 and its nebentypus is the character of ℚ(i)/ℚ.


*Checks.*

- a\_5 = (2 + i)^4 + (2 − i)^4 = −14, matching the q-expansion.


*Uses.*

- Newton–Thorne I, Theorem 7.1 and Lemma 7.2, pp. 83–84: the residual symmetric powers of r\_{σ\_0} are sums of characters ω̄^{n−1}ψ̄^{n−i}(ψ̄^c)^{i−1}
- Newton–Thorne I, Corollary 7.3, p. 84: level raising from σ\_0 at a prime q ≡ 3 mod 4


*Source.*

- [nt21] §7, definition of σ\_0, p. 82–83: Defines σ\_0 as the weight-5 CM newform of level Γ\_1(4) induced from the Hecke character of ℚ(i) of ∞-type (4, 0), with its ordinarity and Galois representation.


*Needs.* `ModularityAndLanglandsExtensions:ML.5/automorphic-induction-register`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/induced-character-client`, `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation`, `mathlib:GaussianInt`.

<a id="sp-7-sigma0-residual-symmetric-powers"></a>
### SP.7.2 Properties of the residual symmetric powers of σ\_0

`ModularityAndLanglandsExtensionsPartII:SP.7/sigma0-residual-symmetric-powers` · theorem

Let n ≥ 3, p ≡ 1 mod 48n!, ω : G\_K → Q̄\_p^× de Rham with ωω^c = ε³, F/K a finite CM extension linearly disjoint from the extension of K(ζ\_p) cut out by r̄\_{σ\_0,ι}|\_{G\_{K(ζ\_p)}}, and χ\_i = ω̄^{n−1}ψ̄^{n−i}(ψ̄^c)^{i−1}, so ρ̄ = ⊕χ\_i ≅ ω̄^{n−1} ⊗ Sym^{n−1}r̄\_{σ\_0,ι}|\_{G\_K}. Then (1) [F(ζ\_p) : F] = p − 1; (2) ψ̄/ψ̄^c|\_{G\_{F(ζ\_p)}} has order > 2n(n − 1) and χ\_i/χ\_j|\_{G\_{F(ζ\_p)}} order > 2n; (3) χ\_iχ\_i^c = ε^{1−n}; (4) ζ\_p ∉ F^{ker ad ρ̄} and F ⊄ F⁺(ζ\_p); (5) ρ̄|\_{G\_F} is primitive.


*Hypotheses and conventions.*

- p ≡ 1 mod 48n!.


*Proof route.*

- For the coefficient field of ψ̄, the extension cut out by ψ̄/ψ̄^c retains degree at least (p−1)/8 after adjoining ζ\_p, as in NTI pp. 83–84. The disjointness hypothesis preserves this bound over F. Since p≡1 mod 48n!, this exceeds 2n(n−1), and division by an exponent i−j gives order greater than 2n for each χ\_i/χ\_j.
- On G\_K the determinant identity is ψψ^c=ε^{-4} exactly. Therefore χ\_iχ\_i^c=(ωω^c)^{n−1}(ψψ^c)^{n−1}=ε^{1−n}. The auxiliary-field avoidance and character-ratio primitivity criterion give the remaining assertions, with primitivity valid over every residue coefficient extension.


*Checks.*

- For n = 3 the congruence asks p ≡ 1 mod 288; p = 577 is the smallest such prime (the parent's check for §4.8).


*Source.*

- [nt21] Lemma 7.2, pp. 83–84: Verifies the cyclotomic degree, the orders of the character ratios, conjugate self-duality, the cyclotomic avoidance and primitivity for the residual symmetric powers of σ\_0.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.7/cm-form-sigma0`, `PotentialAutomorphyInfrastructurePartII:PL.6/character-sums-primitive`, `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`.

<a id="sp-7-weight-five-symmetric-power"></a>
### SP.7.3 A weight-5 form with automorphic symmetric powers (Newton–Thorne I Corollary 7.3)

`ModularityAndLanglandsExtensionsPartII:SP.7/weight-five-symmetric-power` · theorem

For n ≥ 3 there is a cuspidal automorphic representation σ of GL\_2(𝔸\_ℚ) of weight 5, unramified away from 2 and a prime q ≡ 3 mod 4, with σ\_2 ≅ i\_{B\_2}^{GL\_2}χ\_1 ⊗ χ\_2 (χ\_1 unramified, χ\_2 of conductor 4), σ\_q an unramified twist of Steinberg, and Sym^{n−1}r\_{σ,ι} automorphic for every p and ι. GL\_2 level raising is used: Diamond's criterion raises the level of a form at a prime q satisfying the level-raising congruence to an unramified Steinberg twist at q.


*Hypotheses and conventions.*

- Uses SP.7/residually-cm-steinberg (Theorem 7.1) in rank n, whose odd case rests on SP.7/odd-rank-residually-cm (gap E21).
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Choose q ≡ 3 mod 4 and q ≡ −1 mod p; Diamond's level raising (SerreWeightAndLevelOptimisation R20.2) gives σ ≡ σ\_0 mod p, Steinberg at q.
- SP.7/residually-cm-steinberg gives Π over a soluble CM F, residually ω̄^{n−1} ⊗ Sym^{n−1}r̄\_{σ\_0}, Steinberg above q.
- Allen–Newton–Thorne's residually reducible lifting (parent's §4.2; PotentialAutomorphyInfrastructurePartII PL.7) with the hypotheses of SP.7/sigma0-residual-symmetric-powers shows ω^{n−1} ⊗ Sym^{n−1}r\_{σ,ι}|\_{G\_F} automorphic; soluble descent and quadratic descent to ℚ.


*Checks.*

- σ is ι-ordinary at p ≡ 1 mod 4 because it is congruent to the ordinary σ\_0 and of the same weight.


*Source.*

- [nt21] Corollary 7.3 and proof, p. 84: Raises the level of σ\_0 at a prime q ≡ 3 mod 4 and deduces, from Theorem 7.1 and residually reducible automorphy lifting, a weight-5 form with automorphic symmetric powers.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.7/sigma0-residual-symmetric-powers`, `ModularityAndLanglandsExtensionsPartII:SP.7/residually-cm-steinberg`, `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-7-odd-rank-residually-cm"></a>
### SP.7.4 Theorem 7.1 for odd n (Newton–Thorne I Proposition 7.4), with its gap

`ModularityAndLanglandsExtensionsPartII:SP.7/odd-rank-residually-cm` · theorem

The statement of SP.7/residually-cm-steinberg holds for n = 2k + 1 odd. The printed proof is an induction on odd n: Chebotarev primes q\_1 (split in K, > n, of order 6 mod p, with prescribed Frobenius ratios), q\_2 ≡ −1 and q\_3 (of order n − 2) mod p; real quadratic fields M\_1, M\_2, M\_3; a GL\_2 form τ Steinberg at q\_1 and supercuspidal at q\_2 (Diamond–Taylor); the inductive π on GL\_{n−2}; prescribed-type lifts; SP.5/nt-level-raising-to-types; and SP.6/nt-steinberg-level-raising. As printed, the GL\_2 block π\_2 = τ\_0 ⊗ |·|^{(n−2)/2}ιω\_1ω\_0^{n−1} is not conjugate self-dual (it fails by δ\_{K/ℚ}|\_{G\_{F\_0}}), so SP.5/nt-level-raising-to-types does not apply (gap E21 of the extraction). A conjugate self-dual GL\_2 block with residual representation ω̄\_0^{n−1}ω̄\_1 ⊗ Ind ψ̄^{2k} and the required local components must be supplied; until then the odd case is recorded as a gap. The rank-one input is a character. At n=3, E19 repairs the rank-one local type but does not repair the non-conjugate-self-dual GL₂ block; this method is still conditional there.


*Hypotheses and conventions.*

- Induction hypothesis: the statement for n − 2.
- Hodge–Tate weights tracked as in E23; G\_{F\_{−1}} in place of G\_E in the inductive hypothesis (E2).


*Proof route.*

- Construct the auxiliary primes and fields by Chebotarev (Tau Ceti Chebotarev).
- Build τ by Diamond–Taylor's prescribed-type level raising for GL\_2 and the inductive π\_{n−2}.
- Gap (E21): replace π\_2 by a conjugate self-dual block with the same residual representation and local components; the review of the extraction found none.
- With such a block: SP.5/nt-level-raising-to-types (types at T\_1, T\_2, T\_3), then SP.6/nt-steinberg-level-raising (Steinberg above q).


*Checks.*

- At n=3 the rank-one constituent and its order-p local character exist. The second constituent still has the δ\_{K/ℚ} polarization defect, so this is not an independent proof of the full Theorem 7.1 witness in rank three.


*Source.*

- [nt21] Proposition 7.4 and proof, pp. 85–89: Proves the odd case of Theorem 7.1 by induction on n with level raising to types and to Steinberg; the GL\_2 block used is not conjugate self-dual as printed.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/nt-level-raising-to-types`, `ModularityAndLanglandsExtensionsPartII:SP.6/nt-steinberg-level-raising`, `ModularityAndLanglandsExtensionsPartII:SP.7/sigma0-residual-symmetric-powers`, `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`, `PotentialAutomorphyInfrastructurePartII:PL.7/prescribed-type-lifts`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-7-residually-cm-steinberg"></a>
### SP.7.5 Residually CM symmetric powers with a Steinberg place (Newton–Thorne I Theorem 7.1)

`ModularityAndLanglandsExtensionsPartII:SP.7/residually-cm-steinberg` · theorem

Let n ≥ 3, p ≡ 1 mod 48n!, ι : Q̄\_p ≅ ℂ, q ≠ p a prime, X\_0 a finite set of places of K = ℚ(i) prime to 2pq, and ω : G\_K → Q̄\_p^× de Rham with ωω^c = ε³, unramified at X\_0. Then there are an X\_0-split soluble CM extension F/K and a RACSDC ι-ordinary Π on GL\_n(𝔸\_F) with (a) r̄\_{Π,ι} ≅ ω̄^{n−1}|\_{G\_F} ⊗ Sym^{n−1}r̄\_{σ\_0,ι}|\_{G\_F}; (b) HT\_τ(r\_{Π,ι}) = HT\_τ(ω^{n−1}|\_{G\_F} ⊗ Sym^{n−1}r\_{σ\_0,ι}|\_{G\_F}) for all τ; (c) Π\_v an unramified twist of Steinberg at some v | q. This proves the statement the parent records in §4.8, unconditionally within this method for n = 2^r, and for other n conditionally on the gap of SP.7/odd-rank-residually-cm.


*Hypotheses and conventions.*

- The odd case uses SP.7/odd-rank-residually-cm (gap E21).


*Proof route.*

- Odd n: SP.7/odd-rank-residually-cm.
- n = 2^r m with m odd: induction on r with Anastassiades–Thorne's level raising for GL\_{2n} of unitary type (stated in the parent's §4.4), applied to π\_0 = π\_1 ⊞ π\_2 with r̄\_{π\_0} ≅ ω̄^{2n−1} ⊗ Sym^{2n−1}r̄\_{σ\_0}; for n a power of 2 Anastassiades–Thorne alone suffices (Remark 7.5).


*Checks.*

- For n = 4 the route is Anastassiades–Thorne twice from n = 1, with no use of the odd case.


*Source.*

- [nt21] Theorem 7.1, p. 83; proof, p. 89; Remark 7.5, p. 90: States and proves the existence of an ordinary RACSDC representation residually a twisted symmetric power of σ\_0 with a Steinberg place above q, from Proposition 7.4 and Anastassiades–Thorne.
- [at20] Theorem 5.1, p. 19: Raises the level of an isobaric sum of two conjugate self-dual cuspidal representations of GL\_n with Steinberg components to a cuspidal representation of GL\_{2n}.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.7/odd-rank-residually-cm`, `ModularityAndLanglandsExtensionsPartII:SP.7/sigma0-residual-symmetric-powers`, `ModularityAndLanglandsExtensions:ML.3`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

<a id="sp-7-theorem-e"></a>
### SP.7.6 Theorem E: one level-one form with automorphic symmetric powers

`ModularityAndLanglandsExtensionsPartII:SP.7/theorem-e` · theorem · planet: Theorem E: a level-one seed

For each n ≥ 3 there is a cuspidal, everywhere unramified automorphic representation π of GL\_2(𝔸\_ℚ) of weight k ≥ 2 such that Sym^{n−1}r\_{π,ι} is automorphic for every ι. This proves the statement the parent records in §4.9, by this seed method for n a power of 2, and independently for n≤5 by the known low-rank lifts, and for other n conditionally on the gap E21.


*Hypotheses and conventions.*

- Uses SP.7/weight-five-symmetric-power.


*Proof route.*

- Start from σ of SP.7/weight-five-symmetric-power: Steinberg at q ≡ 3 mod 4 and of conductor 4 at 2.
- The first move is nonordinary on the q-adic eigencurve of tame level 4. The Steinberg local representation at q is irreducible because σ has weight 5, and the local-image criterion gives Zariski closure containing SL₂. Move to a point σ′ unramified at q of weight k≡3 mod 4 and apply the noncritical case of eigencurve-propagation. This step does not use the ordinary case.
- At 2 there are no ordinary cuspidal points of tame level one. If the two slopes of σ′ coincided, their common value (k−1)/2 would be odd; the level-4 odd-slope exclusion rules this out. Unequal slopes give n-regularity, and local-image-criteria gives large local image. Apply eigencurve-propagation at 2 to an everywhere unramified point.


*Checks.*

- n = 3, 4, 5: Δ works, since Sym^2, Sym^3, Sym^4 of every non-CM form are automorphic (Gelbart–Jacquet, Kim–Shahidi, Kim).


*Source.*

- [nt21] Theorem 7.6 and proof, pp. 90–91; Introduction, Theorem E, p. 4: Deduces from Corollary 7.3 and Theorem 2.33 (twice) the existence of a level-one form with automorphic Sym^{n−1}.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.7/weight-five-symmetric-power`, `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.3/buzzard-kilford-boundary`, `ModularityAndLanglandsExtensions:ML.3/low-rank-symmetric-powers`.

<a id="sp-7-ct-symmetric-power-l-plus-one"></a>
### SP.7.7 Automorphy of Sym^{l+1} for l ∈ {5, 7} (Clozel–Thorne III Theorem 6.2)

`ModularityAndLanglandsExtensionsPartII:SP.7/ct-symmetric-power-l-plus-one` · theorem · planet: Sym^6 and Sym^8 by level raising (CT Theorem 6.2)

Let l ∈ {5, 7}, F totally real, ι : Q̄\_l ≅ ℂ, and (π, χ) RAESDC on GL\_2(𝔸\_F) with (1) π ι-ordinary of weight zero; (2) ρ̄ = r̄\_ι(π) irreducible with image containing a conjugate of SL\_2(𝔽\_{l^a}) for some a > 1, and (φρ̄ ⊗ ρ̄)|\_{G\_{F(ζ\_l)}} and Sym^{l−3}ρ̄|\_{G\_{F(ζ\_l)}} adequate; (3) a place u\_0 ∤ 2 with π\_{u\_0} an unramified twist of Steinberg, q\_{u\_0} a primitive root mod l and ρ̄ ramified at u\_0. Then Sym^{l+1}ρ is automorphic.


*Hypotheses and conventions.*

- Hypothesis (3) gives u\_0 ∤ l and [F(ζ\_l) : F] = l − 1, so the cyclotomic avoidance needed in SP.6/ct-jordan-block-lifting holds with no extra hypothesis (as recorded in the extraction).


*Proof route.*

- The residual congruence (Sym^{l+1}ρ̄)^{ss} ≅ (φρ̄ ⊗ ρ̄) ⊕ χ̄² Sym^{l−3}ρ̄ (ArithmeticGaloisRepresentations G7, mod-p Clebsch–Gordan).
- Pass to a CM field E\_2 = F\_2E\_1 = F\_2E with prescribed places above u\_0 (E4 of the extraction); build π′\_2 (Clozel–Thorne II Proposition 3.10 with base change for U\_2, Steinberg above u\_0) and an isobaric Π\_1 ⊞ Π\_2 of type (4, l − 2) with the Steinberg-type components of SP.5/ct-level-raising-setup.
- SP.5/ct-level-raising gives a cuspidal congruent Σ with a long Jordan block; SP.6/ct-jordan-block-lifting shows Sym^{l+1}ρ|\_{G\_{E\_2}} automorphic; soluble descent.


*Checks.*

- For l = 5 the conclusion is automorphy of Sym^6, as used for the parent's §4.31 (Clozel–Thorne Theorem 6.1).


*Source.*

- [ct17] Theorem 6.2, p. 45; proof, pp. 45–46: Proves automorphy of Sym^{l+1} for l = 5, 7 under ordinarity, large image, adequacy and a Steinberg place, via level raising on a definite unitary group in l + 2 variables and residually reducible automorphy lifting.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.5/ct-level-raising`, `ModularityAndLanglandsExtensionsPartII:SP.6/ct-jordan-block-lifting`, `ArithmeticGaloisRepresentations:G7/mod-p-clebsch-gordan-decompositions`, `ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `ModularityAndLanglandsExtensions:ML.3/projective-image-sandwich`.

## Layer SP.8: Killing ramification with n-regular refinements

**Targets.** Newton–Thorne I §8: Proposition 8.2, automorphy of Sym^{n−1} for non-CM forms with an n-regular accessible refinement at every ramified prime (with E24); Lemma 8.4, the non-regular locus of a local lifting ring is a principal divisor; and Proposition 8.3, a congruence to a form with n-regular refinements (with E3 and E25, Weston's unobstructedness and the auxiliary prime q\_a), whose statement the parent records in §4.10.

**Sources.** Newton–Thorne I §8, pp. 91–96.

*Requires:* `AutomorphicGaloisRepresentations:R19.3`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `GL2ModularityLifting:R22.3`, `LocalGaloisDeformationRings:L7`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.2`, `ModularityAndLanglandsExtensionsPartII:SP.3`, `ModularityAndLanglandsExtensionsPartII:SP.7`, `PadicFamilies:L2`, `mathlib:Polynomial.discr`.

<a id="sp-8-nonregular-locus-divisor"></a>
### SP.8.1 The non-regular locus of a local lifting ring is a principal divisor

`ModularityAndLanglandsExtensionsPartII:SP.8/nonregular-locus-divisor` · theorem

Let l ≠ p be a prime, R\_l the lifting ring of r̄|\_{G\_{ℚ\_l}} (fixed determinant) for a representation π\_l with non-trivial Jacquet module, formally smooth of relative dimension 3, and φ\_l a Frobenius lift. Let I\_l ⊂ R\_l be the principal ideal generated by the discriminant of the characteristic polynomial of Sym^{n−1}r\_l^{univ}(φ\_l). A Q̄\_p-point f of R\_l has eigenvalues α\_l, β\_l of ρ\_f(φ\_l) with (α\_l/β\_l)^i = 1 for some 1 ≤ i ≤ n − 1 iff f(I\_l) = 0, and dim R\_l/I\_l < dim R\_l.


*Hypotheses and conventions.*

- π\_l has non-trivial Jacquet module (so lifts are reducible on the relevant component); n ≥ 2.


*Proof route.*

- The discriminant of the characteristic polynomial of Sym^{n−1} vanishes iff two of the monomials α^aβ^b (a + b = n − 1) coincide, iff (α/β)^i = 1 for some 1 ≤ i ≤ n − 1.
- The formally smooth fixed-determinant ring is a domain. If π\_l is a Steinberg twist, its Frobenius ratio is l^{±1}, so the original point already has nonzero discriminant. In the principal-series case write its characters χ₁,χ₂ and deform them to χ₁ψ\_T,χ₂ψ\_T^{-1}, where ψ\_T is unramified with Frobenius value 1+T. This preserves determinant and varies their ratio nontrivially, so the discriminant is nonzero in the domain. A nonzero principal ideal has quotient of strictly smaller dimension. No general component-classification assertion is required.


*Checks.*

- For n = 2 the ideal is the discriminant (α − β)² of the Frobenius characteristic polynomial.
- For n = 3 it vanishes iff α = ±β.


*Source.*

- [nt21] Lemma 8.4 and proof, p. 95: Shows the locus of non-n-regular Frobenius eigenvalues in the local lifting ring is cut out by one discriminant and has smaller dimension.


*Needs.* `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.1/local-fixed-determinant`, `LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection`, `mathlib:Polynomial.discr`.

<a id="sp-8-n-regular-congruence"></a>
### SP.8.2 A congruence to a form with n-regular refinements (Newton–Thorne I Proposition 8.3)

`ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-congruence` · theorem

Let π be cuspidal on GL\_2(𝔸\_ℚ) of weight k ≥ 2, non-CM, with π\_l of non-trivial Jacquet module at every prime l. There are p, ι and π′ cuspidal of weight k with (1) p > max(2(n + 1), (n − 1)k); (2) r̄\_{π,ι}(G\_ℚ) ⊇ a conjugate of SL\_2(𝔽\_p); (3) π\_p and π′\_p unramified; (4) r̄\_{π,ι} ≅ r̄\_{π′,ι}; (5) every π′\_l has non-trivial Jacquet module, and every accessible refinement of π′\_l is n-regular where π′\_l is ramified. This proves the statement the parent records in §4.10.


*Hypotheses and conventions.*

- Unobstructedness for almost all p: H⁰(ℚ\_l, ad⁰r̄(1)) = 0 at every ramified l (Weston 2004), so the fixed-determinant lifting rings there are formally smooth; and an auxiliary prime q\_a > p with π\_{q\_a} unramified and formally smooth lifting ring (Diamond–Taylor 1994 Lemma 11).


*Proof route.*

- Choose p large (Fontaine–Laffaille range, large image by Ribet–Momose, unobstructedness) and q\_a.
- Patch (Kisin Proposition 3.2.5; Thorne 2016; Khare–Thorne Corollary 2.7) with g = q\_0 + |T| − 1 variables (correction E3): the patched module H\_∞ has full support of dimension 4|T| + q\_0 over the patched local rings.
- If every congruent form failed n-regularity, H\_∞ would be supported on the quotient by I = ∏\_{l∈T} I\_l with T = S − {p, q\_a} (correction E25), of smaller dimension by SP.8/nonregular-locus-divisor: contradiction.
- q\_a needs its own argument: smoothness at q\_a forces q\_a ≢ 1 mod p and excludes the ratio q\_a^{±1}, so π′\_{q\_a} is unramified; the Jacquet-module condition holds because p ∤ l(l² − 1) (E25).


*Checks.*

- The bound p > (n − 1)k puts every Sym^{n−1} residual lift in the Fontaine–Laffaille range (parent's check for §4.10).


*Source.*

- [nt21] Proposition 8.3 and proof, pp. 92–95: Produces, by Taylor–Wiles–Kisin patching and a dimension count, a congruent form of the same weight with n-regular refinements at all ramified primes.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.8/nonregular-locus-divisor`, `AutomorphicGaloisRepresentations:R19.3/ribet-momose-classical-large-image`, `GL2ModularityLifting:R22.3`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `LocalGaloisDeformationRings:L7`, `ModularityAndLanglandsExtensions:ML.3/accessible-regular-refinement`.

<a id="sp-8-n-regular-ramified-automorphy"></a>
### SP.8.3 Symmetric powers with n-regular refinements at ramified primes (Newton–Thorne I Proposition 8.2)

`ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-ramified-automorphy` · theorem · planet: Killing ramification (NT I Proposition 8.2)

Let π be cuspidal on GL\_2(𝔸\_ℚ) of weight k ≥ 2, not CM, with an n-regular accessible refinement at every prime where it is ramified. Then Sym^{n−1}r\_{π,ι} is automorphic for every ι.


*Hypotheses and conventions.*

- Uses Theorem A in level one (the parent's §4.12, proved from SP.7/theorem-e and SP.3/level-one-propagation) as the base case.
- As a proof via NTI §§7–8 this uses the conditional seed route of G2 outside powers of two and the independent low-rank endpoints. The later SP.13 endpoint is a different proof and does not retroactively repair the CM seed construction.


*Proof route.*

- Induction on the number of primes dividing the conductor; level one is Theorem A.
- At a ramified prime p, move along the tame-level-M p-adic eigencurve, avoiding the Zariski closed set of SP.2/bad-locus-closed, to a classical π′ of level prime to p; SP.2/eigencurve-propagation (ordinary or non-ordinary case) transfers automorphy.
- π′\_l must not be supercuspidal at the remaining ramified primes: the restriction to I\_l is locally constant along the component and supercuspidal types differ from those of representations with non-trivial Jacquet module (correction E24).


*Checks.*

- A semistable elliptic curve over ℚ has Steinberg components at bad primes, with accessible refinement ratio q\_l^{±1}, which is n-regular; so Proposition 8.2 applies directly.


*Source.*

- [nt21] Proposition 8.2 and proof, pp. 91–92: Proves automorphy of Sym^{n−1} for non-CM forms with n-regular refinements at ramified primes by induction on the conductor using Theorem 2.33.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.2/bad-locus-closed`, `ModularityAndLanglandsExtensionsPartII:SP.3/level-one-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.7/theorem-e`, `ModularityAndLanglandsExtensions:ML.3/level-one-symmetric-powers`, `PadicFamilies:L2/coleman-mazur-comparison`.

## Layer SP.9: Automorphy lifting for symmetric powers

**Targets.** Newton–Thorne II §2: the setting (weight-two non-CM π with non-ordinary p-adic restrictions and projective image between PSL\_2(𝔽\_{p^a}) and PGL\_2(𝔽\_{p^a}), p^a > max(5, 2n − 1)) and its reductions; Lemma 2.2, symmetric powers of Barsotti–Tate lifts are semistable in the torsion sense, so Sym^{n−1} defines a morphism P → R from the conjugate self-dual pseudodeformation ring to the rank-two deformation ring; Taylor–Wiles data with α^{n−1}, α^{n−2}β, …, β^{n−1} distinct and the rings P\_Q; definite unitary Hecke modules with twisted Taylor–Wiles level (Lemma 2.4, Proposition 2.5); patching for p > 2 (Proposition 2.6, Lemma 2.7) and for p = 2 (Proposition 2.8, Lemma 2.9); the support argument, in which regularity of P at an automorphic point replaces control of the dual Selmer group of Sym^{n−1}, with the separate dyadic translation argument; and Theorem 2.1 (whose statement the parent records in §4.11). Newton–Thorne 2026 §4 reuses this template.

**Sources.** Newton–Thorne II (arXiv:2009.07180v2) §2, pp. 5–19.

*Requires:* `ArithmeticGaloisDuality:R02.3`, `ArithmeticGaloisRepresentations:G7`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `GL2ModularityLifting:R22.2`, `GL2ModularityLifting:R22.3`, `GL2ModularityLifting:R22.6`, `GlobalGaloisDeformations:G7`, `LocalGaloisDeformationRings:R08.6`, `ModularityAndLanglandsExtensions:ML.0`, `ModularityAndLanglandsExtensions:ML.3`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `PotentialAutomorphyInfrastructurePartII:PL.3`, `PotentialAutomorphyInfrastructurePartII:PL.8`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-9-nt2-setting"></a>
### SP.9.1 The setting of Newton–Thorne II §2

`ModularityAndLanglandsExtensionsPartII:SP.9/nt2-setting` · definition

Fix a prime p, a totally real field F, ι : Q̄\_p ≅ ℂ and n ≥ 1. A pair (π, π′) is in the setting of §2 if π, π′ are regular algebraic cuspidal automorphic representations of GL\_2(𝔸\_F) of weight 2, non-CM, with r\_{π,ι}|\_{G\_{F\_v}} and r\_{π′,ι}|\_{G\_{F\_v}} not ordinary (hence potentially Barsotti–Tate) at every v | p, r̄\_{π,ι} ≅ r̄\_{π′,ι}, π\_v a twist of Steinberg iff π′\_v is for every v ∤ p, and for some a ≥ 1 with p^a > max(5, 2n − 1), PSL\_2(𝔽\_{p^a}) ⊂ Proj r̄\_{π,ι}(G\_F) ⊂ PGL\_2(𝔽\_{p^a}) up to conjugacy. After soluble base change one may assume: (6) [F : ℚ] even; (7) det r\_{π,ι} = det r\_{π′,ι} = ε^{−1}; (8) π, π′ unramified at p; (9) Iwahori-spherical away from p with an even number of ramified places; (10) r̄ trivial on S = S\_p ∪ Σ, with q\_v ≡ 1 mod p and π\_v, π′\_v Steinberg on Σ; (11) an everywhere unramified CM quadratic K/F in which S splits. One then works with Π = π\_K and the pseudodeformation ring P of Sym^{n−1}r̄|\_{G\_K}.


*Hypotheses and conventions.*

- The sandwich hypothesis makes Taylor–Wiles primes with Sym^{n−1}r̄(Frob) regular semisimple available (parent §1.7, projective image sandwich).


*Proof route.*

- Soluble base change and descent (parent ML.5; PotentialAutomorphyInfrastructurePartII PL.0) preserve all hypotheses and the conclusion (Newton–Thorne II reductions (6)–(11)).


*API.*

- `NT2Setting.mk` (constructor): The data (p, F, ι, n, π, π′) with the hypotheses of §2.
- `NT2Setting.sandwich` (projection): The integer a with PSL\_2(𝔽\_{p^a}) ⊂ Proj r̄(G\_F) ⊂ PGL\_2(𝔽\_{p^a}) and p^a > max(5, 2n − 1).
- `NT2Setting.reduce` (other): A soluble totally real E/F after which (6)–(11) hold, with the conclusion descending.
- `NT2Setting.cmField` (data): The everywhere unramified CM quadratic K/F in which S splits, and Π = π\_K.


*Unit tests.*

- `NT2Setting.bound_n2` (computation): For n = 2 the bound is p^a > 5, so 𝔽\_7 qualifies and 𝔽\_5 does not.
- `NT2Setting.bound_n10` (computation): For n = 10 the bound is p^a > 19: 𝔽\_23 or 𝔽\_{25} qualify, 𝔽\_{19} does not.
- `NT2Setting.ordinary_excluded` (non-example): A pair with r\_{π,ι}|\_{G\_{F\_v}} ordinary at some v | p is not in the setting (it is treated by the ordinary theory instead).


*Checks.*

- For n=1, Sym⁰r is the trivial rank-one representation and the functoriality conclusion is tautological. The n=2 instance is the rank-two modularity-lifting problem for weight-two Hilbert forms.


*Uses.*

- Newton–Thorne II, Theorem 2.1, p. 5: the hypotheses of the symmetric-power automorphy lifting theorem
- Newton–Thorne II, Proposition 3.10, p. 25: Lemma 3.5 produces π′ in this setting to remove a supercuspidal prime


*Source.*

- [nt21b] §2, setting and statement of Theorem 2.1, p. 5; reductions (6)–(11), pp. 5–6: Fixes the weight-two non-ordinary non-CM pair with large projective image and lists the reductions by soluble base change.


*Needs.* `ModularityAndLanglandsExtensions:ML.3/projective-image-sandwich`, `ModularityAndLanglandsExtensions:ML.0/nt26-automorphy-predicate`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.1/potentially-barsotti-tate-diagonalizable`.

<a id="sp-9-symmetric-power-tensor-map"></a>
### SP.9.2 Symmetric powers of Barsotti–Tate lifts and the morphism P → R

`ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-tensor-map` · theorem

In the setting SP.9/nt2-setting, let A be an Artinian object of 𝒞\_𝒪, v ∈ S\_p, and r̃ : G\_{F\_v} → GL\_2(A) a lift of r̄ of determinant ε^{−1} through R\_v, the ring of non-ordinary crystalline lifts with Hodge–Tate weights {0, 1} (Barsotti–Tate lifts, after reduction (8)). Then A^n with G\_{F\_v} acting through Sym^{n−1}r̃ is isomorphic to a subquotient of a lattice in a crystalline representation with Hodge–Tate weights in [0, n − 1]. Consequently Sym^{n−1} of the universal deformation restricted to G\_K defines a morphism P → R from the conjugate self-dual pseudodeformation ring with semistable-in-the-torsion-sense conditions at p to the rank-two deformation ring.


*Hypotheses and conventions.*

- Determinant ε^{−1}; R\_v as in Newton–Thorne II §2 (crystalline, Hodge–Tate weights {0, 1}, not ordinary), available after the reductions (6)–(11).


*Proof route.*

- The dual of A² is the generic fibre of a finite flat group scheme; Berthelot–Breen–Messing Théorème 3.1.1 gives a crystalline lattice with weights in [0, 1] of which it is a quotient.
- Symmetric powers of subquotients of crystalline lattices with weights in [0, 1] are subquotients of lattices in crystalline representations with weights in [0, n − 1] (tensor operations).
- The pseudodeformation ring P (PotentialAutomorphyInfrastructurePartII PL.8) is defined by exactly this torsion-semistable condition, so the universal property gives P → R.


*Checks.*

- For n=1, Sym⁰r̃ is trivial, so P→R is the map classifying the constant trivial rank-one pseudocharacter, not the rank-two determinant map.
- For n = 2 the weights of Sym^1 are [0, 1], recovering Barsotti–Tate.


*Source.*

- [nt21b] Lemma 2.2 and proof, p. 7: Shows symmetric powers of Barsotti–Tate Artinian lifts are subquotients of crystalline lattices with weights in [0, n − 1], so Sym^{n−1} induces a map from the pseudodeformation ring to the deformation ring.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.8/semistable-pseudodeformation-ring`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRings:R08.6/torsion-semistable-condition`, `ArithmeticGaloisRepresentations:G7/symmetric-and-exterior-powers`, `ModularityAndLanglandsExtensionsPartII:SP.9/nt2-setting`.

<a id="sp-9-symmetric-taylor-wiles-data"></a>
### SP.9.3 Taylor–Wiles data for symmetric powers and the rings P\_Q

`ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-taylor-wiles-data` · definition

A Taylor–Wiles datum of level N is (Q, Q̃, (α\_v, β\_v)\_{v∈Q}) with Q a finite set of places of F split in K and not in S, q\_v ≡ 1 mod p^N, a chosen factorisation v = ṽṽ^c, and α\_v, β\_v the eigenvalues of r̄(Frob\_v), such that α\_v^{n−1}, α\_v^{n−2}β\_v, …, β\_v^{n−1} are pairwise distinct. With Δ\_Q = ∏\_{v∈Q} k(v)^×(p), the deformation ring R\_Q is an 𝒪[Δ\_Q]-algebra with R\_Q ⊗\_{𝒪[Δ\_Q]} 𝒪 ≅ R. P\_Q is the quotient of the pseudodeformation ring of G\_{K,S∪Q} parametrising pseudodeformations whose restriction to each G\_{K\_ṽ} is the determinant of characters χ\_{v,1} ⊕ ⋯ ⊕ χ\_{v,n} lifting the unramified characters with Frobenius α^{n−i}β^{i−1} (unique by Allen–Newton–Thorne Proposition 2.5), with χ\_{v,i}|\_I = χ\_{v,m}^{n+1−2i}|\_I for n = 2m, or χ\_{v,m}^{(n+1−2i)/2}|\_I for n = 2m + 1; this makes P\_Q an 𝒪[Δ\_Q]-algebra with a map P\_Q → R\_Q (𝒪[Δ\_Q]-linear when n is even).


*Hypotheses and conventions.*

- The distinctness of the n monomials is stronger than the rank-two Taylor–Wiles condition.
- Use n≥2 and N≥1 for this construction. The n=1 functoriality theorem is handled before patching; when n=1, m=0 would make the displayed χ\_{v,m} undefined.


*Proof route.*

- The decomposition into characters uses uniqueness of the decomposition of residually multiplicity-free pseudocharacters (Allen–Newton–Thorne Proposition 2.5; Bellaïche–Chenevier Proposition 1.5.1).
- The inertial relations are those obtained by applying Sym^{n−1} to the rank-two local characters. The resulting P\_Q→R\_Q is O[Δ\_Q]-linear for even n; no such linearity is asserted for odd n.


*API.*

- `SymTWDatum.mk` (constructor): A level-N datum (Q, Q̃, (α\_v, β\_v)) with the distinctness condition.
- `SymTWDatum.Delta` (data): Δ\_Q = ∏\_{v∈Q} k(v)^×(p) and the 𝒪[Δ\_Q]-structures on R\_Q and P\_Q.
- `SymTWDatum.PQ_to_RQ` (other): The map P\_Q → R\_Q induced by Sym^{n−1}, 𝒪[Δ\_Q]-linear for n even.
- `SymTWDatum.coinvariants` (characterisation): R\_Q ⊗\_{𝒪[Δ\_Q]} 𝒪 ≅ R and P\_Q ⊗\_{𝒪[Δ\_Q]} 𝒪 ≅ P.
- `SymTWDatum.tensorAtCharacters` (compatibility): At each auxiliary place, applying Sym^{n−1} to the two ordered rank-two characters gives the ordered monomials used in P\_Q. The map of diamond algebras follows these monomials; odd n has only the specified restricted scalar-linearity.


*Unit tests.*

- `SymTWDatum.n3_condition` (computation): For n = 3 the condition is that α², αβ, β² are distinct, i.e. α ≠ β and α ≠ −β.
- `SymTWDatum.n2` (degenerate): For n=2 the monomials are α,β, the inertial characters satisfy χ\_{v,1}|\_I=χ\_{v,2}^{−1}|\_I, and the determinant on inertia is fixed. This is the ordinary rank-two Taylor–Wiles condition.
- `SymTWDatum.ratio_root_of_unity` (non-example): If α\_v/β\_v is a primitive cube root of unity and n = 4, α³ = β³ fails distinctness, so v is not a Taylor–Wiles place for n = 4.


*Checks.*

- For n = 2 the condition is α\_v ≠ β\_v and P\_Q is the rank-two Taylor–Wiles ring with determinant fixed.


*Uses.*

- Newton–Thorne II, Propositions 2.5–2.6, pp. 11–14: patching of P\_Q-modules of unitary forms over 𝒪[Δ\_Q]
- Newton–Thorne 2026, §4, pp. 29–30: the tensor version replaces the monomials α^{n−i}β^{i−1} by the eigenvalues of r̄ ⊗ s̄


*Source.*

- [nt21b] §2, Taylor–Wiles data and the rings P\_Q, pp. 8–9: Defines Taylor–Wiles data with distinct symmetric-power Frobenius eigenvalues and the quotient P\_Q of the pseudodeformation ring with its Δ\_Q-structure.


*Needs.* `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `PotentialAutomorphyInfrastructurePartII:PL.3/thorne-taylor-wiles-datum`, `PotentialAutomorphyInfrastructurePartII:PL.8/semistable-pseudodeformation-ring`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-tensor-map`.

<a id="sp-9-twisted-unitary-hecke-modules"></a>
### SP.9.4 Definite unitary Hecke modules with twisted Taylor–Wiles level

`ModularityAndLanglandsExtensionsPartII:SP.9/twisted-unitary-hecke-modules` · construction

Let G be the definite unitary group over F split by K (PotentialAutomorphyInfrastructurePartII PL.2) and H\_G(V) the 𝒪-valued functions on G(F)\G(𝔸\_F^∞)/V. With V\_0 Iwahori at Σ, a Taylor–Wiles datum gives V\_0(Q) (Iwahori at Q) and V\_1(Q; N) ⊂ V\_0(Q), cut out at v ∈ Q by requiring ∏\_i a\_ii^{n+1−2i} (n even) or ∏\_i a\_ii^{(n+1−2i)/2} (n odd) to map to 1 in k(ṽ)^×(p)/(p^N), so V\_0(Q)/V\_1(Q; N) ≅ Δ\_Q/(p^N). Hecke operators T\_w^{(i)} and U\_{ϖ\_ṽ}^{(i)}, the maximal ideals m\_G (Hecke eigenvalues of Sym^{n−1}r̄) and m\_{G,Q}, and twisting by characters θ of U\_1 through det. (Lemma 2.4) For n even and p = 2, each quadratic χ of F^×\(𝔸\_F^∞)^×/det U\_1(Q; N) has a unique θ\_χ with θ\_χ(z/z^c) = χ(zz^c). (Proposition 2.5) For a datum of level N+c\_G, where p^{c\_G} kills the p-primary parts of the finitely many base-level stabilizers: m\_G and m\_{G,Q} are in the supports; H\_G(V\_1(Q; N))\_{m\_{G,Q}} is free over 𝒪[Δ\_Q/(p^N)] with coinvariants H\_G(V\_0)\_{m\_G}; and it is a P\_Q-module on which the universal characteristic polynomial coefficients at Frob\_w act by q\_w^{i(i−1)/2}T\_w^{(i)}, compatibly with the Δ\_Q-actions.


*Hypotheses and conventions.*

- Setting of SP.9/nt2-setting after the reductions.
- Assume n≥2, N≥1 and automorphy of Sym^{n−1}r\_{π′,ι}; this extra seed hypothesis supplies the nonzero localized unitary module. It is not part of nt2-setting by itself.


*Proof route.*

- Use a Taylor–Wiles datum at level N+c\_G. Its congruence conditions put the p-primary stabilizer images inside V₁(Q;N), so the deck group Δ\_Q/(p^N) acts freely on the localized finite double quotient. The ordinary exactness/freeness theorem gives a free O[Δ\_Q/(p^N)]-module and trace identifies its coinvariants with H\_G(V₀)\_{m\_G}. The argument does not assume that the original level has trivial stabilizers.
- Support of m\_G: Labesse's base change descends Π\_n = Sym^{n−1} of the automorphic π′\_K to G (Labesse Théorème 5.4; EndoscopicTransferAndUnitaryTraceComparison ET.7a).
- P\_Q-module structure: the Galois pseudocharacter on the Hecke algebra (PL.2) restricted at ṽ ∈ Q decomposes into characters by uniqueness of the decomposition (Allen–Newton–Thorne Proposition 2.5), matching the definition of P\_Q.
- Lemma 2.4: Hilbert 90 for 0 → 𝔾\_m → Res\_{K/F}𝔾\_m → U\_1 → 0.


*API.*

- `TwistedTWLevel.V1` (constructor): The level V\_1(Q; N) with V\_0(Q)/V\_1(Q; N) ≅ Δ\_Q/(p^N).
- `TwistedTWLevel.maxIdeal` (data): The maximal ideals m\_G and m\_{G,Q} of the Hecke algebra.
- `TwistedTWLevel.free` (other): H\_G(V\_1(Q; N))\_{m\_{G,Q}} is free over 𝒪[Δ\_Q/(p^N)] with coinvariants H\_G(V\_0)\_{m\_G}.
- `TwistedTWLevel.PQ_module` (structure): The P\_Q-module structure with Λ\_i^{univ}(Frob\_w) acting as q\_w^{i(i−1)/2}T\_w^{(i)}.
- `TwistedTWLevel.quadraticTwist` (other): For p = 2, n even: θ\_χ with θ\_χ(z/z^c) = χ(zz^c), unique.


*Unit tests.*

- `TwistedTWLevel.exponents_n2` (computation): For n = 2 the character is a\_11 a\_22^{−1}, so V\_1 is the kernel of a\_11/a\_22 ↦ k(ṽ)^×(p)/(p^N).
- `TwistedTWLevel.exponents_n3` (computation): For n = 3 the exponents (n + 1 − 2i)/2 are 1, 0, −1: the character a\_11/a\_33.
- `TwistedTWLevel.needs_level_offset` (non-example): If the congruence level is only N and a p-primary stabilizer has image nontrivial in the deck group, its action on the double quotient has a fixed orbit and group-ring freeness can fail. The offset c\_G is what removes this obstruction.


*Checks.*

- At N=1, tensoring H\_G(V₁(Q;1))\_{m\_{G,Q}} with O along the augmentation of O[Δ\_Q/(p)] gives H\_G(V₀)\_{m\_G}, as a module with its Hecke action.


*Uses.*

- Newton–Thorne II, Proposition 2.6, p. 13: the modules H\_G(V\_1(Q; N))\_{m\_{G,Q}} are patched to H\_{G,∞}
- Newton–Thorne 2026, Proposition 4.6, p. 33: the tensor version with Δ′\_Q


*Source.*

- [nt21b] §2, unitary Hecke modules, pp. 9–11; Lemma 2.4, p. 11; Proposition 2.5, p. 11: Defines the twisted Taylor–Wiles levels and Hecke maximal ideals on the definite unitary group, the quadratic twisting characters for p = 2, and proves freeness and the P\_Q-module structure.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms`, `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`, `PotentialAutomorphyInfrastructurePartII:PL.2/hecke-valued-galois-representation`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-taylor-wiles-data`, `PotentialAutomorphyInfrastructurePartII:PL.3/taylor-wiles-level-structures`.

<a id="sp-9-symmetric-patching-odd"></a>
### SP.9.5 Patching for symmetric powers, p > 2

`ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd` · theorem

In the setting SP.9/nt2-setting with p > 2, let q = dim\_k H¹(F\_S/F, ad⁰r̄(1)) and g = q + |S ∪ S\_∞| − 1. (Lemma 2.7) For every N there is a Taylor–Wiles datum of level N with a surjection R^{loc}[[X\_1, …, X\_g]] → R^□\_Q. (Proposition 2.6) There are W\_∞ = 𝒪[[Y\_1, …, Y\_q, Z\_1, …, Z\_{4|S∪S\_∞|−1}]], complete Noetherian local W\_∞-algebras P\_∞, R\_∞ with P\_∞ ⊗ 𝒪 ≅ P and R\_∞ ⊗ 𝒪 ≅ R, a surjection R^{loc}[[X\_1, …, X\_g]] → R\_∞, a P\_∞-module H\_{G,∞} and an R\_∞-module H\_{D,∞}, both finite free over W\_∞, specialising to H\_G = H\_G(V\_0)\_{m\_G} and H\_D (quaternionic forms of level U\_0 localised at m\_D), and a morphism P\_∞ → R\_∞ compatible with P → R.


*Hypotheses and conventions.*

- p > 2.
- For this patching argument assume n≥2 and Sym^{n−1}r\_{π′,ι} automorphic, and use the stabilized levels of twisted-unitary-hecke-modules. Handle n=1 separately by Sym⁰=1.


*Proof route.*

- Lemma 2.7: Chebotarev and H¹(PSL\_2(𝔽\_{p^a}), ad⁰) = 0 (Cline–Parshall–Scott) give Taylor–Wiles primes with Frob\_v regular for Sym^{n−1} ((α/β)^i ≠ 1 for i < n), as in Darmon–Diamond–Taylor Theorem 2.49 and Kisin.
- Patch the modules of SP.9/twisted-unitary-hecke-modules and the quaternionic modules (GL2ModularityLifting R22.2, R22.3) simultaneously over the framed rings, with Newton–Thorne 2020 Lemma 2.16 bounding P\_N.
- The commutative algebra of patching (DeformationAndDerivedPatchingAlgebra R03.6).


*Checks.*

- dim W\_∞ = 1 + q + 4|S ∪ S\_∞| − 1, matching dim R^{loc}[[X\_1, …, X\_g]] when the local rings have the expected dimensions.


*Source.*

- [nt21b] Proposition 2.6, p. 13; Lemma 2.7, p. 14; proof of Proposition 2.6, pp. 14–17: Constructs the patched rings and modules for p > 2 from enough Taylor–Wiles data for symmetric powers.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/twisted-unitary-hecke-modules`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-taylor-wiles-data`, `GL2ModularityLifting:R22.2`, `GL2ModularityLifting:R22.3`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-9-symmetric-patching-dyadic"></a>
### SP.9.6 Patching for symmetric powers, p = 2

`ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic` · theorem

In the setting SP.9/nt2-setting with p = 2, let q = dim\_k H¹(F\_S/F, ad r̄) − 2, g = 2q + 1 and γ = 2 − |S ∪ S\_∞| + q. (Lemma 2.9) q ≥ |S ∪ S\_∞| − 2 and for every N there is a Taylor–Wiles datum of level N with |Q| = q, a surjection R^{loc}[[X\_1, …, X\_g]] → R′^□\_Q, and Θ\_Q/(2^N) ≅ (ℤ/2^N)^γ for Θ\_Q the Galois group of the maximal abelian pro-2 extension of F unramified outside Q and (S ∪ S\_∞)-split. (Proposition 2.8) There are data as in SP.9/symmetric-patching-odd but with surjections R^{loc}[[X\_1, …, X\_g]] → R′\_∞ → R\_∞, a free action of Ĝ\_m^γ on Sp R′\_∞ with an equivariant δ : Sp R′\_∞ → Ĝ\_m^γ (acting on itself by the square), δ^{−1}(1) = Sp R\_∞, the action of Ĝ\_m^γ[2](𝒪) on R\_∞ lifting to H\_{D,∞}, and an action of Ĝ\_m^γ[2] on Sp P\_∞ making Sp R\_∞ → Sp P\_∞ equivariant and lifting to H\_{G,∞}.


*Hypotheses and conventions.*

- p = 2; the twisting characters of SP.9/twisted-unitary-hecke-modules (Lemma 2.4).
- For this patching argument assume n≥2 and Sym^{n−1}r\_{π′,ι} automorphic, and use the stabilized levels of twisted-unitary-hecke-modules. Handle n=1 separately by Sym⁰=1.


*Proof route.*

- Khare–Wintenberger II Lemma 5.10 with the stronger distinctness condition gives Lemma 2.9.
- Patch as in Khare–Wintenberger II §2 and Kisin, recording the action of quadratic twists by characters of Θ\_Q (Ĝ\_m^γ).


*Checks.*

- For γ = 0 there is no twisting action and R′\_∞ = R\_∞.


*Source.*

- [nt21b] Proposition 2.8, p. 17; Lemma 2.9, p. 18; proof, pp. 17–19: Constructs the 2-adic patched rings and modules with the action of Ĝ\_m^γ from twisting, after Khare–Wintenberger.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/twisted-unitary-hecke-modules`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-taylor-wiles-data`, `GL2ModularityLifting:R22.6`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `ArithmeticGaloisDuality:R02.3/exponent-two-ramification-field`.

<a id="sp-9-support-argument"></a>
### SP.9.7 Regularity of P at an automorphic point transfers automorphy

`ModularityAndLanglandsExtensionsPartII:SP.9/support-argument` · theorem · planet: Regularity of P transfers automorphy

Let p\_∞, p′\_∞ be the points of Spec P\_∞ defined by the pseudocharacters t = Sym^{n−1}r|\_{G\_K} and t′ = Sym^{n−1}r′|\_{G\_K}, with t′ automorphic. (p > 2) H\_{G,∞} and H\_{D,∞} are Cohen–Macaulay with all components of their supports of dimension q + 4|S ∪ S\_∞|, so R^{loc}[[X]] → R\_∞ is an isomorphism, R\_∞ is a domain and H\_{D,∞} is faithful; since the localized ring P\_{(p′)} is its residue field E (vanishing of the adjoint Bloch–Kato Selmer group of Π′\_n), P\_∞ is regular of dimension q + 4|S ∪ S\_∞| − 1 at p′\_∞, so a unique component of Spec P\_∞ through p′\_∞ lies in Supp H\_{G,∞}; Spec R\_∞ maps into it, hence p ∈ Supp\_P H\_G. (p = 2) The dimension argument gives R^{loc}[[X]] ≅ R′\_∞ only; Spec R′\_∞ and the invariant ring R\_∞^{inv} are irreducible and Sp R\_∞ → Sp R\_∞^{inv} is a Ĝ\_m^γ[2]-torsor on the represented complete-local functors whose 𝒪-points act transitively on components. Choose a translate r″\_∞ of the automorphic point on a component containing the target point; equivariance and the action on H\_{G,∞} put its image p″\_∞ in the support, regularity transfers from p′\_∞ to p″\_∞, and the unique-component argument puts p\_∞ in the support. No assertion that R\_∞ is a domain is made for p = 2.


*Hypotheses and conventions.*

- Patched data of SP.9/symmetric-patching-odd (p > 2) or SP.9/symmetric-patching-dyadic (p = 2).
- For this patching argument assume n≥2 and Sym^{n−1}r\_{π′,ι} automorphic, and use the stabilized levels of twisted-unitary-hecke-modules. Handle n=1 separately by Sym⁰=1.


*Proof route.*

- Regularity: PotentialAutomorphyInfrastructurePartII PL.8 (the localization of the pseudodeformation ring at the characteristic-zero automorphic prime is its residue field E, from vanishing of adjoint Selmer groups), lifted to P\_∞ by counting dimensions.
- Cohen–Macaulay modules finite free over W\_∞ have full-dimensional support components (Stacks 0BUS; DeformationAndDerivedPatchingAlgebra R03.6).
- Dyadic case: Khare–Wintenberger II Proposition 2.5 (invariant ring) and transitivity of Ĝ\_m^γ[2](𝒪) on components.


*Checks.*

- If P were not regular at p′\_∞ (nonzero adjoint Selmer group), several components of Spec P\_∞ could pass through p′\_∞ and the argument would fail.


*Source.*

- [nt21b] proof of Theorem 2.1 for p > 2, pp. 12–13; for p = 2, pp. 17–19: Transfers automorphy from t′ to t by the regularity of the patched pseudodeformation ring at the automorphic point, with the torsor and translation argument for p = 2.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic`, `PotentialAutomorphyInfrastructurePartII:PL.8/pseudodeformation-ring-regular-at-automorphic-point`, `PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-selmer-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `DeformationAndDerivedPatchingAlgebra:R03.5`.

<a id="sp-9-symmetric-power-automorphy-lifting"></a>
### SP.9.8 Automorphy lifting for symmetric powers (Newton–Thorne II Theorem 2.1)

`ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-automorphy-lifting` · theorem · planet: Automorphy lifting for Sym^{n−1} (NT II 2.1)

In the setting SP.9/nt2-setting, if Sym^{n−1}r\_{π′,ι} is automorphic then Sym^{n−1}r\_{π,ι} is automorphic. This proves the statement the parent records in §4.11 (node ML.3/symmetric-power-automorphy-lifting); it needs no vanishing of the dual Selmer group of the symmetric-power residual representation, allows p = 2 and p ≤ n, and serves as the template for Newton–Thorne 2026 §4.


*Hypotheses and conventions.*

- Setting of SP.9/nt2-setting.


*Proof route.*

- Handle n=1 by Sym⁰=1. For n≥2 assume the stated automorphy of the π′ symmetric power and reduce by soluble base change ((6)–(11)); it supplies the seed in every patching module used below.
- SP.9/support-argument puts p = Sym^{n−1}r|\_{G\_K} in the support of H\_G: a RACSDC Π\_n on GL\_n(𝔸\_K) with r\_{Π\_n,ι} ≅ Sym^{n−1}r|\_{G\_K} (Labesse Corollaire 5.3).
- Descend from K to F (Barnet-Lamb–Gee–Harris–Taylor Lemma 1.5) and then soluble descent.


*Checks.*

- For n=1 the conclusion is the tautological automorphy of the trivial rank-one representation. For n=2 it recovers the rank-two weight-two modularity-lifting instance.


*Source.*

- [nt21b] Theorem 2.1, p. 5; proof, pp. 12–19: States and proves automorphy lifting for symmetric powers of non-ordinary weight-two Hilbert forms with large projective image.
- [nt26] §4, Propositions 4.4, 4.6, 4.8, 4.9, pp. 30–35: Reuses the Newton–Thorne II template with modified Taylor–Wiles level structure for the tensor version.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/support-argument`, `ModularityAndLanglandsExtensionsPartII:SP.9/nt2-setting`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

## Layer SP.10: Seasoned representations and the removal of supercuspidal primes

**Targets.** Newton–Thorne II §3: the semisimple conductor M\_π and the set sc(π) of supercuspidal primes (Definition 3.2) with Lemma 3.3; non-ordinary weight-two congruences with controlled type at p and strong local connection away from p (Lemmas 3.4–3.5); seasoned representations (Definition 3.6) and their large residual images at supercuspidal primes (Proposition 3.7); making a representation seasoned (Proposition 3.9); removing one supercuspidal prime (Proposition 3.10); the weight-two case with 2, 3 ∉ sc(π) (Proposition 3.11); and the reductions completing Theorem 3.1 = Theorem A (whose statement the parent records in §4.29), with the corrections E1 and E3 of the extraction.

**Sources.** Newton–Thorne II §3, pp. 20–27.

*Requires:* `ArithmeticGaloisRepresentations:G7`, `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.4`, `AutomorphicGaloisRepresentations:R19.3`, `ClassicalSerreModularity:R27.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.8`, `ModularityAndLanglandsExtensionsPartII:SP.9`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.2`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `PotentialAutomorphyInfrastructurePartII:PL.5`, `PotentialModularityAndCompatibleSystems:R24.3`, `SerreWeightAndLevelOptimisation:R20.6`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-10-semisimple-conductor"></a>
### SP.10.1 The semisimple conductor and the supercuspidal primes of a modular form

`ModularityAndLanglandsExtensionsPartII:SP.10/semisimple-conductor` · definition

For π regular algebraic cuspidal on GL\_2(𝔸\_ℚ), sc(π) is the set of primes p with π\_p supercuspidal and M\_π = ∏\_l N((rec\_{ℚ\_l}π\_l)^{ss}) is its semisimple conductor (the Artin conductor of the semisimplified Weil–Deligne representation). Lemma 3.3: if p is odd and r̄\_{π,ι} is reducible or dihedral, the prime-to-p part of its conductor divides M\_π.


*Hypotheses and conventions.*

- Normalised local Langlands rec\_{ℚ\_l} (GL2AutomorphicRepresentationsAndTransfer R16.3).


*Proof route.*

- Semisimplification forgets the monodromy, so Steinberg components contribute their unramified part only.
- For odd p, a reducible residual representation, or a dihedral one, has semisimplified image of order prime to p. Thus its local monodromy vanishes after semisimplification. Reduction of the characteristic-zero semisimplified Weil representation bounds its prime-to-p conductor by M\_π (NTII Lemma 3.3); no separate Livné comparison is needed here.


*API.*

- `SemisimpleConductor.sc` (data): sc(π), the primes where π\_p is supercuspidal.
- `SemisimpleConductor.M` (data): M\_π = ∏\_l N((rec π\_l)^{ss}).
- `SemisimpleConductor.dvd_conductor` (relation): M\_π divides the conductor N(π).
- `SemisimpleConductor.residual_dvd` (other): Lemma 3.3: for p odd and r̄ reducible or dihedral, the prime-to-p conductor of r̄ divides M\_π.


*Unit tests.*

- `SemisimpleConductor.steinberg` (computation): For π\_l = St ⊗ χ with χ unramified, N((rec π\_l)^{ss}) = 1 although N(π\_l) = l.
- `SemisimpleConductor.empty_sc` (degenerate): If no π\_l is supercuspidal, sc(π) = ∅ (the case of Newton–Thorne I Theorem B).
- `SemisimpleConductor.supercuspidal` (computation): For a depth-zero supercuspidal π\_l (induced from an unramified quadratic extension with tame character), N((rec π\_l)^{ss}) = l².


*Checks.*

- For a semistable elliptic curve, sc(π) = ∅ and M\_π = 1.


*Uses.*

- Newton–Thorne II, Definition 3.6, p. 23: the lcm M in the definition of seasoned uses the prime-to-q part of M\_π
- Newton–Thorne II, Theorem 3.1, p. 20: induction on |sc(π)|


*Source.*

- [nt21b] Introduction, p. 2; Definition 3.2 and Lemma 3.3, p. 20: Defines the set of supercuspidal primes and the semisimple conductor, and bounds conductors of reducible or dihedral residual representations by it.


*Needs.* `GL2AutomorphicRepresentationsAndTransfer:R16.3/supercuspidal-parameter`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/principal-series-parameter`, `ArithmeticGaloisRepresentations:R01.2`.

<a id="sp-10-nonordinary-weight-two-congruences"></a>
### SP.10.2 Non-ordinary weight-two congruences with controlled type at p

`ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences` · theorem

Let π be regular algebraic cuspidal on GL\_2(𝔸\_ℚ) with Proj r̄\_{π,ι}(G\_ℚ) containing a conjugate of PSL\_2(𝔽\_{p^a}), p^a > 5. (Lemma 3.4) There is π′ with r̄\_{π′,ι} ≅ r̄\_{π,ι}, π′ of weight 2 and not ι-ordinary, rec π′\_p ≅ ω\_1 ⊕ ω\_2 with ω\_i of conductor dividing p³, and for l ≠ p, π\_l Steinberg (resp. supercuspidal) iff π′\_l is. (Lemma 3.5) If moreover p ≥ 3, π′ can be chosen with in addition r\_{π,ι}|\_{G\_{ℚ\_l}} ∼ r\_{π′,ι}|\_{G\_{ℚ\_l}} (strongly connected in the sense of BLGGT) for every l ≠ p; in particular N(π\_l) = N(π′\_l).


*Hypotheses and conventions.*

- p^a > 5; p ≥ 3 for Lemma 3.5.


*Proof route.*

- Lemma 3.4: Breuil–Mézard types at the supercuspidal primes, a quaternion algebra ramified at the Steinberg primes, a neat level, Buzzard–Diamond–Jarvis Corollary 2.12, and a dimension count on the slope-(0, 1) part of cohomology of level U\_0(p³) via Hida theory and Mackey's formula; non-ordinarity by Geraghty Lemma 5.2.
- Lemma 3.5: Gee's lifts of prescribed type (Gee 2011 Corollary 3.1.7; PotentialModularityAndCompatibleSystems R24.3) with strong connection (PotentialAutomorphyInfrastructurePartII PL.1).


*Checks.*

- For π of weight 2 already non-ordinary with the required type at p, π′ = π works.


*Source.*

- [nt21b] Lemma 3.4 and proof, pp. 20–22; Lemma 3.5, pp. 22–23: Produces non-ordinary weight-two congruent forms with controlled type at p and the same Steinberg and supercuspidal primes, and strengthens this to strong local connection away from p.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/semisimple-conductor`, `PotentialModularityAndCompatibleSystems:R24.3`, `PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation`, `PotentialAutomorphyInfrastructurePartII:PL.1/connects-properties`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.2`, `SerreWeightAndLevelOptimisation:R20.6/quaternionic-level-raising`.

<a id="sp-10-seasoned-representation"></a>
### SP.10.3 Seasoned automorphic representations

`ModularityAndLanglandsExtensionsPartII:SP.10/seasoned-representation` · definition

Let π be regular algebraic cuspidal on GL\_2(𝔸\_ℚ) of weight 2 with 2 ∉ sc(π), and q, t, r primes. π is seasoned with respect to (q, t, r) if (1) t | q + 1, t ∉ sc(π), t > max(10, 8n(n − 1)) and (q + 1)/t > 2; (2) rec π\_q ≅ Ind\_{W\_{ℚ\_{q²}}}^{W\_{ℚ\_q}}χ with χ|\_{I\_{ℚ\_q}} of order t (so q ∈ sc(π) and N(π\_q) = q²); (3) r is a primitive root mod q and r ≡ 1 mod M, where M is the lcm of the prime-to-q part of M\_π and ∏\_{p∈sc(π)−{q}} p⁶; (4) π\_r is an unramified twist of Steinberg; (5) for each p ∈ sc(π) and each irreducible dihedral ρ : G\_ℚ → GL\_2(𝔽̄\_p) of prime-to-p conductor dividing Mq², there is a prime s with π\_s an unramified Steinberg twist, ρ(Frob\_s) scalar and s ≢ 1 mod p.


*Hypotheses and conventions.*

- n is the fixed symmetric-power rank; seasoning depends on n through t > 8n(n − 1).
- Fix n≥3 throughout the seasoning argument; ranks n=1,2 are handled separately before this induction.


*Proof route.*

- A variant of Khare–Wintenberger's good-dihedral condition (ClassicalSerreModularity R27.1) with an extra Steinberg prime r that guarantees large residual image at every supercuspidal prime.


*API.*

- `Seasoned.mk` (constructor): The predicate "π is seasoned with respect to (q, t, r)" with conditions (1)–(5).
- `Seasoned.q_mem_sc` (other): If π is seasoned with respect to (q, t, r) then q ∈ sc(π) and N(π\_q) = q².
- `Seasoned.t_bound` (projection): t > max(10, 8n(n − 1)) and t | q + 1 with (q + 1)/t > 2.
- `Seasoned.mono` (other): Removing a supercuspidal prime p ≠ q (Proposition 3.10) preserves seasoning with respect to (q, t, r).


*Unit tests.*

- `Seasoned.t_bound_n3` (computation): For n = 3 the smallest admissible prime t is 53.
- `Seasoned.t_divides` (computation): With t = 53 one needs q ≡ −1 mod 53 and (q + 1)/53 > 2, e.g. q = 211 (q + 1 = 4·53).
- `Seasoned.two_excluded` (non-example): A representation with 2 ∈ sc(π) is never seasoned (Definition 3.6 assumes 2 ∉ sc(π)).


*Checks.*

- For n = 3, t > max(10, 48) = 48, so t ≥ 53.


*Uses.*

- Newton–Thorne II, Proposition 3.7, p. 23: seasoned representations have large residual image at each supercuspidal prime
- Newton–Thorne II, Propositions 3.9–3.11, pp. 24–26: the induction on |sc(π)|


*Source.*

- [nt21b] Definition 3.6, p. 23: Defines representations seasoned with respect to a triple of primes, by a tamely dihedral component at q of order t, a Steinberg prime r and the dihedral-killing primes s.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/semisimple-conductor`, `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`.

<a id="sp-10-seasoned-large-image"></a>
### SP.10.4 Seasoned representations have large residual image at supercuspidal primes

`ModularityAndLanglandsExtensionsPartII:SP.10/seasoned-large-image` · theorem

If π is seasoned with respect to (q, t, r), then for each p ∈ sc(π) there is ι : Q̄\_p ≅ ℂ with PSL\_2(𝔽\_{p^a}) ⊂ Proj r̄\_{π,ι}(G\_ℚ) ⊂ PGL\_2(𝔽\_{p^a}) after conjugation, for p^a>max(5,2n−1), and with linear image containing SL\_2(𝔽\_{p^a}).


*Hypotheses and conventions.*

- π seasoned (SP.10/seasoned-representation).


*Proof route.*

- For p = q: irreducibility from the Steinberg prime r and Gee 2011 Theorem 4.6.1 (niveau-two description); non-dihedrality from condition (5) and Lemma 3.3 (SP.10/semisimple-conductor); a choice of ι gives projective elements of order ≥ t/2 > 4n(n − 1).
- For p ≠ q: inertia at q has projective image of order t.
- The classification of finite subgroups of PGL\_2(𝔽̄\_p) (ArithmeticGaloisRepresentations R01.4) then gives the SL\_2 conclusion.


*Checks.*

- Condition p^a > 2n − 1 is the input SP.9/nt2-setting needs for Theorem 2.1 at p.


*Source.*

- [nt21b] Proposition 3.7 and proof, pp. 23–24: Shows seasoned representations have residual image containing SL\_2(𝔽\_{p^a}) with p^a > 2n − 1 at every supercuspidal prime.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/seasoned-representation`, `ModularityAndLanglandsExtensionsPartII:SP.10/semisimple-conductor`, `ArithmeticGaloisRepresentations:R01.4/large-order-projective-image-criterion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/savitt-residual-types`, `ArithmeticGaloisRepresentations:R01.4/projective-image-and-its-coefficient-field`, `ArithmeticGaloisRepresentations:R01.4/linear-image-over-the-projective-trace-field`.

<a id="sp-10-making-seasoned"></a>
### SP.10.5 Making a representation seasoned

`ModularityAndLanglandsExtensionsPartII:SP.10/making-seasoned` · theorem

Let π be regular algebraic cuspidal on GL\_2(𝔸\_ℚ) of weight 2, non-CM, with 2, 3 ∉ sc(π). There is π′ regular algebraic cuspidal with (1) primes (q, t, r) such that π′ is seasoned with respect to (q, t, r) and sc(π′) = sc(π) ∪ {q}; (2) Sym^{n−1}π′ exists iff Sym^{n−1}π does.


*Hypotheses and conventions.*

- π non-CM, weight 2, 2, 3 ∉ sc(π).
- Fix n≥3 throughout the seasoning argument; ranks n=1,2 are handled separately before this induction.


*Proof route.*

- Choose t > max(10, 8n(n − 1), N(π)), t ≡ 1 mod 4, with large t-adic image; q ≡ −1 mod t with Frob\_q conjugate to complex conjugation; r and the primes s by Chebotarev (with Lemma 3.8, the elementary fibre-product description of Gal(L₁L₂/K) for two finite Galois extensions: pairs of automorphisms with equal restriction to L₁∩L₂).
- Gee's prescribed-type lifts (PotentialModularityAndCompatibleSystems R24.3) produce π′ congruent to π at t with the new local components.
- BLGGT14 Theorem 4.2.1 (PotentialAutomorphyInfrastructurePartII PL.5) shows Sym^{n−1}π′ automorphic iff Sym^{n−1}π is: both are Fontaine–Laffaille at t, and Sym^{n−1} of SL\_2(𝔽\_t) is irreducible for t > n − 1 (ArithmeticGaloisRepresentations G7).


*Checks.*

- The new supercuspidal prime is q; sc grows by exactly one.


*Source.*

- [nt21b] Proposition 3.9 and proof, pp. 24–25: Constructs a seasoned congruent representation adding one supercuspidal prime, preserving the existence of Sym^{n−1}.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/seasoned-representation`, `PotentialModularityAndCompatibleSystems:R24.3`, `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`, `ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="sp-10-remove-supercuspidal-prime"></a>
### SP.10.6 Removing one supercuspidal prime

`ModularityAndLanglandsExtensionsPartII:SP.10/remove-supercuspidal-prime` · theorem

Let π be regular algebraic cuspidal on GL\_2(𝔸\_ℚ) of weight 2, seasoned with respect to (q, t, r), and p ∈ sc(π) with p ≥ 5. There is π′ of weight 2, non-CM, with sc(π′) = sc(π) − {p}, still seasoned with respect to (q, t, r) if p ≠ q, such that if Sym^{n−1}π′ exists then Sym^{n−1}π exists.


*Hypotheses and conventions.*

- π seasoned; p ≥ 5.
- Fix n≥3 throughout the seasoning argument; ranks n=1,2 are handled separately before this induction.


*Proof route.*

- SP.10/seasoned-large-image chooses ι at p with large residual image.
- SP.10/nonordinary-weight-two-congruences (Lemma 3.5) produces π′ non-ordinary at p with principal-series type at p (so p ∉ sc(π′)), strongly connected to π away from p.
- SP.9/symmetric-power-automorphy-lifting (Theorem 2.1) transfers automorphy of Sym^{n−1} from π′ to π.
- When p≠q impose conductor dividing p⁶ at p. This is essential to preserve seasoning: unchanged components at q and r alone do not control the auxiliary integer M.


*Checks.*

- For p≠q, strong connection preserves the local Weil–Deligne data away from p, while N(π′\_p) divides p⁶. Together these preserve the bounds defining M and the dihedral-killing conditions (3) and (5), as well as the types at q and r.


*Source.*

- [nt21b] Proposition 3.10 and proof, pp. 25–26: Removes a supercuspidal prime p ≥ 5 from a seasoned representation by a non-ordinary congruence and Theorem 2.1.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/seasoned-large-image`, `ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-automorphy-lifting`.

<a id="sp-10-weight-two-case"></a>
### SP.10.7 Symmetric powers in weight two when 2, 3 are not supercuspidal primes

`ModularityAndLanglandsExtensionsPartII:SP.10/weight-two-case` · theorem

If π is regular algebraic cuspidal on GL\_2(𝔸\_ℚ) of weight 2, non-CM, with 2, 3 ∉ sc(π), then Sym^{n−1}π exists.


*Hypotheses and conventions.*

- Base case: Newton–Thorne I Theorem B (sc(π) = ∅), the statement the parent records in §4.20.
- Fix n≥3 throughout the seasoning argument; ranks n=1,2 are handled separately before this induction.


*Proof route.*

- Let H\_k assert the result for all eligible π with |sc(π)|≤k, and H′\_k for the seasoned ones with |sc(π)|≤k.
- H\_k⇒H′\_{k+1}: remove any supercuspidal prime by Proposition 3.10, including q if needed. The result has at most k such primes, so H\_k applies; no seasoning condition is needed on that result.
- H′\_k⇒H\_k for k≥1: for |sc(π)|=k, add a new good-dihedral prime q by Proposition 3.9. Remove an old prime p∈sc(π), hence p≠q, by Proposition 3.10. The result is still seasoned and has k supercuspidal primes, so H′\_k applies. Compose the automorphy implications. H\_0 is the separate base case.
- The NTI route to H\_0 uses SP.8/n-regular-ramified-automorphy and SP.8/n-regular-congruence. Its recorded source gap G2 and the supplier boundaries remain part of this proof plan; the endpoint imported in the parent is not an independent proof of that route.


*Checks.*

- k = 0 is Newton–Thorne I Theorem B.


*Source.*

- [nt21b] Proposition 3.11 and proof, pp. 26: Proves existence of Sym^{n−1}π for non-CM weight-two π with 2, 3 not supercuspidal primes, by induction on the number of supercuspidal primes.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/making-seasoned`, `ModularityAndLanglandsExtensionsPartII:SP.10/remove-supercuspidal-prime`, `ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-ramified-automorphy`, `ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-congruence`, `ModularityAndLanglandsExtensions:ML.3/non-supercuspidal-symmetric-powers`.

<a id="sp-10-theorem-a-assembly"></a>
### SP.10.8 The reductions completing symmetric power functoriality for non-CM modular forms (Newton–Thorne II Theorem 3.1)

`ModularityAndLanglandsExtensionsPartII:SP.10/theorem-a-assembly` · theorem · planet: Theorem A for non-CM modular forms

For every non-CM regular algebraic cuspidal π of GL\_2(𝔸\_ℚ) and every n ≥ 1, Sym^{n−1}π exists. This proves the statement the parent records in §4.29 (Newton–Thorne II Theorem A). The proof reduces to SP.10/weight-two-case: for π of weight 2 with 2 ∉ sc(π) and 3 ∈ sc(π), choose t > max(5, 4n(n − 1), N(π)), t ≡ 1 mod 4, with large t-adic projective image, and q ≡ −1 mod t, q ≡ 1 mod 8 and mod every prime l < t, Frob\_q conjugate to complex conjugation; a good-dihedral π′ at q with Sym^{n−1}π′ existing iff Sym^{n−1}π does; the 3-adic projective image of r̄\_{π′,ι} (not of r̄\_{π,ι}, correction E1) is PSL\_2 or PGL\_2 of 𝔽\_{3^a} with 3^a > 2n − 1; Lemma 3.4 gives a weight-2 π″ with 2, 3 ∉ sc(π″), non-ordinary at 3; then SP.10/weight-two-case and SP.9/symmetric-power-automorphy-lifting conclude. If 2 ∈ sc(π), run the same argument with 2 and 3 exchanged and conclude by the case just treated, not by Proposition 3.11, since π″ may have 3 ∈ sc(π″) (correction E3). Weight k > 2 reduces to weight 2 by a t-adic congruence with a potentially crystalline weight-2 form and BLGGT14 Theorem 4.2.1.


*Hypotheses and conventions.*

- π non-CM; CM and weight-one forms are the parent's §4.13.
- This NTII proof plan inherits the conditional NTI base case G2 and the source/supplier boundaries recorded below. Its endpoint statement is not asserted to have been formalised or reproved here.


*Proof route.*

- As in the statement; the large-image choice of t uses Ribet–Momose (AutomorphicGaloisRepresentations R19.3), the good-dihedral prime Khare–Wintenberger I Lemma 6.3 (ClassicalSerreModularity R27.1), Gee's prescribed-type lifts and BLGGT14 Theorem 4.2.1 with potential diagonalisability (Gee–Kisin).


*Checks.*

- For a non-CM elliptic curve over ℚ with additive potentially good reduction at 3, the reduction passes through the 3-adic step.


*Source.*

- [nt21b] Theorem 3.1, p. 20; proof, pp. 26–27: Completes symmetric power functoriality for all non-CM modular forms by reducing to weight two with 2, 3 not supercuspidal primes.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.10/weight-two-case`, `ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-automorphy-lifting`, `AutomorphicGaloisRepresentations:R19.3/ribet-momose-classical-large-image`, `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`, `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.1/potentially-barsotti-tate-diagonalizable`, `PotentialModularityAndCompatibleSystems:R24.3`.

## Layer SP.11: The untwisted tensor product of Newton–Thorne 2026

**Targets.** Newton–Thorne 2026 §3: the standing hypotheses and the auxiliary data v\_a, M, X\_0, K\_0, u\_0 with Lemmas 3.3–3.4; the ordinary companion σ of weights {0, 2} (Lemma 3.1); the polarized representation s = (r\_π ⊗ Sym^{r−1}r\_σ)|\_{G\_{K\_1}} ⊗ y^{1−r} with its residual decomposition (Lemma 3.5) and its type (with E22); the deformation problems 𝒮\_{F\_1}, 𝒮′\_{F\_1}, 𝒮′\_{F\_2}, 𝒮\_{F\_3} and the technical Lemma 3.7; two inertial types with the same reduced special fibre and the comparison of deformation rings (Lemmas 3.6, 3.8); finiteness and a Steinberg automorphic lift by Thorne's level raising (Proposition 3.9); generic primes on every component (Propositions 3.10–3.11, the set 𝒫); scalar local restriction and the generic R = T theorem (Propositions 3.12–3.13); every component is automorphic (Proposition 3.14); and Theorem 3.2, automorphy of r\_π ⊗ Sym^{r−1}r\_σ.

**Sources.** Newton–Thorne 2026 (arXiv:2212.03595v2) §3, pp. 13–25.

Fixed type includes monodromy. Assume SP\_{r−1},SP\_{r+1} already when constructing π₁,π₂. The finiteness proof has two calls to the auxiliary-place variant, with its inherited G7 boundary; the final passage from a generic prime to the characteristic-zero point uses Proposition 3.13 a second time.

*Requires:* `ArithmeticGaloisDuality:R02.3`, `ArithmeticGaloisRepresentations:G7`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GlobalGaloisDeformations:G7`, `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.1`, `ModularityAndLanglandsExtensions:ML.2`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.6`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.2`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `PotentialAutomorphyInfrastructurePartII:PL.4`, `PotentialAutomorphyInfrastructurePartII:PL.6`, `PotentialAutomorphyInfrastructurePartII:PL.7`, `PotentialModularityAndCompatibleSystems:R24.2`, `SerreWeightAndLevelOptimisation:R20.2`.

<a id="sp-11-tensor-section-3-hypotheses"></a>
### SP.11.1 The standing hypotheses and auxiliary data of Newton–Thorne 2026 §3

`ModularityAndLanglandsExtensionsPartII:SP.11/tensor-section-3-hypotheses` · definition

Let F be totally real, p ≥ 5, 1 < r < p, n = 2r, ι : Q̄\_p ≅ ℂ, and π regular algebraic cuspidal on GL\_2(𝔸\_F) with (1) det r\_{π,ι} = ε^{−1}; (2) weight 0 and π\_v an unramified twist of Steinberg at each v | p; (3) a place v\_0 with q\_{v\_0} ≡ −1 mod p where π\_{v\_0} is tamely dihedral of order p; (4) r̄\_{π,ι}(G\_F) containing a conjugate of SL\_2(𝔽\_{p^a}) with a > a\_0(p) (the adequacy threshold of ArithmeticGaloisRepresentations G7, Newton–Thorne 2026 Lemma 2.3 = Thorne 2024 Lemma 7.3); (5) π\_v potentially unramified at every v ∤ p. After conjugation the projective image is PSL\_2(𝔽\_{p^a}) or PGL\_2(𝔽\_{p^a}) with a > 3. Auxiliary data: a place v\_a ∤ p where π is unramified and the eigenvalue ratio of r̄(Frob\_{v\_a}) satisfies (α/β)^i ≢ q\_{v\_a}^{±1} mod p for i = 0, …, r, so H²(F\_{v\_a}, ad(r̄ ⊗ Sym^{r−1}r̄)^{ss}) = 0 (Lemma 3.3); M the extension of F(ζ\_p) cut out by r̄; X\_0 ∋ v\_a a finite set of prime-to-p places such that every Galois subextension M/M′/F of degree > 1 has a non-split place in X\_0 (so X\_0-split extensions are linearly disjoint from M); K\_0 imaginary quadratic with p and the residue characteristics of X\_0 ∪ {v\_0} split, u\_0 | p; and soluble totally real F\_2/F\_1/F as in Lemma 3.4 (X\_0-split, K\_1 = K\_0F\_1 unramified over F\_1, [F\_1 : F] even, trivial residual representation and [F\_{1,v}:ℚ\_p]>n(n+1)/2+1 at every v|p, BC(π) unramified away from pv\_0 over F\_1, v\_0 split in F\_1/F and, over F\_2, the places above v\_0 with q≡1 mod p^N for an N with p^N>n and trivial residual representation, p-adic places of F\_1 split in F\_2, d\_{0,F\_2} > 1, and characters X, Y of K\_1 of type A\_0 with xx^c = ε, yy^c = ω, x̄ = ȳ and Hodge–Tate weight 0 at u\_0).


*Hypotheses and conventions.*

- r > 1 (Theorem 3.2 is trivial for r = 1).
- The last odd abelian extension F\_2/F\_1 has degree d>1 and is chosen so d\_{0,F\_2}>1. The characters X,Y are everywhere unramified. The antiunit rank estimate used to arrange this is the explicit inherited boundary of ArithmeticGaloisDuality R02.3, not an established library fact.


*Proof route.*

- Lemma 3.3 by Chebotarev in the image of r̄ (which contains SL\_2(𝔽\_{p^a})).
- Lemma 3.4 by successive soluble base changes with prescribed local behaviour (Moret–Bailly-type arguments; PotentialAutomorphyInfrastructurePartII PL.0, auxiliary CM extensions and characters) and class field theory for d\_{0,F\_2} (the source prints 'of K\_1' in (2) and an undefined K in (5), corrections E18–E19).


*API.*

- `TensorS3.mk` (constructor): The data (F, p, r, ι, π) with conditions (1)–(5).
- `TensorS3.auxPlace` (data): The place v\_a with H²(F\_{v\_a}, ad(r̄ ⊗ Sym^{r−1}r̄)^{ss}) = 0.
- `TensorS3.X0` (data): The set X\_0 and the notion of X\_0-split extension, linearly disjoint from M.
- `TensorS3.fields` (data): The fields K\_0, F\_1, F\_2, K\_1 = K\_0F\_1, K\_2 = K\_0F\_2 and the characters X, Y.


*Unit tests.*

- `TensorS3.r_one` (degenerate): For r = 1, r\_π ⊗ Sym^0 r\_σ = r\_π is automorphic and §3 is not needed.
- `TensorS3.dihedral_order` (computation): q\_{v\_0} ≡ −1 mod p, so p | q\_{v\_0} + 1 and the tamely dihedral type of order p exists at v\_0 (e.g. q\_{v\_0} = 19 for p = 5).
- `TensorS3.vA_condition` (non-example): A place with α/β ≡ q\_{v}^{±1} mod p is not allowed as v\_a: then H² of the adjoint can be nonzero and ramified deformations exist.


*Checks.*

- For p=5 and this r>1 construction, r∈{2,3,4}; a>a₀(5)≥3 gives a≥4. The r=1 endpoint is treated directly before introducing this data.


*Uses.*

- Newton–Thorne 2026, Theorem 3.2, p. 13: the hypotheses of the untwisted tensor theorem
- Newton–Thorne 2026, Lemma 5.6, p. 40: Theorem 5.5 applies §3 to produce σ with automorphic tensor


*Source.*

- [nt26] §3, standing hypotheses, pp. 13–14; Lemma 3.3, p. 15; auxiliary data, p. 16; Lemma 3.4, p. 16: Fixes the hypotheses of §3, the auxiliary place v\_a, the sets X\_0, the field K\_0 and the soluble extensions F\_2/F\_1/F with their local properties.


*Needs.* `ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`, `ArithmeticGaloisDuality:R02.3/antiunit-class-field-rank`, `ModularityAndLanglandsExtensions:ML.2/moret-bailly-galois-control`.

<a id="sp-11-ordinary-companion"></a>
### SP.11.2 A congruent ordinary companion of weights {0, 2}

`ModularityAndLanglandsExtensionsPartII:SP.11/ordinary-companion` · construction

Under SP.11/tensor-section-3-hypotheses there is a single RAESDC σ on GL\_2(𝔸\_F) which is ι-ordinary, has HT\_τ(r\_{σ,ι}) = {0, 2} for every τ, determinant ε^{−2}ω\_p (ω\_p the Teichmüller lift of ε mod p), residual representation r̄\_{σ,ι} ≅ r̄\_{π,ι}, an unramified Steinberg twist at v\_0, and r\_{σ,ι}|\_{G\_{F\_v}} ∼ r\_{π,ι}|\_{G\_{F\_v}} (the BLGGT relation) at every finite v ∤ p, v ≠ v\_0. All properties hold for the same σ.


*Hypotheses and conventions.*

- Hypotheses of SP.11/tensor-section-3-hypotheses.


*Proof route.*

- Local lifts at p: put π in a Hida family of Hilbert modular forms (Wiles 1988; OrdinaryAutomorphicFormsAndModularityLifting R21.2) and specialise to weight {0, 2} with determinant ε^{−2}ω.
- Global deformation ring with prescribed components (Bellovin–Gee 2019 §4.2; PotentialAutomorphyInfrastructurePartII PL.7, global lifts): at v∤pv₀ the component through r\_{π,ι}|\_{G\_{F\_v}}⊗χ\_v, where χ\_v is unramified, χ\_v≡1 mod ϖ and χ\_v²=ε^{−1}ω\_p (a regular point with the required new determinant), at v | p the ordinary potentially crystalline component through the local lift, at v\_0 a unipotent component with N generically nonzero, which exists because the tamely dihedral type of order p reduces to an unramified induced representation with Frobenius ratio −1 ≡ q\_{v\_0} mod p, so r̄|\_{G\_{F\_{v\_0}}} is reducible and unipotently ramified; Bellovin–Gee Proposition 4.2.6 gives Krull dimension ≥ 1.
- Khare–Wintenberger method: finiteness over 𝒪 (Thorne 2012 Theorem 10.2; PL.4, finiteness) gives a characteristic-zero point ρ, and automorphy lifting after soluble base change (Thorne 2012 Theorem 9.1; PL.4) gives ρ = r\_{σ,ι}.


*API.*

- `OrdinaryCompanion.exists` (constructor): σ with properties (1)–(5).
- `OrdinaryCompanion.HT` (projection): HT\_τ(r\_{σ,ι}) = {0, 2} for all τ.
- `OrdinaryCompanion.residual` (characterisation): r̄\_{σ,ι} ≅ r̄\_{π,ι}.
- `OrdinaryCompanion.det` (simp): det r\_{σ,ι} = ε^{−2}ω\_p.
- `OrdinaryCompanion.steinberg_v0` (other): σ\_{v\_0} is an unramified twist of Steinberg.
- `OrdinaryCompanion.localConnection` (other): At v∤pv₀ the companion is strongly connected to the determinant-corrected local lift of π in the prescribed component; in particular their Weil–Deligne inertia and monodromy agree.


*Unit tests.*

- `OrdinaryCompanion.tensor_weights_r2` (computation): For r = 2, HT(r\_π ⊗ r\_σ) = {0, 1} + {0, 2} = {0, 1, 2, 3}, distinct.
- `OrdinaryCompanion.det_reduction` (computation): The reduction of ε^{−2}ω\_p is ε̄^{−2}ε̄ = ε̄^{−1} = det r̄\_{π,ι}, consistent with the residual isomorphism.
- `OrdinaryCompanion.weight_zero_fails` (non-example): Taking σ = π (weights {0, 1}) makes r\_π ⊗ Sym^{r−1}r\_π irregular for r ≥ 2 (weights repeat), so the different weight is essential.


*Checks.*

- Sym^r σ has Hodge–Tate weights {0, 2, …, 2r}, distinct, which makes r\_π ⊗ Sym^{r−1}r\_σ regular (weights {0, 1} + {0, 2, …, 2r − 2}).


*Uses.*

- Newton–Thorne 2026, Theorem 3.2, p. 13: the second factor of the untwisted tensor
- Newton–Thorne 2026, Lemma 5.6 and §5.2, pp. 40–43: the different-weight companion whose regularity is essential in Theorem 5.5


*Source.*

- [nt26] Lemma 3.1 and proof, pp. 13–14: Constructs an ordinary RAESDC σ of weights {0, 2} congruent to π, Steinberg at v\_0 and connected to π at the other places away from p.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/tensor-section-3-hypotheses`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/hilbert-ordinary-weight-change`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`, `PotentialModularityAndCompatibleSystems:R24.2/newton-thorne-khare-wintenberger-extraction`, `PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation`, `PotentialAutomorphyInfrastructurePartII:PL.7/global-lifts-schur`, `PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-finiteness`, `PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-automorphy-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.4/characteristic-zero-lifts`.

<a id="sp-11-polarized-tensor-s"></a>
### SP.11.3 The polarized representation s and its residual decomposition

`ModularityAndLanglandsExtensionsPartII:SP.11/polarized-tensor-s` · construction

With σ from SP.11/ordinary-companion, put π\_1 = BC(Sym^r σ) ⊗ XY^{−r}|·|^{(r−1)/2} and π\_2 = BC(Sym^{r−2}σ) ⊗ X^{−1}Y^{2−r}|·|^{(r−1)/2} over K\_1, and s = (r\_{π,ι} ⊗ Sym^{r−1}r\_{σ,ι})|\_{G\_{K\_1}} ⊗ y^{1−r}. Then (Lemma 3.5) s^c ≅ s^∨ ⊗ ε^{1−2r}; π\_1, π\_2 are cuspidal conjugate self-dual; π\_1 ⊞ π\_2 is regular algebraic and ι-ordinary; and r̄\_{π\_1⊞π\_2,ι} ≅ s̄. After conjugation s takes values in GL\_n(𝒪) and extends to s : G\_{F\_1} → 𝒢\_n(𝒪) with multiplier ε^{1−n}δ^n\_{K\_1/F\_1}. With S\_{p,F\_1} the p-adic places, T\_{F\_1} (resp. T′\_{F\_1}) the places above v\_0 (resp. v\_a), S\_{F\_1} = S\_{p,F\_1} ∪ T\_{F\_1} and S̃\_{F\_1} a choice of places of K\_1 above them, s is a lift of s̄ of type 𝒮\_{F\_1}: ordinary at p, of inertial type τ\_s at T\_{F\_1}, unramified outside S\_{F\_1} (this needs BC(σ) unramified away from pv\_0, which follows from SP.11/ordinary-companion since ∼ preserves (r|\_I, N); E22 of the extraction).


*Hypotheses and conventions.*

- Lemma 3.4's characters X, Y; residual Clebsch–Gordan for r̄ ⊗ Sym^{r−1}r̄ ≅ Sym^r r̄ ⊕ (det r̄ ⊗ Sym^{r−2}r̄) when r < p.
- Assume SP\_{r−1} and SP\_{r+1} to define the automorphic π₂ and π₁. These are genuine induction hypotheses already at this construction, not only at the later finiteness step. Here r>1; the tensor for r=1 is simply r\_π and uses no SP₀.


*Proof route.*

- Conjugate self-duality from det r\_π = ε^{−1}, det r\_σ = ε^{−2}ω\_p and yy^c = ω.
- The residual decomposition is the mod-p Clebsch–Gordan formula (ArithmeticGaloisRepresentations G7) after twisting.
- Cuspidality of π\_1, π\_2 from large image of Sym^r r̄ and Sym^{r−2}r̄; regularity from the weights {0, 2}; ordinarity from that of σ.
- The multiplier of tensor products (BLGGT14 §1.1).


*API.*

- `TensorS.rep` (constructor): s = (r\_π ⊗ Sym^{r−1}r\_σ)|\_{G\_{K\_1}} ⊗ y^{1−r} with its 𝒢\_n-extension.
- `TensorS.polarization` (other): s^c ≅ s^∨ ⊗ ε^{1−2r}; multiplier ε^{1−n}δ^n.
- `TensorS.residual_decomp` (characterisation): s̄ ≅ r̄\_{π\_1⊞π\_2,ι}, sum of constituents of dimensions r + 1 and r − 1.
- `TensorS.type` (other): s is a lift of s̄ of type 𝒮\_{F\_1}.


*Unit tests.*

- `TensorS.dims` (computation): dim s = 2r = (r + 1) + (r − 1).
- `TensorS.r2_constituents` (computation): For r = 2 the constituents have dimensions 3 and 1.
- `TensorS.not_residually_irreducible` (non-example): s̄ is reducible although s is irreducible (Lemma 2.2 of the source): the residual decomposition is what the residually reducible theory exploits.


*Checks.*

- For r = 2: s̄ ≅ (Sym² r̄ ⊕ det r̄) twisted, of dimensions 3 + 1.


*Uses.*

- Newton–Thorne 2026, Propositions 3.9–3.14, pp. 20–24: s̄ is the residual representation of every deformation problem of §3
- Newton–Thorne 2026, final step of Theorem 3.2, p. 25: s defines a point f : R\_{𝒮\_{F\_1}} → 𝒪


*Source.*

- [nt26] Lemma 3.5, p. 17; the polarized s and the sets of §3, p. 17; final step of the proof of Theorem 3.2, p. 25: Defines s, the auxiliary isobaric sum π\_1 ⊞ π\_2 with the same residual representation, the polarization and the sets of places, and uses that s is of type 𝒮\_{F\_1}.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/ordinary-companion`, `ModularityAndLanglandsExtensionsPartII:SP.11/tensor-section-3-hypotheses`, `ArithmeticGaloisRepresentations:G7/mod-p-clebsch-gordan-decompositions`, `ModularityAndLanglandsExtensions:ML.3/sp-statement`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`, `PotentialAutomorphyInfrastructurePartII:PL.0/isobaric-sum-iota-ordinary`.

<a id="sp-11-tensor-deformation-problems"></a>
### SP.11.4 The deformation problems 𝒮\_{F\_1}, 𝒮′\_{F\_1}, 𝒮′\_{F\_2}, 𝒮\_{F\_3}

`ModularityAndLanglandsExtensionsPartII:SP.11/tensor-deformation-problems` · construction

For F′ ∈ {F\_1, F\_2, F\_3} with K′ = K\_0F′, the polarized deformation problem 𝒮 = (K′/F′, S\_{F′}, S̃\_{F′}, Λ\_{F′}, s̄|\_{G\_{F′}}, ε^{1−n}δ^n\_{K′/F′}, {R^Δ\_v}\_{v∈S\_{p,F′}} ∪ {R^?\_v}\_{v∈T\_{F′}}) in the sense of Thorne 2015, with S\_{F′} = S\_{p,F′} ∪ T\_{F′} (the places above v\_a are not in S), Λ\_{F′} = ⊗̂\_{v∈S\_{p,F′}} 𝒪[[I^{ab}\_{K′\_ṽ}(p)^n]] of dimension n[F′ : ℚ] + 1, R^Δ\_v the ordinary condition at p, and at T\_{F′}: the fixed Weil–Deligne type τ\_s of s, including its monodromy partition (𝒮\_{F\_1}), the type of Sp\_n including its regular-nilpotent monodromy (𝒮′\_{F\_1}), the Steinberg ring R^{St}\_v (𝒮′\_{F\_2}) or the unipotently ramified ring R^1\_v (𝒮\_{F\_3}). Lemma 3.7: for X\_0-split totally real F′ ⊇ F\_1, K′ ⊄ F′(ζ\_p); s̄|\_{G\_{K′}} ≅ ρ̄\_1 ⊕ ρ̄\_2 with ρ̄\_i^c ≅ ρ̄\_i^∨ε^{1−n}, of dimensions r + 1 and r − 1, non-isomorphic over K′(ζ\_p); s̄|\_{G\_{K′}} is primitive; and s̄(G\_{K′}) has no quotient of order p.


*Hypotheses and conventions.*

- F′ ⊇ F\_1 (s̄ is defined on G\_{K\_1}; correction E19).


*Proof route.*

- Thorne 2015 §3 deformation problems for 𝒢\_n with Λ-structure (PotentialAutomorphyInfrastructurePartII PL.2, ordinary deformation datum; GlobalGaloisDeformations G7).
- Local rings: Shotton's fixed-type rings and the Steinberg and unipotent rings (LocalGaloisDeformationRings R08.2, L7).
- Lemma 3.7 from X\_0-splitness (linear disjointness from M), large image and the dimensions r ± 1 being distinct.


*API.*

- `TensorDefProblem.S_F1` (constructor): 𝒮\_{F\_1}: inertial type τ\_s at T\_{F\_1}.
- `TensorDefProblem.S′_F1` (constructor): 𝒮′\_{F\_1}: the special type at T\_{F\_1}.
- `TensorDefProblem.S′_F2` (constructor): 𝒮′\_{F\_2}: Steinberg rings at T\_{F\_2}.
- `TensorDefProblem.S_F3` (constructor): 𝒮\_{F\_3}: unipotently ramified rings at T\_{F\_3}.
- `TensorDefProblem.restriction` (functoriality): Restriction maps R\_{𝒮\_{F\_3}} → R\_{𝒮′\_{F\_2}} and R\_{𝒮\_{F\_3}} → R\_{𝒮\_{F\_1}} of Λ\_{F\_3}-algebras.
- `TensorDefProblem.points` (universal-property): Maps from each universal ring classify lifts of the fixed polarized residual extension over the named base field with ordinary characters and the precise local quotient, including monodromy. Pullback along a restriction map agrees with Galois restriction.


*Unit tests.*

- `TensorDefProblem.lambda_dim` (computation): dim Λ\_{F′} = n[F′ : ℚ] + 1.
- `TensorDefProblem.va_not_in_S` (non-example): The places above v\_a are not in S\_{F′}: lifts are unramified there automatically (Lemma 3.3), so no local condition is imposed.
- `TensorDefProblem.constituent_dims` (computation): For r = 3, s̄|\_{G\_{K′}} = ρ̄\_1 ⊕ ρ̄\_2 with dim ρ̄\_1 = 4, dim ρ̄\_2 = 2.


*Checks.*

- dim Λ\_{F′} = n[F′ : ℚ] + 1; e.g. n = 4, [F′ : ℚ] = 2 gives 9.


*Uses.*

- Newton–Thorne 2026, Lemma 3.8 and Propositions 3.9–3.14, pp. 20–24: the comparison of the four universal rings


*Source.*

- [nt26] §3 after Lemma 3.7, deformation problems, pp. 19–20; Lemma 3.7, p. 19: Defines the four deformation problems with ordinary conditions at p and fixed-type, special, Steinberg or unipotent conditions above v\_0, and verifies the technical conditions after X\_0-split base change.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/polarized-tensor-s`, `PotentialAutomorphyInfrastructurePartII:PL.2/ordinary-deformation-datum`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`, `LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n`, `LocalGaloisDeformationRings:R08.2/steinberg-ring-domain`, `PotentialAutomorphyInfrastructurePartII:PL.6/primitive-representation`, `LocalGaloisDeformationRings:R08.2/inertial-type-with-monodromy`.

<a id="sp-11-reduced-special-fibres"></a>
### SP.11.5 Two inertial types with the same reduced special fibre, and the comparison of deformation rings

`ModularityAndLanglandsExtensionsPartII:SP.11/reduced-special-fibres` · theorem

(Lemma 3.6) For v ∈ T\_{F\_1}, let R^□\_v be the unrestricted lifting ring of s̄|\_{G\_{K\_{1,ṽ}}}, R\_v its quotient for the inertial type τ\_s of s and R′\_v its quotient for the type of the special representation Sp\_n. Then R\_v and R′\_v are nonzero and (R\_v/(ϖ))^{red} ≅ (R′\_v/(ϖ))^{red} as R^□\_v-algebras. (Lemma 3.8) Consequently (R\_{𝒮\_{F\_1}}/(ϖ))\_{red} ≅ (R\_{𝒮′\_{F\_1}}/(ϖ))\_{red}, and restriction gives a finite morphism R\_{𝒮′\_{F\_2}} → R\_{𝒮′\_{F\_1}}.


*Hypotheses and conventions.*

- v\_0 with q\_{v\_0} ≡ −1 mod p and π\_{v\_0} tamely dihedral of order p; s̄ trivial residual type considerations at T\_{F\_1}.


*Proof route.*

- Under division-algebra Jacquet–Langlands, the two types in this lemma correspond to characters of order p and order 1. They have the same mod-p reduction. Dotto’s cycle formula therefore gives equal special-fibre cycles for these particular types, not for arbitrary congruent inertial restrictions.
- Both local lifting rings are O-flat, reduced and equidimensional of dimension 1+n², with special fibres pure of dimension n². Equal cycles then give the same generic points and hence equal reduced closed special fibres inside the common unrestricted special fibre. Nonemptiness follows from the exhibited characteristic-zero types.
- Present the global problems using the same auxiliary global relations over the local rings. Equality after reduction transfers to their reduced special fibres. Finiteness of restriction F₂/F₁ is the separate pseudodeformation-restriction theorem.


*Checks.*

- For these two types, equality of the special-fibre cycles and purity of dimension n² imply equality of reduced special fibres. Equality of mod-p inertial restrictions by itself is insufficient.


*Source.*

- [nt26] Lemma 3.6, p. 18; Lemma 3.8, p. 20: Shows the fixed-type and special-type lifting rings above v\_0 have isomorphic reduced special fibres, and deduces the comparison of global rings and finiteness of restriction.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/tensor-deformation-problems`, `LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n`, `LocalGaloisDeformationRings:R08.2/dotto-division-algebra-cycles`, `LocalGaloisDeformationRings:R08.2/unrestricted-ring-complete-intersection`, `PotentialAutomorphyInfrastructurePartII:PL.6/pseudodeformation-restriction-finite`.

<a id="sp-11-steinberg-finiteness-and-lift"></a>
### SP.11.6 Finiteness of R\_{𝒮′\_{F\_2}} and a Steinberg automorphic lift

`ModularityAndLanglandsExtensionsPartII:SP.11/steinberg-finiteness-and-lift` · theorem

R\_{𝒮′\_{F\_2}} is finite over Λ\_{F\_2}, and there is an ι-ordinary RACSDC Π of GL\_n(𝔸\_{K\_2}), unramified outside S\_{F\_2}, with r̄\_{Π,ι} ≅ s̄|\_{G\_{K\_2}} and Π\_ṽ an unramified twist of Steinberg for each v ∈ T\_{F\_2}. The irreducible constituents of s̄|\_{G\_{K\_2}} (twists of Sym^r r̄\_{σ,ι} and Sym^{r−2}r̄\_{σ,ι}) have ι-ordinary automorphic lifts Steinberg at a suitable ṽ\_2: raise the level of σ for GL\_2 at v\_2 (q\_{v\_2} ≡ 1 mod p, r̄ trivial there) and take symmetric powers using SP\_{r−1} and SP\_{r+1}.


*Hypotheses and conventions.*

- SP\_{r−1} and SP\_{r+1} (the induction hypotheses, parent node ML.3/sp-statement).
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Choose v₂∉S∪X₀ with q\_{v₂}≡1 mod p and trivial residual representation, and ensure all other places of its residue characteristic are unramified in the construction. Raise the GL₂ level at v₂ and apply SP\_{r−1},SP\_{r+1} to obtain ordinary automorphic lifts of both residual constituents, Steinberg at the chosen place.
- First apply the ANT residually reducible finiteness argument with the auxiliary Steinberg condition at v₂. Khare–Wintenberger extraction and Thorne 2024 Theorem 7.5 produce an ordinary automorphic lift Π′ with the prescribed types, including Steinberg at T and v₂. This requires the auxiliary-place variant of NT26 Proposition 3.9, whose local-ring and Hecke comparison boundary is recorded in G7.
- Then remove the extra Steinberg condition at v₂. Apply finiteness a second time using Π′ as automorphic input to obtain finiteness of the desired R\_{𝒮′\_{F₂}} over Λ\_{F₂}. Thorne’s level-raising input and the ordinary extraction give Π with the asserted Steinberg types at T. A single unqualified finiteness call does not justify this relaxation.


*Checks.*

- For r = 2 the constituents are twists of Sym² r̄\_σ and of a character; SP\_1 and SP\_3 hold unconditionally.


*Source.*

- [nt26] Proposition 3.9 and proof, pp. 20–21: Proves finiteness of the Steinberg deformation ring over Λ and produces an ordinary RACSDC lift Steinberg above v\_0, via residual automorphy of the constituents and Thorne's level raising.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/tensor-deformation-problems`, `ModularityAndLanglandsExtensionsPartII:SP.6/thorne-steinberg-level-raising`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-finiteness`, `SerreWeightAndLevelOptimisation:R20.2/level-raising-diamond`, `ModularityAndLanglandsExtensions:ML.3/sp-statement`, `PotentialAutomorphyInfrastructurePartII:PL.7/auxiliary-place-ant-finiteness`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-11-generic-components"></a>
### SP.11.7 Generic primes on every component

`ModularityAndLanglandsExtensionsPartII:SP.11/generic-components` · theorem

(Proposition 3.10) The graph whose vertices are the minimal primes of R\_{𝒮′\_{F\_2}}/(ϖ), with Q, Q′ joined when Q + Q′ lies in a generic prime of dimension 1, is connected. (Proposition 3.11) R\_{𝒮\_{F\_1}} is finite over Λ\_{F\_1}; each minimal prime has dimension dim Λ\_{F\_1} and characteristic 0 and lies in a generic prime of dimension 1 and characteristic p. Consequently there is a finite set 𝒫 of generic primes of R\_{𝒮′\_{F\_2}} of dimension 1 and characteristic p witnessing every edge of the graph and such that every minimal prime of R\_{𝒮\_{F\_1}} lies in a generic 𝔭 with 𝔭\_{F\_2} ∈ 𝒫.


*Hypotheses and conventions.*

- d\_{0,F\_2} > 1 (SP.11/tensor-section-3-hypotheses) bounds the reducible locus.


*Proof route.*

- Proposition 3.10: connectedness dimension of R\_{𝒮′\_{F\_2}}/(ϖ) (Grothendieck's connectedness and the arithmetic rank; PotentialAutomorphyInfrastructurePartII PL.6, connectedness dimension) together with the bound on the reducible locus by d\_{0,F\_2} (PL.6, reducible-locus dimension).
- Proposition 3.11: SP.11/reduced-special-fibres transfers finiteness and components from 𝒮′\_{F\_1} to 𝒮\_{F\_1}; large quotients contain generic primes (PL.6).
- 𝒫: Thorne 2015 Proposition 5.3 and the splitting of the p-adic places of F\_1 in F\_2.


*Checks.*

- If R\_{𝒮′\_{F\_2}}/(ϖ) had two components meeting only in the reducible locus, the graph would be disconnected; d\_{0,F\_2} > 1 excludes this.


*Source.*

- [nt26] Proposition 3.10, p. 21; Proposition 3.11, p. 22; the set 𝒫, pp. 22–23: Proves connectedness of the generic-prime graph, finiteness and generic primes on every component of the fixed-type problem, and chooses the finite set 𝒫.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/reduced-special-fibres`, `ModularityAndLanglandsExtensionsPartII:SP.11/steinberg-finiteness-and-lift`, `PotentialAutomorphyInfrastructurePartII:PL.6/connectedness-dimension`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-locus-dimension`, `PotentialAutomorphyInfrastructurePartII:PL.6/large-quotients-contain-generic-primes`, `PotentialAutomorphyInfrastructurePartII:PL.6/generic-prime`.

<a id="sp-11-scalar-generic-r-equals-t"></a>
### SP.11.8 An extension making generic points scalar, and the generic R = T theorem

`ModularityAndLanglandsExtensionsPartII:SP.11/scalar-generic-r-equals-t` · theorem

(Proposition 3.12) There is a totally real F\_3/F\_2, soluble and X\_0-split over F, in which each p-adic place of F\_2 splits, such that for every 𝔭 ∈ 𝒫 and v ∈ T\_{F\_3}, r\_𝔭|\_{G\_{K\_3,ṽ}} is unramified with scalar Frobenius. (Proposition 3.13) If 𝔭 ⊂ R\_{𝒮\_{F\_3}} is a generic prime of dimension 1 and characteristic p with J\_{𝒮\_{F\_3}} ⊂ 𝔭 and r\_𝔭|\_{G\_{K\_3,ṽ}} scalar for each v ∈ T\_{F\_3}, then every prime Q ⊂ 𝔭 contains J\_{𝒮\_{F\_3}}.


*Hypotheses and conventions.*

- 𝒫 as in SP.11/generic-components.
- Choose the residual coefficient field initially to split every subgroup of the residual finite image. Verify geometric weak primitivity before this choice; the weak-primitive generic Hecke-kernel theorem then applies over the normalization residue field. An inference from primitivity over an arbitrary finite field is not used.
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Proposition 3.12: adjoin an X\_0-split soluble extension of F sufficiently tamely ramified at v\_0 (proof of Thorne 2015 Proposition 6.2).
- Proposition 3.13: for trivial restriction this is the generic R = T theorem (Allen–Newton–Thorne Theorem 4.1; PotentialAutomorphyInfrastructurePartII PL.6, generic R\_𝔭 = T\_𝔭); the scalar case reduces to it by the twisting argument of Thorne 2015 Lemma 3.40 (PL.6, twisting and base change).


*Checks.*

- Trivial restriction at T\_{F\_3} is the special case of scalar restriction with scalar 1.


*Source.*

- [nt26] Proposition 3.12, p. 23; Proposition 3.13, p. 24: Constructs F\_3 making the generic points scalar above v\_0, and extends the generic R = T theorem to scalar local restrictions.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/generic-components`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-hecke-kernel`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitive-generic-restriction`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-11-all-components-automorphic"></a>
### SP.11.9 Every component of the Steinberg problem is automorphic after restriction

`ModularityAndLanglandsExtensionsPartII:SP.11/all-components-automorphic` · theorem

There are Λ\_{F\_3}-algebra maps R\_{𝒮\_{F\_3}} → R\_{𝒮′\_{F\_2}} and R\_{𝒮\_{F\_3}} → R\_{𝒮\_{F\_1}} by restriction (τ\_s becomes unipotent over F\_3 because BC\_{F\_2/F}(π) is unramified above v\_0), compatible maps of the pseudodeformation subrings, and 𝕋\_{F\_3} → 𝕋\_{F\_2} by soluble base change, so that J\_{𝒮\_{F\_3}}·P\_{𝒮′\_{F\_2}} ⊂ J\_{𝒮′\_{F\_2}}. (Proposition 3.14) For every prime Q ⊂ R\_{𝒮′\_{F\_2}}/(ϖ), its pullback Q\_{F\_3} to R\_{𝒮\_{F\_3}} contains J\_{𝒮\_{F\_3}}.


*Hypotheses and conventions.*

- Setting of SP.11.


*Proof route.*

- Use the restriction and ordinary Hecke base-change diagram of NT26 p.24, Thorne 2015 Proposition 4.18 and NTI Lemma 6.7, with the same pseudodeformation subrings.
- The ordinary Hecke algebra from the Steinberg seed is faithful over Λ. Together with finiteness and equidimensionality this supplies a minimal characteristic-p component containing the Hecke kernel, rather than merely a single isolated automorphic point.
- Propagate that component along the connected graph of SP.11/generic-components. At each edge, pull its witness in 𝒫 back to F₃; it is scalar locally by Proposition 3.12. Proposition 3.13 puts the Hecke kernel into both adjoining component primes. Every vertex, and hence every prime above a vertex, contains the pulled-back kernel.


*Checks.*

- A single automorphic component plus connectivity gives all components.


*Source.*

- [nt26] the comparison diagram, p. 24; Proposition 3.14 and proof, p. 24: Builds the comparison diagram of deformation rings and Hecke algebras over F\_3 and shows every component of the Steinberg problem becomes automorphic after restriction.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/steinberg-finiteness-and-lift`, `ModularityAndLanglandsExtensionsPartII:SP.11/generic-components`, `ModularityAndLanglandsExtensionsPartII:SP.11/scalar-generic-r-equals-t`, `ModularityAndLanglandsExtensionsPartII:SP.6/nt-generic-prime`, `PotentialAutomorphyInfrastructurePartII:PL.6/reducible-twisting-and-base-change`.

<a id="sp-11-untwisted-tensor-automorphy"></a>
### SP.11.10 Automorphy of the untwisted tensor r\_π ⊗ Sym^{r−1}r\_σ (Newton–Thorne 2026 Theorem 3.2)

`ModularityAndLanglandsExtensionsPartII:SP.11/untwisted-tensor-automorphy` · theorem · planet: Untwisted tensor automorphy (NT 2026 Theorem 3.2)

Under SP.11/tensor-section-3-hypotheses, assume SP\_{r−1} and SP\_{r+1}. For any σ with the properties of SP.11/ordinary-companion, r\_{π,ι} ⊗ Sym^{r−1}r\_{σ,ι} ≅ r\_{Π,ι} for an ι-ordinary RAESDC Π on GL\_{2r}(𝔸\_F). (For r = 1 the statement is trivial.) This is the tensor theorem for the prescribed π and σ only, not general GL\_2 × GL\_r functoriality.


*Hypotheses and conventions.*

- SP\_{r−1}, SP\_{r+1}; r > 1.


*Proof route.*

- The specified s gives f:R\_{𝒮\_{F₁}}→O. Choose a minimal prime Q⊂ker(f). Proposition 3.11 puts Q in a characteristic-p dimension-one generic prime 𝔭 whose image 𝔭\_{F₂} lies in 𝒫.
- Proposition 3.14 first gives J\_{𝒮\_{F₃}}⊂𝔭\_{F₃}. Proposition 3.12 makes the local restrictions of this generic representation scalar. Apply Proposition 3.13 again, now to Q\_{F₃}⊂𝔭\_{F₃}, to get J\_{𝒮\_{F₃}}⊂Q\_{F₃}⊂ker(f)\_{F₃}. This second use is necessary: membership in the larger generic prime alone does not establish automorphy of f.
- The Hecke support criterion gives automorphy of s restricted to K₃. Undo X,Y and use soluble descent from K₃ to K₁ and then F, obtaining exactly the prescribed tensor. Treat r=1 directly by Sym⁰=1, without invoking SP₀.


*Checks.*

- For r = 2 the tensor r\_π ⊗ r\_σ is automorphic by Ramakrishnan's GL\_2 × GL\_2 (parent ML.3/ramakrishnan-tensor-product), a consistency check.


*Source.*

- [nt26] Theorem 3.2, p. 13; completion of the proof, p. 25: States and proves automorphy of r\_π ⊗ Sym^{r−1}r\_σ for the companion σ, by comparing deformation problems with congruent reduced special fibres.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/all-components-automorphic`, `ModularityAndLanglandsExtensionsPartII:SP.11/polarized-tensor-s`, `ModularityAndLanglandsExtensionsPartII:SP.11/reduced-special-fibres`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`, `ModularityAndLanglandsExtensionsPartII:SP.11/scalar-generic-r-equals-t`.

## Layer SP.12: Functoriality lifting for tensor products

**Targets.** Newton–Thorne 2026 §4: the preliminary reductions (10)–(16) and the CM set-up π\_K, σ\_K, T with the group determinants t, t′ (with the repair of E24: σ's ramified places join S); Artinian points are torsion semistable and the tensor map P → R (Lemma 4.2, Corollary 4.3); Taylor–Wiles data for the tensor and the rings Δ\_Q, R\_Q, P\_Q; unitary automorphic forms at Taylor–Wiles level (Lemma 4.5, Proposition 4.6); enormous tensor image (Lemma 4.7); patching for p > 2 and p = 2 (Propositions 4.8–4.9); and Theorem 4.1, functoriality lifting for r\_π ⊗ r\_σ with σ fixed (whose statement the parent records in §4.23).

**Sources.** Newton–Thorne 2026 §4, pp. 25–37.

Use Σ\_π for quaternionic ramification and Σ\_π∪Σ\_σ for S and the unitary level. Taylor–Wiles prime selection uses a perfect residual subgroup; characteristic-zero enormousness is the separate Selmer-vanishing input. Exact BBM, prime-selection and formal-torus contracts are requested in G7.

*Requires:* `ArithmeticGaloisRepresentations:G7`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `GL2ModularityLifting:R22.2`, `GlobalGaloisDeformations:G7`, `LocalGaloisDeformationRings:R08.6`, `ModularityAndLanglandsExtensionsPartII:SP.9`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.2`, `PotentialAutomorphyInfrastructurePartII:PL.8`.

<a id="sp-12-tensor-lifting-setup"></a>
### SP.12.1 Preliminary reductions and the CM set-up for tensor functoriality lifting

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-lifting-setup` · theorem

In the situation of SP.12/tensor-functoriality-lifting, after Clozel–Harris–Taylor Lemma 4.1.4 and a soluble totally real base change one may assume in addition: (10) det r\_π = det r\_{π′} = ε^{−1}; (11) [F : ℚ] even; (12) π\_v, π′\_v and σ\_v Iwahori-spherical at every finite v, with an even number of places where π, π′ are ramified; (13) with Σ the places where π or σ is ramified (σ's ramified places added, repairing E24 of the extraction) and S = S\_p ∪ Σ, r̄\_{π,ι}|\_{G\_{F\_v}} trivial for v ∈ S, and for v ∈ Σ^p, q\_v ≡ 1 mod p with π\_v, π′\_v Steinberg or unramified as the case may be (if Σ ∩ S\_p ≠ ∅ then p > 2); (14) an S-split everywhere unramified quadratic CM K/F with CM type Φ and places S̃; (15) everywhere unramified type-A\_0 characters X, Y of K with X∘N = χ∘N (σ ≅ σ^∨ ⊗ χ), Y∘N = |·| and prescribed infinity types; (16) (r\_π ⊗ r\_σ)|\_{G\_{K(ζ\_{p^∞})}} and (r\_{π′} ⊗ r\_σ)|\_{G\_K} irreducible. Put π\_K = BC(π), π′\_K = BC(π′), σ\_K = BC(σ) ⊗ X^{−1}, and T the RACSDC representation of GL\_n(𝔸\_K) of weight 0 with r\_T ≅ r\_{π\_K} ⊗ r\_{σ\_K} ⊗ r\_Y^{1−r}; with integral models r, r′, s (r̄ = r̄′) and the group determinants t, t′ of (r ⊗ s)|\_{G\_K} ⊗ r\_{X^{−1}Y^{1−r}} and its π′ analogue, with common reduction t̄.


*Hypotheses and conventions.*

- Hypotheses (1)–(9) of SP.12/tensor-functoriality-lifting.
- Repair of E24: unramified local conditions for r̃ at σ's extra ramified places, D unramified and V\_0 Iwahori there.
- Write Σ\_π for the ramification set of π (and π′ after the reductions), and Σ=Σ\_π∪Σ\_σ for the full set used in S and in the unitary Iwahori level. The quaternion algebra D is ramified only at Σ\_π away from p, not at σ-only places. At a σ-only place D is split and the rank-two deformation condition remains unramified.


*Proof route.*

- Soluble base change preserves (1)–(9) and the conclusion descends (PotentialAutomorphyInfrastructurePartII PL.0).
- XX^c = χ∘N and YY^c = |·|\_K give r\_T^c ≅ r\_T^∨ ⊗ ε^{1−2r}; X^{−1}Y^{1−r} has trivial infinity type (PL.0, auxiliary characters).


*Checks.*

- For r = 1, σ is a character, T = π\_K ⊗ σ\_K and the argument is rank-two modularity lifting.


*Source.*

- [nt26] proof of Theorem 4.1, reductions (10)–(16), pp. 26–27; the CM set-up, pp. 27–28: Lists the reductions by soluble base change and defines the CM objects π\_K, σ\_K, T and the determinants t, t′ used in the patching argument.


*Needs.* `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions`, `PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-characters`, `GL2ModularityLifting:R22.2`, `AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding`.

<a id="sp-12-tensor-map"></a>
### SP.12.2 Artinian points are torsion semistable, and the tensor map P → R

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-map` · theorem

(Lemma 4.2) For Artinian A ∈ 𝒞\_𝒪, v ∈ S\_p and a lift r̃\_A of r̄|\_{G\_{F\_v}} of determinant ε^{−1} of the given type at v, the module A^{2r} with the action r̃\_A ⊗ s|\_{G\_{K\_ṽ}} ⊗ r\_{X^{−1}Y^{1−r},ι} is a subquotient of a lattice in a semistable representation with Hodge–Tate weights in a fixed interval [a, b]. (Corollary 4.3) Consequently r̃ ↦ (r̃ ⊗ s)|\_{G\_K} ⊗ r\_{X^{−1}Y^{1−r},ι} defines a morphism P → R in 𝒞\_𝒪 from the conjugate self-dual pseudodeformation ring of rank 2r (semistable in the torsion sense at p) to the rank-two deformation ring R, and t, t′ give homomorphisms P → 𝒪.


*Hypotheses and conventions.*

- Setting of SP.12/tensor-lifting-setup.


*Proof route.*

- At a potentially crystalline weight-{0,1} place, the finite-flat/Barsotti–Tate comparison makes each Artinian rank-two point a quotient of a lattice in a crystalline representation with Hodge–Tate weights {0,1}. Tensor with the fixed semistable lattice and the fixed character, obtaining a uniform interval [a,b]. The precise BBM finite-flat generic-fibre comparison is requested from R07.4.
- At a noncrystalline ordinary place use the closed, stable torsion-semistable quotient R′ of the universal local ring, for an interval determined by the fixed tensor factor. The reduced local deformation ring has dense characteristic-zero semistable points; all of them factor through R′. Thus its whole map factors through R′, and every Artinian specialization has the required torsion property. An ordinary filtration alone does not prove this assertion.
- Apply the semistable pseudodeformation universal property to the tensor representation and its fixed polarization. This gives P→R and the two specified O-points (Corollary 4.3).


*Checks.*

- At the automorphic point t the map P → 𝒪 is the composite of R → 𝒪 (from r) with P → R.


*Source.*

- [nt26] Lemma 4.2, pp. 28–29; Corollary 4.3, p. 29: Shows Artinian lifts tensored with s are torsion semistable and defines the tensor map from the pseudodeformation ring to the deformation ring.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-lifting-setup`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-tensor-map`, `LocalGaloisDeformationRings:R08.6/torsion-semistable-condition`, `LocalGaloisDeformationRings:R08.6/newton-thorne-local-quotients`, `PotentialAutomorphyInfrastructurePartII:PL.8/semistable-pseudodeformation-ring`.

<a id="sp-12-tensor-taylor-wiles-data"></a>
### SP.12.3 Taylor–Wiles data and rings for the tensor product

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-taylor-wiles-data` · definition

A Taylor–Wiles datum of level N for the tensor is (Q, Q̃, (α\_v, β\_v), (γ\_{v,1}, …, γ\_{v,r})) with Q split in K, q\_v ≡ 1 mod p^N, a factorisation v = ṽṽ^c, (r̄ ⊗ s̄)(Frob\_ṽ) having 2r distinct eigenvalues, α\_v, β\_v the eigenvalues of r̄(Frob\_ṽ) and γ\_{v,i} those of (s̄ ⊗ r\_{X^{−1}Y^{1−r}})(Frob\_ṽ). Attached: Δ\_Q, with R\_Q an 𝒪[Δ\_Q]-algebra such that R\_Q ⊗\_{𝒪[Δ\_Q]} 𝒪 ≅ R; P\_Q the quotient of the pseudodeformation ring of G\_{K,S∪Q} by the Taylor–Wiles conditions (at ṽ ∈ Q̃ the residual characters are α\_vγ\_{v,i} for i ≤ r and β\_vγ\_{v,i−r} for i > r), with its 𝒪[Δ′\_Q]-structure; and the map P\_Q → R\_Q extending SP.12/tensor-map.


*Hypotheses and conventions.*

- The 2r distinct eigenvalues exist by the perfect subgroup hypothesis (6) of Theorem 4.1.
- N≥1, Q is disjoint from S, and Δ′\_Q=Δ\_Q^{2r}. At the auxiliary places the decomposition is into ordered lifts of the residual eigencharacters; the lifts may be ramified and encode the diamond action.


*Proof route.*

- As SP.9/symmetric-taylor-wiles-data, with the tensor eigenvalue pattern in place of the symmetric-power monomials; the decomposition into characters by uniqueness for multiplicity-free pseudocharacters.
- Prime selection uses the perfect residual subgroup containing a regular semisimple element in hypothesis (6), together with the rank-two residual large-image bound. This is the tensor-specific prime-selection variant requested from GlobalGaloisDeformations G7; characteristic-zero enormousness alone is not this hypothesis.


*API.*

- `TensorTWDatum.mk` (constructor): A level-N datum with 2r distinct eigenvalues of (r̄ ⊗ s̄)(Frob\_ṽ).
- `TensorTWDatum.rings` (data): Δ\_Q, Δ′\_Q, R\_Q and P\_Q with their group-ring structures.
- `TensorTWDatum.map` (other): P\_Q → R\_Q extending P → R.
- `TensorTWDatum.residualCharacters` (characterisation): At ṽ ∈ Q̃ the residual characters of P\_Q are α\_vγ\_{v,i} (i ≤ r) and β\_vγ\_{v,i−r} (i > r).
- `TensorTWDatum.augmentation` (compatibility): Specializing all rank-two diamond characters to the identity gives R\_Q⊗\_{O[Δ\_Q]}O≅R. The map on rank-2r local characters is the ordered tensor product with the fixed factor, compatible with P\_Q→R\_Q.


*Unit tests.*

- `TensorTWDatum.count` (computation): There are 2r residual characters at each ṽ: r of the form α\_vγ\_{v,i} and r of the form β\_vγ\_{v,i}.
- `TensorTWDatum.r_one` (degenerate): For r = 1 the condition is α\_v ≠ β\_v.
- `TensorTWDatum.repeated` (non-example): If α\_vγ\_{v,1} = β\_vγ\_{v,2}, the 2r eigenvalues are not distinct and v is not a Taylor–Wiles place.


*Checks.*

- For r = 1 the datum reduces to a rank-two Taylor–Wiles datum with γ\_{v,1} a fixed scalar.


*Uses.*

- Newton–Thorne 2026, Propositions 4.6 and 4.8–4.9, pp. 33–35: patching of unitary modules over 𝒪[Δ′\_Q]


*Source.*

- [nt26] §4 after Corollary 4.3, Taylor–Wiles data and the rings Δ\_Q, R\_Q, P\_Q, pp. 29–30: Defines Taylor–Wiles data for the tensor and the attached rings with their group-ring structures and the map P\_Q → R\_Q.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-map`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-taylor-wiles-data`, `GlobalGaloisDeformations:G7/taylor-wiles-local-diamond`, `GlobalGaloisDeformations:G7`.

<a id="sp-12-tensor-unitary-modules"></a>
### SP.12.4 Unitary automorphic forms at Taylor–Wiles level for the tensor

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-unitary-modules` · theorem

Let G be the definite unitary group over F with G(R) = {g ∈ M\_n(𝒪\_K ⊗ R) : g = (1 ⊗ c)(g)^{−t}}, H\_G(V) the 𝒪-valued forms of level V, V\_0 Iwahori at Σ and hyperspecial elsewhere (with σ's ramified places included, E24), V\_0(Q) ⊃ V\_1(Q; N) with quotient Δ′\_Q/(p^N), and maximal ideals m\_G, m\_{G,Q} (the latter generated by the U\_{ϖ\_ṽ}^{(i)} minus products of the eigenvalues αγ, βγ, misprinted in the source, E26). (Lemma 4.5) For p = 2 each quadratic χ of F^×\(𝔸\_F^∞)^×/det U\_1(Q; N) has a unique quadratic θ\_χ with θ\_χ(z/z^c) = χ∘N\_{K/F}(z). (Proposition 4.6) For a datum of level N+c\_G, where p^{c\_G} kills the p-primary base-level stabilizers: m\_G and m\_{G,Q} are in the supports; H\_G(V\_1(Q; N))\_{m\_{G,Q}} is free over 𝒪[Δ′\_Q/(p^N)] with coinvariants H\_G(V\_0)\_{m\_G}; and it carries a compatible P\_Q-module structure.


*Hypotheses and conventions.*

- Setting of SP.12/tensor-lifting-setup.
- N≥1. Order the eigenvalues η=(αγ₁,…,αγ\_r,βγ₁,…,βγ\_r). At each auxiliary place the maximal ideal contains U^{(i)}−q^{i(1−i)/2}∏\_{j=1}^iη\_j. In particular for i>r this product is α^rβ^{i−r}(∏\_{j=1}^rγ\_j)(∏\_{j=1}^{i−r}γ\_j), with both γ-products present.


*Proof route.*

- The datum at level N+c\_G puts the p-primary stabilizer images in V₁(Q;N). Thus the deck group Δ′\_Q/(p^N) acts freely on the relevant finite double quotient. Exactness gives group-ring freeness and the trace identifies the coinvariants with H\_G(V₀)\_{m\_G}; triviality of every base-level stabilizer is unnecessary.
- Support comes from Labesse descent of the automorphic tensor T. The ordered cumulative products η₁⋯η\_i define m\_{G,Q}; the multiplicity-free decomposition of the Hecke pseudocharacter gives its P\_Q action. For p=2 use Hilbert 90 to construct the unique quadratic θ\_χ of Lemma 4.5.


*Checks.*

- For N=1, augmentation from O[Δ′\_Q/(p)] recovers H\_G(V₀)\_{m\_G} with its Hecke action.


*Source.*

- [nt26] §4, unitary forms, pp. 31–32; Lemma 4.5, p. 32; Proposition 4.6, p. 33: Defines the unitary forms and Taylor–Wiles levels for the tensor, the quadratic twisting characters for p = 2, and proves freeness and the P\_Q-module structure.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/twisted-unitary-hecke-modules`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-taylor-wiles-data`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms`, `PotentialAutomorphyInfrastructurePartII:PL.2/exactness-and-freeness`, `PotentialAutomorphyInfrastructurePartII:PL.2/unitary-base-change-and-descent`.

<a id="sp-12-tensor-enormous"></a>
### SP.12.5 The tensor image is enormous

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-enormous` · theorem

The image of (r ⊗ s)|\_{G\_K} ⊗ r\_{X^{−1}Y^{1−r},ι} restricted to G\_{K(ζ\_{p^∞})} is enormous in the sense of the parent's §4.1 (Newton–Thorne, JEMS, Definition 2.23).


*Hypotheses and conventions.*

- Hypothesis (8) of Theorem 4.1 (strong irreducibility of r\_π ⊗ r\_σ) and Hodge–Tate regularity of the tensor (its weights are {0, 1, …, 2r − 1} by (7)).


*Proof route.*

- By Newton–Thorne (JEMS) Lemma 2.28 it suffices that the derived subgroup G^1 of the identity component G^0 of the Zariski closure G of the image of ρ = (r ⊗ s)|\_{G\_K} ⊗ r\_{X^{−1}Y^{1−r},ι} contains regular semisimple elements and acts absolutely irreducibly; G^1 lies in the Zariski closure of ρ(G\_{K(ζ\_{p^∞})}) (ArithmeticGaloisRepresentations G7, characteristic-zero enormous subgroups).
- G^0 acts irreducibly because ρ is strongly irreducible, so its centre is scalar and G^0 = G^1 or G^1𝔾\_m; hence G^1 acts irreducibly.
- At v ∈ S\_p the Sen operator lies in Lie G^0 and has n distinct eigenvalues because ρ|\_{G\_{K\_ṽ}} is Hodge–Tate regular (Patrikis Lemmas 2.2.5, 2.2.7); a maximal-torus argument (Borel II.7.1) gives regular semisimple elements in G^0, hence in G^1.
- Enormousness is the input to adjoint Selmer vanishing (parent §4.1; PotentialAutomorphyInfrastructurePartII PL.8) at the automorphic point.


*Checks.*

- A tensor that is not Hodge–Tate regular (σ with weights {0, 1, …, r − 1} instead of {0, 2, …, 2r − 2}) need not have a Sen operator with distinct eigenvalues, and the criterion fails.


*Source.*

- [nt26] Lemma 4.7 and proof, pp. 33–34: Shows the image of the tensor representation on the cyclotomic-infinite subgroup is enormous.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-lifting-setup`, `ArithmeticGaloisRepresentations:G7/characteristic-zero-enormous-subgroups`, `ArithmeticGaloisRepresentations:G7/zariski-closure-and-monodromy-groups`, `PotentialAutomorphyInfrastructurePartII:PL.8/adjoint-selmer-vanishing`.

<a id="sp-12-tensor-patching"></a>
### SP.12.6 Patching for tensor functoriality lifting

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-patching` · theorem

(p > 2, Proposition 4.8) There are W\_∞ = 𝒪[[Y\_1, …, Y\_q, Z\_1, …, Z\_{4|S∪S\_∞|−1}]] and W′\_∞ (with n copies of the Y-variables), a W′\_∞-algebra P\_∞ and a W\_∞-algebra R\_∞ with P\_∞ ⊗ 𝒪 ≅ P and R\_∞ ⊗ 𝒪 ≅ R, a surjection R^{loc}[[X\_1, …, X\_g]] → R\_∞ with g = q + |S ∪ S\_∞| − 1, patched modules H\_{G,∞}, H\_{D,∞} finite free over W′\_∞, W\_∞ specialising to H\_G, H\_D, and P\_∞ → R\_∞ compatible with P → R. (p = 2, Proposition 4.9) With q ≥ |S ∪ S\_∞| and γ = 2 − |S ∪ S\_∞| + q, the same with R^{loc}[[X\_1, …, X\_g]] → R′\_∞ → R\_∞ (g = 2q + 1), a free action of Ĝ\_m^γ on Sp R′\_∞ and an equivariant δ : Sp R′\_∞ → Ĝ\_m^γ (for the square of the standard action) with δ^{−1}(1) = Sp R\_∞, and compatible actions of Ĝ\_m^γ[2] lifting to H\_{D,∞} and H\_{G,∞}.


*Hypotheses and conventions.*

- For all N≥1 use the tensor Taylor–Wiles data selected using hypothesis (6), the perfect residual subgroup, and the rank-two large-image bound. This step does not follow from SP.12/tensor-enormous.
- For odd p choose q≥0 with 2q≥|S∪S\_∞|. For p=2 choose q≥|S∪S\_∞| as in Proposition 4.9.


*Proof route.*

- As SP.9/symmetric-patching-odd and SP.9/symmetric-patching-dyadic, patching the quaternionic modules for r̄ and the unitary modules of SP.12/tensor-unitary-modules simultaneously; the rank 2r of the pseudocharacter side enters only through P, the Taylor–Wiles data and the unitary module.


*Checks.*

- dim W′\_∞ − dim W\_∞ = (n − 1)q, the extra Y-variables of the rank-n unitary side.


*Source.*

- [nt26] Proposition 4.8, p. 34; Proposition 4.9, p. 35: Constructs the patched rings and modules for the tensor version, for p odd and p = 2.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-unitary-modules`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-taylor-wiles-data`, `DeformationAndDerivedPatchingAlgebra:R03.6`.

<a id="sp-12-tensor-functoriality-lifting"></a>
### SP.12.7 Functoriality lifting for a tensor with one factor fixed (Newton–Thorne 2026 Theorem 4.1)

`ModularityAndLanglandsExtensionsPartII:SP.12/tensor-functoriality-lifting` · theorem · planet: Tensor functoriality lifting (NT 2026 Theorem 4.1)

Let F be totally real, r ≥ 1, p any prime, ι : Q̄\_p ≅ ℂ, π, π′ RAESDC on GL\_2(𝔸\_F) and σ RAESDC on GL\_r(𝔸\_F) with (1) π, π′ of weight 0 and non-CM; (2) r̄\_{π,ι} ≅ r̄\_{π′,ι}; (3) r̄\_{π,ι}(G\_F) containing a conjugate of SL\_2(𝔽\_{p^a}), p^a > 5; (4) at each v | p, r\_{π,ι}|\_{G\_{F\_v}} ordinary (resp. potentially crystalline) iff r\_{π′,ι}|\_{G\_{F\_v}} is, both potentially crystalline if p = 2; (5) at each v ∤ p, π\_v a twist of Steinberg iff π′\_v is; (6) a perfect subgroup of (r̄\_{π,ι} ⊗ r̄\_{σ,ι})^{ss}(G\_F) containing an element with 2r distinct eigenvalues; (7) HT\_τ(r\_{σ,ι}) = {0, 2, …, 2r − 2} for every τ; (8) r\_{π,ι} ⊗ r\_{σ,ι} automorphic and strongly irreducible; (9) r\_{π′,ι} ⊗ r\_{σ,ι} irreducible. Then r\_{π′,ι} ⊗ r\_{σ,ι} is automorphic. This proves the statement the parent records in §4.23 (first paragraph); the proof covers σ ramified where π is not after the repair of E24 in SP.12/tensor-lifting-setup.


*Hypotheses and conventions.*

- Hypotheses (1)–(9).


*Proof route.*

- Reduce as in SP.12/tensor-lifting-setup.
- Characteristic-zero enormousness and adjoint Selmer vanishing give P\_{(𝔭)}=E at the automorphic characteristic-zero prime. The patched specialization then gives regularity of (P\_∞)\_{𝔭\_∞}. Consequently 𝔭\_∞ lies on a unique component of Supp H\_{G,∞}; no equality of the entire pseudodeformation ring with E is claimed.
- For odd p the rank-two patched support is irreducible and H\_{D,∞} is faithful, so its image contains the target point on the same unitary component. For p=2 use the torus action on the rank-two local rings of rank n+4|S∪S\_∞| and the formal Ĝ\_m^γ[2]-torsor of Proposition 4.9: its action is transitive on components and lifts to both patched modules. This yields the same support conclusion.
- Hence t′ is automorphic: r\_{π′\_K} ⊗ r\_{σ\_K} ⊗ r\_Y^{1−r} comes from a RACSDC representation of GL\_n(𝔸\_K); descend from K to F and by soluble descent.


*Checks.*

- r = 1: classical modularity lifting for weight-zero non-CM Hilbert forms twisted by a character.


*Source.*

- [nt26] Theorem 4.1, p. 25; proof and component argument, pp. 34–37: States and proves functoriality lifting for r\_π ⊗ r\_σ with σ fixed, by simultaneous patching of the rank-two deformation ring and the rank-2r pseudodeformation ring and a component argument.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-patching`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-enormous`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-lifting-setup`, `ModularityAndLanglandsExtensionsPartII:SP.9/support-argument`, `PotentialAutomorphyInfrastructurePartII:PL.8/pseudodeformation-ring-regular-at-automorphic-point`, `PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

## Layer SP.13: Residual twisted tensors and the induction on n

**Targets.** Newton–Thorne 2026 §5: the ray class field of modulus (8)∞ and the reciprocity Lemma 5.3; large image from two tamely dihedral places (Proposition 5.4, with E1); the hypotheses S5-global and S5-local; the companions σ, σ′ and the auxiliary prime t (Lemmas 5.6–5.7, with E25 and E28); propagation over the Galois group of the coefficient field (Lemma 5.8 and the completion of Theorem 5.5); Theorems 5.5 and 5.9, residual witnesses for φ\_p r̄ ⊗ Sym^{r−1}r̄. §6: Corollary 6.2 and the intermediate claim of Proposition 6.1 (with E8); Proposition 6.3, symmetric-power lifting from two ordinary residual blocks (with Thorne 2024 Proposition 7.4); Thorne 2024's induction step (Theorem 7.6, Corollary 7.2); and the induction proving SP\_n for all n (Newton–Thorne 2026 Theorem 6.4, whose statement the parent records in §4.30).

**Sources.** Newton–Thorne 2026 §§5–6, pp. 38–50; Thorne 2024 §7, pp. 42–47.

The r=1 branch uses the coefficient conjugate directly and never SP₀. G6 is resolved by the explicit perfect-group cyclotomic restriction argument. The modular two-block decomposition is a semisimplified identity, not a splitting of the original representation.

*Requires:* `ArithmeticGaloisDuality:R02.3`, `ArithmeticGaloisRepresentations:G7`, `ArithmeticGaloisRepresentations:R01.4`, `AutomorphicGaloisRepresentations:R19.3`, `AutomorphicGaloisRepresentationsPartII:AG2.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `LocalGaloisDeformationRings:R08.2`, `ModularityAndLanglandsExtensions:ML.1`, `ModularityAndLanglandsExtensions:ML.3`, `ModularityAndLanglandsExtensionsPartII:SP.11`, `ModularityAndLanglandsExtensionsPartII:SP.12`, `ModularityAndLanglandsExtensionsPartII:SP.6`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6`, `PotentialAutomorphyInfrastructurePartII:PL.0`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `PotentialAutomorphyInfrastructurePartII:PL.5`, `PotentialAutomorphyInfrastructurePartII:PL.6`, `PotentialAutomorphyInfrastructurePartII:PL.7`, `PotentialModularityAndCompatibleSystems:R24.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`.

<a id="sp-13-ray-class-reciprocity"></a>
### SP.13.1 Reciprocity for the two auxiliary splitting conditions

`ModularityAndLanglandsExtensionsPartII:SP.13/ray-class-reciprocity` · theorem

Let F be totally real and H the ray class field of modulus (8) times all infinite places. (Square generator) If a finite place w of odd residue characteristic splits in H, its prime ideal has a totally positive generator λ\_w ∈ 𝒪\_F which is a square in F\_v^× at every v | 2. (Lemma 5.3) For a finite set S of finite places and finite places v, w ∤ 2 outside S splitting in F(S)H, v splits in F(S ∪ {w}) iff w splits in F(S ∪ {v}), where F(S) is the maximal abelian extension of exponent two unramified outside S (and the infinite places).


*Hypotheses and conventions.*

- F totally real; v, w odd and outside S.


*Proof route.*

- Splitting in H gives a generator λ\_w ≡ square at the dyadic places and totally positive (class field theory, ray class group of modulus (8)∞).
- F(S ∪ {w}) = F(S)(√λ\_w) when w splits in F(S)H (Kummer description after adjoining one ramified place; ArithmeticGaloisDuality R02.3, exponent-two ramification field).
- So the claim is the equality of Hilbert symbols (λ\_v, λ\_w)\_v = (λ\_v, λ\_w)\_w; by the product formula (Tau Ceti ClassFieldTheory Layer 14) it suffices that (λ\_v, λ\_w)\_u = 1 at every other place u: at u | 2∞ because λ\_v, λ\_w are local squares there, and at odd finite u ≠ v, w because both are units.


*Checks.*

- F = ℚ, S = ∅: H = ℚ(ζ\_8), so v, w are primes ≡ 1 mod 8; F(∅) = ℚ and F({w}) = ℚ(√w), and the statement is quadratic reciprocity (v/w) = (w/v) for such primes.


*Source.*

- [nt26] §5.1, the field H and Lemma 5.3 with proof, pp. 38–39: Introduces the ray class field of modulus (8)∞, the totally positive dyadic-square generators, and proves the reciprocity of the two auxiliary splitting conditions by the product formula.


*Needs.* `ArithmeticGaloisDuality:R02.3/exponent-two-ramification-field`, `ArithmeticGaloisDuality:R02.3/one-new-prime-kummer`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

<a id="sp-13-dihedral-large-image"></a>
### SP.13.2 Large image at every prime from two tamely dihedral places

`ModularityAndLanglandsExtensionsPartII:SP.13/dihedral-large-image` · theorem

Fix M > 5. Let π be RAESDC on GL\_2(𝔸\_F) of weight 0 with (1) primes t\_1, t\_2 > M and places v\_1, v\_2 of residue characteristics p\_1, p\_2 > 3, unramified in F, with π\_{v\_i} tamely dihedral of order t\_i and p\_1, p\_2, t\_1, t\_2 distinct; (2) with S the finite places v ≠ v\_1, v\_2 where π is ramified or v is ramified over ℚ, together with the places above 2 and 3, v\_1 splits in F(S ∪ {v\_2}) and v\_2 splits in F(S ∪ {v\_1}). Then for every prime p and ι : Q̄\_p ≅ ℂ, r̄\_{π,ι}(G\_F) contains a conjugate of SL\_2(𝔽\_{p^a}) for some p^a > M.


*Hypotheses and conventions.*

- Weight 0 (Fontaine–Laffaille weights {0, 1} at unramified p-adic places).


*Proof route.*

- Away from {p₁,t₁}, the local representation at v₁ is irreducible with a projective element of order t₁>5. Finite projective classification leaves PSL₂(q) or PGL₂(q), or the dihedral case. For the former, t₁ divides q−1 or q+1. At odd residual characteristic q is odd, so q=t₁−1 is impossible and q>M.
- At residual characteristic 2 both local places remain available. If q≤M, the two distinct odd primes t₁,t₂>M can divide q−1 or q+1 only by both equalling q+1, a contradiction. Thus q>M here as well. For p∈{p₁,t₁} use v₂; these p are odd.
- If the residual representation is induced from K/F, Fontaine–Laffaille and the tame local conditions bound the ramification of K by S∪{v₂}; dyadic places are already in S. The required splitting of v₁ in this exponent-two extension contradicts local irreducibility at v₁. Exchange the two places in the other case.


*Checks.*

- If the splitting hypothesis is removed, a quadratic inducing field can be nonsplit at v₁, for example unramified quadratic locally. Ramification of that quadratic field at v₁ is not forced by odd-order tame inertia.


*Source.*

- [nt26] Proposition 5.4 and proof, pp. 39–40: Shows two tamely dihedral places with the reciprocal splitting conditions force large residual image at every prime.


*Needs.* `ArithmeticGaloisRepresentations:R01.4/large-order-projective-image-criterion`, `GL2AutomorphicRepresentationsAndTransfer:R16.3/tamely-dihedral-supercuspidal`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-residual-weights`, `ArithmeticGaloisDuality:R02.3/exponent-two-ramification-field`, `ArithmeticGaloisRepresentations:R01.4/projective-image-and-its-coefficient-field`, `ArithmeticGaloisRepresentations:R01.4/linear-image-over-the-projective-trace-field`.

<a id="sp-13-twisted-tensor-hypotheses"></a>
### SP.13.3 The hypotheses S5-global and S5-local of Newton–Thorne 2026 §5

`ModularityAndLanglandsExtensionsPartII:SP.13/twisted-tensor-hypotheses` · definition

S5-global: F totally real, p ≥ 5, 0 < r < p, SP\_r, SP\_{r+1} and, when r>1, SP\_{r−1}, ι : Q̄\_p ≅ ℂ, and π RAESDC on GL\_2(𝔸\_F) with (1) det r\_{π,ι} = ε^{−1}; (2) weight 0 and π\_v an unramified twist of Steinberg for every v | p; (3) a place v\_0 with q\_{v\_0} ≡ −1 mod p and π\_{v\_0} tamely dihedral of order p; (4) for every prime l and every ι\_l, r̄\_{π,ι\_l}(G\_F) containing a conjugate of SL\_2(𝔽\_{l^a}) with l^a > max(4r, 5), and r̄\_{π,ι}(G\_F) containing a conjugate of SL\_2(𝔽\_{p^a}) with a > a\_0(p); (5) π\_v potentially unramified at every finite v ∤ p. S5-local: F, p, r, ι as before, M > p^{a\_0(p)}, π with (1)–(3); (4) a place v\_1 with q\_{v\_1} ≡ 1 mod p and π\_{v\_1} an unramified twist of Steinberg; (5) π\_v potentially unramified at every v ∤ pv\_1; (6) primes t\_1, t\_2 > M and places w\_1, w\_2 of residue characteristics p\_1, p\_2 > 3 unramified in F, with π\_{w\_i} tamely dihedral of order t\_i and p\_1, p\_2, t\_1, t\_2 distinct; (7) with H the ray class field of modulus (8)∞ and S the places v ≠ w\_1, w\_2 where π is ramified, v is ramified over ℚ or has residue characteristic 2 or 3: w\_1 splits in H·F(S) and w\_2 splits in H·F(S ∪ {w\_1}). φ\_p ∈ G\_{ℚ\_p} denotes an arithmetic Frobenius lift, acting on coefficients.


*Hypotheses and conventions.*

- SP\_m is the parent's statement (node ML.3/sp-statement).


*Proof route.*

- By SP.13/ray-class-reciprocity, (7) implies the symmetric splitting condition of SP.13/dihedral-large-image, so S5-local implies the global large-image condition (4) of S5-global with M in place of max(4r, 5).


*API.*

- `S5Global.mk` (constructor): The hypotheses S5-global on (F, p, r, ι, π).
- `S5Local.mk` (constructor): The hypotheses S5-local on (F, p, r, M, ι, π, v\_1, w\_1, w\_2, t\_1, t\_2).
- `S5Local.toGlobalImage` (other): S5-local implies large residual image at every prime with bound M (via SP.13/dihedral-large-image).
- `S5.frobeniusTwist` (data): The coefficient Frobenius φ\_p and the twisted residual representation φ\_p r̄ ⊗ Sym^{r−1}r̄.


*Unit tests.*

- `S5Global.bound_r3` (computation): For r = 3 the global image bound is l^a > max(12, 5) = 12.
- `S5Local.vone` (computation): q\_{v\_1} ≡ 1 mod p: for p = 5, q\_{v\_1} ∈ {11, 31, 41, …}.
- `S5Local.not_global` (non-example): S5-local without (7) does not imply large image at every prime: a dihedral residual representation can occur.


*Checks.*

- For r=1 the tensor is a coefficient conjugate of π. This branch is direct and invokes no SP₀; SP₁ and SP₂ are the trivial character and the given rank-two form, respectively.


*Uses.*

- Newton–Thorne 2026, Theorems 5.5 and 5.9, pp. 40–45: the two versions of the residual twisted tensor theorem
- Newton–Thorne 2026, Proposition 6.1, p. 45: the favourable local replacement produces S5-local


*Source.*

- [nt26] Theorem 5.5, hypotheses, p. 40; Theorem 5.9, hypotheses, p. 44: States the global-image hypotheses of Theorem 5.5 and the local hypotheses of Theorem 5.9 with the dihedral places and the splitting conditions.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/ray-class-reciprocity`, `ModularityAndLanglandsExtensionsPartII:SP.13/dihedral-large-image`, `ModularityAndLanglandsExtensions:ML.3/sp-statement`, `ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`.

<a id="sp-13-tensor-companions"></a>
### SP.13.4 The companions σ, σ′ and the auxiliary prime t

`ModularityAndLanglandsExtensionsPartII:SP.13/tensor-companions` · theorem

(Lemma 5.6) Under S5-global there is a RAESDC σ on GL\_2(𝔸\_F) with the properties of SP.11/ordinary-companion and r\_{π,ι} ⊗ Sym^{r−1}r\_{σ,ι} automorphic. (Lemma 5.7) Let K\_π be the coefficient field of π, K̃\_π its Galois closure, Γ\_π = Gal(K̃\_π/ℚ), B ≥ 1 with K\_π ramified only at primes < B, and φ = ιφ\_pι^{−1}. There are a prime t, ι\_t and a RAESDC σ′ with: t > max(5, 4r + 2, B), t unramified in F and all three forms unramified above t; the residual tensors of π and φπ with Sym^{r−1}σ at t absolutely irreducible over F(ζ\_t) (the cyclotomic restriction needed by BLGGT14 Theorem 4.2.1, with the commutator argument below supplying the omitted step E25); r̄\_{σ,ι\_t} ≅ r̄\_{σ′,ι\_t} and σ′\_{v\_0} an unramified Steinberg twist; r\_π ⊗ Sym^{r−1}r\_{σ′} automorphic, and r\_{φπ} ⊗ Sym^{r−1}r\_σ automorphic iff r\_{φπ} ⊗ Sym^{r−1}r\_{σ′} is; for every l < B and ι\_l, r̄\_{σ′,ι\_l} has image containing SL\_2(𝔽\_{l^a}) with l^a > max(4r, 5) and projective fixed field meeting that of γπ in degree at most 2 over F for every γ ∈ Γ\_π; choose the new auxiliary place v₁ away from p,t and all prescribed bad places, so both π and σ are unramified there (repair E28).


*Hypotheses and conventions.*

- S5-global, with the r=1 case direct. Choose t also outside the exceptional-image sets of π, φπ and σ, and unramified in the coefficient fields and F.


*Proof route.*

- For r>1 obtain σ from Lemma 3.1 and Theorem 3.2. Choose t as in Lemma 5.7. If the two residual projective fields coincided, finite projective classification would identify the adjoint representations up to coefficient Frobenius. Their Fontaine–Laffaille weights {−1,0,1} and {−2,0,2}, at an unramified t>5, exclude this. Apply the same argument to φπ.
- The projective fields therefore meet in at most a quadratic extension. Goursat gives PSL₂(q\_π)×PSL₂(q\_σ) in the joint projective image. Taking commutators and lifting the central scalar kernels gives SL₂(q\_π)×SL₂(q\_σ) in the joint linear image. One can check the last step inside SL₂×SL₂: a subgroup surjecting onto the full projective product, multiplied by the center, is the whole perfect product, and hence is itself the whole product.
- G\_{F(ζ\_t)} is normal with abelian quotient in G\_F. Its joint image contains the commutator subgroup and thus the perfect SL₂×SL₂ product just obtained. On this product Std⊗Sym^{r−1} is absolutely irreducible, since r<t≤q\_σ. This proves the needed cyclotomic irreducibility for both π and φπ, not just irreducibility over F. No extra disjointness assumption is added.
- Choose the Chebotarev place v₁ outside the finite set over p,t and the ramification of π,σ and the coefficient conjugates. The original splitting, q\_{v₁}≡−1 mod t and Frobenius-ratio conditions still have positive density. Construct σ′ with order-t dihedral type at v₁ and the original local connections elsewhere. At small l, its projective field differs from each γπ field by ramification at v₁; classification gives projective field size q≥t−1>4r, which suffices.
- The potentially diagonalizable automorphy-lifting theorem now applies over F(ζ\_t), giving the two automorphy comparisons in Lemma 5.7. The constructions are unchanged for r=1 except that the tensor and its irreducibility reduce to the first factor.


*Checks.*

- For K\_π = ℚ (rational coefficients) Γ\_π is trivial and B = 1, so the conditions at small primes are vacuous.


*Source.*

- [nt26] Lemma 5.6, p. 40; Lemma 5.7 and proof, pp. 40–42: Produces the companion σ with automorphic untwisted tensor, and an auxiliary prime t with a second companion σ′ separating the coefficient conjugates.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.11/ordinary-companion`, `ModularityAndLanglandsExtensionsPartII:SP.11/untwisted-tensor-automorphy`, `PotentialModularityAndCompatibleSystems:R24.3`, `AutomorphicGaloisRepresentations:R19.3/dimitrov-large-image`, `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`, `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`, `ArithmeticGaloisRepresentations:R01.4/large-order-projective-image-criterion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-residual-weights`, `ArithmeticGaloisRepresentations:R01.4/projective-image-and-its-coefficient-field`, `ArithmeticGaloisRepresentations:R01.4/linear-image-over-the-projective-trace-field`, `ArithmeticGaloisRepresentations:G7/adjoint-invariants-of-symmetric-powers`, `ArithmeticGaloisRepresentations:R01.4/conjugacy-of-standard-projective-images`.

<a id="sp-13-coefficient-conjugate-propagation"></a>
### SP.13.5 Propagation over the Galois group of the coefficient field

`ModularityAndLanglandsExtensionsPartII:SP.13/coefficient-conjugate-propagation` · theorem

Under S5-global with σ, σ′, B, K̃\_π, Γ\_π from SP.13/tensor-companions: (Lemma 5.8) for γ ∈ Γ\_π, a finite place w | l of K̃\_π and δ in the inertia group I\_{w/l}, if r\_{γπ,ι} ⊗ Sym^{r−1}r\_{σ′,ι} is automorphic then so is r\_{δγπ,ι} ⊗ Sym^{r−1}r\_{σ′,ι} (for δ ≠ 1 only l < B occurs; the second factor is fixed); hence r\_{γπ,ι} ⊗ Sym^{r−1}r\_{σ′,ι} is automorphic for every γ ∈ Γ\_π, since Γ\_π is generated by inertia subgroups (ℚ has no nontrivial everywhere unramified extension); and taking γ = φ, with the σ′-to-σ equivalence of Lemma 5.7 and coefficient conjugation, there is an ι-ordinary RAESDC Π on GL\_{2r}(𝔸\_F) with r\_{Π,ι} ≅ φ\_p(r\_{π,ι}) ⊗ Sym^{r−1}r\_{σ,ι}.


*Hypotheses and conventions.*

- The checks in the proof of Lemma 5.8 are for ι\_l where the source prints ι (E2); the application of Theorem 4.1 there has σ = Sym^{r−1}σ′ Steinberg at v\_0 while γπ is unramified there after base change, the case covered after the repair of E24 (SP.12/tensor-lifting-setup).


*Proof route.*

- Lemma 5.8: change the comparison embedding to one inducing w; δ acts trivially on the residue field, so r̄\_{δγπ} ≅ r̄\_{γπ} at the prime above l; apply SP.12/tensor-functoriality-lifting with σ = Sym^{r−1}σ′, and return to ι (AutomorphicGaloisRepresentationsPartII AG2.6, coefficient conjugation and independence of the embedding). Check all nine hypotheses of Theorem 4.1 at this l: the coefficient inertia gives the residual congruence; the different weights give regularity; the two projective fields give a perfect product. For its regular semisimple element choose x with order>2r−2 and choose y avoiding the at most 2r−1 forbidden ratios ±x^i; q>4r permits this. Ordinarity and Steinberg status at the other places are preserved by coefficient conjugation. The tensor-factor automorphy at one embedding transfers to the comparison embedding by AG2.6.
- Inertia generation of Γ\_π (Minkowski: ℚ has no unramified extensions).
- The final step uses SP.13/tensor-companions and the regularity of the different-weight companion σ.


*Checks.*

- If K\_π = ℚ, Γ\_π is trivial and the propagation is empty; φ acts trivially and the conclusion is the untwisted tensor.


*Source.*

- [nt26] Lemma 5.8 and proof, pp. 42–43; completion of Theorem 5.5, pp. 42–44: Propagates automorphy of the tensor through inertia elements of the coefficient field's Galois group, and deduces automorphy of the Frobenius-twisted companion tensor.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/tensor-companions`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-functoriality-lifting`, `AutomorphicGaloisRepresentationsPartII:AG2.6/tensor-automorphy-independent-of-coefficient-embedding`, `AutomorphicGaloisRepresentationsPartII:AG2.6/complex-and-local-coefficient-conjugation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

<a id="sp-13-residual-twisted-tensor-global"></a>
### SP.13.6 A residual witness for φ\_p r̄ ⊗ Sym^{r−1}r̄ under global image hypotheses (Newton–Thorne 2026 Theorem 5.5)

`ModularityAndLanglandsExtensionsPartII:SP.13/residual-twisted-tensor-global` · theorem

Under S5-global (with SP\_r, SP\_{r+1} and SP\_{r−1} when r>1) there is an ι-ordinary RAESDC Π on GL\_{2r}(𝔸\_F) with r̄\_{Π,ι} ≅ φ\_p(r̄\_{π,ι}) ⊗ Sym^{r−1}r̄\_{π,ι}. The statement is residual: it does not identify r\_{Π,ι} with a Frobenius twist of a characteristic-zero tensor of π with itself.


*Hypotheses and conventions.*

- S5-global.


*Proof route.*

- SP.13/coefficient-conjugate-propagation gives Π with r\_Π ≅ φ\_p(r\_π) ⊗ Sym^{r−1}r\_σ.
- Reduce: r̄\_σ^{ss} ≅ r̄\_π^{ss} (SP.11/ordinary-companion), so r̄\_Π ≅ φ\_p(r̄\_π) ⊗ Sym^{r−1}r̄\_π; ordinarity from that of π and σ.


*Checks.*

- For r = 1 the conclusion is a residual witness for φ\_p r̄, given by the coefficient conjugate of π.


*Source.*

- [nt26] Theorem 5.5, p. 40; proof, pp. 40–44: Produces an ordinary RAESDC representation of GL\_{2r} whose residual representation is the coefficient-Frobenius twisted tensor of r̄ with Sym^{r−1}r̄.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/coefficient-conjugate-propagation`, `ModularityAndLanglandsExtensionsPartII:SP.11/ordinary-companion`, `ModularityAndLanglandsExtensionsPartII:SP.13/twisted-tensor-hypotheses`.

<a id="sp-13-residual-twisted-tensor-local"></a>
### SP.13.7 A residual witness retaining a Steinberg place (Newton–Thorne 2026 Theorem 5.9)

`ModularityAndLanglandsExtensionsPartII:SP.13/residual-twisted-tensor-local` · theorem · planet: Residual twisted tensor witness (Theorem 5.9)

Under S5-local (with SP\_r, SP\_{r+1} and SP\_{r−1} when r>1) the residual image of r̄\_{π,ι} contains SL\_2(𝔽\_{p^a}) with p^a > M, and there is an ι-ordinary RAESDC Π on GL\_{2r}(𝔸\_F) with r̄\_{Π,ι} ≅ φ\_p(r̄\_{π,ι}) ⊗ Sym^{r−1}r̄\_{π,ι}; π remains Steinberg at v₁ for the later level raising, while no Steinberg condition at v₁ is asserted for this residual witness Π. This proves the statement the parent records in §4.23 (second paragraph).


*Hypotheses and conventions.*

- S5-local.


*Proof route.*

- Large image at every prime from SP.13/dihedral-large-image via SP.13/ray-class-reciprocity.
- Remove the extra Steinberg place: a congruent ι-ordinary RAESDC π′ of weight 0, determinant ε^{−1}, Steinberg at all p-adic places, with r\_{π,ι}|\_{G\_{F\_v}} ∼ r\_{π′,ι}|\_{G\_{F\_v}} for v ∤ pv\_1 and π′\_{v\_1} a principal series i(χ\_1 ⊗ χ\_2) with (χ\_1/χ\_2)|\_{𝒪^×} of order p (residually the same inertial semisimplification as Steinberg since q\_{v\_1} ≡ 1 mod p), preserving the dihedral types at w\_1, w\_2 (Ihara-avoidance local conditions; LocalGaloisDeformationRings R08.2).
- π′ satisfies S5-global; SP.13/residual-twisted-tensor-global gives the witness for π′, hence for π (same residual representation).


*Checks.*

- The witness is residual only, as in Theorem 5.5.


*Source.*

- [nt26] Theorem 5.9, p. 44; proof, pp. 44–45: Deduces from Theorem 5.5 the residual twisted tensor witness under the local hypotheses, replacing the Steinberg place by a congruent principal series.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/residual-twisted-tensor-global`, `ModularityAndLanglandsExtensionsPartII:SP.13/dihedral-large-image`, `ModularityAndLanglandsExtensionsPartII:SP.13/ray-class-reciprocity`, `LocalGaloisDeformationRings:R08.2/ihara-avoidance-components`, `PotentialModularityAndCompatibleSystems:R24.3`, `PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation`.

<a id="sp-13-ordinary-replacement"></a>
### SP.13.8 Ordinary replacement with a Frobenius-tensor residual witness (Newton–Thorne 2026 Corollary 6.2)

`ModularityAndLanglandsExtensionsPartII:SP.13/ordinary-replacement` · theorem

For F totally real, π non-CM RAESDC on GL\_2(𝔸\_F), p ≥ 5, 0 < r < p and SP\_r, SP\_{r+1} and SP\_{r−1} when r>1, there are a soluble totally real E/F, ι and RAESDC π′ over E with: Sym^{p+r−1}r\_{π,ι} automorphic iff Sym^{p+r−1}r\_{π′,ι} is; π′ of weight zero and an unramified Steinberg twist at every p-adic place of E (the source prints 'of F', E5); r̄\_{π′,ι} with image containing SL\_2(𝔽\_{p^a}), a > a\_0(p); an unramified Steinberg twist at some v\_1 ∤ p; and an ι-ordinary RAESDC representation of GL\_{2r}(𝔸\_E) whose residual representation is φ\_p(r̄\_{π′,ι}) ⊗ Sym^{r−1}r̄\_{π′,ι}. The intermediate claim of the proof of Proposition 6.1 is part of this node: there are ι, a soluble totally real E/F and RAESDC π\_0 over E of weight 0, Steinberg at all v | p, det r\_{π\_0} = ε^{−1}, residual image containing SL\_2(𝔽\_{p^a}) with a > a\_0(p), Steinberg at some v\_1 ∤ p with q\_{v\_1} ≡ 1 mod p, potentially unramified away from pv\_1, and Sym^{p+r−1}r\_π automorphic iff Sym^{p+r−1}r\_{π\_0} is.


*Hypotheses and conventions.*

- Proposition 6.1 (the favourable local replacement with all eight conditions) is stated in the parent's §4.22 (node ML.3/clozel-thorne-reductions); this node uses it.


*Proof route.*

- Intermediate claim: a prime q from Dimitrov's Proposition 3.8; an everywhere unramified finite-order character χ of G\_E with χ² det r\_{π,ι\_q} = ε^{−1} (the obstruction to a square root of the totally even character ε det r\_{π,ι\_q} is a 2-torsion class in Br(F), killed by local conditions on E); π\_a from Barnet-Lamb–Gee–Geraghty Theorem 6.1.9; a prime t prime to the conductor of π\_a (E8) with tamely dihedral level raising.
- Proposition 6.1 (parent §4.22) then gives π′ with conditions (1)–(8), hence S5-local; SP.13/residual-twisted-tensor-local gives the residual witness.


*Checks.*

- For r = 1 the residual witness is φ\_p r̄\_{π′}, given by a coefficient conjugate.


*Source.*

- [nt26] proof of Proposition 6.1, intermediate claim, pp. 46–48; Corollary 6.2, p. 49: Proves the intermediate replacement step of Proposition 6.1 and deduces Corollary 6.2: an ordinary replacement over a soluble extension with a residual witness for the twisted tensor.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/residual-twisted-tensor-local`, `ModularityAndLanglandsExtensions:ML.3/clozel-thorne-reductions`, `AutomorphicGaloisRepresentations:R19.3/dimitrov-large-image`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/prescribed-type-modular-lift`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-steinberg-lift`, `PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`.

<a id="sp-13-two-block-symmetric-lifting"></a>
### SP.13.9 Symmetric-power lifting from two ordinary residual blocks (Newton–Thorne 2026 Proposition 6.3; Thorne 2024 Proposition 7.4)

`ModularityAndLanglandsExtensionsPartII:SP.13/two-block-symmetric-lifting` · theorem · planet: Sym^{p+r−1} from two residual blocks

Let F be totally real, p ≥ 5, 0 < r < p and π RAESDC on GL\_2(𝔸\_F), ι-ordinary for some ι with residual image containing SL\_2(𝔽\_{p^a}), a > a\_0(p), of weight zero, with an unramified Steinberg twist at a place v\_1 ∤ p. Suppose there are ι-ordinary RAESDC π\_1 on GL\_{p−r}(𝔸\_F) and π\_2 on GL\_{2r}(𝔸\_F) with residual representations Sym^{p−r−1}r̄\_{π,ι} and φ\_p(r̄\_{π,ι}) ⊗ Sym^{r−1}r̄\_{π,ι}. Then there is an ι-ordinary RAESDC Π on GL\_{p+r}(𝔸\_F) with r\_{Π,ι} ≅ Sym^{p+r−1}r\_{π,ι}. These residual witnesses replace the hypotheses of Thorne 2024 Proposition 7.4 that Sym^{r−1}r\_π and Sym^{p−r−1}r\_π are automorphic and that tensor functoriality TP\_r holds.


*Hypotheses and conventions.*

- The residual decomposition (Sym^{p+r−1}r̄)^{ss} ≅ (φ\_p r̄ ⊗ Sym^{r−1}r̄) ⊕ (det r̄)^r ⊗ Sym^{p−r−1}r̄ for 0 < r < p (ArithmeticGaloisRepresentations G7, mod-p Clebsch–Gordan decompositions (b)).
- In the residually reducible inputs, primitive means weakly primitive in the source sense, tested over the algebraic closure of the residual field. Choose a common finite splitting field for every subgroup of the residual image before fixing integral coefficient rings. The PL.6 normalization coefficient condition then holds; no implication from arbitrary finite-field primitivity to geometric primitivity is assumed.


*Proof route.*

- Pass to a CM quadratic extension with the conditions of Thorne's Proposition 7.4 (soluble base change).
- Twist the witnesses into conjugate self-dual cuspidal σ\_1, σ\_2 with σ\_2 Steinberg at the place above v\_1 (Khare–Wintenberger method, Thorne 2012 Theorems 9.1, 10.2), so Σ = σ\_1 ⊞ σ\_2 is regular algebraic, ι-ordinary of weight 0 and r̄\_Σ ≅ (Sym^{p+r−1}r̄)^{ss}.
- SP.6/thorne-steinberg-level-raising gives a cuspidal ι-ordinary Π\_0 Steinberg at the place above v\_1 with the same residual representation (hypothesis (3) of Theorem 6.11 from an element diag(t, t^{−1}) with 1, t², …, t^{2(p+r−1)} distinct, which exists since a ≥ 3).
- Thorne 2024 Theorem 7.5 (residually reducible ordinary lifting with a Steinberg place; PotentialAutomorphyInfrastructurePartII PL.7) shows Sym^{p+r−1}r\_π automorphic; descend.


*Checks.*

- For p = 5, r = 1: blocks Sym³r̄ (rank 4) and φ\_5 r̄ (rank 2), giving Sym^5 (rank 6).


*Source.*

- [nt26] Proposition 6.3 and proof, p. 49: Deduces automorphy of Sym^{p+r−1} from ordinary residual witnesses for the two blocks, via Thorne 2024 Proposition 7.4 and Theorem 7.5 without TP\_r.
- [th24] Proposition 7.4 and proof, pp. 43–44; Theorem 7.5, p. 44: Proves residual automorphy and level raising for Sym^{p+r−1} from the two blocks via Theorem 6.11, and states the strengthened residually reducible lifting theorem.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.6/thorne-steinberg-level-raising`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-lifting`, `PotentialAutomorphyInfrastructurePartII:PL.7/source-primitive-ant-finiteness`, `ArithmeticGaloisRepresentations:G7/mod-p-clebsch-gordan-decompositions`, `ArithmeticGaloisRepresentations:G7/adequacy-of-symmetric-powers`, `PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`, `PotentialAutomorphyInfrastructurePartII:PL.0/induction-descent`, `PotentialAutomorphyInfrastructurePartII:PL.6/weak-primitivity-splitting-field-base-change`.

<a id="sp-13-thorne-induction-step"></a>
### SP.13.10 Thorne's induction step and the small cases (Thorne 2024 Theorems 7.1, 7.6, Corollary 7.2)

`ModularityAndLanglandsExtensionsPartII:SP.13/thorne-induction-step` · theorem

Let p ≥ 5 and 0 < r < p. (Theorem 7.6) Assume SP\_{p−r}, SP\_r and TP\_r (tensor functoriality GL\_2 × GL\_r → GL\_{2r} for RAECSDC representations over CM fields with irreducible Hodge–Tate regular tensor). If (π, χ) is RAESDC on GL\_2(𝔸\_{F⁺}), ι-ordinary with residual image containing SL\_2(𝔽\_{p^a}) for some a > a\_0(p), of weight 0, with an unramified Steinberg twist at some v\_0 ∤ p, then Sym^{p+r−1}π exists as an ι-ordinary cuspidal RAESDC Π. (Theorem 7.1) Hence SP\_{p−r} + SP\_r + TP\_r ⇒ SP\_{p+r}. (Corollary 7.2) SP\_n holds for n = 1, …, 10 and for even n = 12, …, 26; and TP\_r for all r implies SP\_n for all n.


*Hypotheses and conventions.*

- TP\_r is known for r = 1, 2, 3 (Ramakrishnan, Kim–Shahidi), and SP\_n for n ≤ 5 (parent ML.3/low-rank-symmetric-powers).


*Proof route.*

- Theorem 7.6 from Thorne's Proposition 7.4 (the TP\_r version of SP.13/two-block-symmetric-lifting) and Theorem 7.5 after soluble base change.
- Theorem 7.1 from Theorem 7.6 by the reductions of Clozel–Thorne (parent ML.3/clozel-thorne-reductions, which also records Thorne 2024 Theorem 8.1 and Proposition 8.3 for the passage from essentially square-integrable to regular algebraic π).
- Corollary 7.2(1) from TP\_1, TP\_2, TP\_3: SP\_{p−1} ⇒ SP\_{p+1}, SP\_{p−2} ⇒ SP\_{p+2}, SP\_{p−3} ⇒ SP\_{p+3} for p = 5, …, 23; (2) by Bertrand's postulate as in SP.13/sp-induction.


*Checks.*

- p = 7, r = 1: SP\_6 ⇒ SP\_8 using TP\_1; p = 7, r = 3: SP\_4 + SP\_3 + TP\_3 ⇒ SP\_{10}.


*Source.*

- [th24] Theorem 7.1, Corollary 7.2 and Lemma 7.3, p. 42; Theorem 7.6, p. 45; proofs, pp. 42–47: Proves the implication SP\_{p−r} + SP\_r + TP\_r ⇒ SP\_{p+r}, the unconditional small cases and the conditional general case.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/two-block-symmetric-lifting`, `ModularityAndLanglandsExtensions:ML.3/low-rank-symmetric-powers`, `ModularityAndLanglandsExtensions:ML.3/ramakrishnan-tensor-product`, `ModularityAndLanglandsExtensions:ML.3/kim-shahidi-sym3`, `ModularityAndLanglandsExtensions:ML.3/clozel-thorne-reductions`, `ModularityAndLanglandsExtensions:ML.3/sp-statement`.

<a id="sp-13-sp-induction"></a>
### SP.13.11 The induction proving SP\_n for all n (Newton–Thorne 2026 Theorem 6.4)

`ModularityAndLanglandsExtensionsPartII:SP.13/sp-induction` · theorem · planet: SP\_n for all n (NT 2026 Theorem 6.4)

SP\_n holds for every n ≥ 1: for every totally real F and every non-CM RAESDC π on GL\_2(𝔸\_F), there is a RAESDC Π on GL\_n(𝔸\_F) with r\_{Π,ι} ≅ Sym^{n−1}r\_{π,ι} for every ι. This proves the statement the parent records in §4.30 (node ML.3/all-regular-symmetric-powers), and, through the parent's §§4.35–4.36, Newton–Thorne 2026 Theorem A.


*Hypotheses and conventions.*

- Induction on n, with base cases n ≤ 5 (parent ML.3/low-rank-symmetric-powers).


*Proof route.*

- For n>5 choose a prime p with n/2<p<n and write n=p+r with 0<r<p. The positive indices r,r+1,p−r are below n, and so is r−1 when r>1. Apply induction at these indices. When r=1 use the direct coefficient-conjugate tensor branch; SP₀ is neither defined nor needed.
- By the parent's one-prime criterion (§4.15) it suffices to prove automorphy of Sym^{p+r−1}r\_{π,ι} for one ι.
- SP.13/ordinary-replacement gives π′ over a soluble E with the residual witness for φ\_p r̄ ⊗ Sym^{r−1}r̄; SP\_{p−r} gives a witness for Sym^{p−r−1}r̄ (ordinary by the Steinberg-at-p condition).
- SP.13/two-block-symmetric-lifting gives Sym^{p+r−1}r\_{π′} automorphic, hence Sym^{p+r−1}r\_π by the equivalence of Corollary 6.2.


*Checks.*

- n=6: choose p=5,r=1. The direct rank-one tensor branch needs SP₁,SP₂ and SP₄, with no SP₀.
- n=7: choose p=5,r=2. The induction uses SP₁,SP₂,SP₃ and SP₃.
- n=12: choose p=7,r=5. The induction uses SP₄,SP₅,SP₆ and SP₂.


*Source.*

- [nt26] Theorem 6.4 and proof, p. 50: Proves SP\_n for all n by Bertrand's postulate and induction, from Corollary 6.2 and Proposition 6.3.


*Needs.* `ModularityAndLanglandsExtensionsPartII:SP.13/ordinary-replacement`, `ModularityAndLanglandsExtensionsPartII:SP.13/two-block-symmetric-lifting`, `ModularityAndLanglandsExtensions:ML.3/low-rank-symmetric-powers`, `ModularityAndLanglandsExtensions:ML.3/one-prime-criterion`, `ModularityAndLanglandsExtensions:ML.3/sp-statement`.

## Coverage

- **SP.0 — planned**: Lemma-level decomposition of Conrad's base change of irreducible components (Conrad 1999, Theorem 3.4.2) inside AdicSpacesPartIIPartII RZ.1.
- **SP.1 — planned**: Lemma-level decomposition of the tangent-space argument (the inclusion of ℰ\_n in the trianguline locus near z\_n) once the parent's §4.3 machinery is planned at lemma level.
- **SP.2 — planned**: Lemma-level steps of Lemma 2.34 (Chevalley's theorem and finite étaleness of restriction of character spaces).
- **SP.3 — planned**: Lemma-level decomposition of Buzzard–Kilford's overconvergent computation (Buzzard–Kilford §§2–4) and of the transfer to the cuspidal eigencurve (Pilloni §6; Buzzard–Calegari Lemma 7.4).
- **SP.4 — planned**: Gap G1 (Deligne–Lusztig theory) and gap G4 (Mœglin's explicit packets).
- **SP.5 — planned**: Lemma-level decomposition of the stabilised trace formula identities (4.6.3)–(4.6.5) of Newton–Thorne I and of Clozel–Thorne III Theorem 3.8.
- **SP.6 — planned**: Gap G3 (Thorne 2024 §§3–5). Inherited/requested supplier boundaries G7; the exact contracts and consumers are listed in requests.
- **SP.7 — planned**: Gap G2 (E21) and gap G5 (GL\_2 inputs).
- **SP.8 — planned**: Lemma-level patching steps of Proposition 8.3 (Kisin, Thorne 2016, Khare–Thorne inputs). The NTI seed proof route inherits G2; the SP.13 endpoint is an independent method.
- **SP.9 — planned**: Lemma-level decomposition of the patching constructions (choice of framings, the ring 𝒯, Newton–Thorne 2020 Lemma 2.16). Inherited/requested supplier boundaries G7; the exact contracts and consumers are listed in requests.
- **SP.10 — planned**: Lemma-level decomposition of the dimension count in Lemma 3.4 (slope-(0, 1) parts at level U\_0(p³)). The NTI seed proof route inherits G2; the SP.13 endpoint is an independent method.
- **SP.11 — planned**: Lemma-level decomposition of Lemma 3.4 (the soluble extensions F\_2/F\_1/F) and of the graph argument. Inherited/requested supplier boundaries G7; the exact contracts and consumers are listed in requests.
- **SP.12 — planned**: Lemma-level decomposition of the patching propositions 4.8–4.9. Inherited/requested supplier boundaries G7; the exact contracts and consumers are listed in requests.
- **SP.13 — planned**: G6 is resolved in the tensor-companion proof. Implementation still imports the explicit SP.11–SP.12 supplier boundaries G7; retain the r=1 branch without SP₀.

## Gaps

### G1. Deligne–Lusztig theory and the modular representation theory of U\_3(𝔽\_q) have no owner

Newton–Thorne I §1.8 uses Deligne–Lusztig induction for the anisotropic tori of U\_3 and GL\_3, Lusztig's cuspidal unipotent representation, Dudas–Malle's modular irreducibility, Geck's decomposition numbers and Kazhdan–Varshavsky's transfer of Deligne–Lusztig functions. No atlas roadmap plans these, and TauCetiRoadmap CharacterTheory Layer 9 treats GL\_2(𝔽\_q) only. The SP.4 nodes state exactly the special cases used and are cited inputs until an owner exists (request at CharacterTheory Layer 9 for a Part II).


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals
- ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types
- ModularityAndLanglandsExtensionsPartII:SP.4/type-transfer
### G2. The odd case of Newton–Thorne I Theorem 7.1 (Proposition 7.4) has a gap (E21)

In NTI arXiv v3 Proposition 7.4, p.87, the proposed GL₂ block fails conjugate self-duality by δ\_{K/ℚ}|\_{G\_{F₀}}, so its use of Theorem 4.1 is unsupported (atlas PAPER-NEWTON-THORNE-21/E21, scoped here to v3). The rank-one extension repairs the GL₁ range but does not repair this GL₂ failure, even for n=3. Within the CM seed construction only the powers-of-two route is independent of it. Low-rank symmetric-power endpoint theorems for n≤5 do not provide all the residual, field and Steinberg data of Theorem 7.1. Supply a conjugate-self-dual GL₂ block with the required residual representation and types, or a different construction of that seed. The separate SP.13 method proves the endpoint without repairing this intermediate seed route.


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.7/odd-rank-residually-cm
- ModularityAndLanglandsExtensionsPartII:SP.7/residually-cm-steinberg
- ModularityAndLanglandsExtensionsPartII:SP.7/weight-five-symmetric-power
- ModularityAndLanglandsExtensionsPartII:SP.7/theorem-e
- ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-ramified-automorphy
- ModularityAndLanglandsExtensionsPartII:SP.10/weight-two-case
- ModularityAndLanglandsExtensionsPartII:SP.10/theorem-a-assembly
### G3. Thorne 2024 §§3–5 (p-adic automorphic forms and the Drinfeld half-space) have no owner

Thorne arXiv v2 Theorem 6.11 (pp.39–41) uses Theorem 3.4 (Steinberg detection), Theorem 4.5 (even-multiplicity weights), Theorem 5.2 and Corollary 6.3/Proposition 6.5 on p-adic automorphic forms. The concentration statement is for the Hecke-localized derived tensor RΓ\_c(Ω^{n−1},k) ⊗^L\_{k[GL\_n(F\_{w₀})⁰]} A\_m under residual genericity, concentrated in degree n−1. Bare compactly supported Drinfeld cohomology is not asserted to be concentrated there. These inputs still need an owner; R4 proposes the boundary.


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.6/thorne-steinberg-level-raising
### G4. Mœglin's explicit description of tempered packets of p-adic unitary groups

ML.4 and ET.7a provide classification and endoscopic comparison, but not the required explicit Mœglin Jacquet/socle calculation (2007 Lemme 5.4, Théorème 5.7 and Proposition 5.5, as used by CTIII §§3.3–3.5, pp.21–27). In particular the uniqueness assertion after CTIII (3.9), p.26, cannot simply be repeated: Y is already a submodule with the same exponent. A proof must count the full socle and isolate the other constituent before assigning the Z/W sign. The packet retains that explicit calculation as a proof boundary rather than calling the repair immediate.


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets
- ModularityAndLanglandsExtensionsPartII:SP.4/ct-packet-signs
### G5. GL\_2 inputs of Newton–Thorne I §7 and Clozel–Thorne III §6

Diamond 1989 Corollary 6.9 (level raising) is owned by SerreWeightAndLevelOptimisation R20.2 (Diamond's level-raising criterion). Diamond–Taylor 1994 Theorem A (prescribed supercuspidal or Steinberg components at non-optimal level), Edixhoven 1992 Theorem 2.6 (ordinarity of forms with reducible residual representation in low weight) and Clozel–Thorne II (Annals 2015) Proposition 3.10 with the reductions of its §6 have no atlas owner; they are cited inputs.


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.7/odd-rank-residually-cm
- ModularityAndLanglandsExtensionsPartII:SP.7/weight-five-symmetric-power
- ModularityAndLanglandsExtensionsPartII:SP.7/ct-symmetric-power-l-plus-one
### G7. Inherited and requested supplier extensions for finiteness and patching

The Maire antiunit rank input is a source-check boundary in ArithmeticGaloisDuality R02.3. PL.7/auxiliary-place-ant-finiteness records a nonscalar unobstructed local-ring and Hecke-level comparison gap; NT26 needs its geometric weak-primitive variant. The exact BBM finite-flat lattice comparison, perfect-subgroup tensor Taylor–Wiles prime selection, and formal torus invariant contract are requested above, beyond what the cited R07.4, G7 residual-enormous and R03.5 statements currently provide. PL.7 sum-of-characters finiteness also inherits its separately recorded rank-one ordinary-finiteness boundary. These are imported proof obligations, not locally established results. Geometric primitivity and the initial subgroup-splitting coefficient convention discharge the separate PL.6 finite-field normalization concern for these applications; arbitrary finite-field primitivity alone would not.


*Needed by.*

- ModularityAndLanglandsExtensionsPartII:SP.6/nt-generic-prime
- ModularityAndLanglandsExtensionsPartII:SP.6/nt-steinberg-level-raising
- ModularityAndLanglandsExtensionsPartII:SP.11/tensor-section-3-hypotheses
- ModularityAndLanglandsExtensionsPartII:SP.11/steinberg-finiteness-and-lift
- ModularityAndLanglandsExtensionsPartII:SP.11/generic-components
- ModularityAndLanglandsExtensionsPartII:SP.11/scalar-generic-r-equals-t
- ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-tensor-map
- ModularityAndLanglandsExtensionsPartII:SP.12/tensor-map
- ModularityAndLanglandsExtensionsPartII:SP.12/tensor-taylor-wiles-data
- ModularityAndLanglandsExtensionsPartII:SP.12/tensor-patching
- ModularityAndLanglandsExtensionsPartII:SP.9/support-argument

## Requests to other roadmaps

- **`ArithmeticGaloisRepresentations:R01.2`**: Cited as it stands: conductors of Galois and Weil–Deligne representations and their behaviour under reduction, used for the semisimple conductor and Lemma 3.3 of Newton–Thorne II. Needed by `ModularityAndLanglandsExtensionsPartII:SP.10/semisimple-conductor`.
- **`DeformationAndDerivedPatchingAlgebra:R03.5`**: Existing patching modules are imported from R03.5. The formal torus invariant statement is a distinct extension requested at R03.6 below; R03.5 alone is not cited as a proof of Khare–Wintenberger II Proposition 2.5. Needed by `ModularityAndLanglandsExtensionsPartII:SP.9/support-argument`.
- **`DeformationAndDerivedPatchingAlgebra:R03.6`**: Use the existing support/commutative-algebra statements. In addition supply the exact Khare–Wintenberger formal-action contract used by NTII Propositions 2.8–2.9 and NT26 Proposition 4.9: a free formal torus action on Sp R′, an equivariant map δ for the square action, fibre Sp R=δ⁻¹(1), the formal 2-torsion torsor Sp R→Sp R^{inv}, actions on both patched modules, and transitivity on local components. Do not infer a Spec torsor from the formal statement. Needed by `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-patching`, `ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-congruence`, `ModularityAndLanglandsExtensionsPartII:SP.9/support-argument`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`.
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`**: Extension beyond the existing Breuil–Kisin classification: the Berthelot–Breen–Messing finite-flat generic-fibre comparison in the form used by NTII Lemma 2.2 and NT26 Lemma 4.2. Every finite-flat Artinian rank-two point of Hodge type {0,1} is a quotient of a Galois-stable lattice in a crystalline Q\_p-representation of those weights; require functorial coefficient quotients and compatibility with fixed tensor and symmetric powers. This precise statement is requested, not claimed to be the current R07.4 statement. Needed by `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-map`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-power-tensor-map`.
- **`GL2ModularityLifting:R22.2`**: Cited as it stands: quaternionic Taylor–Wiles modules for GL\_2 over totally real fields (the H\_D side of the patching in Newton–Thorne II and 2026). Needed by `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-lifting-setup`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`.
- **`GL2ModularityLifting:R22.3`**: Use the existing GL₂ patching template. Also request the unobstructed auxiliary-prime choice for NTI Proposition 8.3 (pp.93–97), as supplied there by Weston, together with the slope-(0,1) dimension count of NTII Lemma 3.4 (pp.20–22). Generic smoothness alone does not supply the required modular form and its prescribed local components. Needed by `ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences`, `ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-congruence`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`.
- **`GL2ModularityLifting:R22.6`**: Cited as it stands: the dyadic (p = 2) and real-place modifications of patching (Khare–Wintenberger twisting actions). Needed by `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic`.
- **`LocalGaloisDeformationRings:L7`**: Use the current prime-to-p local-ring statements, including partition and Steinberg rings; Fontaine–Laffaille is a p-adic input from its own R07/R08.6 owner. This request does not place Fontaine–Laffaille theory in a layer for places away from p. Needed by `ModularityAndLanglandsExtensionsPartII:SP.8/n-regular-congruence`.
- **`ModularityAndLanglandsExtensions:ML.3`**: Existing roadmap (TauCetiRoadmap pull request #1180, the ported ModularityAndLanglandsExtensions package), cited as it stands: §4.3 (definite-unitary eigenvarieties ℰ\_n(τ̄) with weight map, Hecke pseudocharacter and closed realization in 𝒳\_ps × 𝒯\_n; Emerton's locally analytic Jacquet functor; family triangulations; trianguline deformations and the global trianguline tangent bound of Newton–Thorne I Proposition 2.11; the symmetric-power character and pseudocharacter maps σ\_{n,p}, σ\_{n,g}; classicality of non-critical n-regular points, Newton–Thorne I Lemma 2.30), §4.4 (Anastassiades–Thorne's level raising for GL\_{2n} of unitary type, Theorem 5.1, and the odd-rank type statement), §4.15 (one prime suffices) and §4.22 (Clozel–Thorne reductions with Newton–Thorne 2026 Proposition 6.1 and Thorne 2024 §8). This Part II supplies the proofs of the import-contract theorems the parent states in §§4.5–4.11, 4.23 and the proof routes of §§4.12, 4.20, 4.29–4.31; it does not restate the §4.3 machinery. Needed by `ModularityAndLanglandsExtensionsPartII:SP.1/automorphy-along-components`, `ModularityAndLanglandsExtensionsPartII:SP.1/continuation-noncritical`, `ModularityAndLanglandsExtensionsPartII:SP.1/continuation-ordinary`, `ModularityAndLanglandsExtensionsPartII:SP.2/eigencurve-base-change-morphism`, `ModularityAndLanglandsExtensionsPartII:SP.7/residually-cm-steinberg`.
- **`OrdinaryAutomorphicFormsAndModularityLifting:R21.2`**: Cited as it stands: Hida control and finite flatness, as stated in that roadmap's layer. Needed by `ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences`.
- **`PotentialModularityAndCompatibleSystems:R24.3`**: Cited as it stands: Prescribed local lifts, as stated in that roadmap's layer. Needed by `ModularityAndLanglandsExtensionsPartII:SP.10/making-seasoned`, `ModularityAndLanglandsExtensionsPartII:SP.10/nonordinary-weight-two-congruences`, `ModularityAndLanglandsExtensionsPartII:SP.10/theorem-a-assembly`, `ModularityAndLanglandsExtensionsPartII:SP.13/residual-twisted-tensor-local`, `ModularityAndLanglandsExtensionsPartII:SP.13/tensor-companions`.
- **`ReductiveGroupsPartII:RG2.4`**: Existing Tau Ceti roadmap (TauCetiRoadmap main, ReductiveGroupsPartII), cited as it stands: RG2.4 affine root systems, parahorics and Iwahori subgroups of quasi-split groups, used for the affine Weyl group of ramified U\_{2k+1}. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/iwahori-hecke-sp2k`.
- **`SmoothRepresentationsOfLocalGroups:SR.1`**: Existing Tau Ceti roadmap (TauCetiRoadmap main, SmoothRepresentationsOfLocalGroups), cited as it stands: SR.1 Hecke algebras over rings, Iwahori decompositions and the Iwahori–Matsumoto and Bernstein presentations of the Iwahori–Hecke algebra (SR.1.4–SR.1.5), used for H\_B of ramified U\_{2k+1} and Sp\_{2k} and for the anti-involution and Bernstein subalgebra. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/iwahori-hecke-sp2k`, `ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures`, `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`.
- **`SmoothRepresentationsOfLocalGroups:SR.2`**: Existing Tau Ceti roadmap, cited as it stands: SR.2 smooth and compact induction, Jacquet functors and Iwahori invariants (SR.2.1–SR.2.3), used for compact inductions of depth-zero types and normalised Jacquet modules. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/ct-packet-signs`, `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`, `ModularityAndLanglandsExtensionsPartII:SP.4/kazhdan-lusztig-modules`.
- **`SmoothRepresentationsOfLocalGroups:SR.3`**: Existing Tau Ceti roadmap, cited as it stands: SR.3 cuspidal support, the Bernstein decomposition, tempered representations and the Steinberg representation (SR.3.1–SR.3.4), used for supercuspidality and cuspidal supports at inert places. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`, `ModularityAndLanglandsExtensionsPartII:SP.4/stable-base-change-packets`, `ModularityAndLanglandsExtensionsPartII:SP.6/thorne-steinberg-level-raising`.
- **`SmoothRepresentationsOfLocalGroups:SR.4`**: Existing Tau Ceti roadmap, cited as it stands: SR.4 Satake and unramified unitary groups (SR.4.4), used with SR.1 for the ramified unitary Iwahori–Hecke algebra. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/iwahori-hecke-sp2k`.
- **`SmoothRepresentationsOfLocalGroups:SR.5`**: Import existing integral local-family and coefficient-change notions. Extension needed: coefficient change for the specific finite cuspidal depth-zero types, compactly induced types and Iwahori lattices of NTI §1.8 and CTIII §2, respecting reduction and duality. The particular Deligne–Lusztig and modular U₃ facts remain G1, rather than being claimed as existing co-Whittaker-family results. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/kl-integral-structures`, `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`**: Existing Tau Ceti layer, cited as it stands: Layer 10: Dirichlet-density Chebotarev. Needed by `ModularityAndLanglandsExtensionsPartII:SP.10/making-seasoned`, `ModularityAndLanglandsExtensionsPartII:SP.6/nt-schur-primitive-base-change`, `ModularityAndLanglandsExtensionsPartII:SP.7/odd-rank-residually-cm`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**: Existing Tau Ceti layer, cited as it stands: Layer 11: the global class formation and global Artin reciprocity. Needed by `ModularityAndLanglandsExtensionsPartII:SP.2/trivialising-character-families`, `ModularityAndLanglandsExtensionsPartII:SP.5/ct-conjugate-symplectic-character`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`**: Existing Tau Ceti layer, cited as it stands: Layer 12: separate arithmetic global existence, the norm index, and the global correspondence. Needed by `ModularityAndLanglandsExtensionsPartII:SP.13/ray-class-reciprocity`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`**: Existing Tau Ceti layer, cited as it stands: Layer 13: norm theorems and class fields. Needed by `ModularityAndLanglandsExtensionsPartII:SP.13/coefficient-conjugate-propagation`.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity`**: Existing Tau Ceti layer, cited as it stands: Layer 14: Hilbert reciprocity and quadratic reciprocity. Needed by `ModularityAndLanglandsExtensionsPartII:SP.13/ray-class-reciprocity`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`**: Existing Tau Ceti layer, cited as it stands: Layer 3: the character table, idempotents, completeness, second orthogonality. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-9-the-representation-theory-of-gl₂𝔽_q`**: Existing Tau Ceti layer, cited as it stands: Layer 9: the representation theory of GL₂(𝔽\_q). Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`.
- **`tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-9-the-representation-theory-of-gl₂𝔽_q`**: Part II of RepresentationTheory/CharacterTheory (not yet designed): Deligne–Lusztig induction R\_T^G θ for finite reductive groups, with irreducibility of ±R\_T^G θ for θ in general position, Lusztig's cuspidal unipotent character of U\_3(𝔽\_q), transitivity of Deligne–Lusztig induction, Brauer characters in non-defining characteristic for U\_3 (Geck 1990 Theorem 4.2), modular irreducibility of cuspidal unipotent characters (Dudas–Malle 2018), and Kazhdan–Varshavsky's endoscopic transfer of Deligne–Lusztig functions (Theorem 2.2.6). The existing Layer 9 covers GL\_2(𝔽\_q) only. Needed by `ModularityAndLanglandsExtensionsPartII:SP.4/depth-zero-cuspidals`, `ModularityAndLanglandsExtensionsPartII:SP.4/level-raising-types`, `ModularityAndLanglandsExtensionsPartII:SP.4/type-transfer`.
- **`GlobalGaloisDeformations:G7`**: Tensor-specific Taylor–Wiles prime selection (NT26 §4, pp.29–30 and Propositions 4.8–4.9, pp.34–35): rank-two residual large image plus a perfect subgroup of the rank-2r tensor image containing a regular semisimple element, selecting arbitrarily deep q\_v≡1 mod p^N places with 2r distinct ordered tensor eigenvalues and the rank-two dual-Selmer control needed for simultaneous patching. Also retain NTII Lemmas 2.7,2.9 under p^a>max(5,2n−1), including p=2. These bounds are not the existing residual-enormous prime theorem, and characteristic-zero enormousness serves a different purpose. Needed by `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-taylor-wiles-data`, `ModularityAndLanglandsExtensionsPartII:SP.12/tensor-patching`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-odd`, `ModularityAndLanglandsExtensionsPartII:SP.9/symmetric-patching-dyadic`.
- **`PotentialAutomorphyInfrastructurePartII:PL.7`**: Use the current weak-source-primitive lifting/finiteness nodes. Extend auxiliary-place-ant-finiteness to the geometric weak-primitive setting of NT26 Proposition 3.9 (pp.20–21), with PL.6/weak-primitive-generic-hecke-kernel and an initial common subgroup splitting field. Preserve its explicit nonscalar unobstructed auxiliary local-ring/Hecke-level comparison gap. Separate the two finiteness calls, before and after relaxing the extra Steinberg place. Needed by `ModularityAndLanglandsExtensionsPartII:SP.11/steinberg-finiteness-and-lift`.

## Restructuring proposals

### R1: split

The design brief carried ten continuations of ModularityAndLanglandsExtensions in three independent directions: (a) the proof of symmetric power functoriality (Newton–Thorne I, II and 2026, Clozel–Thorne III, Thorne 2024; routes SymmetricPowersByAnalyticContinuation, SymmetricPowersByUnitaryLevelRaising, SymmetricPowerAutomorphyLifting, SymmetricPowersByTensorFunctorialityLifting); (b) level-one change of weight and cuspidal cohomology of GL\_n(ℤ) (Boxer–Calegari–Gee 2025; route LevelOneCuspidalCohomologyGLn, 39 items), which consumes the endpoints of (a) but uses a different method (Bellovin–Gee deformation rings, Harris's tensor product trick, relative Lie algebra cohomology); (c) the explicit local theory and Galois representations of GSp\_4 (BCGP 2018 and 2025; route GSp4LocalLanglandsAndGaloisRepresentations, 30 items), unrelated to (a).

This roadmap plans (a) only, in layers SP.0–SP.13 (the four symmetric-power routes are mutually dependent: Newton–Thorne 2026 §4 reuses the Newton–Thorne II patching template and Thorne 2024's level raising, and Newton–Thorne I imports Theorem E from its own level-raising part). Direction (b) becomes its own design job DESIGN-LevelOneCuspidalCohomologyGLn (a Part II of ModularityAndLanglandsExtensions importing SP.13/sp-induction and the parent's §4.12, with the 39 items of PAPER-BOXER-CALEGARI-GEE-25 route 1). Direction (c) becomes DESIGN-GSp4LocalLanglandsAndGaloisRepresentations (a Part II of ModularityAndLanglandsExtensions importing ML.4's Gan–Takeda correspondence and Arthur classification, with the 23 items of PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route 4 and the 7 items of PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 35); the requests already parked at ML.4 and ML.5 by AbelianSurfacesPotentialModularity should be re-pointed to it.
### R2: rescope

The parent's packet keeps eight ML.3 nodes as import contracts whose methods it assigns to this Part II (its gap 'Newton–Thorne and Clozel–Thorne methods are owned by proposed Part IIs'), and its package (TauCetiRoadmap PR #1180) states the same theorems in §§4.5–4.11, 4.23 with one-line proof routes.

Consumer retargets for the parent (proof supplied here, statement kept there): ML.3/eigenvariety-propagation (package §4.5) ← SP.2/eigencurve-propagation; ML.3/buzzard-kilford-eigencurve (§4.6) ← SP.3/buzzard-kilford-boundary; ML.3/level-one-ping-pong (§4.7) ← SP.3/level-one-propagation; ML.3/steinberg-level-raising (§4.8, with §4.4's odd-rank statement) ← SP.7/residually-cm-steinberg, SP.5/nt-level-raising-to-types, SP.6/nt-steinberg-level-raising; ML.3/one-level-one-symmetric-power (§4.9) ← SP.7/theorem-e; ML.3/n-regular-congruences (§4.10) ← SP.8/n-regular-congruence; ML.3/symmetric-power-automorphy-lifting (§4.11) ← SP.9/symmetric-power-automorphy-lifting; §4.20 proof route ← SP.8/n-regular-ramified-automorphy; ML.3/non-cm-symmetric-powers (§4.29) proof ← SP.10/theorem-a-assembly; §4.23 ← SP.12/tensor-functoriality-lifting and SP.13/residual-twisted-tensor-local; ML.3/all-regular-symmetric-powers (§4.30) proof ← SP.13/sp-induction; ML.3/sym6-sym8 (§4.31) ← SP.7/ct-symmetric-power-l-plus-one. The parent's atlas stage ML.3 does not acquire an edge from this roadmap; the retargets are recorded for the package's next revision.
### R3: rescope

Gap G1: Deligne–Lusztig induction and the modular representation theory of finite unitary groups are needed here and have no owner.

A Part II of RepresentationTheory/CharacterTheory (Deligne–Lusztig induction for finite reductive groups, Lusztig's cuspidal unipotent characters, Brauer characters in non-defining characteristic) should own them; SP.4/depth-zero-cuspidals, SP.4/level-raising-types and SP.4/type-transfer then import it and keep only the U\_3 and GL\_3 special cases with their p-adic consequences.
### R4: rescope

G3 concerns the Hecke-localized derived tensor of Drinfeld cohomology with the automorphic module under residual genericity, together with Steinberg detection and the even-multiplicity weight theorem. Bare Drinfeld compact cohomology is not claimed to have one-degree concentration.

Route Thorne 2024 §§3–5 to a Part II of CompletedCohomologyAndLocalGlobalCompatibility, with the derived Drinfeld input from ProetaleCohomologyOfPAdicCurvesAndTowers. Supply Theorems 3.4,4.5,5.2 and the exact Hecke-localized comparison used by Theorem 6.11; retain its residual genericity and derived tensor. The special-case level-raising target remains SP.6.

## Notes for the maintainer on the parent roadmap

- The parent PR #1180 §4.9/§4.12 uses the NTI §7 seed method. Its odd-rank GL₂ block fails conjugate self-duality in the arXiv v3 proof (PAPER-NEWTON-THORNE-21/E21). Even n=3 is not repaired by extending the GL₁ range: only the powers-of-two seed construction avoids that failure. Low-rank endpoint functoriality is separately known for n≤5 but does not produce all Theorem 7.1 seed data. The parent can identify §4.30/§4.35 (the NT26 method) as a separate route to the endpoint over ℚ, while keeping the seed-method boundary explicit.
- TauCetiRoadmap PR #1180 §4.23 states Newton–Thorne 2026 Theorem 4.1 as printed. Its printed proof takes S = S\_p ∪ Σ with Σ the ramification of π only, which does not cover the application in Lemma 5.8, where σ = Sym^{r−1}σ′ is ramified where π is not (PAPER-NEWTON-THORNE-26/E24). The repair (add σ's ramified places to S with unramified local conditions) is planned in ModularityAndLanglandsExtensionsPartII SP.12/tensor-lifting-setup; the package statement is unaffected.

## Corrections to the sources

These findings are paraphrases checked against the exact versions in the packet. Earlier atlas extraction identifiers are given for provenance; none is represented as a newly discovered journal erratum.

### E1: nt21 — error

**Locator:** arXiv v3 §2.11.1, proof of Lemma 2.12, p.30.

**Source assertion:** The proof identifies two polarized extensions as equal after finding a scalar discrepancy at complex conjugation.

**Correction:** They are strictly conjugate: take a square root of the inverse scalar in 1+𝔪\_A.

**Reason:** The scalar need not be one. Hensel applies because 2 is a unit in the complete local E-algebra.

**Provenance:** PAPER-NEWTON-THORNE-21/E10–E11. Independent review: confirmed.
### E2: nt21 — misprint

**Locator:** arXiv v3 §2.31, twin-map construction, p.49.

**Source assertion:** The displayed local character uses a global Hecke character without its local restriction.

**Correction:** Restrict ψ to ℚ\_p^× in both local tensor factors.

**Reason:** A global idele-class character is not a character of the indicated local group until restricted.

**Provenance:** PAPER-NEWTON-THORNE-21/E9. Independent review: confirmed.
### E3: nt21 — gap

**Locator:** arXiv v3 proof of Theorem 2.27, pp.44–45.

**Source assertion:** The chosen neighborhood is used as if the required regularity and irreducibility conditions already held throughout it.

**Correction:** Shrink to the open regular, Hodge–Tate regular, absolutely irreducible locus containing the given point, and use the closed trianguline locus.

**Reason:** Pointwise hypotheses do not by themselves give an arbitrary-neighborhood containment; openness permits the specified shrinking.

**Provenance:** PAPER-NEWTON-THORNE-21/E12. Independent review: confirmed.
### E4: nt21 — misprint

**Locator:** arXiv v3 Lemma 3.3, p.54.

**Source assertion:** The component label attached to the twin point uses the original index.

**Correction:** The twin lies on X\_{i′}, with i+i′=(k−1)/v₂(w).

**Reason:** The slope sum and the boundary equation give the other index.

**Provenance:** PAPER-NEWTON-THORNE-21/E1. Independent review: confirmed.
### E5: ct17 — error

**Locator:** accepted manuscript §2.1, pp.6–7.

**Source assertion:** The integral Hecke algebra is presented using invertible braid-group generators, and one quadratic relation has its signs reversed.

**Correction:** Over ℤ use positive braid generators and (T\_s−q)(T\_s+1)=0; the braid-group form requires q invertible.

**Reason:** The double-coset multiplication gives T\_s²=(q−1)T\_s+q. For nonunit q this does not make T\_s a unit.

**Provenance:** PAPER-CLOZEL-THORNE-17/E6,E24. Independent review: confirmed.
### E6: ct17 — error

**Locator:** accepted manuscript Proposition 2.6(2), pp.14–16.

**Source assertion:** The rank-nine T\_{s₂} matrix has the wrong diagonal coefficient in its final nontrivial 2×2 block.

**Correction:** Use −1/(1+q) at entry (10,10), with the matching sign in the e₁₁ relation.

**Reason:** The corrected block has trace q−1 and determinant −q and satisfies the Hecke quadratic relation; the printed block fails this test. Full presentation relations remain the matrix-construction target.

**Provenance:** PAPER-CLOZEL-THORNE-17/E7. Independent review: confirmed.
### E7: ct17 — misprint

**Locator:** accepted manuscript Theorem 3.3(i),(iii), p.21; §3.5, pp.26–27.

**Source assertion:** The rank-three X exponent and an exponent in the recursive Z row are inconsistent with the module computation; a component-character subscript is also interchanged.

**Correction:** Use [1,0,−1] for rank-three X, the Theorem 2.3 recursive exponents for Z, and ε₁ in the indicated sign comparison.

**Reason:** The rank-three module and the recursive normalized Jacquet formula determine these labels.

**Provenance:** PAPER-CLOZEL-THORNE-17/E3,E11–E12,E15. Independent review: confirmed.
### E8: ct17 — error

**Locator:** accepted manuscript §3.5 after (3.9), p.26.

**Source assertion:** The induction used to identify Z is said to have a unique irreducible submodule.

**Correction:** Account for the known submodule Y and prove the multiplicity/count identifying the other constituent. The missing socle calculation is G4.

**Reason:** Y has the same indicated exponent and embeds too, so uniqueness cannot be used as written.

**Provenance:** PAPER-CLOZEL-THORNE-17/E10. Independent review: confirmed.
### E9: ct17 — gap

**Locator:** accepted manuscript Proposition 4.3(3), Lemma 4.4 and Theorem 4.2, pp.36–37.

**Source assertion:** The module N appearing in the perfect pairing is used before its coefficient types are specified.

**Correction:** Define N using the contragredient R\_i^∨ types in the localization at 𝔪^∨.

**Reason:** The standard double-coset pairing pairs dual coefficient types, not two unspecified copies of M.

**Provenance:** PAPER-CLOZEL-THORNE-17/E14. Independent review: confirmed.
### E10: ct17 — gap

**Locator:** accepted manuscript Lemma 5.3, pp.40–41.

**Source assertion:** The monodromy-locus argument is used for arbitrary displayed local characters.

**Correction:** Restrict the assertion at R₀ to unipotent local quotients, or first twist to that situation.

**Reason:** The determinant-Frobenius relations in the argument use unipotent inertia; an arbitrary character quotient is not automatically that ring.

**Provenance:** PAPER-CLOZEL-THORNE-17/E21. Independent review: confirmed.
### E11: ct17 — gap

**Locator:** accepted manuscript end of Theorem 5.1 proof, p.43.

**Source assertion:** Generic-lift primitivity is used without being established from residual primitivity.

**Correction:** Use Clifford theory over a good Galois extension: reducibility would force the two surviving residual blocks to have equal dimension.

**Reason:** The dimensions n₁≠n₂ exclude equal-dimensional conjugate constituents, without an unsupported primitivity claim.

**Provenance:** PAPER-CLOZEL-THORNE-17/E20. Independent review: confirmed.
### E12: ct17 — misprint

**Locator:** accepted manuscript proof of Theorem 6.2, pp.45–46.

**Source assertion:** The named compositum for E₂ is totally real, while E₂ is used as a CM field; later local-place and cyclotomic symbols are inconsistent.

**Correction:** Take E₂=F₂E₁=F₂E, refer to places above u₀, and use the residual cyclotomic character in the residual comparison.

**Reason:** F₁⊂F₂ makes the printed F₂F₁ equal F₂. Adjoining E supplies the required CM quadratic extension.

**Provenance:** PAPER-CLOZEL-THORNE-17/E4,E19. Independent review: confirmed.
### E13: nt21 — gap

**Locator:** arXiv v3 Proposition 1.22(3), pp.21–22.

**Source assertion:** The Frobenius scalar independence is used without spelling out its coefficient reduction.

**Correction:** Check the characteristic polynomial identity at characteristic-zero points and reduce modulo ϖ. Independence modulo ϖ holds also for n₁=1; do not assert its integral version there.

**Reason:** For n₁=1 the determinant can have the ramified order-p character Θ; its reduction on inertia is nevertheless trivial.

**Provenance:** PAPER-NEWTON-THORNE-21/E7,E19. Independent review: confirmed.
### E14: nt21 — misprint

**Locator:** arXiv v3 Theorem 4.1(4), p.60.

**Source assertion:** The two auxiliary sets are matched with the wrong local block sizes.

**Correction:** Use n₁=2 on T₂ and n₁=n−2 on T₃.

**Reason:** The local data in the proof and the residual inertia characters distinguish the rank-two and rank-(n−2) blocks.

**Provenance:** PAPER-NEWTON-THORNE-21/E14. Independent review: confirmed.
### E15: nt21 — gap

**Locator:** arXiv v3 proof of Lemma 6.7, p.81.

**Source assertion:** A multiplicity-one argument is applied to the whole multi-place set R\_i.

**Correction:** Apply it to a single place of R\_i and bound d\_{R\_i} by the resulting antiunit rank.

**Reason:** A union of places can repeat characters; a single place gives the required multiplicity-one estimate. The Maire source-check remains an inherited supplier boundary.

**Provenance:** PAPER-NEWTON-THORNE-21/E22. Independent review: confirmed.
### E16: nt21 — error

**Locator:** arXiv v3 proof of Proposition 7.4, pp.85–88, especially p.87.

**Source assertion:** The proposed GL₂ block is treated as conjugate self-dual in the application of Theorem 4.1.

**Correction:** Construct a block with the correct polarization and residual/local data, or replace this seed route; no such repair is claimed here.

**Reason:** The block differs from its required polarized dual by δ\_{K/ℚ}|\_{G\_{F₀}}. This obstruction remains even in rank three.

**Provenance:** PAPER-NEWTON-THORNE-21/E21. Independent review: confirmed.
### E17: nt21 — gap

**Locator:** arXiv v3 Proposition 7.4 and use of Theorem 4.1, pp.85–88.

**Source assertion:** The weight needed by the odd-rank construction is not explicitly transported through the level-raising invocation.

**Correction:** Choose the input weight to be that of π₁ and retain that weight in the level-raising output.

**Reason:** The ordinary coefficient module fixes the weight; existence without that weight does not supply the induction datum.

**Provenance:** PAPER-NEWTON-THORNE-21/E23. Independent review: confirmed.
### E18: nt21 — gap

**Locator:** arXiv v3 Proposition 8.2 proof, pp.91–92; Proposition 8.3 proof, pp.95–97.

**Source assertion:** Local nonsupercuspidality and removal of ramification at the auxiliary smooth place are left implicit.

**Correction:** Use local constancy of inertial type on the chosen component. Treat q\_a separately using smoothness and the excluded Frobenius ratios; take the discriminant product over S−{p,q\_a}.

**Reason:** The discriminant argument at the other ramified places does not cover q\_a. Smoothness excludes its obstructed ratio, and the residual inertia argument at the remaining places rules out supercuspidal lifts.

**Provenance:** PAPER-NEWTON-THORNE-21/E24–E25. Independent review: confirmed.
### E19: nt21b — misprint

**Locator:** arXiv v2 proof of Theorem 3.1, p.26.

**Source assertion:** The large-image step names the original form instead of the newly constructed good-dihedral form.

**Correction:** Use the residual projective representation of π′.

**Reason:** It is π′ that has the auxiliary local type supplying the image bound.

**Provenance:** PAPER-NEWTON-THORNE-21-B/E1. Independent review: confirmed.
### E20: nt21b — gap

**Locator:** arXiv v2 proof of Theorem 3.1, p.27.

**Source assertion:** The case removing supercuspidality at 2 concludes directly from Proposition 3.11.

**Correction:** Conclude from the preceding weight-two case with 2∉sc, then use the lifting equivalences.

**Reason:** The new form can still be supercuspidal at 3, so Proposition 3.11 need not apply.

**Provenance:** PAPER-NEWTON-THORNE-21-B/E3. Independent review: confirmed.
### E21: nt26 — gap

**Locator:** arXiv v2 Lemma 3.1 proof, p.13.

**Source assertion:** The old local representation is used as a point in a ring with the new prescribed determinant.

**Correction:** At v∤pv₀ twist by an unramified χ\_v≡1 with χ\_v²=ε^{−1}ω\_p before choosing the component.

**Reason:** The determinants ε^{−1} and ε^{−2}ω\_p differ. The correcting square root exists since p is odd and the ratio is residually trivial and unramified here.

**Provenance:** PAPER-NEWTON-THORNE-26/E17. Independent review: confirmed.
### E22: nt26 — gap

**Locator:** arXiv v2 Lemma 3.4(5), p.16; Lemma 3.7 proof, p.19.

**Source assertion:** The character field is undefined in one clause, and an image-equality assertion is applied beyond the group on which s̄ is defined.

**Correction:** Use K₁ and F′⊇F₁. X₀ controls the image of r̄\_π; use that equality, not an unjustified equality including the twist ȳ.

**Reason:** The twist y is defined over K₁, and X₀ was chosen only from the field of r̄\_π.

**Provenance:** PAPER-NEWTON-THORNE-26/E18–E19. Independent review: confirmed.
### E23: nt26 — gap

**Locator:** arXiv v2 final proof step of Theorem 3.2, p.25.

**Source assertion:** Unramifiedness of the tensor outside S is used after arranging it explicitly only for π.

**Correction:** Use the local connection of σ to π away from pv₀, which preserves inertia and monodromy, or arrange the base change for both forms.

**Reason:** The definition of the global tensor deformation problem needs both factors unramified outside S.

**Provenance:** PAPER-NEWTON-THORNE-26/E22. Independent review: confirmed.
### E24: nt26 — gap

**Locator:** arXiv v2 proof of Theorem 4.1, pp.26–35.

**Source assertion:** S and the automorphic levels omit places ramified only in σ.

**Correction:** Add σ-only places to S and the unitary Iwahori level, retaining the unramified rank-two local quotient and split quaternion algebra there.

**Reason:** Lemma 5.8 uses exactly such a σ-only place. Adding it to quaternionic ramification instead would change the rank-two automorphic input incorrectly.

**Provenance:** PAPER-NEWTON-THORNE-26/E24. Independent review: confirmed.
### E25: nt26 — misprint

**Locator:** arXiv v2 generators of 𝔪\_{G,Q}, p.32.

**Source assertion:** For i>r the cumulative eigenvalue product omits the product of the first r γ factors.

**Correction:** Use α^rβ^{i−r}(∏\_{j=1}^rγ\_j)(∏\_{j=1}^{i−r}γ\_j), multiplied by the stated q normalization.

**Reason:** These are the first i eigenvalues in the ordered list αγ₁,…,αγ\_r,βγ₁,…,βγ\_r.

**Provenance:** PAPER-NEWTON-THORNE-26/E26. Independent review: confirmed.
### E26: nt26 — gap

**Locator:** arXiv v2 Proposition 5.4 proof, pp.39–40; Lemma 5.7 proof, p.42.

**Source assertion:** A single order-t projective element is used to infer the strict field-size bound q>t−1.

**Correction:** For odd coefficient characteristic use parity. In Proposition 5.4 at characteristic two use both distinct t₁,t₂; if q≤M they would both equal q+1. Lemma 5.7 needs only q≥t−1>4r.

**Reason:** The one-prime implication alone has the borderline q=t−1, but the second available local prime removes it in Proposition 5.4. Its stated >M conclusion is retained.

**Provenance:** PAPER-NEWTON-THORNE-26/E1 (with the two-prime repair given in this review). Independent review: confirmed.
### E27: nt26 — gap

**Locator:** arXiv v2 Lemma 5.7 proof, pp.41–42.

**Source assertion:** The automorphy-lifting step verifies tensor irreducibility over F but omits the required cyclotomic restriction.

**Correction:** The independent projective fields give a perfect SL₂×SL₂ subgroup of the joint linear image. Its commutators lie in the image of G\_{F(ζ\_t)}, where the tensor is absolutely irreducible.

**Reason:** The cyclotomic quotient is abelian, and the product representation Std⊗Sym^{r−1} is irreducible for r<t. This supplies the omitted restriction step.

**Provenance:** PAPER-NEWTON-THORNE-26/E25. Independent review: confirmed.
### E28: nt26 — gap

**Locator:** arXiv v2 Lemma 5.7 proof, p.42.

**Source assertion:** The auxiliary place v₁ is later used as an unramified place of π without explicitly excluding v₁|p.

**Correction:** Choose v₁ away from p,t and the finite ramification set in the Chebotarev selection.

**Reason:** π is Steinberg at the p-adic places; those are not unramified candidates. Excluding finitely many places preserves the Chebotarev choice.

**Provenance:** PAPER-NEWTON-THORNE-26/E28. Independent review: confirmed.
### E29: nt26 — misprint

**Locator:** arXiv v2 Lemma 5.8 proof, pp.43–44.

**Source assertion:** Several checks use the original embedding instead of the comparison embedding at l.

**Correction:** Use ι\_l in the residual-image and tensor checks.

**Reason:** The congruence from coefficient inertia is at the place above l, so it must feed Theorem 4.1 there.

**Provenance:** PAPER-NEWTON-THORNE-26/E2. Independent review: confirmed.
### E30: nt26 — gap

**Locator:** arXiv v2 proof of Proposition 6.1, p.47; Corollary 6.2, p.49.

**Source assertion:** The auxiliary-prime exclusion references the earlier conductor, and the final p-adic places are labelled as places of F rather than E.

**Correction:** Avoid the conductor of π\_a when choosing t, and label the final places as places of E.

**Reason:** The congruence construction is applied to π\_a over E and needs an unramified new prime there.

**Provenance:** PAPER-NEWTON-THORNE-26/E5,E8. Independent review: confirmed.
### E31: nt26 — gap

**Locator:** arXiv v2 Corollary 6.2 and Theorem 6.4 proof, pp.49–50.

**Source assertion:** The list of induction hypotheses includes undefined SP₀ when r=1, and ordinarity of the smaller symmetric-power witness is implicit.

**Correction:** For r=1 use the direct coefficient-conjugate tensor branch. For the smaller block use Steinberg at p and Lemma 2.6 to obtain ordinarity. Choose n/2<p<n in the Bertrand step.

**Reason:** The positive indices are all smaller than n, but zero is not an SP statement; the smaller-block ordinary condition is needed by Proposition 6.3.

**Provenance:** PAPER-NEWTON-THORNE-26/E11–E12; the corrected Bertrand inequality is already in the packet. Independent review: confirmed.

## Independent review

Independent Codex review of all 105 target nodes: 19 verified, 86 corrected, 0 added and 0 unverifiable. All three pinned baseline declarations confirmed. All definition/construction APIs and tests checked, source statements and direct supplier contracts read, source findings independently recorded, and Lean elaborated with four admitted-theorem warnings only. Acceptance is of a complete target-level planning pass with explicit gaps G1–G5 and G7, not of a closed or formalised development. G2 remains the intermediate CM seed obstruction. Former G6 is resolved. The reader and roadmap definition are synchronized.

Full per-node verdicts and the handoff decisions are in [the independent review](../reviews/REV-DESIGN-ModularityAndLanglandsExtensionsPartII.md).
