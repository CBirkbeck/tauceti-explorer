# Klevdal–Patrikis: compatible adjoint local systems

Worker: Codex, session codex-a71f92. Issue #1207. Status: **partial checkpoint**, 22 September 2026.

## What has actually been read

The complete published article by Christian Klevdal and Stefan Patrikis, *Compatibility of canonical ℓ-adic local systems on adjoint Shimura varieties*, Inventiones mathematicae 242 (2025), 305–335, [DOI 10.1007/s00222-025-01357-6](https://doi.org/10.1007/s00222-025-01357-6), including all footnotes and references, was read. The primary PDF has SHA-256 `0691a57a2aae841419ee97b8fac68aa8f3d499ed884933422a388106febab576`. Images of pp327,329,331 were checked where text extraction obscured characters and valuations. This is not merely an abstract or preprint extraction.

The journal is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). The authors are the source of the mathematics; the decomposition, planning APIs and proposed corrections here are this worker's adaptations, not an author-approved revision.

The JSON records exact URLs, hashes and read ranges for three supplementary sources: selected v2 passages, all of v1 §2 pp7–11, and Getz–Hahn's 22 April 2022 author draft Appendix A.5 pp482–483. The first version matters because journal p314 footnote3 explicitly points to its deleted specialization section. Neither the whole v1/v2 nor the whole Getz–Hahn book was read. The author's three-page July2026 errata was checked; the corresponding published book appendix still needs collation.

## The theorem, with its boundaries

Let (G,X) be a Shimura datum with G connected reductive over Q, Z_G(Q) discrete in Z_G(A_f), and neat level K₀. Every Q-simple factor of G^ad must have total real rank at least two; restrictions of scalars can still have compact real factors. Theorem3.10 produces a soft smooth integral model after excluding one integer Ntilde such that, for every good closed point and all ℓ,ℓ' different from its residue characteristic, the adjoint canonical local systems have a common semisimple Frobenius class in Conj_G^ad(Q).

This is a rational point of a conjugation quotient. It is not a rational group representative, rational conjugacy, compatibility in full G, a crystalline companion, or a motivicity theorem. Corollary3.12 restricts to number-field points; its integer N(y) may depend on the point. The common Ntilde of Theorem3.10 is uniform across components, closed points and coefficient primes.

The abstract superrigidity theorem has an additional common-field hypothesis F(λ)=F. Remark2.4 expects more but does not prove that hypothesis automatically. Canonical Shimura models supply the common field in the application.

## Inventory and proof architecture

The companion JSON contains 137 items: 21 definitions, 24 constructions and 92 theorem items. Status counts are 10 library, 17 planned and 110 missing. All 45 definitions/constructions have three proposed API entries, three mathematical planning tests and their recorded consumers. There are 26 explicit proof outlines in addition to source-bound statements and dependency edges. API names are proposed names, never assertions that declarations exist.

The principal chain is:

1. Lemma2.1 gives a unique extension from a normal dense subgroup in an adjoint group and descends its conjugators to the coefficient field. Continuity is a separate Simpson input.
2. Integrality, coefficient completions and the finite outer-automorphism torsor give place-dependent arithmetic descents. Assuming a common descent field, Petrov supplies individual exceptional sets N_λ.
3. Their gcd gives a uniform candidate. At a good auxiliary coefficient prime, a tame G-companion pulls back through tame specialization. Superrigidity kills the geometric specialization kernel.
4. This does **not** yet give arithmetic extension. Integral-section inertia centralizes dense geometric monodromy and is therefore trivial. Drinfeld's tangent-direction ramification test and arithmetic-section construction then rule out remaining arithmetic ramification.
5. Proposition2.3 gives companions up to an algebraic automorphism. Proposition2.8 removes its outer class if an integral section has a common torus Frobenius class with trivial outer stabilizer.
6. Proposition3.3 obtains G^ad-superrigidity from Margulis, factorwise dense arithmetic lattices, normal-subgroup comparison and coefficient descent. The extension Ω'/Ω in the intermediate theorem is not presumed finite.
7. Proposition3.7 supplies a special torus with real, p-adic, irreducibility, separation and dominant-cocharacter conditions. Its five conclusions are separate items. The separation contract is strengthened to nonisogeny at E2.
8. Lemma3.9 uses reciprocity to produce q, Eq.(7) to control its p-adic valuations, and irreducible separated tori to prove cyclic density. Fixing q then forces an automorphism to fix a maximal torus pointwise and hence be inner.
9. The uniform special section removes the outer ambiguity; Chebotarev makes the common quotient point Q-rational. This yields Theorem3.10 and then Corollary3.12.

The canonical tower retains its right action and the opposite deck group exactly once. Under the source convention γ acts by y↦γ⁻¹y, while the canonical monodromy sends γ to a⁻¹γa. Geometric Artin reciprocity is used throughout. Component fields, basepoints and local extension norms remain explicit.

The Serre-group realization of Remark3.11, fixed-ℓ open-image statement of Remark3.13, density-one follow-up, and full-G obstruction of Remark3.14 are recorded separately. They do not feed backward into the main theorem. BST Theorem9.7 and the full-G/p-adic follow-ups use this paper and are not imported as its prerequisites.

## Baseline and ownership evidence

Pinned libraries: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every library reference in the JSON was opened at its pinned source statement. The exact carriers used are abstract Galois fibre functors, their opposite deck limit and finite continuous action equivalence, torus character/cocharacter infrastructure, reductive and adjoint carriers, and triviality of universally central adjoint points.

The pinned central-point lemma is **not** already the geometric dense-centralizer argument. Abstract Galois categories are **not** scheme-level π₁. A torus lattice is **not** the arithmetic construction of a generic irreducible torus.

The reviewed coverage entries read were AUDIT01 (SF.2), AUDIT09 (IG.0–2), AUDIT10 (ShimuraData D0–5), AUDIT11 (ShimuraVarieties V0–8), AUDIT13 (ALS0–6), AUDIT20 (GS0–7), and AUDIT31 (R01.1/.2/.5). The applicable full stage descriptions were read. No merged ReductiveGroupsPartII audit entry was found; this is a missing audit, not evidence of implementation. Both pinned source trees were searched beyond filenames.

The atlas and existing paper proposals were searched for these suppliers. Existing integral-Hodge and arithmetic-reductive candidates are reused. Canonical models, datum/reflex definitions, étale π₁, characteristic-zero SNC compactification, Brauer–Nesbitt, class field theory and Chebotarev remain imported planned targets, not new implementations. Upstream ReductiveGroups and HodgeStructures were read as complete granularity/API models.

## Why each route has this owner

### 1. ReductiveGroupsArithmeticPartII (part-ii; 33 items)

Reuse the candidate already proposed by PAPER-KISIN-MADAPUSIPERA-SHIN-22 and PAPER-KISIN-ZHOU-25. It owns global tori, H¹ transfer and Conj; this paper adds irreducible, isogeny-separated torus approximation and outer-stabilizer interfaces, not a second torus roadmap.

Extend the existing candidate ReductiveGroupsArithmeticPartII from Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups). Import the pinned torus/character/cocharacter and adjoint carriers, the upstream maximal-torus/root-data/isomorphism theory, local models from ReductiveGroupsPartII, and Chebotarev and class field theory from their upstream owners. Retain the KMPS22/Kisin–Zhou25 ownership of H¹ transfer and Conj_G. Supply generic maximal-torus rationality, full W⋊A₀ specialization, local orbit openness and the exact Lemma3.6 approximation theorem, correcting the product-open-subgroup step. Strengthen the local separation choices to pairwise nonisogeny before using rational character modules. Build the real normalizer cocycle, one-exceptional-prime H¹ lift, local simply-connected vanishing, Hasse principle, rational torus twist and rational Brauer–Nesbitt comparison needed for Proposition3.7. Export generic subdirect-product and cyclic-closure lemmas, scalar-extension compatibility of rational cyclic closure, the dominant-orbit norm valuation with a general uniformizer, finite outer-automorphism/root-datum descent, and Chebotarev descent of conjugation-quotient points. Include Serre groups with modulus and the locally algebraic torus realization of Remark3.11, without using the later Shimura theorem as an input. The final generic interfaces imply a dense cyclic torus element has no outer stabilizer; the Shimura application belongs to ShimuraVarietiesCompatibleSystemsPartII. Correct E2–E4 and resolve original group-theory sources before marking this closed. Suggested file TauCeti/AlgebraicGeometry/Reductive/ArithmeticTori.lean.

### 2. InverseGaloisPartIITameSpecialization (part-ii; 13 items)

IG.0–IG.1 provide the finite-étale group and proper-family specialization. The open SNC-complement and non-complete strict-henselian G-trait comparison, plus tangent-curve ramification tests, require a genuine extension rather than an unrestricted reuse of proper specialization.

Build on Inverse Galois theory and arithmetic fundamental groups (InverseGaloisAndArithmeticFundamentalGroups:IG.0–IG.2), importing abstract Galois categories and opposite deck limits from Mathlib, boundary compactifications from AlgebraicModuliForArithmeticGeometry:R09.7d, and arithmetic spreading from SchemeAndStackFoundations. Define good smooth proper/SNC pairs with the corrected union-of-coordinate-hyperplanes charts, boundary-tame covers and the tame quotient. Extract Kerz–Schmidt compactification independence and curvewise tameness only in the original hypotheses. For a strictly henselian DVR that is a G-ring, prove the complete-trait cover equivalence, Néron–Popescu smooth-subalgebra approximation, descent retaining tame valuation data, and Artin approximation. Export separately v1 Corollary2.6(1) special-fibre equivalence, (2) generic-fibre full faithfulness and (3) surjective tame specialization, with paths and inertia equivariance along integral sections. This v1 section is deliberately cited by the journal, despite having been removed from v2. Then extract Drinfeld Corollary5.2's tangent-direction ramification detection and Lemma5.3/Theorem2.15's arithmetic section construction. The final interface is the arithmetic unramifiedness test used on journal p315; do not infer arithmetic extension from geometric factorization alone. Resolve the localization-versus-completion and valuation-descent gates. Suggested file TauCeti/AlgebraicGeometry/FundamentalGroup/TameSpecialization.lean.

### 3. ArithmeticLocallySymmetricSpacesSuperrigidity (part-ii; 7 items)

ALS.0–ALS.1 already own arithmetic quotients and local systems, but neither Margulis's higher-rank extension theorem nor this all-coefficient-field comparison is a listed milestone. The extension imports the existing quotients rather than rebuilding them.

Extend Arithmetic locally symmetric spaces and their cohomology (ArithmeticLocallySymmetricSpaces) beyond ALS.0–ALS.1. Import adelic arithmeticity and component finiteness from AdelicAlgebraicGroups and ShimuraVarieties:V0, and the generic adjoint centralizer/descent interfaces from ReductiveGroupsArithmeticPartII. State real rank at the Q-simple factor level, permitting compact real factors in restrictions of scalars and forbidding rank-one Q-simple factors. Decompose the effective arithmetic lattice into a finite-index normal product, prove the commuting-normal-Zariski-closure argument, and extract Margulis VIII.3.4(a) with its extension Ω'/Ω and all lattice assumptions. Assemble the algebraic surjections, identify a surjective adjoint endomorphism with an automorphism, extend agreement from the normal product to the whole lattice, and descend the comparison to algebraically closed Ω. The final theorem is Klevdal–Patrikis Proposition3.3: every connected neat-level component group is G^ad-superrigid over every algebraically closed characteristic-zero coefficient field. Borel density and the exact H¹-vanishing/finite-abelianization/quasi-unipotence inputs are separate source-gated theorems, not consequences inserted into the definition. This owner supplies rigidity to the compatibility argument; it must not depend on compatibility. Suggested file TauCeti/Geometry/ArithmeticQuotients/Superrigidity.lean.

### 4. ArithmeticGaloisRepresentationsSuperrigidSystems (part-ii; 18 items)

R01.1/R01.5 cover continuous linear systems and recognition, not the family of group-valued superrigid descents and the arithmetic unramifiedness argument. The CHT17 geometric-monodromy candidate concerns smooth proper cohomological families and uniform integral invariants, not this abstract rigidity method.

Extend Arithmetic Galois representations and conductors (ArithmeticGaloisRepresentations), importing its continuous coefficient operations, the existing HodgeStructuresPartII integral-local-system interface, generic adjoint centralizers and Conj from ReductiveGroupsArithmeticPartII, tame specialization from InverseGaloisPartIITameSpecialization, and finite-field G-companions from GlobalShtukasPartIICompanions. Define G-superrigidity exactly as Definition2.2 with algebraic automorphisms, not inner conjugacy. Prove Lemma2.1's unique group extension and rationality separately from Simpson's continuity theorem. Build coefficient-place completions, the finite Out(G)-torsor, stabilizer descent fields and the explicit common-field hypothesis. Extract the EG18/KP22 integrality variant rather than replacing superrigidity by H¹=0. Starting from Petrov's individual N_λ, use the gcd exceptional set, tame companions, geometric density, and superrigidity to kill the specialization kernel; then separately kill integral-section inertia and apply the tangent-curve ramification test. Final results are Proposition2.3(1) uniform extension over one O_F[1/N'] and (2) fibrewise companionship up to τ(λ,λ',v), followed by Proposition2.8's symmetry-breaking criterion for τ to be inner. Record central twists as counterexamples to the non-adjoint uniqueness shortcut. No common F(λ), motivicity or untwisted companionship is built into the abstract assumptions. Suggested file TauCeti/NumberTheory/Galois/SuperrigidSystems.lean.

### 5. GlobalShtukasPartIICompanions (part-ii; 4 items)

GS.6 owns the GL_n global correspondence, which is an input. Higher-dimensional Drinfeld companions, preservation of G-structure, and connected-monodromy recognition are not supplied by merely applying the GL_n theorem. This owner is distinct from the existing rigid p-to-ℓ/isocrystal companion extension.

Build on Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands), importing the actual GL_n global correspondence GS.6 and its finite-determinant/purity restrictions, not the one-way general-group parameterization GS.5. Coordinate the previously routed Chin inputs in PAPER-KISIN-ZHOU-25 and CHT17; do not duplicate their basic GL_n existence. Extend to Drinfeld's smooth finite-field-variety companions and the connected-monodromy reconstruction needed to retain a prescribed connected adjoint G-valued representation. Either fully extract Drinfeld2018's pro-semisimple comparison or justify the paper's permitted Drinfeld2012-plus-Chin route, including all determinant, normalization, embedding and dense-image hypotheses. Define companions by common semisimple Frobenius quotient classes. Prove the curvewise tameness/Swan comparison using Kerz–Schmidt and Deligne, and the density-one recognition of Remark2.5 by extending BHKT Proposition6.4 from curves with Chebotarev. Keep connected versus disconnected monodromy explicit. The final export gives the tame G-companion used in Proposition2.3 without the later Shimura compatibility theorem; no crystalline p-companion or motive is produced. The original-proof and hypothesis gates listed in this extraction must be discharged. Suggested file TauCeti/NumberTheory/FunctionField/GroupCompanions.lean.

### 6. HodgeStructuresPartII (part-ii; 1 items)

Reuse the HodgeStructuresPartII candidate of Landesman–Litt, EG20 and Liu–Zhu, which already names integral versus strongly integral local systems. Its integral-structure carrier is shared, not newly owned by the superrigid endpoint.

Reuse the existing HodgeStructuresPartII design, extending Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures), and preserve its established ownership of variations, representation/Betti moduli and integral versus strongly integral local systems. The input needed here is an integral group-valued representation with the number field, integral group model and conjugator recorded, compatible with all coefficient-place completions. Import affine reductive carriers and representations from the pinned libraries and upstream ReductiveGroups rather than rebuilding Hodge fibres or algebraic groups. Coordinate EG18/KP22 and the source-gated integrality variant on journal p313 with ArithmeticGaloisRepresentationsSuperrigidSystems: this route does not claim superrigidity is identical to cohomological rigidity, or prove Simpson motivicity. Test a trivial integral object, dependence on the chosen integral model and the distinction between one local lattice and one global integral realization. No additional duplicate integral-local-system roadmap is proposed. Suggested interface file TauCeti/Geometry/Hodge/IntegralLocalSystems.lean.

### 7. ShimuraVarietiesCompatibleSystemsPartII (part-ii; 25 items)

The generic canonical tower stays in V4/V8 and is shared with T6:comparison. The new layers are the soft integral model, symmetry-breaking sections and uniform adjoint ℓ-independence. The Honda–Tate sibling owns reduction/isogeny theory, not this higher-rank non-abelian-type proof.

Extend Complex Shimura varieties and canonical models (ShimuraVarieties), importing V4/V7/V8.general's canonical tower, reciprocity and Betti–étale local system with its right-action convention. Share this carrier with HodgeTateAndCanonicalSubgroups:T6:comparison without requiring the logarithmic comparison theorem here. Import higher-rank lattice rigidity from ArithmeticLocallySymmetricSpacesSuperrigidity, the abstract uniform ramification and symmetry-breaking criterion from ArithmeticGaloisRepresentationsSuperrigidSystems, and irreducible/isogeny-separated tori and norm valuations from ReductiveGroupsArithmeticPartII. Construct the soft SNC-complement integral model with uniform special-point integrality using PSTEG Theorem4.1. Prove the five parts of Proposition3.7 separately, including the strengthened pairwise nonisogeny needed by E2. Compute special Frobenius via q and Eq.(6)–(7), resolving the fixed-hyperspecial-position gap E4 with a proved general-uniformizer or stronger integral-position argument. Establish cyclic density and trivial outer stabilizer, then uniform fibrewise compatibility and Q-rationality of the quotient point. Final Theorem3.10 assumes neat K₀, discrete rational centre and real rank at least two for every Q-simple adjoint factor; it yields one Ntilde for every good fibre and all ℓ,ℓ'. Corollary3.12 gives pointwise systems with N(y). Separate Serre-group realization and the fixed-ℓ open-image remark from all-prime density claims. Do not import BST Theorem9.7, Patrikis's full-G follow-up or crystalline companions back into their own prerequisite. Suggested file TauCeti/Geometry/Shimura/AdjointCompatibility.lean.

### 8. ShimuraVarieties (source; 6 items)

The existing canonical-model and tower stages own reflex norms, component fields, finite étale level covers and their monodromy. Add the precise opposite-deck-group construction, Eq.(3), Lemma3.2 and the Betti comparison here; share the carrier with T6:comparison rather than creating a second local system.

Existing stages: ShimuraVarieties:V4, ShimuraVarieties:V8.general. The item statements provide the exact additions; no replacement roadmap is proposed.

### 9. SchemeAndStackFoundations (source; 2 items)

Finite-presentation spreading and separated integral-point descent belong to the general scheme/morphism foundations. The special theorem that all special points are uniformly integral remains a new Shimura input.

Existing stages: SchemeAndStackFoundations:SF.0. The item statements provide the exact additions; no replacement roadmap is proposed.

### 10. ReductiveGroupsPartII (source; 1 items)

The hyperspecial/parahoric owner supplies the integral-model maximal-torus bounded-subgroup theorem, with the integral-position hypothesis from Getz–Hahn. Generic unramified tori must not silently satisfy it.

Existing stages: ReductiveGroupsPartII:RG2.3. The item statements provide the exact additions; no replacement roadmap is proposed.

These are dependency roles, not a request to merge several independent research subjects into the final Shimura roadmap. In particular:

- Arithmetic tori, H¹ transfer, Conj and outer-stabilizer lemmas belong to the reused reductive-group extension.
- Normal-crossings compactifications stay in R09.7d; tame specialization imports them. This avoids a compactification/specialization ownership loop.
- The canonical tower and Betti comparison stay in V4/V8.general and are shared with T6:comparison. The logarithmic Riemann–Hilbert endpoint is not an input here.
- GS.6 supplies GL_n Langlands. It does not by itself retain prescribed G-structure in companions, and the existing rigid p-to-ℓ/isocrystal companion candidate is a different direction.
- The Honda–Tate sibling owns reduction/isogeny theory. This extension owns higher-rank compatibility, not another Honda–Tate programme.

## Source findings awaiting independent verification

None has a self-assigned review verdict. “New” in the JSON means that no correction was located in the documented publisher/arXiv/author-page searches, not a claim of discovery priority. The main theorem has not been disproved.

### E1: gap, Journal §2 p312, after Lemma2.1; v2 §2 p8

Add quasi-projectivity of X_F, or make the existence of the stated smooth projective SNC compactification an explicit hypothesis as v1 did.

The preceding hypothesis is only smooth geometrically connected finite type. An open subscheme of a projective scheme is quasi-projective, whereas smooth proper nonprojective varieties exist (for example the split smooth complete toric threefolds of Fujino–Payne, https://arxiv.org/abs/math/0510679). A proper open immersion into a projective compactification would make such a variety projective. Shimura varieties here are quasi-projective, so this does not change that application.

### E2: gap, Journal Lemma3.9 p327 first proof paragraph; Theorem3.10 p331; Proposition3.7(3) pp324–326; same step in v2

Retain pairwise nonisogeny, or inequivalence of rational character representations, as the separation property. At the auxiliary split primes in Proposition3.7 choose a split torus in one factor and an anisotropic torus in the other; prove this stronger property survives the twist.

The printed hypotheses only assert nonisomorphism of Q-tori, i.e. of integral Galois lattices. Nonisomorphic lattices can become isomorphic over Q. For example A₂ root and weight lattices under S₃ have index3 and the same irreducible rational representation; their integral intertwiner determinants are 3m², so none is unimodular. Pairwise integral nonisomorphism alone does not justify injectivity of the direct sum. This identifies a gap in the stated inference, not a counterexample to Theorem3.10; the stronger allowed local separation repairs the needed inference.

### E3: error, Journal Lemma3.6 p323 first sentence of proof; v2 §3.3

Replace each arbitrary open subgroup K_v by a product of sufficiently small open subgroups contained in it, then apply the factorwise argument. The tori do decompose.

An open subgroup of a finite product need not be a product: the inverse image of the diagonal under two copies of a nontrivial finite quotient is open and proper while projecting onto both factors. Every identity neighbourhood contains a product neighbourhood, and one may choose open subgroups there. This supplies the needed repair without strengthening the lemma.

### E4: gap, Journal Lemma3.9 p328 paragraph after Eq.(7); same in v2 p22

The cited Getz–Hahn statement requires T_model⊂B_model⊂G_model over O_F. Prove that integral-position condition for the torus used here, or avoid claiming E(s_K₀)_w/Q_p unramified and evaluate Eq.(7) with a general uniformizer, giving v_p(χ(N μ(π_w)))=e⁻¹∑_σ〈χ,σμ〉.

The source has only an unramified generic torus in a Q_p-rational Borel and hyperspecial containment for the fixed model. In GL₂/Q₃ let u=[[1,1/3],[0,1]], T=uDu⁻¹ and t=u diag(2,1)u⁻¹=[[2,-1/3],[0,1]]. T is split and t belongs to its maximal compact subgroup, but t∉GL₂(Z₃). Getz–Hahn 22Apr2022 AppendixA.5, LemmasA.5.1–2 pp482–483 explicitly starts with an integral torus and Borel. The paper has not established that hypothesis for its chosen T_x. This invalidates the quoted equality's justification; it does not disprove the infinite-order conclusion. The proposed general-uniformizer repair requires a separate full proof audit.

### E5: misprint, Journal Remark3.8 p327; v2 Remark3.8 p20

The intended comparison is with the special-point construction in Proposition3.7.

There is no Proposition3.2; Lemma3.2 computes special-point monodromy, whereas Proposition3.7 is the five-condition construction whose parts(1),(4),(5) are cited in the same sentence.

### E6: misprint, Journal Lemma3.9 p328 after Eq.(7); v2 p21

Read characters, not cocharacters.

χ is applied to a torus element and has codomain G_m. A cocharacter instead has domain G_m, so the displayed evaluation would be ill typed.

### E7: misprint, Journal Lemma3.9 p329 first paragraph after the norm computation; v2 p22

Read nonzero dominant in each Q-simple factor, sufficient to find some positive-root pairing; do not require membership in the strict interior of the dominant chamber.

Nontriviality of a dominant cocharacter does not force all simple-root pairings to be positive. In type A₂ the cocharacter (2,-1,-1) has pairings3,0. The next sentence uses only some root with positive pairing, so the intended proof needs this weaker precise formulation. This is a convention clarification, not a failure of the positivity argument.

### E8: error, arXiv v1 §2 p7, first bullet defining relative normal crossings; section deleted in v2, journal p314 footnote3 still points to v1

Use an étale-local union of coordinate hyperplanes, with equation t₁⋯t_r=0, rather than a single coordinate linear subspace.

For d≤n−2 a coordinate A^d⊂A^n is not a Cartier divisor, and a single hyperplane cannot model an intersection of two boundary branches such as xy=0. The section was removed, not replaced by a corrected definition; the journal refers to it for the specialization proof.

### E9: misprint, Journal abstract p305; arXiv abstract and v2 p1

Specify compatibility of their adjoint projections, or say G^ad(Q_ℓ)-valued systems.

Theorem3.10 proves compatibility only after adjoint projection; Remark3.14 explains why the full G-valued conclusion does not follow here. Patrikis's author page likewise describes the adjoint projection. The separate follow-up2504.00305 addresses full G. The abstract's wording should not be used as a stronger target.

### E10: misprint, Journal Lemma3.9(2) p327

Use a∈G(A_f), as fixed in the lemma's opening sentence.

The datum is over Q and a is the fixed finite-adelic representative. No field F or adelic ring A_F is introduced at this point; the rest of the calculation uses the finite p-component.

Two checks particularly constrain the proposed proof repair. Integral nonisomorphism of A₂ root and weight lattices does not imply inequivalence over Q: their intertwiner has determinant3, and every integral intertwiner has determinant3m². For the fixed hyperspecial model over Q₃, conjugating the diagonal torus by [[1,1/3],[0,1]] gives a split torus whose maximal compact subgroup is not contained in GL₂(Z₃). Neither check is a counterexample to compatibility itself.

For E4 a plausible replacement evaluates the norm with the actual ramification index:
v_p(χ(N_{L/Q_p} μ(π_L))) = e(L/Q_p)⁻¹ Σ_σ〈χ,σμ〉.
One must still prove chamber preservation and nonvanishing in each Q-simple factor. The report does not turn this proposed repair into a proved lemma. E7 requires only a nonzero dominant sum, not strictly positive pairing with every simple root.

## Open source and proof gates

- **G1 — Original integrality and continuity input.** Extract the exact EG18/KP22 variant, Margulis admissible H¹ modules, boundary conditions, and Simpson continuity. Do not identify superrigidity with cohomological rigidity or assert every dense representation integral without these gates.
- **G2 — Non-complete-trait tame specialization.** Finish original Lieblich–Olsson A.7/A.12, Grothendieck–Murre, Néron–Popescu and Artin inputs. Verify Ahat as a union rather than merely a colimit, descent of valuations, and the inertia-equivariant paths used on journal p315. Correct v1 chart E8.
- **G3 — Companions and arithmetic ramification.** Read Petrov6.1; one full G-companion route (Drinfeld2018 or Drinfeld2012+Chin); Kerz–Schmidt/Deligne and BHKT6.4; then Drinfeld's arithmetic tangent results. Check all determinant/purity/connectedness and coefficient assumptions. The journal proof identifies their uses, not their recursive closure.
- **G4 — Higher-rank lattice and group-theoretic sources.** Extract the original Margulis, Platonov–Rapinchuk, Prasad–Rapinchuk and Voskresenskiĭ statements. Generic algebraic-group auxiliary arguments are itemized but still need a baseline-to-target expansion; coordinate existing H¹/Conj candidate instead of duplicating it.
- **G5 — Rational versus integral torus separation.** E2: write and independently verify the strengthened split-versus-anisotropic local choice, survival under the twist, and rational-character direct-sum argument. Do not use mere nonisomorphism of integral tori as nonisogeny.
- **G6 — Fixed hyperspecial position and general-uniformizer repair.** E4: either prove the chosen torus has the integral-position hypothesis or supply the full ramified-uniformizer norm valuation argument. The rational-matrix counterexample is checked; it does not itself prove the proposed repair. Collate the corresponding published Getz–Hahn appendix against the read author draft.
- **G7 — Soft integral model and canonical-tower leaves.** Read PSTEG Theorem4.1 and Ullmo–Yafaev2.1–2.2; finish exact canonical-model, right-tower and centre/neatness proof leaves in V4/V7/V8. Coordinate the identical canonical local system consumed by T6:comparison, without importing all logarithmic RH.
- **G8 — Supplementary Serre-group and open-image remarks.** Extract Serre's locally algebraic realization and the fixed-ℓ specialization/open-image input, then Huryn–Zhang only for the follow-up density-one assertion. The full-G follow-up, p-adic compatibility follow-up and BST Theorem9.7 remain downstream, not main theorem inputs.
- **G9 — Baseline-to-stage closure and finer supplier IDs.** Reviewed audits and actual layer descriptions are recorded, but these coarse planned stage references do not close proofs. Resolve exact accepted packet/reserved supplier nodes and request statements in future design jobs. Complete per-leaf pinned searches during blueprint expansion; no claim that all 137 targets elaborate.
- **G10 — Independent verification of source findings.** All ten E-records await independent review; no reviewer verdict is self-assigned. Verify intended positivity conventions in E7 and adjoint abstract wording in E9 before treating these as confirmed errata. E1/E3 require the explicit corrected assumptions/step recorded in items.

The prerequisite list contains 16 bibliographic groups with exact consuming item IDs. Where a URL is the journal bibliography, that is explicitly a locator for an unread original source, not evidence that the original was read. Existing stage or paper coverage is not equated with recursive source closure.

Resume with G5/G6 and the exact original statements for Proposition2.3; these can change the proof contracts and route boundaries. Preserve the full journal read and the established library evidence. Do not replace this checkpoint with an abstract-only inventory, mark it complete on checker success, or silently delete the source findings.

## Validation

The paper checker passed. Its regression suite passed 9 tests, and the source-issue suite passed 7. The separate structural/rational-arithmetic audit passed; the exact three-file intake check is recorded in the handoff and PR. The structural audit checks unique IDs, complete exact-once missing ownership, dependency endpoints and cycles, API/test coverage and candidate-owner cycles. Rational-arithmetic tests check the A₂ lattice distinction, the fixed-hyperspecial counterexample, the product-open-subgroup counterexample and the nonregular dominant-cocharacter example.

No Lean file is in this issue's allowed deliverables. None was created or compiled, and nothing here is claimed formalized. Successful JSON checks do not close the ten gaps or confirm the ten findings.
